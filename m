Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DB0945DBB
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 14:15:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771055.1181658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBk-0003iW-Fg; Fri, 02 Aug 2024 12:15:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771055.1181658; Fri, 02 Aug 2024 12:15:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZrBk-0003eo-CV; Fri, 02 Aug 2024 12:15:16 +0000
Received: by outflank-mailman (input) for mailman id 771055;
 Fri, 02 Aug 2024 12:15:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sjRO=PB=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sZrBi-0002qg-Kc
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 12:15:14 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id de730912-50c8-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 14:15:13 +0200 (CEST)
Received: from SJ0PR05CA0157.namprd05.prod.outlook.com (2603:10b6:a03:339::12)
 by SJ0PR12MB8137.namprd12.prod.outlook.com (2603:10b6:a03:4e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23; Fri, 2 Aug
 2024 12:15:07 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::ef) by SJ0PR05CA0157.outlook.office365.com
 (2603:10b6:a03:339::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.7 via Frontend
 Transport; Fri, 2 Aug 2024 12:15:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Fri, 2 Aug 2024 12:15:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 07:15:04 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 2 Aug
 2024 07:15:04 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 2 Aug 2024 07:15:03 -0500
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
X-Inumbo-ID: de730912-50c8-11ef-bc03-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiJ7Ah8zot/lWpKDaXDyPsuuotS1d25NWhcgZ/SE83f4FnJqA5Os5RYcK6GUrrJkPjG3rs1F4iA1C9Za+lN4amckByprWSC8Ouc3x0pdPA4dR623zFkUtRp7w/UjXsFQbMVokL3jJPMZOiz/Bx1uLZd7yTvuQfOZXjxcWvT9c6/Dn/+jgxOecmGpObioOzNgMwQn5JDlni2gM3QHmeEb+dV5F394tajrixP5lwAdXU5WIKoBxTCIV45m4v2BoYKjXyp+ZtvLdggaWd1A4ky2ZMd2K3E30e3sORL8aEvgJTd+DDkj5MgO7Bniw9wPx0Yrd88pdq4OJYXwEW8zEM9txw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gbu1SZsMqv/ljlaxlr9Do4f1so8bAzCrex0cdS+Y3s=;
 b=HULiGt1uOXFTN2osiiLymB3qictP7CpeZZ8P3AmaRQ9gTHlNySGZPJ0PdJq1o/D2Pl/4Nduk9vpLzMuU945jBamkotju2KC3bJ6QHiH9z/5of+Ba6fc9Ue1MyDSP5gAvZw1+xQGSdMuAoeNWOgGtX/TgfkjMjp9YcN5/UcRWNs01WCzZ9GDPXcKd/U7PwKFA9xWDjqzPlRKGdu9Ia1klDKQPh+MqPFIS/Jj/XSNYDg88HO0fyL2LRcG1DqO7bWMRt1cPOGn2nAdWe2s2krk5WWEnXcvf5fBdN+AO+qdtOnrd1aGoE81nn6XsHNTj/1ShcJYpAmB6Dt3nMhE7w+Xm9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gbu1SZsMqv/ljlaxlr9Do4f1so8bAzCrex0cdS+Y3s=;
 b=WYSA9f0+ghKLxiELIgJkCDvhRs7RBlteRkPv4jQJe3FyhPI/1fqCZk2cMCoYAYr+cswdhfYPtFDPIFMeMZ/w3QMLwxmILtdGtJVyv9Okq4SIGRWJv5LRMqCvQ/CE4hMJSGbKjzFtiwFt5HHnqxIEBpNcEhSHtWzrZsOLa17mGWI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v1 3/4] xen: arm: Move the functions of domain_page to MMU specific
