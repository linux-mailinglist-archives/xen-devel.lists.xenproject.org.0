Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC48B73D65A
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:35:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554967.866484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0n-0001Le-IK; Mon, 26 Jun 2023 03:35:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554967.866484; Mon, 26 Jun 2023 03:35:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd0n-0001Fx-BD; Mon, 26 Jun 2023 03:35:33 +0000
Received: by outflank-mailman (input) for mailman id 554967;
 Mon, 26 Jun 2023 03:35:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0k-0000HH-Rx
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7eab5472-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:35:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 16C011FB;
 Sun, 25 Jun 2023 20:36:12 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AD90A3F64C;
 Sun, 25 Jun 2023 20:35:25 -0700 (PDT)
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
X-Inumbo-ID: 7eab5472-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 07/52] xen/arm64: prepare for moving MMU related code from head.S
Date: Mon, 26 Jun 2023 11:33:58 +0800
Message-Id: <20230626033443.2943270-8-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

We want to reuse head.S for MPU systems, but there are some
code are implemented for MMU systems only. We will move such
code to another MMU specific file. But before that we will
do some indentations fix in this patch to make them be easier
for reviewing:
1. Fix the indentations of code comments.
2. Fix the indentations for .text.header section.
3. Rename puts() to asm_puts() for global export

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
1. New patch.
---
v3:
1. fix commit message
2. Rename puts() to asm_puts() for global export
---
 xen/arch/arm/arm64/head.S | 42 +++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 4dfbe0bc6f..66347eedcc 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -94,7 +94,7 @@
 #define PRINT(_s)          \
         mov   x3, lr ;     \
         adr   x0, 98f ;    \
-        bl    puts    ;    \
+        bl    asm_puts ;   \
         mov   lr, x3 ;     \
         RODATA_STR(98, _s)
 
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
@@ -520,7 +520,7 @@ ENDPROC(cpu_init)
  * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
  * level table (i.e page granularity) is supported.
  *
- * ptbl:     table symbol where the entry will be created
+ * ptbl:    table symbol where the entry will be created
  * virt:    virtual address
  * phys:    physical address (should be page aligned)
  * tmp1:    scratch register
@@ -928,15 +928,15 @@ ENDPROC(init_uart)
  * x0: Nul-terminated string to print.
  * x23: Early UART base address
  * Clobbers x0-x1 */
-puts:
+ENTRY(asm_puts)
         early_uart_ready x23, 1
         ldrb  w1, [x0], #1           /* Load next char */
         cbz   w1, 1f                 /* Exit on nul */
         early_uart_transmit x23, w1
-        b     puts
+        b     asm_puts
 1:
         ret
-ENDPROC(puts)
+ENDPROC(asm_puts)
 
 /*
  * Print a 64-bit number in hex.
@@ -966,7 +966,7 @@ hex:    .ascii "0123456789abcdef"
 
 ENTRY(early_puts)
 init_uart:
-puts:
+asm_puts:
 putn:   ret
 
 #endif /* !CONFIG_EARLY_PRINTK */
-- 
2.25.1


