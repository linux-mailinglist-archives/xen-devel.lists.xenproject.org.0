Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C19BEF5F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:45:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831083.1246242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gL7-0007CP-Pk; Wed, 06 Nov 2024 13:44:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831083.1246242; Wed, 06 Nov 2024 13:44:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gL7-0007Au-N0; Wed, 06 Nov 2024 13:44:53 +0000
Received: by outflank-mailman (input) for mailman id 831083;
 Wed, 06 Nov 2024 13:44:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSNS=SB=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t8gL6-0007Ai-3o
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:44:52 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 49a1ccad-9c45-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:44:47 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-539f72c8fc1so7318769e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:44:47 -0800 (PST)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a3e3sm2708939a12.12.2024.11.06.05.05.22
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
X-Inumbo-ID: 49a1ccad-9c45-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMmYiLCJoZWxvIjoibWFpbC1sZjEteDEyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjQ5YTFjY2FkLTljNDUtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTAwNjg3LjY2MjE2OSwic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730900687; x=1731505487; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ep8EzNnBGYuRzdmlGG1nNPu6Bpt+tpLeX3JycmIw8eY=;
        b=IebuaaWxaT09gmWVfAWELP350I1H4wDTtSRnZj4suEeqsAzMvepZ78cUwKiAv8Kqs2
         9VYmCGf2fZUKk7X+NCOJDpj/KjmrAlO6+qXmZUqxGV25HFA0TpmeyjTeGwaa9BKQJ5hK
         6tQN5oET35PyDM1OIBeU5Xo0CTeYmlGj1T/NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900687; x=1731505487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ep8EzNnBGYuRzdmlGG1nNPu6Bpt+tpLeX3JycmIw8eY=;
        b=RvWO1naPWlFIB1q5hCqOoElKEwfv/apbml+hJoN4B/B4StyMzQphuGXGfd6LYsMugq
         gnMrpjSN8W3CTo7RiHwXrgDb4OQkWJyryZHOmhvr6UvhD6MVF6pIx9ywBF0weSut9Caf
         fGdyBhffsaYSOoWG5Nh+G5oq+nnvMztGrI5yx9esUrS33Wxt2ZBzTIbRTh4ScmW0y3/V
         zPMlUh5jUAyWjp3PfueQRNIbsAO7/lyKU3OKLKgBLg3zYeWNxRIEsTe/Xo2xxjOTplJI
         wG8A65Ix3x+CDW25K8z4cExKyXZkX5SdEzRokW6m1tve2u09vVFGXu2scudd1UdCg8wH
         b4OA==
X-Gm-Message-State: AOJu0YzdjbWwJl5chp1vXtxTiXSiVhfE3QeOyrILKpnxe4Fr8B+QppRf
	JieAb7gDBfW9KXK7Jzhlo+HZ7dXmfLCsrJy4zX2CF7o0wXu6ezx4p2uh6REmyUiuniFMT/JC0Wk
	/9Vo=
X-Google-Smtp-Source: AGHT+IElaVShQZYzT3KmsZKBxhonJq/DoVUXXNFDK3HSXpwRYLA5vkJRZy3oJuvg8M4YPRPQXSqITw==
X-Received: by 2002:a05:6402:2748:b0:5ce:ddd4:7c2f with SMTP id 4fb4d7f45d1cf-5ceddd47c77mr6533443a12.7.1730898323243;
        Wed, 06 Nov 2024 05:05:23 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [XEN PATCH v2 1/6] CI: Refresh the Debian 12 x86_64 container
Date: Wed,  6 Nov 2024 13:05:02 +0000
Message-ID: <083c6bb0194fdd082425185f9d153b355a47c614.1730743077.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730743077.git.javi.merino@cloud.com>
References: <cover.1730743077.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to use heredocs for readability, and use
apt-get --no-install-recommends to keep the size down.

This reduces the size of the (uncompressed) container from 3.44GB to
1.97GB.

The container is left running the builds and tests as root to avoid
breaking the xilinx runners.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---

Changes in dependencies:

$ diff -u <(git show origin/staging:automation/build/debian/bookworm.dockerfile | awk '/&&/{f=0};f;/apt-get \-\-quiet/{f=1};' | perl -ne 's/ \\$//;s/^ +//; /^#/ or print' | sort) <(awk '/^ +\)/{f=0};f;/DEPS=\(/{f=1}' automation/build/debian/12-x86_64.dockerfile | perl -ne 's/^\s+//; /^#/ or print' | sort)          
--- /proc/self/fd/16    2024-11-05 14:06:10.160095997 +0000
+++ /proc/self/fd/17    2024-11-05 14:06:10.160095997 +0000
@@ -1,34 +1,29 @@
 acpica-tools
-apt-transport-https
 bcc
 bin86
 bison
 build-essential
 busybox-static
+ca-certificates
 checkpolicy
 clang
 cpio
 expect
 flex
-git
-gnupg
-golang
-libaio-dev
-libfindlib-ocaml-dev
-libglib2.0-dev
+git-core
+golang-go
+libbz2-dev
 liblzma-dev
+liblzo2-dev
 libncurses5-dev
 libnl-3-dev
-libpixman-1-dev
 libyajl-dev
-markdown
-nasm
+libzstd-dev
+ocaml-findlib
 ocaml-nox
 ovmf
-pandoc
 pkg-config
 python3-dev
 python3-setuptools
 qemu-system-x86
