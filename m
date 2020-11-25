Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D542C3810
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 05:28:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37137.69346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khmPG-0000t3-LO; Wed, 25 Nov 2020 04:27:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37137.69346; Wed, 25 Nov 2020 04:27:50 +0000
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
	id 1khmPG-0000sh-I5; Wed, 25 Nov 2020 04:27:50 +0000
Received: by outflank-mailman (input) for mailman id 37137;
 Wed, 25 Nov 2020 04:27:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khmPE-0000sA-JE
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:48 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8af09075-fccc-4c2b-af61-14dbbae54f12;
 Wed, 25 Nov 2020 04:27:47 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7C0720789;
 Wed, 25 Nov 2020 04:27:46 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khmPE-0000sA-JE
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 04:27:48 +0000
X-Inumbo-ID: 8af09075-fccc-4c2b-af61-14dbbae54f12
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 8af09075-fccc-4c2b-af61-14dbbae54f12;
	Wed, 25 Nov 2020 04:27:47 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C7C0720789;
	Wed, 25 Nov 2020 04:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606278467;
	bh=/lcIGplqn6odufkVeXSQ/3A4o3V3IGNc2rmyv6gS60M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=thMeD7fw10ItmbTZlWIPLwsKzJ86JzKQYQMwg+xxRnRmiHvKRndVNGYG5ipEZJiWe
	 l8Ek0n74OaUVlJChrmZugykQHs017rCcU48YkyoMJi/CJbdJTR/sPjE9IOpVDE2MFu
	 GHjcyf+1+H2xy4G7Dl8oVyM9JMB9EqZVvq1Bmme8=
From: Stefano Stabellini <sstabellini@kernel.org>
To: andrew.cooper3@citrix.com,
	cardoe@cardoe.com,
	wl@xen.org
Cc: sstabellini@kernel.org,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v3 01/12] automation: add a QEMU aarch64 smoke test
Date: Tue, 24 Nov 2020 20:27:34 -0800
Message-Id: <20201125042745.31986-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2011241722540.7979@sstabellini-ThinkPad-T480s>

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


