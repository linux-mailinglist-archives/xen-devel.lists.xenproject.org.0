Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A57BB649BE2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 11:17:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459394.717129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsR-0006jM-DM; Mon, 12 Dec 2022 10:17:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459394.717129; Mon, 12 Dec 2022 10:17:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fsR-0006gq-8S; Mon, 12 Dec 2022 10:17:39 +0000
Received: by outflank-mailman (input) for mailman id 459394;
 Mon, 12 Dec 2022 10:17:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fsP-0006fr-Mc
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 10:17:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fsP-0002CL-7f; Mon, 12 Dec 2022 10:17:37 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fXH-0001lz-J1; Mon, 12 Dec 2022 09:55:47 +0000
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
	bh=uoxt9zlWYusSEXWO/hbUttfjlw2K0HtdHIJ5N33p0QI=; b=Kh+IPM0V6DxDeapnZnbGpD+TRw
	edIel+cA6MF+7wPFXfTSyJKAQy6eBnuqOrBtBDQa1Yr8U6len2K9Q5Z6pZCtGO++vTNoHaqPDc9PD
	+iuQQEH57LCSciENmZQtYMtwFGFaxSq36wUMd+LqkNAD0/P4/SIovqkNFpKMG9EdANUg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 18/18] xen/arm64: mm: Rework switch_ttbr()
Date: Mon, 12 Dec 2022 09:55:23 +0000
Message-Id: <20221212095523.52683-19-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, switch_ttbr() is switching the TTBR whilst the MMU is
still on.

Switching TTBR is like replacing existing mappings with new ones. So
we need to follow the break-before-make sequence.

In this case, it means the MMU needs to be switched off while the
TTBR is updated. In order to disable the MMU, we need to first
jump to an identity mapping.

Rename switch_ttbr() to switch_ttbr_id() and create an helper on
top to temporary map the identity mapping and call switch_ttbr()
via the identity address.

switch_ttbr_id() is now reworked to temporarily turn off the MMU
before updating the TTBR.

We also need to make sure the helper switch_ttbr() is part of the
identity mapping. So move _end_boot past it.

The arm32 code will use a different approach. So this issue is for now
only resolved on arm64.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---

    Changes in v2:
        - Remove the arm32 changes. This will be addressed differently
        - Re-instate the instruct cache flush. This is not strictly
          necessary but kept it for safety.
        - Use "dsb ish"  rather than "dsb sy".

    TODO:
        * Handle the case where the runtime Xen is loaded at a different
          position for cache coloring. This will be dealt separately.
---
 xen/arch/arm/arm64/head.S     | 50 +++++++++++++++++++++++------------
 xen/arch/arm/arm64/mm.c       | 39 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/mm.h |  2 ++
 xen/arch/arm/mm.c             | 14 +++++-----
 4 files changed, 82 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 663f5813b12e..1f69864492b6 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -816,30 +816,46 @@ ENDPROC(fail)
  * Switch TTBR
  *
  * x0    ttbr
- *
- * TODO: This code does not comply with break-before-make.
  */
-ENTRY(switch_ttbr)
-        dsb   sy                     /* Ensure the flushes happen before
-                                      * continuing */
-        isb                          /* Ensure synchronization with previous
-                                      * changes to text */
-        tlbi   alle2                 /* Flush hypervisor TLB */
-        ic     iallu                 /* Flush I-cache */
-        dsb    sy                    /* Ensure completion of TLB flush */
+ENTRY(switch_ttbr_id)
+        /* 1) Ensure any previous read/write have completed */
+        dsb    ish
+        isb
+
+        /* 2) Turn off MMU */
+        mrs    x1, SCTLR_EL2
+        bic    x1, x1, #SCTLR_Axx_ELx_M
+        msr    SCTLR_EL2, x1
+        isb
+
+        /*
+         * 3) Flush the TLBs.
+         * See asm/arm64/flushtlb.h for the explanation of the sequence.
+         */
+        dsb   nshst
+        tlbi  alle2
+        dsb   nsh
+        isb
+
+        /* 4) Update the TTBR */
+        msr   TTBR0_EL2, x0
         isb
 
