Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5938C78A3ED
	for <lists+xen-devel@lfdr.de>; Mon, 28 Aug 2023 03:33:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.591212.923626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaR7j-0002Eq-Qa; Mon, 28 Aug 2023 01:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 591212.923626; Mon, 28 Aug 2023 01:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qaR7j-0002Co-KK; Mon, 28 Aug 2023 01:32:59 +0000
Received: by outflank-mailman (input) for mailman id 591212;
 Mon, 28 Aug 2023 01:32:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nwb3=EN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qaR7h-0000i9-W6
 for xen-devel@lists.xenproject.org; Mon, 28 Aug 2023 01:32:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d0d877ef-4542-11ee-8783-cb3800f73035;
 Mon, 28 Aug 2023 03:32:57 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C96362F4;
 Sun, 27 Aug 2023 18:33:36 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6D8F23F740;
 Sun, 27 Aug 2023 18:32:53 -0700 (PDT)
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
X-Inumbo-ID: d0d877ef-4542-11ee-8783-cb3800f73035
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 05/13] xen/arm64: Fold setup_fixmap() to create_page_tables()
Date: Mon, 28 Aug 2023 09:32:16 +0800
Message-Id: <20230828013224.669433-6-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230828013224.669433-1-Henry.Wang@arm.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original assembly setup_fixmap() is actually doing two seperate
tasks, one is enabling the early UART when earlyprintk on, and the
other is to set up the fixmap (even when earlyprintk is off).

Per discussion in [1], since commit
9d267c049d92 ("xen/arm64: Rework the memory layout"), there is no
chance that the fixmap and the mapping of early UART will clash with
the 1:1 mapping. Therefore the mapping of both the fixmap and the
early UART can be moved to the end of create_pagetables().

[1] https://lore.kernel.org/xen-devel/78862bb8-fd7f-5a51-a7ae-3c5b5998ed80@xen.org/

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v6:
- Drop the "No functional change intended." sentence in commit msg.
- Add Julien's Reviewed-by tag.
v5:
- Refine the title and commit message.
- Drop the "not applied" in-code comment about the 1:1 mapping clash on
  top of create_page_tables().
- Drop the unnecessary dsb and isb from the original setup_fixmap().
v4:
- Rework "[v3,12/52] xen/mmu: extract early uart mapping from setup_fixmap"
---
 xen/arch/arm/arm64/head.S     |  1 -
 xen/arch/arm/arm64/mmu/head.S | 48 ++++++++---------------------------
 2 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 3c8a12eda7..4ad85dcf58 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -275,7 +275,6 @@ real_start_efi:
         b     enable_boot_cpu_mm
 
 primary_switched:
-        bl    setup_fixmap
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index d71fdc69a5..a5271e3880 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -126,11 +126,6 @@
  * Rebuild the boot pagetable's first-level entries. The structure
  * is described in mm.c.
  *
- * After the CPU enables paging it will add the fixmap mapping
- * to these page tables, however this may clash with the 1:1
- * mapping. So each CPU must rebuild the page tables here with
- * the 1:1 in place.
- *
  * Inputs:
  *   x19: paddr(start)
  *   x20: phys offset
@@ -243,6 +238,16 @@ link_from_second_id:
         create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
 link_from_third_id:
         create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
+
+#ifdef CONFIG_EARLY_PRINTK
+        /* Add UART to the fixmap table */
+        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
+        /* x23: Early UART base physical address */
+        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
+#endif
+        /* Map fixmap into boot_second */
+        ldr   x0, =FIXMAP_ADDR(0)
+        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
         ret
 
 virtphys_clash:
@@ -402,39 +407,6 @@ identity_mapping_removed:
         ret
 ENDPROC(remove_identity_mapping)
 
-/*
- * Map the UART in the fixmap (when earlyprintk is used) and hook the
- * fixmap table in the page tables.
- *
- * The fixmap cannot be mapped in create_page_tables because it may
- * clash with the 1:1 mapping.
- *
- * Inputs:
- *   x20: Physical offset
- *   x23: Early UART base physical address
- *
- * Clobbers x0 - x3
- */
-ENTRY(setup_fixmap)
-#ifdef CONFIG_EARLY_PRINTK
-        /* Add UART to the fixmap table */
-        ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
-        create_mapping_entry xen_fixmap, x0, x23, x1, x2, x3, type=PT_DEV_L3
-#endif
-        /* Map fixmap into boot_second */
-        ldr   x0, =FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
-        /* Ensure any page table updates made above have occurred. */
-        dsb   nshst
-        /*
-         * The fixmap area will be used soon after. So ensure no hardware
-         * translation happens before the dsb completes.
-         */
-        isb
-
-        ret
-ENDPROC(setup_fixmap)
-
 /* Fail-stop */
 fail:   PRINT("- Boot failed -\r\n")
 1:      wfe
-- 
2.25.1