Date: Fri, 2 Aug 2024 13:14:42 +0100
Message-ID: <20240802121443.1531693-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|SJ0PR12MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 02ff3655-c8a5-47f4-54a3-08dcb2ecbf9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bf0omMeu0YGuOTyHs4dIxcJJpWyNeqWwsrtvv9jnuiFOLduVMwaICwqhLese?=
 =?us-ascii?Q?9pploC+Lt8zcrP0ZFdY2oNVFDELtBWecaj2QMtsOhoPx0lMsDNhcPaw2kG7Z?=
 =?us-ascii?Q?Tys7GFPoLsW18D7JmH+NM2cJfJ9kAMrO148w+TADynM3GbDLxp+gHelCzMCV?=
 =?us-ascii?Q?qG3MiX/gJJPlSoXT7f5PkSSOBCyl2iF39X0z1vu/YiVK1dg0qGuPghhA9KBw?=
 =?us-ascii?Q?x0L48SKBSlz5sAv7J+jD7WpK1MlZ3WQ+8+Hc4bKke2kh4y29XCT11TUnQDiI?=
 =?us-ascii?Q?cQkF5dhIpUb7Yfkbu7o7vmiqai7aAs2Qu7yCaMmEJPrKuwPdKzNC5jRDkq+/?=
 =?us-ascii?Q?PrlVsC9T2UrlYpg+wwjYW1n45IcgKBlzHYpUDi8ddCmMkS7l9tBr7goUQeOw?=
 =?us-ascii?Q?uc93j74DsjsRMYJAUOOjM3hIGD8iQHeDD9aKDWlekrCf8+FfsGgxG+kd9G8P?=
 =?us-ascii?Q?Df/3I0ICOajRbVMlOeL8uTPOT65KR1CQxdqn1FqUtpXU0dwYbCQE9pL8WxjM?=
 =?us-ascii?Q?i5z6m3HWeD89KUGyDNNWN2ULtLOZ0jJK77HnGvH++qpTaFC1tkTlodNypWya?=
 =?us-ascii?Q?nXNREs6USMtSNYIfoplylJWbCZN1D2ZcgWJxQT4SbptKCwfElnLUerk9ybmH?=
 =?us-ascii?Q?chKUr3k4JVD2YZQWOsKGU484Ico8sIILooEXPGsz4mwT4SHwticKURC97ZvN?=
 =?us-ascii?Q?lo4QcP5aLLBTKdS2OJPit+AIg3M0bBx8k+jvYO+WTziCd3QoR8U52SjG4/D3?=
 =?us-ascii?Q?Ixf71JHvC4ESW+dON/Q2OgnbB9h0iGhVA/9fjzIgkMG+thDkSzDGkHm6lz6H?=
 =?us-ascii?Q?Sqm0JhVe+EGTNu0WL2dCdnn/SZ+RaDN/j4idREtzwPVo0kljNoDDQuFN7qDg?=
 =?us-ascii?Q?Z1etgwAgwlzNwIWfSIpWwMKIeZoRs9hwp1BUAstaZiYLpBUIB4/EbGeAR40g?=
 =?us-ascii?Q?LYEdTzY/DJ7w6S0/gj9zU6S+Yx1VnufTy5nuBgPGC9D0EgqLEZZe6zZpvu7k?=
 =?us-ascii?Q?xa0IHO+EQI0aRe/ep70+enDPSPIBdEaJUS8Q9ceR1J/1GIUCuzikn9ApTfpN?=
 =?us-ascii?Q?JlJrRPnTohgDjaj3JwEnmwyx3bivau2TvESP0r2sNL6ZyRzZN+fCiSrrl6++?=
 =?us-ascii?Q?TU1PS6KrzcQFIy1MSLCrzEY//tXikEKcsPAI2k//bHbKL39O7bULXlIxRXPG?=
 =?us-ascii?Q?tOC2tCHBmCC433ZvqiiuHglaIQR9SAkpGYkir8Fr/7SGVSm/M5feXjlP85hP?=
 =?us-ascii?Q?lX7CqGX/+TX8RO+Kdyp6tAmQ4xW3FzxE4IbrtAe3SCMC+5317ynJi5GjbLWe?=
 =?us-ascii?Q?KVBVW6DxazXOI4EgiXECPDX2wFHgVM7mKBTiUIayBiYBQHOFo9NGjFW/PJ9V?=
 =?us-ascii?Q?EevpLbkSsJ99dVZrW9VQmUqnpHPYzd810eJXNAENd+emn2ulRKHSNU+Mfv03?=
 =?us-ascii?Q?aoFhmZu1riE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 12:15:07.3987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02ff3655-c8a5-47f4-54a3-08dcb2ecbf9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8137

