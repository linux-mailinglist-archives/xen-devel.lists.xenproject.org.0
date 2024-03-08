Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CCB7875C2D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 02:55:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690080.1075788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPS3-0003es-BF; Fri, 08 Mar 2024 01:55:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690080.1075788; Fri, 08 Mar 2024 01:55:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPS3-0003ci-6k; Fri, 08 Mar 2024 01:55:11 +0000
Received: by outflank-mailman (input) for mailman id 690080;
 Fri, 08 Mar 2024 01:55:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riPS1-0002aR-UA
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 01:55:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e88::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e402671c-dcee-11ee-afda-a90da7624cb6;
 Fri, 08 Mar 2024 02:55:09 +0100 (CET)
Received: from SJ0P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::19)
 by PH7PR12MB7455.namprd12.prod.outlook.com (2603:10b6:510:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 01:55:05 +0000
Received: from SJ1PEPF00001CDD.namprd05.prod.outlook.com
 (2603:10b6:a03:41b:cafe::71) by SJ0P220CA0015.outlook.office365.com
 (2603:10b6:a03:41b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 01:55:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CDD.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 01:55:04 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 19:55:03 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 19:55:02 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 19:55:00 -0600
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
X-Inumbo-ID: e402671c-dcee-11ee-afda-a90da7624cb6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P1Zb0LmRdLxFMkCQtY9gpGwYCD7CklSEZ/wkEAjq8kUT+rI9oluL0YPOb9Vh8QnMRb+h3+dxQ19txY+azfcR9PpQRopoHZhEZWwvXwiWZcgEvUaQDbaWJuDkqXPT1MasnuPvBC0tNtULBAgQ3G4PBLKmyg7hvWcDSXAwlafKxOm9tH6L0qzK2md/91oac2TlQ3yb/2iy8h7KOo2GrGI5iebTZEas6vQzmpYRfSIc79aVEEHgsT7uUCTqNULEwZh4hoK3hePdvHB2JaZn8M2MXne2T69B+HinDMmClA0NW+V0FwrJh4rER/BkQ3ZRetRU7OMrZgxhxrywmrcN6F+fFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dchuisJ+SMUCW3UvJNt1sybC0OWRLBHo54+nPU/5Sjc=;
 b=S/9pQ+orprZ9xcyVM2Iz5Y+Kb5qUmgzaYikQHIAV+dh9dV3RJI3Ox0ibtTC2CbfZlX6hnlpTla0E1BpIPcOeLGMGbhZEyv4mo5QMUTrHwsvZ46X3UA9f3K+Cia0AcQn5ItnhMLSWshxlplmcQ57O2rDr5dLMr3itguoFe4P8KhwDBXq7vOGHFdn63jzVtjuO6+WhneFKOcd0d1xXnKSJ/BATdCuTNKZbwXV8qyo96bvGv31UKGEkgJn85mmKP0Nl8jdc1R7sGYfFuBV/2J/wNBO2MBH/HMymyL0puu1fWxj+VyFPAeBgMRTbL1/hX6VmM+Bylp1mKmLrfS6VlJpRSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dchuisJ+SMUCW3UvJNt1sybC0OWRLBHo54+nPU/5Sjc=;
 b=b4KTavVIXCXaKuz7dY1cv0LrppCmcWY0LgsNpvKgLG8sJSq7kjeuZgePzgMoaTulYzT6T8cs6pdJSJhcwb2loOhw0yuI6ciN6RpGT62UC/qAPizkB9HF9SS6Qx3KEQjzoX7PcPCG//4MUKELrht3S1OPZTMHnYB2zCNIFS8BZcY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
	Alec Kwapis <alec.kwapis@medtronic.com>
Subject: [PATCH v2 5/5] xen/memory, tools: Make init-dom0less consume XEN_DOMCTL_get_mem_map
Date: Fri, 8 Mar 2024 09:54:35 +0800
Message-ID: <20240308015435.4044339-6-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308015435.4044339-1-xin.wang2@amd.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDD:EE_|PH7PR12MB7455:EE_
X-MS-Office365-Filtering-Correlation-Id: e0b20390-affa-4904-1240-08dc3f12c609
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hYS5GjdLVbARs8YBYv1+LhEnnAJk++V6YZLO7DGMPk4oBmPEHHKaxdk12rolQRQEqmHlOrwTPCCCr71C8uQvUcKC1vy84lCJaMFYMjbCcoLa+RxxTnCI2b/ianaYagcrgpDvL6zxSn383vFqGQCIjBlwhHLUueUqwFb7FCS5xQzED8ihBNJ3nJeIHAz+crWhpUoDxAoyqFO9Ex0imT1rs5qP+0XZLWd/SC06UJEKOjrcMrtvvYcZuFH6ST7E0CbIjgQlKFNQyO8T1faeJZvCNNKnjXI+Kf5xcLkQfXvMA9Xn6hLSfROahCU0IICoF+F7y35D4w/bcv+XD2AJ7DE0CmLYoFZVtDzOyK9R/qxCWHqGghtVR9Jehmu06FEebVU4YYiNGur2+oL3ZT837REZH6/wOywarJNx4KouzdsubsHNr1BSDtloGhNjbn7g7zl8mqQJvlpqL2AFP2a5Dza2wDpKPxfsaJgmnRfmTCLwAoKxs8inR5VwzpbXpH+kTjV7Ac4DWAHWMGwAEebSpyCA3QdtCj42k2eIVY15ykQX8v2a79TvspSBVqd4DJxg/lFshS1qc1CTXGVExsm4KvlwfMTv1wwIDy0eSj13AyTtU7fDG0tUdWiteMJFBBbXhsqg8+g3uAGZncsWsHpL4JHNM5YO3g8WvfEt4ctuKG/sfMuVpvcdHewanb3v3vOOXu02Fk6ShOOSEi9/y9OTTOe68TCLJFNApRDrshKayCiB7xF3pDl55i1ojIzI1lmyalFm
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 01:55:04.2962
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b20390-affa-4904-1240-08dc3f12c609
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CDD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7455

Previous commits enable the toolstack to get the domain memory map,
therefore instead of hardcoding the guest magic pages region, use
the XEN_DOMCTL_get_mem_map domctl to get the start address of the
guest magic pages region. Add the (XEN)MEMF_force_heap_alloc memory
flags to force populate_physmap() to allocate page from domheap
instead of using 1:1 or static allocated pages to map the magic pages.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch
---
 tools/helpers/init-dom0less.c | 22 ++++++++++++++++++----
 xen/common/memory.c           | 10 ++++++++--
 xen/include/public/memory.h   |  5 +++++
 xen/include/xen/mm.h          |  2 ++
 4 files changed, 33 insertions(+), 6 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index fee93459c4..92c612f6da 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -23,16 +23,30 @@ static int alloc_xs_page(struct xc_interface_core *xch,
                          libxl_dominfo *info,
                          uint64_t *xenstore_pfn)
 {
-    int rc;
-    const xen_pfn_t base = GUEST_MAGIC_BASE >> XC_PAGE_SHIFT;
-    xen_pfn_t p2m = (GUEST_MAGIC_BASE >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
+    int rc, i;
+    xen_pfn_t base = ((xen_pfn_t)-1);
+    xen_pfn_t p2m = ((xen_pfn_t)-1);
+    uint32_t nr_regions = XEN_MAX_MEM_REGIONS;
+    struct xen_mem_region mem_regions[XEN_MAX_MEM_REGIONS] = {0};
+
+    rc = xc_get_domain_mem_map(xch, info->domid, mem_regions, &nr_regions);
+
+    for ( i = 0; i < nr_regions; i++ )
+    {
+        if ( mem_regions[i].type == GUEST_MEM_REGION_MAGIC )
+        {
+            base = mem_regions[i].start >> XC_PAGE_SHIFT;
+            p2m = (mem_regions[i].start >> XC_PAGE_SHIFT) + XENSTORE_PFN_OFFSET;
+        }
+    }
 
     rc = xc_domain_setmaxmem(xch, info->domid,
                              info->max_memkb + (XC_PAGE_SIZE/1024));
     if (rc < 0)
         return rc;
 
-    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0, 0, &p2m);
+    rc = xc_domain_populate_physmap_exact(xch, info->domid, 1, 0,
+                                          XENMEMF_force_heap_alloc, &p2m);
     if (rc < 0)
         return rc;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b3b05c2ec0..18b6c16aed 100644
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
@@ -1433,6 +1435,10 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
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
index bb29b352ec..a4554f730d 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -205,6 +205,8 @@ struct npfec {
 #define  MEMF_no_icache_flush (1U<<_MEMF_no_icache_flush)
 #define _MEMF_no_scrub    8
 #define  MEMF_no_scrub    (1U<<_MEMF_no_scrub)
+#define _MEMF_force_heap_alloc 9
+#define  MEMF_force_heap_alloc (1U<<_MEMF_force_heap_alloc)
 #define _MEMF_node        16
 #define  MEMF_node_mask   ((1U << (8 * sizeof(nodeid_t))) - 1)
 #define  MEMF_node(n)     ((((n) + 1) & MEMF_node_mask) << _MEMF_node)
-- 
2.34.1


