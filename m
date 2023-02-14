Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E76696842
	for <lists+xen-devel@lfdr.de>; Tue, 14 Feb 2023 16:39:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.495216.765521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOV-00022K-88; Tue, 14 Feb 2023 15:38:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 495216.765521; Tue, 14 Feb 2023 15:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRxOU-0001s6-Ut; Tue, 14 Feb 2023 15:38:58 +0000
Received: by outflank-mailman (input) for mailman id 495216;
 Tue, 14 Feb 2023 15:38:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xrib=6K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pRxOS-0001Wo-LF
 for xen-devel@lists.xenproject.org; Tue, 14 Feb 2023 15:38:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe59::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ada5c1cc-ac7d-11ed-93b5-47a8fe42b414;
 Tue, 14 Feb 2023 16:38:51 +0100 (CET)
Received: from BN0PR04CA0060.namprd04.prod.outlook.com (2603:10b6:408:e8::35)
 by CH0PR12MB8530.namprd12.prod.outlook.com (2603:10b6:610:188::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.24; Tue, 14 Feb
 2023 15:38:49 +0000
Received: from BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::6c) by BN0PR04CA0060.outlook.office365.com
 (2603:10b6:408:e8::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26 via Frontend
 Transport; Tue, 14 Feb 2023 15:38:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT114.mail.protection.outlook.com (10.13.177.46) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6086.24 via Frontend Transport; Tue, 14 Feb 2023 15:38:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Feb
 2023 09:38:48 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 14 Feb 2023 09:38:47 -0600
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
X-Inumbo-ID: ada5c1cc-ac7d-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BF5LUlnLZeDKb1dPvjs9bGBH1HIAYaIW031oJAxemT+tLUngvPI1V4uil/vn9ghsVnE4BjfqTrY4xLSG5lvILXgtxk+ztagkdDmP/607RM+V8Y4YU2gfz7WPBDFoKru1/GGAECnJ5ibwPFXIqtRPiJCQz7VVol765d9jSAtiAFZ2O9H6CscYDsw9JIo6x+uC4QR/Fpv88DdUt6ah+uZ1ZUocOsEV9fbEgPFE2BXeeUsrKHe8LAjnR0V3WTpDK1NKKgkPIXg/A/hQTLTB/oO42NzKO+AbAYaTc7xjiVPQh2VWQwxV7YzgJ7fyuTf1ntEH/X7vJBYgCbIIDjcXHhBVIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TzwAM6S/ZDvUz+GhVuoZK+2MU6N8kVAHfsdpOWO3UmA=;
 b=XYvu+QaWaznZ85rCfYJ5T9WTFrx7GCtk+h2ZHlh+M78H2L4jVHeqeGAfqanusmbI3nuF0IvZYUjre4jxZyaRN3UILeMuwP3NLLzWWiqVaI063DkgAwIMxsNEEujC0ErjquAux+sNG22uIfso8mJ/4X19iQKDa7WqHFQTNBVG0V2gl96w2uwkC0nj8s4drfe0yuootf2s5wJxW/Kybsn+Mfirp9oTpEFfJGYLuZL1BZnOWfuHU3JLnadCzpPp9mzvoxzU0T6vCzGgxRBvcOU7n8QFpp9EzipnXf1YW7ua1Pw508nPAAQDIvtx7iVR/eaDcbc3o9w/75XXNPSf63sFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TzwAM6S/ZDvUz+GhVuoZK+2MU6N8kVAHfsdpOWO3UmA=;
 b=btNP785clnkVLCGWypCHINfsJHVFsuqw0/7MgNYaFCo3PZZu/OBrCXAc2ON/PSrKxtm0TgYQ6rEleddmob+RGJ5UWyGhoT3dEEB/85rIF/yMtbsxXcHsYOFOcibGLVd1TvNK1KHJy4fXVqPes3i5EI5oOP7bCj+2BFgIOJFnbes=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/5] automation: Add arm32 dom0less testing
