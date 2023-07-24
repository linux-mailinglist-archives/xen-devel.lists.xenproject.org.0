Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC2675ECBC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 09:47:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568440.887746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqHM-0000sy-R8; Mon, 24 Jul 2023 07:46:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568440.887746; Mon, 24 Jul 2023 07:46:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNqHM-0000rJ-NT; Mon, 24 Jul 2023 07:46:52 +0000
Received: by outflank-mailman (input) for mailman id 568440;
 Mon, 24 Jul 2023 07:46:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ixEc=DK=bugseng.com=federico.serafini@srs-se1.protection.inumbo.net>)
 id 1qNqHL-0000rD-Sd
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 07:46:51 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3e50ff9a-29f6-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 09:46:48 +0200 (CEST)
Received: from Dell.bugseng.com (unknown [37.162.140.144])
 by support.bugseng.com (Postfix) with ESMTPSA id DFBA84EE0737;
 Mon, 24 Jul 2023 09:46:46 +0200 (CEST)
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
X-Inumbo-ID: 3e50ff9a-29f6-11ee-8612-37d641c3527e
From: Federico Serafini <federico.serafini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Federico Serafini <federico.serafini@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v2] xen/arm/atomic: change parameter name in atomic_cmpxchg() definition
Date: Mon, 24 Jul 2023 09:44:42 +0200
Message-Id: <a45f6a84f3c50a694e0f55042ef1b2f9ad9ac57d.1690184136.git.federico.serafini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change parameter name from 'ptr' to 'v' in the function definition thus
addressing violations of MISRA C:2012 Rule 8.3: "All declarations of an
object or function shall use the same names and type qualifiers".

No functional changes.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
---
Changes in v2:
  - added arm tag;
  - propagated change to arm32.
---
 xen/arch/arm/include/asm/arm32/atomic.h | 8 ++++----
 xen/arch/arm/include/asm/arm64/atomic.h | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/atomic.h b/xen/arch/arm/include/asm/arm32/atomic.h
index 2832a72792..33f9e73b19 100644
--- a/xen/arch/arm/include/asm/arm32/atomic.h
+++ b/xen/arch/arm/include/asm/arm32/atomic.h
@@ -113,13 +113,13 @@ static inline void atomic_and(int m, atomic_t *v)
 	: "cc");
 }
 
-static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 {
 	int oldval;
 	unsigned long res;
 
 	smp_mb();
-	prefetchw(&ptr->counter);
+	prefetchw(&v->counter);
 
 	do {
 		__asm__ __volatile__("@ atomic_cmpxchg\n"
@@ -127,8 +127,8 @@ static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
 		"mov	%0, #0\n"
 		"teq	%1, %4\n"
 		"strexeq %0, %5, [%3]\n"
-		    : "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
-		    : "r" (&ptr->counter), "Ir" (old), "r" (new)
+		    : "=&r" (res), "=&r" (oldval), "+Qo" (v->counter)
+		    : "r" (&v->counter), "Ir" (old), "r" (new)
 		    : "cc");
 	} while (res);
 
diff --git a/xen/arch/arm/include/asm/arm64/atomic.h b/xen/arch/arm/include/asm/arm64/atomic.h
index 2d42567866..4460165295 100644
--- a/xen/arch/arm/include/asm/arm64/atomic.h
+++ b/xen/arch/arm/include/asm/arm64/atomic.h
@@ -105,7 +105,7 @@ static inline void atomic_and(int m, atomic_t *v)
 	: "Ir" (m));
 }
 
-static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
 {
 	unsigned long tmp;
 	int oldval;
@@ -119,7 +119,7 @@ static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
 "	stxr	%w0, %w4, %2\n"
 "	cbnz	%w0, 1b\n"
 "2:"
-	: "=&r" (tmp), "=&r" (oldval), "+Q" (ptr->counter)
+	: "=&r" (tmp), "=&r" (oldval), "+Q" (v->counter)
 	: "Ir" (old), "r" (new)
 	: "cc");
 
-- 
2.34.1


