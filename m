Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F54DD1A337
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jan 2026 17:23:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1202067.1517696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhB0-0003V4-7S; Tue, 13 Jan 2026 16:23:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1202067.1517696; Tue, 13 Jan 2026 16:23:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfhB0-0003Su-3h; Tue, 13 Jan 2026 16:23:26 +0000
Received: by outflank-mailman (input) for mailman id 1202067;
 Tue, 13 Jan 2026 16:23:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0e4=7S=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vfhAy-0003EQ-Nq
 for xen-devel@lists.xenproject.org; Tue, 13 Jan 2026 16:23:24 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2e6efb5b-f09c-11f0-b15e-2bf370ae4941;
 Tue, 13 Jan 2026 17:23:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A15A1596;
 Tue, 13 Jan 2026 08:23:16 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73AD33F59E;
 Tue, 13 Jan 2026 08:23:21 -0800 (PST)
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
X-Inumbo-ID: 2e6efb5b-f09c-11f0-b15e-2bf370ae4941
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Luca Fancellu <luca.fancellu@arm.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH v3 3/6] arm/mpu: Implement free_init_memory for MPU systems
Date: Tue, 13 Jan 2026 16:23:06 +0000
Message-ID: <20260113162309.6766-4-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260113162309.6766-1-harry.ramsey@arm.com>
References: <20260113162309.6766-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

Implement the function `free_init_memory` for MPU systems. In order to
support this, the function `modify_xen_mappings` is implemented.

On MPU systems, we map the init text and init data sections using
separate MPU memory regions. Therefore these are removed separately in
`free_init_memory`.

Additionally remove warning messages from `is_mm_attr_match` as some
attributes can now be updated by `xen_mpumap_update_entry`.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
v3:
- Refactor MPU_ATTR_* defines
v2:
- Refactor `is_mm_attr_match` to return logical values regarding the
  attribute mismatch.
