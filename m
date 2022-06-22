Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824C554DC6
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jun 2022 16:48:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354034.581072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41eh-000152-U6; Wed, 22 Jun 2022 14:48:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354034.581072; Wed, 22 Jun 2022 14:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o41eh-000129-PU; Wed, 22 Jun 2022 14:48:31 +0000
Received: by outflank-mailman (input) for mailman id 354034;
 Wed, 22 Jun 2022 14:48:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBTv=W5=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1o41X5-0004Nu-3S
 for xen-devel@lists.xenproject.org; Wed, 22 Jun 2022 14:40:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 476aff44-f239-11ec-b725-ed86ccbb4733;
 Wed, 22 Jun 2022 16:40:36 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 85593D6E;
 Wed, 22 Jun 2022 07:40:37 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7739C3F792;
 Wed, 22 Jun 2022 07:40:36 -0700 (PDT)
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
X-Inumbo-ID: 476aff44-f239-11ec-b725-ed86ccbb4733
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 8/8] xen/arm: introduce new xen,enhanced property value
Date: Wed, 22 Jun 2022 15:38:05 +0100
Message-Id: <67a86c52dfdcd5dd1f56ac3442089012aba09ff6.1655903088.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655903088.git.rahul.singh@arm.com>
References: <cover.1655903088.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new "xen,enhanced" dom0less property value "evtchn" to
enable/disable event-channel interfaces for dom0less guests.

The configurable option is for domUs only. For dom0 we always set the
corresponding property in the Xen code to true.

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c       | 149 ++++++++++++++++--------------
 xen/arch/arm/include/asm/kernel.h |   3 +
 2 files changed, 82 insertions(+), 70 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8925f0d80c..a1c1ab5877 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1396,85 +1396,92 @@ static int __init make_hypervisor_node(struct domain *d,
     if ( res )
         return res;
 
-    if ( !opt_ext_regions )
-    {
-        printk(XENLOG_INFO "%pd: extended regions support is disabled\n", d);
-        nr_ext_regions = 0;
-    }
-    else if ( is_32bit_domain(d) )
-    {
-        printk(XENLOG_WARNING
-               "%pd: extended regions not supported for 32-bit guests\n", d);
-        nr_ext_regions = 0;
-    }
-    else
+    if ( kinfo->dom0less_enhanced )
     {
-        ext_regions = xzalloc(struct meminfo);
-        if ( !ext_regions )
-            return -ENOMEM;
-
-        if ( is_domain_direct_mapped(d) )
+        if ( !opt_ext_regions )
         {
-            if ( !is_iommu_enabled(d) )
-                res = find_unallocated_memory(kinfo, ext_regions);
-            else
-                res = find_memory_holes(kinfo, ext_regions);
+            printk(XENLOG_INFO
+                   "%pd: extended regions support is disabled\n", d);
+            nr_ext_regions = 0;
         }
-        else
+        else if ( is_32bit_domain(d) )
         {
-            res = find_domU_holes(kinfo, ext_regions);
+            printk(XENLOG_WARNING
+                   "%pd: extended regions not supported for 32-bit guests\n", d);
+            nr_ext_regions = 0;
         }
+        else
+        {
+            ext_regions = xzalloc(struct meminfo);
+            if ( !ext_regions )
+                return -ENOMEM;
 
-        if ( res )
-            printk(XENLOG_WARNING "%pd: failed to allocate extended regions\n",
-                   d);
-        nr_ext_regions = ext_regions->nr_banks;
-    }
+            if ( is_domain_direct_mapped(d) )
+            {
+                if ( !is_iommu_enabled(d) )
+                    res = find_unallocated_memory(kinfo, ext_regions);
+                else
+                    res = find_memory_holes(kinfo, ext_regions);
+            }
+            else
+            {
+                res = find_domU_holes(kinfo, ext_regions);
+            }
 
-    reg = xzalloc_array(__be32, (nr_ext_regions + 1) * (addrcells + sizecells));
-    if ( !reg )
-    {
-        xfree(ext_regions);
-        return -ENOMEM;
-    }
+            if ( res )
+                printk(XENLOG_WARNING
+                       "%pd: failed to allocate extended regions\n", d);
+            nr_ext_regions = ext_regions->nr_banks;
+        }
 
-    /* reg 0 is grant table space */
-    cells = &reg[0];
-    dt_child_set_range(&cells, addrcells, sizecells,
-                       kinfo->gnttab_start, kinfo->gnttab_size);
-    /* reg 1...N are extended regions */
-    for ( i = 0; i < nr_ext_regions; i++ )
-    {
-        u64 start = ext_regions->bank[i].start;
-        u64 size = ext_regions->bank[i].size;
+        reg = xzalloc_array(__be32, (nr_ext_regions + 1) * (addrcells + sizecells));
+        if ( !reg )
+        {
+            xfree(ext_regions);
+            return -ENOMEM;
+        }
 
-        printk("%pd: extended region %d: %#"PRIx64"->%#"PRIx64"\n",
-               d, i, start, start + size);
+        /* reg 0 is grant table space */
+        cells = &reg[0];
+        dt_child_set_range(&cells, addrcells, sizecells,
+                           kinfo->gnttab_start, kinfo->gnttab_size);
+        /* reg 1...N are extended regions */
+        for ( i = 0; i < nr_ext_regions; i++ )
+        {
+            u64 start = ext_regions->bank[i].start;
+            u64 size = ext_regions->bank[i].size;
 
-        dt_child_set_range(&cells, addrcells, sizecells, start, size);
-    }
+            printk("%pd: extended region %d: %#"PRIx64"->%#"PRIx64"\n",
+                   d, i, start, start + size);
 
-    res = fdt_property(fdt, "reg", reg,
-                       dt_cells_to_size(addrcells + sizecells) *
-                       (nr_ext_regions + 1));
-    xfree(ext_regions);
-    xfree(reg);
+            dt_child_set_range(&cells, addrcells, sizecells, start, size);
+        }
 
-    if ( res )
-        return res;
+        res = fdt_property(fdt, "reg", reg,
+                           dt_cells_to_size(addrcells + sizecells) *
+                           (nr_ext_regions + 1));
+        xfree(ext_regions);
+        xfree(reg);
 
-    BUG_ON(d->arch.evtchn_irq == 0);
+        if ( res )
+            return res;
+    }
 
