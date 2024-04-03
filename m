Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0EB389682E
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 10:17:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700366.1093408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnd-0004JZ-2t; Wed, 03 Apr 2024 08:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700366.1093408; Wed, 03 Apr 2024 08:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnc-0004Gc-U6; Wed, 03 Apr 2024 08:16:48 +0000
Received: by outflank-mailman (input) for mailman id 700366;
 Wed, 03 Apr 2024 08:16:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pmYG=LI=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rrvnb-0003T4-Jd
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 08:16:47 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82a1d1de-f192-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 10:16:46 +0200 (CEST)
Received: from BL1PR13CA0337.namprd13.prod.outlook.com (2603:10b6:208:2c6::12)
 by SJ0PR12MB5635.namprd12.prod.outlook.com (2603:10b6:a03:42a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 08:16:43 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::f4) by BL1PR13CA0337.outlook.office365.com
 (2603:10b6:208:2c6::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 08:16:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 08:16:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:41 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:41 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 03:16:38 -0500
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
X-Inumbo-ID: 82a1d1de-f192-11ee-afe5-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dah/sfWZuczEgbktwmaDgkik7ZDifEcYoxpkHZmlesS1fyvtRl1kUTQieJCbuJcN2ZGhtTMtqEUDuerA+oRYe43WbvCYA4Q/KzpJkW6ku/AFAx/3ILzaLP1QMc6y7c5NbuCSH8NDEIYbfJGo987jbBMrYwqJZ+M8wXRfEMXVaRA0faIwmz35lb+ldDP/yU/UvbR2nWakwWUk15LHoi8k1J2ByTHjz4kVX0AV7RlKZ8pSS8UpXMhzY/bBKB4cw2+ki+HQMoiG0e46a/zqUFgwgFd73iP7jwRRvrPdFlKDX+71LN2pNv1HoH3F9gULecndu1lKEyAAp+ElcENVOVzfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jrt2TDWyGFwLDPyE7dfhD/sOOfaMOtdFsjXTWYKEeiE=;
 b=CldmWVyEqIz1m0w/TWZLovaRI40mn7hLJL/dVsODPTB007WZtzFDXKSyysBNYpdJhi2RmFwi9rCK665ZhiYZRTSXK2StpyF9H6WwBcDQm/CwnMsgxnEVN/RGUGfY7+onNH7JKIxrjuVBexcJhjmS6YmzpIxFi3JbgiKH8vH9/jkUvSKR3E8m02gCpZSc5RnadFaSK+IOc/ppdoAx4dVmgeKl/pwTUJI78nfgX+UQhEBdLIPYszoILQBYqyFzUVvlVakNrsJuMvVYf8L2yzYPZpAKv8gPTGK8d2nJEHCFald8+LRfAA7A1Oey0MWJmNj2lbGp5uVlcEbItdC3c6nqQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jrt2TDWyGFwLDPyE7dfhD/sOOfaMOtdFsjXTWYKEeiE=;
 b=uQWymbalgITxZ/XcJYTSKy0b1baJkqOBt4YMN+RZNe7wuuhh7lA/82wb8TtWfO8cRROAz2iyf53QNvTbcCezIPusN1xFMSD3wetY+xEqwXxIwBIKkju3TGPOMLQ2owD5jnWjxwYcMWJAPEeyiIQz0Iuv4vCVidBN1j7/HoLto9c=
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
Subject: [PATCH v3 2/4] xen/arm: Generalize the extended region finding logic
Date: Wed, 3 Apr 2024 16:16:24 +0800
Message-ID: <20240403081626.375313-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403081626.375313-1-xin.wang2@amd.com>
References: <20240403081626.375313-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|SJ0PR12MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: f56ff361-841a-4055-3e57-08dc53b66522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qQbGXEOf5PEgz9iLiOFr0OcIDqstKoZ87ytRQbDGXN8qtd74NDOrPbgpaKvLYqmfbrIIdPlE1dcoa1Mur877fCB2drQKvuI/t+WAEe70eluGGCxhVg2OQWqYoa4NokI5axq9IexZdZdna26MgoslJC4QZr6tc4VuVC+DGLnGAZpGGZuWMnGGUUwuimpidArDr0nyXXry8LZ4fSgibEHCzdHBY+Imy/M/pwNX5TeRKObl4dqpK3HCMpUVZyFH6Fk7oBulk4nLU3L991bK86yP2pmAdTstuy0EF8d0pITAjjuucNwsstszpUiELoR+dRtv/nHUL4PEH922fVaDP4aRMNERfe6S2YFSdteSkJ4kgpHsKKoXzleHwDjXGVgGW0Tpe5fyEZgE46VZ88cKOtOLbRFNozj6uA54FvA0zus1O5QP7LABOMo3HUPiyA6OoId2F/OdBy2dCcfUk6sjVkhYC1a0R5WeLLVE4QbmCrTytYgJ/3IRcPD5U8mwEg5qLQuBg8FtIgC2x0Ha3U5mMG7fAn4ib2qiNUKOM715JYpATHbcQpQpe0onMb5ahjpzUoZ7InDuVjXIgaqK5I5MXkw8nUT3jqLLxCuJ/OJ+xYa8KKMQWDc1lkSqPCynU/dQY+7ZwmSVDhHV3FBcOtQpbP9lgY1MQw0y8raDMhN1Pe1vLMWx6FuBvQPly5Q5TEbU0eNxZiT+zrcTQcmNMLE2IpGO/ih51s2lRCzOofqayjW5vsKB/YAkTwvotFAC3LZjTLwZ
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 08:16:42.3632
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f56ff361-841a-4055-3e57-08dc53b66522
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5635

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


