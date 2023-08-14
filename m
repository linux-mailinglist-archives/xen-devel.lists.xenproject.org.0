Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5477B064
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 06:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583056.913080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9Z-0002X2-Ug; Mon, 14 Aug 2023 04:26:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583056.913080; Mon, 14 Aug 2023 04:26:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9Z-0002VH-Qy; Mon, 14 Aug 2023 04:26:05 +0000
Received: by outflank-mailman (input) for mailman id 583056;
 Mon, 14 Aug 2023 04:26:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVP9Y-0002UD-6L
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 04:26:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ab42aa46-3a5a-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 06:25:59 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CC331063;
 Sun, 13 Aug 2023 21:26:41 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C85653F64C;
 Sun, 13 Aug 2023 21:25:55 -0700 (PDT)
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
X-Inumbo-ID: ab42aa46-3a5a-11ee-8613-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v5 01/13] xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm()
Date: Mon, 14 Aug 2023 12:25:24 +0800
Message-Id: <20230814042536.878720-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814042536.878720-1-Henry.Wang@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

At the moment, on MMU system, enable_mmu() will return to an
address in the 1:1 mapping, then each path is responsible to
switch to virtual runtime mapping. Then remove_identity_mapping()
is called on the boot CPU to remove all 1:1 mapping.

Since remove_identity_mapping() is not necessary on Non-MMU system,
and we also avoid creating empty function for Non-MMU system, trying
to keep only one codeflow in arm64/head.S, we move path switch and
remove_identity_mapping() in enable_mmu() on MMU system.

As the remove_identity_mapping should only be called for the boot
CPU only, so we introduce enable_boot_cpu_mm() for boot CPU and
enable_secondary_cpu_mm() for secondary CPUs in this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v5:
- Add missing "()" in title.
- Use more generic comment in enable_{boot,secondary}_cpu_mm() to
  mention function will return to the vaddr requested by the caller.
- Move 'mov lr, x5' closer to 'b remove_identity_mapping'.
- Drop the 'b fail' for unreachable code in enable_boot_cpu_mm().
v4:
- Clarify remove_identity_mapping() is called on boot CPU and keep
  the function/proc format consistent in commit msg.
- Drop inaccurate (due to the refactor) in-code comment.
- Rename enable_{boot,runtime}_mmu to enable_{boot,secondary}_cpu_mm.
- Reword the in-code comment on top of enable_{boot,secondary}_cpu_mm.
- Call "fail" for unreachable code.
v3:
- new patch
---
 xen/arch/arm/arm64/head.S | 83 ++++++++++++++++++++++++++++++---------
 1 file changed, 64 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 8bca9afa27..2bc2a03565 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -325,21 +325,11 @@ real_start_efi:
 
         bl    check_cpu_mode
         bl    cpu_init
-        bl    create_page_tables
-        load_paddr x0, boot_pgtable
-        bl    enable_mmu
 
-        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   x0, =primary_switched
-        br    x0
+        ldr   lr, =primary_switched
+        b     enable_boot_cpu_mm
+
 primary_switched:
-        /*
-         * The 1:1 map may clash with other parts of the Xen virtual memory
-         * layout. As it is not used anymore, remove it completely to
-         * avoid having to worry about replacing existing mapping
-         * afterwards.
-         */
-        bl    remove_identity_mapping
         bl    setup_fixmap
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
@@ -384,13 +374,10 @@ GLOBAL(init_secondary)
 #endif
         bl    check_cpu_mode
         bl    cpu_init
-        load_paddr x0, init_ttbr
-        ldr   x0, [x0]
-        bl    enable_mmu
 
-        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   x0, =secondary_switched
-        br    x0
+        ldr   lr, =secondary_switched
+        b     enable_secondary_cpu_mm
+
 secondary_switched:
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
@@ -748,6 +735,64 @@ enable_mmu:
         ret
 ENDPROC(enable_mmu)
 
+/*
+ * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers x0 - x5
+ */
+enable_secondary_cpu_mm:
+        mov   x5, lr
+
+        load_paddr x0, init_ttbr
+        ldr   x0, [x0]
+
+        bl    enable_mmu
+        mov   lr, x5
+
+        /* Return to the virtual address requested by the caller. */
+        ret
+ENDPROC(enable_secondary_cpu_mm)
+
+/*
+ * Enable mm (turn on the data cache and the MMU) for the boot CPU.
+ * The function will return to the virtual address provided in LR (e.g. the
+ * runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to.
+ *
+ * Clobbers x0 - x5
+ */
+enable_boot_cpu_mm:
+        mov   x5, lr
+
+        bl    create_page_tables
+        load_paddr x0, boot_pgtable
+
+        bl    enable_mmu
+
+        /*
+         * The MMU is turned on and we are in the 1:1 mapping. Switch
+         * to the runtime mapping.
+         */
+        ldr   x0, =1f
+        br    x0
+1:
+        mov   lr, x5
+        /*
+         * The 1:1 map may clash with other parts of the Xen virtual memory
+         * layout. As it is not used anymore, remove it completely to avoid
+         * having to worry about replacing existing mapping afterwards.
+         * Function will return to the virtual address requested by the caller.
+         */
+        b     remove_identity_mapping
+ENDPROC(enable_boot_cpu_mm)
+
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
  * where the 1:1 map was mapped, so we will look for the top-level entry
-- 
2.25.1


