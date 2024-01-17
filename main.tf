
resource "aws_instance" "web" {
  ami                         = "ami-02453f5468b897e31"
  instance_type               = "t2.micro"
  key_name                    = "mingzi-linux-key.pem"
  subnet_id                   = "subnet-0a88fa20994f4867d"
  associate_public_ip_address = true
  security_groups             = [aws_security_group.allow_ssh.id]
  tags = {
    Name = "mingzi-linux"
  }
}


resource "aws_security_group" "allow_ssh" {
  name        = "MingziSSHSecurityGroup"
  description = "Allow SSH from my ip"
  vpc_id      = "vpc-031c584a3aeaf8c5f" // vpc id - c4_sandbox

  ingress {
    description      = "SSH from my OP"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [""] // my ip address
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "MingziSSHSecurityGroup"
  }
}