Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3499689D1AB
	for <lists+xen-devel@lfdr.de>; Tue,  9 Apr 2024 06:54:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702122.1096974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3V1-0004fs-Tc; Tue, 09 Apr 2024 04:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702122.1096974; Tue, 09 Apr 2024 04:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ru3V1-0004dT-Q2; Tue, 09 Apr 2024 04:54:23 +0000
Received: by outflank-mailman (input) for mailman id 702122;
 Tue, 09 Apr 2024 04:54:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5At3=LO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1ru3Uy-0003cd-Rh
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 04:54:20 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39bd7cc6-f62d-11ee-9150-f14010f3f246;
 Tue, 09 Apr 2024 06:54:19 +0200 (CEST)
Received: from CY8PR12CA0009.namprd12.prod.outlook.com (2603:10b6:930:4e::29)
 by DM4PR12MB6302.namprd12.prod.outlook.com (2603:10b6:8:a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 9 Apr
 2024 04:54:16 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:930:4e:cafe::77) by CY8PR12CA0009.outlook.office365.com
 (2603:10b6:930:4e::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.37 via Frontend
 Transport; Tue, 9 Apr 2024 04:54:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.205) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Tue, 9 Apr 2024 04:54:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 23:54:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 21:54:15 -0700
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 23:54:13 -0500
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
X-Inumbo-ID: 39bd7cc6-f62d-11ee-9150-f14010f3f246
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QAH/BlyQwyb87yrM1+QxR6jc1DNMYeHDgBiQTU96fLRRkfwksdJHORgw47ca/ILch/356WcFcF6bEVd2lrSzbue9sLujelXK5qIioyAA0I2qGaW/EkzAyVISsWoqqs4DCUMukA6z5qM3xbuHLeRzaF8dpmyms4bv46M38IlVuOSTb+hvKd26bXIyevIw3QombKUvJH5FkfibMIlKM/d2Z7vlt5jNpWGJI6/abf2EgzrVVx4Fz2MuNznKt29YyR4DT8+IZ6X4HPgZjkbsY+WKirFGqi0dy2xXZUS4ksWyL5fnC+M/+Xa9LO0pcER8PFS6G0bfnSaK560yeS48lkhzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AqNwO/2J9JqnXyE4dOIjQwE9fUs3oiN1zYGcYi0aIXk=;
 b=IdrYGP8E3+vvXIsofL1ebmz0J3Vz+lo0U4JIq0ZxBjqUJnBaWaELqLH8g87nwmq2xAa+U5OPs5kjuFyo0SMqY55dAUxmYz94zx/TLbAXi2F48cCFBX9SBlvQXOLdeJ9KcHIK3CJdbR/tH/TlgHIUZ6c+T4qFXJ1GXgjedS/mGCz3NGppHsVY2B97amD411UhEuWD54UW7ALL+v0IXtiq+fNUIUV13YMUtGe6AishONKOYCprG20tGbkcyR+Ugem0yKKwDKVngIOO7zGgQXkBoixh+za0PifwTv9jHsBMtGvpvCx7fp2Td9A9MGx67yA7mkA93+kKsEQrrTj3GuONoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AqNwO/2J9JqnXyE4dOIjQwE9fUs3oiN1zYGcYi0aIXk=;
 b=26a8KSJYHFhKTbY9J/wmjuKm6l6L5HNxlCXlLYLJ4fvimG70m3/4RwlUSAcm9xRVcuTZ9DnTKzGS1uXBbSA/6qrkbZt51TpxHAMs0PK0KCuVg/F92zFpsUj42XX8VyAKNDp7ml3UWn1RHwGuega+9EIm+jGIHs+3HmyxvceoJEs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Juergen Gross <jgross@suse.com>, Alec Kwapis <alec.kwapis@medtronic.com>
