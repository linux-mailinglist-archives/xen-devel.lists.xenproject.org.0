Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C3682B4CB
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 19:34:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666498.1037192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzsk-00035U-6N; Thu, 11 Jan 2024 18:34:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666498.1037192; Thu, 11 Jan 2024 18:34:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzsk-0002xk-1e; Thu, 11 Jan 2024 18:34:22 +0000
Received: by outflank-mailman (input) for mailman id 666498;
 Thu, 11 Jan 2024 18:34:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNzsj-0002kT-5y
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 18:34:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNzsi-000483-RD; Thu, 11 Jan 2024 18:34:20 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNzsi-0000gW-GO; Thu, 11 Jan 2024 18:34:20 +0000
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
	bh=qJJI5QEt+6FADEEnoFWOXuZuH35ZFWnjWnhkkG3wgoM=; b=J7WdqMUO2b954/IcmcRKZ5CtdS
	+494fEPMyjbv+hqOQyA9lU8mcaPC2Wi6KkcgyaPpbSnw2m31SweWjyXA3qqTUpHqMeSfAN47TmwLi
	wbubPtr3ZWSQQ04qR8hCN/04P7+Bqw+vMGkOZQXtmipWQQYAPP7kQdjt4LIOlir4dTWg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] xen/arm32: head: Improve logging in head.S
Date: Thu, 11 Jan 2024 18:34:10 +0000
Message-Id: <20240111183410.45566-3-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240111183410.45566-1-julien@xen.org>
References: <20240111183410.45566-1-julien@xen.org>
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

For the temporary mapping, the fixmap is already linked in the temporary
area (and so does the UART). So we just need to update the register
storing the UART address (i.e. r11) to point to the UART temporary
mapping.

Take the opportunity to introduce mov_w_on_cond in order to
conditionally execute mov_w and avoid branches.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    Changelog since v1:
        - Rebase
        - Move one hunk to the first patch to unbreak compilation
        - Add more logging
        - Remove duplicated entry
---
 xen/arch/arm/arm32/head.S               |  9 ------
 xen/arch/arm/arm32/mmu/head.S           | 39 +++++++++++++++++++++++++
 xen/arch/arm/include/asm/arm32/macros.h | 33 +++++++++++++++------
 xen/arch/arm/include/asm/asm_defns.h    |  6 ++--
 xen/arch/arm/include/asm/early_printk.h |  3 ++
 xen/arch/arm/include/asm/mmu/layout.h   |  4 +++
 xen/arch/arm/mmu/setup.c                |  3 ++
 xen/arch/arm/xen.lds.S                  |  1 +
 8 files changed, 78 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 34ab14a9e228..99d7d4aa63d1 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -98,10 +98,6 @@ past_zImage:
         b     enable_boot_cpu_mm
 
 primary_switched:
-#ifdef CONFIG_EARLY_PRINTK
-        /* Use a virtual address to access the UART. */
-        mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
-#endif
         bl    zero_bss
         PRINT("- Ready -\r\n")
         /* Setup the arguments for start_xen and jump to C world */
@@ -142,12 +138,7 @@ GLOBAL(init_secondary)
 
         mov_w lr, secondary_switched
         b     enable_secondary_cpu_mm
-
 secondary_switched:
-#ifdef CONFIG_EARLY_PRINTK
-        /* Use a virtual address to access the UART. */
-        mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
-#endif
         PRINT("- Ready -\r\n")
         /* Jump to C world */
         mov_w r2, start_secondary
diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
index a90799ad5451..f4abd690b612 100644
--- a/xen/arch/arm/arm32/mmu/head.S
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -298,6 +298,21 @@ enable_mmu:
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
@@ -307,6 +322,17 @@ enable_mmu:
         b     switch_to_runtime_mapping
 1:
         mov   lr, r5                /* Restore LR */
