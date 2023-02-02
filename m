Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFA46877D8
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 09:49:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488597.756748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNVHh-0004j2-Hl; Thu, 02 Feb 2023 08:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488597.756748; Thu, 02 Feb 2023 08:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNVHh-0004gi-Dp; Thu, 02 Feb 2023 08:49:33 +0000
Received: by outflank-mailman (input) for mailman id 488597;
 Thu, 02 Feb 2023 08:49:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8a/s=56=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pNVHf-0004Po-40
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 08:49:31 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 807f5548-a2d6-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 09:49:29 +0100 (CET)
Received: from BN0PR07CA0027.namprd07.prod.outlook.com (2603:10b6:408:141::29)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27; Thu, 2 Feb
 2023 08:49:26 +0000
Received: from BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::89) by BN0PR07CA0027.outlook.office365.com
 (2603:10b6:408:141::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25 via Frontend
 Transport; Thu, 2 Feb 2023 08:49:26 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT100.mail.protection.outlook.com (10.13.177.100) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 08:49:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 02:49:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 02:49:24 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 2 Feb 2023 02:49:23 -0600
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
X-Inumbo-ID: 807f5548-a2d6-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kuVJthUGCa09GTKS0EdP6f4hTLpeMnnkTLSwgnm826TtFbAyRU+B8pxNsZh43Hn6Bggt85iiWSXz+LjqjumrNG4c04oRNXAJeXRjwniUNrim1QhCFbrSAVkF9gd+7CNsWpSt4VrPQx+dI+XmTwVztbDF8aEiznnQd9ZZP/oHg7Jnmw0Ep8Eyl0rdYVB5OpndnK89dC9Q1PL4oOvFSi94Cf3kUyOuW9IWOD5EWIGmIxDoPFYlOWIEQS6U6bI/a5hIFVB5Vd6TJaXnhieYV5znmgmB9VTsA6ymbSdSWv/qAgj0XRUVrTUn7FwWoPMydtz4D2sg7SGlvR4zTjlGWmdPqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=miuqtHseJ/K4LAnHtbyabXWBQMCXuBv77extmOJaVLI=;
 b=WfhLy2kk80raGa+6whBBrfBbW5XRL8UIZAnPnYXjFYnTvkzy83SpmI7wk2Lot7VLdcoSRCIIrqNXo30zcuPNm8I10uxmUMI8RS31+Pf3UwSEoSfUrkAmfqkavJwe0J7BUn/p7nBsfG/er2aWByMO+dcf5OlB7y3UFOoLH0EGl9IxDZp7CKx0R+wywQhTcaAMsgCoj8deqy2IkPuUjF0jLh8gXnz3HcOOSnjZpb3WB5sh7ZEowc79/7o02mVoqb6IZOPgVzA0STR2G02DqRw4tNLEphNLKDVrrQAD0vQz/riT6wm5hfdobv5g+320061bKVr2ISsBp01xZDyGqA9YpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=miuqtHseJ/K4LAnHtbyabXWBQMCXuBv77extmOJaVLI=;
 b=u4leEexpxx66l2PnCRg+IZAoMYDUDbU/j70UFFRQqZFWx7aXMaE5N0IzIBU5EGKYNgTfN+UBf0B3IHLIiNImLoOYCEjQa7HUhfMWWSOR2Z8N7W7kbl3X/GzUl+CMFA1U8iDSinWDQFkQeENtvEMlEknftWPc8qlXvXabyEg5PiI=
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
Subject: [PATCH v2 2/2] xen/arm: Add support for booting gzip compressed uImages
Date: Thu, 2 Feb 2023 09:49:05 +0100
Message-ID: <20230202084905.6950-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202084905.6950-1-michal.orzel@amd.com>
References: <20230202084905.6950-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT100:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 4668ee20-1fd5-4fcb-dfc4-08db04fa6323
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QKH7W3GkJDN+g6OsPSdY3ZpHlhljVW4Yqaczo3RUqtl5u5y3CdvhJIPxCeUMiweKd6czLlHcU9o9UeVQYbhBCj3064TkBRGFafE0Jv8G+3b8ltZU6Foc04Hu/CL/goEfFji8N+XPzdaICndsbTElI2ZiSALRi0iuovWrwfDd08AQw2s/zUIk0/g1L2gj/vtfQMe2EVyvliLAc0at1TvOk5D/nB57mflE23LjeI2Qlc6K+MSU5+YYHlKyHrshRMB3cGLv/Hu3psyEiTBUQEx1Hu2+D6/Ss1H5+IKgVVeQ5ycUWE2JmhhpipJQXfV6v/yljS8nPXRvFmfRBvEbrYVwkFRgqmBQP9cpC4Z5RWzgjzH7l9Ej+AXgRoN6c9uH5ZtzkbQ0gkszit88sOcU/YzTeQfcyddqPmppa/TrXM6X8sFPqXVsN9oAWc0MQiktaN1LsQ2Inkd7H/hVL1ClErX2pKWTayZ4sxYP0bO52JT4wQt32v2fLSrTSBEMI1SEG+sd5NEDWt5fNrLSz/GLcMXt0nbfdWx5s8PN7W3VKoCdF1AV1X3zPb1/kQhhJGtGJ4llEsC/5B83gtxT/atKx8WHhdEKgWAv1yOX3aSzTBuFy3YGDY2m+ga7r7Z9psssbO1HwIPSqaFqucvIbOArKh9lvFBg2qmD++n12Sp7uCK0P7GDfxFOh+NhMsJCvThr0gztt204Nik4cXKTZERgqZGLX5F0XbEt6cZwH9yW15GBcZo=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(136003)(396003)(39860400002)(376002)(451199018)(36840700001)(40470700004)(46966006)(40460700003)(36860700001)(478600001)(316002)(54906003)(186003)(26005)(36756003)(1076003)(6666004)(82310400005)(86362001)(5660300002)(2906002)(44832011)(4326008)(6916009)(70586007)(70206006)(8676002)(41300700001)(8936002)(40480700001)(426003)(83380400001)(336012)(2616005)(47076005)(356005)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:49:25.4375
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4668ee20-1fd5-4fcb-dfc4-08db04fa6323
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144

At the moment, Xen does not support booting gzip compressed uImages.
This is because we are trying to decompress the kernel before probing
the u-boot header. This leads to a failure as the header always appears
at the top of the image (and therefore obscuring the gzip header).

Move the call to kernel_uimage_probe before kernel_decompress and make
the function self-containing by taking the following actions:
 - take a pointer to struct bootmodule as a parameter,
 - check the comp field of a u-boot header to determine compression type,
 - in case of compressed image, call kernel_decompress passing uImage
   header size as an offset to gzip header,
 - set up zimage.{kernel_addr,len} accordingly,
 - return -ENOENT in case of a u-boot header not found to distinguish it
   amongst other return values and make it the only case for falling
   through to try to probe other image types.

Modify kernel_decompress to take an additional parameter being an offset
to a gzip header from start address. This is needed so that a function
can first operate on a region containing actually compressed kernel (in case
of compressed uImage, size of u-boot header is an offset to a gzip header)
and then at the end pass the entire region (as it was before taking an offset
into account) to fw_unreserved_regions for freeing.

This approach avoids splitting the uImage probing into 2 stages (executed
before and after decompression) which otherwise would be necessary to
properly parse header, update boot module start and size before
decompression and update zimage.{kernel_addr,len} afterwards.

Remove the limitation from the booting.txt documentation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - modify kernel_decompress to take an offset to gzip header
---
 docs/misc/arm/booting.txt |  3 --
 xen/arch/arm/kernel.c     | 81 ++++++++++++++++++++++++++++++++++-----
 2 files changed, 72 insertions(+), 12 deletions(-)

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
index 068fbf88e492..7dd082b5772c 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -191,7 +191,7 @@ static __init uint32_t output_length(char *image, unsigned long image_len)
     return *(uint32_t *)&image[image_len - 4];
 }
 
