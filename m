Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 997375EA2D7
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 13:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411687.654713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocm4j-0000AW-TA; Mon, 26 Sep 2022 11:15:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411687.654713; Mon, 26 Sep 2022 11:15:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocm4j-00006O-OA; Mon, 26 Sep 2022 11:15:01 +0000
Received: by outflank-mailman (input) for mailman id 411687;
 Mon, 26 Sep 2022 11:14:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zqb/=Z5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oclvY-00019b-HL
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 11:05:32 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2089.outbound.protection.outlook.com [40.107.94.89])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22044c17-3d8b-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 13:05:31 +0200 (CEST)
Received: from MW4PR04CA0310.namprd04.prod.outlook.com (2603:10b6:303:82::15)
 by SJ1PR12MB6217.namprd12.prod.outlook.com (2603:10b6:a03:458::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Mon, 26 Sep
 2022 11:05:27 +0000
Received: from CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::cd) by MW4PR04CA0310.outlook.office365.com
 (2603:10b6:303:82::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 11:05:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT093.mail.protection.outlook.com (10.13.175.59) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 11:05:27 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 06:05:24 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 04:04:56 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 26 Sep 2022 06:04:33 -0500
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
X-Inumbo-ID: 22044c17-3d8b-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B2pyr5uWWlI01m43QVlqsCOonS/Y1Bu2i8sTeXed9jFG4w2tzIBNOOAY1b28BeM2lqeqsjKUiKHzW+V7+7dQl6n0XQI1X4xqf8/BLBpWJ0wCyPSc0+x/A1UBrawiDuhAcvqkmdSoF4xsagYl11CZ/XRm4iTO+b9eVjZz5PAEUhxWVjbZma0dd5NTkaT21VAfb85QyEYKLt+0oKNhA0e8RXTDsaorg3KQ4s8irK2H327zx6pUDSt7PgpJjjbJMJIXjJUXUGc1WXbdTId0jy5aVtK1c4SAh/u21OFU2zohHy6P6p9C8FHvAV+hPEiwx7Ax2rw7QkAy7Hi250Lio+uYgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vDkMoPV9kVsd1zqn5FqV9gc7xGiXRW41PFaT+D57pk=;
 b=ChHetdq2Rj5gn068n0RCG3vG34+UtYFuOvTe8inEimK8vHbR9mGRKRVEmzY+s5evDuHSLbhD0GKbS2OSgH4SakVCiPDUtppBqF020df4BVqB4cqIj61iSFIeZhEzoFOD2lmdFbOP38Mo4RImYSOLysv2R1StmnT5DUQBq4EzGZPVAgKrn7rnFXMHMZDFSH3Mazs0y16DSx1UohvXxpdElmSMIhTaayP9Zn4E+9ZzQ4t89svl5/Nloj/0piPgKVC+URzX/zoH1JyjCPOrFE9719sAQFmtY5g+g0aKs90szE248HzgH4gkBi8+R7gDz2u4xSArSHgzPwydId89ipip1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vDkMoPV9kVsd1zqn5FqV9gc7xGiXRW41PFaT+D57pk=;
 b=X1sDxpsSXXa1JyO0zf+4A1itMhWIwiMbS/GDbr4NrsgVHCwjGClvzqIdSw9+bkAZkf93k420/sWCbgzs9S9NUYpGXe2qEYOvUPp4xbaC2Aj0tBpPmYlwEOPI4cJR8pdiOmhX3SuhVNTnl3IdkKcewU0klkU5OZEmQM9gwY0eSLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 06/10] automation: qemu-smoke-arm32.sh: Modify script to use ImageBuilder
