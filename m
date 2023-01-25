Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E19267B10D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 12:22:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484253.750790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdqk-0004Li-6o; Wed, 25 Jan 2023 11:21:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484253.750790; Wed, 25 Jan 2023 11:21:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKdqk-0004J7-3c; Wed, 25 Jan 2023 11:21:54 +0000
Received: by outflank-mailman (input) for mailman id 484253;
 Wed, 25 Jan 2023 11:21:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=prA8=5W=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pKdqi-0004J1-N1
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 11:21:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 750032e2-9ca2-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 12:21:49 +0100 (CET)
Received: from MW4PR02CA0027.namprd02.prod.outlook.com (2603:10b6:303:16d::32)
 by SN7PR12MB8132.namprd12.prod.outlook.com (2603:10b6:806:321::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 11:21:44 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::2f) by MW4PR02CA0027.outlook.office365.com
 (2603:10b6:303:16d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 11:21:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 11:21:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 05:21:41 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 25 Jan 2023 05:21:40 -0600
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
X-Inumbo-ID: 750032e2-9ca2-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c4tvu20iW5Wlggb7MvXS2tahW8zqHIuILG8P6v0vOHzxsncLKOxtNHIQo4orgHYPhcW8PKFqmQrjQaq2rN7VuEDANcU8V1aXd1PQnhH0KR/eKXSFqzbJUooT6SE8K6EfyMMzayb/sXKsbmN1LIc2CvfH3iZWpKlS0mvfjKLkLcs+eLk5phTSmIaD4cMWss38oW8/ihCNJchQQ9pn8NUPzRFfU1st6zb/Dg6+tnLDXDltuER5qFtfXoR5GAJ9L0g/pWiqG1+BTjX5e17aoRQVE2UCUTsvwwgSoeyCQE3N8++Ri3Muk5gH+o4V1/+EVH3y82O8wzSDwKxddiwOFYVR/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HGNUaoMLWy/qi79izVXbtqkr3RliCxNQ1+LWlkJVz3E=;
 b=XWQ0rkjuTY9jOZ5Ngxg6P/U0KC+tbyY8VqYLnB/KtpvXHvew2jUs4ULSHTzQg/yD52iArBgrfXPXXhj9D/VLP1UdpuIxtveTm5902vCdx4cp7bzJeDVdkxBDcWm/WLcRAyFuzb4osiFWSKe4ZRCLQczW2/BELcstDOnT3nrxhrG8msLG3G6oz2WozvoOxz8oeqgCxo7LeDJXhLtKCQJk8a1yiLWrxY9jsEX3wWKWDN3al9/PUtObHH4LHsDYIS5tsbdE/loulXULara+1lKJgbKhHG5CmSNm72cFKiCte3mFnZnDxR+TLG4G3GQlHZIMhFK4ASftSeihjRCwfe7aBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HGNUaoMLWy/qi79izVXbtqkr3RliCxNQ1+LWlkJVz3E=;
 b=4yW3o3GloPQ2vcNIIyXDIEZYGuoQkmBVPv5rpKGuQiNUonv4X8HwMOVZcfYPaGVQKTwqqdSHYVr0UH0ZWru73fNy3fRz75JMEjLaupWzxqCsP0bsVhCP3YKsVgZ8nPUYRiqR+8sOnH5M0xuOhW3DhjX8iEKWnPrCqizk5ysr2H0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v6] xen/arm: Probe the load/entry point address of an uImage correctly
