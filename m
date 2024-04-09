Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0D089D1A9
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 06:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702120.1096955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3Uy-0004A7-Bv; Tue, 09 Apr 2024 04:54:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702120.1096955; Tue, 09 Apr 2024 04:54:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3Uy-00046d-7x; Tue, 09 Apr 2024 04:54:20 +0000
Received: by outflank-mailman (input) for mailman id 702120;
 Tue, 09 Apr 2024 04:54:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5At3=LO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ru3Uw-0003cc-AT
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 04:54:18 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36e15aed-f62d-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 06:54:16 +0200 (CEST)
Received: from CY8PR12CA0006.namprd12.prod.outlook.com (2603:10b6:930:4e::11)
 by PH8PR12MB6988.namprd12.prod.outlook.com (2603:10b6:510:1bf::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Tue, 9 Apr
 2024 04:54:11 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:4e:cafe::1) by CY8PR12CA0006.outlook.office365.com
 (2603:10b6:930:4e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.36 via Frontend
 Transport; Tue, 9 Apr 2024 04:54:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 04:54:10 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 23:54:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 21:54:09 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 23:54:07 -0500
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
X-Inumbo-ID: 36e15aed-f62d-11ee-843a-3f19d20e7db6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+80n9x28wYISmojxRJb4Yr0Yj0UjpVpwF8RtNV+nKNtUzLJH5bxf8NugQkXSPCdPRYdSCxNhH39XTH7LLmiAwBxoFXHuB9pRND4/inL2Ni4ofzeOZHt3+g2kdagdZjUTVnlfRISonQSeA6FW6vTzB8Oaae9ijpKWD4y7V7FK3Fo5bncvYWnjwExzGj3JW/JbxdA+0X3G8mM/Wy3k5LrsMjCfLB1u9LFuSlTl0ImWkRh3Uwu3wMkEQ2yOnbE6VLEXx5RTnuseIRGfgWAMX+/5KC30IJ5qYJq3k+vdqeaGZoqcvUK7CtXNgoufaFHmVyjy1dcfn6C+K23+qfQ6Vj3GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UH53OrvZPnAWC4mq34mYlREnVpEthVdOjMxYJ/+8w2M=;
 b=V80Z4bmtQUzz0MLxNq2hYlZps+SYo7meZ7TqkT1npu66B2l3Nnm2XgurWPBdbSN7u4CtVZBTkTwaNKv5UXmHJ441dnQByhV56mybXAjSMEp8xyAxOAxUPy2f5Yt4nE3DyP8fWNBYIfX7HT/LqerE71JpYeFKedD0K3jkpDjeIJ1Q9IWXYDM4vGRIpOs3JyTaFTn8MDSZzZgFMLDQ7GoVhFT/atic1uKfEd2+jXOG+5RypCi99Ik7wFWDxiqUHqZ+qgN7R58qm9O060W2KEy4PBN4NENci8pNb80pGvFayLS54U+h2ifYXTM23ZU3vsaifJVW3ovRlOCrHPu0ZbUAFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UH53OrvZPnAWC4mq34mYlREnVpEthVdOjMxYJ/+8w2M=;
 b=E2ib80FImKJ7V6d07VN4D4zexXPe9E+qyB5Nnln66mKeDo4K2DvTO99LJrnlJ0LXFDxiBs7LHdDbJvYaDnFdNIQCDHhgIL/huWWckZCtSPNlBvuQcBq9ItxXUJgXxME60Qs19bLglmzc79lHAex3jyrq2uq5w8J8eIGVNExLoRA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 2/5] xen/arm: Generalize the extended region finding logic
Date: Tue, 9 Apr 2024 12:53:54 +0800
Message-ID: <20240409045357.236802-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409045357.236802-1-xin.wang2@amd.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|PH8PR12MB6988:EE_
X-MS-Office365-Filtering-Correlation-Id: b7126ebd-67f7-41f3-2cbc-08dc58511859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FSIToWUOc1V5CZcu3wjvTesBBRf0USv/aTwpUs1YD4hUZHtqixm6qLCXJlGis7GQFeywu8QUwzTWAlLG5fN/XCf4aYfsN6wDzKuwpzkKBTGQp2GamIz3mdyW+IfX0O6exKyd27+69dMGwFSSE6ELcRuoHimzzswBHhQulAoTd0IjVqjjZjv4PgO/xn8kcltfrmeI8r30OqKOLuPFy5PByCJva4SUwSfW3k8MBOBsAZm/mHKXgRdr5a+20qy3nZV9dYtVjbQHZMd5jKEXKuapp0dI8cGNYmW3YXapxQZVldUXXkqNtTjhjhNqXOoHQEuvmkiEfvFDs1dPyC/5vz6+9MG0dZ3yVGKtQ+vI2EkPUoekpTcPjqznga9JGrTCLitNBw+X6wcRA63514mPpP5vHAywiU4ZUwlosyUMSa+P+KCVic674Xd90drF8Jw9p2GKzpDYu7UmUqLFD/BM5azBoCYyVZj2olF0yIWk8hOND9zERSdVxH5rNhmJVQJUlN/vEUNqwIkW7WvR+RIph01F4DAghRU1ki84NAgLR/8/Jj0RYiXYm8l7iQckE6jj2dF7JqWrpY/DOlxbquUH1wxKKiexNvIYIfxkcUw77htrHUNcDl2RyboDWxeTaw18AheSMjx5A4J6rzdcUjyIlcS9ab+6bmnjETAO6Ml+pEvJCmG/MaFZEtHw36vFX0SDDeHSOW+a9ab5NcFPfhuhXyg2h/QMCkMJBQjGZ0LQBWCiCKSQBDRIUUehpHWHb8mexV3W
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 04:54:10.2766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7126ebd-67f7-41f3-2cbc-08dc58511859
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6988