-    /*
-     * Interrupt event channel upcall:
-     *  - Active-low level-sensitive
-     *  - All CPUs
-     *  TODO: Handle properly the cpumask;
-     */
-    set_interrupt(intr, d->arch.evtchn_irq, 0xf, DT_IRQ_TYPE_LEVEL_LOW);
-    res = fdt_property_interrupts(kinfo, &intr, 1);
-    if ( res )
-        return res;
+    if ( kinfo->dom0less_evtchn )
+    {
+        BUG_ON(d->arch.evtchn_irq == 0);
+
+        /*
+         * Interrupt event channel upcall:
+         *  - Active-low level-sensitive
+         *  - All CPUs
+         *  TODO: Handle properly the cpumask;
+        */
+        set_interrupt(intr, d->arch.evtchn_irq, 0xf, DT_IRQ_TYPE_LEVEL_LOW);
+        res = fdt_property_interrupts(kinfo, &intr, 1);
+        if ( res )
+            return res;
+    }
 
     res = fdt_end_node(fdt);
 
@@ -2891,7 +2898,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
             goto err;
     }
 
-    if ( kinfo->dom0less_enhanced )
+    if ( kinfo->dom0less_enhanced || kinfo->dom0less_evtchn )
     {
         ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
         if ( ret )
@@ -3346,11 +3353,11 @@ static int __init construct_domU(struct domain *d,
          rc == -ENODATA ||
          (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
     {
-        if ( hardware_domain )
-            kinfo.dom0less_enhanced = true;
-        else
-            panic("Tried to use xen,enhanced without dom0\n");
+        kinfo.dom0less_enhanced = true;
+        kinfo.dom0less_evtchn = true;
     }
+    else if ( rc == 0 && !strcmp(dom0less_enhanced, "evtchn") )
+        kinfo.dom0less_evtchn = true;
 
     if ( vcpu_create(d, 0) == NULL )
         return -ENOMEM;
@@ -3529,6 +3536,8 @@ static int __init construct_dom0(struct domain *d)
 
     kinfo.unassigned_mem = dom0_mem;
     kinfo.d = d;
+    kinfo.dom0less_enhanced = true;
+    kinfo.dom0less_evtchn = true;
 
     rc = kernel_probe(&kinfo, NULL);
     if ( rc < 0 )
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index c4dc039b54..7cff19b997 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -39,6 +39,9 @@ struct kernel_info {
     /* Enable PV drivers */
     bool dom0less_enhanced;
 
+    /* Enable event-channel interface */
+    bool dom0less_evtchn;
+
     /* GIC phandle */
     uint32_t phandle_gic;
 
-- 
2.25.1


