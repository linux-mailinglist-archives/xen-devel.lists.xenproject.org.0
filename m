Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C5D896833
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 10:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700369.1093427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnm-00055v-L1; Wed, 03 Apr 2024 08:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700369.1093427; Wed, 03 Apr 2024 08:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrvnm-00053Z-Hs; Wed, 03 Apr 2024 08:16:58 +0000
Received: by outflank-mailman (input) for mailman id 700369;
 Wed, 03 Apr 2024 08:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pmYG=LI=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rrvnk-0003ko-Ht
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 08:16:56 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 874e9ba1-f192-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 10:16:54 +0200 (CEST)
Received: from SA0PR11CA0185.namprd11.prod.outlook.com (2603:10b6:806:1bc::10)
 by PH8PR12MB6843.namprd12.prod.outlook.com (2603:10b6:510:1ca::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 08:16:48 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:1bc:cafe::a0) by SA0PR11CA0185.outlook.office365.com
 (2603:10b6:806:1bc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46 via Frontend
 Transport; Wed, 3 Apr 2024 08:16:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 08:16:48 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:47 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 3 Apr
 2024 03:16:46 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Apr 2024 03:16:44 -0500
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
X-Inumbo-ID: 874e9ba1-f192-11ee-a1ef-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa6LYU84AWDFBSiSpcF74ogajYLqBh6evBPiWWAtwLc/Af1M3qscwK1+/Xy/aa5wnj2o18qBHjVt4xQwwNNMCwfxKmqLngZ8tdZL5Y/51Lmmwdn9b7Db0V/yoBIpKhDD98MKsNj0e4oyKq1nPSAP4nvaGBkJP8s6xodcVhCBSS7dD8+dMIJwCiPCwgn5wCmokEtNazsY0O0Hej8XEcEsdhFnuux/qTR1FqzEDRKmKaqfszl4yX9kvGvHR8diLEtG9+IoNQfGyuxaOXloLTUS70abK3E2YQ001pJOGEJOcd3hWkr3OHMlSGjsNcLpO909c18j029Pyty1VBxB0+vFMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGmVvVfqXC9aW1ilmIMsYNtDyW2xCIUX5WJMDblARw8=;
 b=IAJiDqlSH5wbGuCUDwztSx5zuoKI383Yv3WQGzxjGwfxVE+4xDgacumwy0Dti9ZCXTAKrR+j5Cqm1G8iBRbB/ulOZn8R0VmgCLh0f/3auYeDwI2/wcNDKbXNKMHZ6ZjRhucfK51/Qnvhb8S4YCinYljcwYmYM+qvkqufHKQSRy4ORcjcPUy4qt4XaZJ8mfsB8zsZadZO1hVw8abIqEoaNrlFvVgeRDzmOJNbRgQ6rKTmAxjtt1L8o1+vbs+WAJgtSIR5D2PxnPDvjF4zcczKM+279zVgrZHqDSNlrBxeadsSnJEhasZYt69IDFSjdW5obgO7vDFeDv+f+fnOQb9z+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGmVvVfqXC9aW1ilmIMsYNtDyW2xCIUX5WJMDblARw8=;
 b=DC+z/blDlBnbk0u476Xmwf2HJ3wz05fuqZ1W8woHsU/4Odf9txn+9qMI/9sMCkemo8/NyaIdT4m5atalyiUNvD/GR8A2qwpkTKKZ52BP/1/g2uXF/FxFZExPNB+dHEpBoXMPIzZfKi/yRNiSg25utuuiiYiMp45Z7un+1a5LXrM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alec Kwapis <alec.kwapis@medtronic.com>
Subject: [PATCH v3 4/4] xen/memory, tools: Avoid hardcoding GUEST_MAGIC_BASE in init-dom0less
Date: Wed, 3 Apr 2024 16:16:26 +0800
Message-ID: <20240403081626.375313-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403081626.375313-1-xin.wang2@amd.com>
References: <20240403081626.375313-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|PH8PR12MB6843:EE_
X-MS-Office365-Filtering-Correlation-Id: c5813296-4c82-4011-b348-08dc53b668bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ttyDtU69rcLz8hpXDIA50TV/L3fIVrfK1lFCpjVBsOnfXgSYWAmDwI8092EWRQ4A4e0MFuglZWjzyhfxJOq2NB3dsreFZS4mvrFVy0hQ5HCi8tm5mlwstQfwRli6k9iB26l0+dvFJtuvlaDLG6MTlO4Lspd9p8TZBGFWctGBtQWypjNxP6rpXEtt+UkNKKBsGIyBMBgiC0pEP30LnqIcqYxLHANImOQU0JJG50R1Xn91Ka1QS6Jb7yKAO9OZAPnBPGdQV7Jl2CkXBAkIS5LvZEk0dyi2Jolznjy0usIm7NMUas4p4N/1Z4R18v0PvRpIsIef/N5Ge3It+5vUewviGe3HlVuB5mVG5LQkE9LNmnb8mJZx4GPAwPXb/HZ0AWMnotbrBtdrZ3aUpjuGcpxoHMdfDjZLp0Y0SwXulPlgqSIbFj9OpnsmZKVDcvxJqBdov6IWaC7KQnyjt6PbmS1E3MA+v2/e+vXxp9z4g0fuf0SugXsFBBbBdcoSHyJzsdG/dD9++SmJnYCRzYcQt3BFqks9ujA+3LGu1MR7m2SawbZ+PMipCLGGMtCeW/ie3icbjWyLg9rMtWoHGjcPV1DhyGRRBfxb8XLZ6ovBrkXpzsq6wjM5o89h/fXWjAG8mibsFzM+aIjFtMtGvsZHwj48CX6SxCsTyEHQ+Ild5Il4TRiLOBOJSMCEgOgVZmUMkQLSh+XLEmbR3U/WoNfh2i5Ig2+w7N9Pdh3ieuyha/KnqFbFvJx0oIjZPnTLrJGy5Ksa
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 08:16:48.3971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c5813296-4c82-4011-b348-08dc53b668bf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6843

Currently the GUEST_MAGIC_BASE in the init-dom0less application is
hardcoded, which will lead to failures for 1:1 direct-mapped Dom0less
DomUs.

Instead of hardcoding the guest magic pages region, use the
XEN_DOMCTL_get_mem_map domctl to get the start address of the guest
magic pages region. Add the (XEN)MEMF_force_heap_alloc memory
flags to force populate_physmap() to allocate page from domheap
instead of using 1:1 or static allocated pages to map the magic pages.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v3:
- Don't ignore the error from xc_get_domain_mem_map().
- Re-purposing the _MEMF_no_refcount as _MEMF_force_heap_alloc to
  avoid introduction of a new, single-use flag.
- Reject other reservation sub-ops to use the newly added flag.
- Replace all the GUEST_MAGIC_BASE usages.
v2:
- New patch
---
 tools/helpers/init-dom0less.c | 36 +++++++++++++++++++++++++----------
 xen/common/memory.c           | 22 +++++++++++++++++++--
 xen/include/public/memory.h   |  5 +++++
 xen/include/xen/mm.h          |  7 +++++++
 4 files changed, 58 insertions(+), 12 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee93459c4..8eec4d1f49 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -19,24 +19,43 @@
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
+        if ( mem_regions[i].type == GUEST_MEM_REGION_MAGIC )
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
+    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0,
+                                          XENMEMF_force_heap_alloc,
+                                          &xs_page_p2m);
     if (rc < 0)
         return rc;
 
