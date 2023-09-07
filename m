Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8289797CEC
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 21:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597596.931839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeKsJ-0000px-I3; Thu, 07 Sep 2023 19:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597596.931839; Thu, 07 Sep 2023 19:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeKsJ-0000jC-DN; Thu, 07 Sep 2023 19:41:11 +0000
Received: by outflank-mailman (input) for mailman id 597596;
 Thu, 07 Sep 2023 19:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myun=EX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qeKsH-0000X6-QO
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 19:41:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79cb891d-4db6-11ee-9b0d-b553b5be7939;
 Thu, 07 Sep 2023 21:41:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7EDD982857DA;
 Thu,  7 Sep 2023 14:41:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id qgNY59Xnq-Qg; Thu,  7 Sep 2023 14:41:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 12933828574A;
 Thu,  7 Sep 2023 14:41:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tGxJ1Orr3EZ4; Thu,  7 Sep 2023 14:40:59 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id AF40F82857F8;
 Thu,  7 Sep 2023 14:40:59 -0500 (CDT)
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
X-Inumbo-ID: 79cb891d-4db6-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 12933828574A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694115660; bh=FpEWN5XzyDSaed6RXWHy2kOL1gO53wPDtA/kU7OLogE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=jfPvwmQNm2R8I7BrXbHb5DhEe5qOdLrck0exjfxMKN0beH7T1pLLP5UdVAuhTKeB1
	 7c78G2NqxpwY78AiczfHBWtyMHLGuFROCkrjx7KZwZnLN2jXONG/ig+b8EAOjsYmAk
	 DB0tv/phczgHNJh2AKjgSPnZXxpzKA8kI2FFIegg=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 1/2] automation: Switch ppc64le tests to PowerNV machine type
Date: Thu,  7 Sep 2023 14:40:47 -0500
Message-Id: <2cfc81f4538d83e822a9410f94fdacac2c1b0ed7.1694114837.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1694114837.git.sanastasio@raptorengineering.com>
References: <cover.1694114837.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Run ppc64le tests with the PowerNV machine type (bare metal) instead of
the paravirtualized pseries machine. This requires a more modern version
of QEMU than is present in debian bullseye's repository, so update the
dockerfile to build QEMU from source.