Recently there are needs to find unallocated/used memory regions
for different use cases at boot time, and the logic of finding
extended regions can be reused for some of the new use cases.

This commit therefore generalize the extended region finding logic.
Firstly, extract the extended region finding logic to a dedicated
helper find_unused_regions(). Then add and pass down a `min_region_size`
parameter so that the helpers can take a flexible region size
instead of the hardcoded 64MB for extended region. Finally, adjust
the variable and function names to make them general instead of for
extended region only.

Take the opportunity to update the stale in-code comment of
find_unallocated_memory() and find_memory_holes().

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v4:
- No change
v3:
- New patch
---
 xen/arch/arm/domain_build.c             | 107 ++++++++++++++----------
 xen/arch/arm/include/asm/domain_build.h |   2 +
 xen/arch/arm/include/asm/setup.h        |   5 ++
 3 files changed, 70 insertions(+), 44 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 085d88671e..d2a9c047ea 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -814,19 +814,21 @@ int __init make_memory_node(const struct domain *d,
     return res;
 }
 
-static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
-                                  void *data)
+static int __init add_regions(unsigned long s_gfn, unsigned long e_gfn,
+                              void *data)
 {
-    struct meminfo *ext_regions = data;
+    struct mem_unused_info *unused = data;
+    struct meminfo *regions = unused->regions;
+    paddr_t min_region_size = unused->min_region_size;
     paddr_t start, size;
     paddr_t s = pfn_to_paddr(s_gfn);
     paddr_t e = pfn_to_paddr(e_gfn);
 
-    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
+    if ( regions->nr_banks >= ARRAY_SIZE(regions->bank) )
         return 0;
 
     /*
-     * Both start and size of the extended region should be 2MB aligned to
+     * Both start and size of the region should be 2MB aligned to
      * potentially allow superpage mapping.
      */
     start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
@@ -845,26 +847,27 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
      * not quite useful but increase bookkeeping and not too large
      * to skip a large proportion of unused address space.
      */
-    if ( size < MB(64) )
+    if ( size < min_region_size )
         return 0;
 
-    ext_regions->bank[ext_regions->nr_banks].start = start;
-    ext_regions->bank[ext_regions->nr_banks].size = size;
-    ext_regions->nr_banks++;
+    regions->bank[regions->nr_banks].start = start;
+    regions->bank[regions->nr_banks].size = size;
+    regions->nr_banks++;
 
     return 0;
 }
 
 /*
- * Find unused regions of Host address space which can be exposed to Dom0
- * as extended regions for the special memory mappings. In order to calculate
- * regions we exclude every region assigned to Dom0 from the Host RAM:
+ * Find unused regions of Host address space which can be exposed to
+ * direct-mapped domains as regions for the special memory mappings.
+ * In order to calculate regions we exclude every region assigned to
+ * direct-mapped domains from the Host RAM:
  * - domain RAM
  * - reserved-memory
  * - grant table space
  */
 static int __init find_unallocated_memory(const struct kernel_info *kinfo,
-                                          struct meminfo *ext_regions)
+                                          struct mem_unused_info *unused)
 {
     const struct meminfo *assign_mem = &kinfo->mem;
     struct rangeset *unalloc_mem;
@@ -893,7 +896,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         }
     }
 
-    /* Remove RAM assigned to Dom0 */
+    /* Remove RAM assigned to domain */
     for ( i = 0; i < assign_mem->nr_banks; i++ )
     {
         start = assign_mem->bank[i].start;
@@ -942,10 +945,10 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
     res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
-                                 add_ext_regions, ext_regions);
+                                 add_regions, unused);
     if ( res )
-        ext_regions->nr_banks = 0;
-    else if ( !ext_regions->nr_banks )
+        unused->regions->nr_banks = 0;
+    else if ( !unused->regions->nr_banks )
         res = -ENOENT;
 
 out:
