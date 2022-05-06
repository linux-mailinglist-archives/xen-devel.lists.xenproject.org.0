Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC7151D0EB
	for <lists+xen-devel@lfdr.de>; Fri,  6 May 2022 07:53:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.322572.543963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqtB-0002JG-P7; Fri, 06 May 2022 05:52:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 322572.543963; Fri, 06 May 2022 05:52:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nmqtB-0002Go-LB; Fri, 06 May 2022 05:52:29 +0000
Received: by outflank-mailman (input) for mailman id 322572;
 Fri, 06 May 2022 05:52:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CuCn=VO=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1nmqtA-0001gH-8b
 for xen-devel@lists.xenproject.org; Fri, 06 May 2022 05:52:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b5a16f76-cd00-11ec-a406-831a346695d4;
 Fri, 06 May 2022 07:52:27 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBE191063;
 Thu,  5 May 2022 22:52:26 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.24])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7B7DD3FA27;
 Thu,  5 May 2022 22:52:22 -0700 (PDT)
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
X-Inumbo-ID: b5a16f76-cd00-11ec-a406-831a346695d4
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
Subject: [PATCH v2 2/2] xen/common: Use enhanced ASSERT_ALLOC_CONTEXT in xmalloc()
Date: Fri,  6 May 2022 13:52:01 +0800
Message-Id: <20220506055201.999277-3-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506055201.999277-1-Henry.Wang@arm.com>
References: <20220506055201.999277-1-Henry.Wang@arm.com>
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
---
v1 -> v2:
- No changes
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


