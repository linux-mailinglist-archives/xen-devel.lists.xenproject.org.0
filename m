Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0544BD913
	for <lists+xen-devel@lfdr.de>; Mon, 21 Feb 2022 11:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.275991.472049 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pu-0005RU-88; Mon, 21 Feb 2022 10:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 275991.472049; Mon, 21 Feb 2022 10:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nM5pu-0005NJ-0Q; Mon, 21 Feb 2022 10:22:30 +0000
Received: by outflank-mailman (input) for mailman id 275991;
 Mon, 21 Feb 2022 10:22:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nM5ps-0005Ck-8L
 for xen-devel@lists.xenproject.org; Mon, 21 Feb 2022 10:22:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pr-0002BM-W9; Mon, 21 Feb 2022 10:22:27 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nM5pr-00070b-Oo; Mon, 21 Feb 2022 10:22:27 +0000
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
	bh=sFYaVlLq15N1H/anRoXOtrE4yZfgYVYOPXSH6aKnS1c=; b=JwDq/w/csOKozdfgbxUMXi5DOG
	qsRCDVP8kNgM0ZZY1v42hOsAJxCK80gkaDYUgzlchR7Rc/WvhTL1k2Jdx7nr0560Xgq77Y0m07bpk
	92KNHKUdvP9o5WBxr+I/Cm8y5ltfFvdcHHiPgG5ekHlD+0wtfmEZ9JgIeiuAKqyaO+lU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 05/19] xen/arm: mm: Add support for the contiguous bit
Date: Mon, 21 Feb 2022 10:22:04 +0000
Message-Id: <20220221102218.33785-6-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220221102218.33785-1-julien@xen.org>
References: <20220221102218.33785-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

In follow-up patches, we will use xen_pt_update() (or its callers)
to handle large mappings (e.g. frametable, xenheap). They are also
not going to be modified once created.

The page-table entries have an hint to indicate that whether an
entry is contiguous to another 16 entries (assuming 4KB). When the
processor support the hint, one TLB entry will be created per
contiguous region.

For now this is tied to _PAGE_BLOCK. We can untie it in the future
if there are use-cases where we may want to use _PAGE_BLOCK without
setting the contiguous (couldn't think of any yet).

Note that to avoid extra complexity, mappings with the contiguous
bit set cannot be removed. Given the expected use, this restriction
ought to be fine.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - New patch
---
 xen/arch/arm/include/asm/page.h |  4 ++
 xen/arch/arm/mm.c               | 80 ++++++++++++++++++++++++++++++---
 2 files changed, 77 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index 07998df47bac..e7cd62190c7f 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -70,6 +70,7 @@
  * [5]   Page present
  * [6]   Only populate page tables
  * [7]   Superpage mappings is allowed
+ * [8]   Set contiguous bit (internal flag)
  */
 #define PAGE_AI_MASK(x) ((x) & 0x7U)
 
@@ -86,6 +87,9 @@
 #define _PAGE_BLOCK_BIT     7
 #define _PAGE_BLOCK         (1U << _PAGE_BLOCK_BIT)
 
+#define _PAGE_CONTIG_BIT    8
+#define _PAGE_CONTIG        (1U << _PAGE_CONTIG_BIT)
+
 /*
  * _PAGE_DEVICE and _PAGE_NORMAL are convenience defines. They are not
  * meant to be used outside of this header.
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 3af69b396bd1..fd16c1541ce2 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -1237,6 +1237,8 @@ static int xen_pt_update_entry(mfn_t root, unsigned long virt,
         /* Set permission */
         pte.pt.ro = PAGE_RO_MASK(flags);
         pte.pt.xn = PAGE_XN_MASK(flags);
+        /* Set contiguous bit */
+        pte.pt.contig = !!(flags & _PAGE_CONTIG);
     }
 
     write_pte(entry, pte);
@@ -1289,6 +1291,51 @@ static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
      return level;
 }
 
+#define XEN_PT_4K_NR_CONTIG 16
+
+/*
+ * Check whether the contiguous bit can be set. Return the number of
+ * contiguous entry allowed. If not allowed, return 1.
+ */
+static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
+                                        unsigned int level, unsigned long left,
+                                        unsigned int flags)
+{
+    unsigned long nr_contig;
+
+    /*
+     * Allow the contiguous bit to set when the caller requests block
+     * mapping.
+     */
+    if ( !(flags & _PAGE_BLOCK) )
+        return 1;
+
+    /*
+     * We don't allow to remove mapping with the contiguous bit set.
+     * So shortcut the logic and directly return 1.
+     */
+    if ( mfn_eq(mfn, INVALID_MFN) )
+        return 1;
+
+    /*
+     * The number of contiguous entries varies depending on the page
+     * granularity used. The logic below assumes 4KB.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+
+    /*
+     * In order to enable the contiguous bit, we should have enough entries
+     * to map left and both the virtual and physical address should be
+     * aligned to the size of 16 translation tables entries.
+     */
+    nr_contig = BIT(XEN_PT_LEVEL_ORDER(level), UL) * XEN_PT_4K_NR_CONTIG;
+
+    if ( (left < nr_contig) || ((mfn_x(mfn) | vfn) & (nr_contig - 1)) )
+        return 1;
+
+    return XEN_PT_4K_NR_CONTIG;
+}
+
 static DEFINE_SPINLOCK(xen_pt_lock);
 
 static int xen_pt_update(unsigned long virt,
@@ -1322,6 +1369,12 @@ static int xen_pt_update(unsigned long virt,
         return -EINVAL;
     }
 
+    if ( flags & _PAGE_CONTIG )
+    {
+        mm_printk("_PAGE_CONTIG is an internal only flag.\n");
+        return -EINVAL;
+    }
+
     if ( !IS_ALIGNED(virt, PAGE_SIZE) )
     {
         mm_printk("The virtual address is not aligned to the page-size.\n");
@@ -1333,21 +1386,34 @@ static int xen_pt_update(unsigned long virt,
     while ( left )
     {
         unsigned int order, level;
+        unsigned int nr_contig;
+        unsigned int new_flags;
 
         level = xen_pt_mapping_level(vfn, mfn, left, flags);
         order = XEN_PT_LEVEL_ORDER(level);
 
         ASSERT(left >= BIT(order, UL));
 
-        rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level, flags);
-        if ( rc )
-            break;
+        /*
+         * Check if we can set the contiguous mapping and update the
+         * flags accordingly.
+         */
+        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
+        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
 
-        vfn += 1U << order;
-        if ( !mfn_eq(mfn, INVALID_MFN) )
-            mfn = mfn_add(mfn, 1U << order);
+        for ( ; nr_contig > 0; nr_contig-- )
+        {
+            rc = xen_pt_update_entry(root, pfn_to_paddr(vfn), mfn, level,
+                                     new_flags);
+            if ( rc )
+                break;
 
-        left -= (1U << order);
+            vfn += 1U << order;
+            if ( !mfn_eq(mfn, INVALID_MFN) )
+                mfn = mfn_add(mfn, 1U << order);
+
+            left -= (1U << order);
+        }
     }
 
     /*
-- 
2.32.0


