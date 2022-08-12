Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA235915E8
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385857.621664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHR-00016Y-3E; Fri, 12 Aug 2022 19:25:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385857.621664; Fri, 12 Aug 2022 19:25:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHQ-00010t-VQ; Fri, 12 Aug 2022 19:25:12 +0000
Received: by outflank-mailman (input) for mailman id 385857;
 Fri, 12 Aug 2022 19:25:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHP-0000YD-6H
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHO-0000y0-UO; Fri, 12 Aug 2022 19:25:10 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHO-0006n6-Mf; Fri, 12 Aug 2022 19:25:10 +0000
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
	bh=MmRrbC3kvaMa64yr7ie9nAhuc1w7gAgxG0UgP5uX0L8=; b=Ax34ql9MUHf8TDUrgS8BWDGqTs
	g4yKR+4WvfivmMOR11aWb0vt+SAxtgpbEwF6pNTU2PBsYflRFTyFGu8IyDpvorJzau1be9ndyADQQ
	c0EYoKQC5g7ekNGxJMPzwjUvFPG6vbUdQpCdse9Yi8i4CniZxDggKvIqOw3V4yZtRyu4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 3/7] xen/arm32: head: Introduce get_table_slot() and use it
Date: Fri, 12 Aug 2022 20:24:42 +0100
Message-Id: <20220812192448.43016-4-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812192448.43016-1-julien@xen.org>
References: <20220812192448.43016-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

There are a few places in the code that need to find the slot at a
given page-table level.

So create a new macro get_table_slot() for that. This will reduce
the effort to figure out whether the code is doing the right thing.

The new macro is using 'ubfx' (or 'lsr' for the first level) rather
than the existing sequence (mov_w, lsr, and) because it doesn't require
a scratch register and reduce the number of instructions (4 -> 1).

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 56 ++++++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 46d93bebbabe..50f6fa4eb38d 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -358,13 +358,31 @@ cpu_init_done:
         mov   pc, r5                        /* Return address is in r5 */
 ENDPROC(cpu_init)
 
+/*
+ * Macro to find the slot number at a given page-table level
+ *
+ * slot:     slot computed
+ * virt:     virtual address
+ * lvl:      page-table level
+ *
+ * Note that ubxf is unpredictable when the end bit is above 32-bit. So we
+ * can't use it for first level offset.
+ */
+.macro get_table_slot, slot, virt, lvl
+    .if \lvl == 1
+        lsr   \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl)
+    .else
+        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
+    .endif
+.endm
+
 /*
  * Macro to create a page table entry in \ptbl to \tbl
  *
  * ptbl:    table symbol where the entry will be created
  * tbl:     table symbol to point to
  * virt:    virtual address
- * shift:   #imm page table shift
+ * lvl:     page-table level
  * mmu:     Is the MMU turned on/off. If not specified it will be off
  *
  * Preserves \virt
@@ -374,11 +392,9 @@ ENDPROC(cpu_init)
  *
  * Note that \virt should be in a register other than r1 - r4
  */
-.macro create_table_entry, ptbl, tbl, virt, shift, mmu=0
-        lsr   r1, \virt, #\shift
-        mov_w r2, XEN_PT_LPAE_ENTRY_MASK
-        and   r1, r1, r2             /* r1 := slot in \tlb */
-        lsl   r1, r1, #3             /* r1 := slot offset in \tlb */
+.macro create_table_entry, ptbl, tbl, virt, lvl, mmu=0
+        get_table_slot r1, \virt, \lvl  /* r1 := slot in \tlb */
+        lsl   r1, r1, #3                /* r1 := slot offset in \tlb */
 
         load_paddr r4, \tbl
 
@@ -448,8 +464,8 @@ ENDPROC(cpu_init)
 create_page_tables:
         /* Prepare the page-tables for mapping Xen */
         ldr   r0, =XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, FIRST_SHIFT
-        create_table_entry boot_second, boot_third, r0, SECOND_SHIFT
+        create_table_entry boot_pgtable, boot_second, r0, 1
+        create_table_entry boot_second, boot_third, r0, 2
 
         /* Setup boot_third: */
         adr_l r4, boot_third, mmu=0
@@ -486,12 +502,10 @@ create_page_tables:
          * then the 1:1 mapping will use its own set of page-tables from
          * the second level.
          */
-        lsr   r1, r9, #FIRST_SHIFT
-        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
-        and   r1, r1, r0              /* r1 := first slot */
+        get_table_slot r1, r9, 1     /* r1 := first slot */
         cmp   r1, #XEN_FIRST_SLOT
         beq   1f
-        create_table_entry boot_pgtable, boot_second_id, r9, FIRST_SHIFT
+        create_table_entry boot_pgtable, boot_second_id, r9, 1
         b     link_from_second_id
 
 1:
@@ -501,16 +515,14 @@ create_page_tables:
          * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
          * it.
          */
-        lsr   r1, r9, #SECOND_SHIFT
-        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
-        and   r1, r1, r0             /* r1 := second slot */
+        get_table_slot r1, r9, 2     /* r1 := second slot */
         cmp   r1, #XEN_SECOND_SLOT
         beq   virtphys_clash
-        create_table_entry boot_second, boot_third_id, r9, SECOND_SHIFT
+        create_table_entry boot_second, boot_third_id, r9, 2
         b     link_from_third_id
 
 link_from_second_id:
-        create_table_entry boot_second_id, boot_third_id, r9, SECOND_SHIFT
+        create_table_entry boot_second_id, boot_third_id, r9, 2
 link_from_third_id:
         create_mapping_entry boot_third_id, r9, r9
         mov   pc, lr
@@ -571,9 +583,7 @@ remove_identity_mapping:
          * Find the first slot used. Remove the entry for the first
          * table if the slot is not XEN_FIRST_SLOT.
          */
-        lsr   r1, r9, #FIRST_SHIFT
-        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
-        and   r1, r1, r0              /* r1 := first slot */
+        get_table_slot r1, r9, 1     /* r1 := first slot */
         cmp   r1, #XEN_FIRST_SLOT
         beq   1f
         /* It is not in slot 0, remove the entry */
@@ -587,9 +597,7 @@ remove_identity_mapping:
          * Find the second slot used. Remove the entry for the first
          * table if the slot is not XEN_SECOND_SLOT.
          */
-        lsr   r1, r9, #SECOND_SHIFT
-        mov_w r0, XEN_PT_LPAE_ENTRY_MASK
-        and   r1, r1, r0             /* r1 := second slot */
+        get_table_slot r1, r9, 2     /* r1 := second slot */
         cmp   r1, #XEN_SECOND_SLOT
         beq   identity_mapping_removed
         /* It is not in slot 1, remove the entry */
@@ -628,7 +636,7 @@ setup_fixmap:
 #endif
         /* Map fixmap into boot_second */
         mov_w r0, FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, r0, SECOND_SHIFT, mmu=1
+        create_table_entry boot_second, xen_fixmap, r0, 2, mmu=1
         /* Ensure any page table updates made above have occurred. */
         dsb   nshst
 
-- 
2.37.1


