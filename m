Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E366877D6
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 09:49:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488596.756738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNVHf-0004T8-9t; Thu, 02 Feb 2023 08:49:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488596.756738; Thu, 02 Feb 2023 08:49:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNVHf-0004Qb-6h; Thu, 02 Feb 2023 08:49:31 +0000
Received: by outflank-mailman (input) for mailman id 488596;
 Thu, 02 Feb 2023 08:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8a/s=56=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pNVHe-0004Po-2O
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 08:49:30 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fa8a137-a2d6-11ed-b63b-5f92e7d2e73a;
 Thu, 02 Feb 2023 09:49:27 +0100 (CET)
Received: from BN9P223CA0018.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::23)
 by MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 08:49:23 +0000
Received: from BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10b:cafe::5f) by BN9P223CA0018.outlook.office365.com
 (2603:10b6:408:10b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.25 via Frontend
 Transport; Thu, 2 Feb 2023 08:49:23 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT116.mail.protection.outlook.com (10.13.176.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6064.27 via Frontend Transport; Thu, 2 Feb 2023 08:49:23 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 2 Feb
 2023 02:49:23 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 2 Feb 2023 02:49:21 -0600
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
X-Inumbo-ID: 7fa8a137-a2d6-11ed-b63b-5f92e7d2e73a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SyRUAm/cHRaiZzLVhUFT09Xd8ko0DaHnNBubjdzjLI3pbXVNb1ip5qV1V7sqUEoGLmBupkyd9u9h98SN7BjbG5eQncvb06uEfUx6R83F3n9d7lF480A8gcgGEhb8z+qgj5s7BPXt0LnwuYQkNo/Ks40lRUJOQXnV1k087b7VuyNjT4LQcKTqrD2GktdAS3WLUF7VsF2C/xCTlLPlaSjZqHrtLKadT5UdZbq2AQHqvgaFx/3O1fLaf9BN0dZTJMit7ED0nJJC26ZRNuUvf6hrKnEv/lUl1y3UtzvXdaR9OrCXf8j6VoAWT5pD3Tahdw2Lg9Q4JZPT3y15EVVL9vAUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uBLNfq0kNGD8ONWUKgdnR9q15jFiaFT0XCVIzdVZEEQ=;
 b=HdSCxB4cmaEp3gMxkc7lZ8ajtDdppAjoNG4IAzFNPJAE7tudJjNsqnzeLsqgR8+BImrNgjA2wZ0SSlfaARnu+MkQyB4cEc/JBJQkq5u6YfhNQ+8uAzZYtTQYAP4RVhuiggbFqE6as4yudezNvREj6B7WdFDeEQ1DvMp1Q3v4GQzzjf/edYbPfl7VTeMdrrFyZbQ5ggU93UDbMh+xUC+G2NNJlUHMTebYRRYaBu22ChoIBYza8Z0GtnLcjLe3QWJcJMIvDEakKGvxlBojMsHHcaEtTY6F6Uy+bylZN4gleVQMecwOKXOVNzd6zf1F5Civ7TsQwgHw/YEmh7Xe011gVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uBLNfq0kNGD8ONWUKgdnR9q15jFiaFT0XCVIzdVZEEQ=;
 b=rE0oexAgbSG2eNPfXT3Qm+4P6dIxL7KP1I7Zs/fBEEEgbjScC+rdvUgyAFEXIlvchlCfq2u+iFvY4AWReIHBDmWoIPpyPYETbPYsoZD+n2xx95kFTdZZbFO6N5uK4ztld8dihtuRt0OpNM/VGN1vdlBYNSa+EVbxGINd9D85oQE=
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
	<ayankuma@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>, "Julien
 Grall" <jgrall@amazon.com>
Subject: [PATCH v2 1/2] xen/arm: Move kernel_uimage_probe definition after kernel_decompress
Date: Thu, 2 Feb 2023 09:49:04 +0100
Message-ID: <20230202084905.6950-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230202084905.6950-1-michal.orzel@amd.com>
References: <20230202084905.6950-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT116:EE_|MN2PR12MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f362ae-692a-4ced-581a-08db04fa61fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6YaMZPcBI8LpF1WcIFBuro0VZRysGKakmq/xz/mJv+ArpSo1zJqrh32QjBcq19dhf46tqgcJ/ItzvrbN/u1yOrRX1lNbWKYKWOWc8gjnXqnTqAjUDf/BF76yauoV5DKJdEiVm13XHXNOh7hf4f0QHV/sxFd+c3W4RDIlAVR6AEMDpSmQKzhIkQ4bEXmS5iK1ygd/PTamSNrbUH/lL+rlYK4QcXtpGSXwbeRVZgmeG1O384eTHgkpcgvaB5LA+XpKQdx3enkGhQO/VtVmJToGcMbNBuDmjeB2rlqNqdhBKfbEYmHDFCcE0qkXtKuq+ZM3WJxCmTi29s+JWZdrcO6UbpZRslXW82FR8hC5F62pA5QkV4mm1hhArZjmgVmSvIz6tASCAYWq1iRBXCVMgLigC4SekuQ2SUWYwuLHwtalgPbhZ2Y0YhWqqPFoc/xSZfSZr0o9aG3O0aPN97lI5DlBFPhuzL6kA8NcGAMJFYyrfN/VL0lPjOLs7Z0U7adQymKEwUqSGAz8/YBHncWrBJDcszFqpqoehUP529bF5x9tMOP5xLEgh0N85YfJhiQpuW62UREsqCQAwbl3RFQZKQrH0yUi2hCG68A0tXFfmyoKfqgx0xks8BN+S6FrO6AwZGlmkELcnpplo9NCy9WrIi/AwlaLQf04kUFDXK6qweJ2HfH/AYEVS06FFlNjvA9ZLEvPKlJ3dXorPwSpY18+swUeUfRNY8PHSoVF3IAUhwT/BZU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(39860400002)(396003)(376002)(451199018)(40470700004)(36840700001)(46966006)(2616005)(336012)(40460700003)(40480700001)(82310400005)(36756003)(36860700001)(86362001)(82740400003)(8936002)(5660300002)(316002)(44832011)(356005)(54906003)(41300700001)(426003)(47076005)(81166007)(2906002)(83380400001)(6916009)(1076003)(4326008)(186003)(8676002)(478600001)(26005)(6666004)(70206006)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 08:49:23.4720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f362ae-692a-4ced-581a-08db04fa61fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT116.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4566

In a follow-up patch, we will be calling kernel_decompress function from
within kernel_uimage_probe to support booting compressed images with
u-boot header. Therefore, move the kernel_uimage_probe definition after
kernel_decompress so that the latter is visible to the former.

No functional change intended.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v2:
 - add Rb and Ab
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


