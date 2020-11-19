Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934532B9B1B
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 20:08:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31365.61730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHl-0005cC-4K; Thu, 19 Nov 2020 19:08:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31365.61730; Thu, 19 Nov 2020 19:08:01 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfpHk-0005b1-TV; Thu, 19 Nov 2020 19:08:00 +0000
Received: by outflank-mailman (input) for mailman id 31365;
 Thu, 19 Nov 2020 19:07:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kfpHj-0005ZJ-4f
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHi-0003T0-VT; Thu, 19 Nov 2020 19:07:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kfpHi-0000TE-OH; Thu, 19 Nov 2020 19:07:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHj-0005ZJ-4f
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 19:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=JVCtMkS3vhD4oIjsLKCddPmn6X/R7AsIbb0WSv2njxY=; b=eUfW4TcRvPrmP4Ulje9fZClxy
	3cLEFCVtKsnHLTT9zFmGK5ZsU3AAiuw5tKfLFGZYSr+vzUnvX6eGkqpsh4av2NavyKJz7o43/hHqc
	QGDWkDNI18910ne9fTRfcWcGOiHPsOBkQwAE71wMAkBXg5hNCMF+qtkXn4jAGlypMJjYM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHi-0003T0-VT; Thu, 19 Nov 2020 19:07:58 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=ufe34d9ed68d054.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kfpHi-0000TE-OH; Thu, 19 Nov 2020 19:07:58 +0000
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	Julien Grall <julien.grall@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH RFC 4/6] xen/arm: mm: Allow other mapping size in xen_pt_update_entry()
Date: Thu, 19 Nov 2020 19:07:49 +0000
Message-Id: <20201119190751.22345-5-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119190751.22345-1-julien@xen.org>
References: <20201119190751.22345-1-julien@xen.org>

From: Julien Grall <julien.grall@arm.com>

At the moment, xen_pt_update_entry() only supports mapping at level 3
(i.e 4KB mapping). While this is fine for most of the runtime helper,
the boot code will require to use superpage mapping.

We don't want to allow superpage mapping by default as some of the
callers may expect small mappings (i.e populate_pt_range()) or even
expect to unmap only a part of a superpage.

To keep the code simple, a new flag _PAGE_BLOCK is introduced to
allow the caller to enable superpage mapping.

As the code doesn't support all the combinations, xen_pt_check_entry()
is extended to take into account the cases we don't support when
using block mapping:
    - Replacing a table with a mapping. This may happen if region was
    first mapped with 4KB mapping and then later on replaced with a 2MB
    (or 1GB mapping)
    - Removing/modify a table. This may happen if a caller try to remove a
    region with _PAGE_BLOCK set when it was created without it

Note that the current restriction mean that the caller must ensure that
_PAGE_BLOCK is consistently set/cleared across all the updates on a
given virtual region. This ought to be fine with the expected use-cases.

More rework will be necessary if we wanted to remove the restrictions.

Note that nr_mfns is now marked const as it is used for flushing the
TLBs and we don't want it to be modified.

Signed-off-by: Julien Grall <julien.grall@arm.com>

---

This patch is necessary for upcoming changes in the MM code. I would
like to remove most of the open-coding update of the page-tables as they
are not easy to properly fix/extend. For instance, always mapping
xenheap mapping with 1GB superpage is plain wrong because:
    - RAM regions are not always 1GB aligned (such as on RPI 4) and we
    may end up to map MMIO with cacheable attributes
    - RAM may contain reserved regions should either not be mapped
---
 xen/arch/arm/mm.c          | 87 ++++++++++++++++++++++++++++++--------
 xen/include/asm-arm/page.h |  4 ++
 2 files changed, 73 insertions(+), 18 deletions(-)

diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 59f8a3f15fd1..af0f12b6e6d3 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1060,9 +1060,10 @@ static int xen_pt_next_level(bool read_only, unsigned int level,
 }
 
 /* Sanity check of the entry */
-static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
+static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
+                               unsigned int flags)
 {
-    /* Sanity check when modifying a page. */
+    /* Sanity check when modifying an entry. */
     if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
     {
         /* We don't allow modifying an invalid entry. */
@@ -1072,6 +1073,13 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
             return false;
         }
 
+        /* We don't allow modifying a table entry */
+        if ( !lpae_is_mapping(entry, level) )
+        {
+            mm_printk("Modifying a table entry is not allowed.\n");
+            return false;
+        }
+
         /* We don't allow changing memory attributes. */
         if ( entry.pt.ai != PAGE_AI_MASK(flags) )
         {
@@ -1087,7 +1095,7 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
             return false;
         }
     }
-    /* Sanity check when inserting a page */
+    /* Sanity check when inserting a mapping */
     else if ( flags & _PAGE_PRESENT )
     {
         /* We should be here with a valid MFN. */
@@ -1096,18 +1104,28 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
         /* We don't allow replacing any valid entry. */
         if ( lpae_is_valid(entry) )
         {
-            mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
-                      mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
+            if ( lpae_is_mapping(entry, level) )
+                mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
+                          mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
+            else
+                mm_printk("Trying to replace a table with a mapping.\n");
             return false;
         }
     }
