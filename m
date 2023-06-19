Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16238735CA1
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 19:01:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551248.860739 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIFt-0004xy-MH; Mon, 19 Jun 2023 17:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551248.860739; Mon, 19 Jun 2023 17:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBIFt-0004rI-Hd; Mon, 19 Jun 2023 17:01:29 +0000
Received: by outflank-mailman (input) for mailman id 551248;
 Mon, 19 Jun 2023 17:01:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qBIFs-0004l9-3o
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 17:01:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBIFr-0002fd-Sj; Mon, 19 Jun 2023 17:01:27 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qBIFr-00079R-LM; Mon, 19 Jun 2023 17:01:27 +0000
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
	bh=kb0w434WqcCO6B2fvVViD2fzwzZIeQ5lguZBKStXu+g=; b=VA76lUbCPBM1ZD3fyiyCAAzR6x
	skIaKc9psvsiUMVqfbXfeup2ya+mrvIvlBSgtWTgq45muJruisir4eP51MLSeq5neKLkuNdAsxWAg
	rKj2HQErZCoPdkRJq0BHzI5xwuqxS2rSMzVZ2b2uUzFzlIhUe3RurhounxKXjpUI27hU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com,
	michal.orzel@amd.com,
	Henry.Wang@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 7/7] xen/arm32: head: Widen the use of the temporary mapping
Date: Mon, 19 Jun 2023 18:01:15 +0100
Message-Id: <20230619170115.81398-8-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230619170115.81398-1-julien@xen.org>
References: <20230619170115.81398-1-julien@xen.org>
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
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

----

This patch was originally part of [1] but it was reverted due to
Xen not booting on the Arndale. The first patch of this series
is fixing it (confirmed by booting on the Arndale). So I am including
this patch. Also all the tags but the tested-by have been kept
because the code has not changed. Happy to drop any if there are
any concerns.

[1] https://lore.kernel.org/xen-devel/20230416143211.72227-1-julien@xen.org/

Changelog from the previous series:

    Changes in v6:
        - Add Henry's reviewed-by and tested-by tag
        - Add Michal's reviewed-by
        - Add newline in remove_identity_mapping for clarity

    Changes in v5:
        - Fix typo in a comment
        - No need to link boot_{second, third}_id again if we need to
          create a temporary area.

    Changes in v3:
        - Resolve conflicts after switching from "ldr rX, <label>" to
          "mov_w rX, <label>" in a previous patch

    Changes in v2:
        - Patch added
---
 xen/arch/arm/arm32/head.S | 86 ++++++++-------------------------------
 1 file changed, 16 insertions(+), 70 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index b942e7e54d08..d70e856ab7dd 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -459,7 +459,6 @@ ENDPROC(cpu_init)
 create_page_tables:
         /* Prepare the page-tables for mapping Xen */
         mov_w r0, XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, 1
         create_table_entry boot_second, boot_third, r0, 2
 
         /* Setup boot_third: */
@@ -479,70 +478,37 @@ create_page_tables:
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
+         * as TEMPORARY_AREA_FIRST_SLOT, then we will want to switch
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
-        create_table_entry boot_pgtable, boot_second_id, r9, 1
-        create_table_entry boot_second_id, boot_third_id, r9, 2
-
         /* Map boot_second (cover Xen mappings) to the temporary 1st slot */
         mov_w r0, TEMPORARY_XEN_VIRT_START
         create_table_entry boot_pgtable, boot_second, r0, 1
@@ -680,33 +646,13 @@ remove_identity_mapping:
         /* r2:r3 := invalid page-table entry */
         mov   r2, #0x0
         mov   r3, #0x0
-        /*
-         * Find the first slot used. Remove the entry for the first
-         * table if the slot is not XEN_FIRST_SLOT.
-         */
+
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
2.40.1


