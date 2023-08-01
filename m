Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4476A795
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 05:45:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573552.898365 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgJN-0007AN-En; Tue, 01 Aug 2023 03:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573552.898365; Tue, 01 Aug 2023 03:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgJN-000777-AU; Tue, 01 Aug 2023 03:44:41 +0000
Received: by outflank-mailman (input) for mailman id 573552;
 Tue, 01 Aug 2023 03:44:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUf/=DS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qQgJL-00076X-N7
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 03:44:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id bb877502-301d-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 05:44:36 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3F5F7D75;
 Mon, 31 Jul 2023 20:45:18 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E50013F59C;
 Mon, 31 Jul 2023 20:44:31 -0700 (PDT)
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
X-Inumbo-ID: bb877502-301d-11ee-8613-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v4 01/13] xen/arm64: head.S: Introduce enable_{boot,secondary}_cpu_mm
Date: Tue,  1 Aug 2023 11:44:07 +0800
Message-Id: <20230801034419.2047541-2-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801034419.2047541-1-Henry.Wang@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
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
 xen/arch/arm/arm64/head.S | 89 ++++++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 31cdb54d74..2af9f974d5 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -313,21 +313,11 @@ real_start_efi:
 
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
@@ -372,13 +362,10 @@ GLOBAL(init_secondary)
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
@@ -737,6 +724,70 @@ enable_mmu:
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
+        /* return to secondary_switched */
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
+        mov   lr, x5
+
+        /*
+         * The MMU is turned on and we are in the 1:1 mapping. Switch
+         * to the runtime mapping.
+         */
+        ldr   x0, =1f
+        br    x0
+1:
+        /*
+         * The 1:1 map may clash with other parts of the Xen virtual memory
+         * layout. As it is not used anymore, remove it completely to
+         * avoid having to worry about replacing existing mapping
+         * afterwards. Function will return to primary_switched.
+         */
+        b     remove_identity_mapping
+
+        /*
+         * Below is supposed to be unreachable code, as "ret" in
+         * remove_identity_mapping will use the return address in LR in advance.
+         */
+        b     fail
+ENDPROC(enable_boot_cpu_mm)
+
 /*
  * Remove the 1:1 map from the page-tables. It is not easy to keep track
  * where the 1:1 map was mapped, so we will look for the top-level entry
-- 
2.25.1


