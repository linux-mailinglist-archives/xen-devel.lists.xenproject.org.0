Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F965915EC
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385856.621649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHP-0000gy-Nt; Fri, 12 Aug 2022 19:25:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385856.621649; Fri, 12 Aug 2022 19:25:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHP-0000bb-IL; Fri, 12 Aug 2022 19:25:11 +0000
Received: by outflank-mailman (input) for mailman id 385856;
 Fri, 12 Aug 2022 19:25:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHO-0000OU-3A
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHN-0000xo-TP; Fri, 12 Aug 2022 19:25:09 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHN-0006n6-LI; Fri, 12 Aug 2022 19:25:09 +0000
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
	bh=ngshIEE2EN6MEfw9zmbHPOq0MvbgTTFSHuQTBxj5Rkw=; b=6AOrZflQqxWt6ZUuxW+F80X5TW
	UkChC67IgilFd/Mv8haKA1DcebMlYmv7kYezggohNyTbySnsmPaTpFm+bsWk+RkYu01XIg9PCzByT
	e5e6SvFQz0NFelgVgSfpcKU/8vim9tSGvDSFS6WqnAl2WAJ7mZSvqTgxE+5FR5qXKcB4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/7] xen/arm64: head: Introduce get_table_slot() and use it
Date: Fri, 12 Aug 2022 20:24:41 +0100
Message-Id: <20220812192448.43016-3-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812192448.43016-1-julien@xen.org>
References: <20220812192448.43016-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

There are a few places in the code that need to find the slot
at a given page-table level.

So create a new macro get_table_slot() for that. This will reduce
the effort to figure out whether the code is doing the right thing.

Take the opportunity to use 'ubfx'. The only benefits is reducing
the number of instructions from 2 to 1.

The new macro is used everywhere we need to compute the slot. This
requires to tweak the parameter of create_table_entry() to pass
a level rather than shift.

Note, for slot 0 the code is currently skipping the masking part. While
this is fine, it is safer to mask it as technically slot 0 only covers
bit 48 - 39 bit (assuming 4KB page granularity).

Take the opportunity to correct the comment when finding the second
slot for the identity mapping (we are computing the second slot
rather than first).

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

    This patch also has the benefits to reduce the number
    of use of {ZEROETH, FIRST, SECOND, THIRD}_SHIFT. The next
    patch for arm32 will reduce further.
---
 xen/arch/arm/arm64/head.S | 55 +++++++++++++++++++++------------------
 1 file changed, 30 insertions(+), 25 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 26cc7705f556..ad014716db6f 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -493,13 +493,24 @@ cpu_init:
         ret
 ENDPROC(cpu_init)
 
+/*
+ * Macro to find the slot number at a given page-table level
+ *
+ * slot:     slot computed
+ * virt:     virtual address
+ * lvl:      page-table level
+ */
+.macro get_table_slot, slot, virt, lvl
+        ubfx  \slot, \virt, #XEN_PT_LEVEL_SHIFT(\lvl), #XEN_PT_LPAE_SHIFT
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
  * tmp1:    scratch register
  * tmp2:    scratch register
  * tmp3:    scratch register
@@ -511,9 +522,8 @@ ENDPROC(cpu_init)
  *
  * Note that all parameters using registers should be distinct.
  */
-.macro create_table_entry, ptbl, tbl, virt, shift, tmp1, tmp2, tmp3
-        lsr   \tmp1, \virt, #\shift
-        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
+.macro create_table_entry, ptbl, tbl, virt, lvl, tmp1, tmp2, tmp3
+        get_table_slot \tmp1, \virt, \lvl   /* \tmp1 := slot in \tlb */
 
         load_paddr \tmp2, \tbl
         mov   \tmp3, #PT_PT                 /* \tmp3 := right for linear PT */
@@ -544,8 +554,7 @@ ENDPROC(cpu_init)
 .macro create_mapping_entry, ptbl, virt, phys, tmp1, tmp2, tmp3, type=PT_MEM_L3
         and   \tmp3, \phys, #THIRD_MASK     /* \tmp3 := PAGE_ALIGNED(phys) */
 
-        lsr   \tmp1, \virt, #THIRD_SHIFT
-        and   \tmp1, \tmp1, #XEN_PT_LPAE_ENTRY_MASK/* \tmp1 := slot in \tlb */
+        get_table_slot \tmp1, \virt, 3      /* \tmp1 := slot in \tlb */
 
         mov   \tmp2, #\type                 /* \tmp2 := right for section PT */
         orr   \tmp2, \tmp2, \tmp3           /*          + PAGE_ALIGNED(phys) */
@@ -573,9 +582,9 @@ ENDPROC(cpu_init)
 create_page_tables:
         /* Prepare the page-tables for mapping Xen */
         ldr   x0, =XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_first, x0, ZEROETH_SHIFT, x1, x2, x3
