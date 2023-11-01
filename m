Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 467777DE8E1
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 00:30:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626672.977137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKfI-0003zj-8R; Wed, 01 Nov 2023 23:30:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626672.977137; Wed, 01 Nov 2023 23:30:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qyKfI-0003u3-4Z; Wed, 01 Nov 2023 23:30:24 +0000
Received: by outflank-mailman (input) for mailman id 626672;
 Wed, 01 Nov 2023 23:30:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qyKfH-0003qb-1G
 for xen-devel@lists.xenproject.org; Wed, 01 Nov 2023 23:30:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyKfG-0008Dg-OZ; Wed, 01 Nov 2023 23:30:22 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qyKfG-0007xN-Gd; Wed, 01 Nov 2023 23:30:22 +0000
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
	bh=odBcBVL9cWHvRFL9NbKIk3kHR3WNFMecqyNNuQSt4r8=; b=NtUFjz6xs5m3RzGg8Siu88cIdf
	YrOvVjHxc0Z2ejwtorMvVdUYGMyRzR0tasbf5c9ZI3b65cF9tYrijCojClY+uxna1z4oOUUGUqDD4
	82Bp//nPQILsxv8r+fjnw2cRM/llm8slJuHIR9MzJ+ylp4lMGQe6NmKnCoR6qrZy0llk=;
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
Subject: [PATCH 1/2] xen/arm32: head: Rework how the fixmap and early UART mapping are prepared
Date: Wed,  1 Nov 2023 23:30:10 +0000
Message-Id: <20231101233011.83098-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231101233011.83098-1-julien@xen.org>
References: <20231101233011.83098-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since commit 5e213f0f4d2c ("xen/arm32: head: Widen the use of the
temporary mapping"), boot_second (used to cover regions like Xen and
the fixmap) will not be mapped if the identity mapping overlap.

So it is ok to prepare the fixmap table and link it in boot_second
earlier. With that, the fixmap can also be used earlier via the
temporary mapping.

Therefore split setup_fixmap() in two:
    * The table is now linked in create_page_tables() because
      the boot page tables needs to be recreated for every CPU.
    * The early UART mapping is only added for the boot CPU0 as the
      fixmap table is not cleared when secondary CPUs boot.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 48 ++++++++-------------------------------
 1 file changed, 9 insertions(+), 39 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 33b038e7e0ca..fec2433e568f 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -183,12 +183,16 @@ past_zImage:
         bl    check_cpu_mode
         bl    cpu_init
         bl    create_page_tables
+        /* Add the UART mapping if requested */
+#ifdef CONFIG_EARLY_PRINTK
+        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
+        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
+#endif
 
         /* Address in the runtime mapping to jump to after the MMU is enabled */
         mov_w lr, primary_switched
         b     enable_mmu
 primary_switched:
-        bl    setup_fixmap
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
         mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
@@ -456,11 +460,6 @@ ENDPROC(cpu_init)
  * Rebuild the boot pagetable's first-level entries. The structure
  * is described in mm.c.
  *
- * After the CPU enables paging it will add the fixmap mapping
- * to these page tables, however this may clash with the 1:1
- * mapping. So each CPU must rebuild the page tables here with
- * the 1:1 in place.
- *
  * Inputs:
  *   r9 : paddr(start)
  *   r10: phys offset
@@ -488,6 +487,10 @@ create_page_tables:
         add   r5, r5, #PAGE_SIZE            /* r5 := Next table */
 .endr
 
+        /* Map the fixmap into boot_second */
+        mov_w r0, FIXMAP_ADDR(0)
+        create_table_entry boot_second, xen_fixmap, r0, 2
+
         /*
          * Find the size of Xen in pages and multiply by the size of a
          * PTE. This will then be compared in the mapping loop below.
@@ -718,39 +721,6 @@ remove_temporary_mapping:
         mov  pc, lr
 ENDPROC(remove_temporary_mapping)
 
-/*
- * Map the UART in the fixmap (when earlyprintk is used) and hook the
- * fixmap table in the page tables.
- *
- * The fixmap cannot be mapped in create_page_tables because it may
- * clash with the 1:1 mapping.
- *
- * Inputs:
- *   r10: Physical offset
- *   r11: Early UART base physical address
- *
- * Clobbers r0 - r4
- */
-setup_fixmap:
-#if defined(CONFIG_EARLY_PRINTK)
-        /* Add UART to the fixmap table */
-        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
-        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
-#endif
-        /* Map fixmap into boot_second */
-        mov_w r0, FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, r0, 2
-        /* Ensure any page table updates made above have occurred. */
-        dsb   nshst
-        /*
-         * The fixmap area will be used soon after. So ensure no hardware
-         * translation happens before the dsb completes.
-         */
-        isb
-
-        mov   pc, lr
-ENDPROC(setup_fixmap)
-
 /*
  * Setup the initial stack and jump to the C world
  *
-- 
2.40.1


