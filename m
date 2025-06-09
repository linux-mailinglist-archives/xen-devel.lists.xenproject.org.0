Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C58BAD25AB
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jun 2025 20:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1010405.1388518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOhKm-0004YF-R9; Mon, 09 Jun 2025 18:35:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1010405.1388518; Mon, 09 Jun 2025 18:35:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uOhKm-0004W0-NT; Mon, 09 Jun 2025 18:35:00 +0000
Received: by outflank-mailman (input) for mailman id 1010405;
 Mon, 09 Jun 2025 18:35:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7/lO=YY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uOhKm-0004Vd-6X
 for xen-devel@lists.xenproject.org; Mon, 09 Jun 2025 18:35:00 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2009::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 707f2a5f-4560-11f0-b894-0df219b8e170;
 Mon, 09 Jun 2025 20:34:56 +0200 (CEST)
Received: from MN0PR04CA0012.namprd04.prod.outlook.com (2603:10b6:208:52d::31)
 by CYYPR12MB8990.namprd12.prod.outlook.com (2603:10b6:930:ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Mon, 9 Jun
 2025 18:34:51 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:208:52d:cafe::ff) by MN0PR04CA0012.outlook.office365.com
 (2603:10b6:208:52d::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Mon,
 9 Jun 2025 18:34:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Mon, 9 Jun 2025 18:34:50 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 13:34:50 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 13:34:50 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 9 Jun 2025 13:34:49 -0500
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
X-Inumbo-ID: 707f2a5f-4560-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxs3JEd6KzLI9ubbxdOirv1MJ0MsHlh8R+E+jAcbtPLQK3TPlbXIfS1lRHip2eFTLopc8IZZ5o+RYsG5ib88A2pu582r+oOAuzkTtvWMK1/ppY0w5sOSIVkZLvxEMBLwdTt+5hNekMfDsiDjWi7iCy0enhLM/5q2wZAqDfp/Bpwozxo3sfpeLBxaTN62ch+AJWrwgmTqweSWraK4peJvNE1FBf+CmW3r4bn7BZxYcXnUUGfEbm4xYmzeMGi8kAUiwh8c2JN+62a3N3DoSYa71czPsH8tmQMne30znoB8cN+bWvIkX9usAZNuq1cBFHaP9oq6yWdmpANc4rnlf9KYmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jy3/PnBlKCLoGe2ac+z/3nKSFm8cz+n19wqlfOIaulw=;
 b=l/2jsWLL88Wu18wHcq3ZkeQAzLOa+B9T9N9FLm8E9T5lR11t7QPIYHYcnsxwjqpBfDW8WciBktbJN2x8oMCoOOBIm52d7wCIGr9vixVH5a/cu3P3M9MON1rQgq6/i+aJsCba8YpJ/45KcHeFtr3PyHIDLX6sBfLtJXV7wrjnHgHqUE2ZKiYKIdsSIrcHf3fVVo4UUrRb/JSvIvCzgBLOd8mP+89+EsnLAxBFSj3Uj6mBnWsKXJc23vYFI2+uzqbUhJuDzkSfPd9zuJ0VFPV2tf438Xi37DSrNZBbUsv3OacZH2PwZfRgbaIcZNfJyC8jqKF7UC7UHTnNGsMsiNm90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jy3/PnBlKCLoGe2ac+z/3nKSFm8cz+n19wqlfOIaulw=;
 b=q7LkVMOSzCu+waenvQURiNTRbwzWYrSk6tAyPd5BXChil+Vpt+uChaur+0V7Dx93J7dXpU1vwaH/w30Q6kghd8Zqx4uwYpTmaRHkq8KEwz7qV5ekN+K0+K33UhGFEoi01liw0yVnJ02bIBbYxYC8dFSBeuqTR0RBH0xcub40O4A=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/2] xen/arm: exclude xen,reg from direct-map domU extended regions
