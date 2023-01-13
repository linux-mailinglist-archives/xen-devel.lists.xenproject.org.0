Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EA3668B5A
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476500.738746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdZ-00077Q-LQ; Fri, 13 Jan 2023 05:29:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476500.738746; Fri, 13 Jan 2023 05:29:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCdZ-00073n-GR; Fri, 13 Jan 2023 05:29:57 +0000
Received: by outflank-mailman (input) for mailman id 476500;
 Fri, 13 Jan 2023 05:29:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCdY-0005sJ-3x
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:29:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 4fa41a76-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:29:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97960FEC;
 Thu, 12 Jan 2023 21:30:36 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 631913F587;
 Thu, 12 Jan 2023 21:29:52 -0800 (PST)
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
X-Inumbo-ID: 4fa41a76-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 05/40] xen/arm64: prepare for moving MMU related code from head.S
Date: Fri, 13 Jan 2023 13:28:38 +0800
Message-Id: <20230113052914.3845596-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

We want to reuse head.S for MPU systems, but there are some
code implemented for MMU systems only. We will move such
code to another MMU specific file. But before that, we will
do some preparations in this patch to make them easier
for reviewing:
1. Fix the indentations of code comments.
2. Export some symbols that will be accessed out of file
   scope.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. New patch.
---
 xen/arch/arm/arm64/head.S | 40 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 93f9b0b9d5..b2214bc5e3 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -136,22 +136,22 @@
         add \xb, \xb, x20
 .endm
 
-        .section .text.header, "ax", %progbits
-        /*.aarch64*/
+.section .text.header, "ax", %progbits
+/*.aarch64*/
 
-        /*
-         * Kernel startup entry point.
-         * ---------------------------
-         *
-         * The requirements are:
-         *   MMU = off, D-cache = off, I-cache = on or off,
-         *   x0 = physical address to the FDT blob.
-         *
-         * This must be the very first address in the loaded image.
-         * It should be linked at XEN_VIRT_START, and loaded at any
-         * 4K-aligned address.  All of text+data+bss must fit in 2MB,
-         * or the initial pagetable code below will need adjustment.
-         */
+/*
+ * Kernel startup entry point.
+ * ---------------------------
+ *
+ * The requirements are:
+ *   MMU = off, D-cache = off, I-cache = on or off,
+ *   x0 = physical address to the FDT blob.
+ *
+ * This must be the very first address in the loaded image.
+ * It should be linked at XEN_VIRT_START, and loaded at any
+ * 4K-aligned address.  All of text+data+bss must fit in 2MB,
+ * or the initial pagetable code below will need adjustment.
+ */
 
 GLOBAL(start)
         /*
@@ -586,7 +586,7 @@ ENDPROC(cpu_init)
  *
  * Clobbers x0 - x4
  */
-create_page_tables:
+ENTRY(create_page_tables)
         /* Prepare the page-tables for mapping Xen */
         ldr   x0, =XEN_VIRT_START
         create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
@@ -680,7 +680,7 @@ ENDPROC(create_page_tables)
  *
  * Clobbers x0 - x3
  */
-enable_mmu:
+ENTRY(enable_mmu)
         PRINT("- Turning on paging -\r\n")
 
         /*
@@ -714,7 +714,7 @@ ENDPROC(enable_mmu)
  *
  * Clobbers x0 - x1
  */
-remove_identity_mapping:
+ENTRY(remove_identity_mapping)
         /*
          * Find the zeroeth slot used. Remove the entry from zeroeth
          * table if the slot is not XEN_ZEROETH_SLOT.
@@ -775,7 +775,7 @@ ENDPROC(remove_identity_mapping)
  *
  * Clobbers x0 - x3
  */
-setup_fixmap:
+ENTRY(setup_fixmap)
 #ifdef CONFIG_EARLY_PRINTK
         /* Add UART to the fixmap table */
         ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
@@ -871,7 +871,7 @@ ENDPROC(init_uart)
  * x0: Nul-terminated string to print.
  * x23: Early UART base address
  * Clobbers x0-x1 */
-puts:
+ENTRY(puts)
         early_uart_ready x23, 1
         ldrb  w1, [x0], #1           /* Load next char */
         cbz   w1, 1f                 /* Exit on nul */
-- 
2.25.1


