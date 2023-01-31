Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9D683113
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 16:15:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487705.755384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMsKz-0004iN-Dg; Tue, 31 Jan 2023 15:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487705.755384; Tue, 31 Jan 2023 15:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMsKz-0004gB-8X; Tue, 31 Jan 2023 15:14:21 +0000
Received: by outflank-mailman (input) for mailman id 487705;
 Tue, 31 Jan 2023 15:14:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPLs=54=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pMsKx-0004eZ-82
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 15:14:19 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e89::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec478786-a179-11ed-b63b-5f92e7d2e73a;
 Tue, 31 Jan 2023 16:14:16 +0100 (CET)
Received: from BN9PR03CA0593.namprd03.prod.outlook.com (2603:10b6:408:10d::28)
 by CY5PR12MB6323.namprd12.prod.outlook.com (2603:10b6:930:20::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 15:14:10 +0000
Received: from BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10d:cafe::fb) by BN9PR03CA0593.outlook.office365.com
 (2603:10b6:408:10d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 15:14:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT090.mail.protection.outlook.com (10.13.177.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.22 via Frontend Transport; Tue, 31 Jan 2023 15:14:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 09:14:09 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 31 Jan 2023 09:14:08 -0600
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
X-Inumbo-ID: ec478786-a179-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W/XQYafhuPgq7Oph46gN87TD/SGXM7axcGm53RaU9hgENHW/aKejvzcZpvKPjnl4MJAHMhGAsF5mxgkeoO/8FV6gullTGBsFl16psu2/JBS0Btokruc4u5MBxRi+psO+gu3habfIcbkPyXyGasS/FPq+kFg80d48RUIYj+MIy1XQHGQKPD8bLCkgYrWHSSetxDJwmGNhKHfn38Pjgc+hOEqQB+nga2XyzdWDI8IP3lp/pe5be4RsQ2+DJWQmFnxx0T59suAeMG7mrNOskLjIBpThBxj8BxYF8TeUM99Q7mc+fwRNurGjrFLYOW+q7O5qYiWsn9T8O+BcZl6GUrjFPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNe9aseWivHMHPuq28/4HWwkjR5Ct14+G2rm7fTg36Y=;
 b=WxTUEwyK9TJdWEZpas6+07qCCr3whDRrcda22U7kISvaZRWuUYedlzhsDi5LlGT+LAUYo+RppODQAzBO9RSOyU0TRPWF00LzWTXOv6VaUOYUU/SVzsWE3kY8CciB9YV5MxKlyUV+/nT6t/x2f880tipCGZpFEoHBX2TREdm9wukWDoLIdjR7jQSQZLfbCBnx5yn1iVmjed9ENSfN5X6YRkM1Cek6LlCZ4fRD/LF3w5s9EXLA8pc9dPNpstEH/ZCJDyxYrHYusB1HSOLrvno0rOzQUQtC32uAPB4kI53aucE07HGNcbQrEX+mMebhZit4AIGuhoB1DQnFvSgDUmDEnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNe9aseWivHMHPuq28/4HWwkjR5Ct14+G2rm7fTg36Y=;
 b=FKE04ibgvEz3a84ML11S4OAf5Xv5QPYGyOBePO3rJiIv9n2I0gZjtWu2xnZ/nIiPhs0hAXgdMnBVfcELGDb2VJRxm6kfJg7pIEAC55Tw5fOktDHUrrgZ1OiXFmwJP573TTEv00u6BxzDCLFRKPCODHZXgTwPS9AqPDV5qDIg5GM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
Subject: [PATCH 2/2] xen/arm: Add support for booting gzip compressed uImages
Date: Tue, 31 Jan 2023 16:13:54 +0100
Message-ID: <20230131151354.25943-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230131151354.25943-1-michal.orzel@amd.com>
References: <20230131151354.25943-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT090:EE_|CY5PR12MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: 34b32970-ae76-4a0c-534f-08db039dcdc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LOH9+Y8mvLBgKxyxWQe1YKdd3+tQ1Sjaccwtu7cH66guy4EUGE5y8IFP+b9JQ4wubreVpW+Usv+HEGfHptBVT11NlsZDidU5qsAcCeNFqti7aatjVayFDMOZwf/dlbNbqZGB3CxNXaDjlB6O1bSDQa5wzpLaguX5LieptCJDNiAR1/2Y1L9bC9FgvQNlJuSuZg2hm324kUfSj6BExF/0/L8tLUjqOGS5XsOqJEIQgA86qRmzcNRHkRGKc23JKLE279CKgx+NP9X61uhJ9KTYFS1gDqWYIdOBzW0uEbqTgKUIALfKqNBw/NlJXOQOip8ttGdqkfoys0iLZveOUcTiZBEWNTFyrSIMYttOoahujUwAApc18p5tsa1qQ04pONkn9kURaBi1AcIHaaPWskgbPqke9YemL2RVK0wQ3SGRm/Ge1BCD8dlReb5lDzTJX/M1Y0E+1bqR3qv+yBGP0yFnAdc1uyHmZwhzfJyjdvNIpJ6sXH8McVYIl4fvbHsXPglVXRHfzf1Hd9VEDLh7XV5pyzMAlY0HeI4rTmjiIS//r+tDc3yWikpiG5bdwZjYK33rJQlfymKj4BUfYSrN2NB75hWahoSSR1qWjw/YauMmFkrysugvDxQzwKIYUIXaK2NmaPPNfi51QopNUa0BvfszWLn915bP+B9qDp0OegOa9pilxf3GQGrk7bYDHswdKGFtXofFi0waHF7CkEdSY5D684LKXmqYyXvtPL7k44lpRPE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(396003)(136003)(376002)(39860400002)(451199018)(46966006)(36840700001)(40470700004)(26005)(186003)(478600001)(6916009)(70206006)(8676002)(83380400001)(6666004)(1076003)(70586007)(316002)(54906003)(4326008)(36860700001)(5660300002)(41300700001)(44832011)(2616005)(82740400003)(8936002)(2906002)(356005)(86362001)(81166007)(82310400005)(336012)(47076005)(426003)(40460700003)(36756003)(40480700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:14:09.9729
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b32970-ae76-4a0c-534f-08db039dcdc7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT090.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6323

At the moment, Xen does not support booting gzip compressed uImages.
This is because we are trying to decompress the kernel before probing
the u-boot header. This leads to a failure as the header always appears
at the top of the image (and therefore obscuring the gzip header).

Move the call to kernel_uimage_probe before kernel_decompress and make
the function self-containing by taking the following actions:
 - take a pointer to struct bootmodule as a parameter,
 - check the comp field of a u-boot header to determine compression type,
 - in case of compressed image, modify boot module start address and size
   by taking the header size into account and call kernel_decompress,
 - set up zimage.{kernel_addr,len} accordingly,
 - return -ENOENT in case of a u-boot header not found to distinguish it
   amongst other return values and make it the only case for falling
   through to try to probe other image types.

This is done to avoid splitting the uImage probing into 2 stages (executed
before and after decompression) which otherwise would be necessary to
properly update boot module start and size before decompression and
zimage.{kernel_addr,len} afterwards.

Remove the limitation from the booting.txt documentation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 docs/misc/arm/booting.txt |  3 ---
 xen/arch/arm/kernel.c     | 51 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 45 insertions(+), 9 deletions(-)

diff --git a/docs/misc/arm/booting.txt b/docs/misc/arm/booting.txt
index bd7bfe7f284a..02f7bb65ec6d 100644
--- a/docs/misc/arm/booting.txt
+++ b/docs/misc/arm/booting.txt
@@ -50,9 +50,6 @@ Also, it is to be noted that if user provides the legacy image header on
 top of zImage or Image header, then Xen uses the attributes of legacy
 image header to determine the load address, entry point, etc.
 
-Known limitation: compressed kernels with a uboot headers are not
-working.
-
 
 Firmware/bootloader requirements
 --------------------------------
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 068fbf88e492..ea5f9618169e 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -265,11 +265,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
 #define IH_ARCH_ARM             2       /* ARM          */
 #define IH_ARCH_ARM64           22      /* ARM64        */
 
+/* uImage Compression Types */
+#define IH_COMP_GZIP            1
+
 /*
  * Check if the image is a uImage and setup kernel_info
  */
 static int __init kernel_uimage_probe(struct kernel_info *info,
-                                      paddr_t addr, paddr_t size)
+                                      struct bootmodule *mod)
 {
     struct {
         __be32 magic;   /* Image Header Magic Number */
@@ -287,6 +290,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     } uimage;
 
     uint32_t len;
+    paddr_t addr = mod->start;
+    paddr_t size = mod->size;
 
     if ( size < sizeof(uimage) )
         return -EINVAL;
@@ -294,13 +299,21 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     copy_from_paddr(&uimage, addr, sizeof(uimage));
 
     if ( be32_to_cpu(uimage.magic) != UIMAGE_MAGIC )
-        return -EINVAL;
+        return -ENOENT;
 
     len = be32_to_cpu(uimage.size);
 
     if ( len > size - sizeof(uimage) )
         return -EINVAL;
 
+    /* Only gzip compression is supported. */
+    if ( uimage.comp && uimage.comp != IH_COMP_GZIP )
+    {
+        printk(XENLOG_ERR
+               "Unsupported uImage compression type %"PRIu8"\n", uimage.comp);
+        return -EOPNOTSUPP;
+    }
+
     info->zimage.start = be32_to_cpu(uimage.load);
     info->entry = be32_to_cpu(uimage.ep);
 
@@ -330,8 +343,26 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
         return -EINVAL;
     }
 
-    info->zimage.kernel_addr = addr + sizeof(uimage);
-    info->zimage.len = len;
+    if ( uimage.comp )
+    {
+        int rc;
+
+        /* Prepare start and size for decompression. */
+        mod->start += sizeof(uimage);
+        mod->size -= sizeof(uimage);
+
+        rc = kernel_decompress(mod);
+        if ( rc )
+            return rc;
+
+        info->zimage.kernel_addr = mod->start;
+        info->zimage.len = mod->size;
+    }
+    else
+    {
+        info->zimage.kernel_addr = addr + sizeof(uimage);
+        info->zimage.len = len;
+    }
 
     info->load = kernel_zimage_load;
 
@@ -561,6 +592,16 @@ int __init kernel_probe(struct kernel_info *info,
         printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
                info->initrd_bootmodule->start);
 
+    /*
+     * uImage header always appears at the top of the image (even compressed),
+     * so it needs to be probed first. Note that in case of compressed uImage,
+     * kernel_decompress is called from kernel_uimage_probe making the function
+     * self-containing (i.e. fall through only in case of a header not found).
+    */
+    rc = kernel_uimage_probe(info, mod);
+    if ( rc != -ENOENT )
+        return rc;
+
     /* if it is a gzip'ed image, 32bit or 64bit, uncompress it */
     rc = kernel_decompress(mod);
     if ( rc && rc != -EINVAL )
@@ -570,8 +611,6 @@ int __init kernel_probe(struct kernel_info *info,
     rc = kernel_zimage64_probe(info, mod->start, mod->size);
     if (rc < 0)
 #endif
-        rc = kernel_uimage_probe(info, mod->start, mod->size);
-    if (rc < 0)
         rc = kernel_zimage32_probe(info, mod->start, mod->size);
 
     return rc;
-- 
2.25.1


