Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B91875C29
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 02:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690079.1075778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPS0-0003Gp-3c; Fri, 08 Mar 2024 01:55:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690079.1075778; Fri, 08 Mar 2024 01:55:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRz-0003Ds-WD; Fri, 08 Mar 2024 01:55:08 +0000
Received: by outflank-mailman (input) for mailman id 690079;
 Fri, 08 Mar 2024 01:55:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riPRy-000262-Ih
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 01:55:06 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2409::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e18692dd-dcee-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 02:55:05 +0100 (CET)
Received: from CH0PR08CA0008.namprd08.prod.outlook.com (2603:10b6:610:33::13)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Fri, 8 Mar
 2024 01:55:00 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::bc) by CH0PR08CA0008.outlook.office365.com
 (2603:10b6:610:33::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 01:55:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 01:55:00 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 19:54:59 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 17:54:59 -0800
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 19:54:57 -0600
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
X-Inumbo-ID: e18692dd-dcee-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=imiHSEHGSKFUxX351jEEMbsY5UW+40/WFtHMOEaDJdhAIax8YrU1FASa2FuDtJ1e2MLxbRePU1A/w8FtOP88TRSNIANvAkSxA8XORyZFA3jktPPbRBiz63mbqUW6kky0n3uhziP2KzqgdVnOH36oF5au/2QD8Ra5z0ebkAw6Oa4Oh8YLo7G0aidlWx6E2I27dRz8GnKTTyyFuZc0e7sXGrNmVk+FTryuuHAsYAZw+T2qmEKXyvajEvbGnPDsHb45fZn4qyCSYmu6cm+yGOp6o35MeChQb+3k1FFR+EclbUsjO5PHgWX9flE5W/fj4IEv5om0LEriDLxzLl1f+h2Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE58BMIuONHX86OiEvm3TsjUfQMGClGr8nUX/wXf4kY=;
 b=ie1kjj8PIHBKlY8lnXGfTlKkvZ4zXX5XR+sTVaebriEBPfclQIAF6bHRPaDIkFWrzoE3XR7N86ML5a5gghC362cEwqbhOytOeI+4G1p3TDQTPb0ZKIGkOwJFcsTP8QKNsyDQFR6VeE7ETw9cnmG+c++a/wQam6OsVjg+Mlp3lQHxyR89nIBCityOpxsuXmWnKi1WNlOTRCfPwioyVol0geMhNqh955hbu1JH2KLOBi80KPvFoOAUTTnKm8E/t466BorQjXaPTi7g2bs+iQFzn8Ahii5ddGyZJO4NupO3g8RwIr7T5HtLG/2c+e+UdciZXTsTpIMVk7vJwf1S8CskBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE58BMIuONHX86OiEvm3TsjUfQMGClGr8nUX/wXf4kY=;
 b=qEjq0KVfr1B8U9cBm+lK0Y9TigEXsglYA/GhGQ5mPtS5sCk4hGMLvx4C695jrf7AIWqpop+EhcU+3CMVxVKRsYqm8jeUtzKSdAcsM3UBJ4jHqJn1f5L7ZmZvlB7RitTQFfGFslB7E5vWE2U2nTpx/eIr4Qeq/fj5tCZ3AXRypqw=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>
Subject: [PATCH v2 4/5] xen/arm: Find unallocated spaces for magic pages of direct-mapped domU
Date: Fri, 8 Mar 2024 09:54:34 +0800
Message-ID: <20240308015435.4044339-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308015435.4044339-1-xin.wang2@amd.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DM6PR12MB4299:EE_
X-MS-Office365-Filtering-Correlation-Id: c5a2fb12-47a0-462e-ae6b-08dc3f12c395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8xp3Qzu2hTg/oEmD5mEnWMxjdBceJg0feH5EFHbKD6K/FtDLh3/xFKM/j7jiHbZ8OAG4fl6gWUiyx4YDMXMLzQ0lsf0kaV4xCg8Vh3QOOVIQ0A2IXB2LxUTBhP39cCuULDHvQIEZ6aFmNb19fXtCxOtmQZeY/HotUBzBkXsl2ooNuiblhY41pPbtisXizxvNK+lSjWhRPVHgbE7+dCwcPt64tptCJg4EpiaBrjFndnCha0DQukJsBbSH2q0ei9kJLSHiw8EQ780+I0gL7pfz5r8Ak5MfWoL3BNyAztxTtdXhacmw2Y2vOZ9hI+xra5hMnQgBSyJfeF1GaWdY0dFbL4agJHm8E0f4ZquRMrrYx0f5sK4cg1HpqGSkWkQ9FsxeX636oQk56FXnw3csmxCMeG3mLlKxtCCixdzrzBZllC8e0YdDi/MayDbnkBAevE8VzdYMDQ7EomR4Qz8lxfxmey/yDczQYcW0uqCifUHb98nWIY2lbpOAn2MyPVVy45/SfB0N0u+DFHBdmXGOSiYKd26ajrRjf+W3OsrIKtXTenayNSR0zf7h+npkI6kvwdzo9HrwvSGyWoX3B2njB+eEzVcTNkzjpi4sSbMaIAkTDiCo+r0woqeSbnjc1Lf4sTAnHGJy28A/o1Jid9iVsgOSMHhWRQNl632g8A+8mCYdHc+GFdCRAd8vPYnlT8wDfS89LanITOWCVnVUnQSlkOhmNJwEbGZuSvUnq46CCie4WsE0nXfYlxqvDCwnPIko2be7
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 01:55:00.2626
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5a2fb12-47a0-462e-ae6b-08dc3f12c395
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299

For 1:1 direct-mapped dom0less DomUs, the magic pages should not clash
with any RAM region. To find a proper region for guest magic pages,
we can reuse the logic of finding domain extended regions.

Extract the logic of finding domain extended regions to a helper
function named find_unused_memory() and use it to find unallocated
spaces for magic pages before make_hypervisor_node(). The result magic
page region is added to the reserved memory section of the bootinfo so
that it is carved out from the extended regions.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch
---
 xen/arch/arm/dom0less-build.c           | 43 +++++++++++++++++++++++++
 xen/arch/arm/domain_build.c             | 30 ++++++++++-------
 xen/arch/arm/include/asm/domain_build.h |  2 ++
 3 files changed, 64 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 1e1c8d83ae..99447bfb0c 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -682,6 +682,49 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
 
     if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
     {
+        if ( is_domain_direct_mapped(d) )
+        {
+            struct meminfo *avail_magic_regions = xzalloc(struct meminfo);
+            struct meminfo *rsrv_mem = &bootinfo.reserved_mem;
+            struct mem_map_domain *mem_map = &d->arch.mem_map;
+            uint64_t magic_region_start = INVALID_PADDR;
+            uint64_t magic_region_size = GUEST_MAGIC_SIZE;
+            unsigned int i;
+
+            if ( !avail_magic_regions )
+                return -ENOMEM;
+
+            ret = find_unused_memory(d, kinfo, avail_magic_regions);
+            if ( ret )
+            {
+                printk(XENLOG_WARNING
+                       "%pd: failed to find a region for domain magic pages\n",
+                      d);
+                goto err;
+            }
+
+            magic_region_start = avail_magic_regions->bank[0].start;
+
+            /*
+             * Register the magic region as reserved mem to make sure this
+             * region will not be counted when allocating extended regions.
+             */
+            rsrv_mem->bank[rsrv_mem->nr_banks].start = magic_region_start;
+            rsrv_mem->bank[rsrv_mem->nr_banks].size = magic_region_size;
+            rsrv_mem->bank[rsrv_mem->nr_banks].type = MEMBANK_DEFAULT;
+            rsrv_mem->nr_banks++;
+
+            /* Update the domain memory map. */
+            for ( i = 0; i < mem_map->nr_mem_regions; i++ )
+            {
+                if ( mem_map->regions[i].type == GUEST_MEM_REGION_MAGIC )
+                {
+                    mem_map->regions[i].start = magic_region_start;
+                    mem_map->regions[i].size = magic_region_size;
+                }
+            }
+        }
+
         ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
         if ( ret )
             goto err;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 085d88671e..b36b98ee7d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1110,6 +1110,24 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     return res;
 }
 
+int __init find_unused_memory(struct domain *d, const struct kernel_info *kinfo,
+                              struct meminfo *mem_region)
+{
+    int res;
+
+    if ( is_domain_direct_mapped(d) )
+    {
+        if ( !is_iommu_enabled(d) )
+            res = find_unallocated_memory(kinfo, mem_region);
+        else
+            res = find_memory_holes(kinfo, mem_region);
+    }
+    else
+        res = find_domU_holes(kinfo, mem_region);
+
+    return res;
+}
+
 int __init make_hypervisor_node(struct domain *d,
                                 const struct kernel_info *kinfo,
                                 int addrcells, int sizecells)
@@ -1161,17 +1179,7 @@ int __init make_hypervisor_node(struct domain *d,
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
+        res = find_unused_memory(d, kinfo, ext_regions);
 
         if ( res )
             printk(XENLOG_WARNING "%pd: failed to allocate extended regions\n",
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index da9e6025f3..4458012644 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -10,6 +10,8 @@ bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                           gfn_t sgfn, paddr_t tot_size);
 int construct_domain(struct domain *d, struct kernel_info *kinfo);
 int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
+int find_unused_memory(struct domain *d, const struct kernel_info *kinfo,
+                       struct meminfo *mem_region);
 int make_chosen_node(const struct kernel_info *kinfo);
 int make_cpus_node(const struct domain *d, void *fdt);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
-- 
2.34.1