Date: Tue, 14 Feb 2023 16:38:39 +0100
Message-ID: <20230214153842.15637-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230214153842.15637-1-michal.orzel@amd.com>
References: <20230214153842.15637-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT114:EE_|CH0PR12MB8530:EE_
X-MS-Office365-Filtering-Correlation-Id: 55d2efce-5a7a-4867-395a-08db0ea19100
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	36kciKjGiw4YZnxNNGTb6QFwXu88MwyAkFt5pd77bSi0hsynGQ/XhDilxS/s9O7fSZvPUtHooyeT9xN+n95I+0RfJM+YD5BYyP4XiY4SILLaXxw1G16MFPj9h453s85YD7tbnG/wUtIBscGi0pWIL1JI2DGPcjeMalO4ZKPiX9pdhrGw+Hzz1rq8EEkMoDVj8MiFJntNIMYfluF8BzIcOdJ3NnIsYETDD1Iw6E/Koq3wGMfr1EgJTJoIBewkX2so2MZ/77NZIhnMznDJkDoInc2PnAX+yVDzUztNr6GboItyp50kcxgVWocQbDfzRHG6Q5L5H9Zyc5/1lFpad8ZdK9Z74lzpqEujZQC9tJDYPESHdOD2LF43SMbUqdASdurXTjFvvFyUPuTnjtf5ued3DtKx684RcgWS2lnC4t+GVgXsnkWJkN4Dc2ZCecAY4n7MdcjFMMcou6FaN2BwZ11dQ/A2hGT2F7t4XYXxk92OBgh5Nlypvn0WOKQPexQRyQbdMoWzktvegZlKLttAdoufxFFjLBWN/xYMNOEOPZlM8ePoITu9uta9/b9/dpwNpVARgXjp7vvK9/mTsR9dxPpKyI1Tm4s1CSRpKSD3ilCw9sjkkU2nZEOdfX+hkwMwuSDfjrCHoSe7uCh/JEgfblfcemGrTbDoAx/Nm5eqUZc4MmB708NVGvYNBxZJn9BNzwCgpB0pJHJRiBfn7Ic2Sjrf6eXLFhhALst3IvLxu9cP/8JjB8mb4OOBCD1ToTAMIz5UE9gQOza+CPziTTCAW60GsehOAkShSN8qFxrRmBbscNGnpen8sRhO+Fu7Ikd/RmqbJaucFRqTlNE0qHjLByjjzA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199018)(40470700004)(36840700001)(46966006)(26005)(186003)(2616005)(6666004)(316002)(478600001)(336012)(966005)(70206006)(70586007)(8676002)(4326008)(54906003)(356005)(83380400001)(1076003)(5660300002)(36860700001)(8936002)(44832011)(41300700001)(82740400003)(2906002)(81166007)(6916009)(82310400005)(86362001)(36756003)(426003)(47076005)(40460700003)(40480700001)(32563001)(21314003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2023 15:38:48.7822
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55d2efce-5a7a-4867-395a-08db0ea19100
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8530

At the moment, we only perform a single arm32 test in our CI, checking
whether dom0 boots successfully or not. This is mostly because we do not
have any arm32 runners and we only execute a hypervisor only build.

In order not to leave the arm32 testing in such a poor state, add a
script qemu-smoke-dom0less-arm32.sh to start testing dom0less
configuration, while keeping dom0 to make the test more interesting.

The script is mostly based on the one used for dom0 arm32 testing as well
as the one used for dom0less arm64 testing. We obtain Debian Bullseye
kernel and Alpine Linux busybox-based rootfs. Depending on the test
variant, we prepare a test case contained within domU_check variable,
that will be executed as part of /init script from domU rootfs.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - keep dom0 around by default to make tests more interesting
---
 automation/gitlab-ci/test.yaml                | 16 +++
 .../scripts/qemu-smoke-dom0less-arm32.sh      | 99 +++++++++++++++++++
 2 files changed, 115 insertions(+)
 create mode 100755 automation/scripts/qemu-smoke-dom0less-arm32.sh

diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.yaml
index ce543ef5c0ef..84ab1fee50a4 100644
--- a/automation/gitlab-ci/test.yaml
+++ b/automation/gitlab-ci/test.yaml
@@ -210,6 +210,22 @@ qemu-smoke-dom0-arm32-gcc-debug:
     - *arm32-test-needs
     - debian-unstable-gcc-arm32-debug
 
+qemu-smoke-dom0less-arm32-gcc:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32
+
+qemu-smoke-dom0less-arm32-gcc-debug:
+  extends: .qemu-arm32
+  script:
+    - ./automation/scripts/qemu-smoke-dom0less-arm32.sh 2>&1 | tee ${LOGFILE}
+  needs:
+    - *arm32-test-needs
+    - debian-unstable-gcc-arm32-debug
+
 qemu-alpine-x86_64-gcc:
   extends: .qemu-x86-64
   script:
diff --git a/automation/scripts/qemu-smoke-dom0less-arm32.sh b/automation/scripts/qemu-smoke-dom0less-arm32.sh
new file mode 100755
index 000000000000..e3f2b28f3f89
--- /dev/null
+++ b/automation/scripts/qemu-smoke-dom0less-arm32.sh
@@ -0,0 +1,99 @@
+#!/bin/bash
+
+set -ex
+
+test_variant=$1
+
+# Prompt to grep for to check if dom0 booted successfully
+dom0_prompt="^/ #"
+
+cd binaries
+# Use the kernel from Debian
+curl --fail --silent --show-error --location --output vmlinuz https://deb.debian.org/debian/dists/bullseye/main/installer-armhf/current/images/netboot/vmlinuz
+# Use a tiny initrd based on busybox from Alpine Linux
+curl --fail --silent --show-error --location --output initrd.tar.gz https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/armhf/alpine-minirootfs-3.15.1-armhf.tar.gz
+
+if [ -z "${test_variant}" ]; then
+    passed="generic test passed"
+    domU_check="
+echo \"${passed}\"
+"
+fi
+
+# dom0/domU rootfs
+# We are using the same rootfs for dom0 and domU. The only difference is
+# that for the former, we set explictly rdinit to /bin/sh, whereas for the
+# latter we rely on using custom /init script with test case inside.
+mkdir rootfs
+cd rootfs
+tar xvzf ../initrd.tar.gz
+echo "#!/bin/sh
+
+mount -t proc proc /proc
+mount -t sysfs sysfs /sys
+mount -t devtmpfs devtmpfs /dev
+${domU_check}
+/bin/sh" > init
+chmod +x init
+find . | cpio -H newc -o | gzip > ../initrd.gz
+cd ..
+
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./qemu-system-arm \
+    -machine virt \
+    -machine virtualization=true \
+    -smp 4 \
+    -m 2048 \
+    -serial stdio \
+    -monitor none \
+    -display none \
+    -machine dumpdtb=virt.dtb
+
+# ImageBuilder
+echo 'MEMORY_START="0x40000000"
+MEMORY_END="0xC0000000"
+
+DEVICE_TREE="virt.dtb"
+XEN="xen"
+XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
+
+DOM0_KERNEL="vmlinuz"
+DOM0_RAMDISK="initrd.gz"
+DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
+
+DOMU_KERNEL[0]="vmlinuz"
+DOMU_RAMDISK[0]="initrd.gz"
+DOMU_MEM[0]="512"
+NUM_DOMUS=1
+
+LOAD_CMD="tftpb"
+BOOT_CMD="bootm"
+UBOOT_SOURCE="boot.source"
+UBOOT_SCRIPT="boot.scr"' > config
+
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
+
+# Run the test
+rm -f smoke.serial
+set +e
+echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
+timeout -k 1 240 \
+./qemu-system-arm \
+    -machine virt \
+    -machine virtualization=true \
+    -smp 4 \
+    -m 2048 \
+    -serial stdio \
+    -monitor none \
+    -display none \
+    -no-reboot \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=./ \
+    -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
+
+set -e
+(grep -q "${dom0_prompt}" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


