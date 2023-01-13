Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B1668B84
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476623.739048 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjk-0005aU-5O; Fri, 13 Jan 2023 05:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476623.739048; Fri, 13 Jan 2023 05:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjj-0005OI-GO; Fri, 13 Jan 2023 05:36:19 +0000
Received: by outflank-mailman (input) for mailman id 476623;
 Fri, 13 Jan 2023 05:36:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCfI-0005sP-BQ
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:31:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8f4ed25c-9303-11ed-b8d0-410ff93cb8f0;
 Fri, 13 Jan 2023 06:31:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D68D13D5;
 Thu, 12 Jan 2023 21:32:23 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DF3EB3F587;
 Thu, 12 Jan 2023 21:31:38 -0800 (PST)
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
X-Inumbo-ID: 8f4ed25c-9303-11ed-b8d0-410ff93cb8f0
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 39/40] xen/mpu: re-order xen_mpumap in arch_init_finialize
Date: Fri, 13 Jan 2023 13:29:12 +0800
Message-Id: <20230113052914.3845596-40-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In function init_done, we have finished the booting and we do the final
clean-up working, including marking the section .data.ro_after_init
read-only, free init text and init data section, etc.

In MPU system, other than above operations, we also need to re-order
Xen MPU memory region mapping table(xen_mpumap).

In xen_mpumap, we have two type MPU memory region: fixed memory region
and switching memory region.
Fixed memory region are referring to the regions which won't change
since birth, like Xen .text section, while switching region(i.e. device memory)
are regions that gets switched out when idle vcpu leaving hypervisor mode,
and gets switched in when idle vcpu entering hypervisor mode. They were added
at tail during the boot stage.
To save the trouble of hunting down each switching region in time-sensitive
context switch, we re-order xen_mpumap to keep fixed regions still in the
front, and switching ones in the heels of them.

We define a MPU memory region mapping table(sw_mpumap) to store all
switching regions. After disabling them at its original position, we
re-enable them at re-ordering position.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/include/asm/arm64/mpu.h |   5 ++
 xen/arch/arm/include/asm/mm_mpu.h    |   1 +
 xen/arch/arm/include/asm/setup.h     |   2 +
 xen/arch/arm/mm_mpu.c                | 110 +++++++++++++++++++++++++++
 xen/arch/arm/setup.c                 |  13 +---
 xen/arch/arm/setup_mmu.c             |  16 ++++
 xen/arch/arm/setup_mpu.c             |  20 +++++
 7 files changed, 155 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
index b4e50a9a0e..e058f36435 100644
--- a/xen/arch/arm/include/asm/arm64/mpu.h
+++ b/xen/arch/arm/include/asm/arm64/mpu.h
@@ -155,6 +155,11 @@ typedef struct {
     (uint64_t)((_pr->prlar.reg.limit << MPU_REGION_SHIFT) | 0x3f); \
 })
 
+#define region_needs_switching_on_ctxt(pr) ({               \
+    pr_t *_pr = pr;                                         \
+    _pr->prlar.reg.sw;                                      \
+})
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ARM64_MPU_H__ */
diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
index 5aa61c43b6..f8f54eb901 100644
--- a/xen/arch/arm/include/asm/mm_mpu.h
+++ b/xen/arch/arm/include/asm/mm_mpu.h
@@ -10,6 +10,7 @@
  * section by section based on static configuration in Device Tree.
  */
 extern void setup_static_mappings(void);
