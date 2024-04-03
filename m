Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF05896830
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 10:17:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700365.1093398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnb-00043D-Qb; Wed, 03 Apr 2024 08:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700365.1093398; Wed, 03 Apr 2024 08:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnb-00040i-MP; Wed, 03 Apr 2024 08:16:47 +0000
Received: by outflank-mailman (input) for mailman id 700365;
 Wed, 03 Apr 2024 08:16:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pmYG=LI=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rrvna-0003ko-F0
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 08:16:46 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20608.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::608])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81477812-f192-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 10:16:44 +0200 (CEST)
Received: from BL1PR13CA0350.namprd13.prod.outlook.com (2603:10b6:208:2c6::25)
 by MW4PR12MB5643.namprd12.prod.outlook.com (2603:10b6:303:188::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 08:16:41 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::f7) by BL1PR13CA0350.outlook.office365.com
 (2603:10b6:208:2c6::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 08:16:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 08:16:40 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:38 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:37 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 03:16:35 -0500
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
X-Inumbo-ID: 81477812-f192-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDsmWsU5Rnq/U00eQbJi3h04usvH9t40gRmAiN3PqPlhIviIED+LFbiA2ccNQ4YfjgJqc+XV5xvdgEO3F5Kk+UxsUoMQKG8JdAtKNupbQuC1DgGNJxVCVdB1aLSZG3RzWThEU36hAFYpWIlwbqKfmZxNRjJYPdpCkbdPOzolx+RUBvW8qIAOafbH3cRPf4QdQvi7NpDgRJPDV97nxA3Nf4Ep1fq5sXTTfaemwCCexLs/6iU2JTiY4bVtDeBQBe3efYOOG5Ta41LELS2iCRm3hwZMYX6+c0eVYRB/uniZoLmTgi8WE3efx/bSaD9BIkomuQvrhqGNgfgze/z8I9x18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zLgP/wdtlIbftK9XsioWlo358tZ0SOpF5VtmpUPR2g0=;
 b=fkmvjKS2hvR9RgeKbwr7FYyM/BCyy8WAO3MFOU8FTXEGgzE37VZn1Elir8c5cSAeY82+cPoLTN4RIm0QAbcvclWSyNCvSNJdjquYR3akhoqV85pWIgEjk0yH5X9BY+unFuzu2HJZ+nI5cmf5Atj7nL+k0gcYzNfRBrxGrvRC5AloAJ3outOeeE/vJh5FELZ1++/qjq4lwM3FHveBB6NaKi8mpaNqSRT5vZBsd9x22CNpC67yChs/biNW2wAVCtDT2Juz9atG+hz2oNAhpRw2ktcsiDo8kOqHVheZtFqiPOysy3cZFdjPT0Hyu5lPiKrYNThVltlMFWilLkI0YayMgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zLgP/wdtlIbftK9XsioWlo358tZ0SOpF5VtmpUPR2g0=;
 b=YMKEQ2oECNcT3lhG/M4kNfhOX2eVVgGwKwlv9LSSmmdrjIJkRQCMsJlajUlTNHEzJ4UL729yxKnUlRzLr+50f1MdeHAeXHo9b4mSidKttZE3cXPKjkqhBgb+no9NdyzfT2uSu6LJmK9dhLgY1o1X7XtEEq7kYt9Kp5jMChmQpuk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>
Subject: [PATCH v3 1/4] xen/domctl, tools: Introduce a new domctl to get guest memory map
Date: Wed, 3 Apr 2024 16:16:23 +0800
Message-ID: <20240403081626.375313-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403081626.375313-1-xin.wang2@amd.com>
References: <20240403081626.375313-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|MW4PR12MB5643:EE_
X-MS-Office365-Filtering-Correlation-Id: aa4f17af-4862-4b4c-2616-08dc53b663e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rkNNBKl63TMtkFv8RH1IBCWhezi/7GgldBPYXksLOIOlv5cX3/J8JBEVFuQIGbmW8cYMvNF3g2zVPbqJMuRSI3mpD47AXxb8qulF55a61/MHGvB0arUKlqNwvrcGUOV+roo264e2dys/kettW/TXpCpyUq3tJsnnVfyj7tBBxl0qvTJ4/3HsBGPLC1WynjqOvM1i1HFkVJ5T8pSc7uAZmFBVn7mum6dqIktQ/UA45K1CSxTMeWBMW5LytZbzq75evV5wNRGLY25qDGhAN1Zr5RWR0wANWcfjouxeHPODDy+D9uwHWY3ypzxBPDuPbCThaL0EG+MHZ3BPFEK8lE60JP6Gaxid6Evnlmj8oXbgWmp7N8ZTe13F7TzETzQ5gKaWbSGx1SM558NSVAZSENa113J7/ZBpUziUuD0y43HQY/Lr90/3zpyPhAr1sG7MlhoCS3HzNOboUScMxZbcLb6VbbFQL2M5N1gN5RUGQda6ywWuQ0tRanR7muc1U3Z9FyIwIBh+r2+kmmgY5EiyQ9oQsqZuC1uPA6Mnqr7sNb2mJIuPWju7Ae799t1sBTFLWXX360vVWi1hTaY8grwiB2g1VNNIXz/uDwEPPXWARTuRw+DYFGUxKAe/iZc6FhiazY4t2tT6OMDGzFCRhV9P9fvJKJb5Uf+x0tZIVz8JUcyBexCiSQ4DKUAofFO4e9zMZiwsC51v9JDAdxCO08raIDiOUDeAJq4QoH0UEgesfKn/LnltM07Nla8O/fDisMgUmoSi
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(36860700004)(82310400014)(376005)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 08:16:40.2851
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa4f17af-4862-4b4c-2616-08dc53b663e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5643

There are some use cases where the toolstack needs to know the guest
memory map. For example, the toolstack helper application
"init-dom0less" needs to know the guest magic page regions for 1:1
direct-mapped dom0less DomUs to allocate magic pages.

To address such needs, add XEN_DOMCTL_get_mem_map hypercall and
related data structures to query the hypervisor for the guest memory
map. The guest memory map is recorded in the domain structure and
currently only guest magic page region is recorded in the guest
memory map. The guest magic page region is initialized at the domain
creation time as the layout in the public header, and it is updated
for 1:1 dom0less DomUs (see the following commit) to avoid conflict
with RAM.

Take the opportunity to drop an unnecessary empty line to keep the
coding style consistent in the file.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
RFC: I think the newly introduced "struct xen_domctl_mem_map" is
quite duplicated with "struct xen_memory_map", any comment on reuse
the "struct xen_memory_map" for simplicity?
v3:
- Init the return rc for XEN_DOMCTL_get_mem_map.
- Copy the nr_mem_regions back as it should be both IN & OUT.
- Check if mem_map->nr_mem_regions exceeds the XEN_MAX_MEM_REGIONS
  when adding a new entry.
- Allow XEN_MAX_MEM_REGIONS to be different between different archs.
- Add explicit padding and check to the domctl structures.
v2:
- New patch
---
 tools/include/xenctrl.h           |  4 ++++
 tools/libs/ctrl/xc_domain.c       | 33 +++++++++++++++++++++++++++++++
 xen/arch/arm/domain.c             | 15 ++++++++++++++
 xen/arch/arm/domctl.c             | 32 +++++++++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h |  8 ++++++++
 xen/include/public/arch-arm.h     | 11 +++++++++++
 xen/include/public/domctl.h       | 27 +++++++++++++++++++++++++
 7 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 2ef8b4e054..b25e9772a2 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1195,6 +1195,10 @@ int xc_domain_setmaxmem(xc_interface *xch,
                         uint32_t domid,
                         uint64_t max_memkb);
 
+int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
+                          struct xen_mem_region mem_regions[],
+                          uint32_t *nr_regions);
+
 int xc_domain_set_memmap_limit(xc_interface *xch,
                                uint32_t domid,
                                unsigned long map_limitkb);
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index f2d9d14b4d..8363657dae 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -697,6 +697,39 @@ int xc_domain_setmaxmem(xc_interface *xch,
     return do_domctl(xch, &domctl);
 }
 
