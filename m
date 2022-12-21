Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 506896536AD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Dec 2022 19:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468034.727103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p84DI-0002BP-3N; Wed, 21 Dec 2022 18:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468034.727103; Wed, 21 Dec 2022 18:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p84DI-00027y-0E; Wed, 21 Dec 2022 18:53:12 +0000
Received: by outflank-mailman (input) for mailman id 468034;
 Wed, 21 Dec 2022 18:53:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1azw=4T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p84DG-00027s-SK
 for xen-devel@lists.xenproject.org; Wed, 21 Dec 2022 18:53:11 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2068.outbound.protection.outlook.com [40.107.93.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b558198b-8160-11ed-91b6-6bf2151ebd3b;
 Wed, 21 Dec 2022 19:53:08 +0100 (CET)
Received: from MW4PR04CA0197.namprd04.prod.outlook.com (2603:10b6:303:86::22)
 by PH7PR12MB5832.namprd12.prod.outlook.com (2603:10b6:510:1d7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 18:53:05 +0000
Received: from CO1NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::1f) by MW4PR04CA0197.outlook.office365.com
 (2603:10b6:303:86::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.22 via Frontend
 Transport; Wed, 21 Dec 2022 18:53:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT084.mail.protection.outlook.com (10.13.174.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.10 via Frontend Transport; Wed, 21 Dec 2022 18:53:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 21 Dec
 2022 12:53:03 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 21 Dec 2022 12:53:02 -0600
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
X-Inumbo-ID: b558198b-8160-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRdxLRDRmlxPIx/42atVorBTQ8I7SDz0sj2MEyEflqP+S+6+IMhBre46B+FgoCIEgpnkDApM1VotLR5gdcjZIrn1YuyJrVqt0wRWnDzCreGYIZO4r3yHAa3w/ZGjscdJXqGGDabild/pxFPUAQpy4inR5woJyb5xwTIkhDY1+Otr0buBthTWOAFX/w2e3OfgqdmpPGlAOF2ZOT0G//iqe3ayMkkAL29ZzsEnpTgsARpmgw9w8m3FXwz7fbQGMn8GHdgSgkDrUE2AEyw/p6dlm9dUSwHw/QN+Vlg8bpQGGrmmWIiLX2MzJB5xXt247GsuFZGnlnI8YM9PpQlkRLfP0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o67UXSSvAkuwFcWCK4ZMeeZP8vBF3mIheoTxYW0+YD0=;
 b=fEcXScr/MjuUChcsm+Y+1zFGj7sS7O3N8FuQMPzQzuZsvCoXm9032dtJxbiFXFa8tjdOEZeh0TDd/K26HIXo9gcWE+g5SrYEIqd3aEUgbclUcs76Zvxz7kpXW5QNDnzdhIOvGV9+i5iArkfgA7ep6ynMT1GDO15so69K8F1BrVdnyIam98v/1srOOLUylMJ4EeOxNPvfClYZAbFQctKFMGafhRHVPZKLojxV/5yvMRquYc5S1JIlKZkG8eiosqv+0TrYKSxx+54QUTvey9wH7p9Uy1cSlP4963qzJjtlbyhkFlna6AswQFXh+jfFmSUYV+9LxMEN1tJw+F34NaHtYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o67UXSSvAkuwFcWCK4ZMeeZP8vBF3mIheoTxYW0+YD0=;
 b=EMedZG9wXY7NVfmrwmSzZSWrcXMRHflNX5S8vLvLbAdyunxY3rPC66fSbOYzft+pQn6wE1CvdoiMq3qg+xsGVQLKxZaoSmO8NaU1+WlrSp24+94olhQcP31Fq+HGNFEM1B67lMZDTOIkSkN8G5uVx8gR+oSzaBk4jmmTpQOTd1U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v4] xen/arm: Probe the load/entry point address of an uImage correctly
Date: Wed, 21 Dec 2022 18:53:00 +0000
Message-ID: <20221221185300.5309-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT084:EE_|PH7PR12MB5832:EE_
X-MS-Office365-Filtering-Correlation-Id: f2961ed7-d5e5-490a-73b4-08dae38497ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8yKeQvYf48ozmzOGypqrfHDaDmWPtcZuB9j6nX0ZbSFIrqiPUSo2ZNrvgSf+kiABAzrF3XAlC0dvuhIgWwnvrSDFUYYL57E8fUQr4JvuHWeN9y6zq0BLFmmG6cTU3LSX8GOrZ3NmOoJiqVbCe8wulB9/EhYYWdqXtQPzm3Ml5ATZiM9xu9U2jWDQhhtKWs2vsEW16amrr27fTPczh+MbgZnrB6Ii/pGDR0YNUnOjOOSBB32Rq47qgq6C37iHwn3SDGjd45e7jZzZhyWPfeyWt5OnZQy+x5zbENWmgR9nPrES0OXxYPKNVr4X2R6H3vriVT1/N6IUcGjCpxg8XgA8mP2Z/zuD0wPFIaO9xhsOr+HYodp2HOGCddf/g7pM7GAycEZ05XDQgnzH2K6k+zgjpjmiZ5jVgfmTXrPnTnSpeJpIK3FGs2isUJPx62W2rZGjd4DUYdxy0v1/2s4EaEPJEz1afqm6Dsxp8e4QrnZner3ZBS/E+66UnoZYaY8SN12PYBfhYEBkEecpzXzCkdmWkUoyK8NEgxIcGURvcT2WeQZwZC2CIbK2/TfAxc4J57phl8/9EIXSZDbWZzdOsKnwyA4FRU45KwomgIszwuPPkG/UJ7df7J0gwmTqWqKmLgrwlWwlDcyHwxizZgV0AQyrBX/d4JqutgmzfwXVc0x4mdXrl8RjYVF1lBi5fhbVVuA8vKy4yTjP4lc+IsyNFV4kqpstY9nVBmgBFayM3+2ZBDdaYBS1Sq7fy5fsJoWt5VVo6Z+qs+T+xaJkDy5xOJaRxjVZzBz2BVttDUAYyZDzrwxqscmHccP5c82Z8SXtm6jtxXQ5XektJDe2PLHWKRRSdQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(36840700001)(46966006)(40470700004)(54906003)(6916009)(82740400003)(316002)(36860700001)(966005)(82310400005)(40460700003)(478600001)(81166007)(4326008)(8676002)(70206006)(1076003)(86362001)(36756003)(2616005)(70586007)(356005)(40480700001)(103116003)(83380400001)(47076005)(8936002)(426003)(5660300002)(2906002)(336012)(41300700001)(186003)(26005)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 18:53:04.9180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2961ed7-d5e5-490a-73b4-08dae38497ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5832

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

 docs/misc/arm/booting.txt         | 26 ++++++++++++++++++
 xen/arch/arm/include/asm/kernel.h |  2 +-
 xen/arch/arm/kernel.c             | 45 ++++++++++++++++++++++++++++---
 3 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 3e0c03e065..12339dfecb 100644
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
+Earlier for legacy image protocol, Xen ignored the load address and
+entry point specified in the header. This has now changed.
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
index 23b840ea9e..58b3db0aa4 100644
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
 
@@ -223,10 +228,35 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     if ( len > size - sizeof(uimage) )
         return -EINVAL;
 
+    info->zimage.start = be32_to_cpu(uimage.load);
+    info->entry = be32_to_cpu(uimage.ep);
+
+    /*
+     * While uboot considers 0x0 to be a valid load/start address, for Xen
+     * to mantain parity with zimage, we consider 0x0 to denote position
+     * independent image. That means Xen is free to load such an image at
+     * any valid address.
+     * Thus, we will print an appropriate message.
+     */
+    if ( info->zimage.start == 0 )
+        printk(XENLOG_INFO
+               "No load address provided. Xen will decide where to load it.\n");
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
@@ -366,6 +396,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
     info->zimage.kernel_addr = addr;
     info->zimage.len = end - start;
     info->zimage.text_offset = zimage.text_offset;
+    info->zimage.start = 0;
 
     info->load = kernel_zimage_load;
 
@@ -436,6 +467,14 @@ int __init kernel_probe(struct kernel_info *info,
     u64 kernel_addr, initrd_addr, dtb_addr, size;
     int rc;
 
+    /* We need to initialize start to 0. This field may be populated during
+     * kernel_xxx_probe() if the image has a fixed entry point (for eg
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


