Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCD4070D7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 20:20:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.184710.333438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOl7h-0003mt-24; Fri, 10 Sep 2021 18:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 184710.333438; Fri, 10 Sep 2021 18:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOl7g-0003ke-Tu; Fri, 10 Sep 2021 18:19:36 +0000
Received: by outflank-mailman (input) for mailman id 184710;
 Fri, 10 Sep 2021 18:19:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ConJ=OA=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mOl7f-0003AT-WB
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 18:19:36 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8cdc84b-f567-4eae-bb76-6688abd738e9;
 Fri, 10 Sep 2021 18:19:26 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id k4so5789292lfj.7
 for <xen-devel@lists.xenproject.org>; Fri, 10 Sep 2021 11:19:26 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a7sm625045lfi.15.2021.09.10.11.19.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 Sep 2021 11:19:25 -0700 (PDT)
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
X-Inumbo-ID: d8cdc84b-f567-4eae-bb76-6688abd738e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6OqwJJkVPWfknF1ipcJOm+d5im8+QUIzbjtyLrkFb/M=;
        b=W1rFwzZH8zTl0VZSHEaQMpOhOo3ip+nzB56r7+WBk0X0NEQ+1VqIuPamRv5m7WGHKq
         ZTE8m7ngwpqPWIOhMbglmfpRyUmI4WO/A3qpexBiLh9klKvPdVEA08/c4PmUPjaMwd59
         ML/SD3wxAnA0XutCWMsq7tUea45boYezdoYcE5DCBrlLuDqbuf/OZB5FJOseCB3BMtEp
         qJX+2YXswxPMAauDRH0x7rBr+GpI0RfzCi/tGRsjfJ/Y4rjlWNlq0ZTROXytKQhcoB2p
         DTyuLryBdFnzUYOGnGhd0S0uDLyahDxQQSW/e67iculbiHvaDzOkZPRwQafgoc+RZSaC
         n/dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6OqwJJkVPWfknF1ipcJOm+d5im8+QUIzbjtyLrkFb/M=;
        b=YH3AHKjmXwQRp/i1wzAlvFh6c/s3hCN4VMQCCTYetwyw5rKVOwY5gLC9vrd4Kvct4o
         gKY5uYTY5cgxM2iK4EPXvZ99RAUe/Hku6iqva6wTF2Qgvzybenvmc07Nn9fj63bB5ELt
         XGBkHirk6A/JMo66QDR0s7oZwCEFefRJ4Nm2ND0NvTcNbjKNZsiOa9p9lP5E2P0PJVwW
         3H//DBIb67bYlFL2AL1wqlFsysclgTsAPS/v9ixEpS4CYchtscHsLYQMgKxrDhnOQi5p
         0laPPSH/DLBjOw1SJrUgJxobIAxooD+FPrZexVdP+jQIiOS2lKUcBMEmTobxJCYzTw5C
         UwhA==
X-Gm-Message-State: AOAM531j7+eXRygBUl5c1Bq3zmNkO9MkH8HkV9o7pxwL/9gkVn5mebfc
	sO/t+bGNV4Jdc6/fMER99n23STuFGU0=
X-Google-Smtp-Source: ABdhPJwOkAqyiJqstacgeYt9Ih7dmN6D82FgzbEmHKzP6tBr/Ie+o6OyzcVjMlFpoBHbXhUA1N4gcQ==
X-Received: by 2002:a05:6512:3b9d:: with SMTP id g29mr4866022lfv.77.1631297965309;
        Fri, 10 Sep 2021 11:19:25 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <Wei.Chen@arm.com>
Subject: [PATCH V2 2/3] xen/arm: Add handling of extended regions for Dom0
Date: Fri, 10 Sep 2021 21:18:43 +0300
Message-Id: <1631297924-8658-3-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>
References: <1631297924-8658-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

The extended region (safe range) is a region of guest physical
address space which is unused and could be safely used to create
grant/foreign mappings instead of wasting real RAM pages from
the domain memory for establishing these mappings.

The extended regions are chosen at the domain creation time and
advertised to it via "reg" property under hypervisor node in
the guest device-tree. As region 0 is reserved for grant table
space (always present), the indexes for extended regions are 1...N.
If extended regions could not be allocated for some reason,
Xen doesn't fail and behaves as usual, so only inserts region 0.

