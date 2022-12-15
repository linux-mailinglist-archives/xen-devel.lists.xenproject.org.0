Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0EA64DDC7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:26:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463506.721718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5q7P-0003KG-Or; Thu, 15 Dec 2022 15:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463506.721718; Thu, 15 Dec 2022 15:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5q7P-0003G2-HD; Thu, 15 Dec 2022 15:25:55 +0000
Received: by outflank-mailman (input) for mailman id 463506;
 Thu, 15 Dec 2022 15:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GeMf=4N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p5q7N-0002YW-EW
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 15:25:53 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2043.outbound.protection.outlook.com [40.107.94.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1f73d2b-7c8c-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 16:25:52 +0100 (CET)
Received: from BN0PR03CA0023.namprd03.prod.outlook.com (2603:10b6:408:e6::28)
 by SJ0PR12MB5439.namprd12.prod.outlook.com (2603:10b6:a03:3ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Thu, 15 Dec
 2022 15:25:49 +0000
Received: from BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e6:cafe::21) by BN0PR03CA0023.outlook.office365.com
 (2603:10b6:408:e6::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 15:25:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT078.mail.protection.outlook.com (10.13.176.251) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 15:25:48 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 09:25:47 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 09:25:46 -0600
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
X-Inumbo-ID: c1f73d2b-7c8c-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L59GIFICFXtX8v1xb/zrYTvh3drzdvsmiJyhKivPWPZnfxBg5C1mTbDJwVW5V/nBbftolSrkpoJp7GEf5jlhauegiyEJIofWrVLW4u5vU24wvFVv2pJ00F+QfQpvIFOV/r6zEeNO7Xfw9bsQS6ETtNnqcexFJN2smrWVgF1k2JXuXkH25SiRh5TdrpzuBkuFGgwvJqGwHK7ArxeIePD4FGw585mrCcx9HU3JYVlx9JURSIsXafxQJhpdn9CVh3LhI1wdcKQ1Z8O7AdMWBSLpoCjm03vh+F6KnIx6w257L0vTOW+NsgBQgMtbkwvc9+btnIAzd8XSrcQYAQs/2wj3wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y0MT5BBq9QYEYB/tP9cdS7QHAMBvjlEG62WveeU6DQc=;
 b=aFSDUHef15ztioJL79sfsY0svEhJk/q1GYrQxcTeQof8a7QCHZt1GOXbSsLXyFWUNIJCWhYFJnqVm1/s24lm/EcYq+pbrprKDW9PzNrlwdU+A4JFPc1acoK1jLQmB18gYzkplwIPV1iA320kqqjDdQUIW57Ra9Q8bNb2MW97wION2wC8EEmwvvfoQM/Dgq/wWqLcgFoqtQeY+TULR0GW7/A95NsugEdKyB7VLPWzlkveZZ3fulnb42KYVIGubFpVuJjJrp7mVSqF7En2wUyuAmrvTqD+xJ08gt4ucCwSpkWC2flWXsvbXii3VFY5244n88dqBgZeq1D+b92eLr0vPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0MT5BBq9QYEYB/tP9cdS7QHAMBvjlEG62WveeU6DQc=;
 b=hRyvh3R/6XP7uodYC5GTLzKLV+5B0N/W8s3lQfhHfgYmHpNtGcHliARDhpi/k/4elFyrcBz5XePoqbHtaKPn+HQuW+nuj9E//kODa5gvonQzHIDRDkoaympFfulcs5qRCTJchQy9iePkKRH3bd9QAUHhfk1Ed5aucZvzm+Uzs2s=
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
Subject: [PATCH 1/2] automation: Add support for using XTF for arm64 testing
Date: Thu, 15 Dec 2022 16:25:37 +0100
Message-ID: <20221215152538.10266-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221215152538.10266-1-michal.orzel@amd.com>
References: <20221215152538.10266-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT078:EE_|SJ0PR12MB5439:EE_
X-MS-Office365-Filtering-Correlation-Id: 2dda3fa3-0b39-425d-fdc5-08dadeb0a4bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	g3elBktcESHuhZ+HBFO1pnDrv1BKfoK3xAWN1XQ16vqisnk8V8E8sbFtp7jfB+WHOjKiys9+Ajpicq36h3cs88IrQmDxYj6Kn8GzSufGrENuS2LrVK0Wwswhs/DbgYEI+FNuHcGOYM7J8tdqn7BXbCa8j+oxpolJz3C/9ed6474ChqBarurImtkHM/TU2xB8eJGFTQ7CvQ2nySL6+fvzSckgaDrEYNI5hXwFZt9sBnvwPlSwKJuJrsfDRtZT9+7RJvb41YLk2pDat01HOzNjZankRukzZYuwd2hfCRJSODvwkxykLvHZwktttUCxhbxbq2mSRKVzZAy9nCyl3ucLGu5xUCm5zeb7aUiRaSXfk6IMY+lnGewy3PphJfr7j6bPNMlkO/m15ekgYoqu6RgKr+RqFl84gFNkW62kCvs9A6XLXiddDfM+alLaC9qJk5tc0NW9nHWRTd99x8y4h7dgqOlilIpavVxQDfybFR/PjZeRn2hoZ+txTb6dMWqFxgJuJrQcc30sjb3TqQ3OJL0WqXav1UeEXV6vUL+FKOWCwl42oVaThXQqwnTGDHFtJyIqDeHa54L25GUe2w0HxSf5iNM/DjBeCWAmqQEjLMJwU8xH3ntK7v8eF9QfwB+ss3K+ytgY79BVwyfabkwq+PgrE9hRCSX821/kIEhCAov2KzFmrGzGn0VZt31ceI4TtpOkOZd010tHqywal6qvf3cun6LM0VoLoiE6Du34STYSpxMwxexDVyOzRcTIHZNynL4x9M8jkJt2sFPwXpmQU0l7PqUKVjpJ93A7UFXnaxrFVB8f6cu6USqtBOGgmJ5Vn5g71DR/w54KHIwz1AibWJjO4KFsNlDzBJcL5QSCRZeGeDQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(6666004)(40480700001)(2616005)(70206006)(66899015)(8676002)(4326008)(356005)(81166007)(478600001)(82740400003)(70586007)(316002)(83380400001)(36756003)(966005)(1076003)(44832011)(2906002)(86362001)(41300700001)(82310400005)(336012)(40460700003)(36860700001)(426003)(26005)(47076005)(186003)(8936002)(5660300002)(6916009)(54906003)(21314003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:25:48.5271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2dda3fa3-0b39-425d-fdc5-08dadeb0a4bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5439

Introduce support for using XTF on Arm to perform low-level testing.
For the purpose of the CI testing, let's use the fork [1] from upstream
XTF with implemented support for arm64 (the upstream XTF only supports
x86).

Add a new script under automation/scripts to be used by the CI XTF test
jobs to perform the following tasks:
 - Compiling XTF,
 - Creating dom0 rootfs,
 - Generating u-boot script using ImageBuilder,
 - Running Xen with Linux as dom0 and XTF as a dom0less domU using Qemu,
 - Checking test result.

The script takes the name of the XTF test to run as a first parameter.

[1] https://gitlab.com/xen-project/fusa/xtf.git (branch xtf-arm)

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 automation/scripts/qemu-xtf-dom0less-arm64.sh | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100755 automation/scripts/qemu-xtf-dom0less-arm64.sh

diff --git a/automation/scripts/qemu-xtf-dom0less-arm64.sh b/automation/scripts/qemu-xtf-dom0less-arm64.sh
new file mode 100755
index 000000000000..321d1abc543b
--- /dev/null
+++ b/automation/scripts/qemu-xtf-dom0less-arm64.sh
@@ -0,0 +1,97 @@
+#!/bin/bash
+
+set -ex
+
+# Name of the XTF test
+xtf_test=$1
+
+# Message returned by XTF in case of success
+passed="Test result: SUCCESS"
+
+# XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
+curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
+./binaries/qemu-system-aarch64 \
+   -machine virtualization=true \
+   -cpu cortex-a57 -machine type=virt \
+   -m 2048 -smp 2 -display none \
+   -machine dumpdtb=binaries/virt-gicv2.dtb
+
+# XXX disable pl061 to avoid Linux crash
+fdtput binaries/virt-gicv2.dtb -p -t s /pl061@9030000 status disabled
+
+# XTF
+# Build a single XTF test passed as a first parameter to the script.
+# Build XTF with GICv2 support to match Qemu configuration and with SBSA UART
+# support, so that the test will use an emulated UART for printing messages.
+# This will allow us to run the test on both debug and non-debug Xen builds.
+rm -rf xtf
+git clone https://gitlab.com/xen-project/fusa/xtf.git -b xtf-arm
+make -C xtf TESTS=tests/${xtf_test} CONFIG_SBSA_UART=y CONFIG_GICV2=y -j$(nproc)
+cp xtf/tests/${xtf_test}/test-mmu64le-${xtf_test} binaries/xtf-test
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
+" > etc/local.d/xen.start
+
+chmod +x etc/local.d/xen.start
+echo "rc_verbose=yes" >> etc/rc.conf
+find . | cpio -H newc -o | gzip > ../binaries/dom0-rootfs.cpio.gz
+cd ..
+
+# ImageBuilder
+echo 'MEMORY_START="0x40000000"
+MEMORY_END="0xC0000000"
+
+XEN="xen"
+DEVICE_TREE="virt-gicv2.dtb"
+
+DOM0_KERNEL="Image"
+DOM0_RAMDISK="dom0-rootfs.cpio.gz"
+XEN_CMD="console=dtuart dom0_mem=512M"
+
+DOMU_KERNEL[0]="xtf-test"
+DOMU_MEM[0]="128"
+
+NUM_DOMUS=1
+
+LOAD_CMD="tftpb"
+UBOOT_SOURCE="boot.source"
+UBOOT_SCRIPT="boot.scr"' > binaries/config
+
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d binaries/ -c binaries/config
+
+# Run the test
+rm -f smoke.serial
+set +e
+echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
+timeout -k 1 240 \
+./binaries/qemu-system-aarch64 \
+    -machine virtualization=true \
+    -cpu cortex-a57 -machine type=virt \
+    -m 2048 -monitor none -serial stdio \
+    -smp 2 \
+    -no-reboot \
+    -device virtio-net-pci,netdev=n0 \
+    -netdev user,id=n0,tftp=binaries \
+    -bios /usr/lib/u-boot/qemu_arm64/u-boot.bin |& tee smoke.serial
+
+set -e
+(grep -q "^Welcome to Alpine Linux" smoke.serial && grep -q "${passed}" smoke.serial) || exit 1
+exit 0
-- 
2.25.1


