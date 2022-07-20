Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9E157BE01
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 20:45:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372160.604057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEh6-0004s7-SQ; Wed, 20 Jul 2022 18:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372160.604057; Wed, 20 Jul 2022 18:45:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEEh6-0004ob-MI; Wed, 20 Jul 2022 18:45:12 +0000
Received: by outflank-mailman (input) for mailman id 372160;
 Wed, 20 Jul 2022 18:45:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oEEh4-0004S6-Pi
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 18:45:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEh4-00078a-L2; Wed, 20 Jul 2022 18:45:10 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oEEh4-000309-DV; Wed, 20 Jul 2022 18:45:10 +0000
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
	bh=W88wa027woW8KL9i8JFI4zNWkFVBWQcBIx2bW2nUgSg=; b=a/P6a7Z+WG8XJpD3Cq+j93KA8M
	vIdqaLI32/+6exvX4FfXD8BM1D7Qi1ZwpdZc2ilIu+WHj0/RNPvNY8li+2zGmTI5es1O1fdoyxqel
	9c+3gB4d/sgz0vnviU/8Kcn+IooE9skcuHelxaAHL3iFBA1k71EEPXNfuJqU+g+QMwI0=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Michal Orzel <michal.orzel@arm.com>
Subject: [PATCH v2 5/5] xen/arm: mm: Reduce the area that xen_second covers
Date: Wed, 20 Jul 2022 19:44:59 +0100
Message-Id: <20220720184459.51582-6-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220720184459.51582-1-julien@xen.org>
References: <20220720184459.51582-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, xen_second is used to cover the first 2GB of the
virtual address space. With the recent rework of the page-tables,
only the first 1GB region (where Xen resides) is effectively used.

In addition to that, I would like to reshuffle the memory layout.
So Xen mappings may not be anymore in the first 2GB of the virtual
address space.

Therefore, rework xen_second so it only covers the 1GB region where
Xen will reside.

With this change, xen_second doesn't cover anymore the xenheap area
on arm32. So, we first need to add memory to the boot allocator before
setting up the xenheap mappings.

Take the opportunity to update the comments on top of xen_fixmap and
xen_xenmap.

Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@arm.com>

----
    Changes in v2:
        - Add Michal's reviewed-by
---
 xen/arch/arm/mm.c    | 32 +++++++++++---------------------
 xen/arch/arm/setup.c | 13 +++++++++++--
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index ad26ad740308..3d2c046bbb5c 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -116,17 +116,14 @@ static DEFINE_PAGE_TABLE(cpu0_pgtable);
 #endif
 
 /* Common pagetable leaves */
-/* Second level page tables.
- *
- * The second-level table is 2 contiguous pages long, and covers all
- * addresses from 0 to 0x7fffffff. Offsets into it are calculated
- * with second_linear_offset(), not second_table_offset().
- */
-static DEFINE_PAGE_TABLES(xen_second, 2);
-/* First level page table used for fixmap */
+/* Second level page table used to cover Xen virtual address space */
+static DEFINE_PAGE_TABLE(xen_second);
+/* Third level page table used for fixmap */
 DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
-/* First level page table used to map Xen itself with the XN bit set
- * as appropriate. */
+/*
+ * Third level page table used to map Xen itself with the XN bit set
+ * as appropriate.
+ */
 static DEFINE_PAGE_TABLE(xen_xenmap);
 
 /* Non-boot CPUs use this to find the correct pagetables. */
@@ -168,7 +165,6 @@ static void __init __maybe_unused build_assertions(void)
     BUILD_BUG_ON(zeroeth_table_offset(XEN_VIRT_START));
 #endif
     BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
-    BUILD_BUG_ON(second_linear_offset(XEN_VIRT_START) >= XEN_PT_LPAE_ENTRIES);
 #ifdef CONFIG_DOMAIN_PAGE
     BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
 #endif
@@ -482,14 +478,10 @@ void __init setup_pagetables(unsigned long boot_phys_offset)
     p = (void *) cpu0_pgtable;
 #endif
 
-    /* Initialise first level entries, to point to second level entries */
-    for ( i = 0; i < 2; i++)
-    {
-        p[i] = pte_of_xenaddr((uintptr_t)(xen_second +
-                                          i * XEN_PT_LPAE_ENTRIES));
-        p[i].pt.table = 1;
-        p[i].pt.xn = 0;
-    }
+    /* Map xen second level page-table */
+    p[0] = pte_of_xenaddr((uintptr_t)(xen_second));
+    p[0].pt.table = 1;
+    p[0].pt.xn = 0;
 
     /* Break up the Xen mapping into 4k pages and protect them separately. */
     for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
@@ -618,8 +610,6 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
 
     /* Record where the xenheap is, for translation routines. */
     xenheap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
-    xenheap_mfn_start = _mfn(base_mfn);
-    xenheap_mfn_end = _mfn(base_mfn + nr_mfns);
 }
 #else /* CONFIG_ARM_64 */
 void __init setup_xenheap_mappings(unsigned long base_mfn,
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 068e84b10335..500307edc08d 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -774,11 +774,20 @@ static void __init setup_mm(void)
            opt_xenheap_megabytes ? ", from command-line" : "");
     printk("Dom heap: %lu pages\n", domheap_pages);
 
-    setup_xenheap_mappings((e >> PAGE_SHIFT) - xenheap_pages, xenheap_pages);
+    /*
+     * We need some memory to allocate the page-tables used for the
+     * xenheap mappings. So populate the boot allocator first.
+     *
+     * This requires us to set xenheap_mfn_{start, end} first so the Xenheap
+     * region can be avoided.
+     */
+    xenheap_mfn_start = _mfn((e >> PAGE_SHIFT) - xenheap_pages);
+    xenheap_mfn_end = mfn_add(xenheap_mfn_start, xenheap_pages);
 
-    /* Add non-xenheap memory */
     populate_boot_allocator();
 
+    setup_xenheap_mappings(mfn_x(xenheap_mfn_start), xenheap_pages);
+
     /* Frame table covers all of RAM region, including holes */
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
-- 
2.32.0


