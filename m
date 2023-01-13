Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F310566941E
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477123.739698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHKG-00049O-WB; Fri, 13 Jan 2023 10:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477123.739698; Fri, 13 Jan 2023 10:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHKG-00041W-RW; Fri, 13 Jan 2023 10:30:20 +0000
Received: by outflank-mailman (input) for mailman id 477123;
 Fri, 13 Jan 2023 10:30:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGHKF-0003yq-0m
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:30:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGHKE-0007Du-NI; Fri, 13 Jan 2023 10:30:18 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGH2N-0005Ty-MN; Fri, 13 Jan 2023 10:11:51 +0000
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
	bh=3cyXZ0+n/RxygQrIDuBnyuElEfntomdEEmsp7TWQV70=; b=3HlebbHCMHUWVsdWb2nnBUtaEL
	PjkVyQbzPbgZci67ArEPdk0Sd6+rnPtb9EkXSV6qrwDEuvq1MzCAJy6L2zhm6KEm0i67FoRsCjB/V
	NeKx+Iips6N7bNpGG/ZDopB92gm/oJrcBjKAI1RmRDxioL/t5tJpvmbUG6i2enMhIdaA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 10/14] xen/arm32: head: Widen the use of the temporary mapping
Date: Fri, 13 Jan 2023 10:11:32 +0000
Message-Id: <20230113101136.479-11-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113101136.479-1-julien@xen.org>
References: <20230113101136.479-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, the temporary mapping is only used when the virtual
runtime region of Xen is clashing with the physical region.

In follow-up patches, we will rework how secondary CPU bring-up works
and it will be convenient to use the fixmap area for accessing
the root page-table (it is per-cpu).

Rework the code to use temporary mapping when the Xen physical address
is not overlapping with the temporary mapping.

This also has the advantage to simplify the logic to identity map
Xen.

Signed-off-by: Julien Grall <jgrall@amazon.com>

----

Even if this patch is rewriting part of the previous patch, I decided
to keep them separated to help the review.

The "folow-up patches" are still in draft at the moment. I still haven't
find a way to split them nicely and not require too much more work
in the coloring side.

I have provided some medium-term goal in the cover letter.

    Changes in v3:
        - Resolve conflicts after switching from "ldr rX, <label>" to
          "mov_w rX, <label>" in a previous patch

    Changes in v2:
        - Patch added
---
 xen/arch/arm/arm32/head.S | 82 +++++++--------------------------------
 1 file changed, 15 insertions(+), 67 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 3800efb44169..ce858e9fc4da 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -459,7 +459,6 @@ ENDPROC(cpu_init)
 create_page_tables:
         /* Prepare the page-tables for mapping Xen */
         mov_w r0, XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, 1
         create_table_entry boot_second, boot_third, r0, 2
 
         /* Setup boot_third: */
@@ -479,67 +478,37 @@ create_page_tables:
         cmp   r1, #(XEN_PT_LPAE_ENTRIES<<3) /* 512*8-byte entries per page */
         blo   1b
 
-        /*
-         * If Xen is loaded at exactly XEN_VIRT_START then we don't
-         * need an additional 1:1 mapping, the virtual mapping will
-         * suffice.
-         */
-        cmp   r9, #XEN_VIRT_START
-        moveq pc, lr
-
         /*
          * Setup the 1:1 mapping so we can turn the MMU on. Note that
          * only the first page of Xen will be part of the 1:1 mapping.
-         *
-         * In all the cases, we will link boot_third_id. So create the
-         * mapping in advance.
          */
+        create_table_entry boot_pgtable, boot_second_id, r9, 1
+        create_table_entry boot_second_id, boot_third_id, r9, 2
         create_mapping_entry boot_third_id, r9, r9
 
         /*
-         * Find the first slot used. If the slot is not XEN_FIRST_SLOT,
-         * then the 1:1 mapping will use its own set of page-tables from
-         * the second level.
+         * Find the first slot used. If the slot is not the same
+         * as XEN_TMP_FIRST_SLOT, then we will want to switch
+         * to the temporary mapping before jumping to the runtime
+         * virtual mapping.
          */
         get_table_slot r1, r9, 1     /* r1 := first slot */
-        cmp   r1, #XEN_FIRST_SLOT
-        beq   1f
-        create_table_entry boot_pgtable, boot_second_id, r9, 1
-        b     link_from_second_id
-
-1:
-        /*
-         * Find the second slot used. If the slot is XEN_SECOND_SLOT, then the
-         * 1:1 mapping will use its own set of page-tables from the
-         * third level.
-         */
-        get_table_slot r1, r9, 2     /* r1 := second slot */
-        cmp   r1, #XEN_SECOND_SLOT
-        beq   virtphys_clash
-        create_table_entry boot_second, boot_third_id, r9, 2
-        b     link_from_third_id
+        cmp   r1, #TEMPORARY_AREA_FIRST_SLOT
+        bne   use_temporary_mapping
 
-link_from_second_id:
-        create_table_entry boot_second_id, boot_third_id, r9, 2
-link_from_third_id:
-        /* Good news, we are not clashing with Xen virtual mapping */
+        mov_w r0, XEN_VIRT_START
+        create_table_entry boot_pgtable, boot_second, r0, 1
         mov   r12, #0                /* r12 := temporary mapping not created */
         mov   pc, lr
 
-virtphys_clash:
+use_temporary_mapping:
         /*
-         * The identity map clashes with boot_third. Link boot_first_id and
-         * map Xen to a temporary mapping. See switch_to_runtime_mapping
-         * for more details.
+         * The identity mapping is not using the first slot
+         * TEMPORARY_AREA_FIRST_SLOT. Create a temporary mapping.
+         * See switch_to_runtime_mapping for more details.
          */
-        PRINT("- Virt and Phys addresses clash  -\r\n")
         PRINT("- Create temporary mapping -\r\n")
 
-        /*
-         * This will override the link to boot_second in XEN_FIRST_SLOT.
-         * The page-tables are not live yet. So no need to use
-         * break-before-make.
-         */
         create_table_entry boot_pgtable, boot_second_id, r9, 1
         create_table_entry boot_second_id, boot_third_id, r9, 2
 
@@ -675,33 +644,12 @@ remove_identity_mapping:
         /* r2:r3 := invalid page-table entry */
         mov   r2, #0x0
         mov   r3, #0x0
-        /*
-         * Find the first slot used. Remove the entry for the first
-         * table if the slot is not XEN_FIRST_SLOT.
-         */
+        /* Find the first slot used and remove it */
         get_table_slot r1, r9, 1     /* r1 := first slot */
-        cmp   r1, #XEN_FIRST_SLOT
-        beq   1f
-        /* It is not in slot 0, remove the entry */
         mov_w r0, boot_pgtable       /* r0 := root table */
         lsl   r1, r1, #3             /* r1 := Slot offset */
         strd  r2, r3, [r0, r1]
-        b     identity_mapping_removed
-
-1:
-        /*
-         * Find the second slot used. Remove the entry for the first
-         * table if the slot is not XEN_SECOND_SLOT.
-         */
-        get_table_slot r1, r9, 2     /* r1 := second slot */
-        cmp   r1, #XEN_SECOND_SLOT
-        beq   identity_mapping_removed
-        /* It is not in slot 1, remove the entry */
-        mov_w r0, boot_second        /* r0 := second table */
-        lsl   r1, r1, #3             /* r1 := Slot offset */
-        strd  r2, r3, [r0, r1]
 
-identity_mapping_removed:
         flush_xen_tlb_local r0
         mov   pc, lr
 ENDPROC(remove_identity_mapping)
-- 
2.38.1


