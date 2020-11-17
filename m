Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9595A2B58C0
	for <lists+xen-devel@lfdr.de>; Tue, 17 Nov 2020 05:22:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.28708.57778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kesUl-0007Wn-Dx; Tue, 17 Nov 2020 04:21:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 28708.57778; Tue, 17 Nov 2020 04:21:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kesUl-0007WL-AH; Tue, 17 Nov 2020 04:21:31 +0000
Received: by outflank-mailman (input) for mailman id 28708;
 Tue, 17 Nov 2020 04:21:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Shnx=EX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kesUk-0007Vy-3q
 for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 04:21:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a08ecfa7-b961-4c59-9628-4cf2717f7e06;
 Tue, 17 Nov 2020 04:21:29 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 683C4205F4;
 Tue, 17 Nov 2020 04:21:28 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Shnx=EX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1kesUk-0007Vy-3q
	for xen-devel@lists.xenproject.org; Tue, 17 Nov 2020 04:21:30 +0000
X-Inumbo-ID: a08ecfa7-b961-4c59-9628-4cf2717f7e06
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id a08ecfa7-b961-4c59-9628-4cf2717f7e06;
	Tue, 17 Nov 2020 04:21:29 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 683C4205F4;
	Tue, 17 Nov 2020 04:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605586888;
	bh=/lcIGplqn6odufkVeXSQ/3A4o3V3IGNc2rmyv6gS60M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tSZUd3BHwRJJ6C987+NAT4qrC6/kRq/4+Jlas9lBBMa05nBQf7RSTB98hFuIOlq1g
	 xmcyTJCVHi4PrEEgrfP6d+IAerJAStMKJ+SABEtMdXWXDT9chx5aTRbjC1zeJdBYkv
	 2jia4l4cgtIQhXa+CTAcVnI2mXZDi2OWzb9tb7OE=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 1/2] automation: add a QEMU aarch64 smoke test
Date: Mon, 16 Nov 2020 20:21:26 -0800
Message-Id: <20201117042127.30981-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011161927120.20906@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011161927120.20906@sstabellini-ThinkPad-T480s>

Use QEMU to start Xen (just the hypervisor) up until it stops because
there is no dom0 kernel to boot.

It is based on the existing build job unstable-arm64v8.

Also use make -j$(nproc) to build Xen.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
Changes in v2:
- fix x86_32 build
---
 automation/gitlab-ci/test.yaml         | 22 ++++++++++++++++++
 automation/scripts/build               |  6 ++---
 automation/scripts/qemu-smoke-arm64.sh | 32 ++++++++++++++++++++++++++
 3 files changed, 57 insertions(+), 3 deletions(-)
 create mode 100755 automation/scripts/qemu-smoke-arm64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 793feafe8b..35346e3f6e 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -22,6 +22,28 @@ build-each-commit-gcc:
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
+qemu-smoke-arm64-gcc:
+  stage: test
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm64.sh 2>&1 | tee qemu-smoke-arm64.log
+  dependencies:
+    - debian-unstable-gcc-arm64
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - arm64
+  except:
+    - master
+    - smoke
+    - /^coverity-tested\/.*/
+    - /^stable-.*/
+
 qemu-smoke-x86-64-gcc:
   stage: test
   image: registry.gitlab.com/xen-project/xen/${CONTAINER}
diff --git a/automation/scripts/build b/automation/scripts/build
index 0cd0f3971d..7038e5eb50 100755
--- a/automation/scripts/build
+++ b/automation/scripts/build
@@ -10,9 +10,9 @@ cc-ver()
 
 # random config or default config
 if [[ "${RANDCONFIG}" == "y" ]]; then
-    make -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
+    make -j$(nproc) -C xen KCONFIG_ALLCONFIG=tools/kconfig/allrandom.config randconfig
 else
-    make -C xen defconfig
+    make -j$(nproc) -C xen defconfig
 fi
 
 # build up our configure options
@@ -45,7 +45,7 @@ make -j$(nproc) dist
 # Extract artifacts to avoid getting rewritten by customised builds
 cp xen/.config xen-config
 mkdir binaries
-if [[ "${XEN_TARGET_ARCH}" == "x86_64" ]]; then
+if [[ "${XEN_TARGET_ARCH}" != "x86_32" ]]; then
     cp xen/xen binaries/xen
 fi
 
diff --git a/automation/scripts/qemu-smoke-arm64.sh b/automation/scripts/qemu-smoke-arm64.sh
new file mode 100755
index 0000000000..a7efbf8b6f
--- /dev/null
+++ b/automation/scripts/qemu-smoke-arm64.sh
@@ -0,0 +1,32 @@
+#!/bin/bash
+
+set -ex
+
+# Install QEMU
+export DEBIAN_FRONTENT=noninteractive
+apt-get -qy update
+apt-get -qy install --no-install-recommends qemu-system-aarch64 \
+                                            u-boot-qemu
+
+# XXX Silly workaround to get the following QEMU command to work
+cp /usr/share/qemu/pvh.bin /usr/share/qemu/efi-virtio.rom
+qemu-system-aarch64 \
+   -machine virtualization=true \
+   -cpu cortex-a57 -machine type=virt \
+   -m 512 -display none \
+   -machine dumpdtb=binaries/virt-gicv3.dtb
+
+rm -f smoke.serial
+set +e
+echo "  booti 0x49000000 - 0x44000000" | timeout -k 1 30 qemu-system-aarch64 \
+    -machine virtualization=true \
+    -cpu cortex-a57 -machine type=virt \
+    -m 512 -monitor none -serial stdio \
+    -no-reboot \
+    -device loader,file=binaries/virt-gicv3.dtb,force-raw=on,addr=0x44000000 \
+    -device loader,file=binaries/xen,force-raw=on,addr=0x49000000 \
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
+
+set -e
+grep -q 'LOADING DOMAIN 0' smoke.serial || exit 1
+exit 0
-- 
2.17.1


