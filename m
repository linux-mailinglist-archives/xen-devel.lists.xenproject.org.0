Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1945915EE
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385858.621675 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHS-0001Nb-F2; Fri, 12 Aug 2022 19:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385858.621675; Fri, 12 Aug 2022 19:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHS-0001Jd-AI; Fri, 12 Aug 2022 19:25:14 +0000
Received: by outflank-mailman (input) for mailman id 385858;
 Fri, 12 Aug 2022 19:25:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHQ-0000wg-9V
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHP-0000yE-W3; Fri, 12 Aug 2022 19:25:11 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHP-0006n6-O5; Fri, 12 Aug 2022 19:25:11 +0000
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
	bh=UfWb+n83nlA+FfpERZvzgicr1KFfkvvT5C3RMOVERFw=; b=W2b0baSx43V013hbPf7SzcRvE0
	v/ztQ6YwuCVWGKXQGcZxazGfi2Flfd+KVf1T8WS98QpgSNX+g6zRFe7dzqvLEMEwgAHE6WNpOb3Xo
	CEo/Uth0uA0+CJANi7xO3p5FxPZsW+wp2jGvk7cy2ZyfxGgeeUjKdg8HVpxN3qZ15vHM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 4/7] xen/arm32: heap: Rework adr_l so it doesn't rely on where Xen is loaded
Date: Fri, 12 Aug 2022 20:24:43 +0100
Message-Id: <20220812192448.43016-5-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812192448.43016-1-julien@xen.org>
References: <20220812192448.43016-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, the macro addr_l needs to know whether the caller
is running with the MMU on. This is fine today because there are
only two possible cases:
 1) MMU off
 2) MMU on and linked to the virtual address

This is still cumbersome to use for the developer as they need
to know if the MMU is on.

Thankfully, Linux developpers came up with a great way to allow
adr_l to work within the range +/- 4GB of PC by emitting a PC-relative
reference [1].

Re-use the same approach on Arm and drop the parameter 'mmu'.

[1] 0b1674638a5c ("ARM: assembler: introduce adr_l, ldr_l and str_l macros")

Signed-off-by: Julien Grall <jgrall@amazon.com>

----
    I haven't added an Origin tag because this is quite different
    from the Linux commit. I am happy to add one if this is desired..
---
 xen/arch/arm/arm32/head.S | 38 +++++++++++++++-----------------------
 1 file changed, 15 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 50f6fa4eb38d..27d02ac8d68f 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -49,20 +49,16 @@
 .endm
 
 /*
- * There are no easy way to have a PC relative address within the range
- * +/- 4GB of the PC.
+ * Pseudo-op for PC relative adr <reg>, <symbol> where <symbol> is
+ * within the range +/- 4GB of the PC.
  *
- * This macro workaround it by asking the user to tell whether the MMU
- * has been turned on or not.
- *
- * When the MMU is turned off, we need to apply the physical offset
- * (r10) in order to find the associated physical address.
+ * @dst: destination register
+ * @sym: name of the symbol
  */
-.macro adr_l, dst, sym, mmu
-        ldr   \dst, =\sym
-        .if \mmu == 0
-        add   \dst, \dst, r10
-        .endif
+.macro adr_l, dst, sym
+        mov_w \dst, \sym - .Lpc\@
+        .set  .Lpc\@, .+ 8          /* PC bias */
+        add   \dst, \dst, pc
 .endm
 
 .macro load_paddr rb, sym
@@ -383,7 +379,6 @@ ENDPROC(cpu_init)
  * tbl:     table symbol to point to
  * virt:    virtual address
  * lvl:     page-table level
- * mmu:     Is the MMU turned on/off. If not specified it will be off
  *
  * Preserves \virt
  * Clobbers r1 - r4
@@ -392,7 +387,7 @@ ENDPROC(cpu_init)
  *
  * Note that \virt should be in a register other than r1 - r4
  */
-.macro create_table_entry, ptbl, tbl, virt, lvl, mmu=0
+.macro create_table_entry, ptbl, tbl, virt, lvl
         get_table_slot r1, \virt, \lvl  /* r1 := slot in \tlb */
         lsl   r1, r1, #3                /* r1 := slot offset in \tlb */
 
@@ -402,7 +397,7 @@ ENDPROC(cpu_init)
         orr   r2, r2, r4             /*           + \tlb paddr */
         mov   r3, #0
 
-        adr_l r4, \ptbl, \mmu
+        adr_l r4, \ptbl
 
         strd  r2, r3, [r4, r1]
 .endm
@@ -415,17 +410,14 @@ ENDPROC(cpu_init)
  * virt:    virtual address
  * phys:    physical address
  * type:    mapping type. If not specified it will be normal memory (PT_MEM_L3)
- * mmu:     Is the MMU turned on/off. If not specified it will be off
  *
  * Preserves \virt, \phys
  * Clobbers r1 - r4
  *
- * * Also use r10 for the phys offset.
- *
  * Note that \virt and \paddr should be in other registers than r1 - r4
  * and be distinct.
  */
-.macro create_mapping_entry, ptbl, virt, phys, type=PT_MEM_L3, mmu=0
+.macro create_mapping_entry, ptbl, virt, phys, type=PT_MEM_L3
         mov_w r2, XEN_PT_LPAE_ENTRY_MASK
         lsr   r1, \virt, #THIRD_SHIFT
         and   r1, r1, r2             /* r1 := slot in \tlb */
@@ -438,7 +430,7 @@ ENDPROC(cpu_init)
         orr   r2, r2, r4             /*          + PAGE_ALIGNED(phys) */
         mov   r3, #0
 
-        adr_l r4, \ptbl, \mmu
+        adr_l r4, \ptbl
 
         strd  r2, r3, [r4, r1]
 .endm
@@ -468,7 +460,7 @@ create_page_tables:
         create_table_entry boot_second, boot_third, r0, 2
 
         /* Setup boot_third: */
-        adr_l r4, boot_third, mmu=0
+        adr_l r4, boot_third
 
         lsr   r2, r9, #THIRD_SHIFT  /* Base address for 4K mapping */
         lsl   r2, r2, #THIRD_SHIFT
@@ -632,11 +624,11 @@ setup_fixmap:
 #if defined(CONFIG_EARLY_PRINTK)
         /* Add UART to the fixmap table */
         ldr   r0, =EARLY_UART_VIRTUAL_ADDRESS
-        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3, mmu=1
+        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
 #endif
         /* Map fixmap into boot_second */
         mov_w r0, FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, r0, 2, mmu=1
+        create_table_entry boot_second, xen_fixmap, r0, 2
         /* Ensure any page table updates made above have occurred. */
         dsb   nshst
 
-- 
2.37.1


