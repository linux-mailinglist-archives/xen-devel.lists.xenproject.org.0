Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 138269BEF2F
	for <lists+xen-devel@lfdr.de>; Wed,  6 Nov 2024 14:37:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831011.1246152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gDY-0000fY-0M; Wed, 06 Nov 2024 13:37:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831011.1246152; Wed, 06 Nov 2024 13:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8gDX-0000cp-TT; Wed, 06 Nov 2024 13:37:03 +0000
Received: by outflank-mailman (input) for mailman id 831011;
 Wed, 06 Nov 2024 13:37:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nSNS=SB=cloud.com=javi.merino@srs-se1.protection.inumbo.net>)
 id 1t8gDV-0000bw-Ut
 for xen-devel@lists.xenproject.org; Wed, 06 Nov 2024 13:37:02 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 314d25a0-9c44-11ef-a0c6-8be0dac302b0;
 Wed, 06 Nov 2024 14:36:57 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5c957d8bce2so3557746a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 06 Nov 2024 05:36:57 -0800 (PST)
Received: from localhost.localdomain ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cee6a9a3e3sm2708939a12.12.2024.11.06.05.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2024 05:05:24 -0800 (PST)
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
X-Inumbo-ID: 314d25a0-9c44-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MmYiLCJoZWxvIjoibWFpbC1lZDEteDUyZi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjMxNGQyNWEwLTljNDQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTAwMjE3LjIxNDM4OCwic2VuZGVyIjoiamF2aS5tZXJpbm9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1730900216; x=1731505016; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xH5wKOdOvZjOHcy7mDqmxoiWP49Ll4vPM7f/D8pUsAo=;
        b=kxZFrGawbEmJISROR9uICQpUJo5kAVQwA0Y7ck3m1ruEgmqlTE+jmMpxTKzfPvva0w
         b5O6vHPI2PWycK8bObLiX1au7v9fhH12O8W6YL89qKivZbuzX+oezgg7jdZnb/9rZRy3
         rSNUr2qnrvO+NcS9dvYvq0zdCEKJDowt+pa94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900216; x=1731505016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xH5wKOdOvZjOHcy7mDqmxoiWP49Ll4vPM7f/D8pUsAo=;
        b=Zw1KeoAwvutOSbAO30ezBSKcw7D3LYufDXu+x4xS2toTL4F+2rZIwiNZDIejgyPide
         OJs2spBvLLofcpMzh7cdrdgk2fKbmCdLCTywM5hnlHoNXoq07pbh0pNK+lOdvmg6XyOR
         wL0GHL9xPQwlIbmZ9bB6TGD9FEOrMO3o4lfa1C9NSsDN4PIq6Qr9s7jQMQhE4+nLTxlk
         89NHezcuLugEDDkyLZPc2Gb0+EFwtwCSo5rBEUQFNWl9JcTmHqEZYU7mTU1jh/kMGNgj
         BfOzqaP2Jwm278HFBp49CYKjnNBUCBtxa5Ofe+mR6/EijWEKEmvaFnimFoOxseOOV1Ic
         Z8XA==
X-Gm-Message-State: AOJu0Yx4D/mgnyWPHkKhwVO594wfdd/RpHdqSe4K73D8AGEudMvFUNrZ
	dqytiBD8OyiHbaXFzPBkLQl/swRGCohTghtSLf5LxSlHJm9KuuPpr69uCGZETylhO7JZqurRST/
	nH2c=
X-Google-Smtp-Source: AGHT+IGlJSWig6UQewzo2rPWl/JG425oYkgK6QnRb6acnpheKGd4wy9ZgYUxeTukBaspLTcc/lFywA==
X-Received: by 2002:a05:6402:280a:b0:5c9:45b5:6077 with SMTP id 4fb4d7f45d1cf-5ceb935bc94mr20003942a12.23.1730898325010;
        Wed, 06 Nov 2024 05:05:25 -0800 (PST)
From: Javi Merino <javi.merino@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Javi Merino <javi.merino@cloud.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [XEN PATCH v2 4/6] CI: Refresh the Debian 12 arm32 cross compile container
Date: Wed,  6 Nov 2024 13:05:05 +0000
Message-ID: <5ffd2e88ebb473bbc6a9c89fb9cb63355822ec36.1730743077.git.javi.merino@cloud.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1730743077.git.javi.merino@cloud.com>
References: <cover.1730743077.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework the container to user heredocs for readability and use
apt-get --no-install-recommends to keep the size down.  Rename the CI
jobs to debian-12-arm32-<variant> to follow the naming scheme of all
the other CI jobs.

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
index 000000000000..01756bfcbf72
--- /dev/null
+++ b/automation/build/debian/12-arm64v8-arm32-gcc.dockerfile
@@ -0,0 +1,28 @@
+# syntax=docker/dockerfile:1
+FROM --platform=linux/arm64/v8 debian:bookworm
+LABEL maintainer.name="The Xen Project"
+LABEL maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf-
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
index 8ee1049d857c..3f87187443e2 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -371,39 +371,39 @@ debian-12-riscv64-gcc-debug:
 
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
index 3a4d0eb7e15d..fa452ccf7a9e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -414,7 +414,7 @@ qemu-smoke-dom0less-arm32-gcc:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32
+    - debian-12-arm32-gcc
 
 qemu-smoke-dom0less-arm32-gcc-debug:
   extends: .qemu-arm32
@@ -422,7 +422,7 @@ qemu-smoke-dom0less-arm32-gcc-debug:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
   extends: .qemu-arm32
@@ -430,7 +430,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-staticmem:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh static-mem 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug-staticmem
+    - debian-12-arm32-gcc-debug-staticmem
 
 qemu-smoke-dom0less-arm32-gcc-debug-gzip:
   extends: .qemu-arm32
@@ -438,7 +438,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-gzip:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh gzip 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-without-dom0:
   extends: .qemu-arm32
@@ -446,7 +446,7 @@ qemu-smoke-dom0less-arm32-gcc-without-dom0:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32
+    - debian-12-arm32-gcc
 
 qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
   extends: .qemu-arm32
@@ -454,7 +454,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-without-dom0:
     - ./automation/scripts/qemu-smoke-dom0less-arm32.sh without-dom0 2>&1 | tee ${LOGFILE}
   needs:
     - *arm32-test-needs
-    - debian-bookworm-gcc-arm32-debug
+    - debian-12-arm32-gcc-debug
 
 qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
   extends: .qemu-arm32
@@ -462,7 +462,7 @@ qemu-smoke-dom0less-arm32-gcc-debug-earlyprintk:
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