@@ -982,16 +985,16 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
 }
 
 /*
- * Find the holes in the Host DT which can be exposed to Dom0 as extended
- * regions for the special memory mappings. In order to calculate regions
- * we exclude every addressable memory region described by "reg" and "ranges"
+ * Find the holes in the Host DT which can be exposed to direct-mapped domains
+ * as regions for the special memory mappings. In order to calculate regions we
+ * exclude every addressable memory region described by "reg" and "ranges"
  * properties from the maximum possible addressable physical memory range:
  * - MMIO
  * - Host RAM
  * - PCI aperture
  */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
-                                    struct meminfo *ext_regions)
+                                    struct mem_unused_info *unused)
 {
     struct dt_device_node *np;
     struct rangeset *mem_holes;
@@ -1068,10 +1071,10 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
     res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
-                                 add_ext_regions,  ext_regions);
+                                 add_regions, unused);
     if ( res )
-        ext_regions->nr_banks = 0;
-    else if ( !ext_regions->nr_banks )
+        unused->regions->nr_banks = 0;
+    else if ( !unused->regions->nr_banks )
         res = -ENOENT;
 
 out:
@@ -1081,35 +1084,62 @@ out:
 }
 
 static int __init find_domU_holes(const struct kernel_info *kinfo,
-                                  struct meminfo *ext_regions)
+                                  struct mem_unused_info *unused)
 {
     unsigned int i;
     uint64_t bankend;
     const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
     const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
+    struct meminfo *regions = unused->regions;
+    paddr_t min_region_size = unused->min_region_size;
     int res = -ENOENT;
 
     for ( i = 0; i < GUEST_RAM_BANKS; i++ )
     {
-        struct membank *ext_bank = &(ext_regions->bank[ext_regions->nr_banks]);
+        struct membank *bank = &(regions->bank[regions->nr_banks]);
 
-        ext_bank->start = ROUNDUP(bankbase[i] + kinfo->mem.bank[i].size, SZ_2M);
+        bank->start = ROUNDUP(bankbase[i] + kinfo->mem.bank[i].size, SZ_2M);
 
         bankend = ~0ULL >> (64 - p2m_ipa_bits);
         bankend = min(bankend, bankbase[i] + banksize[i] - 1);
-        if ( bankend > ext_bank->start )
-            ext_bank->size = bankend - ext_bank->start + 1;
+        if ( bankend > bank->start )
+            bank->size = bankend - bank->start + 1;
 
-        /* 64MB is the minimum size of an extended region */
-        if ( ext_bank->size < MB(64) )
+        if ( bank->size < min_region_size )
             continue;
-        ext_regions->nr_banks++;
+        regions->nr_banks++;
         res = 0;
     }
 
     return res;
 }
 
+int __init find_unused_regions(struct domain *d,
+                               const struct kernel_info *kinfo,
+                               struct meminfo *regions,
+                               paddr_t min_region_size)
+{
+    int res;
+    struct mem_unused_info unused;
+
+    unused.regions = regions;
+    unused.min_region_size = min_region_size;
+
+    if ( is_domain_direct_mapped(d) )
+    {
+        if ( !is_iommu_enabled(d) )
+            res = find_unallocated_memory(kinfo, &unused);
+        else
+            res = find_memory_holes(kinfo, &unused);
+    }
+    else
+    {
+        res = find_domU_holes(kinfo, &unused);
+    }
+
+    return res;
+}
+
 int __init make_hypervisor_node(struct domain *d,
                                 const struct kernel_info *kinfo,
                                 int addrcells, int sizecells)
@@ -1161,18 +1191,7 @@ int __init make_hypervisor_node(struct domain *d,
         if ( !ext_regions )
             return -ENOMEM;
 
-        if ( is_domain_direct_mapped(d) )
-        {
-            if ( !is_iommu_enabled(d) )
-                res = find_unallocated_memory(kinfo, ext_regions);
-            else
-                res = find_memory_holes(kinfo, ext_regions);
-        }
-        else
-        {
-            res = find_domU_holes(kinfo, ext_regions);
-        }
-
+        res = find_unused_regions(d, kinfo, ext_regions, MB(64));
         if ( res )
             printk(XENLOG_WARNING "%pd: failed to allocate extended regions\n",
                    d);
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index da9e6025f3..74432123fe 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -10,6 +10,8 @@ bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                           gfn_t sgfn, paddr_t tot_size);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
+int find_unused_regions(struct domain *d, const struct kernel_info *kinfo,
+                        struct meminfo *regions, paddr_t min_region_size);
 int make_chosen_node(const struct kernel_info *kinfo);
 int make_cpus_node(const struct domain *d, void *fdt);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index d15a88d2e0..d24c6d31c8 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -61,6 +61,11 @@ struct meminfo {
     struct membank bank[NR_MEM_BANKS];
 };
 
+struct mem_unused_info {
+    struct meminfo *regions;
+    paddr_t min_region_size;
+};
+
 /*
  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
  * The purpose of the domU flag is to avoid getting confused in
-- 
2.34.1


