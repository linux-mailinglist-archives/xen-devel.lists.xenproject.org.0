Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5619AE20F
	for <lists+xen-devel@lfdr.de>; Thu, 24 Oct 2024 12:04:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825101.1239319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uht-00064t-K9; Thu, 24 Oct 2024 10:04:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825101.1239319; Thu, 24 Oct 2024 10:04:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t3uht-0005xE-CI; Thu, 24 Oct 2024 10:04:41 +0000
Received: by outflank-mailman (input) for mailman id 825101;
 Thu, 24 Oct 2024 10:04:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dalx=RU=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t3uhr-0005hv-OL
 for xen-devel@lists.xenproject.org; Thu, 24 Oct 2024 10:04:39 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61683d3f-91ef-11ef-a0bf-8be0dac302b0;
 Thu, 24 Oct 2024 12:04:39 +0200 (CEST)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5c96b2a10e1so993732a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Oct 2024 03:04:39 -0700 (PDT)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cb66c72866sm5482506a12.95.2024.10.24.03.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 03:04:37 -0700 (PDT)
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
X-Inumbo-ID: 61683d3f-91ef-11ef-a0bf-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1729764278; x=1730369078; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QzmWp98zY9Vb786BtlEJUzc3WOUq+fnBSycqJrqunEI=;
        b=Ac4uP4/bxh+PiYgiOzZa8gcANWMDqvKJE5Q1c7ydavSC6R8Kg2rqE9Z1p0xl3ZSduu
         0rxkiX0XKGDdGf51oakkgVu/hv7/XuT45HJXY7k+kP0EEqd72nzKPBUKBFzuTpvKSnPy
         fjK0YHAqIPXY/qqqvC+C0aA2lkYXwmStldsbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729764278; x=1730369078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QzmWp98zY9Vb786BtlEJUzc3WOUq+fnBSycqJrqunEI=;
        b=BgxCeKLhyZbN0u6Iq2pN7R0imQN9kdHRqR5T0nVzby6hflPRklEz51W7aYeRDYRv0q
         tiiWE2cCft3km/OjBbh7mCoXZW5rzM5J1cPm6AWrN5d13Vp+TAl784leV+gngFI3z5o8
         lKFiu0CSD38n0goEdQCioPkKYNscBUSXqNE7GzuKKeDDlXoZ9CAlwxZn8tInT4MZzYM/
         VLNV2KEVkmjGpHot/tk888C4Bj6OPxdqh5gn2bYe6ebQeogs3sBIvAvPtyAjknFWjRiZ
         0iCu4QH2JKl0z4jF4DmDiKhaFg/crjvdJml4uAPnmDgxZNko4Rfy+V8A+BaVYxqmYvdP
         upGQ==
X-Gm-Message-State: AOJu0YyNT4bNe3bthJRp5mr1cGbecIkCPMe6ZmLj6UdoE9KjcaXpcccU
	3OtZUFJjKtjzPphgNYaNHbCso+TT7WVt6Icy4bY+0r01C/0OHmKxhwpMoEiqBZKc2VD1luoHC01
	Iy2w=
X-Google-Smtp-Source: AGHT+IHgyBo2myOsidtWER+08bvZ/I7fAnSKP3nFVhSk75cnlOePjSojeVmJFomuIK/kaA7p7rWTzw==
X-Received: by 2002:a05:6402:1cc1:b0:5c9:5bcf:db95 with SMTP id 4fb4d7f45d1cf-5cba246719cmr1093552a12.16.1729764278201;
        Thu, 24 Oct 2024 03:04:38 -0700 (PDT)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [XEN PATCH v1 4/6] CI: Refresh the Debian 12 arm32 cross compile container
Date: Thu, 24 Oct 2024 11:04:19 +0100
Message-ID: <762312efd58aa1b41cfcb5439f2fd35580b8bba6.1729760501.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1729760501.git.javi.merino@cloud.com>
References: <cover.1729760501.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to run as non-root, use heredocs for readability and use apt-get
--no-install-recommends to keep the size down.  Rename the CI jobs to
debian-12-arm32-<variant> to follow the naming scheme of all the other
CI jobs.

Signed-off-by: Javi Merino <javi.merino@cloud.com>
---
 .../debian/12-arm64v8-arm32-gcc.dockerfile    | 28 +++++++++++++++++++
 .../bookworm-arm64v8-arm32-gcc.dockerfile     | 24 ----------------
 automation/gitlab-ci/build.yaml               | 20 ++++++-------
 automation/gitlab-ci/test.yaml                | 14 +++++-----
 automation/scripts/containerize               |  2 +-
 5 files changed, 46 insertions(+), 42 deletions(-)
 create mode 100644 automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
 delete mode 100644 automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile

diff --git a/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
new file mode 100644
index 000000000000..bdc935706bfa
--- /dev/null
+++ b/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
@@ -0,0 +1,28 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:bookworm
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE /usr/bin/arm-linux-gnueabihf-
+
+RUN <<EOF
+#!/bin/bash
+    set -eu
+
+    useradd --create-home user
+
+    apt-get update
+    DEPS=(
+        bison
+        build-essential
+        flex
+        gcc-arm-linux-gnueabihf
+    )
+    apt-get --yes --no-install-recommends install "${DEPS[@]}"
+
+    rm -rf /var/lib/apt/lists*
+EOF
+
+USER user
+WORKDIR /build
diff --git a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile b/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
deleted file mode 100644
index 95b3f0428372..000000000000
--- a/automation/build/debian/bookworm-arm64v8-arm32-gcc.dockerfile
+++ /dev/null
@@ -1,24 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/arm64/v8 debian:bookworm
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV USER root
-ENV CROSS_COMPILE /usr/bin/arm-linux-gnueabihf-
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        flex \
-        bison \
-        git \
-        gcc-arm-linux-gnueabihf \
-        && \
-        apt-get autoremove -y && \
-        apt-get clean && \
-        rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index c687298cc924..380021d49f12 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -367,39 +367,39 @@ debian-12-riscv64-gcc-debug:
 
 # Arm32 cross-build
 
-debian-bookworm-gcc-arm32:
+debian-12-arm32-gcc:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
-debian-bookworm-gcc-arm32-debug:
+debian-12-arm32-gcc-debug:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
 
-debian-bookworm-gcc-arm32-randconfig:
+debian-12-arm32-gcc-randconfig:
   extends: .gcc-arm32-cross-build
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     RANDCONFIG: y
 
-debian-bookworm-gcc-arm32-debug-staticmem:
+debian-12-arm32-gcc-debug-staticmem:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
       CONFIG_EXPERT=y
       CONFIG_UNSUPPORTED=y
       CONFIG_STATIC_MEMORY=y
 
-debian-bookworm-gcc-arm32-debug-earlyprintk:
+debian-12-arm32-gcc-debug-earlyprintk:
   extends: .gcc-arm32-cross-build-debug
   variables:
-    CONTAINER: debian:bookworm-arm64v8-arm32-gcc
+    CONTAINER: debian:12-arm64v8-arm32-gcc
     HYPERVISOR_ONLY: y
     EXTRA_XEN_CONFIG: |
       CONFIG_EARLY_UART_CHOICE_PL011=y
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 248281f47942..42baa82fe36f 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -398,7 +398,7 @@ qemu-smoke-dom0less-arm32-gcc:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32
+    - debian-12-arm32-gcc
 
 qemu-smoke-dom0less-arm32-gcc-debug:
   extends: .qemu-arm32
@@ -406,7 +406,7 @@ qemu-smoke-dom0less-arm32-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
   extends: .qemu-arm32
@@ -414,7 +414,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug-staticmem
+    - debian-12-arm32-gcc-debug-staticmem
 
 qemu-smoke-dom0less-arm32-gcc-debug-gzip:
   extends: .qemu-arm32
@@ -422,7 +422,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-gzip:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-without-dom0:
   extends: .qemu-arm32
@@ -430,7 +430,7 @@ qemu-smoke-dom0less-arm32-gcc-without-dom0:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32
+    - debian-12-arm32-gcc
 
 qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
   extends: .qemu-arm32
@@ -438,7 +438,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
   extends: .qemu-arm32
@@ -446,7 +446,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh earlyprintk 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug-earlyprintk
+    - debian-12-arm32-gcc-debug-earlyprintk
 
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
diff --git a/automation/scripts/containerize b/automation/scripts/containerize
index 1b75c8d93724..c9988bfe927d 100755
--- a/automation/scripts/containerize
+++ b/automation/scripts/containerize
@@ -36,7 +36,7 @@ case "_${CONTAINER}" in
     _bookworm-x86_64-gcc-ibt) CONTAINER="${BASE}/debian:12-x86_64-gcc-ibt" ;;
     _bookworm|_bookworm-x86_64|_) CONTAINER="${BASE}/debian:12-x86_64" ;;
     _bookworm-i386|_bookworm-x86_32) CONTAINER="${BASE}/debian:12-x86_32" ;;
-    _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:bookworm-arm64v8-arm32-gcc" ;;
+    _bookworm-arm64v8-arm32-gcc) CONTAINER="${BASE}/debian:12-arm64v8-arm32-gcc" ;;
     _bookworm-arm64v8) CONTAINER="${BASE}/debian:12-arm64v8" ;;
     _bookworm-cppcheck) CONTAINER="${BASE}/debian:bookworm-cppcheck" ;;
     _opensuse-leap|_leap) CONTAINER="${BASE}/opensuse:leap-15.6-x86_64" ;;
-- 
2.45.2


