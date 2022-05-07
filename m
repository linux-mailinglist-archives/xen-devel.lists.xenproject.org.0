Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C58E051E3B3
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 04:55:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323539.545273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnAb3-0004WV-QK; Sat, 07 May 2022 02:55:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323539.545273; Sat, 07 May 2022 02:55:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nnAb3-0004TM-MJ; Sat, 07 May 2022 02:55:05 +0000
Received: by outflank-mailman (input) for mailman id 323539;
 Sat, 07 May 2022 02:55:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7OHR=VP=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nnAb2-0003pQ-Iu
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 02:55:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 17b6c4e7-cdb1-11ec-a406-831a346695d4;
 Sat, 07 May 2022 04:55:03 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD24F14BF;
 Fri,  6 May 2022 19:55:02 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 4D3233F800;
 Fri,  6 May 2022 19:54:58 -0700 (PDT)
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
X-Inumbo-ID: 17b6c4e7-cdb1-11ec-a406-831a346695d4
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Wei Chen <wei.chen@arm.com>,
	Henry Wang <henry.wang@arm.com>,
	Wei Chen <Wei.Chen@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in xmalloc()
Date: Sat,  7 May 2022 10:54:34 +0800
Message-Id: <20220507025434.1063710-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220507025434.1063710-1-Henry.Wang@arm.com>
References: <20220507025434.1063710-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xmalloc() will use a pool for allocation smaller than a page.
The pool is extended only when there are no more space. At which
point, alloc_xenheap_pages() is called to add more memory.

xmalloc() must be protected by ASSERT_ALLOC_CONTEXT. It should not
rely on pool expanding to trigger the ASSERT_ALLOC_CONTEXT in
alloc_xenheap_pages(). Hence, this commit moves the definition of
ASSERT_ALLOC_CONTEXT to header and uses the ASSERT_ALLOC_CONTEXT
to replace the original assertion in xmalloc().

For consistency, the same assertion should be used in xfree(),
and the position of the assertion should be at the beginning of
the xfree().

Also take the opportunity to enhance the non-static functions
xmem_pool_{alloc,free}() with the same assertion so that future
callers of these two functions can be benefited.

Reported-by: Wei Chen <Wei.Chen@arm.com>
Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v2 -> v3:
- Add ASSERT_ALLOC_CONTEXT in xmem_pool_{alloc,free}()
- Also change the assertion in xfree to ASSERT_ALLOC_CONTEXT and
move the position of assertion to the beginning of the function.
v1 -> v2:
- No changes
---
 xen/common/page_alloc.c   |  7 -------
 xen/common/xmalloc_tlsf.c | 10 +++++++---
 xen/include/xen/irq.h     |  7 +++++++
 3 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e866e0d864..ea59cd1a4a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -162,13 +162,6 @@
 static char __initdata opt_badpage[100] = "";
 string_param("badpage", opt_badpage);
 
-/*
- * Heap allocations may need TLB flushes which may require IRQs to be
- * enabled (except when only 1 PCPU is online).
- */
-#define ASSERT_ALLOC_CONTEXT() \
-    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))
-
 /*
  * no-bootscrub -> Free pages are not zeroed during boot.
  */
diff --git a/xen/common/xmalloc_tlsf.c b/xen/common/xmalloc_tlsf.c
index d2ad909502..75bdf18c4e 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -378,6 +378,8 @@ void *xmem_pool_alloc(unsigned long size, struct xmem_pool *pool)
     int fl, sl;
     unsigned long tmp_size;
 
+    ASSERT_ALLOC_CONTEXT();
+
     if ( size < MIN_BLOCK_SIZE )
         size = MIN_BLOCK_SIZE;
     else
@@ -456,6 +458,8 @@ void xmem_pool_free(void *ptr, struct xmem_pool *pool)
     struct bhdr *b, *tmp_b;
     int fl = 0, sl = 0;
 
+    ASSERT_ALLOC_CONTEXT();
+
     if ( unlikely(ptr == NULL) )
         return;
 
@@ -594,7 +598,7 @@ void *_xmalloc(unsigned long size, unsigned long align)
 {
     void *p = NULL;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( !size )
         return ZERO_BLOCK_PTR;
@@ -697,11 +701,11 @@ void *_xrealloc(void *ptr, unsigned long size, unsigned long align)
 
 void xfree(void *p)
 {
+    ASSERT_ALLOC_CONTEXT();
+
     if ( p == NULL || p == ZERO_BLOCK_PTR )
         return;
 
-    ASSERT(!in_irq());
-
     if ( !((unsigned long)p & (PAGE_SIZE - 1)) )
     {
         unsigned long size = PFN_ORDER(virt_to_page(p));
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index d8beadd16b..300625e56d 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -10,6 +10,13 @@
 #include <asm/hardirq.h>
 #include <public/event_channel.h>
 
+/*
+ * Heap allocations may need TLB flushes which may require IRQs to be
+ * enabled (except when only 1 PCPU is online).
+ */
+#define ASSERT_ALLOC_CONTEXT() \
+    ASSERT(!in_irq() && (local_irq_is_enabled() || num_online_cpus() <= 1))
+
 struct irqaction {
     void (*handler)(int, void *, struct cpu_user_regs *);
     const char *name;
-- 
2.25.1


