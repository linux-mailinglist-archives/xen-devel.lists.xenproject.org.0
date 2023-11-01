Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2647DE8E0
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 00:30:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626673.977151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKfJ-0004NR-FR; Wed, 01 Nov 2023 23:30:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626673.977151; Wed, 01 Nov 2023 23:30:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKfJ-0004LS-Bm; Wed, 01 Nov 2023 23:30:25 +0000
Received: by outflank-mailman (input) for mailman id 626673;
 Wed, 01 Nov 2023 23:30:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyKfI-00048C-Dn
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 23:30:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyKfI-0008Dy-4m; Wed, 01 Nov 2023 23:30:24 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyKfH-0007xN-PI; Wed, 01 Nov 2023 23:30:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=o8VZQgPoWYFxMhNL2bV9PEPd6/WmxcCBwhJiRXA0y5U=; b=dWLDcstJOp/FVw1s1VBEJSCLBY
	rSmScWiJNUdCspgFdGubUEFuoFxJMrOxorzuIvpKfE0l4qlPQ1uwcnDU2A8JlQrJWO+JIdge0N5Hm
	bHIPQZP9gqDK48hS1Fwvk3uAx0JTxaXpcEro7N/EaWH2rhL8IdLSVoZAZS//eV+6ckvA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com,
	michal.orzel@amd.com,
	ayan.kumar.halder@amd.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/2] xen/arm32: head: Improve logging in head.S
Date: Wed,  1 Nov 2023 23:30:11 +0000
Message-Id: <20231101233011.83098-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231101233011.83098-1-julien@xen.org>
References: <20231101233011.83098-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The sequence to enable the MMU on arm32 is quite complex as we may need
to jump to a temporary mapping to map Xen.