-        msr    TTBR0_EL2, x0
+        /*
+         * 5) Flush I-cache
+         * This should not be necessary but it is kept for safety.
+         */
+        ic     iallu
+        isb
 
-        isb                          /* Ensure synchronization with previous
-                                      * changes to text */
-        tlbi   alle2                 /* Flush hypervisor TLB */
-        ic     iallu                 /* Flush I-cache */
-        dsb    sy                    /* Ensure completion of TLB flush */
+        /* 5) Turn on the MMU */
+        mrs   x1, SCTLR_EL2
+        orr   x1, x1, #SCTLR_Axx_ELx_M  /* Enable MMU */
+        msr   SCTLR_EL2, x1
         isb
 
         ret
-ENDPROC(switch_ttbr)
+ENDPROC(switch_ttbr_id)
 
 #ifdef CONFIG_EARLY_PRINTK
 /*
diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mm.c
index 9eaf545ea9dd..2ede4e75ae33 100644
--- a/xen/arch/arm/arm64/mm.c
+++ b/xen/arch/arm/arm64/mm.c
@@ -31,6 +31,15 @@ static void __init prepare_boot_identity_mapping(void)
     lpae_t pte;
     DECLARE_OFFSETS(id_offsets, id_addr);
 
+    /*
+     * We will be re-using the boot ID tables. They may not have been
+     * zeroed but they should be unlinked. So it is fine to use
+     * clear_page().
+     */
+    clear_page(boot_first_id);
+    clear_page(boot_second_id);
+    clear_page(boot_third_id);
+
     if ( id_offsets[0] != 0 )
         panic("Cannot handled ID mapping above 512GB\n");
 
@@ -111,6 +120,36 @@ void update_identity_mapping(bool enable)
     BUG_ON(rc);
 }
 
+extern void switch_ttbr_id(uint64_t ttbr);
+
+typedef void (switch_ttbr_fn)(uint64_t ttbr);
+
+void __init switch_ttbr(uint64_t ttbr)
+{
+    vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
+    switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
+    lpae_t pte;
+
+    /* Enable the identity mapping in the boot page tables */
+    update_identity_mapping(true);
+    /* Enable the identity mapping in the runtime page tables */
+    pte = pte_of_xenaddr((vaddr_t)switch_ttbr_id);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+    pte.pt.ro = 1;
+    write_pte(&xen_third_id[third_table_offset(id_addr)], pte);
+
+    /* Switch TTBR */
+    fn(ttbr);
+
+    /*
+     * Disable the identity mapping in the runtime page tables.
+     * Note it is not necessary to disable it in the boot page tables
+     * because they are not going to be used by this CPU anymore.
+     */
+    update_identity_mapping(false);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 68adcac9fa8d..bff6923f3ea9 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -196,6 +196,8 @@ extern unsigned long total_pages;
 extern void setup_pagetables(unsigned long boot_phys_offset);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
+/* Switch to a new root page-tables */
+extern void switch_ttbr(uint64_t ttbr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
 /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 39e0d9e03c9c..cf23ae02d1b7 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -476,8 +476,6 @@ static void xen_pt_enforce_wnx(void)
     flush_xen_tlb_local();
 }
 
-extern void switch_ttbr(uint64_t ttbr);
-
 /* Clear a translation table and clean & invalidate the cache */
 static void clear_table(void *table)
 {
@@ -550,13 +548,17 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
 #endif
 
-    switch_ttbr(ttbr);
-
-    xen_pt_enforce_wnx();
-
+    /*
+     * This needs to be setup first so switch_ttbr() can enable the
+     * identity mapping.
+     */
 #ifdef CONFIG_ARM_32
     per_cpu(xen_pgtable, 0) = cpu0_pgtable;
 #endif
+
+    switch_ttbr(ttbr);
+
+    xen_pt_enforce_wnx();
 }
 
 static void clear_boot_pagetables(void)
-- 
2.38.1