Moved init_domheap_mappings(), map_domain_page_global(),
unmap_domain_page_global(), map_domain_page(), unmap_domain_page(),
domain_page_map_to_mfn() to MMU specific folder.

On the top level, we have added stubs which will invoke the
MMU specific equivalent of these functions.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/domain_page.c          | 161 +----------------------
 xen/arch/arm/include/asm/arm32/mm.h |  12 ++
 xen/arch/arm/mmu/Makefile           |   1 +
 xen/arch/arm/mmu/domain_page.c      | 194 ++++++++++++++++++++++++++++
 4 files changed, 213 insertions(+), 155 deletions(-)
 create mode 100644 xen/arch/arm/mmu/domain_page.c

diff --git a/xen/arch/arm/domain_page.c b/xen/arch/arm/domain_page.c
index 3a43601623..49fe551d84 100644
--- a/xen/arch/arm/domain_page.c
+++ b/xen/arch/arm/domain_page.c
@@ -3,185 +3,36 @@
 #include <xen/pmap.h>
 #include <xen/vmap.h>
 
-/* Override macros from asm/page.h to make them work with mfn_t */
-#undef virt_to_mfn
-#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
-
-/* cpu0's domheap page tables */
-static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
-
-/*
- * xen_dommap == pages used by map_domain_page, these pages contain
- * the second level pagetables which map the domheap region
- * starting at DOMHEAP_VIRT_START in 2MB chunks.
- */
-static DEFINE_PER_CPU(lpae_t *, xen_dommap);
-
-/*
- * Prepare the area that will be used to map domheap pages. They are
- * mapped in 2MB chunks, so we need to allocate the page-tables up to
- * the 2nd level.
- *
- * The caller should make sure the root page-table for @cpu has been
- * allocated.
- */
 bool init_domheap_mappings(unsigned int cpu)
 {
-    unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
-    lpae_t *root = per_cpu(xen_pgtable, cpu);
-    unsigned int i, first_idx;
-    lpae_t *domheap;
-    mfn_t mfn;
-
-    ASSERT(root);
-    ASSERT(!per_cpu(xen_dommap, cpu));
-
-    /*
-     * The domheap for cpu0 is initialized before the heap is initialized.
-     * So we need to use pre-allocated pages.
-     */
-    if ( !cpu )
-        domheap = cpu0_dommap;
-    else
-        domheap = alloc_xenheap_pages(order, 0);
-
-    if ( !domheap )
-        return false;
-
-    /* Ensure the domheap has no stray mappings */
-    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
-
-    /*
-     * Update the first level mapping to reference the local CPUs
-     * domheap mapping pages.
-     */
-    mfn = virt_to_mfn(domheap);
-    first_idx = first_table_offset(DOMHEAP_VIRT_START);
-    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
-    {
-        lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
-        pte.pt.table = 1;
-        write_pte(&root[first_idx + i], pte);
-    }
-
-    per_cpu(xen_dommap, cpu) = domheap;
-
-    return true;
+    return init_domheap_mappings_mm(cpu);
 }
 
 void *map_domain_page_global(mfn_t mfn)
 {
-    return vmap(&mfn, 1);
+    return map_domain_page_global_mm(mfn);
 }
 
 void unmap_domain_page_global(const void *ptr)
 {
-    vunmap(ptr);
+    return unmap_domain_page_global_mm(ptr);
 }
 
 /* Map a page of domheap memory */
 void *map_domain_page(mfn_t mfn)
 {
-    unsigned long flags;
-    lpae_t *map = this_cpu(xen_dommap);
-    unsigned long slot_mfn = mfn_x(mfn) & ~XEN_PT_LPAE_ENTRY_MASK;
-    vaddr_t va;
-    lpae_t pte;
-    int i, slot;
-
-    local_irq_save(flags);
-
-    /* The map is laid out as an open-addressed hash table where each
-     * entry is a 2MB superpage pte.  We use the available bits of each
-     * PTE as a reference count; when the refcount is zero the slot can
-     * be reused. */
-    for ( slot = (slot_mfn >> XEN_PT_LPAE_SHIFT) % DOMHEAP_ENTRIES, i = 0;
-          i < DOMHEAP_ENTRIES;
-          slot = (slot + 1) % DOMHEAP_ENTRIES, i++ )
-    {
-        if ( map[slot].pt.avail < 0xf &&
-             map[slot].pt.base == slot_mfn &&
-             map[slot].pt.valid )
-        {
-            /* This slot already points to the right place; reuse it */
-            map[slot].pt.avail++;
-            break;
-        }
-        else if ( map[slot].pt.avail == 0 )
-        {
-            /* Commandeer this 2MB slot */
-            pte = mfn_to_xen_entry(_mfn(slot_mfn), MT_NORMAL);
-            pte.pt.avail = 1;
-            write_pte(map + slot, pte);
-            break;
-        }
-
-    }
-    /* If the map fills up, the callers have misbehaved. */
-    BUG_ON(i == DOMHEAP_ENTRIES);
-
-#ifndef NDEBUG
-    /* Searching the hash could get slow if the map starts filling up.
-     * Cross that bridge when we come to it */
-    {
-        static int max_tries = 32;
-        if ( i >= max_tries )
-        {
-            dprintk(XENLOG_WARNING, "Domheap map is filling: %i tries\n", i);
-            max_tries *= 2;
-        }
-    }
-#endif
-
-    local_irq_restore(flags);
-
-    va = (DOMHEAP_VIRT_START
-          + (slot << SECOND_SHIFT)
-          + ((mfn_x(mfn) & XEN_PT_LPAE_ENTRY_MASK) << THIRD_SHIFT));
-
-    /*
-     * We may not have flushed this specific subpage at map time,
-     * since we only flush the 4k page not the superpage
-     */
-    flush_xen_tlb_range_va_local(va, PAGE_SIZE);
-
-    return (void *)va;
+    return map_domain_page_mm(mfn);
 }
 
 /* Release a mapping taken with map_domain_page() */
 void unmap_domain_page(const void *ptr)
 {
-    unsigned long flags;
-    lpae_t *map = this_cpu(xen_dommap);
-    int slot = ((unsigned long)ptr - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
-
-    if ( !ptr )
-        return;
-
-    local_irq_save(flags);
-
-    ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
-    ASSERT(map[slot].pt.avail != 0);
-
-    map[slot].pt.avail--;
-
-    local_irq_restore(flags);
+    return unmap_domain_page_mm(ptr);
 }
 
 mfn_t domain_page_map_to_mfn(const void *ptr)
 {
-    unsigned long va = (unsigned long)ptr;
-    lpae_t *map = this_cpu(xen_dommap);
-    int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
-    unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
-
-    if ( (va >= VMAP_VIRT_START) && ((va - VMAP_VIRT_START) < VMAP_VIRT_SIZE) )
-        return virt_to_mfn(va);
-
-    ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
-    ASSERT(map[slot].pt.avail != 0);
-
-    return mfn_add(lpae_get_mfn(map[slot]), offset);
+    return domain_page_map_to_mfn_mm(ptr);
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/arm32/mm.h b/xen/arch/arm/include/asm/arm32/mm.h
index 856f2dbec4..7cee031f52 100644
--- a/xen/arch/arm/include/asm/arm32/mm.h
+++ b/xen/arch/arm/include/asm/arm32/mm.h
@@ -18,6 +18,18 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 
 bool init_domheap_mappings(unsigned int cpu);
 
+bool init_domheap_mappings_mm(unsigned int cpu);
+
+void *map_domain_page_global_mm(mfn_t mfn);
+
+void unmap_domain_page_global_mm(const void *ptr);
+
+void *map_domain_page_mm(mfn_t mfn);
+
+void unmap_domain_page_mm(const void *ptr);
+
+mfn_t domain_page_map_to_mfn_mm(const void *ptr);
+
 static inline void arch_setup_page_tables(void)
 {
 }
diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
index 67475fcd80..2cb44b857d 100644
--- a/xen/arch/arm/mmu/Makefile
+++ b/xen/arch/arm/mmu/Makefile
@@ -2,3 +2,4 @@ obj-y += p2m.o
 obj-y += pt.o
 obj-y += setup.o
 obj-y += smpboot.o
+obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
diff --git a/xen/arch/arm/mmu/domain_page.c b/xen/arch/arm/mmu/domain_page.c
new file mode 100644
index 0000000000..af45748ace
--- /dev/null
+++ b/xen/arch/arm/mmu/domain_page.c
@@ -0,0 +1,194 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/mm.h>
+#include <xen/pmap.h>
+#include <xen/vmap.h>
+
+/* Override macros from asm/page.h to make them work with mfn_t */
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+
+/* cpu0's domheap page tables */
+static DEFINE_PAGE_TABLES(cpu0_dommap, DOMHEAP_SECOND_PAGES);
+
+/*
+ * xen_dommap == pages used by map_domain_page, these pages contain
+ * the second level pagetables which map the domheap region
+ * starting at DOMHEAP_VIRT_START in 2MB chunks.
+ */
+static DEFINE_PER_CPU(lpae_t *, xen_dommap);
+
+/*
+ * Prepare the area that will be used to map domheap pages. They are
+ * mapped in 2MB chunks, so we need to allocate the page-tables up to
+ * the 2nd level.
+ *
+ * The caller should make sure the root page-table for @cpu has been
+ * allocated.
+ */
+bool init_domheap_mappings_mm(unsigned int cpu)
+{
+    unsigned int order = get_order_from_pages(DOMHEAP_SECOND_PAGES);
+    lpae_t *root = per_cpu(xen_pgtable, cpu);
+    unsigned int i, first_idx;
+    lpae_t *domheap;
+    mfn_t mfn;
+
+    ASSERT(root);
+    ASSERT(!per_cpu(xen_dommap, cpu));
+
+    /*
+     * The domheap for cpu0 is initialized before the heap is initialized.
+     * So we need to use pre-allocated pages.
+     */
+    if ( !cpu )
+        domheap = cpu0_dommap;
+    else
+        domheap = alloc_xenheap_pages(order, 0);
+
+    if ( !domheap )
+        return false;
+
+    /* Ensure the domheap has no stray mappings */
+    memset(domheap, 0, DOMHEAP_SECOND_PAGES * PAGE_SIZE);
+
+    /*
+     * Update the first level mapping to reference the local CPUs
+     * domheap mapping pages.
+     */
+    mfn = virt_to_mfn(domheap);
+    first_idx = first_table_offset(DOMHEAP_VIRT_START);
+    for ( i = 0; i < DOMHEAP_SECOND_PAGES; i++ )
+    {
+        lpae_t pte = mfn_to_xen_entry(mfn_add(mfn, i), MT_NORMAL);
+        pte.pt.table = 1;
+        write_pte(&root[first_idx + i], pte);
+    }
+
+    per_cpu(xen_dommap, cpu) = domheap;
+
+    return true;
+}
+
+void *map_domain_page_global_mm(mfn_t mfn)
+{
+    return vmap(&mfn, 1);
+}
+
+void unmap_domain_page_global_mm(const void *ptr)
+{
+    vunmap(ptr);
+}
+
+/* Map a page of domheap memory */
+void *map_domain_page_mm(mfn_t mfn)
+{
+    unsigned long flags;
+    lpae_t *map = this_cpu(xen_dommap);
+    unsigned long slot_mfn = mfn_x(mfn) & ~XEN_PT_LPAE_ENTRY_MASK;
+    vaddr_t va;
+    lpae_t pte;
+    int i, slot;
+
+    local_irq_save(flags);
+
+    /* The map is laid out as an open-addressed hash table where each
+     * entry is a 2MB superpage pte.  We use the available bits of each
+     * PTE as a reference count; when the refcount is zero the slot can
+     * be reused. */
+    for ( slot = (slot_mfn >> XEN_PT_LPAE_SHIFT) % DOMHEAP_ENTRIES, i = 0;
+          i < DOMHEAP_ENTRIES;
+          slot = (slot + 1) % DOMHEAP_ENTRIES, i++ )
+    {
+        if ( map[slot].pt.avail < 0xf &&
+             map[slot].pt.base == slot_mfn &&
+             map[slot].pt.valid )
+        {
+            /* This slot already points to the right place; reuse it */
+            map[slot].pt.avail++;
+            break;
+        }
+        else if ( map[slot].pt.avail == 0 )
+        {
+            /* Commandeer this 2MB slot */
+            pte = mfn_to_xen_entry(_mfn(slot_mfn), MT_NORMAL);
+            pte.pt.avail = 1;
+            write_pte(map + slot, pte);
+            break;
+        }
+
+    }
+    /* If the map fills up, the callers have misbehaved. */
+    BUG_ON(i == DOMHEAP_ENTRIES);
+
+#ifndef NDEBUG
+    /* Searching the hash could get slow if the map starts filling up.
+     * Cross that bridge when we come to it */
+    {
+        static int max_tries = 32;
+        if ( i >= max_tries )
+        {
+            dprintk(XENLOG_WARNING, "Domheap map is filling: %i tries\n", i);
+            max_tries *= 2;
+        }
+    }
+#endif
+
+    local_irq_restore(flags);
+
+    va = (DOMHEAP_VIRT_START
+          + (slot << SECOND_SHIFT)
+          + ((mfn_x(mfn) & XEN_PT_LPAE_ENTRY_MASK) << THIRD_SHIFT));
+
+    /*
+     * We may not have flushed this specific subpage at map time,
+     * since we only flush the 4k page not the superpage
+     */
+    flush_xen_tlb_range_va_local(va, PAGE_SIZE);
+
+    return (void *)va;
+}
+
+/* Release a mapping taken with map_domain_page() */
+void unmap_domain_page_mm(const void *ptr)
+{
+    unsigned long flags;
+    lpae_t *map = this_cpu(xen_dommap);
+    int slot = ((unsigned long)ptr - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
+
+    if ( !ptr )
+        return;
+
+    local_irq_save(flags);
+
+    ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
+    ASSERT(map[slot].pt.avail != 0);
+
+    map[slot].pt.avail--;
+
+    local_irq_restore(flags);
+}
+
+mfn_t domain_page_map_to_mfn_mm(const void *ptr)
+{
+    unsigned long va = (unsigned long)ptr;
+    lpae_t *map = this_cpu(xen_dommap);
+    int slot = (va - DOMHEAP_VIRT_START) >> SECOND_SHIFT;
+    unsigned long offset = (va>>THIRD_SHIFT) & XEN_PT_LPAE_ENTRY_MASK;
+
+    if ( (va >= VMAP_VIRT_START) && ((va - VMAP_VIRT_START) < VMAP_VIRT_SIZE) )
+        return virt_to_mfn(va);
+
+    ASSERT(slot >= 0 && slot < DOMHEAP_ENTRIES);
+    ASSERT(map[slot].pt.avail != 0);
+
+    return mfn_add(lpae_get_mfn(map[slot]), offset);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1


