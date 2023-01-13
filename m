Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCBCB668B7F
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476606.738991 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCja-0003bc-6q; Fri, 13 Jan 2023 05:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476606.738991; Fri, 13 Jan 2023 05:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjZ-0003Qh-UT; Fri, 13 Jan 2023 05:36:09 +0000
Received: by outflank-mailman (input) for mailman id 476606;
 Fri, 13 Jan 2023 05:36:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCe1-0005sJ-HA
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:25 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5ee55659-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:30:20 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 48308FEC;
 Thu, 12 Jan 2023 21:31:02 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8A0113F587;
 Thu, 12 Jan 2023 21:30:17 -0800 (PST)
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
X-Inumbo-ID: 5ee55659-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 14/40] xen/arm64: head: Jump to the runtime mapping in enable_mm()
Date: Fri, 13 Jan 2023 13:28:47 +0800
Message-Id: <20230113052914.3845596-15-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At the moment, on MMU system, enable_mm() will return to an address in
the 1:1 mapping, then each path is responsible to switch to virtual runtime
mapping. Then remove_identity_mapping() is called to remove all 1:1 mapping.

Since remove_identity_mapping() is not necessary on MPU system, and we also
avoid creating empty function for MPU system, trying to keep only one codeflow
in arm64/head.S, we move path switch and remove_identity_mapping() in
enable_mm() on MMU system.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/arm64/head.S     | 28 +++++++++++++---------------
 xen/arch/arm/arm64/head_mmu.S | 33 ++++++++++++++++++++++++++++++---
 2 files changed, 43 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index a92883319d..6358305f03 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -258,20 +258,15 @@ real_start_efi:
          * and memory regions for MPU systems.
          */
         bl    prepare_early_mappings
+        /*
+         * Address in the runtime mapping to jump to after the
+         * MMU/MPU is enabled
+         */
+        ldr   lr, =primary_switched
         /* Turn on MMU or MPU */
-        bl    enable_mm
+        b    enable_mm
 
-        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   x0, =primary_switched
-        br    x0
 primary_switched:
-        /*
-         * The 1:1 map may clash with other parts of the Xen virtual memory
-         * layout. As it is not used anymore, remove it completely to
-         * avoid having to worry about replacing existing mapping
-         * afterwards.
-         */
-        bl    remove_identity_mapping
         bl    setup_early_uart
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
@@ -317,11 +312,14 @@ GLOBAL(init_secondary)
         bl    check_cpu_mode
         bl    cpu_init
         bl    prepare_early_mappings
-        bl    enable_mm
 
-        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   x0, =secondary_switched
-        br    x0
+        /*
+         * Address in the runtime mapping to jump to after the
+         * MMU/MPU is enabled
+         */
+        ldr   lr, =secondary_switched
+        b    enable_mm
+
 secondary_switched:
         /*
          * Non-boot CPUs need to move on to the proper pagetables, which were
diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
index a19b7c873d..c9e83bbe2d 100644
--- a/xen/arch/arm/arm64/head_mmu.S
+++ b/xen/arch/arm/arm64/head_mmu.S
@@ -211,9 +211,11 @@ virtphys_clash:
 ENDPROC(prepare_early_mappings)
 
 /*
- * Turn on the Data Cache and the MMU. The function will return on the 1:1
- * mapping. In other word, the caller is responsible to switch to the runtime
- * mapping.
+ * Turn on the Data Cache and the MMU. The function will return
+ * to the virtual address provided in LR (e.g. the runtime mapping).
+ *
+ * Inputs:
+ * lr(x30): Virtual address to return to
  *
  * Clobbers x0 - x3
  */
@@ -238,6 +240,31 @@ ENTRY(enable_mm)
         dsb   sy                     /* Flush PTE writes and finish reads */
         msr   SCTLR_EL2, x0          /* now paging is enabled */
         isb                          /* Now, flush the icache */
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
+         * afterwards.
+         *
+         * On return this will jump to the virtual address requested by
+         * the caller
+         */
+        b     remove_identity_mapping
+
+        /*
+         * Here might not be reached, as "ret" in remove_identity_mapping
+         * will use the return address in LR in advance. But keep ret here
+         * might be more safe if "ret" in remove_identity_mapping is removed
+         * in future.
+         */
         ret
 ENDPROC(enable_mm)
 
-- 
2.25.1


