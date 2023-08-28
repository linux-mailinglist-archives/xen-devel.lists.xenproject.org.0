Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4778A400
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 03:40:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591260.923665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaREj-0006x2-Qq; Mon, 28 Aug 2023 01:40:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591260.923665; Mon, 28 Aug 2023 01:40:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaREj-0006uG-NG; Mon, 28 Aug 2023 01:40:13 +0000
Received: by outflank-mailman (input) for mailman id 591260;
 Mon, 28 Aug 2023 01:40:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwb3=EN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qaR7u-0000i9-28
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 01:33:10 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d7d3a2b0-4542-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 03:33:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DACA2F4;
 Sun, 27 Aug 2023 18:33:48 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 84D293F740;
 Sun, 27 Aug 2023 18:33:05 -0700 (PDT)
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
X-Inumbo-ID: d7d3a2b0-4542-11ee-8783-cb3800f73035
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S
Date: Mon, 28 Aug 2023 09:32:19 +0800
Message-Id: <20230828013224.669433-9-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828013224.669433-1-Henry.Wang@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently mmu_init_secondary_cpu() only enforces the page table
should not contain mapping that are both Writable and eXecutables
after boot. To ease the arch/arm/mm.c split work, fold this function
to head.S.

Introduce assembly macro pt_enforce_wxn for both arm32 and arm64.
For arm64, the macro is called at the end of enable_secondary_cpu_mm().
For arm32, the macro is called before secondary CPUs jumping into
the C world.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v6:
- New patch.
---
 xen/arch/arm/arm32/head.S     | 20 ++++++++++++++++++++
 xen/arch/arm/arm64/mmu/head.S | 21 +++++++++++++++++++++
 xen/arch/arm/include/asm/mm.h |  2 --
 xen/arch/arm/mm.c             |  6 ------
 xen/arch/arm/smpboot.c        |  2 --
 5 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 33b038e7e0..39218cf15f 100644
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
@@ -254,6 +273,7 @@ secondary_switched:
         /* Use a virtual address to access the UART. */
         mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
 #endif
+        pt_enforce_wxn r0
         PRINT("- Ready -\r\n")
         /* Jump to C world */
         mov_w r2, start_secondary
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index a5271e3880..25028bdf07 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -31,6 +31,25 @@
         isb
 .endm
 
+/*
+ * Enforce Xen page-tables do not contain mapping that are both
+ * Writable and eXecutables.
+ *
+ * This should be called on each secondary CPU.
+ */
+.macro pt_enforce_wxn tmp
+       mrs   \tmp, SCTLR_EL2
+       orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
+       dsb   sy
+       msr   SCTLR_EL2, \tmp
+       /*
+        * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
+        * before flushing the TLBs.
+        */
+       isb
+       flush_xen_tlb_local
+.endm
+
 /*
  * Macro to find the slot number at a given page-table level
  *
@@ -308,6 +327,8 @@ ENTRY(enable_secondary_cpu_mm)
         bl    enable_mmu
         mov   lr, x5
 
+        pt_enforce_wxn x0
+
         /* Return to the virtual address requested by the caller. */
         ret
 ENDPROC(enable_secondary_cpu_mm)
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index bf2fe26f9e..a66aa219b1 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -216,8 +216,6 @@ extern void remove_early_mappings(void);
 /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
  * new page table */
 extern int init_secondary_pagetables(int cpu);
-/* Switch secondary CPUS to its own pagetables and finalise MMU setup */
-extern void mmu_init_secondary_cpu(void);
 /*
  * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
  * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index f3ef0da0e3..3ee74542ba 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -322,12 +322,6 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
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
index e107b86b7b..ade2c77cf9 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -359,8 +359,6 @@ void start_secondary(void)
      */
     update_system_features(&current_cpu_data);
 
-    mmu_init_secondary_cpu();
-
     gic_init_secondary_cpu();
 
     set_current(idle_vcpu[cpuid]);
-- 
2.25.1


