Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF0089D1A6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 06:54:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702119.1096940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3Ut-0003kM-UP; Tue, 09 Apr 2024 04:54:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702119.1096940; Tue, 09 Apr 2024 04:54:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3Ut-0003fS-QI; Tue, 09 Apr 2024 04:54:15 +0000
Received: by outflank-mailman (input) for mailman id 702119;
 Tue, 09 Apr 2024 04:54:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5At3=LO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ru3Ur-0003cd-GD
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 04:54:13 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3404329f-f62d-11ee-9150-f14010f3f246;
 Tue, 09 Apr 2024 06:54:11 +0200 (CEST)
Received: from CH0PR03CA0207.namprd03.prod.outlook.com (2603:10b6:610:e4::32)
 by DM4PR12MB6110.namprd12.prod.outlook.com (2603:10b6:8:ad::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.47; Tue, 9 Apr 2024 04:54:08 +0000
Received: from CH1PEPF0000AD78.namprd04.prod.outlook.com
 (2603:10b6:610:e4:cafe::e2) by CH0PR03CA0207.outlook.office365.com
 (2603:10b6:610:e4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.34 via Frontend
 Transport; Tue, 9 Apr 2024 04:54:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD78.mail.protection.outlook.com (10.167.244.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 04:54:07 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 23:54:07 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 21:54:06 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 23:54:03 -0500
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
X-Inumbo-ID: 3404329f-f62d-11ee-9150-f14010f3f246
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UY5kQ36YGvd7l5lO4f8KeLtmNKZbBnqo96YrGAlBVuwHNdMsA60n6xNOYS4kSR+vlm+taUwnM/xxeW2FxtJiS5h92CQwuZOWXz3coM+YEBeF76e+1OF52kW5MSBQjChyb90k/v+1b8F6tJn+jIIFpRaeM8Tx3e/tpo8dEEw7D/gQRbZM28blfOAdKndHW+kRS8WN8UgdJGEbNeKPxdXYPtTkOOpZlMTAjMXIgiNekLQVCaedmAkC93dPaYNsoIgravfUGDoMdZKsaeeYtbyg8zN8H5h88S0vajC8fGTBB/gvW2YraH2VLavqPUg2eDDf8Th3/tMAsbVnU6hmy7E3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6nCAvmO7u10UOc0MrZvr0OOFyROWsdMJT9pKEuIzHtU=;
 b=BpYI+0WbTU0MVhIvFwrBZxBkD955m0WDKNYMjT7JOa61h6y8+3AanvDWwRR80e3qc+j4MY5R1gTsSOv8hEyJgiBZ+DGXuFeKibDacqG3+n+95hqOFJvh2VdSGFYNaVCmcY463xi8f/7edAKVHo/RqhCMCZTAAVAsANvop6NE8j/d/rlR7cwBCT28Xxw/GVm16B/0kNOuY1kwyIPuk+76dbHDdxNYgs5dDXKblw311G2+ETbmRwzuCV9WLIIp3Y9PGfo34eqqSuOyMfM75PuKWUhx3ATHkXNo9gW15HHfuSvZD8u4zypDK0Wvjl/s+HZlTiWLJkdvhdeMGn0805ekjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6nCAvmO7u10UOc0MrZvr0OOFyROWsdMJT9pKEuIzHtU=;
 b=2HvTDgZs7+utvOgmWQt9L4QtAgXnvSpqiYji3mdmvw/XN5GsEDZa2KefWN+GtbbhwnuX1CrVGN43c+chrF9yPeiafKweqvwQ8ACtmN6qfVOhhRYHiaThnoQmJGu1Vd8oT0q7oZPbP3eQMPdELJpWm7DCrpP2OvUBp2KuNJ3NXLI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
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
Subject: [PATCH v4 1/5] xen/domctl, tools: Introduce a new domctl to get guest memory map
Date: Tue, 9 Apr 2024 12:53:53 +0800
Message-ID: <20240409045357.236802-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409045357.236802-1-xin.wang2@amd.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD78:EE_|DM4PR12MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: c5877d6d-2134-4aa9-70b5-08dc585116a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Kgylor3TECOxnq4ReeyDa0oSMwDficSRzB81HTfJZP+35k1bfXoqwFKsxjEDWapsaGuhmr0jp6JoOw/W829V+4LV59VBbFZyPFqw77+omy7LDCaLNMVY+8iywpx+rJZgDMKeigjrIw+m6geyEqSVRkRGibgxqhjI86wlWE/+wMHCYf4CC/aVrkUGgmgYEZozvJrfOXaot9ZssLxvnyW6hxc6b92sJkOtprq41yxGQ43eDT/2Khw8TX7TVcC4MIXB+zxi1z94kRKxwxBR7MLiSNm/9TpHMr06eZw/yntADWB5KLUalFHu0ekWz78x5H8KYzXifusEchuxVNhnAns64Lwq71lJvyBh6ytVrWgfqCRn6cHk7wFCAeleWaH8w/Y9hEPKehwKtlAGP7HGopMswV1+5CDLRjgYCEk0YFZi5PjGI/mvWpDMPyxWwV32/fNivyx4fsmDfETaOhjv0XMsRC3/vUzQQRbOzNLwE1MOvTk43lUhRVUiiZhwTOiT+fMWTW6IYbZBmrj/CFUYFkGN18uuh/3cD/VUmKmRZF7zbBtE6ZiNIYnjDgoInxuMrwPKeDFKkEMogpkSR2cj9Uyi4GsGIHtp2XFOCAD2/lRiWVJZuBkvXbjJZvEXaOTkd/nX7bROhV3ECXTP8YxhYMcqI9cCKMYJku92URIQp5/sPti9BcGuTo4klwBhSgopiciG5YdWt+Xa0IB00Rlu+MvPMWNzLStsABaacx1qLV/+J6UvdfZRnLi2bD8t+dSPSast
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(7416005)(376005)(36860700004)(82310400014)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 04:54:07.4875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5877d6d-2134-4aa9-70b5-08dc585116a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD78.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6110

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
v4:
- Drop the unnecessary initialization and printk.
- Use XEN_* prefix instead of GUEST_* for domctl.
- Move the mem region type to mem region structure.
- Drop the check of Xen internal state in the domctl.
- Handle the nr_regions properly (Fill only as much of the array
  as there is space for, but return the full count to the caller)
  to make sure the caller can know if it specifies a too small array.
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
 tools/libs/ctrl/xc_domain.c       | 37 +++++++++++++++++++++++++++++++
 xen/arch/arm/domain.c             | 14 ++++++++++++
 xen/arch/arm/domctl.c             | 28 ++++++++++++++++++++++-
 xen/arch/arm/include/asm/domain.h |  8 +++++++
 xen/include/public/arch-arm.h     |  7 ++++++
 xen/include/public/domctl.h       | 29 ++++++++++++++++++++++++
 7 files changed, 126 insertions(+), 1 deletion(-)

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
index f2d9d14b4d..4dba55d01d 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -697,6 +697,43 @@ int xc_domain_setmaxmem(xc_interface *xch,
     return do_domctl(xch, &domctl);
 }
 
+int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
+                          struct xen_mem_region mem_regions[],
+                          uint32_t *nr_regions)
+{
+    int rc;
+    uint32_t nr = *nr_regions;
+    struct xen_domctl domctl = {
+        .cmd         = XEN_DOMCTL_get_mem_map,
+        .domain      = domid,
+        .u.mem_map = {
+            .nr_mem_regions = nr,
+        },
+    };
+
+    DECLARE_HYPERCALL_BOUNCE(mem_regions, sizeof(xen_mem_region_t) * nr,
+                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
+
+    if ( !mem_regions || xc_hypercall_bounce_pre(xch, mem_regions) || nr < 1 )
+        return -1;
+
+    set_xen_guest_handle(domctl.u.mem_map.buffer, mem_regions);
+
+    rc = do_domctl(xch, &domctl);
+
+    xc_hypercall_bounce_post(xch, mem_regions);
+
+    if ( nr < domctl.u.mem_map.nr_mem_regions )
+    {
+        PERROR("Too small nr_regions %u", nr);
+        return -1;
+    }
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
index 34cbfe699a..0c9761b65b 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -697,6 +697,7 @@ int arch_domain_create(struct domain *d,
 {
     unsigned int count = 0;
     int rc;
+    struct mem_map_domain *mem_map = &d->arch.mem_map;
 
     BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
 
@@ -786,6 +787,19 @@ int arch_domain_create(struct domain *d,
     d->arch.sve_vl = config->arch.sve_vl;
 #endif
 
+    if ( mem_map->nr_mem_regions < XEN_MAX_MEM_REGIONS )
+    {
+        mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
+        mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
+        mem_map->regions[mem_map->nr_mem_regions].type = XEN_MEM_REGION_MAGIC;
+        mem_map->nr_mem_regions++;
+    }
+    else
+    {
+        rc = -ENOSPC;
+        goto fail;
+    }
+
     return 0;
 
 fail:
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index ad56efb0f5..8f62719cfa 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -148,7 +148,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return 0;
     }
-
     case XEN_DOMCTL_vuart_op:
     {
         int rc;
@@ -176,6 +175,33 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
 
         return rc;
     }
+    case XEN_DOMCTL_get_mem_map:
+    {
+        int rc = 0;
+        uint32_t nr_regions;
+
+        if ( domctl->u.mem_map.pad )
+            return -EINVAL;
+
+        /*
+         * Fill the buffer only as much of the array as there is space for,
+         * but always return the full count in the hypervisor to the caller.
+         * This way we can avoid overflowing the buffer and also make sure
+         * the caller can know if it specifies too small an array.
+         */
+        nr_regions = min(d->arch.mem_map.nr_mem_regions,
+                         domctl->u.mem_map.nr_mem_regions);
+
+        domctl->u.mem_map.nr_mem_regions = d->arch.mem_map.nr_mem_regions;
+
+        if ( copy_to_guest(domctl->u.mem_map.buffer,
+                           d->arch.mem_map.regions, nr_regions) ||
+             __copy_field_to_guest(u_domctl, domctl,
+                                   u.mem_map.nr_mem_regions) )
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
index e167e14f8d..eba61e1ac6 100644
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
 
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..974c07ee61 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -946,6 +946,33 @@ struct xen_domctl_paging_mempool {
     uint64_aligned_t size; /* Size in bytes. */
 };
 
+#ifndef XEN_MAX_MEM_REGIONS
+#define XEN_MAX_MEM_REGIONS 1
+#endif
+
+struct xen_mem_region {
+    uint64_aligned_t start;
+    uint64_aligned_t size;
+#define XEN_MEM_REGION_DEFAULT    0
+#define XEN_MEM_REGION_MAGIC      1
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
@@ -1277,6 +1304,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_get_mem_map                   87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1339,6 +1367,7 @@ struct xen_domctl {
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
+        struct xen_domctl_mem_map           mem_map;
         uint8_t                             pad[128];
     } u;
 };
-- 
2.34.1


