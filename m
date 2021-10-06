Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B57BF423C9B
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 13:23:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202817.357869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY50c-0002pn-JE; Wed, 06 Oct 2021 11:22:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202817.357869; Wed, 06 Oct 2021 11:22:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mY50c-0002mw-Cu; Wed, 06 Oct 2021 11:22:50 +0000
Received: by outflank-mailman (input) for mailman id 202817;
 Wed, 06 Oct 2021 11:22:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RZr5=O2=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mY50a-0001im-IO
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 11:22:48 +0000
Received: from mail-lf1-x12c.google.com (unknown [2a00:1450:4864:20::12c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 710e5734-36c3-45dd-835d-331db318602f;
 Wed, 06 Oct 2021 11:22:35 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id b20so9016152lfv.3
 for <xen-devel@lists.xenproject.org>; Wed, 06 Oct 2021 04:22:34 -0700 (PDT)
Received: from otyshchenko.router ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l14sm1002101lfe.124.2021.10.06.04.22.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Oct 2021 04:22:33 -0700 (PDT)
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
X-Inumbo-ID: 710e5734-36c3-45dd-835d-331db318602f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Rtq6Pj4F8ozkEpAk2DlH7ilXrtLILHIJ9p4nUtH8GRQ=;
        b=hSGK7kM9kvHazi1anZypIGHpO3d5E+YfBkg/VhFd2QAjg5JGvWXoPuznbV/hsOUESz
         YRkgvzRYKvmGvmlYBkWNIHouYtRTqcc7s1X5A6MtJAWQBOC5xR+iJ6eL/FKevnq6tC2H
         qZTQpRc2VxhBIwqaOG753EvKP1pyrCgoGaOTJ1YpDh62BXJBY/R5S9tuRMZyAaIpwivU
         XTfderWbKvJw80KELUp36e6KAbcPQUEwmHhm48qCnK8xmq+XxEHj6qxejcuVYIooxhcy
         aUq2ST4V4xnuq8CjnnHZtegYuRalGKdGsM6HXG+Rl7ACWPKzxpi3MqgJ16uTPKIeYkSs
         lPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Rtq6Pj4F8ozkEpAk2DlH7ilXrtLILHIJ9p4nUtH8GRQ=;
        b=siZMa3FzXrZUR7ZwSWh2PcfXFOh8F7PADzceocbfAbZoDTqxGyiOZ2vVljxe/AhZiX
         hlb8ByPo3DD6FXiLvpGnFTBWUSc+cMJXO08fmy2tEtquYk4FYvmSmsr9tZ6gF47pElZT
         qCMNI2+ozKlnzuyWDI2R6Xm3PLUp9nNL17HcrM8oigfMcqsL7xv7sCLhzVdGxMmrSEpj
         avE6ncOicKXG1t5xL+9upO4pT2pgDuJ70nqIsLWOyTxXnbzZYxm33aF3MPHNi2aod+bA
         ZYc4REotsKPpGw4cQfkKkmL20wdHYNqz9gCFto+UEAA++5mWApO7GZBoejRQQ169vFD8
         ifJQ==
X-Gm-Message-State: AOAM5331uj/v+b8MqItNI1niINZ/ALg7tK966/d5y3QECOS61BAopeih
	rhmgrSSP7b5p2IdzWRml+7OTlN4gRpQ=
X-Google-Smtp-Source: ABdhPJwHLieFYd8pJDDpfNyisXMWFeyFFALV5LAJWTfI4EfWgB3D5uFRWSZROcIJMs4U4qL9NAkd0g==
X-Received: by 2002:a2e:8090:: with SMTP id i16mr27135322ljg.296.1633519353796;
        Wed, 06 Oct 2021 04:22:33 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH V5 3/3] xen/arm: Updates for extended regions support
Date: Wed,  6 Oct 2021 14:22:26 +0300
Message-Id: <1633519346-3686-4-git-send-email-olekstysh@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>
References: <1633519346-3686-1-git-send-email-olekstysh@gmail.com>

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

This is a follow-up of
"b6fe410 xen/arm: Add handling of extended regions for Dom0"

Add various in-code comments, update Xen hypervisor device tree
bindings text, change the log level for some prints and clarify
format specifier, reuse dt_for_each_range() to avoid open-coding
in find_memory_holes().

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
   New patch
---
 docs/misc/arm/device-tree/guest.txt |  12 ++--
 xen/arch/arm/domain_build.c         | 108 ++++++++++++++++++++++--------------
 2 files changed, 73 insertions(+), 47 deletions(-)

diff --git a/docs/misc/arm/device-tree/guest.txt b/docs/misc/arm/device-tree/guest.txt
index 418f1e9..c115751 100644
--- a/docs/misc/arm/device-tree/guest.txt
+++ b/docs/misc/arm/device-tree/guest.txt
@@ -7,10 +7,14 @@ the following properties:
 	compatible = "xen,xen-<version>", "xen,xen";
   where <version> is the version of the Xen ABI of the platform.
 
-- reg: specifies the base physical address and size of a region in
-  memory where the grant table should be mapped to, using an
-  HYPERVISOR_memory_op hypercall. The memory region is large enough to map
-  the whole grant table (it is larger or equal to gnttab_max_grant_frames()).
+- reg: specifies the base physical address and size of the regions in memory
+  where the special resources should be mapped to, using an HYPERVISOR_memory_op
+  hypercall.
+  Region 0 is reserved for mapping grant table, it must be always present.
+  The memory region is large enough to map the whole grant table (it is larger
+  or equal to gnttab_max_grant_frames()).
+  Regions 1...N are extended regions (unused address space) for mapping foreign
+  GFNs and grants, they might be absent if there is nothing to expose.
   This property is unnecessary when booting Dom0 using ACPI.
 
 - interrupts: the interrupt used by Xen to inject event notifications.
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c5afbe2..d9f40d4 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -898,7 +898,10 @@ static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
     if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
         return 0;
 
-    /* Both start and size of the extended region should be 2MB aligned */
+    /*
+     * Both start and size of the extended region should be 2MB aligned to
+     * potentially allow superpage mapping.
+     */
     start = (s + SZ_2M - 1) & ~(SZ_2M - 1);
     if ( start > e )
         return 0;
@@ -909,6 +912,12 @@ static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
      */
     e += 1;
     size = (e - start) & ~(SZ_2M - 1);
+
+    /*
+     * Reasonable size. Not too little to pick up small ranges which are
+     * not quite useful itself but increase bookkeeping and not too much
+     * to skip a large proportion of unused address space.
+     */
     if ( size < MB(64) )
         return 0;
 
@@ -919,6 +928,14 @@ static int __init add_ext_regions(unsigned long s, unsigned long e, void *data)
     return 0;
 }
 
