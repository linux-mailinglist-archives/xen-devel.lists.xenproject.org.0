Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C02D26696E4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 13:25:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477269.739897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJ6w-0000Gz-QA; Fri, 13 Jan 2023 12:24:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477269.739897; Fri, 13 Jan 2023 12:24:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGJ6w-0000EB-NH; Fri, 13 Jan 2023 12:24:42 +0000
Received: by outflank-mailman (input) for mailman id 477269;
 Fri, 13 Jan 2023 12:24:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xRhM=5K=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pGJ6v-0000E5-2t
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 12:24:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ed5d26a-933d-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 13:24:39 +0100 (CET)
Received: from BN9PR03CA0439.namprd03.prod.outlook.com (2603:10b6:408:113::24)
 by PH0PR12MB5466.namprd12.prod.outlook.com (2603:10b6:510:d7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 12:24:35 +0000
Received: from BL02EPF0000C404.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::3b) by BN9PR03CA0439.outlook.office365.com
 (2603:10b6:408:113::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.14 via Frontend
 Transport; Fri, 13 Jan 2023 12:24:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000C404.mail.protection.outlook.com (10.167.241.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Fri, 13 Jan 2023 12:24:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 06:24:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 13 Jan
 2023 06:24:34 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 13 Jan 2023 06:24:32 -0600
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
X-Inumbo-ID: 3ed5d26a-933d-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IOk49rBzV/B8dOHCxOWgIGR8GJ9SWHSo1t+MyKdenf/U8ePBXSDhoTUC+kbed0XapQlfKVqxmJfuggQShcjwSxIre5kaL0rLJVLcmyuuXzeL1CnxXtFJOS8pMODySYmX4mXZ3vzFyJZKSVPZkWdMUiau1Ez2zLz0Eq4zlFhmBOZc8plZabwAqVeWxU0hu6eSMmfxQ7s+7JAMb88aL5DsG2M7CeaF183r256L9HEU29H+MKwvxiolrYjy4++Hu/loqrCasnQWhSJmY2I7QJYh9UVGSxZCAU5ITXVDcaaXjkOsCPEAijApYi/7L7YIez1jgOXVn4BpmNHoA/x/DogRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycEQqwgkzsVZ028ofgUn3qmD37oS/iVNWA6GXMTomSE=;
 b=mfePwy00wIR9LUdjexMh1Ft/E6YEUd9JIgJ7NLK2fR09JNuiPQxCm6Cef9XjC4/Am6ukTwegBi70HtRm36MlULRUPCMwu8kNIzXrsBRGVHkcsKT3fonBp1OLRcQ8dl9rzQ0nhOmDD7udpWVKDwNorsdpbbtS0tawX7zMXyBjS7G/1zrr2iu5MTODKOvEGLcOZdbwc83ZWpGUDMzb6MVx3wjdUra/zK6vFmGuup3S/Inx6nrJ7PTolT72RUYbbERCTCc4x4LS+xGv8klYn3SJuM2xGh1SaB3D2Dg2thTxxJ8nI/IOSg82jikodMImTaplsoEp/rxXdHSB2dk9Cgky5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycEQqwgkzsVZ028ofgUn3qmD37oS/iVNWA6GXMTomSE=;
 b=xgKy2Q5X0qbW1dPLBXyCHPDbu1mVoInTaq6/5begkVfaP7QulnFc5IFGCmMyiVm9qwZ68Xhk6nZL5OY+kr1IYkhOCetLes9aFTBQ6fDItIfz5cjbqO2w8Y9tA+k2HXnamgkX6nIovSNHPNoaIQcTDCatvUkmBTMgft17qtAIZKc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v5] xen/arm: Probe the load/entry point address of an uImage correctly
Date: Fri, 13 Jan 2023 12:24:23 +0000
Message-ID: <20230113122423.22902-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C404:EE_|PH0PR12MB5466:EE_
X-MS-Office365-Filtering-Correlation-Id: fed8d023-0b5c-4773-707e-08daf561216e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0f+pl7gD4eaMKKhq1rS2nsgP/mPAh5lJnMqQ9BgSuNpQN2bdhBDC6M0GmkX6V+Xi0AsM9P/C5ZT1Q4vqMxizHyTrZIgRC56NZ2cNBWc8a5p15ktJH6h6VrzSqA1IZ86q7GPfhVc3ET6iQN7Arp8ce31v8Uf+HYBp/+nmjaDPIQJymN0DGR37MPvTyVj5G+qNUtXiTPAcdVhFg+pNkNTfwEVtOIJfF62wDqBMY0cBi4PfxCdYbDaDOohE50d75yjvtaOYdmficem2OcUA5oqo209MKNIhA0075iVaVqbEaUwN2IyfpD8ENhKyZxOowaB+cmpNck0xKVSTg41Q+1Cwr5bjc4hwV9AFrL1O7+QQq3tb9agbekX7FFaeflLK8OYpxMf7KiCB7OQBWw0t43+y3SZp4vdGC/GtmE8XbVRcJTdkiHnJq8mIDtds83rx00zbBTX8NnKzq8RwtWEOpWojt8UMBVgicbWhlRa5Yol25Efn2zdQ0p2qLEeaITiFyGTESsLZ1XyUSx25Ona6o3vqJpY2QEpTrNrp6+qiEI6Da8tF/wb+B+o1rtC4kzxK5Qt1I9H0EMuYZbjPRac9fypKYZOp2E7d+9rEqMiy58Kf/tuDHCRhVy0nkc9mUIJJejTGHtAXGROVLvTNG4p0XdLPeZbY1PZ0bg675Cnjoe7eLKs7i+ez5eb6NFxVOIta99buG3TZDxoWNItjZ9T5xWgOBHaWgIfIOiNbqQb83+C0/8VxjTKhcPjSX4EQObosz40jjWXp8Fa3YwRHt8PA9kqLEsG2qT1xAss5CocE5gvcBuV9EXsDmUmowaXPFm01iHMq
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(36860700001)(82740400003)(6666004)(356005)(81166007)(2906002)(86362001)(966005)(478600001)(2616005)(186003)(103116003)(1076003)(8676002)(40480700001)(316002)(5660300002)(26005)(82310400005)(8936002)(36756003)(83380400001)(70206006)(47076005)(41300700001)(426003)(4326008)(40460700003)(54906003)(70586007)(336012)(6916009)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 12:24:34.7396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fed8d023-0b5c-4773-707e-08daf561216e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C404.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5466

Currently, kernel_uimage_probe() does not read the load/entry point address
set in the uImge header. Thus, info->zimage.start is 0 (default value). This
causes, kernel_zimage_place() to treat the binary (contained within uImage)
as position independent executable. Thus, it loads it at an incorrect
address.

The correct approach would be to read "uimage.load" and set
info->zimage.start. This will ensure that the binary is loaded at the
correct address. Also, read "uimage.ep" and set info->entry (ie kernel entry
address).

If user provides load address (ie "uimage.load") as 0x0, then the image is
treated as position independent executable. Xen can load such an image at
any address it considers appropriate. A position independent executable
cannot have a fixed entry point address.

This behavior is applicable for both arm32 and arm64 platforms.

Earlier for arm32 and arm64 platforms, Xen was ignoring the load and entry
point address set in the uImage header. With this commit, Xen will use them.
This makes the behavior of Xen consistent with uboot for uimage headers.

Users who want to use Xen with statically partitioned domains, can provide
non zero load address and entry address for the dom0/domU kernel. It is
required that the load and entry address provided must be within the memory
region allocated by Xen.

A deviation from uboot behaviour is that we consider load address == 0x0,
to denote that the image supports position independent execution. This
is to make the behavior consistent across uImage and zImage.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from v1 :-
1. Added a check to ensure load address and entry address are the same.
2. Considered load address == 0x0 as position independent execution.
3. Ensured that the uImage header interpretation is consistent across
arm32 and arm64.

v2 :-
1. Mentioned the change in existing behavior in booting.txt.
2. Updated booting.txt with a new section to document "Booting Guests".

v3 :-
1. Removed the constraint that the entry point should be same as the load
address. Thus, Xen uses both the load address and entry point to determine
where the image is to be copied and the start address.
2. Updated documentation to denote that load address and start address
should be within the memory region allocated by Xen.
3. Added constraint that user cannot provide entry point for a position
independent executable (PIE) image.

v4 :-
1. Explicitly mentioned the version in booting.txt from when the uImage
probing behavior has changed.
2. Logged the requested load address and entry point parsed from the uImage
header.
3. Some style issues.

 docs/misc/arm/booting.txt         | 26 ++++++++++++++++
 xen/arch/arm/include/asm/kernel.h |  2 +-
 xen/arch/arm/kernel.c             | 49 +++++++++++++++++++++++++++++--
 3 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 3e0c03e065..aeb0123e8d 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -23,6 +23,28 @@ The exceptions to this on 32-bit ARM are as follows:
 
 There are no exception on 64-bit ARM.
 
+Booting Guests
+--------------
+
+Xen supports the legacy image header[3], zImage protocol for 32-bit
+ARM Linux[1] and Image protocol defined for ARM64[2].
+
+Until Xen 4.17, in case of legacy image protocol, Xen ignored the load
+address and entry point specified in the header. This has now changed.
+
+Now, it loads the image at the load address provided in the header.
+And the entry point is used as the kernel start address.
+
+A deviation from uboot is that, Xen treats "load address == 0x0" as
+position independent execution (PIE). Thus, Xen will load such an image
+at an address it considers appropriate. Also, user cannot specify the
+entry point of a PIE image since the start address cennot be
+predetermined.
+
+Users who want to use Xen with statically partitioned domains, can provide
+the fixed non zero load address and start address for the dom0/domU kernel.
+The load address and start address specified by the user in the header must
+be within the memory region allocated by Xen.
 
 Firmware/bootloader requirements
 --------------------------------
@@ -39,3 +61,7 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
 
 [2] linux/Documentation/arm64/booting.rst
 Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/arm64/booting.rst
+
+[3] legacy format header
+Latest version: https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
+https://linux.die.net/man/1/mkimage
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 5bb30c3f2f..4617cdc83b 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -72,7 +72,7 @@ struct kernel_info {
 #ifdef CONFIG_ARM_64
             paddr_t text_offset; /* 64-bit Image only */
 #endif
-            paddr_t start; /* 32-bit zImage only */
+            paddr_t start; /* Must be 0 for 64-bit Image */
         } zimage;
     };
 };
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 23b840ea9e..0b7f591857 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -127,7 +127,7 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     paddr_t load_addr;
 
 #ifdef CONFIG_ARM_64
