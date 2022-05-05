Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E4A51B636
	for <lists+xen-devel@lfdr.de>; Thu,  5 May 2022 04:55:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.321316.542306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmRdJ-0001B6-C9; Thu, 05 May 2022 02:54:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 321316.542306; Thu, 05 May 2022 02:54:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmRdJ-00017V-9Q; Thu, 05 May 2022 02:54:25 +0000
Received: by outflank-mailman (input) for mailman id 321316;
 Thu, 05 May 2022 02:54:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1YwP=VN=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nmRdH-0000cH-RT
 for xen-devel@lists.xenproject.org; Thu, 05 May 2022 02:54:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id aab10dc1-cc1e-11ec-a406-831a346695d4;
 Thu, 05 May 2022 04:54:22 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 668881042;
 Wed,  4 May 2022 19:54:22 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 416D03FA35;
 Wed,  4 May 2022 19:54:20 -0700 (PDT)
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
X-Inumbo-ID: aab10dc1-cc1e-11ec-a406-831a346695d4
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in xmalloc()
Date: Thu,  5 May 2022 10:54:07 +0800
Message-Id: <20220505025407.919988-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220505025407.919988-1-Henry.Wang@arm.com>
References: <20220505025407.919988-1-Henry.Wang@arm.com>
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

Reported-by: Wei Chen <Wei.Chen@arm.com>
Suggested-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Change-Id: Ia463d2241e80e8a78d7dbb5b2318694d3ca5ed67
---
 xen/common/page_alloc.c   | 7 -------
 xen/common/xmalloc_tlsf.c | 2 +-
 xen/include/xen/irq.h     | 7 +++++++
 3 files changed, 8 insertions(+), 8 deletions(-)

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
index d2ad909502..b8f838ae74 100644
--- a/xen/common/xmalloc_tlsf.c
+++ b/xen/common/xmalloc_tlsf.c
@@ -594,7 +594,7 @@ void *_xmalloc(unsigned long size, unsigned long align)
 {
     void *p = NULL;
 
-    ASSERT(!in_irq());
+    ASSERT_ALLOC_CONTEXT();
 
     if ( !size )
         return ZERO_BLOCK_PTR;
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