Please note the following limitations:
- The extended region feature is only supported for 64-bit domain.
- The ACPI case is not covered.

***

As Dom0 is direct mapped domain on Arm (e.g. MFN == GFN)
the algorithm to choose extended regions for it is different
in comparison with the algorithm for non-direct mapped DomU.
What is more, that extended regions should be chosen differently
whether IOMMU is enabled or not.

Provide RAM not assigned to Dom0 if IOMMU is disabled or memory
holes found in host device-tree if otherwise. Make sure that
extended regions are 2MB-aligned and located within maximum possible
addressable physical memory range. The maximum number of extended
regions is 128.

Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Changes since RFC:
   - update patch description
   - drop uneeded "extended-region" DT property
---

 xen/arch/arm/domain_build.c | 226 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 224 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 206038d..070ec27 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -724,6 +724,196 @@ static int __init make_memory_node(const struct domain *d,
     return res;
 }
 
+static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
+{
+    struct meminfo *ext_regions = data;
+    paddr_t start, size;
+
+    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
+        return 0;
+
+    /* Both start and size of the extended region should be 2MB aligned */
+    start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
+    if ( start > e )
+        return 0;
+
+    size = (e - start + 1) & ~(SZ_2M - 1);
+    if ( !size )
+        return 0;
+
+    ext_regions->bank[ext_regions->nr_banks].start = start;
+    ext_regions->bank[ext_regions->nr_banks].size = size;
+    ext_regions->nr_banks ++;
+
+    return 0;
+}
+
+/*
+ * The extended regions will be prevalidated by the memory hotplug path
+ * in Linux which requires for any added address range to be within maximum
+ * possible addressable physical memory range for which the linear mapping
+ * could be created.
+ * For 48-bit VA space size the maximum addressable range are:
+ * 0x40000000 - 0x80003fffffff
+ */
+#define EXT_REGION_START   0x40000000ULL
+#define EXT_REGION_END     0x80003fffffffULL
+
+static int __init find_unallocated_memory(const struct kernel_info *kinfo,
+                                          struct meminfo *ext_regions)
+{
+    const struct meminfo *assign_mem = &kinfo->mem;
+    struct rangeset *unalloc_mem;
+    paddr_t start, end;
+    unsigned int i;
+    int res;
+
+    dt_dprintk("Find unallocated memory for extended regions\n");
+
+    unalloc_mem = rangeset_new(NULL, NULL, 0);
+    if ( !unalloc_mem )
+        return -ENOMEM;
+
+    /* Start with all available RAM */
+    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
+    {
+        start = bootinfo.mem.bank[i].start;
+        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size - 1;
+        res = rangeset_add_range(unalloc_mem, start, end);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
+                   start, end);
+            goto out;
+        }
+    }
+
+    /* Remove RAM assigned to Dom0 */
+    for ( i = 0; i < assign_mem->nr_banks; i++ )
+    {
+        start = assign_mem->bank[i].start;
+        end = assign_mem->bank[i].start + assign_mem->bank[i].size - 1;
+        res = rangeset_remove_range(unalloc_mem, start, end);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+                   start, end);
+            goto out;
+        }
+    }
+
+    /* Remove reserved-memory regions */
+    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
+    {
+        start = bootinfo.reserved_mem.bank[i].start;
+        end = bootinfo.reserved_mem.bank[i].start +
+            bootinfo.reserved_mem.bank[i].size - 1;
+        res = rangeset_remove_range(unalloc_mem, start, end);
+        if ( res )
+        {
+            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+                   start, end);
+            goto out;
+        }
+    }
+
+    /* Remove grant table region */
+    start = kinfo->gnttab_start;
+    end = kinfo->gnttab_start + kinfo->gnttab_size - 1;
+    res = rangeset_remove_range(unalloc_mem, start, end);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+               start, end);
+        goto out;
+    }
+
+    start = EXT_REGION_START;
+    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
+    res = rangeset_report_ranges(unalloc_mem, start, end,
+                                 add_ext_regions, ext_regions);
+    if ( res )
+        ext_regions->nr_banks = 0;
+    else if ( !ext_regions->nr_banks )
+        res = -ENOENT;
+
+out:
+    rangeset_destroy(unalloc_mem);
+
+    return res;
+}
+
+static int __init find_memory_holes(const struct kernel_info *kinfo,
+                                    struct meminfo *ext_regions)
+{
+    struct dt_device_node *np;
+    struct rangeset *mem_holes;
+    paddr_t start, end;
+    unsigned int i;
+    int res;
+
+    dt_dprintk("Find memory holes for extended regions\n");
+
+    mem_holes = rangeset_new(NULL, NULL, 0);
+    if ( !mem_holes )
+        return -ENOMEM;
+
+    /* Start with maximum possible addressable physical memory range */
+    start = EXT_REGION_START;
+    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
+    res = rangeset_add_range(mem_holes, start, end);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
+               start, end);
+        goto out;
+    }
+
+    /* Remove all regions described by "reg" property (MMIO, RAM, etc) */
+    dt_for_each_device_node( dt_host, np )
+    {
+        unsigned int naddr;
+        u64 addr, size;
+
+        naddr = dt_number_of_address(np);
+
+        for ( i = 0; i < naddr; i++ )
+        {
+            res = dt_device_get_address(np, i, &addr, &size);
+            if ( res )
+            {
+                printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
+                       i, dt_node_full_name(np));
+                goto out;
+            }
+
+            start = addr & PAGE_MASK;
+            end = PAGE_ALIGN(addr + size) - 1;
+            res = rangeset_remove_range(mem_holes, start, end);
+            if ( res )
+            {
+                printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+                       start, end);
+                goto out;
+            }
+        }
+    }
+
+    start = EXT_REGION_START;
+    end = min((1ULL << p2m_ipa_bits) - 1, EXT_REGION_END);
+    res = rangeset_report_ranges(mem_holes, start, end,
+                                 add_ext_regions,  ext_regions);
+    if ( res )
+        ext_regions->nr_banks = 0;
+    else if ( !ext_regions->nr_banks )
+        res = -ENOENT;
+
+out:
+    rangeset_destroy(mem_holes);
+
+    return res;
+}
+
 static int __init make_hypervisor_node(struct domain *d,
                                        const struct kernel_info *kinfo,
                                        int addrcells, int sizecells)
