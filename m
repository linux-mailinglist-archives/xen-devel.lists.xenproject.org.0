Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51986683112
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 16:15:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487704.755372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMsKu-0004SB-3B; Tue, 31 Jan 2023 15:14:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487704.755372; Tue, 31 Jan 2023 15:14:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMsKu-0004PE-0Q; Tue, 31 Jan 2023 15:14:16 +0000
Received: by outflank-mailman (input) for mailman id 487704;
 Tue, 31 Jan 2023 15:14:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OPLs=54=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pMsKr-0004A7-Qq
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 15:14:13 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea9867b8-a179-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 16:14:13 +0100 (CET)
Received: from BN0PR02CA0018.namprd02.prod.outlook.com (2603:10b6:408:e4::23)
 by SA1PR12MB6871.namprd12.prod.outlook.com (2603:10b6:806:25f::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 15:14:09 +0000
Received: from BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e4:cafe::3) by BN0PR02CA0018.outlook.office365.com
 (2603:10b6:408:e4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 15:14:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT065.mail.protection.outlook.com (10.13.177.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.22 via Frontend Transport; Tue, 31 Jan 2023 15:14:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 09:14:07 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 31 Jan 2023 09:14:06 -0600
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
X-Inumbo-ID: ea9867b8-a179-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eWVB5kY93w5hQ7p1s0ORVx6QjjlvZHxv/mebwjEP6vO7a3wUwB9P28mlNyZU6w1ITR2qhutm6ZwbTMpBO4gy4b3VXKXKtWdSGRGzVRDNI57e0rFVjkZgxpLQg+pNaXnPwc4sfSH7tfvN8cboniisFD16LBkleqP72yDEBgChoqR0MnFKDfuKGmXGYqedkHhtfsogKVqP/TXzCVsAotqP39YcGW07HZVecg9eiDIT1t6nim5ME+eK5bhgQP1fnfpC+tS7fE1GMYcw5thbqxHq0tJ1pPiJH6+g4/IUX9Wqp8KKw023/1IICW9Ly86+pn+9uGvtWZniDgcuGgUwh8sdLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3PnjvfUKhMVAdYzSmtJaKp16nTOZivuM1huY1HnWKtg=;
 b=LkxqSfSgjCvwFgifLGhqYeuxvVtQDyIhxYw4yb6b3uHCypT8uDnuONuUCreofmYUc+xY3jaeVVpA/nt3nn/fDxCOQfM+oxNh/mjbGd/k+n5e58kAqS3ulXDE1IZFtyCpk69vn29fmKJ58g6ZFfdC1E5+H5js15GDyP3kyABb7kaPIVLbM3MzRaVSxMh5FSkyoBoXElkuvStG+Yp67+5HaDnNFz1UJZ0q44p8qjQILPWenQBkXYSDvRKvIPEFmRPxPK1pxzmhenUcXE7pB659FCw/6BeOPfpQQ2Lh2qNyiCmCZTxhVHJKPwX1rhQgOtmRp6uJU3hqhWnP2+wTmZrp7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3PnjvfUKhMVAdYzSmtJaKp16nTOZivuM1huY1HnWKtg=;
 b=m8Vebu3HKbEHlAi2S7BFHmqBCdnUqDV2d0qyInj8YVV9pMZA+vsVPSWnci97B9qyffFyIKVT3UgInbbdAnm985PekrHhURiPjwLtPtDnhShioojjxQ9twBkgYEtFyMzaHkW4voqTmxm3mJi8ryKjImCpMndXm+d9OQoH7mkKjhs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayankuma@amd.com>
Subject: [PATCH 1/2] xen/arm: Move kernel_uimage_probe definition after kernel_decompress
Date: Tue, 31 Jan 2023 16:13:53 +0100
Message-ID: <20230131151354.25943-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230131151354.25943-1-michal.orzel@amd.com>
References: <20230131151354.25943-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT065:EE_|SA1PR12MB6871:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b4f85e-0882-4450-51f9-08db039dccca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	byzLgpcIEQu0LTdEyjaeiRJ1vq/vjb5EvNKJlIZX5TD5J2lSgGOmL20MUFkyUOdroiwQU2UMD+ANQuyCVTNouKU/wz8dwcfom4xYSOHiA7jws77xZm+5QNVrIvSx2g8k84LQEyGecfr283DeG/Mv4ARy9vb+iE71O/S8+iPhBtIl8He9a7qRlThFHbTMx7tJZL0WD4RUp9eqIlG+h3vC+BaT2XmrVXj79hwjXOO8g4asg5Bg6zgyAwIQWnyiu1PMMSEtAttRq7OTpQ4o6nc8aiBOkwXUDaKvDbwTzpWadL9yKKGgVDhCDnON7698vSN37+2x5Ei96AwsLElx0KETQ8H0kv00gQOz2Mb2uaKweBVKqLUhydgguLhr+TsirPHQ3yCCXdBcRD5Hcug+87AiF4H1/fVVyb5b1xv6mNEX/cpP4gvyHH1pXxSX98yPV7F5OLBtzoKBdyx7zVVyq8sD1RFKwC5sz4bj5l0VvOdu+6LxH84TdXeoxNEezfkEu7N4EuSWGMmkdhMSL/4Pxf6o5uSVQ6CCodHZkfNuL6Yl3RiRcUIfjHhxZ1gUGelpx8ZEQ9HhKTHLLKpGItJLZRyIuvjy83VbNzmFFYtRRJs8NJPCqfHICjDmR72jqtTyCLPuUK6lUNpXpKX05FnV+V5Wj01xQjwOkynMkQz7F245979EwOG4sQ9XUV+Gv4hPUKjHTrj7f27O2at72y07BNuP4IMASZkav0Wmjs5bspAthEA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(136003)(396003)(376002)(451199018)(36840700001)(46966006)(40470700004)(44832011)(83380400001)(426003)(86362001)(2616005)(47076005)(336012)(81166007)(82740400003)(82310400005)(356005)(2906002)(36756003)(40460700003)(186003)(1076003)(26005)(36860700001)(478600001)(6666004)(8936002)(4326008)(70206006)(70586007)(41300700001)(40480700001)(8676002)(5660300002)(54906003)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 15:14:08.3148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b4f85e-0882-4450-51f9-08db039dccca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6871

In a follow-up patch, we will be calling kernel_decompress function from
within kernel_uimage_probe to support booting compressed images with
u-boot header. Therefore, move the kernel_uimage_probe definition after
kernel_decompress so that the latter is visible to the former.

No functional change intended.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/kernel.c | 146 +++++++++++++++++++++---------------------
 1 file changed, 73 insertions(+), 73 deletions(-)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 36081e73f140..068fbf88e492 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -186,6 +186,79 @@ static void __init kernel_zimage_load(struct kernel_info *info)
     iounmap(kernel);
 }
 
+static __init uint32_t output_length(char *image, unsigned long image_len)
+{
+    return *(uint32_t *)&image[image_len - 4];
+}
+
+static __init int kernel_decompress(struct bootmodule *mod)
+{
+    char *output, *input;
+    char magic[2];
+    int rc;
+    unsigned int kernel_order_out;
+    paddr_t output_size;
+    struct page_info *pages;
+    mfn_t mfn;
+    int i;
+    paddr_t addr = mod->start;
+    paddr_t size = mod->size;
+
+    if ( size < 2 )
+        return -EINVAL;
+
+    copy_from_paddr(magic, addr, sizeof(magic));
+
+    /* only gzip is supported */
+    if ( !gzip_check(magic, size) )
+        return -EINVAL;
+
+    input = ioremap_cache(addr, size);
+    if ( input == NULL )
+        return -EFAULT;
+
+    output_size = output_length(input, size);
+    kernel_order_out = get_order_from_bytes(output_size);
+    pages = alloc_domheap_pages(NULL, kernel_order_out, 0);
+    if ( pages == NULL )
+    {
+        iounmap(input);
+        return -ENOMEM;
+    }
+    mfn = page_to_mfn(pages);
+    output = __vmap(&mfn, 1 << kernel_order_out, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
+
+    rc = perform_gunzip(output, input, size);
+    clean_dcache_va_range(output, output_size);
+    iounmap(input);
+    vunmap(output);
+
+    if ( rc )
+    {
+        free_domheap_pages(pages, kernel_order_out);
+        return rc;
+    }
+
+    mod->start = page_to_maddr(pages);
+    mod->size = output_size;
+
+    /*
+     * Need to free pages after output_size here because they won't be
+     * freed by discard_initial_modules
+     */
+    i = PFN_UP(output_size);
+    for ( ; i < (1 << kernel_order_out); i++ )
+        free_domheap_page(pages + i);
+
+    /*
+     * Free the original kernel, update the pointers to the
+     * decompressed kernel
+     */
+    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
+
+    return 0;
+}
+
 /*
  * Uimage CPU Architecture Codes
  */
@@ -289,79 +362,6 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     return 0;
 }
 
-static __init uint32_t output_length(char *image, unsigned long image_len)
-{
-    return *(uint32_t *)&image[image_len - 4];
-}
-
-static __init int kernel_decompress(struct bootmodule *mod)
-{
-    char *output, *input;
-    char magic[2];
-    int rc;
-    unsigned int kernel_order_out;
-    paddr_t output_size;
-    struct page_info *pages;
-    mfn_t mfn;
-    int i;
-    paddr_t addr = mod->start;
-    paddr_t size = mod->size;
-
-    if ( size < 2 )
-        return -EINVAL;
-
-    copy_from_paddr(magic, addr, sizeof(magic));
-
-    /* only gzip is supported */
-    if ( !gzip_check(magic, size) )
-        return -EINVAL;
-
-    input = ioremap_cache(addr, size);
-    if ( input == NULL )
-        return -EFAULT;
-
-    output_size = output_length(input, size);
-    kernel_order_out = get_order_from_bytes(output_size);
-    pages = alloc_domheap_pages(NULL, kernel_order_out, 0);
-    if ( pages == NULL )
-    {
-        iounmap(input);
-        return -ENOMEM;
-    }
-    mfn = page_to_mfn(pages);
-    output = __vmap(&mfn, 1 << kernel_order_out, 1, 1, PAGE_HYPERVISOR, VMAP_DEFAULT);
-
-    rc = perform_gunzip(output, input, size);
-    clean_dcache_va_range(output, output_size);
-    iounmap(input);
-    vunmap(output);
-
-    if ( rc )
-    {
-        free_domheap_pages(pages, kernel_order_out);
-        return rc;
-    }
-
-    mod->start = page_to_maddr(pages);
-    mod->size = output_size;
-
-    /*
-     * Need to free pages after output_size here because they won't be
-     * freed by discard_initial_modules
-     */
-    i = PFN_UP(output_size);
-    for ( ; i < (1 << kernel_order_out); i++ )
-        free_domheap_page(pages + i);
-
-    /*
-     * Free the original kernel, update the pointers to the
-     * decompressed kernel
-     */
-    fw_unreserved_regions(addr, addr + size, init_domheap_pages, 0);
-
-    return 0;
-}
-
 #ifdef CONFIG_ARM_64
 /*
  * Check if the image is a 64-bit Image.
-- 
2.25.1


