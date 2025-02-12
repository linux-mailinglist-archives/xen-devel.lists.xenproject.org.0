Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B74A321E9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 10:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886228.1295925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8tq-0001nd-Ip; Wed, 12 Feb 2025 09:19:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886228.1295925; Wed, 12 Feb 2025 09:19:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ti8tq-0001ld-EC; Wed, 12 Feb 2025 09:19:18 +0000
Received: by outflank-mailman (input) for mailman id 886228;
 Wed, 12 Feb 2025 09:19:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F151=VD=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1ti8tp-0001Ij-GU
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 09:19:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6dfc30cc-e922-11ef-b3ef-695165c68f79;
 Wed, 12 Feb 2025 10:19:15 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 552A713D5;
 Wed, 12 Feb 2025 01:19:36 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B5CE3F58B;
 Wed, 12 Feb 2025 01:19:14 -0800 (PST)
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
X-Inumbo-ID: 6dfc30cc-e922-11ef-b3ef-695165c68f79
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm: Move early mapping operations to new function
Date: Wed, 12 Feb 2025 09:19:00 +0000
Message-Id: <20250212091900.1515563-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250212091900.1515563-1-luca.fancellu@arm.com>
References: <20250212091900.1515563-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently start_xen() is performing some early operations using
the boot page tables that are configured during early asm boot,
before setting up the runtime page tables that might also use
the cache coloring feature.

On an MPU system the cache coloring feature is not applicable,
also before using any early mapping function, the MPU data
structure needs to be initialised.
Another thing that is redundant is mapping the DTB twice, since
cache coloring is not applicable.

Because of the above reason, isolate the early mapping code into
a function called 'setup_early_mappings' that is defined under
the MMU module, an MPU system will need to implement such function
to perform the operation needed for early mapping that will be
in part different from an MMU system.

Moved the 'HAS_LLC_COLORING' Kconfig symbol into the MMU one,
selected only when system is Arm64 and not numa.
Now setup_pagetables() is called only in the mmu/setup.c module,
limit its visibility and remove it from mm.h header.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/Kconfig          |  2 +-
 xen/arch/arm/include/asm/mm.h |  4 ++--
 xen/arch/arm/mmu/setup.c      | 35 ++++++++++++++++++++++++++++++++++-
 xen/arch/arm/setup.c          | 30 +-----------------------------
 4 files changed, 38 insertions(+), 33 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index a26d3e11827c..91f838a32bc6 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -8,7 +8,6 @@ config ARM_64
 	depends on !ARM_32
 	select 64BIT
 	select HAS_FAST_MULTIPLY
-	select HAS_LLC_COLORING if !NUMA
 
 config ARM
 	def_bool y
@@ -76,6 +75,7 @@ choice
 
 config MMU
 	bool "MMU"
+	select HAS_LLC_COLORING if !NUMA && ARM64
 	select HAS_PMAP
 	select HAS_VMAP
 	select HAS_PASSTHROUGH
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index a0d8e5afe977..d4b6daa85aa0 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -203,8 +203,8 @@ extern unsigned long frametable_base_pdx;
 
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
-/* Boot-time pagetable setup */
-extern void setup_pagetables(void);
+/* Setup early mappings */
+extern void setup_early_mappings(paddr_t fdt_paddr);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index 30afe9778194..f7862d0bafd3 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -354,7 +354,7 @@ static void __init create_llc_coloring_mappings(void)
  * Boot-time pagetable setup.
  * Changes here may need matching changes in head.S
  */
-void __init setup_pagetables(void)
+static void __init setup_pagetables(void)
 {
     uint64_t ttbr;
     lpae_t pte, *p;
@@ -469,6 +469,39 @@ void __init setup_pagetables(void)
     xen_pt_enforce_wnx();
 }
 
+void __init setup_early_mappings(paddr_t fdt_paddr)
+{
+    const char *cmdline;
+    struct bootmodule *xen_bootmodule;
+
+    device_tree_flattened = early_fdt_map(fdt_paddr);
+    if ( !device_tree_flattened )
+        panic("Invalid device tree blob at physical address %#"PRIpaddr".\n"
+              "The DTB must be 8-byte aligned and must not exceed 2 MB in size.\n\n"
+              "Please check your bootloader.\n",
+              fdt_paddr);
+
+    /* Register Xen's load address as a boot module. */
+    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
+                             virt_to_maddr(_start),
+                             (paddr_t)(uintptr_t)(_end - _start), false);
+    BUG_ON(!xen_bootmodule);
+
+    cmdline = boot_fdt_cmdline(device_tree_flattened);
+    printk("Command line: %s\n", cmdline);
+    cmdline_parse(cmdline);
+
+    llc_coloring_init();
+
+    /*
+     * Page tables must be setup after LLC coloring initialization because
+     * coloring info are required in order to create colored mappings
+     */
+    setup_pagetables();
+    /* Device-tree was mapped in boot page tables, remap it in the new tables */
+    device_tree_flattened = early_fdt_map(fdt_paddr);
+}
+
 void *__init arch_vmap_virt_end(void)
 {
     return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index c1f2d1b89d43..b2f34ba2a873 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -12,7 +12,6 @@
 #include <xen/device_tree.h>
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
-#include <xen/llc-coloring.h>
 #include <xen/types.h>
 #include <xen/string.h>
 #include <xen/serial.h>
@@ -300,8 +299,6 @@ size_t __read_mostly dcache_line_bytes;
 void asmlinkage __init start_xen(unsigned long fdt_paddr)
 {
     size_t fdt_size;
-    const char *cmdline;
-    struct bootmodule *xen_bootmodule;
     struct domain *d;
     int rc, i;
 
@@ -315,35 +312,10 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
 
     smp_clear_cpu_maps();
 
-    device_tree_flattened = early_fdt_map(fdt_paddr);
-    if ( !device_tree_flattened )
-        panic("Invalid device tree blob at physical address %#lx.\n"
-              "The DTB must be 8-byte aligned and must not exceed 2 MB in size.\n\n"
-              "Please check your bootloader.\n",
-              fdt_paddr);
-
-    /* Register Xen's load address as a boot module. */
-    xen_bootmodule = add_boot_module(BOOTMOD_XEN,
-                             virt_to_maddr(_start),
-                             (paddr_t)(uintptr_t)(_end - _start), false);
-    BUG_ON(!xen_bootmodule);
+    setup_early_mappings(fdt_paddr);
 
     fdt_size = boot_fdt_info(device_tree_flattened, fdt_paddr);
 
-    cmdline = boot_fdt_cmdline(device_tree_flattened);
-    printk("Command line: %s\n", cmdline);
-    cmdline_parse(cmdline);
-
-    llc_coloring_init();
-
-    /*
-     * Page tables must be setup after LLC coloring initialization because
-     * coloring info are required in order to create colored mappings
-     */
-    setup_pagetables();
-    /* Device-tree was mapped in boot page tables, remap it in the new tables */
-    device_tree_flattened = early_fdt_map(fdt_paddr);
-
     setup_mm();
 
     vm_init();
-- 
2.34.1