Date: Mon, 9 Jun 2025 14:34:32 -0400
Message-ID: <20250609183438.178214-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609183438.178214-1-stewart.hildebrand@amd.com>
References: <20250609183438.178214-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|CYYPR12MB8990:EE_
X-MS-Office365-Filtering-Correlation-Id: df7a48ae-f14b-48e9-ff03-08dda7845207
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BEEOXhoRAhyj9OZ/YtV36p/PlgI/nSS42RhC8aMqnSN9DjzwM0XjvncrVOKV?=
 =?us-ascii?Q?4WhM3N9Nbl5JcjbH2Wl7lfzWF0tVPE8kgc1Ag1nbLmtCoqMBeLCUDCJUxO+d?=
 =?us-ascii?Q?lPe+c5zIztYUr9+5++ekVLbthsDEjFIxRX7LLger/tdVAspKlA5Alqa6ZAnx?=
 =?us-ascii?Q?eXcI4llv1eDDJ9MWTZr12H1m/dDVy82YouozyonpWonRqgpceamAB59866rn?=
 =?us-ascii?Q?vD/bymLAF4/eOiKUBYXpapMwEf+CZdFXWQfWpfzq0GYtPu6c07y4FLujEZcZ?=
 =?us-ascii?Q?Zc/CTzvvhTPkCwFEHUB2WQnLc1b0wOOiI/lwKo88AqxxF0ycDJ/wQbs8j8Sm?=
 =?us-ascii?Q?HGtXRKuRo3wo/A02hTDuWob47BPf6FraCxnipFBbQs4gV5NGHTbB40Ox/tXY?=
 =?us-ascii?Q?0HEyoPth5Sx2a7vNDk2unjararlFL5l/PK8x/3h2/Z+8kRch2F3QS4Co1QxY?=
 =?us-ascii?Q?jta3EfXfvAl/DF9DL51BrnW5q+oaz9kJsom65ZNcJo1AMeu5B3tfWEZgsuT/?=
 =?us-ascii?Q?yJG0u0kR61wuomXr2tbHQCXe1Iympbd2fhy+4TR/L33U4EkXmPwqUCn8VpLO?=
 =?us-ascii?Q?uLm/JxTCi342zeS/w4Uj4QkdPtOF0NXwpsGRkD7w/o6/TzBqxiftQpb4OLfB?=
 =?us-ascii?Q?YlNYVlkxaOBc550bTAY1As9D8/vk5BG1KEssLoKZyGVA/Jpyq1PrLhOl46s2?=
 =?us-ascii?Q?Zzt+OVWNF8UyuwmUKRef4S2Z+L4YXWenJh1W5wNIpQCnV5OcixRLMne0q/99?=
 =?us-ascii?Q?pkesfvSGZTGHqYWCawD360FSSWz49TWX+zIc77R0CqXUy8IsLbyBCvkCHSu/?=
 =?us-ascii?Q?Rsd3jvUT2VHvzH2Eob3UEOeBvhlFppUqNbyVPMppItse4lFJNRjYzIAMXqOK?=
 =?us-ascii?Q?2+6Vk/Y+3q1N+uZ4dQswseA5n6NDT9EKhykxGYqHEaglQcV0CI5zBDEbhCA8?=
 =?us-ascii?Q?Rw+MDJcn6h5rrgwumpVnSBQa9zloAT3+bAc5mMf3D5jTbRsY0uxiLY0nXf/n?=
 =?us-ascii?Q?v+niyGJ0N6IqEeTKxxYih5m8nWzsMQOt17xUYJxw6RKqikv1EZoYxgAHZA/9?=
 =?us-ascii?Q?+7odKILSkN7PAb+Pdm3j8HsccMAvPW9/jlEdnh9TUwq4N0/RkjlsvoxA9vvK?=
 =?us-ascii?Q?xTIHx6ynZ5E/hgvZvzLlNPorUXUy/5jSa5ZDVyA7mMNDSVxFVvJihBsrpB+y?=
 =?us-ascii?Q?N69Q2tZ0erFjYZqjlqaznukWW9ORJLj83q1hwwoeEwbjj8SeOFE826hB6Kz/?=
 =?us-ascii?Q?14Ezn1RpFPMumWu4oJsS6CmwywC/Ih8rN95wxJEoVwsdoTW0dZXx3RpIBjWn?=
 =?us-ascii?Q?3MtYb6BDdpo/9P8ygG3g9a23N845RVp3cAqp81aUCWNCAp/kldu0P7e/g3K0?=
 =?us-ascii?Q?J4l64m0ci6xTkdJ5eV3u9v2uD+ur6qBdSK2NaVTpAJavRhTof0Hn7IOMHrEH?=
 =?us-ascii?Q?EauC9hSR3nA17xlqmsJHXS0WnVwsM0XpLUZm5ZUfXJyIJPp+m3nLYEAa1fWJ?=
 =?us-ascii?Q?ZvI7qgkBWBcGlzW53RVrJcIUjvmR7w78Re1q?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 18:34:50.9833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7a48ae-f14b-48e9-ff03-08dda7845207
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8990

Similarly to fba1b0974dd8, when a device is passed through to a
direct-map dom0less domU, the xen,reg ranges may overlap with the
extended regions. Remove xen,reg from direct-map domU extended regions.

Take the opportunity to update the comment ahead of find_memory_holes().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* conditionally allocate xen_reg
* use rangeset_report_ranges()
* make find_unallocated_memory() cope with NULL entry

