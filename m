Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B70ADDAEC
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 19:54:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1018404.1395310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaWA-0008KU-G9; Tue, 17 Jun 2025 17:54:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1018404.1395310; Tue, 17 Jun 2025 17:54:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRaWA-0008I7-CP; Tue, 17 Jun 2025 17:54:42 +0000
Received: by outflank-mailman (input) for mailman id 1018404;
 Tue, 17 Jun 2025 17:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9LFW=ZA=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uRaW9-0008Hi-0K
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 17:54:41 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20617.outbound.protection.outlook.com
 [2a01:111:f403:200a::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1cf72c56-4ba4-11f0-b894-0df219b8e170;
 Tue, 17 Jun 2025 19:54:30 +0200 (CEST)
Received: from MW2PR2101CA0030.namprd21.prod.outlook.com (2603:10b6:302:1::43)
 by DS5PPF4ACC15C0E.namprd12.prod.outlook.com (2603:10b6:f:fc00::64c)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 17:54:24 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:302:1:cafe::f8) by MW2PR2101CA0030.outlook.office365.com
 (2603:10b6:302:1::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.4 via Frontend Transport; Tue,
 17 Jun 2025 17:54:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 17:54:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 12:54:21 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 17 Jun 2025 12:54:20 -0500
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
X-Inumbo-ID: 1cf72c56-4ba4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lmiBZkTK2Ey9+NOXdUOK+Yb4tekdt22SHhu8QCCCGAjvoZti5YbhuQKfvwbkHXhNpHYVdGvosRcZh9zepifveKIhaktIQNzdyU4XHANCyak99/C9UEuQSFtLtCGasCrulwGRAlGiyp32fyOqZPhsRRqyc4vdB0D+RNwbAsunQlgfcz+iZOMrZpYcEpZkkWNWgOiOqx0CKcaOyWyhDQPa0JrGl26KI7mntJwgR9+qcPg3E6PhgX90zZbyXYKA/ldpw0ft7037ZvoryEMORia+QH1rh54p+GfWNh+BSIrzAv8jcRcaDMTqDmmB1iUukgqzehg4bmFfBGs6ctqa+pzGgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTmpaxR8fmnRkqMk+mbPZ48PkiFD8VMw7o1OmZesvR8=;
 b=lxBM4QrSrXXN1PgkGEhwUF/h/i05FHegauD/i2M5YJ4oFbzgaz8wdkjZd10TwiE/IR/ZBwYxByWjjpDt1dTE4rCHj+89viw4kB5oUY8Q1Xrxy+GJ0wSMSGVhE6Kkp/8APYuwIQO+69cYrT8UGja2Pf8U9AxIgdhIdz6MOmi49uhgu/51hqSNFimnPMnshgUucRq4NMNthfpCxgSIU15gCC8+xCig7oD9SZlqXyiRGQIpG1H0YIhibcBla9sO9v1IwAZqrkTLu09bXvzN/YMRSw2Du8JF0thofrC+UXhSHlb4PW+0K2+bL9I0Ud2p3oYBXljizBURwCz0mzhT46z7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LTmpaxR8fmnRkqMk+mbPZ48PkiFD8VMw7o1OmZesvR8=;
 b=VSs4Qzg8q+v/7m5mowpIaI+yVJJV8UayDYF+1tr8CzNyV2Y3afBM7x2/ESk4Qqu2X1MfdHgZ3PoiDs8+198U93f3EvhVCBpQPp9DuKl2kHKujVq/Tn26cEiqeX0KJHn11LiP/FzN0w/Wp2pbSc/nYF/rM2cLhmX+cAPI9LA7b9M=
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
Subject: [PATCH v6 1/2] xen/arm: exclude xen,reg from direct-map domU extended regions
Date: Tue, 17 Jun 2025 13:54:04 -0400
Message-ID: <20250617175411.398083-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617175411.398083-1-stewart.hildebrand@amd.com>
References: <20250617175411.398083-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|DS5PPF4ACC15C0E:EE_
X-MS-Office365-Filtering-Correlation-Id: 14ecaf2a-aa8e-4071-561f-08ddadc7fdcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/Z9O229qL4uFLZe/ZbYALPLvZyDaEDfRGqvly/5B+nX/zgmuqAFtNPjEr4J9?=
 =?us-ascii?Q?wQiAt3AuiWopgwuBda+rgi8VmNJuFAvBsOTCrfNX+dmRmUCCIehe+xTas7P6?=
 =?us-ascii?Q?mioHbfOy3wQibZ/VDqDhPZfRmE5UFYOwChB5S+tkA8Gd4ADdqp/xavj+Hl7Y?=
 =?us-ascii?Q?HeIgzRgSiJmNZ2NvOj75OD3Xt9LzL8mvNc3HomREa42I+JOZIVkjpv+neXGl?=
 =?us-ascii?Q?sjZyudkg9rAk89gdgqLvNj8nkQ+/zPkEimF+E1ivmiCLCdQNLZuunN6vR5KW?=
 =?us-ascii?Q?xfVbkRqVFDHwsHVNS6UIZRJ0QGwqFCOe/Do5YL8t3Spid9r3CwZo55uAdf8x?=
 =?us-ascii?Q?zxOUFmqDSUVFINUr8I8FzifxsTlLVIq8Gdds/sPFQm3GIEAn+h6ZyJgjOweu?=
 =?us-ascii?Q?+uA3E82rk7HPzt+RjuslGjk9ePeJOlEDpvCR8tXsTqhfNvBybdMdY7Vh9hDG?=
 =?us-ascii?Q?X37eF1FJOih9fCLvwlR1BBO0sjmnG+Jm3pbv5cRH515mOgnoW4hwvt1ZDKkx?=
 =?us-ascii?Q?AA7nmo4NaGsxR6oqlyGltD8hzF4sqiw16vZKhrvVCdEJg+wlum4/0BB7ljq4?=
 =?us-ascii?Q?ky3GNVqvVGUl+h5w5JAMP6V7P3Kw6Y4rdfTW2EQvGVsfwJgG9pZzrkVNLj9i?=
 =?us-ascii?Q?kvlPPHt3BAcWLQ4OMLBMNB0JV3mE51OAqNKIbTbFaFV66IM8g0dxcwPESQQH?=
 =?us-ascii?Q?/lft+KEP96QH/w8RPb2RsXvLVR2lFMB2F+lnS37dyk/z7mrD2ZA4HPZ5N1g5?=
 =?us-ascii?Q?8+Db/wbeKfNtRpsFPjKKF0ArOc2Y1zNHRfMylh9bsreLokNRhe7XwxKY2X4i?=
 =?us-ascii?Q?wxiJn2WRR+naIPOYmyf0dC+pFT0hES6CtEuLp7f62F54kLzM8oGm5iD53EsT?=
 =?us-ascii?Q?7nDsh3hGYACmPmcl/bmzZobRJL1VX/efMsOAFgfA5NwysBAptX7OmdA6Xn3N?=
 =?us-ascii?Q?1Vg2SnRBmvnFIiQ5Dyb8xoiZFaiv85VNHDIruZ0UaWS1oOBCIA7yog0bXdiS?=
 =?us-ascii?Q?A9GdGSiNFv4d/9NIsW49+WYx4fSFTV4BXfiyKWs/fxOONNRceDysXKsWSdTm?=
 =?us-ascii?Q?vm9zVTOIsh550DgBK5E4de/jY7nK2+eg+STvrelN1GL74Xcv2lfVFqzjSL1h?=
 =?us-ascii?Q?IxuPu4TOfqZMplKCwL4biBSI7QoIjpOCW4Ky4Aj01H0aw1csir4ttwNvKTH8?=
 =?us-ascii?Q?ikr3/JLTfIVElNhIKxuWi7O+FcqWrIjx/4BqDBE4h4i6CjKSAXOS16pmuAk9?=
 =?us-ascii?Q?f8fLus/c1xGRR967PNC5hanTX8J2LNxaHbglfZHfXqEEMRFzX0iaLZsBRWR5?=
 =?us-ascii?Q?SEFvFXxhr3+KaEqHT8RY9YLvVVu5OewZLQsmjvNMqHAL9mJyhYGGCbNMRKBO?=
 =?us-ascii?Q?o0ZjyNj1Ufw3+DC0qmkBxOm25CfnT2SCjj9YxpWsr8L5qOuYlthj/VXr++bp?=
 =?us-ascii?Q?ok8u2MlARRqs7ts6s8zDBCNjsBVVQb2bYmA7gN9WNyKllLRS2boAY4VRX23v?=
 =?us-ascii?Q?YPdWcFToEErY44BDN91P9IxygpZKs4ZbhQeQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 17:54:22.3150
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14ecaf2a-aa8e-4071-561f-08ddadc7fdcb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF4ACC15C0E

Similarly to fba1b0974dd8, when a device is passed through to a
direct-map dom0less domU, the xen,reg ranges may overlap with the
extended regions. Remove xen,reg from direct-map domU extended regions.

Take the opportunity to update the comment ahead of find_memory_holes().

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v5->v6:
* s/Dom0/hwdom/ in comment
* add _gfn suffix to args in count()
* add (void) to indicate ignored return value of rangeset_report_ranges
* add Michal's R-b

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
index 590f38e52053..077c4a2494f4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -792,15 +792,17 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
 }
 
 /*
- * Find the holes in the Host DT which can be exposed to Dom0 as extended
- * regions for the special memory mappings. In order to calculate regions
- * we exclude every addressable memory region described by "reg" and "ranges"
- * properties from the maximum possible addressable physical memory range:
+ * Find the holes in the Host DT which can be exposed to hwdom or a direct-map
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
 
+static int __init count(unsigned long s_gfn, unsigned long e_gfn, void *data)
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
+    (void) rangeset_report_ranges(r, 0, PFN_DOWN((1ULL << p2m_ipa_bits) - 1),
+                                  count, &cnt);
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