+/*
+ * Find unused regions of Host address space which can be exposed to Dom0
+ * as extended regions for the special memory mappings. In order to calculate
+ * regions we exclude every assigned to Dom0 region from the Host RAM:
+ * - domain RAM
+ * - reserved-memory
+ * - grant table space
+ */
 static int __init find_unallocated_memory(const struct kernel_info *kinfo,
                                           struct meminfo *ext_regions)
 {
@@ -942,7 +959,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         res = rangeset_add_range(unalloc_mem, start, end - 1);
         if ( res )
         {
-            printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
+            printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
                    start, end);
             goto out;
         }
@@ -956,7 +973,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         res = rangeset_remove_range(unalloc_mem, start, end - 1);
         if ( res )
         {
-            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
                    start, end);
             goto out;
         }
@@ -971,7 +988,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         res = rangeset_remove_range(unalloc_mem, start, end - 1);
         if ( res )
         {
-            printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+            printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
                    start, end);
             goto out;
         }
@@ -983,7 +1000,7 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     res = rangeset_remove_range(unalloc_mem, start, end - 1);
     if ( res )
     {
-        printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+        printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
                start, end);
         goto out;
     }
@@ -1003,6 +1020,35 @@ out:
     return res;
 }
 
+static int __init handle_pci_range(const struct dt_device_node *dev,
+                                   u64 addr, u64 len, void *data)
+{
+    struct rangeset *mem_holes = data;
+    paddr_t start, end;
+    int res;
+
+    start = addr & PAGE_MASK;
+    end = PAGE_ALIGN(addr + len);
+    res = rangeset_remove_range(mem_holes, start, end - 1);
+    if ( res )
+    {
+        printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
+               start, end);
+        return res;
+    }
+
+    return 0;
+}
+
+/*
+ * Find the holes in the Host DT which can be exposed to Dom0 as extended
+ * regions for the special memory mappings. In order to calculate regions
+ * we exclude every addressable memory region described by "reg" and "ranges"
+ * properties from the maximum possible addressable physical memory range:
+ * - MMIO
+ * - Host RAM
+ * - PCI bar
+ */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
                                     struct meminfo *ext_regions)
 {
@@ -1024,7 +1070,7 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
     res = rangeset_add_range(mem_holes, start, end);
     if ( res )
     {
-        printk(XENLOG_ERR "Failed to add: %#"PRIx64"->%#"PRIx64"\n",
+        printk(XENLOG_ERR "Failed to add: %#"PRIpaddr"->%#"PRIpaddr"\n",
                start, end);
         goto out;
     }
@@ -1055,49 +1101,25 @@ static int __init find_memory_holes(const struct kernel_info *kinfo,
             res = rangeset_remove_range(mem_holes, start, end - 1);
             if ( res )
             {
-                printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
+                printk(XENLOG_ERR "Failed to remove: %#"PRIpaddr"->%#"PRIpaddr"\n",
                        start, end);
                 goto out;
             }
         }
 
-        if ( dt_device_type_is_equal(np, "pci" ) )
+        if ( dt_device_type_is_equal(np, "pci") )
         {
-            unsigned int range_size, nr_ranges;
-            int na, ns, pna;
-            const __be32 *ranges;
-            u32 len;
-
             /*
-             * Looking for non-empty ranges property which in this context
-             * describes the PCI host bridge aperture.
+             * The ranges property in this context describes the PCI host
+             * bridge aperture. It shall be absent if no addresses are mapped
+             * through the bridge.
              */
-            ranges = dt_get_property(np, "ranges", &len);
-            if ( !ranges || !len )
+            if ( !dt_get_property(np, "ranges", NULL) )
                 continue;
 
-            pna = dt_n_addr_cells(np);
-            na = dt_child_n_addr_cells(np);
-            ns = dt_child_n_size_cells(np);
-            range_size = pna + na + ns;
-            nr_ranges = len / sizeof(__be32) / range_size;
-
-            for ( i = 0; i < nr_ranges; i++, ranges += range_size )
-            {
-                /* Skip the child address and get the parent (CPU) address */
-                addr = dt_read_number(ranges + na, pna);
-                size = dt_read_number(ranges + na + pna, ns);
-
-                start = addr & PAGE_MASK;
-                end = PAGE_ALIGN(addr + size);
-                res = rangeset_remove_range(mem_holes, start, end - 1);
-                if ( res )
-                {
-                    printk(XENLOG_ERR "Failed to remove: %#"PRIx64"->%#"PRIx64"\n",
-                           start, end);
-                    goto out;
-                }
-            }
+            res = dt_for_each_range(np, &handle_pci_range, mem_holes);
+            if ( res )
+                goto out;
         }
     }
 
@@ -1152,12 +1174,12 @@ static int __init make_hypervisor_node(struct domain *d,
 
     if ( !opt_ext_regions )
     {
-        printk(XENLOG_DEBUG "The extended regions support is disabled\n");
+        printk(XENLOG_INFO "The extended regions support is disabled\n");
         nr_ext_regions = 0;
     }
     else if ( is_32bit_domain(d) )
     {
-        printk(XENLOG_DEBUG "The extended regions are only supported for 64-bit guest currently\n");
+        printk(XENLOG_WARNING "The extended regions are only supported for 64-bit guest currently\n");
         nr_ext_regions = 0;
     }
     else
@@ -1193,8 +1215,8 @@ static int __init make_hypervisor_node(struct domain *d,
         u64 start = ext_regions->bank[i].start;
         u64 size = ext_regions->bank[i].size;
 
-        dt_dprintk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
-                   i, start, start + size);
+        printk("Extended region %d: %#"PRIx64"->%#"PRIx64"\n",
+               i, start, start + size);
 
         dt_child_set_range(&cells, addrcells, sizecells, start, size);
     }
-- 
2.7.4


