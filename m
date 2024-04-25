Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EFDF8B27BA
	for <lists+xen-devel@lfdr.de>; Thu, 25 Apr 2024 19:48:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712207.1112698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s03CC-0000dw-0h; Thu, 25 Apr 2024 17:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712207.1112698; Thu, 25 Apr 2024 17:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s03CB-0000bh-TY; Thu, 25 Apr 2024 17:47:43 +0000
Received: by outflank-mailman (input) for mailman id 712207;
 Thu, 25 Apr 2024 17:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BIz1=L6=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1s03CA-0000bb-BG
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 17:47:42 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e91b509f-032b-11ef-b4bb-af5377834399;
 Thu, 25 Apr 2024 19:47:40 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a524ecaf215so165333766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 25 Apr 2024 10:47:40 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 r18-20020a17090638d200b00a589ce6803asm1875982ejd.110.2024.04.25.10.47.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 10:47:39 -0700 (PDT)
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
X-Inumbo-ID: e91b509f-032b-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1714067259; x=1714672059; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/JNEBbF9lnfi5qaMtkfp90g2IT0sweAM5cETmm+Qe6A=;
        b=Obt1/xoXehRLzZPLbnD1AFWVNg+pzOufP5Q+6dletpaRerm9qzoCSvZOcG9OKBNNdQ
         lplECFBxVhspvyfE+bYike8mRpGFVQJe7s7tRcRG8EKqqhAMhsxIS85UMy3WWDIwho1y
         QGMQyPeH8jXwTxGz19x28qyTKJJkOG9MJ47WU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714067259; x=1714672059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/JNEBbF9lnfi5qaMtkfp90g2IT0sweAM5cETmm+Qe6A=;
        b=HFK2zgujcmpKHs8R1YXGnWrhAK5tE7EP7E9yPH3lkBjfOKdJStXRA0W6Sm9r4H+B9o
         2cdEgieetRbXGivL+l+JCJVVO4Ly1CLq1GKZkBzkbA07i03lcZt2jJcDNOcZ76BaiBm2
         IasSvyZFC0Vg/wzXbNUvskLefPsH4WpfGH8WVdOG2HvN39eePxk4Dhf0SVBJsDY9khhD
         Y8aX2ApoVdJK1KRVMDUfVdgEj0zklGwydCsnICTUBZnJjsQoMQ8H8V0+gqKd72nR3QRD
         SEdMPiH5AcrXE5+lUFUgh5YXJbyXKC2SsPzBzyTFMY3H0BpF1jX4trW+mKznbNkL421/
         P1PQ==
X-Gm-Message-State: AOJu0Yzxs6qtOCGS2SMtOPqefUk4+a5hAsz7kT5IERq/2IlzyokBEYCu
	DRKXhe6eI91FQxPNJdAsJaXNUPkCb40g4fxy2MggqQx8P4vo1OVgHH6IiJLCd9CnHyivYGXXYpU
	5
X-Google-Smtp-Source: AGHT+IFuR5uEVIXha4taznTw+AuINi3XXUWIPKrjNQ9eV2blD6aOENQQuJ3FrguG4I1J5l0Z3bvKYg==
X-Received: by 2002:a17:906:5851:b0:a52:54d8:6d21 with SMTP id h17-20020a170906585100b00a5254d86d21mr320675ejs.7.1714067259433;
        Thu, 25 Apr 2024 10:47:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] CI: Drop glibc-i386 from the build containers
Date: Thu, 25 Apr 2024 18:47:37 +0100
Message-Id: <20240425174737.414327-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Xen 4.14 no longer runs in Gitlab CI.  Drop the dependency to shrink the build
containers a little.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Doug Goldstein <cardoe@cardoe.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 automation/build/archlinux/current.dockerfile        | 2 --
 automation/build/centos/7.dockerfile                 | 2 --
 automation/build/debian/bookworm.dockerfile          | 2 --
 automation/build/debian/jessie.dockerfile            | 2 --
 automation/build/debian/stretch.dockerfile           | 2 --
 automation/build/fedora/29.dockerfile                | 2 --
 automation/build/suse/opensuse-leap.dockerfile       | 2 --
 automation/build/suse/opensuse-tumbleweed.dockerfile | 2 --
 automation/build/ubuntu/bionic.dockerfile            | 2 --
 automation/build/ubuntu/focal.dockerfile             | 2 --
 automation/build/ubuntu/trusty.dockerfile            | 2 --
 automation/build/ubuntu/xenial.dockerfile            | 2 --
 12 files changed, 24 deletions(-)

diff --git a/automation/build/archlinux/current.dockerfile b/automation/build/archlinux/current.dockerfile
index d974a1434fd5..3e37ab5c40c1 100644
--- a/automation/build/archlinux/current.dockerfile
+++ b/automation/build/archlinux/current.dockerfile
@@ -19,8 +19,6 @@ RUN pacman -S --refresh --sysupgrade --noconfirm --noprogressbar --needed \
         iasl \
         inetutils \
         iproute \
-        # lib32-glibc for Xen < 4.15
-        lib32-glibc \
         libaio \
         libcacard \
         libgl \