-    if ( info->type == DOMAIN_64BIT )
+    if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
         return info->mem.bank[0].start + info->zimage.text_offset;
 #endif
 
@@ -162,7 +162,12 @@ static void __init kernel_zimage_load(struct kernel_info *info)
     void *kernel;
     int rc;
 
-    info->entry = load_addr;
+    /*
+     * If the image does not have a fixed entry point, then use the load
+     * address as the entry point.
+     */
+    if ( info->entry == 0 )
+        info->entry = load_addr;
 
     place_modules(info, load_addr, load_addr + len);
 
@@ -223,10 +228,38 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     if ( len > size - sizeof(uimage) )
         return -EINVAL;
 
+    info->zimage.start = be32_to_cpu(uimage.load);
+    info->entry = be32_to_cpu(uimage.ep);
+
+    /*
+     * While uboot considers 0x0 to be a valid load/start address, for Xen
+     * to maintain parity with zImage, we consider 0x0 to denote position
+     * independent image. That means Xen is free to load such an image at
+     * any valid address.
+     */
+    if ( info->zimage.start == 0 )
+        printk(XENLOG_INFO
+               "No load address provided. Xen will decide where to load it.\n");
+    else
+        printk(XENLOG_INFO
+               "Provided load address: %"PRIpaddr" and entry address: %"PRIpaddr"\n",
+               info->zimage.start, info->entry);
+
+    /*
+     * If the image supports position independent execution, then user cannot
+     * provide an entry point as Xen will load such an image at any appropriate
+     * memory address. Thus, we need to return error.
+     */
+    if ( (info->zimage.start == 0) && (info->entry != 0) )
+    {
+        printk(XENLOG_ERR
+               "Entry point cannot be non zero for PIE image.\n");
+        return -EINVAL;
+    }
+
     info->zimage.kernel_addr = addr + sizeof(uimage);
     info->zimage.len = len;
 
-    info->entry = info->zimage.start;
     info->load = kernel_zimage_load;
 
 #ifdef CONFIG_ARM_64
@@ -366,6 +399,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
     info->zimage.kernel_addr = addr;
     info->zimage.len = end - start;
     info->zimage.text_offset = zimage.text_offset;
+    info->zimage.start = 0;
 
     info->load = kernel_zimage_load;
 
@@ -436,6 +470,15 @@ int __init kernel_probe(struct kernel_info *info,
     u64 kernel_addr, initrd_addr, dtb_addr, size;
     int rc;
 
+    /*
+     * We need to initialize start to 0. This field may be populated during
+     * kernel_xxx_probe() if the image has a fixed entry point (for e.g.
+     * uimage.ep).
+     * We will use this to determine if the image has a fixed entry point or
+     * the load address should be used as the start address.
+     */
+    info->entry = 0;
+
     /* domain is NULL only for the hardware domain */
     if ( domain == NULL )
     {
-- 
2.17.1


