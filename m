Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774889D1A7
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 06:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702121.1096964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3Uz-0004Ox-J1; Tue, 09 Apr 2024 04:54:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702121.1096964; Tue, 09 Apr 2024 04:54:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3Uz-0004Lx-FF; Tue, 09 Apr 2024 04:54:21 +0000
Received: by outflank-mailman (input) for mailman id 702121;
 Tue, 09 Apr 2024 04:54:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5At3=LO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ru3Uy-0003cc-10
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 04:54:20 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2009::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38c724e3-f62d-11ee-843a-3f19d20e7db6;
 Tue, 09 Apr 2024 06:54:18 +0200 (CEST)
Received: from CH2PR10CA0011.namprd10.prod.outlook.com (2603:10b6:610:4c::21)
 by SN7PR12MB7419.namprd12.prod.outlook.com (2603:10b6:806:2a6::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Tue, 9 Apr
 2024 04:54:14 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::ea) by CH2PR10CA0011.outlook.office365.com
 (2603:10b6:610:4c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28 via Frontend
 Transport; Tue, 9 Apr 2024 04:54:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 04:54:13 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 23:54:12 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 21:54:12 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 23:54:10 -0500
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
X-Inumbo-ID: 38c724e3-f62d-11ee-843a-3f19d20e7db6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOqqY1cUfIvEIhzWQoDt+SPx+e8h0Sa4Z4ASpJLvPpEX4pRVZ1m+RY8FGBe9UiU3I+ZUY2OrGUi/8Ee1be7IxbRq92E2RcN3xdQiD2Tm2nx7x9/sg0+kVlLJUqa147dKT2LJLVs5S7JvebU0jKSeiAqsj9Wfp/42lyAT0f+j9C+rFtKpemkaK9F8P44k6nDLHiiRt26M2VBB6thtLa9Idx39eyelgtIoQYilzbQvIdWpF8c0zgNUlvX/6Rc41t/riaVXI9gU4MC71iwjDDCXeNfhK7PtIEqiDkzbjHw64J4uyilTrcgNdEVkvNvtoZFDlq61n9yMDYx+ZgHqMMCfkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lC+nKYjI93vCI4VeuKL1ZiSEnl9+mCP0TiBahXdLMho=;
 b=NNPFNzB38MUxjDG1C23cbjLcNWzle/X4/OSeX8kuBMQvVwY9dmaQXlRLzy0WCKh1xULaqA9t3AGzSKE7gDoBMURD43kbbdbzC8imKvOgJFTC2dh7hctQdtpJgpIK9XoY/y2SuBg77aOBskp1Ifx0OhHW03icjiLInGp2BEy/5sGpdOmJZSF0+WNR0M8pm71rPv7Wjq6f6oHZuhV/7rA0aXaDAdmTHO/q5y3o8x9KvLK9xLJBTyh5A/M4yVVzNKmjpA5FlF4K5CLkaAQNaB84cpLmBgySbfKCUiRgAADSVIRQauDmkfniUmBHl7pQav5NfzsDqAOEhUhO7F74UPIqag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lC+nKYjI93vCI4VeuKL1ZiSEnl9+mCP0TiBahXdLMho=;
 b=J/pG5di6qConia4X5mxp53pdESxAk3sCct26UFq0K1lCDMnOIUV9qMU6KrR4US0uIDUXXx8qkhPUbYvjnnwQpOc+wGzx1dYglCfAJXk9kxUgNdTQ2CD+A36ZbQp4nH6iq9VN222RhqIpxeHKchaXl8Uf0fJwsAyWCFgNatUB2vA=
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
Subject: [PATCH v4 3/5] xen/arm: Find unallocated spaces for magic pages of direct-mapped domU
Date: Tue, 9 Apr 2024 12:53:55 +0800
Message-ID: <20240409045357.236802-4-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409045357.236802-1-xin.wang2@amd.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|SN7PR12MB7419:EE_
X-MS-Office365-Filtering-Correlation-Id: 024ce0f0-6595-40c4-7447-08dc58511a27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jDXw1jgQYHaBBqpUB+R4LAyqIGYizOtsLML9Hzjs2M3XGFk0p+WsH784CdvIY53Mc2vDl9qv2cfcc9BaeJb4uTDzS4KyefuhQEnr90/8o08kI3yLdwy6WK/6V6mHphzlSQxKzzNnMS8dUCla2v31P2ej/Df1s+gwBkppgVoVmDjsDRlQkTzAcOFL3LyF1eK0rykNOABLfJErpBWBCzKMg2cvPsZRjmZopXmQFgGkm42HDNet5/a8ZfyX+XaGngg+LwqklU+8VQi72rogazTkUhCTj0UbeAzkz0zCyN2U333v22t2qFZ3AIchrZK0ew2t21dyDDALC32S+S+dI+h0+Q/hf5S+siSYasAZY+zS0lkVwsi29mRx018Nim4dUaAs4Ye5b9y/sP8oxrj7NY0L3/BhrE5i33rECQIlxkgr5Bkje8HLtvyWCT6AHeoBvbOoprHFpYqDwyzoTdgPUufE5JGAqL+anfNm5F/y9DYrQLLiCUORpoqyJ+LWahskEakhsiomcfmqLgL36VMSXyzjb6mkYmMPoIaU/pQHVilO3GloBfALEK9UvpDpTEMI8G5EIj/pA+GtXJLAIQvgTTl2G540dImztZCq+zwdbj7va7LmjNJjeNiRopji/Iu1L0JIQezV5sPD+d21bwX0TS0gLhR10+JTLa3qBsACzkbEaQr3hLWXclV/TQubN/oLQzPngPPACKQBLmmHGFKW1Z6D4RgjMu7AButQHavDVPvm90WaunsGgFQ8QK3PH2kLs2yb
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 04:54:13.3531
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 024ce0f0-6595-40c4-7447-08dc58511a27
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7419

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
v4:
- No change
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
index d2a9c047ea..d5a9baf8b0 100644
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
+                if ( mem_map->regions[i].type == XEN_MEM_REGION_MAGIC )
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
index cffbab7241..ab1ec5e73a 100644
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
+            if ( mem_map->regions[i].type == XEN_MEM_REGION_MAGIC )
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


