Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE07A37FC3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:18:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890009.1299105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCs-0001r8-Sd; Mon, 17 Feb 2025 10:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890009.1299105; Mon, 17 Feb 2025 10:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCs-0001kh-Cd; Mon, 17 Feb 2025 10:18:30 +0000
Received: by outflank-mailman (input) for mailman id 890009;
 Mon, 17 Feb 2025 10:18:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOw1=VI=bounce.vates.tech=bounce-md_30504962.67b30cee.v1-b40b248698934c5e840df52a6849616b@srs-se1.protection.inumbo.net>)
 id 1tjyCq-0008Nl-9s
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:18:28 +0000
Received: from mail178-27.suw51.mandrillapp.com
 (mail178-27.suw51.mandrillapp.com [198.2.178.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 86130cc7-ed18-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:18:25 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-27.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YxJWy5LXQz6CPyQT
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 10:18:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b40b248698934c5e840df52a6849616b; Mon, 17 Feb 2025 10:18:22 +0000
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
X-Inumbo-ID: 86130cc7-ed18-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739787502; x=1740057502;
	bh=zoLqeflgQV7od7E9S7uru8jBtRkAuKD+thEBMZ1CtXE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=AecTorfYV5B4nPZ3WL6xVdqUAe5260IYtLVn1YZyh+DU9ZxczFW6OpyppEJDj6312
	 leSqW+uBvQxhNymD921sBgDOyMTxIT+8bMh3na8GOzfmEbiTMNBH0No5fuddCQl68F
	 2eQFSxwr5eRIfW4D6BzwzI07gC9iubEN44OsmxzMwX0+bWGLqGu0nY79omwkagGPun
	 1lIQVoBWiBPTOZRI5Ama3Ht69EoI/8lnJ5UXShB9Vz4OumZHiCAeMH/4MgDv3Jyllq
	 8pzjlw3OwxFEOuzXFTDPibWkDouJvV/t6mtNYuyYKkSTB57PsuWHqA14guJpmuWQsE
	 hzZ45cfw47Fzg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739787502; x=1740048002; i=teddy.astie@vates.tech;
	bh=zoLqeflgQV7od7E9S7uru8jBtRkAuKD+thEBMZ1CtXE=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BIKXgasbPfGeutyxqRg3EzMJ8Oq3gXx+TBhVeTXFfttneO35gW4OVW/86lEIfhaG0
	 SD+SUGJ7h6dmyBdfAz3zm2Lr6PBmFEZGH8yq/lVp7ODjOJFxYWiTuf0UIhKCcM4eS0
	 tHmvBj2wYr7+/2xD2tWrK8aq/1vzy2OxlbBRP99X8jqKg0J9o1aqLbjEpSlYkew/nb
	 rm18oE5RI9rlcygvQTU5vKg888Ze95ZyKjShwZAlsYyUd1DVekV0lE+YiRftJq+SHs
	 tB+M3SwgRHfOllFUKH+FV/WlWONi5PIaGvYj18E9xqnAN/4iLPN9th6RR5kKzHH/TS
	 Uk8NMlsT1INrQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v6=2009/11]=20x86/iommu:=20Introduce=20IOMMU=20arena?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739787501844
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <19b58d02c32d35bb422df7934da26855da7e3f87.1739785339.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1739785339.git.teddy.astie@vates.tech>
References: <cover.1739785339.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b40b248698934c5e840df52a6849616b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250217:md
Date: Mon, 17 Feb 2025 10:18:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Introduce a new facility that reserves a fixed amount of contiguous
pages and provide a way to allocate them.

It is used to ensure that the guest cannot cause the hypervisor to
OOM with unconstrained allocations by abusing the PV-IOMMU interface.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/arena.h     |  54 +++++++++
 xen/arch/x86/include/asm/iommu.h     |   3 +
 xen/drivers/passthrough/x86/Makefile |   1 +
 xen/drivers/passthrough/x86/arena.c  | 157 +++++++++++++++++++++++++++
 4 files changed, 215 insertions(+)
 create mode 100644 xen/arch/x86/include/asm/arena.h
 create mode 100644 xen/drivers/passthrough/x86/arena.c

diff --git a/xen/arch/x86/include/asm/arena.h b/xen/arch/x86/include/asm/arena.h
new file mode 100644
index 0000000000..7555b100e0
--- /dev/null
+++ b/xen/arch/x86/include/asm/arena.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Simple arena-based page allocator.
+ */
+
+#ifndef __XEN_IOMMU_ARENA_H__
+#define __XEN_IOMMU_ARENA_H__
+
+#include "xen/domain.h"
+#include "xen/atomic.h"
+#include "xen/mm-frame.h"
+#include "xen/types.h"
+
+/**
+ * struct page_arena: Page arena structure
+ */
+struct iommu_arena {
+    /* mfn of the first page of the memory region */
+    mfn_t region_start;
+    /* bitmap of allocations */
+    unsigned long *map;
+
+    /* Order of the arena */
+    unsigned int order;
+
+    /* Used page count */
+    atomic_t used_pages;
+};
+
+/**
+ * Initialize a arena using domheap allocator.
+ * @param [out] arena Arena to allocate
+ * @param [in] domain domain that has ownership of arena pages
+ * @param [in] order order of the arena (power of two of the size)
+ * @param [in] memflags Flags for domheap_alloc_pages()
+ * @return -ENOMEM on arena allocation error, 0 otherwise
+ */
+int iommu_arena_initialize(struct iommu_arena *arena, struct domain *domain,
+                           unsigned int order, unsigned int memflags);
+
+/**
+ * Teardown a arena.
+ * @param [out] arena arena to allocate
+ * @param [in] check check for existing allocations
+ * @return -EBUSY if check is specified
+ */
+int iommu_arena_teardown(struct iommu_arena *arena, bool check);
+
+struct page_info *iommu_arena_allocate_page(struct iommu_arena *arena);
+bool iommu_arena_free_page(struct iommu_arena *arena, struct page_info *page);
+
+#define iommu_arena_size(arena) (1LLU << (arena)->order)
+
+#endif
diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 654a07b9b2..452b98b42d 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -12,6 +12,8 @@
 #include <asm/cache.h>
 #include <asm/processor.h>
 
+#include "arena.h"
+
 #define DEFAULT_DOMAIN_ADDRESS_WIDTH 48
 
 struct g2m_ioport {
@@ -62,6 +64,7 @@ struct arch_iommu
 {
     /* Queue for freeing pages */
     struct page_list_head free_queue;
+    struct iommu_arena pt_arena; /* allocator for non-default contexts */
 
     union {
         /* Intel VT-d */
diff --git a/xen/drivers/passthrough/x86/Makefile b/xen/drivers/passthrough/x86/Makefile
index 75b2885336..1614f3d284 100644
--- a/xen/drivers/passthrough/x86/Makefile
+++ b/xen/drivers/passthrough/x86/Makefile
@@ -1,2 +1,3 @@
 obj-y += iommu.o
+obj-y += arena.o
 obj-$(CONFIG_HVM) += hvm.o
diff --git a/xen/drivers/passthrough/x86/arena.c b/xen/drivers/passthrough/x86/arena.c
new file mode 100644
index 0000000000..984bc4d643
--- /dev/null
+++ b/xen/drivers/passthrough/x86/arena.c
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/**
+ * Simple arena-based page allocator.
+ *
+ * Allocate a large block using alloc_domheam_pages and allocate single pages
+ * using iommu_arena_allocate_page and iommu_arena_free_page functions.
+ *
+ * Concurrent {allocate/free}_page is thread-safe
+ * iommu_arena_teardown during {allocate/free}_page is not thread-safe.
+ *
+ * Written by Teddy Astie <teddy.astie@vates.tech>
+ */
+
+#include <asm/bitops.h>
+#include <asm/page.h>
+#include <xen/atomic.h>
+#include <xen/bug.h>
+#include <xen/config.h>
+#include <xen/mm-frame.h>
+#include <xen/mm.h>
+#include <xen/xmalloc.h>
+
+#include <asm/arena.h>
+
+/* Maximum of scan tries if the bit found not available */
+#define ARENA_TSL_MAX_TRIES 5
+
+int iommu_arena_initialize(struct iommu_arena *arena, struct domain *d,
+                           unsigned int order, unsigned int memflags)
+{
+    struct page_info *page;
+
+    /* TODO: Maybe allocate differently ? */
+    page = alloc_domheap_pages(d, order, memflags);
+
+    if ( !page )
+        return -ENOMEM;
+
+    arena->map = xzalloc_array(unsigned long, BITS_TO_LONGS(1LLU << order));
+    arena->order = order;
+    arena->region_start = page_to_mfn(page);
+
+    _atomic_set(&arena->used_pages, 0);
+    bitmap_zero(arena->map, iommu_arena_size(arena));
+
+    printk(XENLOG_DEBUG "IOMMU: Allocated arena (%llu pages, start=%"PRI_mfn")\n",
+           iommu_arena_size(arena), mfn_x(arena->region_start));
+    return 0;
+}
+
+int iommu_arena_teardown(struct iommu_arena *arena, bool check)
+{
+    BUG_ON(mfn_x(arena->region_start) == 0);
+
+    /* Check for allocations if check is specified */
+    if ( check && (atomic_read(&arena->used_pages) > 0) )
+        return -EBUSY;
+
+    free_domheap_pages(mfn_to_page(arena->region_start), arena->order);
+
+    arena->region_start = _mfn(0);
+    _atomic_set(&arena->used_pages, 0);
+    xfree(arena->map);
+    arena->map = NULL;
+
+    return 0;
+}
+
+struct page_info *iommu_arena_allocate_page(struct iommu_arena *arena)
+{
+    unsigned int index;
+    unsigned int tsl_tries = 0;
+
+    BUG_ON(mfn_x(arena->region_start) == 0);
+
+    if ( atomic_read(&arena->used_pages) == iommu_arena_size(arena) )
+        /* All pages used */
+        return NULL;
+
+    do
+    {
+        index = find_first_zero_bit(arena->map, iommu_arena_size(arena));
+
+        if ( index >= iommu_arena_size(arena) )
+            /* No more free pages */
+            return NULL;
+
+        /*
+         * While there shouldn't be a lot of retries in practice, this loop
+         * *may* run indefinetly if the found bit is never free due to being
+         * overwriten by another CPU core right after. Add a safeguard for
+         * such very rare cases.
+         */
+        tsl_tries++;
+
+        if ( unlikely(tsl_tries == ARENA_TSL_MAX_TRIES) )
+        {
+            printk(XENLOG_ERR "ARENA: Too many TSL retries !");
+            return NULL;
+        }
+
+        /* Make sure that the bit we found is still free */
+    } while ( test_and_set_bit(index, arena->map) );
+
+    atomic_inc(&arena->used_pages);
+
+    return mfn_to_page(mfn_add(arena->region_start, index));
+}
+
+bool iommu_arena_free_page(struct iommu_arena *arena, struct page_info *page)
+{
+    unsigned long index;
+    mfn_t frame;
+
+    if ( !page )
+    {
+        printk(XENLOG_WARNING "IOMMU: Trying to free NULL page");
+        WARN();
+        return false;
+    }
+
+    frame = page_to_mfn(page);
+
+    /* Check if page belongs to our arena */
+    if ( (mfn_x(frame) < mfn_x(arena->region_start))
+        || (mfn_x(frame) >= (mfn_x(arena->region_start) + iommu_arena_size(arena))) )
+    {
+        printk(XENLOG_WARNING
+               "IOMMU: Trying to free outside arena region [mfn=%"PRI_mfn"]",
+               mfn_x(frame));
+        WARN();
+        return false;
+    }
+
+    index = mfn_x(frame) - mfn_x(arena->region_start);
+
+    /* Sanity check in case of underflow. */
+    ASSERT(index < iommu_arena_size(arena));
+
+    if ( !test_and_clear_bit(index, arena->map) )
+    {
+        /*
+         * Bit was free during our arena_free_page, which means that
+         * either this page was never allocated, or we are in a double-free
+         * situation.
+         */
+        printk(XENLOG_WARNING
+               "IOMMU: Freeing non-allocated region (double-free?) [mfn=%"PRI_mfn"]",
+               mfn_x(frame));
+        WARN();
+        return false;
+    }
+
+    atomic_dec(&arena->used_pages);
+
+    return true;
+}
\ No newline at end of file
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