+extern int reorder_xen_mpumap(void);
 
 extern struct page_info *frame_table;
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index d4c1336597..39cd95553d 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -182,6 +182,8 @@ int map_range_to_domain(const struct dt_device_node *dev,
 
 extern const char __ro_after_init_start[], __ro_after_init_end[];
 
+extern void arch_init_finialize(void);
+
 struct init_info
 {
     /* Pointer to the stack, used by head.S when entering in C */
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index 118bb11d1a..434ed872c1 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -80,6 +80,25 @@ static const unsigned int mpu_section_mattr[MSINFO_MAX] = {
 
 extern char __init_data_begin[], __init_end[];
 
+/*
+ * MPU memory mapping table records regions that needs switching in/out
+ * during vcpu context switch
+ */
+static pr_t *sw_mpumap;
+static uint64_t nr_sw_mpumap;
+
+/*
+ * After reordering, nr_xen_mpumap records number of regions for Xen fixed
+ * memory mapping
+ */
+static uint64_t nr_xen_mpumap;
+
+/*
+ * After reordering, nr_cpu_mpumap records number of EL2 valid
+ * MPU memory regions
+ */
+static uint64_t nr_cpu_mpumap;
+
 /* Write a MPU protection region */
 #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
     uint64_t _sel = sel;                                                \
@@ -847,6 +866,97 @@ void unmap_page_from_xen_misc(void)
 {
 }
 
+void dump_hyp_mapping(void)
+{
+    uint64_t i = 0;
+    pr_t region;
+
+    for ( i = 0; i < nr_cpu_mpumap; i++ )
+    {
+        access_protection_region(true, &region, NULL, i);
+        printk(XENLOG_INFO
+               "MPU memory region [%lu]: 0x%"PRIpaddr" - 0x%"PRIpaddr".\n",
+               i, pr_get_base(&region), pr_get_limit(&region));
+    }
+}
+
+/* Standard entry to dynamically allocate MPU memory region mapping table. */
+static pr_t *alloc_mpumap(void)
+{
+    pr_t *map;
+
+    /*
+     * A MPU memory region structure(pr_t) takes 16 bytes, even with maximum
+     * supported MPU protection regions in EL2, 255, MPU table at most takes up
+     * less than 4KB(PAGE_SIZE).
+     */
+    map = alloc_xenheap_pages(0, 0);
+    if ( map == NULL )
+        return NULL;
+
+    clear_page(map);
+    return map;
+}
+
+/*
+ * Switching region(i.e. device memory) are regions that gets switched out
+ * when idle vcpu leaving hypervisor mode, and gets switched in when idle vcpu
+ * entering hypervisor mode. They're added at tail during the boot stage.
+ * To save the trouble of hunting down each switching region in time-sensitive
+ * context switch, we re-order xen_mpumap to keep fixed regions still in the
+ * front, and switching ones in the heels of them.
+ */
+int reorder_xen_mpumap(void)
+{
+    uint64_t i;
+
+    sw_mpumap = alloc_mpumap();
+    if ( !sw_mpumap )
+        return -ENOMEM;
+
+    /* Record the switching regions in sw_mpumap. */
+    for ( i = next_transient_region_idx - 1; i < max_xen_mpumap; i++ )
+    {
+        pr_t *region;
+
+        region = &xen_mpumap[i];
+        if ( region_is_valid(region) && region_needs_switching_on_ctxt(region) )
+        {
+            sw_mpumap[nr_sw_mpumap++] = xen_mpumap[i];
+
+            /*
+             * Disable it temporarily for later enabling it in the
+             * new reordered position
+             * WARNING: since device memory section, as switching region,
+             * will get disabled temporarily, console will become inaccessible
+             * in a short time.
+             */
+            control_mpu_region_from_index(i, false);
+            memset(&xen_mpumap[i], 0, sizeof(pr_t));
+        }
+    }
+
+    /* Put switching regions after fixed regions */
+    i = 0;
+    nr_cpu_mpumap = nr_xen_mpumap = next_fixed_region_idx;
+    do
+    {
+        access_protection_region(false, NULL,
+                                 (const pr_t*)(&sw_mpumap[i]),
+                                 nr_cpu_mpumap);
+        nr_cpu_mpumap++;
+    } while ( ++i < nr_sw_mpumap );
+
+    /*
+     * Now, xen_mpumap becomes a tight mapping, with fixed region at front and
+     * switching ones after fixed ones.
+     */
+    printk(XENLOG_INFO "Xen EL2 MPU memory region mapping after re-order.\n");
+    dump_hyp_mapping();
+
+    return 0;
+}
+
 /* TODO: Implementation on the first usage */
 void dump_hyp_walk(vaddr_t addr)
 {
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 49ba998f68..b21fc4b8e2 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -61,23 +61,12 @@ domid_t __read_mostly max_init_domid;
 
 static __used void init_done(void)
 {
-    int rc;
-
     /* Must be done past setting system_state. */
     unregister_init_virtual_region();
 
     free_init_memory();
 
-    /*
-     * We have finished booting. Mark the section .data.ro_after_init
-     * read-only.
-     */
-    rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
-                             (unsigned long)&__ro_after_init_end,
-                             PAGE_HYPERVISOR_RO);
-    if ( rc )
-        panic("Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
-              rc);
+    arch_init_finialize();
 
     startup_cpu_idle_loop();
 }
diff --git a/xen/arch/arm/setup_mmu.c b/xen/arch/arm/setup_mmu.c
index 611a60633e..5b7a5de086 100644
--- a/xen/arch/arm/setup_mmu.c
+++ b/xen/arch/arm/setup_mmu.c
@@ -365,6 +365,22 @@ void __init discard_initial_modules(void)
     remove_early_mappings();
 }
 
+void arch_init_finialize(void)
+{
+    int rc;
+
+    /*
+     * We have finished booting. Mark the section .data.ro_after_init
+     * read-only.
+     */
+    rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
+                             (unsigned long)&__ro_after_init_end,
+                             PAGE_HYPERVISOR_RO);
+    if ( rc )
+        panic("Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
+              rc);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/setup_mpu.c b/xen/arch/arm/setup_mpu.c
index f47f1f39ee..b510780cde 100644
--- a/xen/arch/arm/setup_mpu.c
+++ b/xen/arch/arm/setup_mpu.c
@@ -178,6 +178,26 @@ void __init discard_initial_modules(void)
     remove_early_mappings();
 }
 
+void arch_init_finialize(void)
+{
+    int rc;
+
+    /*
+     * We have finished booting. Mark the section .data.ro_after_init
+     * read-only.
+     */
+    rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
+                             (unsigned long)&__ro_after_init_end,
+                             REGION_HYPERVISOR_RO);
+    if ( rc )
+        panic("mpu: Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
+              rc);
+
+    rc = reorder_xen_mpumap();
+    if ( rc )
+        panic("mpu: Failed to reorder Xen MPU memory mapping (rc = %d)\n", rc);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


