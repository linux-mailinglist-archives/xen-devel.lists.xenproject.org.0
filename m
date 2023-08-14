Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E1577B069
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 06:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583058.913100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9f-00035s-FJ; Mon, 14 Aug 2023 04:26:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583058.913100; Mon, 14 Aug 2023 04:26:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVP9f-00033j-CE; Mon, 14 Aug 2023 04:26:11 +0000
Received: by outflank-mailman (input) for mailman id 583058;
 Mon, 14 Aug 2023 04:26:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8M3t=D7=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qVP9d-0002UD-LO
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 04:26:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b05ad455-3a5a-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 06:26:07 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 848DD2F4;
 Sun, 13 Aug 2023 21:26:49 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B8E2B3F64C;
 Sun, 13 Aug 2023 21:26:03 -0700 (PDT)
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
X-Inumbo-ID: b05ad455-3a5a-11ee-8613-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Henry Wang <Henry.Wang@arm.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 03/13] xen/arm64: prepare for moving MMU related code from head.S
Date: Mon, 14 Aug 2023 12:25:26 +0800
Message-Id: <20230814042536.878720-4-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230814042536.878720-1-Henry.Wang@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

We want to reuse head.S for MPU systems, but there are some
code are implemented for MMU systems only. We will move such
code to another MMU specific file. But before that we will
do some indentations fix in this patch to make them be easier
for reviewing:
1. Fix the indentations and incorrect style of code comments.
2. Fix the indentations for .text.header section.
3. Rename puts() to asm_puts() for global export

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v5:
- Use "must" in the code comment for asm_puts() to note that
  this function must be called from assembly.
- Add the Reviewed-by tags from Ayan and Julien.
v4:
- Rebase to pick the adr -> adr_l change in PRINT(_s).
- Correct in-code comment for asm_puts() and add a note to
  mention that asm_puts() should be only called from assembly.
- Drop redundant puts (now asm_puts) under CONFIG_EARLY_PRINTK.
v3:
-  fix commit message
-  Rename puts() to asm_puts() for global export
v2:
-  New patch.
---
 xen/arch/arm/arm64/head.S | 46 ++++++++++++++++++++-------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 2bc2a03565..f25a41d36c 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -94,7 +94,7 @@
 #define PRINT(_s)          \
         mov   x3, lr ;     \
         adr_l x0, 98f ;    \
-        bl    puts    ;    \
+        bl    asm_puts ;   \
         mov   lr, x3 ;     \
         RODATA_STR(98, _s)
 
@@ -148,21 +148,21 @@
         isb
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
-         * 4K-aligned address.
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
+ * 4K-aligned address.
+ */
 
 GLOBAL(start)
         /*
@@ -547,7 +547,7 @@ ENDPROC(cpu_init)
  * Macro to create a mapping entry in \tbl to \phys. Only mapping in 3rd
  * level table (i.e page granularity) is supported.
  *
- * ptbl:     table symbol where the entry will be created
+ * ptbl:    table symbol where the entry will be created
  * virt:    virtual address
  * phys:    physical address (should be page aligned)
  * tmp1:    scratch register
@@ -965,19 +965,22 @@ init_uart:
         ret
 ENDPROC(init_uart)
 
-/* Print early debug messages.
+/*
+ * Print early debug messages.
+ * Note: This function must be called from assembly.
  * x0: Nul-terminated string to print.
  * x23: Early UART base address
- * Clobbers x0-x1 */
-puts:
+ * Clobbers x0-x1
+ */
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
@@ -1007,7 +1010,6 @@ hex:    .ascii "0123456789abcdef"
 
 ENTRY(early_puts)
 init_uart:
-puts:
 putn:   ret
 
 #endif /* !CONFIG_EARLY_PRINTK */
-- 
2.25.1