Date: Mon, 26 Sep 2022 13:04:19 +0200
Message-ID: <20220926110423.26030-7-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926110423.26030-1-michal.orzel@amd.com>
References: <20220926110423.26030-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT093:EE_|SJ1PR12MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: bd03a3ac-ec7e-455b-b8ea-08da9faf04fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WeQGSqP3E3j/3LKgaZai6DJypHpI5dFPRze7SLPg2SvW+XCT0tg12p9jR7Acf3ftl/cyBHXhoQRxgXUYoFEyoStUO8laOHIlBLNYHYBv0cwiFQ7LqZSxNM5Ww0D4IL4s39UQ86L8P6A931hv3QravYjUlNU4urQ/3u4yzpEv71D9r8roaKrZ7PELfSnFM6rPvCOSptMeFTyKLJx6ghbBn9GBfxx5tVRpi4FYUE0OboWA+/MB/UWbQnucIt2NRVK0ALyHaAM7fPj2oFAsxu4/SJz55vq02U7wqmzji8g0NRsHEN8Naf3UWZ/sUkCPFK/Yr11oS0znwddUXBx9swrpfMTJqSYiUQVPjvHk+QyjEZtvMVgyCiaqPUBQsXD8WK3Ah46tnnG3ZOpQYeHgpwGptG2dj5cm5onQ0zdYUpPG0OHMACwwKFFMwFHeRbN+32gsqUQ0XUXSzgHy5nkyTc/DaF2VhjlcdCd4nFibdfj0RYtgpKXIMDjS1TJdj0cbqAtbTck3AetpS7tOLzx8xF9bu60UwIaiUxphS8CzJZMxXxFL9SpiEEKLjeTiGE5FNZD+i4diErVF57358FQPw8PKSXOek2vRopTUdTlGBq/eMi6YHqe68spnczYR+ss4bcQcGIRd2G/+D4cy6SaM19pZl9irw7EBj4NCHr2Oa1XFiekxUO/WJBXIP4w2KTsnvYaejF6QWSKylxC+lJR2DsvLpPlhYaAOpHsci2wt2L9xmJB/F/i7mcEz1cyq7A9f4sNwUmiWo1yNX8rdxDBlGaczy7mpWNeGthD0hNx7NQIHuBJ9x1qPDZJ8cL4M9+hTlyDJ9UcUlIVHL/epBFZNJwMrFDvNbfDZfJQjxFlLQJ0h9RMxkyzVq+69/qjEI8T1/nTqBj3XIz8lMGToJXD/XTn9HmY59t0vNPEYlvurlDDsZ/U=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(8676002)(82310400005)(36860700001)(40460700003)(81166007)(356005)(40480700001)(82740400003)(70586007)(70206006)(36756003)(4326008)(41300700001)(44832011)(5660300002)(966005)(478600001)(26005)(6666004)(316002)(6916009)(54906003)(86362001)(1076003)(2616005)(426003)(186003)(336012)(47076005)(83380400001)(2906002)(8936002)(21314003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 11:05:27.6367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd03a3ac-ec7e-455b-b8ea-08da9faf04fe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT093.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6217

Take an example from arm64 qemu test scripts and use ImageBuilder
to generate u-boot script automatically. Calculating the addresses
manually is quite error prone and also we will be able to benefit
from using ImageBuilder when adding domUs to this test in the future.

Install and use u-boot from the debian package.
Modify the script so that binaries are loaded from u-boot via tftp.
Remove dtuart=/pl011@9000000 because stdout-path in QEMU dtb is always
set to pl011 node path.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
- add explanation in commit msg why we remove dtuart path
---
 automation/scripts/qemu-smoke-arm32.sh | 57 ++++++++++++--------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
index 530f3892fdd3..765facbe4d66 100755
--- a/automation/scripts/qemu-smoke-arm32.sh
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -4,7 +4,9 @@ set -ex
 
 export DEBIAN_FRONTENT=noninteractive
 apt-get -qy update
-apt-get -qy install --no-install-recommends device-tree-compiler \
+apt-get -qy install --no-install-recommends u-boot-qemu \
+                                            u-boot-tools \
+                                            device-tree-compiler \
                                             curl \
                                             cpio
 
@@ -20,10 +22,6 @@ tar xvzf ../initrd.tar.gz
 find . | cpio -H newc -o | gzip > ../initrd.gz
 cd ..
 
-kernel=`stat -L --printf="%s" vmlinuz`
-initrd=`stat -L --printf="%s" initrd.gz`
-
-# For Xen, we need a couple of more node. Dump the DT from QEMU and add them
 # XXX QEMU looks for "efi-virtio.rom" even if it is unneeded
 curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
 ./qemu-system-arm \
@@ -36,31 +34,31 @@ curl -fsSLO https://github.com/qemu/qemu/raw/v5.2.0/pc-bios/efi-virtio.rom
    -display none \
    -machine dumpdtb=virt.dtb
 
-dtc -I dtb -O dts virt.dtb > virt.dts
+# ImageBuilder
+echo 'MEMORY_START="0x40000000"
+MEMORY_END="0x80000000"
+
+DEVICE_TREE="virt.dtb"
+XEN="xen"
+DOM0_KERNEL="vmlinuz"
+DOM0_RAMDISK="initrd.gz"
+DOM0_CMD="console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh"
+XEN_CMD="console=dtuart dom0_mem=512M bootscrub=0"
+
+NUM_DOMUS=0
+
+LOAD_CMD="tftpb"
+BOOT_CMD="bootm"
+UBOOT_SOURCE="boot.source"
+UBOOT_SCRIPT="boot.scr"' > config
 
-cat >> virt.dts << EOF
-/ {
-	chosen {
-		#address-cells = <0x2>;
-		#size-cells = <0x2>;
-		stdout-path = "/pl011@9000000";
-        xen,xen-bootargs = "console=dtuart dtuart=/pl011@9000000 dom0_mem=512M bootscrub=0";
-		xen,dom0-bootargs = "console=tty0 console=hvc0 earlyprintk clk_ignore_unused root=/dev/ram0 rdinit=/bin/sh";
-		dom0 {
-			compatible = "xen,linux-zimage", "xen,multiboot-module";
-			reg = <0x0 0x1000000 0x0 $kernel>;
-		};
-        dom0-ramdisk {
-			compatible = "xen,linux-initrd", "xen,multiboot-module";
-			reg = <0x0 0x3200000 0x0 $initrd>;
-		};
-	};
-};
-EOF
-dtc -I dts -O dtb virt.dts > virt.dtb
+rm -rf imagebuilder
+git clone https://gitlab.com/ViryaOS/imagebuilder
+bash imagebuilder/scripts/uboot-script-gen -t tftp -d . -c config
 
 rm -f smoke.serial
 set +e
+echo "  virtio scan; dhcp; tftpb 0x40000000 boot.scr; source 0x40000000"| \
 timeout -k 1 240 \
 ./qemu-system-arm \
    -machine virt \
@@ -70,11 +68,10 @@ timeout -k 1 240 \
    -serial stdio \
    -monitor none \
    -display none \
-   -dtb virt.dtb \
    -no-reboot \
-   -kernel ./xen \
-   -device loader,file=./vmlinuz,addr=0x1000000 \
-   -device loader,file=./initrd.gz,addr=0x3200000 |& tee smoke.serial
+   -device virtio-net-pci,netdev=n0 \
+   -netdev user,id=n0,tftp=./ \
+   -bios /usr/lib/u-boot/qemu_arm/u-boot.bin |& tee smoke.serial
 
 set -e
 (grep -q "^/ #" smoke.serial) || exit 1
-- 
2.25.1


