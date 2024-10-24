Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9479AE210
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 12:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825099.1239304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uhs-0005nM-SG; Thu, 24 Oct 2024 10:04:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825099.1239304; Thu, 24 Oct 2024 10:04:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uhs-0005kj-OC; Thu, 24 Oct 2024 10:04:40 +0000
Received: by outflank-mailman (input) for mailman id 825099;
 Thu, 24 Oct 2024 10:04:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3uhr-0005hp-0O
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 10:04:39 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 604ba3ba-91ef-11ef-99a3-01e77a169b0f;
 Thu, 24 Oct 2024 12:04:37 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-5c9693dc739so886931a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 03:04:37 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c72866sm5482506a12.95.2024.10.24.03.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 03:04:35 -0700 (PDT)
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
X-Inumbo-ID: 604ba3ba-91ef-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729764276; x=1730369076; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cByNa6/hk0GoMLekCJ3KNnYw1LRCV4BYv94ebYfTHDY=;
        b=ibczguIw69WCyAJSY+G1QOiFFQ3ly8++IN72YDPCSW8yfc230QwIS2ax9fhrU3ElBq
         Id6t9tHVZtm3cw47k/qAjB5eLY7wxHMMKJfnL5lgl03G3MsiaG7sR0sA8LtFpCDpxoeL
         JauiBbJcQQWu2iUTEgx2WEAvSteoZftACaonU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764276; x=1730369076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cByNa6/hk0GoMLekCJ3KNnYw1LRCV4BYv94ebYfTHDY=;
        b=FstbKCx6yjivL/xqaqRo4BzqRoQyuZeO0prR0kjyi0pwukzuxsv7tiJ4waLC6enlMs
         3JyL6pq6BL71cHUarU34U0ruL/4Wkw6/xIlhhGJx/SDLol9a77Nf9x6eyek9OAgAz7pE
         vcCbUDyaYNGPdo7K2ENep5k4eMGNaAsMBi+Gb7L9ojwC4YWi7AynaSrgi335z8+jIkUl
         vqMYxL7UPEjsMcBkQEBnbiZbchj0zEvAHfa7p+TJBHmCbgL26MnBFVGTFxFbWsL3iCUg
         BUKLCAfRl4EVTdvHorcE0qRR/QGFV5geeI8RYsfChMF5SXcj9uSvcqAgX5LZimg8aILy
         INqQ==
X-Gm-Message-State: AOJu0YzxXFUmiGv4Ufq77DxBLkH9BjuwmaKAgkWFvb+Sq1IK1/8ORMfC
	dmnapTCN6yc5Ib0VAEA0oQ8lGd8Y9m5AbsIgjqSd8q2NPwDOAL7xqP6E30kGGqKzocY41OKLi1S
	408E=
X-Google-Smtp-Source: AGHT+IFQc//FcRKMsdqTdoMjpQ/Mmo7CnGs5JPPRiH32Z17oE4kXL6W/C3ADvghplQLCCgUMn+hxvw==
X-Received: by 2002:a05:6402:40d2:b0:5cb:68cf:c730 with SMTP id 4fb4d7f45d1cf-5cb8af7dde3mr4781805a12.5.1729764276275;
        Thu, 24 Oct 2024 03:04:36 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 1/6] CI: Refresh the Debian 12 x86_64 container
Date: Thu, 24 Oct 2024 11:04:16 +0100
Message-ID: <288fcc10dbcbdab1c33ebfb95bedf2366ba64122.1729760501.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1729760501.git.javi.merino@cloud.com>
References: <cover.1729760501.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to use heredocs for readability, and use
apt-get --no-install-recommends to keep the size down.

This reduces the size of the (uncompressed) container from 3.44GB to 1.67GB.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 automation/build/debian/12-x86_64.dockerfile | 68 ++++++++++++++++++++
 automation/build/debian/bookworm.dockerfile  | 57 ----------------
 automation/gitlab-ci/build.yaml              | 20 +++---
 automation/gitlab-ci/test.yaml               | 14 ++--
 automation/scripts/containerize              |  2 +-
 5 files changed, 86 insertions(+), 75 deletions(-)
 create mode 100644 automation/build/debian/12-x86_64.dockerfile
 delete mode 100644 automation/build/debian/bookworm.dockerfile

diff --git a/automation/build/debian/12-x86_64.dockerfile b/automation/build/debian/12-x86_64.dockerfile
new file mode 100644
index 000000000000..e0ca8b7e9c91
--- /dev/null
+++ b/automation/build/debian/12-x86_64.dockerfile
@@ -0,0 +1,68 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/amd64 debian:bookworm
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
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
+        expect
+        git-core
+        libnl-3-dev
+        pkg-config
+        wget
+        # libxenguest dombuilder
+        liblzma-dev
+        zlib1g-dev
+        # libacpi
+        acpica-tools
+        # libxl
+        uuid-dev
+        libyajl-dev
+        # RomBIOS
+        bcc
+        bin86
+        # xentop
+        libncurses5-dev
+        # Python bindings
+        python3-dev
+        python3-setuptools
+        # Ocaml bindings/oxenstored
+        ocaml-nox
+        ocaml-findlib
+        # To build the documentation
+        pandoc
+
+        # for test phase, qemu-smoke-* jobs
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
index 09dd9e6ccbd0..eb2c23619a2c 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -341,15 +341,15 @@ alpine-3.18-gcc-debug:
     CONTAINER: alpine:3.18
     BUILD_QEMU_XEN: y
 
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
@@ -553,20 +553,20 @@ debian-12-x86_64-gcc-ibt:
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
index e76a37bef32d..0812ddb42d9b 100644
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
@@ -461,35 +461,35 @@ qemu-smoke-x86-64-gcc:
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