+int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
+                          struct xen_mem_region mem_regions[],
+                          uint32_t *nr_regions)
+{
+    int rc;
+    struct xen_domctl domctl = {
+        .cmd         = XEN_DOMCTL_get_mem_map,
+        .domain      = domid,
+        .u.mem_map = {
+            .nr_mem_regions = *nr_regions,
+            .pad            = 0,
+        },
+    };
+
+    DECLARE_HYPERCALL_BOUNCE(mem_regions,
+                             sizeof(xen_mem_region_t) * (*nr_regions),
+                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+
+    if ( !mem_regions || xc_hypercall_bounce_pre(xch, mem_regions) ||
+         (*nr_regions) < 1 )
+        return -1;
+
+    set_xen_guest_handle(domctl.u.mem_map.buffer, mem_regions);
+
+    rc = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, mem_regions);
+
+    *nr_regions = domctl.u.mem_map.nr_mem_regions;
+
+    return rc;
+}
+
 #if defined(__i386__) || defined(__x86_64__)
 int xc_domain_set_memory_map(xc_interface *xch,
                                uint32_t domid,
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index f38cb5e04c..e77d157626 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
 {
     unsigned int count = 0;
     int rc;
+    struct mem_map_domain *mem_map = &d->arch.mem_map;
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
 
@@ -785,6 +786,20 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl = config->arch.sve_vl;
 #endif
 
+    if ( mem_map->nr_mem_regions < XEN_MAX_MEM_REGIONS )
+    {
+        mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
+        mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
+        mem_map->regions[mem_map->nr_mem_regions].type = GUEST_MEM_REGION_MAGIC;
+        mem_map->nr_mem_regions++;
+    }
+    else
+    {
+        printk("Exceed max number of supported memory map regions\n");
+        rc = -ENOSPC;
+        goto fail;
+    }
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad56efb0f5..ede19d80a3 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -148,7 +148,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return 0;
     }
-
     case XEN_DOMCTL_vuart_op:
     {
         int rc;
@@ -176,6 +175,37 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+    case XEN_DOMCTL_get_mem_map:
+    {
+        int rc = 0;
+        uint32_t nr_regions, i;
+
+        if ( domctl->u.mem_map.pad )
+            return -EINVAL;
+
+        /*
+         * Cap the number of regions to the minimum value between toolstack and
+         * hypervisor to avoid overflowing the buffer.
+         */
+        nr_regions = min(d->arch.mem_map.nr_mem_regions,
+                         domctl->u.mem_map.nr_mem_regions);
+
+        domctl->u.mem_map.nr_mem_regions = nr_regions;
+
+        for ( i = 0; i < nr_regions; i++ )
+        {
+            if ( d->arch.mem_map.regions[i].pad )
+                return -EINVAL;
+        }
+
+        if ( copy_to_guest(domctl->u.mem_map.buffer,
+                           d->arch.mem_map.regions,
+                           nr_regions) ||
+             __copy_to_guest(u_domctl, domctl, 1) )
+            rc = -EFAULT;
+
+        return rc;
+    }
     default:
         return subarch_do_domctl(domctl, d, u_domctl);
     }
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index f1d72c6e48..a559a9e499 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -10,6 +10,7 @@
 #include <asm/gic.h>
 #include <asm/vgic.h>
 #include <asm/vpl011.h>
+#include <public/domctl.h>
 #include <public/hvm/params.h>
 
 struct hvm_domain
@@ -59,6 +60,11 @@ struct paging_domain {
     unsigned long p2m_total_pages;
 };
 
+struct mem_map_domain {
+    unsigned int nr_mem_regions;
+    struct xen_mem_region regions[XEN_MAX_MEM_REGIONS];
+};
+
 struct arch_domain
 {
 #ifdef CONFIG_ARM_64
@@ -77,6 +83,8 @@ struct arch_domain
 
     struct paging_domain paging;
 
+    struct mem_map_domain mem_map;
+
     struct vmmio vmmio;
 
     /* Continuable domain_relinquish_resources(). */
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index a25e87dbda..cd47ae9d74 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -223,6 +223,13 @@ typedef uint64_t xen_pfn_t;
  */
 #define XEN_LEGACY_MAX_VCPUS 1
 
+/*
+ * Maximum number of memory map regions for guest memory layout.
+ * Used by XEN_DOMCTL_get_mem_map, currently there is only one region
+ * for the guest magic pages.
+ */
+#define XEN_MAX_MEM_REGIONS 1
+
 typedef uint64_t xen_ulong_t;
 #define PRI_xen_ulong PRIx64
 
@@ -420,6 +427,10 @@ typedef uint64_t xen_callback_t;
  * should instead use the FDT.
  */
 
+/* Guest memory region types */
+#define GUEST_MEM_REGION_DEFAULT    0
+#define GUEST_MEM_REGION_MAGIC      1
+
 /* Physical Address Space */
 
 /* Virtio MMIO mappings */
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..f0a0a9b58f 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -946,6 +946,31 @@ struct xen_domctl_paging_mempool {
     uint64_aligned_t size; /* Size in bytes. */
 };
 
+#ifndef XEN_MAX_MEM_REGIONS
+#define XEN_MAX_MEM_REGIONS 1
+#endif
+
+struct xen_mem_region {
+    uint64_aligned_t start;
+    uint64_aligned_t size;
+    uint32_t         type;
+    /* Must be zero */
+    uint32_t         pad;
+};
+typedef struct xen_mem_region xen_mem_region_t;
+DEFINE_XEN_GUEST_HANDLE(xen_mem_region_t);
+
+struct xen_domctl_mem_map {
+    /* IN & OUT */
+    uint32_t         nr_mem_regions;
+    /* Must be zero */
+    uint32_t         pad;
+    /* OUT */
+    XEN_GUEST_HANDLE_64(xen_mem_region_t) buffer;
+};
+typedef struct xen_domctl_mem_map xen_domctl_mem_map_t;
+DEFINE_XEN_GUEST_HANDLE(xen_domctl_mem_map_t);
+
 #if defined(__i386__) || defined(__x86_64__)
 struct xen_domctl_vcpu_msr {
     uint32_t         index;
@@ -1277,6 +1302,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_get_mem_map                   87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1339,6 +1365,7 @@ struct xen_domctl {
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
+        struct xen_domctl_mem_map           mem_map;
         uint8_t                             pad[128];
     } u;
 };
-- 
2.34.1


