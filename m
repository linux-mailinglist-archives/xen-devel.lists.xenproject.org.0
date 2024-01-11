Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CDD682B4C9
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 19:34:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.666497.1037181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzsj-0002rY-K9; Thu, 11 Jan 2024 18:34:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 666497.1037181; Thu, 11 Jan 2024 18:34:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNzsj-0002me-GQ; Thu, 11 Jan 2024 18:34:21 +0000
Received: by outflank-mailman (input) for mailman id 666497;
 Thu, 11 Jan 2024 18:34:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rNzsh-0002jy-W4
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 18:34:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNzsh-00047r-MH; Thu, 11 Jan 2024 18:34:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rNzsh-0000gW-EV; Thu, 11 Jan 2024 18:34:19 +0000
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
	bh=wAXytEso6pk4MBo3awrqwDdyXbJvCt8docbSHZABqHw=; b=Rrd687XydKoaX3Greii8U0AVFa
	F7efTkKnbhtt4P3ZvsgB+G1fwdS9hY2I0Ed/vuwerGGekbVgdloiz4tQNnQeC9Ti/wOSMLhcWboWU
	4pMCxiz/EYmUvsi1mJ+aSG8+a/7kcV60S1LRmiqB+DsyhX1mP4H+VVwyOBx5BCzLIg88=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] xen/arm32: head: Rework how the fixmap and early UART mapping are prepared
Date: Thu, 11 Jan 2024 18:34:09 +0000
Message-Id: <20240111183410.45566-2-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240111183410.45566-1-julien@xen.org>
References: <20240111183410.45566-1-julien@xen.org>
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

----

    Changelog since v1:
        * Rebase
        * Move the UART mapping enable_mm_boot_cpu()
---
 xen/arch/arm/arm32/mmu/head.S | 61 ++++++++---------------------------
 1 file changed, 14 insertions(+), 47 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/head.S b/xen/arch/arm/arm32/mmu/head.S
index 4e6395e7876d..a90799ad5451 100644
--- a/xen/arch/arm/arm32/mmu/head.S
+++ b/xen/arch/arm/arm32/mmu/head.S
@@ -165,11 +165,6 @@
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
@@ -197,6 +192,10 @@ create_page_tables:
         add   r5, r5, #PAGE_SIZE            /* r5 := Next table */
 .endr
 
+        /* Map the fixmap into boot_second */
+        mov_w r0, FIXMAP_ADDR(0)
+        create_table_entry boot_second, xen_fixmap, r0, 2
+
         /*
          * Find the size of Xen in pages and multiply by the size of a
          * PTE. This will then be compared in the mapping loop below.
@@ -442,19 +441,20 @@ ENDPROC(enable_secondary_cpu_mm)
 ENTRY(enable_boot_cpu_mm)
         mov   r6, lr
 
+#ifdef CONFIG_EARLY_PRINTK
+        /*
+         * Add the UART mapping to the fixmap so the UART can be used
+         * as the MMU is on. This only need to do done on the boot CPU.
+         */
+        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
+        create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
+#endif
+
         bl    create_page_tables
 
         /* Address in the runtime mapping to jump to after the MMU is enabled */
-        mov_w lr, 1f
-        b     enable_mmu
-1:
         mov   lr, r6
-
-        /*
-         * Prepare the fixmap. The function will return to the virtual address
-         * requested by the caller.
-         */
-        b     setup_fixmap
+        b     enable_mmu
 ENDPROC(enable_boot_cpu_mm)
 
 /*
@@ -503,39 +503,6 @@ remove_temporary_mapping:
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
 /* Fail-stop */
 fail:   PRINT("- Boot failed -\r\n")
 1:      wfe
-- 
2.40.1


