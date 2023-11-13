Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC867EA0B9
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 16:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631750.985415 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZJY-00021a-EZ; Mon, 13 Nov 2023 15:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631750.985415; Mon, 13 Nov 2023 15:57:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2ZJY-0001zn-Bd; Mon, 13 Nov 2023 15:57:28 +0000
Received: by outflank-mailman (input) for mailman id 631750;
 Mon, 13 Nov 2023 15:57:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1x5=G2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r2ZJW-0001vs-Kn
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 15:57:26 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 569a0b7e-823d-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 16:57:25 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4083f613275so38087365e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 13 Nov 2023 07:57:25 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 k23-20020a05600c1c9700b0040531f5c51asm8582386wms.5.2023.11.13.07.57.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 07:57:23 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 569a0b7e-823d-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1699891044; x=1700495844; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nbcFVNx/+MBqIDasdKfMxNiPK3f0tpqXaYKaJpDUyIE=;
        b=QfWi2rwK5yW46bFh8SE00VsnV0nSBB/3dXTfyAkqZxkBZlJM1StxCFmGrIe2x1201W
         qm0io50R1l1n4bBLiukFwlV8rCuROYXHIMHXkeCT1S36v3nKq9mJIZlZQEhmwCiKiplU
         5rl11gykdjx1tFOUgT+EYWoE4WC3BjOH1pP30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891044; x=1700495844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbcFVNx/+MBqIDasdKfMxNiPK3f0tpqXaYKaJpDUyIE=;
        b=SFt4Lf4jvh2iN3kdW6WmYdjC/2KZG36cHa/Ni+3C/flPhpnOrgHt+AR4ogIhT/z6gC
         8J18fwdjEilUJ2D0i2evhFAaK9P+5bmTWugLB5jmnjkW0iyU07wa2gTmdevU+SBLnuEa
         dMtH5qJwWcgm9Qol2R+SUTznOCRGNXODgoI9piJK6HsxBWo/CZ7rdbUVHtdaBUWDyWKI
         5nz/jo1vY2ZFh1/5U7Bw+vD7EpsSeQAASWYaBX/Ph8Lb+hJjUm5h8Bav4t8HHff78DQP
         ApEnD0pGJHp1TJjBq6LfeqKqxC3rtlRQOadrsVz9/L6At9RgRSHyIVBsfR/R/rwAEGl/
         WmSQ==
X-Gm-Message-State: AOJu0YwKvssCFweMG6AQh4E17erCRY+G+6sFmwq/FcvYDQRHEZwGbf7z
	1fXTKc5U6BQ0QqZGc9Fj7QeNAeWrPg7NcUuLRDw=
X-Google-Smtp-Source: AGHT+IGB6tYCHKYjN+3JJw8WEojKyrIngSy6IQ31P48tKvta4fEr+7r16z5ofRTVYU6ojjwBmezPEw==
X-Received: by 2002:a1c:790b:0:b0:409:7aa9:a903 with SMTP id l11-20020a1c790b000000b004097aa9a903mr5807341wme.19.1699891044006;
        Mon, 13 Nov 2023 07:57:24 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation: set architecture in docker files
Date: Mon, 13 Nov 2023 16:57:01 +0100
Message-ID: <20231113155701.52052-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Pass the desired architecture of the image in the FROM instruction if the
image is possibly multi-platform.

This allows using the x86 Dockerfiles on OS X on arm64 hardware.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
I haven't touched the Yocto dockerfile because I'm not sure how it's used.
---
 automation/build/alpine/3.18.dockerfile               | 2 +-
 automation/build/archlinux/current-riscv64.dockerfile | 2 +-
 automation/build/archlinux/current.dockerfile         | 2 +-
 automation/build/centos/7.dockerfile                  | 2 +-
 automation/build/debian/bookworm.dockerfile           | 2 +-
 automation/build/debian/bullseye-ppc64le.dockerfile   | 2 +-
 automation/build/debian/buster-gcc-ibt.dockerfile     | 2 +-
 automation/build/debian/jessie.dockerfile             | 2 +-
 automation/build/debian/stretch.dockerfile            | 2 +-
 automation/build/fedora/29.dockerfile                 | 2 +-
 automation/build/suse/opensuse-leap.dockerfile        | 2 +-
 automation/build/suse/opensuse-tumbleweed.dockerfile  | 2 +-
 automation/build/ubuntu/bionic.dockerfile             | 2 +-
 automation/build/ubuntu/focal.dockerfile              | 2 +-
 automation/build/ubuntu/trusty.dockerfile             | 2 +-
 automation/build/ubuntu/xenial-xilinx.dockerfile      | 2 +-
 automation/build/ubuntu/xenial.dockerfile             | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/automation/build/alpine/3.18.dockerfile b/automation/build/alpine/3.18.dockerfile
