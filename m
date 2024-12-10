Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FC89EADA1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Dec 2024 11:10:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.851968.1265919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxC3-0005NS-Ad; Tue, 10 Dec 2024 10:10:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 851968.1265919; Tue, 10 Dec 2024 10:10:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tKxC3-0005KL-7L; Tue, 10 Dec 2024 10:10:15 +0000
Received: by outflank-mailman (input) for mailman id 851968;
 Tue, 10 Dec 2024 10:10:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4V3c=TD=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tKxC1-0005KE-Oq
 for xen-devel@lists.xenproject.org; Tue, 10 Dec 2024 10:10:13 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2414::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0368c6d-b6de-11ef-99a3-01e77a169b0f;
 Tue, 10 Dec 2024 11:10:11 +0100 (CET)
Received: from BL1PR13CA0131.namprd13.prod.outlook.com (2603:10b6:208:2bb::16)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 10:10:05 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:208:2bb:cafe::7a) by BL1PR13CA0131.outlook.office365.com
 (2603:10b6:208:2bb::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.9 via Frontend Transport; Tue,
 10 Dec 2024 10:10:05 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 10:10:05 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 04:10:04 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 04:10:03 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 10 Dec 2024 04:10:02 -0600
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
X-Inumbo-ID: f0368c6d-b6de-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKMeFi5kGJ5YOgwe6+Hir+HdL2LgLAtTDjEUlWqwg1MnF/c0qdl++0q3w7wkkWdSOJkmDp7ix8uyvDLlSwJ3IsSqe7LZIJaJTc7UPs8tusV5EZn6hjsH0yovneL+7PYkGFDokOK+dPDyEsf7DZifC+3UbVdvXHHskSAOZ5i48tzLF/QWhAou9DgcFG62TzE0YMzWmR7daLsfL+Nj/gFGvf6XGxV6t7UxNWLP8pgYvUfhGobfCwo94CrBxeDKLS41riA5C3eYlSg97B/sv0gkXWZDUCm0WezoOyaABTQu4r7r70MQFJQB/lyLR8BE2D6v/HWl+xSJ2GA27oQBZzkaUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2FWwb6WTcr2dSFjW7+fCV8K6mYtPDhpAzQSoFWhD5xs=;
 b=mF9uZzt3IzYBBR4ZYqU485u7tXUgVuGP/XlO34nfbXI+n0yFgb/nSbBZ0i0k0/pkD7YGh9HnQINbvZ7Mtwa09onPVZzHv0K3gpv9wPpN2eweBfdHWjlavJ8cG5tkAG7IUcrInNO6GBTKYnwBnK3fb94o8IcH90LlkfmzTPnbTCJjThxjwkKk5qOcuAzAh+pqXHz6PUVqU0V2zENDquFlj65DeXMjw0dNgJSk45xVTg5KCSnuSZVnaGvuuHyr68PxP9yrqIHKTe2BlWH+5WFysOPvrTGx+Uz8fsG8UNgVnco2GZEmZbHwlTD/+yLUT81KD813GRjmsg6SBzTCnS9l4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2FWwb6WTcr2dSFjW7+fCV8K6mYtPDhpAzQSoFWhD5xs=;
 b=KB8Ym2CygfE6ssBLNHEiqmeKiXNp0qoQdzTwZx6V1TLb1jwLXwZXpzX2+r6+30uI7N8v4ycJ4eUMJpQDQ7BrIsMZm47G24xvoQJwb9i2ijoy+Rt5xY4kw4CwRtn87xDWVo2gTwDy9jBsuPVExRgNXks9ZXhWeefBIKuMP/mDfVc=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/domain_build: Make find_unallocated_memory() more generic
Date: Tue, 10 Dec 2024 11:10:01 +0100
Message-ID: <20241210101001.91578-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: e31a1813-eb57-4ccc-15a7-08dd1902d18b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?pcSvCFoB95DEqhqPoW5wZxGMPmnahcNw1Gn4z/uzD6uGNlkmtECMC0aAdXZm?=
 =?us-ascii?Q?e9+jfnsriwvVE47CpfPZaIrMrOAjceIkBipwaCcEJ3f+J1bsqMkKsJlfOcfu?=
 =?us-ascii?Q?yJIZzzS0ITtH3F+bDOCLJL9jFFMXhsaAIzqY8fcOWcTcB+sncA+auvNAYzaC?=
 =?us-ascii?Q?bQf3SvkZ6zuSGrnr3/uRfNoqJX7GBo67uxQJOq69x5Urm+MARHmtEChBQJMo?=
 =?us-ascii?Q?RWhrBDkmgu7N6N6+aWveAKTTz5bQV/AAT1fvjFCYlZqf/p1l5Ti1lbTpSB3b?=
 =?us-ascii?Q?bdgtlYjnFp/NrHhr4L/lLbZA6EOh8JaQW40gea3t9Nk8vF3HXbVIjvMyoGSH?=
 =?us-ascii?Q?zIXOjYrX4/wBNPwUzFsP+tg3MNYnOhDalKt2yIYQEM7N3Jqdmrpl5U59Kxmg?=
 =?us-ascii?Q?sYAd70pLdngJSGLv9Ky9N8zfBXmUdhZEKyTlAZK7cVhwoNH4FiDG0oWML85z?=
 =?us-ascii?Q?Q1edkGAFbhDX3c6WipaUYefrpcptppfdpfzIhJ0dDlir0+uV02UddTz/OgTx?=
 =?us-ascii?Q?P1kbmBtKc5dIbyi3Zz8rvE3F9u1XSNfltUH1X1R/pqJTSwasZ+Qy9D3cU78b?=
 =?us-ascii?Q?n4/j5sdElgyXJi11kCEA6M0kSLdbuIo6tTMAXV5P9QS35QY+TSik0KR+MxNT?=
 =?us-ascii?Q?LS5HQAe3fqQm5weJzAUL//cL6pJxA7r09voSMbxI2ZpWxU0dF9+OdCleF94m?=
 =?us-ascii?Q?pGOGD2kuLhG5KwLXcPuhFa+zu7rajSLWSnFSKpZwn9XS9hhjc3NrOqKiY3Ue?=
 =?us-ascii?Q?/ozso08fElfT5sBx6ieHtqwNU/WMFgphW3peJ449WE2O7vzWiE5KqeDMGZjE?=
 =?us-ascii?Q?D066XhFLdyXTVNXWOdC4Ly+i4+Wbv8ZOsW7VqOqb6h5CIc5JDFgmQDWB/doe?=
 =?us-ascii?Q?BDuNiPPzDXfYnyOmwfNXwf2721mGrKyAiZpqgI0skocXHmEJNvrwU7hUDtqq?=
 =?us-ascii?Q?+3UFDEEaM6gM2dhHwYCFG3Ajm4E7g1qyzsAk/stL9TOoTzdQjFPrUm7G/+1w?=
 =?us-ascii?Q?V3OX423FwIswy/D9Lb7vwS+HpgFx/Duq2TQTHcF5AtLawMdERnXPTgnmsKq3?=
 =?us-ascii?Q?Zd9ZI6iVYqVOGT2Drz21lpXaQEZPF8p16w6Ghje/mcCkzxarsorZVmidvRzj?=
 =?us-ascii?Q?368p2yhYtW3tzOj82hpb2nMCNI5d2hDH29maeZ6qEii20IR125I4x6H3+HDm?=
 =?us-ascii?Q?6uD3dP3hAzaptt1hh/UZZq2mnif7XF6GUf7oCZdrLuQ0mxjtSm5+xfuDlHXZ?=
 =?us-ascii?Q?uUXMKX50X9bdjGjjFgc9DRuEpFJpK4/dsyBP29XCVuq9iYrfi6uBZOtVDo6o?=
 =?us-ascii?Q?lFdcylNGQXgr1FRwFQ8xQznvmZAMFNkfiRdAEMqOoHZ5f0LcJXLPXfclzQhv?=
 =?us-ascii?Q?/3+OXA05tljZee1hdA4LFBpFiNIgKXN25PGUvG39PxNm9n1EjfAbi1KHusB9?=
 =?us-ascii?Q?COLcPfOVqPGXe09X433FP9CzkAxzTQcJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 10:10:05.2035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e31a1813-eb57-4ccc-15a7-08dd1902d18b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247

At the moment, find_unallocated_memory() is only used to retrieve free
memory ranges for direct mapped domains in order to find extended
regions. It is not generic as it makes assumptions as for the place at
which it's being called (domain memory already allocated, gnttab region
already found) and hardcodes the memory banks to be excluded.

