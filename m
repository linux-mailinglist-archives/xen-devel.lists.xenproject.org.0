Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD495E63E4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Sep 2022 15:41:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410156.653203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSC-0005K5-69; Thu, 22 Sep 2022 13:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410156.653203; Thu, 22 Sep 2022 13:41:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obMSB-0005BB-V6; Thu, 22 Sep 2022 13:41:23 +0000
Received: by outflank-mailman (input) for mailman id 410156;
 Thu, 22 Sep 2022 13:41:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eiOI=ZZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1obMS9-00041N-6j
 for xen-devel@lists.xenproject.org; Thu, 22 Sep 2022 13:41:21 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3b0d72e9-3a7c-11ed-9374-c1cf23e5d27e;
 Thu, 22 Sep 2022 15:41:16 +0200 (CEST)
Received: from DM6PR06CA0089.namprd06.prod.outlook.com (2603:10b6:5:336::22)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.18; Thu, 22 Sep
 2022 13:41:16 +0000
Received: from DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::c2) by DM6PR06CA0089.outlook.office365.com
 (2603:10b6:5:336::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.19 via Frontend
 Transport; Thu, 22 Sep 2022 13:41:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT083.mail.protection.outlook.com (10.13.173.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Thu, 22 Sep 2022 13:41:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:15 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 22 Sep
 2022 08:41:15 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Thu, 22 Sep 2022 08:41:14 -0500
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
X-Inumbo-ID: 3b0d72e9-3a7c-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXwFV9b7jm53IhavgXFoJe2v/MUicrXSzR/XjI2blRyas2vxUTByBZuLq+5pgFNroxQoQ8c9KSVRcuhBqheJaCCWOMQFPUf8qYhFxJV89hnGxj17ClFBitxsYh70cPVhQ29wizYUcSgYipsLG4k/01ixq08ZMatv+Mt4SgCvhFw48chsZV4cLEZP7ttYtYwm0uKCe7IYvTfg+Jtp9Dhj2pTwbChIEZOZPiH+5U0KIGmnBuh+CWjoXn4P7NYI9pM1mFjI8Ndpo3jNi0ssGYXHbVWzG3xW9jt1nCWYsCF8hymUQeWlmmMeOASa00rSsgtXDJpO7766gkK0AoijfCh1Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oAgJkBVaGriE7CRBKSX6qVx0MliKnRqb2WGUchdghAU=;
 b=TrK5YAY03xPYc2cEKC0I74WYCnKYf/oWYOKirpzW/foT+aHurkkeUdyuitzQY89G8XruKpGZalx2vSK0g6893FMeND9mKlyBI5B7MYEitHMoeLokdsYmffVR0CvOiVOSs8lpFKM+/uRjn6Tzn7zQyjizAEKmMMfPxi/19rFDCKo6F4LeLnMC8qH73kUQEb3R5cOdqsnEW5blpLeSeSMjFUznvUa/C0uaM8CWTwZiZ2Sx0NkDXtnik3nvIb62FwXSa4xmtNoJEoAQu6SCtOl0ajD/RjVZAthyZrL/j+GcAkS3qRpd43xuq39zQcVjPMl/w7fnAYCIYfLRUpNMcrnTtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oAgJkBVaGriE7CRBKSX6qVx0MliKnRqb2WGUchdghAU=;
 b=1H5+Y/I6n8uVxu6jQNnR70u8rvb8EY/3JIe4HMxfGfOPW11Y4bPEOwWMFndWQiF8pQ+CPd4ZVArp/kJj9bC4hjZLcdbdwtvJwSmmjDOEVfExlYfrEvWcorMB1lG3E4bZRbTU+U+oFjnP2d7/LdNZi1qPx/5/w5q3bhwBW2pFb4w=
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
Subject: [PATCH 5/9] automation: qemu-smoke-arm32.sh: Modify script to use ImageBuilder
Date: Thu, 22 Sep 2022 15:40:54 +0200
Message-ID: <20220922134058.1410-6-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220922134058.1410-1-michal.orzel@amd.com>
References: <20220922134058.1410-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT083:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: bb365dbb-009e-4372-9218-08da9ca01f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x3HvvWdB2uyQRM8YsDrSsGWFAVMJJX+pJxeq/9pH1tsrJh3ip/sMwPugjam9WCwK+UPPtQ3KsKJ1uvFuy/xHlKFv6p1FiUDbGdNGGt+Wmd9l88c3RGzi7mNV+8/ggTnoVuaWVO5N4WdBTgTQOdMgFScHy50PZqr0BIOwx7c+zu8HTkQ3eEjgjN9Ap+Zk4wOzDEfnGwHhMyPPkniey0sVvPWGrCsKT33ZuookznlUy2PLkQgWl6LcfZjkElCHTkNfRsOtkQUhrVwm5AG5sE29DPUJOMJJa6R/85LsOFXxLExBnbUp5+UUQRmFRl18zHjavVOEQjuJqWYUrMbP6zB9zlqK/fEyRCkDji50M+9txel4sSj8h3ldOG8G5TP0AzxISHZ/ChkPfljj90R0JsqOa9qdgfA3Zly9QXkIQwfusnq+92MeJczBpoLdICWI3nU0YhBdDh6K6HIMc1i/kFamEUhVfB2ZAS8RrcRY82abGtVtHdCCSUX3ZPAsyZ1DunWhlPTHRsqujJp5xOJD9i843QJ3aoNxrpOaRkJ8awCtG86eNLdFUjB1HPjsU9LS/mJleteUoEzECS6lXU1kKzmM3/v+SJBhRvQNvlmqjXdxU02jJoibLA+9Zqf7F/pOVAGQZDeTYxVc4wtWOawLbrKSMU0LOeWxQtGWTwlFF+sdD8M9+4EGtPvolHi2a4rFEB/dLIHIqlEnE9k7uEtmCaXcgyq/Rpt564P57V4fEK1s6MYpoX+zNz5mCeQXfFN2evseeOqj25OpYhCAvN664UMmtqvXJGGXo+y0MhEVrawq5HCckpvK/B0/6RAD1FxUdRLtb9YyMwNOgFHFwYSIYJYJCotpMsIHJ8rfnRp+i3OB6G3U5Qlv83IlcZWh3fY73mC3ncB6OEayEVeZswN38We7rSGyesYH7Tu9DTH/+Xg7CcU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199015)(36840700001)(40470700004)(46966006)(26005)(4326008)(8676002)(70586007)(36756003)(44832011)(86362001)(41300700001)(426003)(82310400005)(6916009)(54906003)(5660300002)(2906002)(316002)(8936002)(47076005)(356005)(478600001)(40460700003)(966005)(6666004)(81166007)(82740400003)(186003)(70206006)(1076003)(2616005)(336012)(83380400001)(40480700001)(36860700001)(21314003)(36900700001)(139555002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2022 13:41:16.3718
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb365dbb-009e-4372-9218-08da9ca01f93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260

Take an example from arm64 qemu test scripts and use ImageBuilder
to generate u-boot script automatically. Calculating the addresses
manually is quite error prone and also we will be able to benefit
from using ImageBuilder when adding domUs to this test in the future.

Install and use u-boot from the debian package.
Modify the script so that binaries are loaded from u-boot via tftp.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
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