Subject: [PATCH v4 4/5] xen/memory, tools: Avoid hardcoding GUEST_MAGIC_BASE in init-dom0less
Date: Tue, 9 Apr 2024 12:53:56 +0800
Message-ID: <20240409045357.236802-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240409045357.236802-1-xin.wang2@amd.com>
References: <20240409045357.236802-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|DM4PR12MB6302:EE_
X-MS-Office365-Filtering-Correlation-Id: ff42c0e3-ea5e-4321-3914-08dc58511c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+RVvzMd7Q96qXuF2nq68C7bPo/+FpPwkszuJg/hM5vmYMwrZn6LQ9zRIBjHXTJPC4YoSbVQr/wT7iF7JQdmMJH/hLFGc23GuG5q7RwrA7BB8T3xvOxMS3wZaw2Ct8rEXeqOvp+TwSeu2Cud4kqBkeZmGsjaqSWilQI1aUQScRqo63V2r5u8Zyz4anQMONTB7V4Dum0OFpkPGITR3wNQvOB/ll+K1I2QIsghEsVgU6A9wSHATiNajd/D/P2D5ztnfWueZVgYm56Pxhsy60mugYGMf3CYPzwVrFzhFqdkGRGnAmCjzSgTldbTl0F8OfzuEBZajveOKVv1kRQq6+OmI/AmN5SdRAmBLrPRYv9BOVuuFblXYEaSpPl2d88W5EzBQPs3MpMfpWZYTNKimNdLklnECpJxSWHOv8g4A8vHki+XJi3G3bH9P+vAN8nuTIGst84iArkUR1LZrmTAqID6lQ9Sw7LYE7sv1+BiyLDohU/8T0FlwwOalxfM+QyJcGYRbmMouYhlV5kaVPsv/sz36gjgvOvSgzWldJ4++TyC2AKidKXBM/69+u5Ce94ep951EyNzxkS0Ud+U6UYoe32MHl+VXGUdafdS0ZyYHnYMYVpRn27e2CaU2r9jSShMcJYE61OfwkBh+3GFnRRAbupPaaK8wqabT/mMxKLA60hJVOG7+TDWow+Xhl5+7oAQaH5Eo5DNSWRzUWa9kgHW+5+p/qTV5gnL+wEs4YcEbkgOzsdF1OmzRbCxTq0MrjnZGlA56
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 04:54:16.7453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff42c0e3-ea5e-4321-3914-08dc58511c34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6302

Currently the GUEST_MAGIC_BASE in the init-dom0less application is
hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
DomUs.

Instead of hardcoding the guest magic pages region, use the
XEN_DOMCTL_get_mem_map domctl to get the start address of the guest
magic pages region. Add a new sub-op XENMEM_populate_physmap_heap_alloc
and the MEMF_force_heap_alloc flag to force populate_physmap() to
allocate page from domheap instead of using 1:1 or static allocated
pages to map the magic pages.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v4:
- Use the new subop.
- Add assert to check the flag isn't already set when coming back from
  construct_memop_from_reservation().
- Use &= to clear the flag instead of clear_bit().
- Move the alias to xen/common/memory.c
v3:
- Don't ignore the error from xc_get_domain_mem_map().
- Re-purposing the _MEMF_no_refcount as _MEMF_force_heap_alloc to
  avoid introduction of a new, single-use flag.
- Reject other reservation sub-ops to use the newly added flag.
- Replace all the GUEST_MAGIC_BASE usages.
v2:
- New patch
---
 tools/helpers/init-dom0less.c | 35 +++++++++++-----
 tools/include/xenctrl.h       |  7 ++++
 tools/libs/ctrl/xc_domain.c   | 79 ++++++++++++++++++++++++++---------
 xen/common/memory.c           | 30 +++++++++++--
 xen/include/public/memory.h   |  3 +-
 5 files changed, 120 insertions(+), 34 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee93459c4..dccab7b29b 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -19,24 +19,42 @@
 #define XENSTORE_PFN_OFFSET 1
 #define STR_MAX_LENGTH 128
 