Make the function more generic, so that it can be used for other
purposes whenever there is a need to find free host memory regions (e.g.
upcoming LLC coloring series). Allow passing array with memory banks as a
parameter together with a callback to populate free regions structure,
as the logic may differ depending on the needs.

Add find_host_extended_regions() to be called from make_hypervisor_node()
to contain the logic to find extended regions for domains using host
memory layout that are not permitted to use IOMMU.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This is a prerequisite patch for LLC coloring series patch 3.
For dom0 LLC coloring, we just need to pass resmem and gnttab in mem_banks.
---
 xen/arch/arm/domain_build.c | 97 +++++++++++++++++++++----------------
 1 file changed, 55 insertions(+), 42 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2c30792de88b..500005079b88 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -901,31 +901,26 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
 }
 
 /*
- * Find unused regions of Host address space which can be exposed to Dom0
- * as extended regions for the special memory mappings. In order to calculate
- * regions we exclude every region assigned to Dom0 from the Host RAM:
- * - domain RAM
- * - reserved-memory
- * - static shared memory
- * - grant table space
+ * Find unused regions of Host address space which can be exposed to domain
+ * using the host memory layout (i.e. direct mapped or hardware domain). In
+ * order to calculate regions we exclude every region passed in mem_banks from
+ * the Host RAM.
  */
 static int __init find_unallocated_memory(const struct kernel_info *kinfo,
-                                          struct membanks *ext_regions)
+                                          const struct membanks *mem_banks[],
+                                          unsigned int nr_mem_banks,
+                                          struct membanks *free_regions,
+                                          int (*cb)(unsigned long s_gfn,
+                                                    unsigned long e_gfn,
+                                                    void *data))
 {
     const struct membanks *mem = bootinfo_get_mem();
-    const struct membanks *mem_banks[] = {
-        kernel_info_get_mem_const(kinfo),
-        bootinfo_get_reserved_mem(),
-#ifdef CONFIG_STATIC_SHM
-        bootinfo_get_shmem(),
-#endif
-    };
     struct rangeset *unalloc_mem;
     paddr_t start, end;
     unsigned int i, j;
     int res;
 
-    dt_dprintk("Find unallocated memory for extended regions\n");
+    ASSERT(domain_use_host_layout(kinfo->d));
 
     unalloc_mem = rangeset_new(NULL, NULL, 0);
     if ( !unalloc_mem )
@@ -946,13 +941,8 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         }
     }
 
