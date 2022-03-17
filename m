Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF8A4DBC9B
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 02:47:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291309.494381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUfED-0003lb-Sn; Thu, 17 Mar 2022 01:47:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291309.494381; Thu, 17 Mar 2022 01:47:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUfED-0003iM-PJ; Thu, 17 Mar 2022 01:47:01 +0000
Received: by outflank-mailman (input) for mailman id 291309;
 Thu, 17 Mar 2022 01:46:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbXJ=T4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nUfEB-0003RA-Hx
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 01:46:59 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21275354-a594-11ec-8eba-a37418f5ba1a;
 Thu, 17 Mar 2022 02:46:58 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A697860B38;
 Thu, 17 Mar 2022 01:46:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCE81C36AE2;
 Thu, 17 Mar 2022 01:46:55 +0000 (UTC)
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
X-Inumbo-ID: 21275354-a594-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1647481616;
	bh=G1Wy2NSZrz87jgZI1YnX2YFk559ZAdmMFvJt2aVzrpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cfs9H/ois/FiUrsGhlwCj4/Ks1XAgseJTEvANktBADmp6zUgqDn8T5Fo3c8psxmel
	 7yXAWtc6IY5hkDZDMhUy2GBEvOK6GwG8izMwVx54dPA/R4h9KUEksJd3gklJ4jic4X
	 NPoad+oRnDDPb0wUc9tGS99b+crXAiwfXJ6k2lx/l6h3L2at3SiWtvKAEU7HSyo+J+
	 pRjPlaq05VRg8/u4Izxp0JOZaqmEYlr/tiVA0TwoY78qLzsOJtRUk0MurwyryqbPyE
	 NuVZtvyCM7TXm921fB2y+cVE6D3NGro+2AsU3HzslCli9gbofkJhWw9xDOU5GL+4W8
	 vAAjBTglC39Ig==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	wl@xen.org,
	andrew.cooper3@citrix.com,
	anthony.perard@citrix.com,
	bertrand.marquis@arm.com,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH v2 2/2] gitlab-ci: add an ARM32 qemu-based smoke test
Date: Wed, 16 Mar 2022 18:46:53 -0700
Message-Id: <20220317014653.2427386-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2203161843230.3497@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2203161843230.3497@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a minimal ARM32 smoke test based on qemu-system-arm, as provided by
the test-artifacts qemu container. The minimal test simply boots Xen
(built from previous build stages) and Dom0. The test is fetching the
Dom0 kernel and initrd from Debian Jessie: they work just fine and this
way we don't have to maintain a build for them too.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

---
Changes in v2:
- improve comments
- don't limit dom0 cpus
- decrease mem to 1024M and dom0_mem=512M
- use Debian Bullseye instead of Jessie
---
 automation/gitlab-ci/test.yaml         | 23 ++++++++
 automation/scripts/qemu-smoke-arm32.sh | 72 ++++++++++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-arm32.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ec2a2e1607..42cd725a12 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -95,6 +95,29 @@ qemu-smoke-arm64-gcc:
     - /^coverity-tested\/.*/
     - /^stable-.*/
 
+qemu-smoke-arm32-gcc:
+  stage: test
+  image: registry.gitlab.com/xen-project/xen/${CONTAINER}
+  variables:
+    CONTAINER: debian:unstable-arm64v8
+  script:
+    - ./automation/scripts/qemu-smoke-arm32.sh 2>&1 | tee qemu-smoke-arm32.log
+  dependencies:
+    - debian-unstable-gcc-arm32
+    - qemu-system-aarch64-6.0.0-arm32-export
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
diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
new file mode 100755
index 0000000000..11883bed3c
--- /dev/null
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -0,0 +1,72 @@
+#!/bin/bash
+
+set -ex
+
+export DEBIAN_FRONTENT=noninteractive
+apt-get -qy update
+apt-get -qy install --no-install-recommends device-tree-compiler \
+                                            curl
+
+cd binaries
+curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/vmlinuz
+curl -fsSLO http://http.us.debian.org/debian/dists/jessie/main/installer-armhf/current/images/netboot/initrd.gz
+
+kernel=`stat -L --printf="%s" vmlinuz`
+initrd=`stat -L --printf="%s" initrd.gz`
+
+# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./qemu-system-arm \
+   -machine virt-6.0 \
+   -machine virtualization=true \
+   -smp 4 \
+   -m 1024 \
+   -serial stdio \
+   -monitor none \
+   -display none \
+   -machine dumpdtb=virt.dtb
+
+dtc -I dtb -O dts virt.dtb > virt.dts
+
+cat >> virt.dts << EOF
+/ {
+	chosen {
+		#address-cells = <0x2>;
+		#size-cells = <0x2>;
+		stdout-path = "/pl011@9000000";
+        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=512M bootscrub=0";
+		xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh init=/bin/sh";
+		dom0 {
+			compatible = "xen,linux-zimage", "xen,multiboot-module";
+			reg = <0x0 0x1000000 0x0 $kernel>;
+		};
+        dom0-ramdisk {
+			compatible = "xen,linux-initrd", "xen,multiboot-module";
+			reg = <0x0 0x3200000 0x0 $initrd>;
+		};
+	};
+};
+EOF
+dtc -I dts -O dtb virt.dts > virt.dtb
+
+rm -f smoke.serial
+set +e
+timeout -k 1 240 \
+./qemu-system-arm \
+   -machine virt-6.0 \
+   -machine virtualization=true \
+   -smp 4 \
+   -m 1024 \
+   -serial stdio \
+   -monitor none \
+   -display none \
+   -dtb virt.dtb \
+   -no-reboot \
+   -kernel ./xen \
+   -device loader,file=./vmlinuz,addr=0x1000000 \
+   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
+
+set -e
+(grep -q "^BusyBox" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


