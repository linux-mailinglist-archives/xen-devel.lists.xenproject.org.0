Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 360046AA603
	for <lists+xen-devel@lfdr.de>; Sat,  4 Mar 2023 01:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.506266.779413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYFLK-0004cO-SU; Sat, 04 Mar 2023 00:01:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 506266.779413; Sat, 04 Mar 2023 00:01:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pYFLK-0004Y9-OG; Sat, 04 Mar 2023 00:01:42 +0000
Received: by outflank-mailman (input) for mailman id 506266;
 Sat, 04 Mar 2023 00:01:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eaR=64=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pYFLJ-0004VH-Aq
 for xen-devel@lists.xenproject.org; Sat, 04 Mar 2023 00:01:41 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc57426c-ba1f-11ed-a550-8520e6686977;
 Sat, 04 Mar 2023 01:01:39 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3340E61982;
 Sat,  4 Mar 2023 00:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D776DC433D2;
 Sat,  4 Mar 2023 00:01:36 +0000 (UTC)
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
X-Inumbo-ID: bc57426c-ba1f-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677888097;
	bh=+phEMi9uJWD5eDQu2N3CbwqTH5dCe79zdlh6yAq9uFg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H/cnVwZDFDvAblgP8B5VpCQj+X8FQe04+PG4AK7HB0al2j6LcvvXz7bWVpKQEY/Kj
	 CUZAjqDSro4NtdtXrjnGfcwfGfPOduMlZnBcTOjJ6IfY0NG3HeXG9ke+3siDGSWpmJ
	 WMdkI6UuVp1cMYa7il4CYb4ARrpk9Ap1LH14QqGX51bFOot59ZedCdBkMRxtJrRCo1
	 JUvpa+MrVth/keO+OzezlATF/hsWAj+japn900H+JdTcbj1aKqv0p9WTI3eEhRS3J4
	 aMNfZixZc/tdWvAKTNIt+7PGyxlP+w/vAHvMul9SSVnXwmePNOUO3UCYQTafBmFJai
	 ksXB1mUFLZfvQ==
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	cardoe@cardoe.com,
	michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v2 2/2] automation: introduce a dom0less test run on Xilinx hardware
Date: Fri,  3 Mar 2023 15:57:19 -0800
Message-Id: <20230303235719.1181690-2-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2303031554080.863724@ubuntu-linux-20-04-desktop>
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
Changes in v2:
- only execute the xilinx job on protected branches with XILINX_JOBS set
to true
---
 automation/gitlab-ci/test.yaml                |  22 ++++
 .../scripts/xilinx-smoke-dom0less-arm64.sh    | 115 ++++++++++++++++++
 2 files changed, 137 insertions(+)
 create mode 100755 automation/scripts/xilinx-smoke-dom0less-arm64.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index 1c5f400b68..8f94cad32c 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -85,6 +85,28 @@ build-each-commit-gcc:
   tags:
     - x86_64
 
+xilinx-smoke-dom0less-arm64-gcc:
+  extends: .test-jobs-common
+  variables:
+    CONTAINER: ubuntu:xenial-xilinx
+    LOGFILE: qemu-smoke-xilinx.log
+  artifacts:
+    paths:
+      - smoke.serial
+      - '*.log'
+    when: always
+  tags:
+    - xilinx
+  script:
+    - ./automation/scripts/xilinx-smoke-dom0less-arm64.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm64-test-needs
+    - alpine-3.12-gcc-arm64
+  allow_failure: true
+  only:
+    variables:
+      - $XILINX_JOBS == "true" && $CI_COMMIT_REF_PROTECTED == "true"
+
 qemu-smoke-dom0-arm64-gcc:
   extends: .qemu-arm64
   script:
diff --git a/automation/scripts/xilinx-smoke-dom0less-arm64.sh b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
new file mode 100755
index 0000000000..180c8b5f1c
--- /dev/null
+++ b/automation/scripts/xilinx-smoke-dom0less-arm64.sh
@@ -0,0 +1,115 @@
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
+MEMORY_END="0xC0000000"
+
+DEVICE_TREE="mpsoc.dtb"
+XEN="xen"
+DOM0_KERNEL="Image"
+DOM0_RAMDISK="dom0-rootfs.cpio.gz"
+XEN_CMD="console=dtuart dom0_mem=1024M"
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
+set -e
+(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


