resource "aws_s3_bucket" "e2e_reports" {
  bucket = "shiftleft-v3-e2e-reports"
}

resource "aws_s3_bucket_public_access_block" "e2e_reports" {
  bucket                  = aws_s3_bucket.e2e_reports.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_security_group" "e2e_ssh" {
  name = "shiftleft-v3-e2e-ssh"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