Recently, we had one bug in the logic (see f5a49eb7f8b3 ("xen/arm32:
head: Add mising isb in switch_to_runtime_mapping()") and it was
a pain to debug because there are no logging.

In order to improve the logging in the MMU switch we need to add
support for early printk while running on the identity mapping
and also on the temporary mapping.

For the identity mapping, we have only the first page of Xen mapped.
So all the strings should reside in the first page. For that purpose
a new macro PRINT_ID is introduced.

For the temporary mapping, the fixmap is already linked the temporary
area (and so does the UART). So we just need to update the register
storing the UART address (i.e. r11) to point to the UART temporary
mapping.

Take the opportunity to introduce mov_w_on_cond in order to
conditionally execute mov_w and avoid branches.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S               | 68 ++++++++++++++++++++-----
 xen/arch/arm/include/asm/asm_defns.h    |  6 ++-
 xen/arch/arm/include/asm/early_printk.h |  3 ++
 xen/arch/arm/include/asm/mmu/layout.h   |  4 ++
 xen/arch/arm/mm.c                       |  5 ++
 xen/arch/arm/xen.lds.S                  |  1 +
 6 files changed, 71 insertions(+), 16 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index fec2433e568f..bd61521a9dea 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -46,9 +46,13 @@
  * Move an immediate constant into a 32-bit register using movw/movt
  * instructions.
  */
+.macro mov_w_on_cond cond, reg, word
+        movw\cond  \reg, #:lower16:\word
+        movt\cond  \reg, #:upper16:\word
+.endm
+
 .macro mov_w reg, word
-        movw  \reg, #:lower16:\word
-        movt  \reg, #:upper16:\word
+        mov_w_on_cond al, \reg, \word
 .endm
 
 /*
@@ -104,16 +108,26 @@
  */
 #ifdef CONFIG_EARLY_PRINTK
 /*
- * Macro to print a string to the UART, if there is one.
+ * Macros to print a string to the UART, if there is one.
+ *
+ * There are multiple flavors:
+ *  - PRINT_SECT(section, string): The @string will be located in @section
+ *  - PRINT(): The string will be located in .rodata.str.
+ *  - PRINT_ID(): When Xen is running on the Identity Mapping, it is
+ *    only possible to have a limited amount of Xen. This will create
+ *    the string in .rodata.idmap which will always be mapped.
  *
  * Clobbers r0 - r3
  */
-#define PRINT(_s)           \
-        mov   r3, lr       ;\
-        adr_l r0, 98f      ;\
-        bl    puts         ;\
-        mov   lr, r3       ;\
-        RODATA_STR(98, _s)
+#define PRINT_SECT(section, string)         \
+        mov   r3, lr                       ;\
+        adr_l r0, 98f                      ;\
+        bl    puts                         ;\
+        mov   lr, r3                       ;\
+        RODATA_SECT(section, 98, string)
+
+#define PRINT(string) PRINT_SECT(.rodata.str, string)
+#define PRINT_ID(string) PRINT_SECT(.rodata.idmap, string)
 
 /*
  * Macro to print the value of register \rb
@@ -129,6 +143,7 @@
 
 #else /* CONFIG_EARLY_PRINTK */
 #define PRINT(s)
+#define PRINT_ID(s)
 
 .macro print_reg rb
 .endm
@@ -183,11 +198,6 @@ past_zImage:
         bl    check_cpu_mode
         bl    cpu_init
         bl    create_page_tables
-        /* Add the UART mapping if requested */
-#ifdef CONFIG_EARLY_PRINTK
-        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
-        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
-#endif
 
         /* Address in the runtime mapping to jump to after the MMU is enabled */
         mov_w lr, primary_switched
@@ -593,6 +603,21 @@ enable_mmu:
         mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
         isb                          /* Now, flush the icache */
 
+        /*
+         * At this stage, the UART address will depend on whether the
+         * temporary mapping was created or not.
+         *
+         * If it was, then the UART will be mapped in the temporary
+         * area. Otherwise, it will be mapped at runtime virtual
+         * mapping.
+         */
+#ifdef CONFIG_EARLY_PRINTK
+        teq   r12, #1               /* Was the temporary mapping created? */
+        mov_w_on_cond eq, r11, TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS
+        mov_w_on_cond ne, r11, EARLY_UART_VIRTUAL_ADDRESS
+#endif
+        PRINT_ID("- Paging turned on -\r\n")
+
         /*
          * The MMU is turned on and we are in the 1:1 mapping. Switch
          * to the runtime mapping.
@@ -643,12 +668,14 @@ switch_to_runtime_mapping:
         teq   r12, #0
         beq   ready_to_switch
 
+        PRINT_ID("- Switching to the temporary mapping -\r\n")
         /* We are still in the 1:1 mapping. Jump to the temporary Virtual address. */
         mov_w r0, 1f
         add   r0, r0, #XEN_TEMPORARY_OFFSET /* r0 := address in temporary mapping */
         mov   pc, r0
 
 1:
+        PRINT("- Running on the temporary mapping  -\r\n")
         /* Remove boot_second_id */
         mov   r2, #0
         mov   r3, #0
@@ -659,6 +686,8 @@ switch_to_runtime_mapping:
 
         flush_xen_tlb_local r0
 
+        PRINT("- 1:1 mapping removed -\r\n")
+
         /* Map boot_second into boot_pgtable */
         mov_w r0, XEN_VIRT_START
         create_table_entry boot_pgtable, boot_second, r0, 1
@@ -671,7 +700,10 @@ switch_to_runtime_mapping:
          */
         isb
 
+        PRINT("- Runtime mapping mapped -\r\n")
 ready_to_switch:
+        PRINT("- Jumping to runtime address -\r\n")
+
         mov   pc, lr
 ENDPROC(switch_to_runtime_mapping)
 
@@ -795,6 +827,14 @@ init_uart:
         early_uart_init r11, r1, r2
 #endif
         PRINT("- UART enabled -\r\n")
+
+        /*
+         * Add the UART mapping to the fixmap so the UART can be used
+         * as the MMU is on.
+         */
+        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
+        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
+
         mov   pc, lr
 ENDPROC(init_uart)
 
diff --git a/xen/arch/arm/include/asm/asm_defns.h b/xen/arch/arm/include/asm/asm_defns.h
index 29a9dbb002fa..ec803c0a370c 100644
--- a/xen/arch/arm/include/asm/asm_defns.h
+++ b/xen/arch/arm/include/asm/asm_defns.h
@@ -22,11 +22,13 @@
 # error "unknown ARM variant"
 #endif
 
-#define RODATA_STR(label, msg)                  \
-.pushsection .rodata.str, "aMS", %progbits, 1 ; \
+#define RODATA_SECT(section, label, msg)         \
+.pushsection section, "aMS", %progbits, 1 ;     \
 label:  .asciz msg;                             \
 .popsection
 
+#define RODATA_STR(label, msg) RODATA_SECT(.rodata.str, label, msg)
+
 #define ASM_INT(label, val)                 \
     .p2align 2;                             \
 label: .long (val);                         \
diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
index c5149b2976da..c1e84f8b0009 100644
--- a/xen/arch/arm/include/asm/early_printk.h
+++ b/xen/arch/arm/include/asm/early_printk.h
@@ -19,6 +19,9 @@
 #define EARLY_UART_VIRTUAL_ADDRESS \
     (FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
 
+#define TEMPORARY_EARLY_UART_VIRTUAL_ADDRESS \
+    (TEMPORARY_FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
+
 #endif /* !CONFIG_EARLY_PRINTK */
 
 #endif
diff --git a/xen/arch/arm/include/asm/mmu/layout.h b/xen/arch/arm/include/asm/mmu/layout.h
index da6be276ac5f..68855c4f3184 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -113,6 +113,10 @@
       (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
 
 #define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
+#define TEMPORARY_FIXMAP_VIRT_START TEMPORARY_AREA_ADDR(FIXMAP_VIRT_START)
+
+#define TEMPORARY_FIXMAP_ADDR(n)                    \
+     (TEMPORARY_FIXMAP_VIRT_START + (n) * PAGE_SIZE)
 
 #else /* ARM_64 */
 
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index c34cc94c907a..6ffa45c53be6 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -193,7 +193,12 @@ static void __init __maybe_unused build_assertions(void)
 #ifdef CONFIG_ARM_32
     CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
     CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
+    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START,
+                    TEMPORARY_FIXMAP_VIRT_START);
+    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START,
+                    TEMPORARY_FIXMAP_VIRT_START);
     CHECK_SAME_SLOT(second, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
+    CHECK_SAME_SLOT(second, FIXMAP_VIRT_START, TEMPORARY_FIXMAP_VIRT_START);
 #endif
 
 #undef CHECK_SAME_SLOT
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 59b80d122fd0..20598c6963ce 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -35,6 +35,7 @@ SECTIONS
        _idmap_start = .;
        *(.text.header)
        *(.text.idmap)
+       *(.rodata.idmap)
        _idmap_end = .;
 
        *(.text.cold)
-- 
2.40.1