-    /* Sanity check when removing a page. */
+    /* Sanity check when removing a mapping. */
     else if ( (flags & (_PAGE_PRESENT|_PAGE_POPULATE)) == 0 )
     {
         /* We should be here with an invalid MFN. */
         ASSERT(mfn_eq(mfn, INVALID_MFN));
 
-        /* We don't allow removing page with contiguous bit set. */
+        /* We don't allow removing a table */
+        if ( lpae_is_table(entry, level) )
+        {
+            mm_printk("Removing a table is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow removing a mapping with contiguous bit set. */
         if ( entry.pt.contig )
         {
             mm_printk("Removing entry with contiguous bit set is not allowed.\n");
@@ -1126,12 +1144,12 @@ static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int flags)
 }
 
 static int xen_pt_update_entry(mfn_t root, unsigned long virt,
-                               mfn_t mfn, unsigned int flags)
+                               mfn_t mfn, unsigned int page_order,
+                               unsigned int flags)
 {
     int rc;
     unsigned int level;
-    /* We only support 4KB mapping (i.e level 3) for now */
-    unsigned int target = 3;
+    unsigned int target = 3 - (page_order / LPAE_SHIFT);
     lpae_t *table;
     /*
      * The intermediate page tables are read-only when the MFN is not valid
@@ -1186,7 +1204,7 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
     entry = table + offsets[level];
 
     rc = -EINVAL;
-    if ( !xen_pt_check_entry(*entry, mfn, flags) )
+    if ( !xen_pt_check_entry(*entry, mfn, level, flags) )
         goto out;
 
     /* If we are only populating page-table, then we are done. */
@@ -1204,8 +1222,11 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
         {
             pte = mfn_to_xen_entry(mfn, PAGE_AI_MASK(flags));
 
-            /* Third level entries set pte.pt.table = 1 */
-            pte.pt.table = 1;
+            /*
+             * First and second level pages set pte.pt.table = 0, but
+             * third level entries set pte.pt.table = 1.
+             */
+            pte.pt.table = (level == 3);
         }
         else /* We are updating the permission => Copy the current pte. */
             pte = *entry;
@@ -1229,11 +1250,12 @@ static DEFINE_SPINLOCK(xen_pt_lock);
 
 static int xen_pt_update(unsigned long virt,
                          mfn_t mfn,
-                         unsigned long nr_mfns,
+                         const unsigned long nr_mfns,
                          unsigned int flags)
 {
     int rc = 0;
-    unsigned long addr = virt, addr_end = addr + nr_mfns * PAGE_SIZE;
+    unsigned long vfn = paddr_to_pfn(virt);
+    unsigned long left = nr_mfns;
 
     /*
      * For arm32, page-tables are different on each CPUs. Yet, they share
@@ -1265,14 +1287,43 @@ static int xen_pt_update(unsigned long virt,
 
     spin_lock(&xen_pt_lock);
 
-    for ( ; addr < addr_end; addr += PAGE_SIZE )
+    while ( left )
     {
-        rc = xen_pt_update_entry(root, addr, mfn, flags);
+        unsigned int order;
+        unsigned long mask;
+
+        /*
+         * Don't take into account the MFN when removing mapping (i.e
+         * MFN_INVALID) to calculate the correct target order.
+         *
+         * XXX: Support superpage mappings if nr is not aligned to a
+         * superpage size.
+         */
+        mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
+        mask |= vfn | left;
+
+        /*
+         * Always use level 3 mapping unless the caller request block
+         * mapping.
+         */
+        if ( likely(!(flags & _PAGE_BLOCK)) )
+            order = THIRD_ORDER;
+        else if ( !(mask & (BIT(FIRST_ORDER, UL) - 1)) )
+            order = FIRST_ORDER;
+        else if ( !(mask & (BIT(SECOND_ORDER, UL) - 1)) )
+            order = SECOND_ORDER;
+        else
+            order = THIRD_ORDER;
+
+        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, order, flags);
         if ( rc )
             break;
 
+        vfn += 1U << order;
         if ( !mfn_eq(mfn, INVALID_MFN) )
-            mfn = mfn_add(mfn, 1);
+            mfn = mfn_add(mfn, 1U << order);
+
+        left -= (1U << order);
     }
 
     /*
diff --git a/xen/include/asm-arm/page.h b/xen/include/asm-arm/page.h
index 4ea8e97247c8..de096b0968e3 100644
--- a/xen/include/asm-arm/page.h
+++ b/xen/include/asm-arm/page.h
@@ -79,6 +79,7 @@
  * [3:4] Permission flags
  * [5]   Page present
  * [6]   Only populate page tables
+ * [7]   Use any level mapping only (i.e. superpages is allowed)
  */
 #define PAGE_AI_MASK(x) ((x) & 0x7U)
 
@@ -92,6 +93,9 @@
 #define _PAGE_PRESENT    (1U << 5)
 #define _PAGE_POPULATE   (1U << 6)
 
+#define _PAGE_BLOCK_BIT     7
+#define _PAGE_BLOCK         (1U << _PAGE_BLOCK_BIT)
+
 /*
  * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
  * meant to be used outside of this header.
-- 
2.17.1