@@ -731,11 +921,13 @@ static int __init make_hypervisor_node(struct domain *d,
     const char compat[] =
         "xen,xen-"__stringify(XEN_VERSION)"."__stringify(XEN_SUBVERSION)"\0"
         "xen,xen";
-    __be32 reg[4];
+    __be32 reg[(NR_MEM_BANKS + 1) * 4];
     gic_interrupt_t intr;
     __be32 *cells;
     int res;
     void *fdt = kinfo->fdt;
+    struct meminfo *ext_regions;
+    unsigned int i;
 
     dt_dprintk("Create hypervisor node\n");
 
@@ -757,12 +949,42 @@ static int __init make_hypervisor_node(struct domain *d,
     if ( res )
         return res;
 
+    ext_regions = xzalloc(struct meminfo);
+    if ( !ext_regions )
+        return -ENOMEM;
+
+    if ( is_32bit_domain(d) )
+        printk(XENLOG_WARNING "The extended region is only supported for 64-bit guest\n");
+    else
+    {
+        if ( !is_iommu_enabled(d) )
+            res = find_unallocated_memory(kinfo, ext_regions);
+        else
+            res = find_memory_holes(kinfo, ext_regions);
+
+        if ( res )
+            printk(XENLOG_WARNING "Failed to allocate extended regions\n");
+    }
+
     /* reg 0 is grant table space */
     cells = &reg[0];
     dt_child_set_range(&cells, addrcells, sizecells,
                        kinfo->gnttab_start, kinfo->gnttab_size);
+    /* reg 1...N are extended regions */
+    for ( i = 0; i < ext_regions->nr_banks; i++ )
+    {
+        u64 start = ext_regions->bank[i].start;
+        u64 size = ext_regions->bank[i].size;
+
+        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
+                   i, start, start + size);
+
+        dt_child_set_range(&cells, addrcells, sizecells, start, size);
+    }
+    xfree(ext_regions);
+
     res = fdt_property(fdt, "reg", reg,
-                       dt_cells_to_size(addrcells + sizecells));
+                       dt_cells_to_size(addrcells + sizecells) * (i + 1));
     if ( res )
         return res;
 
-- 
2.7.4