-        create_table_entry boot_first, boot_second, x0, FIRST_SHIFT, x1, x2, x3
-        create_table_entry boot_second, boot_third, x0, SECOND_SHIFT, x1, x2, x3
+        create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
+        create_table_entry boot_first, boot_second, x0, 1, x1, x2, x3
+        create_table_entry boot_second, boot_third, x0, 2, x1, x2, x3
 
         /* Map Xen */
         adr_l x4, boot_third
@@ -612,10 +621,10 @@ create_page_tables:
          * XEN_ZEROETH_SLOT, then the 1:1 mapping will use its own set of
          * page-tables from the first level.
          */
-        lsr   x0, x19, #ZEROETH_SHIFT   /* x0 := zeroeth slot */
+        get_table_slot x0, x19, 0       /* x0 := zeroeth slot */
         cmp   x0, #XEN_ZEROETH_SLOT
         beq   1f
-        create_table_entry boot_pgtable, boot_first_id, x19, ZEROETH_SHIFT, x0, x1, x2
+        create_table_entry boot_pgtable, boot_first_id, x19, 0, x0, x1, x2
         b     link_from_first_id
 
 1:
@@ -624,11 +633,10 @@ create_page_tables:
          * then the 1:1 mapping will use its own set of page-tables from
          * the second level.
          */
-        lsr   x0, x19, #FIRST_SHIFT
-        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 := first slot */
+        get_table_slot x0, x19, 1      /* x0 := first slot */
         cmp   x0, #XEN_FIRST_SLOT
         beq   1f
-        create_table_entry boot_first, boot_second_id, x19, FIRST_SHIFT, x0, x1, x2
+        create_table_entry boot_first, boot_second_id, x19, 1, x0, x1, x2
         b     link_from_second_id
 
 1:
@@ -638,17 +646,16 @@ create_page_tables:
          * third level. For slot XEN_SECOND_SLOT, Xen is not yet able to handle
          * it.
          */
-        lsr   x0, x19, #SECOND_SHIFT
-        and   x0, x0, #XEN_PT_LPAE_ENTRY_MASK  /* x0 := first slot */
+        get_table_slot x0, x19, 2     /* x0 := second slot */
         cmp   x0, #XEN_SECOND_SLOT
         beq   virtphys_clash
-        create_table_entry boot_second, boot_third_id, x19, SECOND_SHIFT, x0, x1, x2
+        create_table_entry boot_second, boot_third_id, x19, 2, x0, x1, x2
         b     link_from_third_id
 
 link_from_first_id:
-        create_table_entry boot_first_id, boot_second_id, x19, FIRST_SHIFT, x0, x1, x2
+        create_table_entry boot_first_id, boot_second_id, x19, 1, x0, x1, x2
 link_from_second_id:
-        create_table_entry boot_second_id, boot_third_id, x19, SECOND_SHIFT, x0, x1, x2
+        create_table_entry boot_second_id, boot_third_id, x19, 2, x0, x1, x2
 link_from_third_id:
         create_mapping_entry boot_third_id, x19, x19, x0, x1, x2
         ret
@@ -705,7 +712,7 @@ remove_identity_mapping:
          * Find the zeroeth slot used. Remove the entry from zeroeth
          * table if the slot is not XEN_ZEROETH_SLOT.
          */
-        lsr   x1, x19, #ZEROETH_SHIFT   /* x1 := zeroeth slot */
+        get_table_slot x1, x19, 0       /* x1 := zeroeth slot */
         cmp   x1, #XEN_ZEROETH_SLOT
         beq   1f
         /* It is not in slot XEN_ZEROETH_SLOT, remove the entry. */
@@ -718,8 +725,7 @@ remove_identity_mapping:
          * Find the first slot used. Remove the entry for the first
          * table if the slot is not XEN_FIRST_SLOT.
          */
-        lsr   x1, x19, #FIRST_SHIFT
-        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 := first slot */
+        get_table_slot x1, x19, 1       /* x1 := first slot */
         cmp   x1, #XEN_FIRST_SLOT
         beq   1f
         /* It is not in slot XEN_FIRST_SLOT, remove the entry. */
@@ -732,8 +738,7 @@ remove_identity_mapping:
          * Find the second slot used. Remove the entry for the first
          * table if the slot is not XEN_SECOND_SLOT.
          */
-        lsr   x1, x19, #SECOND_SHIFT
-        and   x1, x1, #XEN_PT_LPAE_ENTRY_MASK  /* x1 := first slot */
+        get_table_slot x1, x19, 2       /* x1 := second slot */
         cmp   x1, #XEN_SECOND_SLOT
         beq   identity_mapping_removed
         /* It is not in slot 1, remove the entry */
@@ -771,7 +776,7 @@ setup_fixmap:
 #endif
         /* Map fixmap into boot_second */
         ldr   x0, =FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, x0, SECOND_SHIFT, x1, x2, x3
+        create_table_entry boot_second, xen_fixmap, x0, 2, x1, x2, x3
         /* Ensure any page table updates made above have occurred. */
         dsb   nshst
 
-- 
2.37.1


