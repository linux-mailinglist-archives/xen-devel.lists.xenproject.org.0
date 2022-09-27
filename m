Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D625EBEF1
	for <lists+xen-devel@lfdr.de>; Tue, 27 Sep 2022 11:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.412371.655706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bv-0007dM-Qk; Tue, 27 Sep 2022 09:47:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 412371.655706; Tue, 27 Sep 2022 09:47:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1od7Bv-0007YI-G9; Tue, 27 Sep 2022 09:47:51 +0000
Received: by outflank-mailman (input) for mailman id 412371;
 Tue, 27 Sep 2022 09:47:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yjFy=Z6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1od7Bt-00061O-C4
 for xen-devel@lists.xenproject.org; Tue, 27 Sep 2022 09:47:49 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2081.outbound.protection.outlook.com [40.107.102.81])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71d0adcd-3e49-11ed-9648-05401a9f4f97;
 Tue, 27 Sep 2022 11:47:48 +0200 (CEST)
Received: from BN9P221CA0021.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::15)
 by SN7PR12MB6911.namprd12.prod.outlook.com (2603:10b6:806:261::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Tue, 27 Sep
 2022 09:47:45 +0000
Received: from BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::a2) by BN9P221CA0021.outlook.office365.com
 (2603:10b6:408:10a::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.15 via Frontend
 Transport; Tue, 27 Sep 2022 09:47:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT007.mail.protection.outlook.com (10.13.177.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Tue, 27 Sep 2022 09:47:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 04:47:44 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Tue, 27 Sep 2022 04:47:43 -0500
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
X-Inumbo-ID: 71d0adcd-3e49-11ed-9648-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqBQ9EEvk3tft/KMnO5CZvplcC2/Jd5zXCoKqWLVQvIShjAQ1emym2xpykJukdK/YWuCyROCMh93VfSi7971yvNipj3LSUe7UNCOEoaXV6gG+hwjt6Xcnr7vyFNwb1qCE624nklHTrcYEI7knfyKAXdl3QTdNaoep46gtoXLZ9FFT8bIdXqmvZ2WfPcc3JnBzxars1n7Cy2piEoXqqg+brAR+9UUdrH7dyXN/myCw7T66T5QcMNUCr06Lhp2DmyFTQvmGYpm/IvoxCcLBjZJZitqczsAsJE6oxuLnIE1s8+IikrFpO3Fb0QpZK4gy2wvrDVUQyg4vwSZG+3VCzg1Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ax5+F8w1fPqztC0E47oipxuAnLpuQqKzKyegV6Abe7s=;
 b=kV7u/2HtlUrERhaBjJcVIZEsgVSFWGIumJ7wkcUnAmaIithGfyPnefXHYyJRvT6XgWzWOc2ZJn7jUWzzy5qYgP1QHvGDPb6Tzf6QMTurmUDJInKbnQ5VXwgoEvYzTA36YJm/Gk6K8ISi93IwiJKNPDlGIA2AWDstrm3L89ANEwMloyAOI8Pd4+kPT+3Wuw9WaCMtOdT60naGxOvV+xuKZCdtTaFHmsKoItA2QsQe8jHQa79RQlHFhbX6pqg3jXBZ2PhZnY6ZmrmskqW/BEyrWbsZXfwqj1Ec5jWyB3NlgJ+0+YdfgRSDndwODula2QCFND5Tgd0w2Dds8HEZ5O4tFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ax5+F8w1fPqztC0E47oipxuAnLpuQqKzKyegV6Abe7s=;
 b=Kt8sECp1nJgqOouRYs+n7wndk/J/aEth6B4PF+YK4r86mFxpiD2lDdaUXPo2aItA0Z1u0zvSKlEKD+3X8/XjAfxWmjhWaB/fxLhkXyPm3PrIeHfLRCnCsTRS9g6WS4i55wKiz9qN+9BbpE56DkSIAq3+VDmlMiQzAxa7YWhHmXs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH v3 06/10] automation: qemu-smoke-arm32.sh: Modify script to use ImageBuilder
Date: Tue, 27 Sep 2022 11:47:23 +0200
Message-ID: <20220927094727.12762-7-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927094727.12762-1-michal.orzel@amd.com>
References: <20220927094727.12762-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT007:EE_|SN7PR12MB6911:EE_
X-MS-Office365-Filtering-Correlation-Id: db75d599-92b5-4539-1983-08daa06d5428
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6uWk+GoJxrnyWZcMvQPfCkYIQlUMoUEOPi595HlVrZrbvjeyWiey5itYu7HfIrwXEvl408gpF5qRpjPu3Krigcg4x9ekB2vCFO9XorS5UweG74a9Hqc1o1XqEFXwj9Nw9oorC3p1vNxY07fzoIW/SYGIq0cadOzGPayEEtZwAgmfQi6mUn4VemTxOhep/2DiwXo2gs7f3OtoLfxQaA7cSxmlqEXxrlSMacEuOUIysdgF/Wry3eGAs8+38IvrcVUFmhUm4OQKbhQGvXMdv/HCSjHeud/Ft7WlrWcXWi0H9SBbk/rfr5XWoEqhGPht0obHb1AZ1N2hfjJlTHSpSqHmOmPgRZPuNRL391/zRpwJ2HnI3fYN9M2mQ5ZPuOmRA/P5T2fERkRYiayOcTY2uFId8fpOnlMUnKpYMJJyvfEMla17+yLAdexIBT4Jt9P91WIFLbgOBoe7W9HoSC8MRB6indL0Lby3PiLndzp5760D1y2dATTDE4Ur8usfbXbysCqyghaeNNdqLqeaqV96K7o4L0Aotmrwel1YdMD3PSrTgW7E9VwSODyxS34yMnrIvHNdY2rAf+rE1OFGQOQlNQ8/oqWw+hEs0U0tPoGEwIQHPP2/+iGwXNGJDXCNe1R3ZOQoLsBO5F3iJengg79KrBfw1beXCasEP81qMERFm/Qs/13Ll6Q5hVbSmTJnI203oYxBzgYbEzI2radPhtXqoEeQ6TDjZzt7IeJuUrvZPjOHZkRdznO+JkF5Jj2mr5C9fD9uSv0Ucs2jgdyaGORHKIydY7iYVuz2qh3BATw/dx758/f/jzvuvXptTeBipccNs3uQ27P5AnIBypyVMDXTBUXqHSFffebm3xXGaEQpqiJ46wbTrVGrwnO0DzeNrZTABVui8sGYgQvBvPSOxkUTxIbRM+FDhfzGrx0E/jHp3gla1Qo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(40480700001)(82310400005)(966005)(426003)(47076005)(26005)(336012)(83380400001)(44832011)(8936002)(40460700003)(2906002)(1076003)(86362001)(5660300002)(54906003)(6916009)(186003)(82740400003)(316002)(36860700001)(81166007)(70206006)(2616005)(478600001)(6666004)(70586007)(41300700001)(4326008)(8676002)(356005)(21314003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 09:47:44.9514
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db75d599-92b5-4539-1983-08daa06d5428
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6911

Take an example from arm64 qemu test scripts and use ImageBuilder
to generate u-boot script automatically. Calculating the addresses
manually is quite error prone and also we will be able to benefit
from using ImageBuilder when adding domUs to this test in the future.

Install and use u-boot from the debian package.
Modify the script so that binaries are loaded from u-boot via tftp.
Remove dtuart=/pl011@9000000 because stdout-path in QEMU dtb is always
set to pl011 node path.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- none
Changes in v2:
- add explanation in commit msg why we remove dtuart path
---
 automation/scripts/qemu-smoke-arm32.sh | 57 ++++++++++++--------------
 1 file changed, 27 insertions(+), 30 deletions(-)

diff --git a/automation/scripts/qemu-smoke-arm32.sh b/automation/scripts/qemu-smoke-arm32.sh
index c8ae0bfb9b1c..ef19b988c2c4 100755
--- a/automation/scripts/qemu-smoke-arm32.sh
+++ b/automation/scripts/qemu-smoke-arm32.sh
@@ -4,7 +4,9 @@ set -ex
 
 export DEBIAN_FRONTEND=noninteractive
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