-    *xenstore_pfn = base + XENSTORE_PFN_OFFSET;
+    *xenstore_pfn = xs_page_base + XENSTORE_PFN_OFFSET;
     rc = xc_clear_domain_page(xch, info->domid, *xenstore_pfn);
     if (rc < 0)
         return rc;
@@ -145,8 +164,7 @@ static int create_xenstore(struct xs_handle *xsh,
     rc = snprintf(target_memkb_str, STR_MAX_LENGTH, "%"PRIu64, info->current_memkb);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
-    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%lld",
-                  (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET);
+    rc = snprintf(ring_ref_str, STR_MAX_LENGTH, "%"PRIu_xen_pfn, xs_page_p2m);
     if (rc < 0 || rc >= STR_MAX_LENGTH)
         return rc;
     rc = snprintf(xenstore_port_str, STR_MAX_LENGTH, "%u", xenstore_port);
@@ -282,9 +300,7 @@ static int init_domain(struct xs_handle *xsh,
     if (rc)
         err(1, "writing to xenstore");
 
-    rc = xs_introduce_domain(xsh, info->domid,
-            (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET,
-            xenstore_evtchn);
+    rc = xs_introduce_domain(xsh, info->domid, xs_page_p2m, xenstore_evtchn);
     if (!rc)
         err(1, "xs_introduce_domain");
     return 0;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b3b05c2ec0..4f8c665870 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -219,7 +219,8 @@ static void populate_physmap(struct memop_args *a)
         }
         else
         {
-            if ( is_domain_direct_mapped(d) )
+            if ( is_domain_direct_mapped(d) &&
+                 !(a->memflags & MEMF_force_heap_alloc) )
             {
                 mfn = _mfn(gpfn);
 
@@ -246,7 +247,8 @@ static void populate_physmap(struct memop_args *a)
 
                 mfn = _mfn(gpfn);
             }
-            else if ( is_domain_using_staticmem(d) )
+            else if ( is_domain_using_staticmem(d) &&
+                      !(a->memflags & MEMF_force_heap_alloc) )
             {
                 /*
                  * No easy way to guarantee the retrieved pages are contiguous,
@@ -271,6 +273,14 @@ static void populate_physmap(struct memop_args *a)
             }
             else
             {
+                /*
+                 * Avoid passing MEMF_force_heap_alloc down to
+                 * alloc_domheap_pages() where the meaning would be the
+                 * original MEMF_no_refcount.
+                 */
+                if ( unlikely(a->memflags & MEMF_force_heap_alloc) )
+                    clear_bit(_MEMF_force_heap_alloc, &a->memflags);
+
                 page = alloc_domheap_pages(d, a->extent_order, a->memflags);
 
                 if ( unlikely(!page) )
@@ -1408,6 +1418,10 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( copy_from_guest(&reservation, arg, 1) )
             return start_extent;
 
+        if ( op != XENMEM_populate_physmap
+             && (reservation.mem_flags & XENMEMF_force_heap_alloc) )
+            return -EINVAL;
+
         /* Is size too large for us to encode a continuation? */
         if ( reservation.nr_extents > (UINT_MAX >> MEMOP_EXTENT_SHIFT) )
             return start_extent;
@@ -1433,6 +1447,10 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
              && (reservation.mem_flags & XENMEMF_populate_on_demand) )
             args.memflags |= MEMF_populate_on_demand;
 
+        if ( op == XENMEM_populate_physmap
+             && (reservation.mem_flags & XENMEMF_force_heap_alloc) )
+            args.memflags |= MEMF_force_heap_alloc;
+
         if ( xsm_memory_adjust_reservation(XSM_TARGET, curr_d, d) )
         {
             rcu_unlock_domain(d);
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 5e545ae9a4..2a1bfa5bfa 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -41,6 +41,11 @@
 #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
 /* Flag to indicate the node specified is virtual node */
 #define XENMEMF_vnode  (1<<18)
+/*
+ * Flag to force populate physmap to use pages from domheap instead of 1:1
+ * or static allocation.
+ */
+#define XENMEMF_force_heap_alloc  (1<<19)
 #endif
 
 struct xen_memory_reservation {
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 3e84960a36..0f65d84532 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -192,6 +192,13 @@ struct npfec {
 /* memflags: */
 #define _MEMF_no_refcount 0
 #define  MEMF_no_refcount (1U<<_MEMF_no_refcount)
+/*
+ * Alias of _MEMF_no_refcount to avoid introduction of a new, single-use flag.
+ * This flag should be used for populate_physmap() only as a re-purposing of
+ * _MEMF_no_refcount to force a non-1:1 allocation from domheap.
+ */
+#define _MEMF_force_heap_alloc _MEMF_no_refcount
+#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
 #define _MEMF_populate_on_demand 1
 #define  MEMF_populate_on_demand (1U<<_MEMF_populate_on_demand)
 #define _MEMF_no_dma      3
-- 
2.34.1