index 5d2a69a06010..4ae9cb5e9e30 100644
--- a/automation/build/alpine/3.18.dockerfile
+++ b/automation/build/alpine/3.18.dockerfile
@@ -1,4 +1,4 @@
-FROM alpine:3.18
+FROM --platform=linux/amd64 alpine:3.18
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/archlinux/current-riscv64.dockerfile b/automation/build/archlinux/current-riscv64.dockerfile
index abf8e7bf0b88..af75b5c720ce 100644
--- a/automation/build/archlinux/current-riscv64.dockerfile
+++ b/automation/build/archlinux/current-riscv64.dockerfile
@@ -1,4 +1,4 @@
-FROM archlinux
+FROM --platform=linux/amd64 archlinux
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index 47e79637a4a6..d974a1434fd5 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -1,4 +1,4 @@
-FROM archlinux:base-devel
+FROM --platform=linux/amd64 archlinux:base-devel
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index 69dcefb2f011..ab450f0b3a0e 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -1,4 +1,4 @@
-FROM centos:7
+FROM --platform=linux/amd64 centos:7
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index ae008c8d46e5..ac87778b3972 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:bookworm
+FROM --platform=linux/amd64 debian:bookworm
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
index 4de8458445ae..6fdfb6bc2b40 100644
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:bullseye-slim
+FROM --platform=linux/amd64 debian:bullseye-slim
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/buster-gcc-ibt.dockerfile b/automation/build/debian/buster-gcc-ibt.dockerfile
index 96ab4fe8a2f1..4328c109b72b 100644
--- a/automation/build/debian/buster-gcc-ibt.dockerfile
+++ b/automation/build/debian/buster-gcc-ibt.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:buster-slim AS builder
+FROM --platform=linux/amd64 debian:buster-slim AS builder
 
 ENV DEBIAN_FRONTEND=noninteractive
 ENV USER root
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 63b2c1e5b771..db0962953c9a 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -1,4 +1,4 @@
-FROM debian/eol:jessie
+FROM --platform=linux/amd64 debian/eol:jessie
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index 1af6c691f8f4..9f6c146f032c 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -1,4 +1,4 @@
-FROM debian:stretch
+FROM --platform=linux/amd64 debian:stretch
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index e55b06a4517e..42a87ce6c84b 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -1,4 +1,4 @@
-FROM fedora:29
+FROM --platform=linux/amd64 fedora:29
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index 7010b71acaa0..e1ec38a41445 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -1,4 +1,4 @@
-FROM opensuse/leap
+FROM --platform=linux/amd64 opensuse/leap
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index 959e1f6939f0..38f6fda2ff1b 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -1,4 +1,4 @@
-FROM opensuse/tumbleweed
+FROM --platform=linux/amd64 opensuse/tumbleweed
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index e15f54431efb..77d7f933860c 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:18.04
+FROM --platform=linux/amd64 ubuntu:18.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index e3d11194ee2f..30a9b8e84ffe 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:20.04
+FROM --platform=linux/amd64 ubuntu:20.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index 22e294c20cac..0d33578c4e1d 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:14.04
+FROM --platform=linux/amd64 ubuntu:14.04
 LABEL maintainer.name="The Xen Project" \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/xenial-xilinx.dockerfile b/automation/build/ubuntu/xenial-xilinx.dockerfile
index 5f7087135213..49f27b322995 100644
--- a/automation/build/ubuntu/xenial-xilinx.dockerfile
+++ b/automation/build/ubuntu/xenial-xilinx.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:16.04
+FROM --platform=linux/amd64 ubuntu:16.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
 
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index 2d2ba3e31f63..e8035434f804 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -1,4 +1,4 @@
-FROM ubuntu:16.04
+FROM --platform=linux/amd64 ubuntu:16.04
 LABEL maintainer.name="The Xen Project " \
       maintainer.email="xen-devel@lists.xenproject.org"
 
-- 
2.42.0