- Improve code documentation.
---
 xen/arch/arm/include/asm/setup.h |   2 +
 xen/arch/arm/mpu/mm.c            | 119 +++++++++++++++++++++++--------
 2 files changed, 93 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 1eaf13bd66..005cf7be59 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -65,6 +65,8 @@ int map_irq_to_domain(struct domain *d, unsigned int irq,
 int map_range_to_domain(const struct dt_device_node *dev,
                         uint64_t addr, uint64_t len, void *data);

+extern const char __init_data_begin[], __bss_start[], __bss_end[];
+
 struct init_info
 {
     /* Pointer to the stack, used by head.S when entering in C */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 14a988ea0c..5633c1c4c5 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -15,6 +15,9 @@
 #include <asm/setup.h>
 #include <asm/sysregs.h>

+#define MPU_ATTR_XN_RO_MISMATCH     -1
+#define MPU_ATTR_AI_MISMATCH        -2
+
 struct page_info *frame_table;

 /* Maximum number of supported MPU memory regions by the EL2 MPU. */
@@ -171,33 +174,16 @@ int mpumap_contains_region(pr_t *table, uint8_t nr_regions, paddr_t base,
     return MPUMAP_REGION_NOTFOUND;
 }

-static bool is_mm_attr_match(pr_t *region, unsigned int attributes)
+static int is_mm_attr_match(pr_t *region, unsigned int attributes)
 {
-    if ( region->prbar.reg.ro != PAGE_RO_MASK(attributes) )
-    {
-        printk(XENLOG_WARNING
-               "Mismatched Access Permission attributes (%#x instead of %#x)\n",
-               region->prbar.reg.ro, PAGE_RO_MASK(attributes));
-        return false;
-    }
-
-    if ( region->prbar.reg.xn != PAGE_XN_MASK(attributes) )
-    {
-        printk(XENLOG_WARNING
-               "Mismatched Execute Never attributes (%#x instead of %#x)\n",
-               region->prbar.reg.xn, PAGE_XN_MASK(attributes));
-        return false;
-    }
+    if ( (region->prbar.reg.xn != PAGE_XN_MASK(attributes)) ||
+         (region->prbar.reg.ro != PAGE_RO_MASK(attributes)) )
+        return MPU_ATTR_XN_RO_MISMATCH;

     if ( region->prlar.reg.ai != PAGE_AI_MASK(attributes) )
-    {
-        printk(XENLOG_WARNING
-               "Mismatched Memory Attribute Index (%#x instead of %#x)\n",
-               region->prlar.reg.ai, PAGE_AI_MASK(attributes));
-        return false;
-    }
+        return MPU_ATTR_AI_MISMATCH;

-    return true;
+    return 0;
 }

 /* Map a frame table to cover physical addresses ps through pe */
@@ -358,12 +344,44 @@ static int xen_mpumap_update_entry(paddr_t base, paddr_t limit,
     */
     if ( flags_has_page_present && (rc >= MPUMAP_REGION_FOUND) )
     {
-        if ( !is_mm_attr_match(&xen_mpumap[idx], flags) )
+        int attr_match = is_mm_attr_match(&xen_mpumap[idx], flags);
+
+        /* We do not support modifying AI attribute. */
+        if ( MPU_ATTR_AI_MISMATCH == attr_match )
         {
-            printk("Modifying an existing entry is not supported\n");
+            printk(XENLOG_ERR
+                   "Modifying memory attribute is not supported\n");
             return -EINVAL;
         }

+        /*
+         * Attributes RO and XN can be changed only by the full region.
+         * Attributes that match can continue and just increment refcount.
+         */
+        if ( MPU_ATTR_XN_RO_MISMATCH == attr_match )
+        {
+            if ( rc == MPUMAP_REGION_INCLUSIVE )
+            {
+                printk(XENLOG_ERR
+                       "Cannot modify partial region attributes\n");
+                return -EINVAL;
+            }
+
+            if ( xen_mpumap[idx].refcount != 0 )
+            {
+                printk(XENLOG_ERR
+                       "Cannot modify memory attributes for a region mapped multiple times\n");
+                return -EINVAL;
+            }
+
+            /* Set new attributes */
+            xen_mpumap[idx].prbar.reg.ro = PAGE_RO_MASK(flags);
+            xen_mpumap[idx].prbar.reg.xn = PAGE_XN_MASK(flags);
+
+            write_protection_region(&xen_mpumap[idx], idx);
+            return 0;
+        }
+
         /* Check for overflow of refcount before incrementing.  */
         if ( xen_mpumap[idx].refcount == 0xFF )
         {
@@ -514,8 +532,7 @@ void __init setup_mm_helper(void)

 int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
 {
-    BUG_ON("unimplemented");
-    return -EINVAL;
+    return xen_mpumap_update(s, e, nf);
 }

 void dump_hyp_walk(vaddr_t addr)
@@ -526,7 +543,53 @@ void dump_hyp_walk(vaddr_t addr)
 /* Release all __init and __initdata ranges to be reused */
 void free_init_memory(void)
 {
-    BUG_ON("unimplemented");
+    unsigned long inittext_end = (unsigned long)__init_data_begin;
+    unsigned long len = __init_end - __init_begin;
+    uint8_t idx;
+    int rc;
+
+    /* Modify inittext region to be read/write instead of read/execute. */
+    rc = modify_xen_mappings((unsigned long)__init_begin, inittext_end,
+                             PAGE_HYPERVISOR_RW);
+    if ( rc )
+        panic("Unable to map RW the init text section (rc = %d)\n", rc);
+
+    /*
+     * From now on, init will not be used for execution anymore,
+     * so nuke the instruction cache to remove entries related to init.
+     */
+    invalidate_icache_local();
+
+    /*
+     * The initdata region already has read/write attributes so it can just be
+     * zeroed out.
+     */
+    memset(__init_begin, 0, len);
+
+    rc = destroy_xen_mappings((unsigned long)__init_begin, inittext_end);
+    if ( rc )
+        panic("Unable to remove init text section (rc = %d)\n", rc);
+
+    /*
+     * The initdata and bss sections are mapped using a single MPU region, so
+     * modify the start of this region to remove the initdata section.
+     */
+    spin_lock(&xen_mpumap_lock);
+
+    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions,
+                                (unsigned long)__init_data_begin,
+                                (unsigned long)__bss_end,
+                                &idx);
+    if ( rc < MPUMAP_REGION_FOUND )
+        panic("Unable to find bss data section (rc = %d)\n", rc);
+
+    /* bss data section is shrunk and now starts from __bss_start */
+    pr_set_base(&xen_mpumap[idx], (unsigned long)__bss_start);
+
+    write_protection_region(&xen_mpumap[idx], idx);
+    context_sync_mpu();
+
+    spin_unlock(&xen_mpumap_lock);
 }

 void __iomem *ioremap_attr(paddr_t start, size_t len, unsigned int flags)
--
2.43.0