Date: Wed, 25 Jan 2023 11:21:31 +0000
Message-ID: <20230125112131.19682-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|SN7PR12MB8132:EE_
X-MS-Office365-Filtering-Correlation-Id: 6079eb60-06e9-41aa-a89f-08dafec65656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JoqepkaC5AzNvbPBIGHhpmN/45ev+0wJ2Eprjj+6khlF/7enTJAD3lIjEtBPdHhvetcDjHk+WlnF1dKnqDTuEsFXHPiV/T21W5371mhofdMrZURde5Wg1g/ADfJHkMNwWkp6ESNKe7AtJmYEraR85HNbRvzF37ZqV6kyZALaUoGXowiqLqzDZHAMFUNs8rE7UbcfkcXOMIoThK9gzbUIk2FMUBJbDwvp3AiOPUV3wsuSRmnpcYSkPUpCVHWLFH03qIO4kI8Z9bWtP+1g5cU0vNZeo2RmayjrxnsESABM3cDzg9OYiPdoB6mTUgUmZguD3gjXVkMuI6IvnwnY9/iOFMJnzJ/tk59I+iBPo6eHVOpwCj/vT5UDPSyboiVVB+ivsxKYtvbtMJ5MAg1iBhG+0g7AQDxNZmt+oLDjL5wc/EzqtasdoCOnYIJX3OyGs7CTKVQhl72jzoThV6ebMDRwbp90DH2T/u2v6d9uwNxY2Qz+YeuBnArcwNt4F67AgX54h1IcgcG0dp8xDjPHLKMIgrkYwvDwKz8VQ32qtZYR7ovbezbqv5248jkPXneGD7xOvyZKfu9V5/bhvC80rsxz4DbqzuOh5Px/w2+Np1ShjVZtjrc3l5vVS2tey2s9WA52DquGJc2swMkbFfl63p32f8gRdvJWN33afm/Nd++ZppizFbSizSL+Dk2V55KAJBHmGAvpU7hdgAhV5sISWp4bZTlWQ4RQ5ijMr+e8pzbW6jPWcLvGCI68l6UoQP0/dc7DWFi+opKJgDmu+cHO/zouJnPCr6dftfh3smcEQ7XiHFVA3hUamvf4BxHeEuZNRlF/
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(4326008)(316002)(81166007)(2616005)(6666004)(1076003)(83380400001)(478600001)(82740400003)(2906002)(41300700001)(36860700001)(40480700001)(82310400005)(86362001)(103116003)(47076005)(54906003)(8676002)(26005)(186003)(70586007)(966005)(40460700003)(6916009)(36756003)(336012)(5660300002)(356005)(426003)(70206006)(8936002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 11:21:43.0283
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6079eb60-06e9-41aa-a89f-08dafec65656
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8132

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

v5 :-
1. Set info->zimage.text_offset = 0 in kernel_uimage_probe().
2. Mention that if the kernel has a legacy image header on top of zImage/zImage64
header, then the attrbutes from legacy image header is used to determine the load
address, entry point, etc. Thus, zImage/zImage64 header is effectively ignored.

This is true because Xen currently does not support recursive probing of kernel
headers ie if uImage header is probed, then Xen will not attempt to see if there
is an underlying zImage/zImage64 header.

 docs/misc/arm/booting.txt         | 30 ++++++++++++++++
 xen/arch/arm/include/asm/kernel.h |  2 +-
 xen/arch/arm/kernel.c             | 58 +++++++++++++++++++++++++++++--
 3 files changed, 86 insertions(+), 4 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index 3e0c03e065..1837579aef 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -23,6 +23,32 @@ The exceptions to this on 32-bit ARM are as follows:
 
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
+
+Also, it is to be noted that if user provides the legacy image header on top of
+zImage or Image header, then Xen uses the attrbutes of legacy image header only
+to determine the load address, entry point, etc.
 
 Firmware/bootloader requirements
 --------------------------------
@@ -39,3 +65,7 @@ Latest version: http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/t
 
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
index 23b840ea9e..36081e73f1 100644
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
@@ -242,6 +275,15 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
         printk(XENLOG_ERR "Unsupported uImage arch type %d\n", uimage.arch);
         return -EINVAL;
     }
+
+    /*
+     * If there is a uImage header, then we do not parse zImage or zImage64
+     * header. In other words if the user provides a uImage header on top of
+     * zImage or zImage64 header, Xen uses the attributes of uImage header only.
+     * Thus, Xen uses uimage.load attribute to determine the load address and
+     * zimage.text_offset is ignored.
+     */
+    info->zimage.text_offset = 0;
 #endif
 
     return 0;
@@ -366,6 +408,7 @@ static int __init kernel_zimage64_probe(struct kernel_info *info,
     info->zimage.kernel_addr = addr;
     info->zimage.len = end - start;
     info->zimage.text_offset = zimage.text_offset;
+    info->zimage.start = 0;
 
     info->load = kernel_zimage_load;
 
@@ -436,6 +479,15 @@ int __init kernel_probe(struct kernel_info *info,
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