-static __init int kernel_decompress(struct bootmodule *mod)
+static __init int kernel_decompress(struct bootmodule *mod, uint32_t offset)
 {
     char *output, *input;
     char magic[2];
@@ -204,6 +204,17 @@ static __init int kernel_decompress(struct bootmodule *mod)
     paddr_t addr = mod->start;
     paddr_t size = mod->size;
 
+    if ( size < offset )
+        return -EINVAL;
+
+    /*
+     * It might be that gzip header does not appear at the start address
+     * (e.g. in case of compressed uImage) so take into account offset to
+     * gzip header.
+     */
+    addr += offset;
+    size -= offset;
+
     if ( size < 2 )
         return -EINVAL;
 
@@ -250,6 +261,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
     for ( ; i < (1 << kernel_order_out); i++ )
         free_domheap_page(pages + i);
 
+    /*
+     * When freeing the kernel, we need to pass the module start address and
+     * size as they were before taking an offset to gzip header into account,
+     * so that the entire region will be freed.
+     */
+    addr -= offset;
+    size += offset;
+
     /*
      * Free the original kernel, update the pointers to the
      * decompressed kernel
@@ -265,11 +284,14 @@ static __init int kernel_decompress(struct bootmodule *mod)
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
@@ -287,6 +309,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     } uimage;
 
     uint32_t len;
+    paddr_t addr = mod->start;
+    paddr_t size = mod->size;
 
     if ( size < sizeof(uimage) )
         return -EINVAL;
@@ -294,13 +318,21 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
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
 
@@ -330,8 +362,27 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
         return -EINVAL;
     }
 
-    info->zimage.kernel_addr = addr + sizeof(uimage);
-    info->zimage.len = len;
+    if ( uimage.comp )
+    {
+        int rc;
+
+        /*
+         * In case of a compressed uImage, the gzip header is right after
+         * the u-boot header, so pass sizeof(uimage) as an offset to gzip
+         * header.
+         */
+        rc = kernel_decompress(mod, sizeof(uimage));
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
 
@@ -561,8 +612,22 @@ int __init kernel_probe(struct kernel_info *info,
         printk("Loading ramdisk from boot module @ %"PRIpaddr"\n",
                info->initrd_bootmodule->start);
 
-    /* if it is a gzip'ed image, 32bit or 64bit, uncompress it */
-    rc = kernel_decompress(mod);
+    /*
+     * uImage header always appears at the top of the image (even compressed),
+     * so it needs to be probed first. Note that in case of compressed uImage,
+     * kernel_decompress is called from kernel_uimage_probe making the function
+     * self-containing (i.e. fall through only in case of a header not found).
+     */
+    rc = kernel_uimage_probe(info, mod);
+    if ( rc != -ENOENT )
+        return rc;
+
+    /*
+     * If it is a gzip'ed image, 32bit or 64bit, uncompress it.
+     * At this point, gzip header appears (if at all) at the top of the image,
+     * so pass 0 as an offset.
+     */
+    rc = kernel_decompress(mod, 0);
     if ( rc && rc != -EINVAL )
         return rc;
 
@@ -570,8 +635,6 @@ int __init kernel_probe(struct kernel_info *info,
     rc = kernel_zimage64_probe(info, mod->start, mod->size);
     if (rc < 0)
 #endif
-        rc = kernel_uimage_probe(info, mod->start, mod->size);
-    if (rc < 0)
         rc = kernel_zimage32_probe(info, mod->start, mod->size);
 
     return rc;
-- 
2.25.1