v2->v3:
* new patch
---
 xen/arch/arm/domain_build.c           | 77 +++++++++++++++++++++++++--
 xen/common/device-tree/domain-build.c |  5 ++
 2 files changed, 77 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 590f38e52053..6632191cf602 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -792,15 +792,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
 }
 
 /*
- * Find the holes in the Host DT which can be exposed to Dom0 as extended
- * regions for the special memory mappings. In order to calculate regions
- * we exclude every addressable memory region described by "reg" and "ranges"
- * properties from the maximum possible addressable physical memory range:
+ * Find the holes in the Host DT which can be exposed to Dom0 or a direct-map
+ * domU as extended regions for the special memory mappings. In order to
+ * calculate regions we exclude every addressable memory region described by
+ * "reg" and "ranges" properties from the maximum possible addressable physical
+ * memory range:
  * - MMIO
  * - Host RAM
  * - PCI aperture
  * - Static shared memory regions, which are described by special property
  *   "xen,shared-mem"
+ * - xen,reg mappings
  */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
                                     struct membanks *ext_regions)
@@ -882,6 +884,13 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
         }
     }
 
+    if ( kinfo->xen_reg_assigned )
+    {
+        res = rangeset_subtract(mem_holes, kinfo->xen_reg_assigned);
+        if ( res )
+            goto out;
+    }
+
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
     res = rangeset_report_ranges(mem_holes, PFN_DOWN(start), PFN_DOWN(end),
@@ -962,11 +971,48 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     return res;
 }
 
+static int __init count(unsigned long s, unsigned long e, void *data)
+{
+    unsigned int *cnt = data;
+
+    (*cnt)++;
+
+    return 0;
+}
+
+static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
+                                      void *data)
+{
+    struct membanks *membank = data;
+    paddr_t s = pfn_to_paddr(s_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;
+
+    if ( membank->nr_banks >= membank->max_banks )
+        return 0;
+
+    membank->bank[membank->nr_banks].start = s;
+    membank->bank[membank->nr_banks].size = e - s + 1;
+    membank->nr_banks++;
+
+    return 0;
+}
+
 static int __init find_host_extended_regions(const struct kernel_info *kinfo,
                                              struct membanks *ext_regions)
 {
     int res;
     struct membanks *gnttab = membanks_xzalloc(1, MEMORY);
+    struct membanks *xen_reg =
+        kinfo->xen_reg_assigned
+        ? ({
+            unsigned int xen_reg_cnt = 0;
+
+            rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
+                                   PFN_DOWN((1ULL << p2m_ipa_bits) - 1), count,
+                                   &xen_reg_cnt);
+            membanks_xzalloc(xen_reg_cnt, MEMORY);
+          })
+        : NULL;
 
     /*
      * Exclude the following regions:
@@ -974,6 +1020,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
      * 2) Remove reserved memory
      * 3) Grant table assigned to domain
      * 4) Remove static shared memory (when the feature is enabled)
+     * 5) Remove xen,reg
      */
     const struct membanks *mem_banks[] = {
         kernel_info_get_mem_const(kinfo),
@@ -982,12 +1029,29 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
 #ifdef CONFIG_STATIC_SHM
         bootinfo_get_shmem(),
 #endif
+        xen_reg,
     };
 
     dt_dprintk("Find unallocated memory for extended regions\n");
 
     if ( !gnttab )
-        return -ENOMEM;
+    {
+        res = -ENOMEM;
+        goto out;
+    }
+
+    if ( kinfo->xen_reg_assigned )
+    {
+        if ( !xen_reg )
+        {
+            res = -ENOMEM;
+            goto out;
+        }
+
+        rangeset_report_ranges(kinfo->xen_reg_assigned, 0,
+                               PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+                               rangeset_to_membank, xen_reg);
+    }
 
     gnttab->nr_banks = 1;
     gnttab->bank[0].start = kinfo->gnttab_start;
@@ -995,6 +1059,9 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
 
     res = find_unallocated_memory(kinfo, mem_banks, ARRAY_SIZE(mem_banks),
                                   ext_regions, add_ext_regions);
+
+ out:
+    xfree(xen_reg);
     xfree(gnttab);
 
     return res;
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 6b8b8d7cacb6..99ea81198a76 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -193,6 +193,10 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
 
     /* Remove all regions listed in mem_banks */
     for ( i = 0; i < nr_mem_banks; i++ )
+    {
+        if ( !mem_banks[i] )
+            continue;
+
         for ( j = 0; j < mem_banks[i]->nr_banks; j++ )
         {
             start = mem_banks[i]->bank[j].start;
@@ -212,6 +216,7 @@ int __init find_unallocated_memory(const struct kernel_info *kinfo,
                 goto out;
             }
         }
+    }
 
     start = 0;
     end = (1ULL << p2m_ipa_bits) - 1;
-- 
2.49.0


