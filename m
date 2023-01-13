Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF87F6693CE
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:11:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477052.739630 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2L-0005NB-SS; Fri, 13 Jan 2023 10:11:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477052.739630; Fri, 13 Jan 2023 10:11:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGH2L-0005Iy-CH; Fri, 13 Jan 2023 10:11:49 +0000
Received: by outflank-mailman (input) for mailman id 477052;
 Fri, 13 Jan 2023 10:11:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGH2J-00051X-9T
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:11:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2J-0006eE-4D; Fri, 13 Jan 2023 10:11:47 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2I-0005Ty-Sa; Fri, 13 Jan 2023 10:11:47 +0000
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
	bh=5DxH3rJatNojgfrSjlsm9PmDUaxsl/RbdM8hJOLXQ5o=; b=AoU7QgyyLyJvn6mtgRKQFFNXLb
	vfDhyUNGNhGVHut5c/4xvPkGF8WB190KjSAtfmqMmyXWer39pvfhbNIHHAxvOBySVb9haN44qDL1y
	p+8ZpbNSJMJwggr6bfqyAMYF2gfe9oE4/EhRUNoMPsP4j5bWZMdxtd4lQgqzNCSd/Eco=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 06/14] xen/arm32: head: Replace "ldr rX, =<label>" with "mov_w rX, <label>"
Date: Fri, 13 Jan 2023 10:11:28 +0000
Message-Id: <20230113101136.479-7-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113101136.479-1-julien@xen.org>
References: <20230113101136.479-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

"ldr rX, =<label>" is used to load a value from the literal pool. This
implies a memory access.

This can be avoided by using the macro mov_w which encode the value in
the immediate of two instructions.

So replace all "ldr rX, =<label>" with "mov_w rX, <label>".

No functional changes intended.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

----
    Changes in v4:
        * Add Stefano's reviewed-by tag
        * Add missing space
        * Add Michal's reviewed-by tag

    Changes in v3:
        * Patch added
---
 xen/arch/arm/arm32/head.S | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 5c1044710386..b680a4553fb6 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -62,7 +62,7 @@
 .endm
 
 .macro load_paddr rb, sym
-        ldr   \rb, =\sym
+        mov_w \rb, \sym
         add   \rb, \rb, r10
 .endm
 
@@ -149,7 +149,7 @@ past_zImage:
         mov   r8, r2                 /* r8 := DTB base address */
 
         /* Find out where we are */
-        ldr   r0, =start
+        mov_w r0, start
         adr   r9, start              /* r9  := paddr (start) */
         sub   r10, r9, r0            /* r10 := phys-offset */
 
@@ -170,7 +170,7 @@ past_zImage:
         bl    enable_mmu
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   r0, =primary_switched
+        mov_w r0, primary_switched
         mov   pc, r0
 primary_switched:
         /*
@@ -190,7 +190,7 @@ primary_switched:
         /* Setup the arguments for start_xen and jump to C world */
         mov   r0, r10                /* r0 := Physical offset */
         mov   r1, r8                 /* r1 := paddr(FDT) */
-        ldr   r2, =start_xen
+        mov_w r2, start_xen
         b     launch
 ENDPROC(start)
 
@@ -198,7 +198,7 @@ GLOBAL(init_secondary)
         cpsid aif                    /* Disable all interrupts */
 
         /* Find out where we are */
-        ldr   r0, =start
+        mov_w r0, start
         adr   r9, start              /* r9  := paddr (start) */
         sub   r10, r9, r0            /* r10 := phys-offset */
 
@@ -227,7 +227,7 @@ GLOBAL(init_secondary)
 
 
         /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   r0, =secondary_switched
+        mov_w r0, secondary_switched
         mov   pc, r0
 secondary_switched:
         /*
@@ -236,7 +236,7 @@ secondary_switched:
          *
          * XXX: This is not compliant with the Arm Arm.
          */
