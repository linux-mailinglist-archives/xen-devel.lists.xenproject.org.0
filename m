Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E26406AD2DB
	for <lists+xen-devel@lfdr.de>; Tue,  7 Mar 2023 00:33:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.507157.780402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZKKX-0006Ce-BY; Mon, 06 Mar 2023 23:33:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 507157.780402; Mon, 06 Mar 2023 23:33:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pZKKX-0006AA-8k; Mon, 06 Mar 2023 23:33:21 +0000
Received: by outflank-mailman (input) for mailman id 507157;
 Mon, 06 Mar 2023 23:33:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xk/k=66=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pZKKW-00069I-68
 for xen-devel@lists.xenproject.org; Mon, 06 Mar 2023 23:33:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44ed0765-bc77-11ed-a550-8520e6686977;
 Tue, 07 Mar 2023 00:33:17 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 064B9B811C6;
 Mon,  6 Mar 2023 23:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14934C4339B;
 Mon,  6 Mar 2023 23:33:13 +0000 (UTC)
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
X-Inumbo-ID: 44ed0765-bc77-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678145594;
	bh=uhzeii5n7Qy0ZyMfDNous4nsNcRWOwJZPRNM3k7M6uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BA+31gx73s6hcDPRyQxLt+ODJdtzH4VusuOrN+MNmupVkbVvMB4SNLniUvl81z6bX
	 wcxU5hxYdUgmmiMjYK9jJFcy9gHYmskSmOp7H893G0wy4cdQNtOdm7Jh8gTMM7qnIK
	 tskmvRX1h6bBDNBdn5rXMgPy0vanj+KsJ/XO4DEUkgfyhSwKq5bzMS3SblzIIxL6lU
	 nQkXw2jQdNIbGKRu8D8L/OJizfUmaqLIzljJa1iK46n8jjk2yFmfwoBnVkZeDwh6QF
	 qqOp/8+gC9qvYQc5oM5tl1kF1WzkOIRxh+ZoHnYsmFuE9vlnibQ0AKuaJImk0Dp3cq
	 7SkSMdQ1dIOEg==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v3 2/2] automation: introduce a dom0less test run on Xilinx hardware
Date: Mon,  6 Mar 2023 15:33:10 -0800
Message-Id: <20230306233310.1993693-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2303061531240.863724@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2303061531240.863724@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@amd.com>

The test prepares dom0 and domU binaries and boot artifacts, similarly
to the existing QEMU test. (TBD: share preparation steps with the
regular QEMU tests.)

However, instead of running the test inside QEMU as usual, it copies
the binaries to the tftp server root, triggers a Xilinx ZCU102 board
reboot, and connects to the real serial of the board.

For now and due to its novelty, allow_failure on the Xilinx hardware
test, and only run the job on protected branches with XILINX_JOBS set to
true (the "master" and "staging" on gitlab.com/xen-project/xen qualify).

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- use a template to make it easier to create other xilinx jobs
- export dtbs as artifacts
- use 0x7ff00000 as MEMORY_END
- rename mpsoc.dtb to mpsoc_smmu.dtb
- add dtuart=serial0 to XEN_CMD
- stop the board after usage to save power

Changes in v2:
- only execute the xilinx job on protected branches with XILINX_JOBS set
to true
---
 automation/gitlab-ci/test.yaml                |  26 ++++
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 122 ++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100755 automation/scripts/xilinx-smoke-dom0less-arm64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1c5f400b68..61491cf2d6 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -67,6 +67,24 @@
   tags:
     - x86_64
 
+.xilinx-arm64:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: ubuntu:xenial-xilinx
+    LOGFILE: qemu-smoke-xilinx.log
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+      - '*.dtb'
+    when: always
+  allow_failure: true
+  only:
+    variables:
+      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+  tags:
+    - xilinx
+
 # Test jobs
 build-each-commit-gcc:
   extends: .test-jobs-common
@@ -85,6 +103,14 @@ build-each-commit-gcc:
   tags:
     - x86_64
 
+xilinx-smoke-dom0less-arm64-gcc:
+  extends: .xilinx-arm64
+  script:
+    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.12-gcc-arm64
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
new file mode 100755
index 0000000000..82158ab7ea
--- /dev/null
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -0,0 +1,122 @@
+#!/bin/bash
+
+set -ex
+
+test_variant=$1
+
+if [ -z "${test_variant}" ]; then
+    passed="ping test passed"
+    domU_check="
+until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
+    sleep 30
+done
+echo \"${passed}\"
+"
+fi
+
+# DomU
+mkdir -p rootfs
+cd rootfs
+tar xzf ../binaries/initrd.tar.gz
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+echo "#!/bin/sh
+
+${domU_check}
+/bin/sh" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+echo "rc_verbose=yes" >> etc/rc.conf
+find . | cpio -H newc -o | gzip > ../binaries/domU-rootfs.cpio.gz
+cd ..
+rm -rf rootfs
+
+# DOM0 rootfs
+mkdir -p rootfs
+cd rootfs
+tar xzf ../binaries/initrd.tar.gz
+mkdir proc
+mkdir run
+mkdir srv
+mkdir sys
+rm var/run
+cp -ar ../binaries/dist/install/* .
+
+echo "#!/bin/bash
+
+export LD_LIBRARY_PATH=/usr/local/lib
+bash /etc/init.d/xencommons start
+
+/usr/local/lib/xen/bin/init-dom0less
+
+brctl addbr xenbr0
+brctl addif xenbr0 eth0
+ifconfig eth0 up
+ifconfig xenbr0 up
+ifconfig xenbr0 192.168.0.1
+
+xl network-attach 1 type=vif
+${dom0_check}
+" > etc/local.d/xen.start
+chmod +x etc/local.d/xen.start
+echo "rc_verbose=yes" >> etc/rc.conf
+find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cd ..
+
+
+TFTP=/scratch/gitlab-runner/tftp
+START=`pwd`
+
+# ImageBuilder
+echo 'MEMORY_START="0"
+MEMORY_END="0x7ff00000"
+
+DEVICE_TREE="mpsoc_smmu.dtb"
+XEN="xen"
+DOM0_KERNEL="Image"
+DOM0_RAMDISK="dom0-rootfs.cpio.gz"
+XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1024M"
+
+NUM_DOMUS=1
+DOMU_KERNEL[0]="Image"
+DOMU_RAMDISK[0]="domU-rootfs.cpio.gz"
+DOMU_MEM[0]="1024"
+
+LOAD_CMD="tftpb"
+UBOOT_SOURCE="boot.source"
+UBOOT_SCRIPT="boot.scr"' > $TFTP/config
+
+cp -f binaries/xen $TFTP/
+cp -f binaries/Image $TFTP/
+cp -f binaries/dom0-rootfs.cpio.gz $TFTP/
+cp -f binaries/domU-rootfs.cpio.gz $TFTP/
+# export dtb to artifacts
+cp $TFTP/mpsoc_smmu.dtb .
+
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d $TFTP/ -c $TFTP/config
+
+# restart the board
+cd /scratch/gitlab-runner
+bash zcu102.sh 2
+sleep 5
+bash zcu102.sh 1
+sleep 5
+cd $START
+
+# connect to serial
+set +e
+stty -F /dev/ttyUSB0 115200
+timeout -k 1 120 nohup sh -c "cat /dev/ttyUSB0 | tee smoke.serial"
+
+# stop the board
+cd /scratch/gitlab-runner
+bash zcu102.sh 2
+cd $START
+
+set -e
+(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