Support for booting on pseries was broken by 74b725a64d80 ('xen/ppc:
Implement initial Radix MMU support') which resulted in CI failures. In
preparation for removing pseries support entirely, switch the CI
infrastructure to the PowerNV machine type.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v3: Use test-artifact for custom QEMU build

 .../build/debian/bullseye-ppc64le.dockerfile  |  5 ++-
 automation/gitlab-ci/build.yaml               | 14 +++++++
 automation/gitlab-ci/test.yaml                |  5 ++-
 automation/scripts/qemu-smoke-ppc64le.sh      |  3 +-
 .../qemu-system-ppc64/8.1.0-ppc64.dockerfile  | 37 +++++++++++++++++++
 5 files changed, 59 insertions(+), 5 deletions(-)
 create mode 100644 automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile

diff --git a/automation/build/debian/bullseye-ppc64le.dockerfile b/automation/build/debian/bullseye-ppc64le.dockerfile
index 8fad26e903..4de8458445 100644
--- a/automation/build/debian/bullseye-ppc64le.dockerfile
+++ b/automation/build/debian/bullseye-ppc64le.dockerfile
@@ -22,8 +22,9 @@ RUN apt-get update && \
         gcc-powerpc64le-linux-gnu \
         make \
         python3-minimal \
-        # for test phase
-        qemu-system-ppc \
+        # QEMU runtime dependencies for test phase
+        libglib2.0-0 \
+        libpixman-1-0 \
         && \
         apt-get autoremove -y && \
         apt-get clean && \
diff --git a/automation/gitlab-ci/build.yaml b/automation/gitlab-ci/build.yaml
index b633facff4..1619e9a558 100644
--- a/automation/gitlab-ci/build.yaml
+++ b/automation/gitlab-ci/build.yaml
@@ -306,6 +306,20 @@ qemu-system-aarch64-6.0.0-arm32-export:
   tags:
     - arm64

+# ppc64 test artifacts
+
+qemu-system-ppc64-8.1.0-ppc64-export:
+  extends: .test-jobs-artifact-common
+  image: registry.gitlab.com/xen-project/xen/tests-artifacts/qemu-system-ppc64:8.1.0-ppc64
+  script:
+    - mkdir binaries && cp /qemu-system-ppc64 /skiboot.lid binaries/
+  artifacts:
+    paths:
+      - binaries/qemu-system-ppc64
+      - binaries/skiboot.lid
+  tags:
+    - x86_64
+
 # x86_64 test artifacts

 alpine-3.18-rootfs-export:
diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 9aa8deabea..4b836bf047 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -454,9 +454,10 @@ qemu-smoke-riscv64-gcc:
   needs:
     - archlinux-current-gcc-riscv64-debug

-qemu-smoke-ppc64le-pseries-gcc:
+qemu-smoke-ppc64le-powernv9-gcc:
   extends: .qemu-ppc64le
   script:
-    - ./automation/scripts/qemu-smoke-ppc64le.sh pseries-5.2 2>&1 | tee ${LOGFILE}
+    - ./automation/scripts/qemu-smoke-ppc64le.sh powernv9 2>&1 | tee ${LOGFILE}
   needs:
+    - qemu-system-ppc64-8.1.0-ppc64-export
     - debian-bullseye-gcc-ppc64le-debug
diff --git a/automation/scripts/qemu-smoke-ppc64le.sh b/automation/scripts/qemu-smoke-ppc64le.sh
index eb55221221..2adbdac87e 100755
--- a/automation/scripts/qemu-smoke-ppc64le.sh
+++ b/automation/scripts/qemu-smoke-ppc64le.sh
@@ -12,7 +12,8 @@ set +e
 touch smoke.serial

 timeout -k 1 20 \
-qemu-system-ppc64 \
+binaries/qemu-system-ppc64 \
+    -bios binaries/skiboot.lid \
     -M $machine \
     -m 2g \
     -smp 1 \
diff --git a/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
new file mode 100644
index 0000000000..7376ca46ff
--- /dev/null
+++ b/automation/tests-artifacts/qemu-system-ppc64/8.1.0-ppc64.dockerfile
@@ -0,0 +1,37 @@
+FROM debian:bullseye-slim
+LABEL maintainer.name="The Xen Project" \
+      maintainer.email="xen-devel@lists.xenproject.org"
+
+ENV DEBIAN_FRONTEND=noninteractive
+ENV QEMU_VERSION=8.1.0
+ENV USER root
+
+RUN mkdir /build
+WORKDIR /build
+
+# build depends
+RUN apt-get update && \
+    apt-get --quiet --yes install \
+        build-essential \
+        curl \
+        python3 \
+        python3-pip \
+        python3-elementpath \
+        ninja-build \
+        pkg-config \
+        libglib2.0-dev \
+        libpixman-1-dev \
+        && \
+    \
+    curl -fsSLO https://download.qemu.org/qemu-"$QEMU_VERSION".tar.xz && \
+    tar xvJf qemu-"$QEMU_VERSION".tar.xz && \
+    cd qemu-"$QEMU_VERSION" && \
+    ./configure --target-list=ppc64-softmmu && \
+    make -j$(nproc) && \
+    cp ./build/qemu-system-ppc64 / && \
+    cp ./build/qemu-bundle/usr/local/share/qemu/skiboot.lid / && \
+    cd /build && \
+    rm -rf qemu-"$QEMU_VERSION"* && \
+    apt-get autoremove -y && \
+    apt-get clean && \
+    rm -rf /var/lib/apt/lists* /tmp/* /var/tmp/*
--
2.30.2


