Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5156896831
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 10:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700367.1093418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnh-0004eu-DN; Wed, 03 Apr 2024 08:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700367.1093418; Wed, 03 Apr 2024 08:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnh-0004df-92; Wed, 03 Apr 2024 08:16:53 +0000
Received: by outflank-mailman (input) for mailman id 700367;
 Wed, 03 Apr 2024 08:16:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pmYG=LI=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rrvnf-0003ko-Bx
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 08:16:51 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:200a::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 843ab91d-f192-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 10:16:49 +0200 (CEST)
Received: from SA1PR05CA0005.namprd05.prod.outlook.com (2603:10b6:806:2d2::7)
 by DM4PR12MB6613.namprd12.prod.outlook.com (2603:10b6:8:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 08:16:46 +0000
Received: from SN1PEPF0002529D.namprd05.prod.outlook.com
 (2603:10b6:806:2d2:cafe::6e) by SA1PR05CA0005.outlook.office365.com
 (2603:10b6:806:2d2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 08:16:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529D.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 08:16:45 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:44 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:43 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 03:16:42 -0500
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
X-Inumbo-ID: 843ab91d-f192-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LULCcn6+rOC2LNUuUCyXxHMIkQd25SZuqUtg5aACubRfFayhCq+1BcfG1rufZBZ4d4Yb15bdn3Put5UW4g9FKMXdUVlS/g7fK3xIU6xXBHWYCOZsDxrXc9M8/OoWyhkXwOIdYDCQdefOn5QVZFpLDV3ogW9cIQtu0h3anlINzvp0+RTFnIrWySge+/EFgIu1Z6INCojaU3NemqOMFNwWPU+uxI7IhSUAa+W17v+c05inRdKur4XliU7hiaORA30pZW7LbPCGUiBK7J2XX7L0lkMJwVacD5uFDk4wpEvW3TbP8OwPNwlFE4/nHnk5qqzSCnrI0jOYNtFEZ0IrYmb27A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNRwPpFg2SQ6Km3yJhJpLVDrBZXI0Pb6KKElu/5Go2U=;
 b=kbL89FLmbWi/psSO71FsPgXAYZzSl471qK7X+nanSqg4diY5JdqLjwONlIHynKHzX9VqNp3k1NO38V189XI74SnXU4euFd/WhBXygfF32S7hHZjuKJ8tqQ1CjQGXJVAR/1rSSbTf4rD0nWrGYvl8wWeuLa2xW+8zLNW2x0dVAnX917kP9HDrvA2NBdzLVOueeB/jx9oKJJZpE7Xj33A6t3hsKDojaDouzzLxWkSFRQ6r2mT+0d1GvoxD/Kd6Td0lnsgENiPfyzyDVr2YMnqMRV/WlZTFc3EU7CEKeP9b3j6p0cN4q5nmZNYweCbW6FEcMry1cFKkuxHTYGnxOlJZTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNRwPpFg2SQ6Km3yJhJpLVDrBZXI0Pb6KKElu/5Go2U=;
 b=vYCVn7ddgi+97r35aIcQhaEtfnLBUhJ3M0+nPnI0S67fvi0YlQ1/dsFkKh6dZY8mA/6KiIISVjnkzXpPK3oXOflDBwSYLtP2FX2RwoosgbSlWxMw9GUAp+kK3hehJ6tXCDdMr2jcpZXsx7eWJzII7uzL3tFiL4LwTxbEFv7jf80=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>
Subject: [PATCH v3 3/4] xen/arm: Find unallocated spaces for magic pages of direct-mapped domU
Date: Wed, 3 Apr 2024 16:16:25 +0800
Message-ID: <20240403081626.375313-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403081626.375313-1-xin.wang2@amd.com>
References: <20240403081626.375313-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529D:EE_|DM4PR12MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: c3f45a89-4027-4002-732a-08dc53b666f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DHesczFa3ek0GFUg+G97mwupe7oF9Y5HXrk9b1BhNB0ujKdpbs0zcjnDIaaJa5pxD9BSkEs1tGwo//XJ2g0rAcxtaMBqWvJWO0g65JqEC662san9nWXRnsyWGHDwHTslPsR2RW0sa2AOPTaU9REMF6k78Xeu0ujU3T3hhv1VBiZRE5+XXV2Y3E5WQ99Am7Q6qceFe3GjNNXrM3k7mtHdqcwHd5eOfLeYbjNF/J6vdXOy0IfAE5RCiHa8+HPrAXy+s4c1Nf+Sp48sWSB6dKgJuAfNcwkyhwhgMeRTNAvIf+2qpk+/O2l6YBkW7hzoOtXmZOsPBlg+1998wzV8hI89L/2Aib91pf6vxqmn7bkeePTIW1PoaW9ylIZEPUKADrBfOemw0PE/pZiwv/ALLdoKLNMELUTNjEwUUDqHzB5xwF3GuCwhoWG1bsr7zxb2Y8/+Cf3l5xy+4ulRmSMBtIA+bplGClnmQPJO5s8XGFpvhwZ0iviFcgfarn7wVauYCWqk32MGNqqhL+CxLTuR+E06DoVdqmlodyZVzybeXEPYGZTeKk54WAVIcWfRX7rjk4nCNhRK9MNfhsk0SCWnWWIZ29yhyjzRKP9ofhLi4IaGTXLl8J3YQYVOVTgkpP4OHNwMWztcdvuoJ2XMbwAijTank53H2zKStwPTo1fns1+pWQ/Y07nY7zf/uL5VO2nl4UvuG7rFt+lw7HDEE/wVWu7ObB7oIXlXd0wCk38iAPElS6LPCrzsLixRoGt6h1pFOe90
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 08:16:45.3833
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3f45a89-4027-4002-732a-08dc53b666f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6613

For 1:1 direct-mapped dom0less DomUs, the magic pages should not clash
with any RAM region. To find a proper region for guest magic pages,
we can reuse the logic of finding domain extended regions.

If the extended region is enabled, since the extended region banks are
at least 64MB, carve out the first 16MB from the first extended region
bank for magic pages of direct-mapped domU. If the extended region is
disabled, call the newly introduced helper find_11_domU_magic_region()
to find a GUEST_MAGIC_SIZE sized unused region.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v3:
- Extract the logic of finding unallocated spaces for magic pages of
  direct-mapped domU to a dedicated function in static-memory.c
- Properly handle error and free memory in find_11_domU_magic_region()
v2:
- New patch
---
 xen/arch/arm/dom0less-build.c            | 11 +++++++
 xen/arch/arm/domain_build.c              | 24 ++++++++++++++-
 xen/arch/arm/include/asm/domain_build.h  |  2 ++
 xen/arch/arm/include/asm/static-memory.h |  7 +++++
 xen/arch/arm/static-memory.c             | 39 ++++++++++++++++++++++++
 5 files changed, 82 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd1..1963f029fe 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -682,6 +682,17 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
 
     if ( kinfo->dom0less_feature & DOM0LESS_ENHANCED_NO_XS )
     {
+        /*
+         * Find the guest magic region for 1:1 dom0less domU when the extended
+         * region is not enabled.
+         */
+        if ( !opt_ext_regions || is_32bit_domain(d) )
+        {
+            ret = find_11_domU_magic_region(d, kinfo);
+            if ( ret )
+                goto err;
+        }
+
         ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
         if ( ret )
             goto err;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d2a9c047ea..a5d1ca7f73 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -46,7 +46,7 @@ integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
  * If true, the extended regions support is enabled for dom0 and
  * dom0less domUs.
  */
-static bool __initdata opt_ext_regions = true;
+bool __initdata opt_ext_regions = true;
 boolean_param("ext_regions", opt_ext_regions);
 
 static u64 __initdata dom0_mem;
@@ -1196,6 +1196,28 @@ int __init make_hypervisor_node(struct domain *d,
             printk(XENLOG_WARNING "%pd: failed to allocate extended regions\n",
                    d);
         nr_ext_regions = ext_regions->nr_banks;
+
+        /*
+         * If extended region is enabled, carve out the 16MB guest magic page
+         * regions from the first bank of extended region (at least 64MB) for
+         * the 1:1 dom0less DomUs
+         */
+        if ( is_domain_direct_mapped(d) && !is_hardware_domain(d) )
+        {
+            struct mem_map_domain *mem_map = &d->arch.mem_map;
+
+            for ( i = 0; i < mem_map->nr_mem_regions; i++ )
+            {
+                if ( mem_map->regions[i].type == GUEST_MEM_REGION_MAGIC )
+                {
+                    mem_map->regions[i].start = ext_regions->bank[0].start;
+                    mem_map->regions[i].size = GUEST_MAGIC_SIZE;
+
+                    ext_regions->bank[0].start += GUEST_MAGIC_SIZE;
+                    ext_regions->bank[0].size -= GUEST_MAGIC_SIZE;
+                }
+            }
+        }
     }
 
     reg = xzalloc_array(__be32, (nr_ext_regions + 1) * (addrcells + sizecells));
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index 74432123fe..063ff727bb 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -4,6 +4,8 @@
 #include <xen/sched.h>
 #include <asm/kernel.h>
 
+extern bool opt_ext_regions;
+
 typedef __be32 gic_interrupt_t[3];
 
 bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/arch/arm/include/asm/static-memory.h
index 3e3efd70c3..01e51217ca 100644
--- a/xen/arch/arm/include/asm/static-memory.h
+++ b/xen/arch/arm/include/asm/static-memory.h
@@ -12,6 +12,7 @@ void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
 void assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
                              const struct dt_device_node *node);
 void init_staticmem_pages(void);
+int find_11_domU_magic_region(struct domain *d, struct kernel_info *kinfo);
 
 #else /* !CONFIG_STATIC_MEMORY */
 
@@ -31,6 +32,12 @@ static inline void assign_static_memory_11(struct domain *d,
 
 static inline void init_staticmem_pages(void) {};
 
+static inline int find_11_domU_magic_region(struct domain *d,
+                                            struct kernel_info *kinfo)
+{
+    return 0;
+}
+
 #endif /* CONFIG_STATIC_MEMORY */
 
 #endif /* __ASM_STATIC_MEMORY_H_ */
diff --git a/xen/arch/arm/static-memory.c b/xen/arch/arm/static-memory.c
index cffbab7241..c280e1d992 100644
--- a/xen/arch/arm/static-memory.c
+++ b/xen/arch/arm/static-memory.c
@@ -2,6 +2,7 @@
 
 #include <xen/sched.h>
 
+#include <asm/domain_build.h>
 #include <asm/static-memory.h>
 
 static bool __init append_static_memory_to_bank(struct domain *d,
@@ -276,6 +277,44 @@ void __init init_staticmem_pages(void)
     }
 }
 
+int __init find_11_domU_magic_region(struct domain *d,
+                                     struct kernel_info *kinfo)
+{
+    if ( is_domain_direct_mapped(d) )
+    {
+        struct meminfo *magic_region = xzalloc(struct meminfo);
+        struct mem_map_domain *mem_map = &d->arch.mem_map;
+        unsigned int i;
+        int ret = 0;
+
+        if ( !magic_region )
+            return -ENOMEM;
+
+        ret = find_unused_regions(d, kinfo, magic_region, GUEST_MAGIC_SIZE);
+        if ( ret )
+        {
+            printk(XENLOG_WARNING
+                   "%pd: failed to find a region for domain magic pages\n", d);
+            xfree(magic_region);
+            return -ENOENT;
+        }
+
+        /* Update the domain memory map. */
+        for ( i = 0; i < mem_map->nr_mem_regions; i++ )
+        {
+            if ( mem_map->regions[i].type == GUEST_MEM_REGION_MAGIC )
+            {
+                mem_map->regions[i].start = magic_region->bank[0].start;
+                mem_map->regions[i].size = GUEST_MAGIC_SIZE;
+            }
+        }
+
+        xfree(magic_region);
+    }
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


