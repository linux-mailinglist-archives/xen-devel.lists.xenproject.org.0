Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF6CAD5D7E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 19:51:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1012051.1390609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPbj-0004wh-1b; Wed, 11 Jun 2025 17:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1012051.1390609; Wed, 11 Jun 2025 17:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPPbi-0004uT-UC; Wed, 11 Jun 2025 17:51:26 +0000
Received: by outflank-mailman (input) for mailman id 1012051;
 Wed, 11 Jun 2025 17:51:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTnm=Y2=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uPPbg-0004au-TJ
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 17:51:24 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20628.outbound.protection.outlook.com
 [2a01:111:f403:2418::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b02e8e19-46ec-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 19:51:24 +0200 (CEST)
Received: from CH2PR18CA0056.namprd18.prod.outlook.com (2603:10b6:610:55::36)
 by DS7PR12MB5742.namprd12.prod.outlook.com (2603:10b6:8:71::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.18; Wed, 11 Jun
 2025 17:51:18 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:55:cafe::fd) by CH2PR18CA0056.outlook.office365.com
 (2603:10b6:610:55::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.21 via Frontend Transport; Wed,
 11 Jun 2025 17:51:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 17:51:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:51:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 12:51:16 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Jun 2025 12:51:15 -0500
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
X-Inumbo-ID: b02e8e19-46ec-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMFqcERwWDoSUDEoD/hYDKZcSOCFqPOuOJrUmsc8sbH9qCTcuPJOqbx28FBI/MZW3P0wM1XsqWZsYicGQMJWJhB31c5gmd2hGlcWiWo4bYE2K5QQPATXveh363inF231DBLo3Oz1b8/cTsaGyAeF3QkJqmakK+ogLAjqlBbJlHNxN+h8udUrOc2lYd/829spsxmQVLqiXJAcoaX9UGqXaZyjpiWvvIIDdxm1xvUQv1rJseOVnRP42EEPg8JIOHTeOvIxDyyeQiNpkLp6jVmPiDUUkQmdYI+jWZABp/+1bC9pqXvxk/FEgH1kcE9zOADNxsZVZUQI7zyVoRq/Gm1c/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGmqazHG8KK3KvSeo0zM4HF7mf0mYqw7CBlFxC1daAE=;
 b=rBONs30pi728r7QrsrZ5pMfTAC+I7Ff81Xiy0Q/EEjI6hjQn9sDb4A9yxuootq8gKLuBvfDP0W8Pt3YqvtjLF80jTV3MsUL1y+WAP9YRGF5OHdIOFV6bGu9AMVL6pg5yjPeCFaHesNheNv+bJJbIRRf7q4HD4QxxsyGo2Afb/xCRjmcdU3hQiGeTKE05a/COA6fjFkny6Y7h0pgJKQmiMOkBZcwu9PRiM/kl19CB7wqOfAXOlYjpZlsavh2hod8GI/NcgAAosulXhsLVQJguzcW/oXw+oMJncCh4rPIIvS7CYXJWIrFg8H75IqglYJNAFb7aAI9u6JvST7wJeKyexw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGmqazHG8KK3KvSeo0zM4HF7mf0mYqw7CBlFxC1daAE=;
 b=J9kvqau/dc2iQPfhvnpLHi71GHQhxMWxaa0oclSmFMsQIDkKhBHaL4ALnxoqAEvmb2Lh8U4+uTt7rGJ0MrPnSm50Q+9+u6rGJj0IQ5cKUBhm5krVtqphKz5S+v95szdSXpD7zs4m6MmdPCjpURNFiBsqeFXE+aco6JtzAdS7qP8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v5 1/2] xen/arm: exclude xen,reg from direct-map domU extended regions
Date: Wed, 11 Jun 2025 13:51:03 -0400
Message-ID: <20250611175106.269829-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611175106.269829-1-stewart.hildebrand@amd.com>
References: <20250611175106.269829-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|DS7PR12MB5742:EE_
X-MS-Office365-Filtering-Correlation-Id: 79dc2d44-ed21-47de-f0c2-08dda9109143
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nMtf5re1GBEoaUrL8XfurncGXQYHbJWUqMdFY/Y9atPq27P3/kJk4n2HJfFd?=
 =?us-ascii?Q?/EpadufYrWWFkRlgHVNe7n9njniGrKL2/4SVxjYWNR29iOiUIAYnLrCoVCws?=
 =?us-ascii?Q?/6PevyIaAUxZUqiKYrC/eYlAjC7aid2oCOYehAeqyJelM3DH5/H2z0gDabYS?=
 =?us-ascii?Q?WHIjAwC+2DqWlzGpvp3O3+4s9wSS8hpTexTmfYiJm1tOf8K8lr44JR7byUdC?=
 =?us-ascii?Q?cRjoq5xk3SbIbbl4OVkz1FoIE9+yClBwHcJXz3n8HonKSm04e81zpqHtILHU?=
 =?us-ascii?Q?poxVMjB4GoW9f4k7n63cRhJtON0ahXpz1OLnK5MerI+cmpw7GXEU88g8JG9Y?=
 =?us-ascii?Q?NC3ahARTMlFDGkF5g/p9WOG0mdKiW/ccjVjWpgnnnjs4pBRejV1MwVzfed39?=
 =?us-ascii?Q?cCa4O+xdtkot6iT61jqZ0NUv/tLnavcanGaiXtKzm8ieQ41yADKbP98/iEdB?=
 =?us-ascii?Q?2W+OH2T4Vk76G+wEVG37RZ2w6xDdPMtlM//Zp62YPqv2BKZNF8nBv6JSqzkk?=
 =?us-ascii?Q?FKR5XQkeb111BuVCJBuWu0hznGh8JjkZJHQCh4X1Sc6UTUD6r6io5xusB9iP?=
 =?us-ascii?Q?MZDtIt/luWx8xdVmRwafIx3Tvh76+qYaA7HXbHwTjMi+xz++HlMQ4gEj1Ufk?=
 =?us-ascii?Q?J6Ca8kFehQkAHk4kweI3pLGfB+QoYvu9VkPigFqfozI24LM9W2gdGuIpDar9?=
 =?us-ascii?Q?KKsQXr6/sSgyGVpu88bP/KOhQZBj2RcuM84JujWYJ6Eac84Oau+ScvDP0cJW?=
 =?us-ascii?Q?eyDC8o26WZIRrlvqSKLDy1g72Zwi4fzGSPFVNmG+EyCSweR4vb2nfLiPHptt?=
 =?us-ascii?Q?CXKdNDOqXbUOFZYWZiMSle9w/Xn+/OEoaUSntXU27WYzwYezKaAgUYwGRkvf?=
 =?us-ascii?Q?xV2S1OHPWuWXQmrN/9OOC3U/KdAH15Bl1VYyLCru7+YHPgHuxRD8T9GoBCm2?=
 =?us-ascii?Q?5mIF2o8pTCkDTNd/h1n9THTk4m1f8h4nsKYHRR+0svNtyB2DHz1xi8KLBio5?=
 =?us-ascii?Q?Ki7G6F/7Uvc5/tPCjGH5kC9xCMZRDFcjJX5no9bknh91e4AQhcsS4gnPiS5Y?=
 =?us-ascii?Q?UfTKGuRI8M2EmClqkvoni1RhVFRvCGskBB82wiIdlQGVLcqWm4VtUL1LT8o9?=
 =?us-ascii?Q?o+TixcjUOGIEYtnsijVvUIuYhCclJf7G3YyiV57nubwb51JdvSzy+5ue/95E?=
 =?us-ascii?Q?02cupB3RVFiMkvRjOth1ID88KRwqkEzhMWJ7/P2FsOSnuSBBVX9IrxbL6TGa?=
 =?us-ascii?Q?eS6NhKZgqcKZEO5JwU6Nqq8UfshzykVP2p4/8iTV73g2fyRHuB7HdVDyuf0n?=
 =?us-ascii?Q?Bt7b04NhXawv1QIF2vG/D51ZYLjXyInJmYDH5UtHYvjxuTf0t2BrLXtfZpcx?=
 =?us-ascii?Q?yg1rLCZ94qyJo/CL74hRv4ASe0iz1Y9T5uWXPL6tNtBJsCkmVO+AcAQZrCPm?=
 =?us-ascii?Q?ejI1+e2rkQU3gQzSBvvJbkl04NHUs7DpFISN+LfiSJ3DyN+Xvc3GpwGJE0bs?=
 =?us-ascii?Q?aKXYRjWiCbfSAdtq6Budbdr6jm9emJDvSL92?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 17:51:17.7665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79dc2d44-ed21-47de-f0c2-08dda9109143
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5742

Similarly to fba1b0974dd8, when a device is passed through to a
direct-map dom0less domU, the xen,reg ranges may overlap with the
extended regions. Remove xen,reg from direct-map domU extended regions.

Take the opportunity to update the comment ahead of find_memory_holes().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v4->v5:
* remove extranous -1 and +1
* create local helper function to count ranges

v3->v4:
* conditionally allocate xen_reg
* use rangeset_report_ranges()
* make find_unallocated_memory() cope with NULL entry

v2->v3:
* new patch
---
 xen/arch/arm/domain_build.c           | 80 +++++++++++++++++++++++++--
 xen/common/device-tree/domain-build.c |  5 ++
 2 files changed, 80 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 590f38e52053..cef6c85e22ec 100644
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
@@ -962,11 +971,51 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
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
+static unsigned int __init count_ranges(struct rangeset *r)
+{
+    unsigned int cnt = 0;
+
+    rangeset_report_ranges(r, 0, PFN_DOWN((1ULL << p2m_ipa_bits) - 1), count,
+                           &cnt);
+
+    return cnt;
+}
+
+static int __init rangeset_to_membank(unsigned long s_gfn, unsigned long e_gfn,
+                                      void *data)
+{
+    struct membanks *membank = data;
+    paddr_t s = pfn_to_paddr(s_gfn);
+    paddr_t e = pfn_to_paddr(e_gfn + 1);
+
+    if ( membank->nr_banks >= membank->max_banks )
+        return 0;
+
+    membank->bank[membank->nr_banks].start = s;
+    membank->bank[membank->nr_banks].size = e - s;
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
+        ? membanks_xzalloc(count_ranges(kinfo->xen_reg_assigned), MEMORY)
+        : NULL;
 
     /*
      * Exclude the following regions:
@@ -974,6 +1023,7 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
      * 2) Remove reserved memory
      * 3) Grant table assigned to domain
      * 4) Remove static shared memory (when the feature is enabled)
+     * 5) Remove xen,reg
      */
     const struct membanks *mem_banks[] = {
         kernel_info_get_mem_const(kinfo),
@@ -982,12 +1032,29 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
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
@@ -995,6 +1062,9 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
 
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


