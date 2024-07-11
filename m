Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35B292E5C7
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jul 2024 13:15:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.757330.1166239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlx-0001e2-CQ; Thu, 11 Jul 2024 11:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 757330.1166239; Thu, 11 Jul 2024 11:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sRrlx-0001al-6h; Thu, 11 Jul 2024 11:15:37 +0000
Received: by outflank-mailman (input) for mailman id 757330;
 Thu, 11 Jul 2024 11:15:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PZf6=OL=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sRrlv-0007rD-Bd
 for xen-devel@lists.xenproject.org; Thu, 11 Jul 2024 11:15:35 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e49f2f01-3f76-11ef-bbfb-fd08da9f4363;
 Thu, 11 Jul 2024 13:15:34 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a77ec5d3b0dso101533466b.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Jul 2024 04:15:34 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff7d5sm246386666b.142.2024.07.11.04.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 04:15:32 -0700 (PDT)
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
X-Inumbo-ID: e49f2f01-3f76-11ef-bbfb-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720696533; x=1721301333; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGXMWhwWhR4eu24XAy5thYClOJ/SD11Mbj0BOcW/2q4=;
        b=gjZwvwC3mWwTWhhznnqIKLhSJxrjv3161TNvkvdX9czRZmF4HQtZleDkAO1lmAI6WW
         WELYekx6PfO5aEUG+KLswHLHEBwcDBiZfYBuci0a3IWp4HL1QVAAH1BvortH75tbxNn+
         CuNaJhqBWlgC3htYQyPljpPgwKevSRuTFAGGo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720696533; x=1721301333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGXMWhwWhR4eu24XAy5thYClOJ/SD11Mbj0BOcW/2q4=;
        b=mMFv3Olyycuv5VonahSgWiHnNaYEB8ghftjbv9QegW5PqXS27DBossHQ+Qh19xjyVB
         u9TqhBel84AUNn0DHvKPajPSzQ222bx3QcxSC+EiExsRQCFKhOmt9tkXNRFuIHMpEnRn
         iRRTnFjZ047YmeKBMeZJV41LjRZecCOCWs52dUZHKs0c8xMWGELasmBKBUWo7oLxz9vS
         FUCitTQeeH/Uk0LMmla5caDCHc1kzxrPdh/B8TflKhiygoACaIXJxR89JYESI7XHBBjc
         3V+tmtjRCKmTSmu7j5Q9AE3g1TiBHI7qLrhBdNo84QEMQfsKFazfc8fIo5WpWZY9hBN+
         h7Pw==
X-Gm-Message-State: AOJu0YzBo2cGSb9tKKoiHpx0mc4NSQKqNO6GzKH9Tej5oWAuRVxHlLjg
	Y+8pNgoI7XNI+4O5A+wfZ9PZ64z72Su4snBev9axpAINMMkfcUVRsKsUluZcBrt+yAhg0/HrFmj
	Z
X-Google-Smtp-Source: AGHT+IF7Ddg0v7erLjz9gTj8Rdrl6n/v+Oz4ajX7EkmQdnvN1xRBwsxmyTxjJldGrDJOozxFrK0Hdg==
X-Received: by 2002:a17:906:6a25:b0:a77:c657:5942 with SMTP id a640c23a62f3a-a780b88b3d8mr699173066b.52.1720696533420;
        Thu, 11 Jul 2024 04:15:33 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 08/12] CI: Use debian:12-ppc64le for both build and test
Date: Thu, 11 Jul 2024 12:15:13 +0100
Message-Id: <20240711111517.3064810-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
References: <20240711111517.3064810-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

qemu-system-ppc64/8.1.0-ppc64 was added because bullseye's Qemu didn't
understand the powernv9 machine.

However, bookworm's Qemu does, and this is preforable to maintaining a random
build of Qemu ourselves.

Add bookworm builds, and retain bullseye to keep our lower-bound toolchain
testing.

Rename the jobs to follow to sort coherently ($DISTRO-$VERSION-$ARCH-*) and
reposition the jobs to optimise starting the smoke test.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 automation/gitlab-ci/build.yaml               | 59 ++++++++++---------
 automation/gitlab-ci/test.yaml                |  5 +-
 automation/scripts/qemu-smoke-ppc64le.sh      |  4 +-
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile  | 38 ------------
 4 files changed, 34 insertions(+), 72 deletions(-)
 delete mode 100644 automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index 1446bc1d0ea7..316dc4345f29 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -302,20 +302,6 @@ qemu-system-aarch64-6.0.0-arm32-export:
   tags:
     - arm64
 
-# ppc64 test artifacts
-
-qemu-system-ppc64-8.1.0-ppc64-export:
-  extends: .test-jobs-artifact-common
-  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-ppc64:8.1.0-ppc64
-  script:
-    - mkdir binaries && cp /qemu-system-ppc64 /skiboot.lid binaries/
-  artifacts:
-    paths:
-      - binaries/qemu-system-ppc64
-      - binaries/skiboot.lid
-  tags:
-    - x86_64
-
 # x86_64 test artifacts
 
 alpine-3.18-rootfs-export:
@@ -364,6 +350,13 @@ debian-bookworm-clang-debug:
   variables:
     CONTAINER: debian:bookworm
 
+debian-12-ppc64le-gcc-debug:
+  extends: .gcc-ppc64le-cross-build-debug
+  variables:
+    CONTAINER: debian:12-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    HYPERVISOR_ONLY: y
+
 # Arm32 cross-build
 
 debian-bookworm-gcc-arm32:
@@ -500,21 +493,6 @@ archlinux-current-gcc-riscv64-randconfig:
     RANDCONFIG: y
     <<: *riscv-fixed-randconfig
 
-# Power cross-build
-debian-bullseye-gcc-ppc64le:
-  extends: .gcc-ppc64le-cross-build
-  variables:
-    CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: ppc64_defconfig
-    HYPERVISOR_ONLY: y
-
-debian-bullseye-gcc-ppc64le-debug:
-  extends: .gcc-ppc64le-cross-build-debug
-  variables:
-    CONTAINER: debian:bullseye-ppc64le
-    KBUILD_DEFCONFIG: ppc64_defconfig
-    HYPERVISOR_ONLY: y
-
 # Yocto test jobs
 yocto-qemuarm64:
   extends: .yocto-test-arm64
@@ -738,3 +716,26 @@ opensuse-tumbleweed-gcc-debug:
   variables:
     CONTAINER: suse:opensuse-tumbleweed
   allow_failure: true
+
+# PowerPC builds (x86 cross)
+debian-bullseye-gcc-ppc64le:
+  extends: .gcc-ppc64le-cross-build
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-bullseye-gcc-ppc64le-debug:
+  extends: .gcc-ppc64le-cross-build-debug
+  variables:
+    CONTAINER: debian:bullseye-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    HYPERVISOR_ONLY: y
+
+debian-12-ppc64le-gcc:
+  extends: .gcc-ppc64le-cross-build
+  variables:
+    CONTAINER: debian:12-ppc64le
+    KBUILD_DEFCONFIG: ppc64_defconfig
+    HYPERVISOR_ONLY: y
+
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index d50e522f9f79..70c946f87799 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -69,7 +69,7 @@
 .qemu-ppc64le:
   extends: .test-jobs-common
   variables:
-    CONTAINER: debian:bullseye-ppc64le
+    CONTAINER: debian:12-ppc64le
     LOGFILE: qemu-smoke-ppc64le.log
   artifacts:
     paths:
@@ -447,5 +447,4 @@ qemu-smoke-ppc64le-powernv9-gcc:
   script:
     - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOGFILE}
   needs:
-    - qemu-system-ppc64-8.1.0-ppc64-export
-    - debian-bullseye-gcc-ppc64le-debug
+    - debian-12-ppc64le-gcc-debug
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index 701d81107d18..9088881b731b 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -12,8 +12,8 @@ rm -f ${serial_log}
 set +e
 
 timeout -k 1 20 \
-binaries/qemu-system-ppc64 \
-    -bios binaries/skiboot.lid \
+qemu-system-ppc64 \
+    -bios skiboot.lid \
     -M $machine \
     -m 2g \
     -smp 1 \
diff --git a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
deleted file mode 100644
index e28d68649239..000000000000
--- a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
+++ /dev/null
@@ -1,38 +0,0 @@
-# syntax=docker/dockerfile:1
-FROM --platform=linux/amd64 debian:bullseye-slim
-LABEL maintainer.name="The Xen Project" \
-      maintainer.email="xen-devel@lists.xenproject.org"
-
-ENV DEBIAN_FRONTEND=noninteractive
-ENV QEMU_VERSION=8.1.0
-ENV USER root
-
-RUN mkdir /build
-WORKDIR /build
-
-# build depends
-RUN apt-get update && \
-    apt-get --quiet --yes install \
-        build-essential \
-        curl \
-        python3 \
-        python3-pip \
-        python3-elementpath \
-        ninja-build \
-        pkg-config \
-        libglib2.0-dev \
-        libpixman-1-dev \
-        && \
-    \
-    curl -fsSLO https://download.qemu.org/qemu-"$QEMU_VERSION".tar.xz && \
-    tar xvJf qemu-"$QEMU_VERSION".tar.xz && \
-    cd qemu-"$QEMU_VERSION" && \
-    ./configure --target-list=ppc64-softmmu && \
-    make -j$(nproc) && \
-    cp ./build/qemu-system-ppc64 / && \
-    cp ./build/qemu-bundle/usr/local/share/qemu/skiboot.lid / && \
-    cd /build && \
-    rm -rf qemu-"$QEMU_VERSION"* && \
-    apt-get autoremove -y && \
-    apt-get clean && \
-    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
-- 
2.39.2


