Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2927C918D7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 11:01:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174648.1499614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvHu-0000oM-UE; Fri, 28 Nov 2025 10:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174648.1499614; Fri, 28 Nov 2025 10:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOvHu-0000m9-R6; Fri, 28 Nov 2025 10:01:14 +0000
Received: by outflank-mailman (input) for mailman id 1174648;
 Fri, 28 Nov 2025 10:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kA0B=6E=arm.com=harry.ramsey@srs-se1.protection.inumbo.net>)
 id 1vOvHt-0000F3-AM
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 10:01:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ea677e57-cc40-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 11:00:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 44BA71A9A;
 Fri, 28 Nov 2025 01:59:15 -0800 (PST)
Received: from e134099.cambridge.arm.com (e134099.arm.com [10.1.198.34])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB73E3F73B;
 Fri, 28 Nov 2025 01:59:20 -0800 (PST)
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
X-Inumbo-ID: ea677e57-cc40-11f0-980a-7dc792cee155
From: Harry Ramsey <harry.ramsey@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Luca Fancellu <luca.fancellu@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Hari Limaye <hari.limaye@arm.com>
Subject: [PATCH 4/6] arm/mpu: Introduce modify_after_init_mappings
Date: Fri, 28 Nov 2025 09:58:57 +0000
Message-ID: <20251128095859.11264-5-harry.ramsey@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251128095859.11264-1-harry.ramsey@arm.com>
References: <20251128095859.11264-1-harry.ramsey@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Fancellu <luca.fancellu@arm.com>

During `init_done`, Xen sets the permissions of all symbols marked with
__ro_after_init to be read-only. Currently this is achieved by calling
`modify_xen_mappings` and will shrink the RW mapping on one side and
extend the RO mapping on the other.

This does not work on MPU systems at present because part-region
modification is not supported. Therefore introduce the function
`modify_after_init_mappings` for MMU and MPU, to handle the divergent
approaches to setting permissions of __ro_after_init symbols.

As the new function is marked with __init, it needs to be called before
`free_init_memory`.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Signed-off-by: Hari Limaye <hari.limaye@arm.com>
Signed-off-by: Harry Ramsey <harry.ramsey@arm.com>
---
 xen/arch/arm/include/asm/setup.h |  3 +++
 xen/arch/arm/mmu/setup.c         | 15 ++++++++++++
 xen/arch/arm/mpu/mm.c            |  2 +-
 xen/arch/arm/mpu/setup.c         | 40 ++++++++++++++++++++++++++++++++
 xen/arch/arm/setup.c             | 15 ++----------
 5 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 005cf7be59..899e33925c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -78,6 +78,9 @@ struct init_info
 paddr_t consider_modules(paddr_t s, paddr_t e, uint32_t size, paddr_t align,
                          int first_mod);
 
+/* Modify some mappings after the init is done */
+void modify_after_init_mappings(void);
+
 #endif
 /*
  * Local variables:
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 9b874f8ab2..d042f73597 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -213,6 +213,21 @@ void __init remove_early_mappings(void)
     BUG_ON(rc);
 }
 
+void __init modify_after_init_mappings(void)
+{
+    /*
+     * We have finished booting. Mark the section .data.ro_after_init
+     * read-only.
+     */
+    int rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
+                                 (unsigned long)&__ro_after_init_end,
+                                 PAGE_HYPERVISOR_RO);
+
+    if ( rc )
+        panic("Unable to mark the .data.ro_after_init section read-only (rc = %d)\n",
+              rc);
+}
+
 /*
  * After boot, Xen page-tables should not contain mapping that are both
  * Writable and eXecutables.
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 8446dddde8..f95ba7c749 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -32,7 +32,7 @@ DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGION_NR) \
 /* EL2 Xen MPU memory region mapping table. */
 pr_t __cacheline_aligned __section(".data") xen_mpumap[MAX_MPU_REGION_NR];
 
-static DEFINE_SPINLOCK(xen_mpumap_lock);
+DEFINE_SPINLOCK(xen_mpumap_lock);
 
 static void __init __maybe_unused build_assertions(void)
 {
diff --git a/xen/arch/arm/mpu/setup.c b/xen/arch/arm/mpu/setup.c
index ec264f54f2..55317ee318 100644
--- a/xen/arch/arm/mpu/setup.c
+++ b/xen/arch/arm/mpu/setup.c
@@ -8,11 +8,14 @@
 #include <xen/pfn.h>
 #include <xen/types.h>
 #include <xen/sizes.h>
+#include <xen/spinlock.h>
 #include <asm/setup.h>
 
 static paddr_t __initdata mapped_fdt_base = INVALID_PADDR;
 static paddr_t __initdata mapped_fdt_limit = INVALID_PADDR;
 
+extern spinlock_t xen_mpumap_lock;
+
 void __init setup_pagetables(void) {}
 
 void * __init early_fdt_map(paddr_t fdt_paddr)
@@ -106,6 +109,43 @@ void __init copy_from_paddr(void *dst, paddr_t paddr, unsigned long len)
         panic("Unable to unmap range for copy_from_paddr\n");
 }
 
+void __init modify_after_init_mappings(void)
+{
+    int rc;
+    uint8_t idx_rodata;
+    uint8_t idx_rwdata;
+
+    spin_lock(&xen_mpumap_lock);
+
+    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions,
+                                (unsigned long)_srodata,
+                                (unsigned long)_erodata,
+                                &idx_rodata);
+
+    if ( rc < MPUMAP_REGION_FOUND )
+        panic("Unable to find rodata section (rc = %d)\n", rc);
+
+    rc = mpumap_contains_region(xen_mpumap, max_mpu_regions,
+                                (unsigned long)__ro_after_init_start,
+                                (unsigned long)__init_begin,
+                                &idx_rwdata);
+
+    if ( rc < MPUMAP_REGION_FOUND )
+        panic("Unable to find rwdata section (rc = %d)\n", rc);
+
+    /* Shrink rwdata section to begin at __ro_after_init_end */
+    pr_set_base(&xen_mpumap[idx_rwdata], (unsigned long)__ro_after_init_end);
+
+    /* Extend rodata section to end at __ro_after_init_end */
+    pr_set_limit(&xen_mpumap[idx_rodata], (unsigned long)__ro_after_init_end);
+
+    write_protection_region(&xen_mpumap[idx_rwdata], idx_rwdata);
+    write_protection_region(&xen_mpumap[idx_rodata], idx_rodata);
+    context_sync_mpu();
+
+    spin_unlock(&xen_mpumap_lock);
+}
+
 void __init remove_early_mappings(void)
 {
     int rc = destroy_xen_mappings(round_pgdown(mapped_fdt_base),
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 7ad870e382..6310a47d68 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -66,23 +66,12 @@ domid_t __read_mostly max_init_domid;
 
 static __used void noreturn init_done(void)
 {
-    int rc;
-
     /* Must be done past setting system_state. */
     unregister_init_virtual_region();
 
-    free_init_memory();
+    modify_after_init_mappings();
 
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
+    free_init_memory();
 
     startup_cpu_idle_loop();
 }
-- 
2.43.0