+static xen_pfn_t xs_page_base;
+static xen_pfn_t xs_page_p2m;
+
 static int alloc_xs_page(struct xc_interface_core *xch,
                          libxl_dominfo *info,
                          uint64_t *xenstore_pfn)
 {
-    int rc;
-    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
-    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
+    int rc, i;
+    uint32_t nr_regions = XEN_MAX_MEM_REGIONS;
+    struct xen_mem_region mem_regions[XEN_MAX_MEM_REGIONS] = {0};
+
+    rc = xc_get_domain_mem_map(xch, info->domid, mem_regions, &nr_regions);
+    if (rc < 0)
+        return rc;
+
+    for ( i = 0; i < nr_regions; i++ )
+    {
+        if ( mem_regions[i].type == XEN_MEM_REGION_MAGIC )
+        {
+            xs_page_base = mem_regions[i].start >> XC_PAGE_SHIFT;
+            xs_page_p2m = (mem_regions[i].start >> XC_PAGE_SHIFT) +
+                          XENSTORE_PFN_OFFSET;
+        }
+    }
 
     rc = xc_domain_setmaxmem(xch, info->domid,
                              info->max_memkb + (XC_PAGE_SIZE/1024));
     if (rc < 0)
         return rc;
 
-    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
+    rc = xc_domain_populate_physmap_heap_exact(xch, info->domid, 1, 0, 0,
+                                               &xs_page_p2m);
     if (rc < 0)
         return rc;
 
-    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
+    *xenstore_pfn = xs_page_base + XENSTORE_PFN_OFFSET;
     rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
     if (rc < 0)
         return rc;
@@ -145,8 +163,7 @@ static int create_xenstore(struct xs_handle *xsh,
     rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->current_memkb);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
-    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
-                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
+    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%"PRIu_xen_pfn, xs_page_p2m);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
@@ -282,9 +299,7 @@ static int init_domain(struct xs_handle *xsh,
     if (rc)
         err(1, "writing to xenstore");
 
-    rc = xs_introduce_domain(xsh, info->domid,
-            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
-            xenstore_evtchn);
+    rc = xs_introduce_domain(xsh, info->domid, xs_page_p2m, xenstore_evtchn);
     if (!rc)
         err(1, "xs_introduce_domain");
     return 0;
diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index b25e9772a2..c1a601813a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1342,6 +1342,13 @@ int xc_domain_populate_physmap(xc_interface *xch,
                                unsigned int mem_flags,
                                xen_pfn_t *extent_start);
 
+int xc_domain_populate_physmap_heap_exact(xc_interface *xch,
+                                          uint32_t domid,
+                                          unsigned long nr_extents,
+                                          unsigned int extent_order,
+                                          unsigned int mem_flags,
+                                          xen_pfn_t *extent_start);
+
 int xc_domain_populate_physmap_exact(xc_interface *xch,
                                      uint32_t domid,
                                      unsigned long nr_extents,
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 4dba55d01d..82c1554613 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -916,6 +916,36 @@ int xc_domain_nr_gpfns(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns)
     return rc;
 }
 
+static int xc_populate_physmap_cmd(xc_interface *xch,
+                                   unsigned int cmd,
+                                   uint32_t domid,
+                                   unsigned long nr_extents,
+                                   unsigned int extent_order,
+                                   unsigned int mem_flags,
+                                   xen_pfn_t *extent_start)
+{
+    int err;
+    DECLARE_HYPERCALL_BOUNCE(extent_start, nr_extents * sizeof(*extent_start), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
+    struct xen_memory_reservation reservation = {
+        .nr_extents   = nr_extents,
+        .extent_order = extent_order,
+        .mem_flags    = mem_flags,
+        .domid        = domid
+    };
+
+    if ( xc_hypercall_bounce_pre(xch, extent_start) )
+    {
+        PERROR("Could not bounce memory for XENMEM_populate_physmap hypercall");
+        return -1;
+    }
+    set_xen_guest_handle(reservation.extent_start, extent_start);
+
+    err = xc_memory_op(xch, cmd, &reservation, sizeof(reservation));
+
+    xc_hypercall_bounce_post(xch, extent_start);
+    return err;
+}
+
 int xc_domain_increase_reservation(xc_interface *xch,
                                    uint32_t domid,
                                    unsigned long nr_extents,
@@ -1135,26 +1165,9 @@ int xc_domain_populate_physmap(xc_interface *xch,
                                unsigned int mem_flags,
                                xen_pfn_t *extent_start)
 {
-    int err;
-    DECLARE_HYPERCALL_BOUNCE(extent_start, nr_extents * sizeof(*extent_start), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
-    struct xen_memory_reservation reservation = {
-        .nr_extents   = nr_extents,
-        .extent_order = extent_order,
-        .mem_flags    = mem_flags,
-        .domid        = domid
-    };
-
-    if ( xc_hypercall_bounce_pre(xch, extent_start) )
-    {
-        PERROR("Could not bounce memory for XENMEM_populate_physmap hypercall");
-        return -1;
-    }
-    set_xen_guest_handle(reservation.extent_start, extent_start);
-
-    err = xc_memory_op(xch, XENMEM_populate_physmap, &reservation, sizeof(reservation));
-
-    xc_hypercall_bounce_post(xch, extent_start);
-    return err;
+    return xc_populate_physmap_cmd(xch, XENMEM_populate_physmap, domid,
+                                   nr_extents, extent_order, mem_flags,
+                                   extent_start);
 }
 
 int xc_domain_populate_physmap_exact(xc_interface *xch,
@@ -1182,6 +1195,32 @@ int xc_domain_populate_physmap_exact(xc_interface *xch,
     return err;
 }
 
+int xc_domain_populate_physmap_heap_exact(xc_interface *xch,
+                                          uint32_t domid,
+                                          unsigned long nr_extents,
+                                          unsigned int extent_order,
+                                          unsigned int mem_flags,
+                                          xen_pfn_t *extent_start)
+{
+    int err;
+
+    err = xc_populate_physmap_cmd(xch, XENMEM_populate_physmap_heap_alloc,
+                                  domid, nr_extents, extent_order, mem_flags,
+                                  extent_start);
+    if ( err == nr_extents )
+        return 0;
+
+    if ( err >= 0 )
+    {
+        DPRINTF("Failed allocation for dom %d: %ld extents of order %d\n",
+                domid, nr_extents, extent_order);
+        errno = EBUSY;
+        err = -1;
+    }
+
+    return err;
+}
+
 int xc_domain_memory_exchange_pages(xc_interface *xch,
                                     uint32_t domid,
                                     unsigned long nr_in_extents,
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b4593f5f45..a4733869c2 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -155,6 +155,14 @@ static void increase_reservation(struct memop_args *a)
     a->nr_done = i;
 }
 
+/*
+ * Alias of _MEMF_no_refcount to avoid introduction of a new, single-use flag.
+ * This flag should be used for populate_physmap() only as a re-purposing of
+ * _MEMF_no_refcount to force a non-1:1 allocation from domheap.
+ */
+#define _MEMF_force_heap_alloc _MEMF_no_refcount
+#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
+
 static void populate_physmap(struct memop_args *a)
 {
     struct page_info *page;
@@ -219,7 +227,8 @@ static void populate_physmap(struct memop_args *a)
         }
         else
         {
-            if ( is_domain_direct_mapped(d) )
+            if ( is_domain_direct_mapped(d) &&
+                 !(a->memflags & MEMF_force_heap_alloc) )
             {
                 mfn = _mfn(gpfn);
 
@@ -246,7 +255,8 @@ static void populate_physmap(struct memop_args *a)
 
                 mfn = _mfn(gpfn);
             }
-            else if ( is_domain_using_staticmem(d) )
+            else if ( is_domain_using_staticmem(d) &&
+                      !(a->memflags & MEMF_force_heap_alloc) )
             {
                 /*
                  * No easy way to guarantee the retrieved pages are contiguous,
@@ -271,6 +281,14 @@ static void populate_physmap(struct memop_args *a)
             }
             else
             {
+                /*
+                 * Avoid passing MEMF_force_heap_alloc down to
+                 * alloc_domheap_pages() where the meaning would be the
+                 * original MEMF_no_refcount.
+                 */
+                if ( unlikely(a->memflags & MEMF_force_heap_alloc) )
+                    a->memflags &= ~MEMF_force_heap_alloc;
+
                 page = alloc_domheap_pages(d, a->extent_order, a->memflags);
 
                 if ( unlikely(!page) )
@@ -1404,6 +1422,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
     {
     case XENMEM_increase_reservation:
     case XENMEM_decrease_reservation:
+    case XENMEM_populate_physmap_heap_alloc:
     case XENMEM_populate_physmap:
         if ( copy_from_guest(&reservation, arg, 1) )
             return start_extent;
@@ -1433,6 +1452,11 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
              && (reservation.mem_flags & XENMEMF_populate_on_demand) )
             args.memflags |= MEMF_populate_on_demand;
 
+        /* Assert flag is not set from construct_memop_from_reservation(). */
+        ASSERT(!(args.memflags & MEMF_force_heap_alloc));
+        if ( op == XENMEM_populate_physmap_heap_alloc )
+            args.memflags |= MEMF_force_heap_alloc;
+
         if ( xsm_memory_adjust_reservation(XSM_TARGET, curr_d, d) )
         {
             rcu_unlock_domain(d);
@@ -1453,7 +1477,7 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         case XENMEM_decrease_reservation:
             decrease_reservation(&args);
             break;
-        default: /* XENMEM_populate_physmap */
+        default: /* XENMEM_populate_{physmap, physmap_heap_alloc} */
             populate_physmap(&args);
             break;
         }
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 5e545ae9a4..5e79992671 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -21,6 +21,7 @@
 #define XENMEM_increase_reservation 0
 #define XENMEM_decrease_reservation 1
 #define XENMEM_populate_physmap     6
+#define XENMEM_populate_physmap_heap_alloc 29
 
 #if __XEN_INTERFACE_VERSION__ >= 0x00030209
 /*
@@ -731,7 +732,7 @@ struct xen_vnuma_topology_info {
 typedef struct xen_vnuma_topology_info xen_vnuma_topology_info_t;
 DEFINE_XEN_GUEST_HANDLE(xen_vnuma_topology_info_t);
 
-/* Next available subop number is 29 */
+/* Next available subop number is 30 */
 
 #endif /* __XEN_PUBLIC_MEMORY_H__ */
 
-- 
2.34.1


