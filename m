Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE157EE34D
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 15:51:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634379.989805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3dhw-0002LR-0P; Thu, 16 Nov 2023 14:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634379.989805; Thu, 16 Nov 2023 14:51:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3dhv-0002Iq-Tc; Thu, 16 Nov 2023 14:51:03 +0000
Received: by outflank-mailman (input) for mailman id 634379;
 Thu, 16 Nov 2023 14:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xmdr=G5=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r3dhu-0001sC-7w
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 14:51:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 8e7a90f2-848f-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 15:51:00 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF82C1595;
 Thu, 16 Nov 2023 06:51:45 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23E423F73F;
 Thu, 16 Nov 2023 06:50:55 -0800 (PST)
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
X-Inumbo-ID: 8e7a90f2-848f-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 3/8] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Date: Thu, 16 Nov 2023 22:50:27 +0800
Message-Id: <20231116145032.1651305-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116145032.1651305-1-Henry.Wang@arm.com>
References: <20231116145032.1651305-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mmu_init_secondary_cpu() only enforces the page table
should not contain mapping that are both Writable and eXecutables
after boot. To ease the arch/arm/mm.c split work, fold this function
to head.S.

For arm32, the WXN bit cannot be set early because at the point when
the MMU is enabled, the page-tables may still contain mapping which
are writable and executable. Therefore, introduce an assembly macro
pt_enforce_wxn. The macro is called before secondary CPUs jumping
into the C world.

For arm64, set the SCTLR_Axx_ELx_WXN flag right when the MMU is
enabled. This would avoid the extra TLB flush and SCTLR dance.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Co-authored-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v9:
- Move pt_enforce_wxn() for arm32 up a few lines.
- Add commit message explaining why WXN cannot be set early for arm32.
- Correct in-code comment for enable_mmu().
- Add Julien's Reviewed-by tag.
v8:
- Change the setting of SCTLR_Axx_ELx_WXN for arm64 to set the
  flag right when the MMU is enabled.
v7:
- No change.
v6:
- New patch.
---
 xen/arch/arm/arm32/head.S     | 20 ++++++++++++++++++++
 xen/arch/arm/arm64/mmu/head.S | 19 ++++++++++++-------
 xen/arch/arm/include/asm/mm.h |  2 --
 xen/arch/arm/mm.c             |  6 ------
 xen/arch/arm/smpboot.c        |  2 --
 5 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index bbbdf7daf8..2c235fb34c 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -83,6 +83,25 @@
         isb
 .endm
 
+/*
+ * Enforce Xen page-tables do not contain mapping that are both
+ * Writable and eXecutables.
+ *
+ * This should be called on each secondary CPU.
+ */
+.macro pt_enforce_wxn tmp
+        mrc   CP32(\tmp, HSCTLR)
+        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
+        dsb
+        mcr   CP32(\tmp, HSCTLR)
+        /*
+         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
+         * before flushing the TLBs.
+         */
+        isb
+        flush_xen_tlb_local \tmp
+.endm
+
 /*
  * Common register usage in this file:
  *   r0  -
@@ -249,6 +268,7 @@ secondary_switched:
         dsb
         isb
         flush_xen_tlb_local r0
+        pt_enforce_wxn r0
 
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 412b28e649..10774f30e4 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -269,11 +269,13 @@ ENDPROC(create_page_tables)
  *
  * Inputs:
  *   x0 : Physical address of the page tables.
+ *   x1 : Extra flags of the SCTLR.
  *
- * Clobbers x0 - x4
+ * Clobbers x0 - x5
  */
 enable_mmu:
         mov   x4, x0
+        mov   x5, x1
         PRINT("- Turning on paging -\r\n")
 
         /*
@@ -289,6 +291,7 @@ enable_mmu:
         mrs   x0, SCTLR_EL2
         orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
         orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
+        orr   x0, x0, x5                /* Enable extra flags */
         dsb   sy                     /* Flush PTE writes and finish reads */
         msr   SCTLR_EL2, x0          /* now paging is enabled */
         isb                          /* Now, flush the icache */
@@ -303,16 +306,17 @@ ENDPROC(enable_mmu)
  * Inputs:
  *   lr : Virtual address to return to.
  *
- * Clobbers x0 - x5
+ * Clobbers x0 - x6
  */
 ENTRY(enable_secondary_cpu_mm)
-        mov   x5, lr
+        mov   x6, lr
 
         load_paddr x0, init_ttbr
         ldr   x0, [x0]
 
+        mov   x1, #SCTLR_Axx_ELx_WXN        /* Enable WxN from the start */
         bl    enable_mmu
-        mov   lr, x5
+        mov   lr, x6
 
         /* Return to the virtual address requested by the caller. */
         ret
@@ -326,14 +330,15 @@ ENDPROC(enable_secondary_cpu_mm)
  * Inputs:
  *   lr : Virtual address to return to.
  *
- * Clobbers x0 - x5
+ * Clobbers x0 - x6
  */
 ENTRY(enable_boot_cpu_mm)
-        mov   x5, lr
+        mov   x6, lr
 
         bl    create_page_tables
         load_paddr x0, boot_pgtable
 
+        mov   x1, #0        /* No extra SCTLR flags */
         bl    enable_mmu
 
         /*
@@ -343,7 +348,7 @@ ENTRY(enable_boot_cpu_mm)
         ldr   x0, =1f
         br    x0
 1:
-        mov   lr, x5
+        mov   lr, x6
         /*
          * The 1:1 map may clash with other parts of the Xen virtual memory
          * layout. As it is not used anymore, remove it completely to
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index d25e59f828..163d22ecd3 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -214,8 +214,6 @@ extern void remove_early_mappings(void);
 /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
  * new page table */
 extern int init_secondary_pagetables(int cpu);
-/* Switch secondary CPUS to its own pagetables and finalise MMU setup */
-extern void mmu_init_secondary_cpu(void);
 /*
  * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
  * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index b7eb3a6e08..923a90925c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -326,12 +326,6 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
 #endif
 }
 
-/* MMU setup for secondary CPUS (which already have paging enabled) */
-void mmu_init_secondary_cpu(void)
-{
-    xen_pt_enforce_wnx();
-}
-
 #ifdef CONFIG_ARM_32
 /*
  * Set up the direct-mapped xenheap:
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 5533aed455..1cf6e50a85 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -361,8 +361,6 @@ void start_secondary(void)
      */
     update_system_features(&current_cpu_data);
 
-    mmu_init_secondary_cpu();
-
     gic_init_secondary_cpu();
 
     set_current(idle_vcpu[cpuid]);
-- 
2.25.1