-        ldr   r4, =init_ttbr         /* VA of HTTBR value stashed by CPU 0 */
+        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
         ldrd  r4, r5, [r4]           /* Actual value */
         dsb
         mcrr  CP64(r4, r5, HTTBR)
@@ -254,7 +254,7 @@ secondary_switched:
 #endif
         PRINT("- Ready -\r\n")
         /* Jump to C world */
-        ldr   r2, =start_secondary
+        mov_w r2, start_secondary
         b     launch
 ENDPROC(init_secondary)
 
@@ -297,8 +297,8 @@ ENDPROC(check_cpu_mode)
  */
 zero_bss:
         PRINT("- Zero BSS -\r\n")
-        ldr   r0, =__bss_start       /* r0 := vaddr(__bss_start) */
-        ldr   r1, =__bss_end         /* r1 := vaddr(__bss_start) */
+        mov_w r0, __bss_start        /* r0 := vaddr(__bss_start) */
+        mov_w r1, __bss_end          /* r1 := vaddr(__bss_start) */
 
         mov   r2, #0
 1:      str   r2, [r0], #4
@@ -330,8 +330,8 @@ cpu_init:
 
 cpu_init_done:
         /* Set up memory attribute type tables */
-        ldr   r0, =MAIR0VAL
-        ldr   r1, =MAIR1VAL
+        mov_w r0, MAIR0VAL
+        mov_w r1, MAIR1VAL
         mcr   CP32(r0, HMAIR0)
         mcr   CP32(r1, HMAIR1)
 
@@ -341,10 +341,10 @@ cpu_init_done:
          * PT walks are write-back, write-allocate in both cache levels,
          * Full 32-bit address space goes through this table.
          */
-        ldr   r0, =(TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
+        mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
         mcr   CP32(r0, HTCR)
 
-        ldr   r0, =HSCTLR_SET
+        mov_w r0, HSCTLR_SET
         mcr   CP32(r0, HSCTLR)
         isb
 
@@ -452,7 +452,7 @@ ENDPROC(cpu_init)
  */
 create_page_tables:
         /* Prepare the page-tables for mapping Xen */
-        ldr   r0, =XEN_VIRT_START
+        mov_w r0, XEN_VIRT_START
         create_table_entry boot_pgtable, boot_second, r0, 1
         create_table_entry boot_second, boot_third, r0, 2
 
@@ -576,7 +576,7 @@ remove_identity_mapping:
         cmp   r1, #XEN_FIRST_SLOT
         beq   1f
         /* It is not in slot 0, remove the entry */
-        ldr   r0, =boot_pgtable      /* r0 := root table */
+        mov_w r0, boot_pgtable       /* r0 := root table */
         lsl   r1, r1, #3             /* r1 := Slot offset */
         strd  r2, r3, [r0, r1]
         b     identity_mapping_removed
@@ -590,7 +590,7 @@ remove_identity_mapping:
         cmp   r1, #XEN_SECOND_SLOT
         beq   identity_mapping_removed
         /* It is not in slot 1, remove the entry */
-        ldr   r0, =boot_second       /* r0 := second table */
+        mov_w r0, boot_second        /* r0 := second table */
         lsl   r1, r1, #3             /* r1 := Slot offset */
         strd  r2, r3, [r0, r1]
 
@@ -620,7 +620,7 @@ ENDPROC(remove_identity_mapping)
 setup_fixmap:
 #if defined(CONFIG_EARLY_PRINTK)
         /* Add UART to the fixmap table */
-        ldr   r0, =EARLY_UART_VIRTUAL_ADDRESS
+        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
         create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
 #endif
         /* Map fixmap into boot_second */
@@ -643,7 +643,7 @@ ENDPROC(setup_fixmap)
  * Clobbers r3
  */
 launch:
-        ldr   r3, =init_data
+        mov_w r3, init_data
         add   r3, #INITINFO_stack    /* Find the boot-time stack */
         ldr   sp, [r3]
         add   sp, #STACK_SIZE        /* (which grows down from the top). */
-- 
2.38.1