+
+        /*
+         * Now we are running at the runtime address. The UART can
+         * be accessed using its runtime virtual address.
+         */
+#ifdef CONFIG_EARLY_PRINTK
+        mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
+#endif
+
+        PRINT("- Switched to the runtime mapping -\r\n")
+
         /*
          * At this point, either the 1:1 map or the temporary mapping
          * will be present. The former may clash with other parts of the
@@ -348,12 +374,14 @@ switch_to_runtime_mapping:
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
@@ -364,6 +392,8 @@ switch_to_runtime_mapping:
 
         flush_xen_tlb_local r0
 
+        PRINT("- 1:1 mapping removed -\r\n")
+
         /* Map boot_second into boot_pgtable */
         mov_w r0, XEN_VIRT_START
         create_table_entry boot_pgtable, boot_second, r0, 1
@@ -376,7 +406,10 @@ switch_to_runtime_mapping:
          */
         isb
 
+        PRINT("- Runtime mapping mapped -\r\n")
 ready_to_switch:
+        PRINT_ID("- Jumping to runtime address -\r\n")
+
         mov   pc, lr
 ENDPROC(switch_to_runtime_mapping)
 
@@ -404,6 +437,8 @@ ENTRY(enable_secondary_cpu_mm)
         mov_w lr, 1f
         b     enable_mmu
 1:
+        PRINT("- Switching to the runtime page-tables -\r\n")
+
         /*
          * Non-boot CPUs need to move on to the proper pagetables, which were
          * setup in prepare_secondary_mm.
@@ -468,6 +503,8 @@ ENDPROC(enable_boot_cpu_mm)
  * Clobbers r0 - r3
  */
 remove_identity_mapping:
+        PRINT("- Removing the identity mapping -\r\n")
+
         /* r2:r3 := invalid page-table entry */
         mov   r2, #0x0
         mov   r3, #0x0
@@ -488,6 +525,8 @@ ENDPROC(remove_identity_mapping)
  * Clobbers r0 - r3
  */
 remove_temporary_mapping:
+        PRINT("- Removing the temporary mapping -\r\n")
+
         /* r2:r3 := invalid page-table entry */
         mov   r2, #0
         mov   r3, #0
diff --git a/xen/arch/arm/include/asm/arm32/macros.h b/xen/arch/arm/include/asm/arm32/macros.h
index b84666c764d4..db681a7c7eaa 100644
--- a/xen/arch/arm/include/asm/arm32/macros.h
+++ b/xen/arch/arm/include/asm/arm32/macros.h
@@ -9,9 +9,13 @@
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
@@ -29,16 +33,26 @@
 
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
-        bl    asm_puts     ;\
-        mov   lr, r3       ;\
-        RODATA_STR(98, _s)
+#define PRINT_SECT(section, string)         \
+        mov   r3, lr                       ;\
+        adr_l r0, 98f                      ;\
+        bl    asm_puts                     ;\
+        mov   lr, r3                       ;\
+        RODATA_SECT(section, 98, string)
+
+#define PRINT(string) PRINT_SECT(.rodata.str, string)
+#define PRINT_ID(string) PRINT_SECT(.rodata.idmap, string)
 
 /*
  * Macro to print the value of register \rb
@@ -54,6 +68,7 @@
 
 #else /* CONFIG_EARLY_PRINTK */
 #define PRINT(s)
+#define PRINT_ID(s)
 
 .macro print_reg rb
 .endm
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
index eac7eef885d6..a3b546465b5a 100644
--- a/xen/arch/arm/include/asm/mmu/layout.h
+++ b/xen/arch/arm/include/asm/mmu/layout.h
@@ -116,6 +116,10 @@
       (TEMPORARY_AREA_FIRST_SLOT << XEN_PT_LEVEL_SHIFT(1)))
 
 #define TEMPORARY_XEN_VIRT_START    TEMPORARY_AREA_ADDR(XEN_VIRT_START)
+#define TEMPORARY_FIXMAP_VIRT_START TEMPORARY_AREA_ADDR(FIXMAP_VIRT_START)
+
+#define TEMPORARY_FIXMAP_ADDR(n)                    \
+     (TEMPORARY_FIXMAP_VIRT_START + (n) * PAGE_SIZE)
 
 #else /* ARM_64 */
 
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
index d5264e51bc44..72725840b6b7 100644
--- a/xen/arch/arm/mmu/setup.c
+++ b/xen/arch/arm/mmu/setup.c
@@ -120,7 +120,10 @@ static void __init __maybe_unused build_assertions(void)
 #ifdef CONFIG_ARM_32
     CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
     CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
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