diff --git a/automation/build/centos/7.dockerfile b/automation/build/centos/7.dockerfile
index ab450f0b3a0e..1cdc16fc05f9 100644
--- a/automation/build/centos/7.dockerfile
+++ b/automation/build/centos/7.dockerfile
@@ -32,8 +32,6 @@ RUN yum -y update \
         yajl-devel \
         pixman-devel \
         glibc-devel \
-        # glibc-devel.i686 for Xen < 4.15
-        glibc-devel.i686 \
         make \
         binutils \
         git \
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
index 459f8e30bdc6..d893218fc4bd 100644
--- a/automation/build/debian/bookworm.dockerfile
+++ b/automation/build/debian/bookworm.dockerfile
@@ -31,8 +31,6 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
-        # libc6-dev-i386 for Xen < 4.15
-        libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \
diff --git a/automation/build/debian/jessie.dockerfile b/automation/build/debian/jessie.dockerfile
index 32fc952fbc2d..308675cac150 100644
--- a/automation/build/debian/jessie.dockerfile
+++ b/automation/build/debian/jessie.dockerfile
@@ -37,8 +37,6 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
-        # libc6-dev-i386 for Xen < 4.15
-        libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \
diff --git a/automation/build/debian/stretch.dockerfile b/automation/build/debian/stretch.dockerfile
index e2706a8f3589..59794ed4677b 100644
--- a/automation/build/debian/stretch.dockerfile
+++ b/automation/build/debian/stretch.dockerfile
@@ -38,8 +38,6 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
-        # libc6-dev-i386 for Xen < 4.15
-        libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \
diff --git a/automation/build/fedora/29.dockerfile b/automation/build/fedora/29.dockerfile
index 42a87ce6c84b..f473ae13e7c1 100644
--- a/automation/build/fedora/29.dockerfile
+++ b/automation/build/fedora/29.dockerfile
@@ -21,8 +21,6 @@ RUN dnf -y install \
         yajl-devel \
         pixman-devel \
         glibc-devel \
-        # glibc-devel.i686 for Xen < 4.15
-        glibc-devel.i686 \
         make \
         binutils \
         git \
diff --git a/automation/build/suse/opensuse-leap.dockerfile b/automation/build/suse/opensuse-leap.dockerfile
index e1ec38a41445..48d0d50d005d 100644
--- a/automation/build/suse/opensuse-leap.dockerfile
+++ b/automation/build/suse/opensuse-leap.dockerfile
@@ -28,8 +28,6 @@ RUN zypper install -y --no-recommends \
         ghostscript \
         glib2-devel \
         glibc-devel \
-        # glibc-devel-32bit for Xen < 4.15
-        glibc-devel-32bit \
         gzip \
         hostname \
         libaio-devel \
diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
index f00e03eda7b1..53542ba1f4d9 100644
--- a/automation/build/suse/opensuse-tumbleweed.dockerfile
+++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
@@ -26,8 +26,6 @@ RUN zypper install -y --no-recommends \
         ghostscript \
         glib2-devel \
         glibc-devel \
-        # glibc-devel-32bit for Xen < 4.15
-        glibc-devel-32bit \
         gzip \
         hostname \
         libaio-devel \
diff --git a/automation/build/ubuntu/bionic.dockerfile b/automation/build/ubuntu/bionic.dockerfile
index 77d7f933860c..910d3c4b5315 100644
--- a/automation/build/ubuntu/bionic.dockerfile
+++ b/automation/build/ubuntu/bionic.dockerfile
@@ -31,8 +31,6 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
-        # libc6-dev-i386 for Xen < 4.15
-        libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \
diff --git a/automation/build/ubuntu/focal.dockerfile b/automation/build/ubuntu/focal.dockerfile
index 30a9b8e84ffe..7c6a4d07566b 100644
--- a/automation/build/ubuntu/focal.dockerfile
+++ b/automation/build/ubuntu/focal.dockerfile
@@ -31,8 +31,6 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
-        # libc6-dev-i386 for Xen < 4.15
-        libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \
diff --git a/automation/build/ubuntu/trusty.dockerfile b/automation/build/ubuntu/trusty.dockerfile
index 0d33578c4e1d..8bd8c085a781 100644
--- a/automation/build/ubuntu/trusty.dockerfile
+++ b/automation/build/ubuntu/trusty.dockerfile
@@ -31,8 +31,6 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
-        # libc6-dev-i386 for Xen < 4.15
-        libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \
diff --git a/automation/build/ubuntu/xenial.dockerfile b/automation/build/ubuntu/xenial.dockerfile
index e8035434f804..f6296d32925c 100644
--- a/automation/build/ubuntu/xenial.dockerfile
+++ b/automation/build/ubuntu/xenial.dockerfile
@@ -31,8 +31,6 @@ RUN apt-get update && \
         bin86 \
         bcc \
         liblzma-dev \
-        # libc6-dev-i386 for Xen < 4.15
-        libc6-dev-i386 \
         libnl-3-dev \
         ocaml-nox \
         libfindlib-ocaml-dev \

base-commit: 23cd1207e7f6ee3e51fb42e11dba8d7cdb28e1e5
-- 
2.30.2