-    /*
-     * Exclude the following regions:
-     * 1) Remove RAM assigned to Dom0
-     * 2) Remove reserved memory
-     * 3) Remove static shared memory (when the feature is enabled)
-     */
-    for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
+    /* Remove all regions listed in mem_banks */
+    for ( i = 0; i < nr_mem_banks; i++ )
         for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
         {
             start = mem_banks[i]->bank[j].start;
@@ -973,28 +963,13 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
             }
         }
 
-    /* Remove grant table region */
-    if ( kinfo->gnttab_size )
-    {
-        start = kinfo->gnttab_start;
-        end = kinfo->gnttab_start + kinfo->gnttab_size;
-        res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
-                                    PFN_DOWN(end - 1));
-        if ( res )
-        {
-            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
-                   start, end);
-            goto out;
-        }
-    }
-
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
     res = rangeset_report_ranges(unalloc_mem, PFN_DOWN(start), PFN_DOWN(end),
-                                 add_ext_regions, ext_regions);
+                                 cb, free_regions);
     if ( res )
-        ext_regions->nr_banks = 0;
-    else if ( !ext_regions->nr_banks )
+        free_regions->nr_banks = 0;
+    else if ( !free_regions->nr_banks )
         res = -ENOENT;
 
 out:
@@ -1170,6 +1145,44 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     return remove_shm_holes_for_domU(kinfo, ext_regions);
 }
 
+static int __init find_host_extended_regions(const struct kernel_info *kinfo,
+                                             struct membanks *ext_regions)
+{
+    int res;
+    struct membanks *gnttab = xzalloc_flex_struct(struct membanks, bank, 1);
+
+    /*
+     * Exclude the following regions:
+     * 1) Remove RAM assigned to domain
+     * 2) Remove reserved memory
+     * 3) Grant table assigned to domain
+     * 4) Remove static shared memory (when the feature is enabled)
+     */
+    const struct membanks *mem_banks[] = {
+        kernel_info_get_mem_const(kinfo),
+        bootinfo_get_reserved_mem(),
+        gnttab,
+#ifdef CONFIG_STATIC_SHM
+        bootinfo_get_shmem(),
+#endif
+    };
+
+    dt_dprintk("Find unallocated memory for extended regions\n");
+
+    if ( !gnttab )
+        return -ENOMEM;
+
+    gnttab->nr_banks = 1;
+    gnttab->bank[0].start = kinfo->gnttab_start;
+    gnttab->bank[0].size = kinfo->gnttab_size;
+
+    res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
+                                  ext_regions, add_ext_regions);
+    xfree(gnttab);
+
+    return res;
+}
+
 int __init make_hypervisor_node(struct domain *d,
                                 const struct kernel_info *kinfo,
                                 int addrcells, int sizecells)
@@ -1226,7 +1239,7 @@ int __init make_hypervisor_node(struct domain *d,
         if ( is_domain_direct_mapped(d) )
         {
             if ( !is_iommu_enabled(d) )
-                res = find_unallocated_memory(kinfo, ext_regions);
+                res = find_host_extended_regions(kinfo, ext_regions);
             else
                 res = find_memory_holes(kinfo, ext_regions);
         }
-- 
2.25.1