-transfig
 uuid-dev

 automation/build/debian/12-x86_64.dockerfile | 71 ++++++++++++++++++++
 automation/build/debian/bookworm.dockerfile  | 57 ----------------
 automation/gitlab-ci/build.yaml              | 20 +++---
 automation/gitlab-ci/test.yaml               | 14 ++--
 automation/scripts/containerize              |  2 +-
 5 files changed, 89 insertions(+), 75 deletions(-)
 create mode 100644 automation/build/debian/12-x86_64.dockerfile
 delete mode 100644 automation/build/debian/bookworm.dockerfile

diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
new file mode 100644
index 000000000000..c440748f2336
--- /dev/null
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -0,0 +1,71 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:bookworm
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
+        # libxenguest dombuilder
+        libbz2-dev
+        liblzma-dev
+        liblzo2-dev
+        libzstd-dev
+        zlib1g-dev
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libnl-3-dev
+        libyajl-dev
+        # RomBIOS
+        bcc
+        bin86
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Golang bindings
+        golang-go
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+
+        # for test phase, qemu-smoke-* jobs
+        expect
+        qemu-system-x86
+
+        # for qemu-alpine-x86_64-gcc
+        busybox-static
+        cpio
+
+        # For *-efi jobs
+        ovmf
+    )
+
+    apt-get -y --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER root
+WORKDIR /build
diff --git a/automation/build/debian/bookworm.dockerfile b/automation/build/debian/bookworm.dockerfile
deleted file mode 100644
index 72e01aa58b55..000000000000
--- a/automation/build/debian/bookworm.dockerfile
+++ /dev/null
@@ -1,57 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
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
-        gnupg \
-        apt-transport-https \
-        golang \
-        # for test phase, qemu-smoke-* jobs
-        qemu-system-x86 \
-        expect \
-        # For *-efi jobs
-        ovmf \
-        # for test phase, qemu-alpine-* jobs
-        cpio \
-        busybox-static \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index af2b1ceba3a4..d64a7e40f3f1 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -345,15 +345,15 @@ alpine-3.18-gcc-debug:
       CONFIG_UNSUPPORTED=y
       CONFIG_ARGO=y
 
-debian-bookworm-gcc-debug:
+debian-12-x86_64-gcc-debug:
   extends: .gcc-x86-64-build-debug
   variables:
-    CONTAINER: debian:bookworm
+    CONTAINER: debian:12-x86_64
 
-debian-bookworm-clang-debug:
+debian-12-x86_64-clang-debug:
   extends: .clang-x86-64-build-debug
   variables:
-    CONTAINER: debian:bookworm
+    CONTAINER: debian:12-x86_64
 
 debian-12-ppc64le-gcc-debug:
   extends: .gcc-ppc64le-cross-build-debug
@@ -557,20 +557,20 @@ debian-12-x86_64-gcc-ibt:
     EXTRA_FIXED_RANDCONFIG: |
       CONFIG_XEN_IBT=y
 
-debian-bookworm-clang:
+debian-12-x86_64-clang:
   extends: .clang-x86-64-build
   variables:
-    CONTAINER: debian:bookworm
+    CONTAINER: debian:12-x86_64
 
-debian-bookworm-gcc:
+debian-12-x86_64-gcc:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: debian:bookworm
+    CONTAINER: debian:12-x86_64
 
-debian-bookworm-gcc-randconfig:
+debian-12-x86_64-gcc-randconfig:
   extends: .gcc-x86-64-build
   variables:
-    CONTAINER: debian:bookworm
+    CONTAINER: debian:12-x86_64
     RANDCONFIG: y
 
 debian-bookworm-32-clang-debug:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index e8f57e87bd19..5b89cfa33cf8 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -43,7 +43,7 @@
 .qemu-x86-64:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:bookworm
+    CONTAINER: debian:12-x86_64
     LOGFILE: qemu-smoke-x86-64.log
   artifacts:
     paths:
@@ -155,7 +155,7 @@
 build-each-commit-gcc:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:bookworm
+    CONTAINER: debian:12-x86_64
     XEN_TARGET_ARCH: x86_64
     CC: gcc
   script:
@@ -477,35 +477,35 @@ qemu-smoke-x86-64-gcc:
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-bookworm-gcc-debug
+    - debian-12-x86_64-gcc-debug
 
 qemu-smoke-x86-64-clang:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pv 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-bookworm-clang-debug
+    - debian-12-x86_64-clang-debug
 
 qemu-smoke-x86-64-gcc-pvh:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-bookworm-gcc-debug
+    - debian-12-x86_64-gcc-debug
 
 qemu-smoke-x86-64-clang-pvh:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64.sh pvh 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-bookworm-clang-debug
+    - debian-12-x86_64-clang-debug
 
 qemu-smoke-x86-64-gcc-efi:
   extends: .qemu-smoke-x86-64
   script:
     - ./automation/scripts/qemu-smoke-x86-64-efi.sh pv 2>&1 | tee ${LOGFILE}
   needs:
-    - debian-bookworm-gcc-debug
+    - debian-12-x86_64-gcc-debug
 
 qemu-smoke-riscv64-gcc:
   extends: .qemu-riscv64
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 6ac02c42d124..ea6e1a9b18f4 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -34,7 +34,7 @@ case "_${CONTAINER}" in
     _bullseye-riscv64) CONTAINER="${BASE}/debian:11-riscv64" ;;
     _bookworm-riscv64) CONTAINER="${BASE}/debian:12-riscv64" ;;
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
-    _bookworm|_) CONTAINER="${BASE}/debian:bookworm" ;;
+    _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
     _bookworm-i386) CONTAINER="${BASE}/debian:bookworm-i386" ;;
     _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:bookworm-arm64v8" ;;
-- 
2.45.2


