Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A46A9BEF02
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830968.1246118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8g56-0005DP-K0; Wed, 06 Nov 2024 13:28:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830968.1246118; Wed, 06 Nov 2024 13:28:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8g56-00059E-FH; Wed, 06 Nov 2024 13:28:20 +0000
Received: by outflank-mailman (input) for mailman id 830968;
 Wed, 06 Nov 2024 13:28:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSNS=SB=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t8g55-0004n0-8I
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:28:19 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2411518e-9c42-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:28:05 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso9394617e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:27:25 -0800 (PST)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a3e3sm2708939a12.12.2024.11.06.05.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:05:23 -0800 (PST)
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
X-Inumbo-ID: 2411518e-9c42-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzQiLCJoZWxvIjoibWFpbC1sZjEteDEzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjI0MTE1MThlLTljNDItMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwODk5Njg2LjA2Mywic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730899335; x=1731504135; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xApgKSTK5wMGuq0ugpp4Wf2jL7mq6KYsKPKyawXSsjg=;
        b=W2DonOCCjVI2fXhSAk98znyTWVQHWnuj+d7IKo8DoDIlP85QHa9fqOYVowKp8Leoft
         fqxOVp9mq/+44By+/NyfOslvKE1/4pa6aIU3LhuuyzLSM8SrkQgGZr19hHWWS4aKjAtw
         L8K1Ms4faEkstuqGGmYH7VS/KMAPxnk2pwPnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730899335; x=1731504135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xApgKSTK5wMGuq0ugpp4Wf2jL7mq6KYsKPKyawXSsjg=;
        b=R5GtYSBcIXRkO9ljx7HZEQwhnFP9N70ajiM0+NRRl9O/Mm1IZvwvkQhN4K2JVopMtR
         o21CSUKVJzEdfpiX7dKqr6GMu3etpCszHGtvozSy+FGAKun5aopuv7wPlT10Au1xAoJz
         GVO5/z3ilL6JAa46zKydNO/at3hJTBvIC9jXrkA9Rt5Xg7DahIOZaEOzYOquxJ1QPo3j
         9xNHJDAgN4tK193DUZ575u41ZXO2YvEAykF/5G/LiDPgNIVyYfgZYQPK68uFoiAWzE1Z
         W2/5LxYFYAGrswGj56o4/au34uenotyTgUlDHDWEMI0hSlSqnN7Nm0qEbT8aLcJVNvLh
         F6ow==
X-Gm-Message-State: AOJu0YypalNiirDkAGb2beygMBf2EV9L4/CUZ70OCiPqkOt14qOUc6o0
	EmU+n2sKQRMPoB9w/XHQSAQUr9o3GlnB3FSu0av6BKHCl2G/9Xai4vs0Bj4ApLhgIan1DiA4Om0
	M2Is=
X-Google-Smtp-Source: AGHT+IGwqfbuEDxDxzQYcIO3SNDIjB5+YEi1B2xdbeRSCXdCh7ZM/aARZRROlbUc9hICKNlDxIN88A==
X-Received: by 2002:a05:6402:2547:b0:5c8:8290:47bf with SMTP id 4fb4d7f45d1cf-5ceb92aad89mr20048288a12.21.1730898323761;
        Wed, 06 Nov 2024 05:05:23 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v2 2/6] CI: Refresh the Debian 12 x86_32 container
Date: Wed,  6 Nov 2024 13:05:03 +0000
Message-ID: <6ca245790b8bd2469e82dd54ff3cedd12096369c.1730743077.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730743077.git.javi.merino@cloud.com>
References: <cover.1730743077.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to be non-root, use heredocs for readability, and
use apt-get --no-install-recommends to keep the size down.  Rename the
job to x86_32, to be consistent with XEN_TARGET_ARCH and the
naming scheme of all the other CI jobs:
${VERSION}-${ARCH}-${BUILD_NAME}

Remove build dependencies for building QEMU, as we don't do it since
e305256e69b1 ("CI: Stop building QEMU in general").

Remove build dependencies for the documentation as we don't have to
build it for every single arch.

This reduces the size of the container from 2.22GB to 1.32Gb.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/debian/12-x86_32.dockerfile  | 50 +++++++++++++++++++
 .../build/debian/bookworm-i386.dockerfile     | 50 -------------------
 automation/gitlab-ci/build.yaml               |  8 +--
 automation/scripts/containerize               |  2 +-
 4 files changed, 55 insertions(+), 55 deletions(-)
 create mode 100644 automation/build/debian/12-x86_32.dockerfile
 delete mode 100644 automation/build/debian/bookworm-i386.dockerfile

diff --git a/automation/build/debian/12-x86_32.dockerfile b/automation/build/debian/12-x86_32.dockerfile
new file mode 100644
index 000000000000..b1cabf8d2f6d
--- /dev/null
+++ b/automation/build/debian/12-x86_32.dockerfile
@@ -0,0 +1,50 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/i386 debian:bookworm
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+
+# build depends
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+    DEPS=(
+        # Xen
+        bison
+        build-essential
+        checkpolicy
+        clang
+        flex
+
+        # Tools (general)
+        ca-certificates
+        git-core
+        pkg-config
+        wget
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libyajl-dev
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+    )
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
+ENTRYPOINT ["linux32"]
diff --git a/automation/build/debian/bookworm-i386.dockerfile b/automation/build/debian/bookworm-i386.dockerfile
deleted file mode 100644
index 66fa3121c54e..000000000000
--- a/automation/build/debian/bookworm-i386.dockerfile
+++ /dev/null
@@ -1,50 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/i386 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-ENTRYPOINT ["linux32"]
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        zlib1g-dev \
-        libncurses5-dev \
-        python3-dev \
-        python3-setuptools \
-        uuid-dev \
-        libyajl-dev \
-        libaio-dev \
-        libglib2.0-dev \
-        clang \
-        libpixman-1-dev \
-        pkg-config \
-        flex \
-        bison \
-        acpica-tools \
-        bin86 \
-        bcc \
-        liblzma-dev \
-        libc6-dev \
-        libnl-3-dev \
-        ocaml-nox \
-        libfindlib-ocaml-dev \
-        markdown \
-        transfig \
-        pandoc \
-        checkpolicy \
-        wget \
-        git \
-        nasm \
-        apt-transport-https \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index d64a7e40f3f1..871beb70e157 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -573,15 +573,15 @@ debian-12-x86_64-gcc-randconfig:
     CONTAINER: debian:12-x86_64
     RANDCONFIG: y
 
-debian-bookworm-32-clang-debug:
+debian-12-x86_32-clang-debug:
   extends: .clang-x86-32-build-debug
   variables:
-    CONTAINER: debian:bookworm-i386
+    CONTAINER: debian:12-x86_32
 
-debian-bookworm-32-gcc-debug:
+debian-12-x86_32-gcc-debug:
   extends: .gcc-x86-32-build-debug
   variables:
-    CONTAINER: debian:bookworm-i386
+    CONTAINER: debian:12-x86_32
 
 fedora-40-x86_64-gcc:
   extends: .gcc-x86-64-build
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index ea6e1a9b18f4..d72c22c103ff 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -35,7 +35,7 @@ case "_${CONTAINER}" in
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
     _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
-    _bookworm-i386) CONTAINER="${BASE}/debian:bookworm-i386" ;;
+    _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
-- 
2.45.2


