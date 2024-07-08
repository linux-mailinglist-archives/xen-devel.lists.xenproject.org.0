Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4FC92A848
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jul 2024 19:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.755533.1163948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsH0-00011o-Bf; Mon, 08 Jul 2024 17:35:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 755533.1163948; Mon, 08 Jul 2024 17:35:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sQsH0-0000zs-7q; Mon, 08 Jul 2024 17:35:34 +0000
Received: by outflank-mailman (input) for mailman id 755533;
 Mon, 08 Jul 2024 17:35:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP+Y=OI=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sQsGy-0000H0-Qd
 for xen-devel@lists.xenproject.org; Mon, 08 Jul 2024 17:35:32 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79167797-3d50-11ef-8776-851b0ebba9a2;
 Mon, 08 Jul 2024 19:35:31 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a77abe5c709so525689066b.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jul 2024 10:35:31 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a6bc88csm11603666b.6.2024.07.08.10.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jul 2024 10:35:28 -0700 (PDT)
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
X-Inumbo-ID: 79167797-3d50-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1720460130; x=1721064930; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFhtWu/TJjeZ9/+nBiaknK8ozkp9Tho9YIR3RqITO48=;
        b=q341IblXkaYRU7kCR8IIurk/Yzz+HL5YdUTmov2YkP0pBGZOidUeRt4NoWOgUMyOAb
         e06+yHt2xTHGBpqPBDjhl39knLGsABuRTayzukp8AWuvdQjd0kIqh6iPiTOuT7mz54j7
         YfkoEhSMekmjklVLp3ow5Z7OuRL4BR0SThcSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720460130; x=1721064930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jFhtWu/TJjeZ9/+nBiaknK8ozkp9Tho9YIR3RqITO48=;
        b=GdgI5ijxCbuGccLS0E+ph163yUY1VFBau0CFsMKuQSqFGHH/5b+/A1OL4/XSs8vzIw
         iX/CQo5RY8k/QRmPjRDmHWj/ivpLqz1qjliFk0CJULM3mWURkqqBiQnOb/HHHBv+Eehr
         LNum+jRnh6QYEjfbk+gb+la1eF9r4b46pPL5oVAMz7LEn/cOE5IES+NeNq35q2QjDScq
         G21auV/aNaX3hlp69+VdNM0icX7SEB1tCPCwWl2rU1t7JcQQ0jNx7Y3BJcxDnTEolr9q
         XNVKWB6cgqV11TdO4XldghB/wItRUU1ixSUZP7HujlR2jx/g4FS8kC39wCzTUOb6AcPj
         JbYg==
X-Gm-Message-State: AOJu0YwJbTpDffKMzG7KyEJTKlm7so0zLaTpGQDNl4akhjogYDrYwiy6
	kAsYA48LVoR+aY0VFi2XbtPXJodT5FuhO/6ynp7ZDwEVav+zUtu78EfRDoukfzbNDfD8dw7m2KL
	J
X-Google-Smtp-Source: AGHT+IEmWNDp3WFROxGqbBL0aWS8u3xezMZt2Pd2cCrt0NrGrqwBZpZiN8vDjSXqYKg6A8hN0VFPDg==
X-Received: by 2002:a17:907:7f20:b0:a77:e1fb:7dea with SMTP id a640c23a62f3a-a780b688767mr20751766b.2.1720460130210;
        Mon, 08 Jul 2024 10:35:30 -0700 (PDT)
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
Subject: [PATCH 3/4] CI: Use bookworm-ppc64le for both build and test
Date: Mon,  8 Jul 2024 18:35:21 +0100
Message-Id: <20240708173522.2218293-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
References: <20240708173522.2218293-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

qemu-system-ppc64/8.1.0-ppc64 was added because bullseye's Qemu didn't
understand the powernv9 machine.

However, bookworm's Qemu does, and this is preforable to maintaining a random
build of Qemu ourselves.

Add bookworm builds, and retain bullseye to keep our lower-bound toolchain
testing.

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
 automation/gitlab-ci/build.yaml               | 22 +++++++++--
 automation/gitlab-ci/test.yaml                |  3 +-
 automation/scripts/qemu-smoke-ppc64le.sh      |  4 +-
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile  | 38 -------------------
 4 files changed, 21 insertions(+), 46 deletions(-)
 delete mode 100644 automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile

diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index ff5c9055d1f0..d6da156a5c85 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -534,17 +534,17 @@ archlinux-current-gcc-riscv64-debug-randconfig:
     <<: *riscv-fixed-randconfig
 
 # Power cross-build
-debian-bullseye-gcc-ppc64le:
+debian-bookworm-gcc-ppc64le:
   extends: .gcc-ppc64le-cross-build
   variables:
-    CONTAINER: debian:bullseye-ppc64le
+    CONTAINER: debian:bookworm-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
-debian-bullseye-gcc-ppc64le-debug:
+debian-bookworm-gcc-ppc64le-debug:
   extends: .gcc-ppc64le-cross-build-debug
   variables:
-    CONTAINER: debian:bullseye-ppc64le
+    CONTAINER: debian:bookworm-ppc64le
     KBUILD_DEFCONFIG: ppc64_defconfig
     HYPERVISOR_ONLY: y
 
@@ -817,3 +817,17 @@ opensuse-tumbleweed-gcc-debug:
   variables:
     CONTAINER: suse:opensuse-tumbleweed
   allow_failure: true
+
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
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 898d2adc8c5b..479479f23f65 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -447,5 +447,4 @@ qemu-smoke-ppc64le-powernv9-gcc:
   script:
     - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOGFILE}
   needs:
-    - qemu-system-ppc64-8.1.0-ppc64-export
-    - debian-bullseye-gcc-ppc64le-debug
+    - debian-bookworm-gcc-ppc64le-debug
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


