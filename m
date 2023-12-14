Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B06812FBC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 13:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654520.1021492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWH-0001DG-Sw; Thu, 14 Dec 2023 12:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654520.1021492; Thu, 14 Dec 2023 12:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDkWH-0001AS-H2; Thu, 14 Dec 2023 12:08:49 +0000
Received: by outflank-mailman (input) for mailman id 654520;
 Thu, 14 Dec 2023 12:08:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vWU9=HZ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1rDkWF-0000tI-VF
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 12:08:47 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87e99b2e-9a79-11ee-9b0f-b553b5be7939;
 Thu, 14 Dec 2023 13:08:45 +0100 (CET)
Received: from beta.station (net-37-182-35-120.cust.vodafonedsl.it
 [37.182.35.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 39B574EE0744;
 Thu, 14 Dec 2023 13:08:45 +0100 (CET)
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
X-Inumbo-ID: 87e99b2e-9a79-11ee-9b0f-b553b5be7939
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [PATCH 1/9] xen/arm64: address violations of MISRA C:2012 Rule 11.8
Date: Thu, 14 Dec 2023 13:07:43 +0100
Message-Id: <b29e28544eb7772c3df633b176b9698e0ee9ae88.1702555387.git.maria.celeste.cesario@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
References: <cover.1702555386.git.maria.celeste.cesario@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 11.8 whose
headline states:
"A conversion shall not remove any const, volatile or _Atomic qualification
from the type pointed to by a pointer".

Add volatile qualifiers missing in casts.
Arguments p and ptr are originally volatile-qualified.
There's no reason to drop the qualifiers.
No functional change.

Signed-off-by: Maria Celeste Cesario  <maria.celeste.cesario@bugseng.com>
Signed-off-by: Simone Ballarin  <simone.ballarin@bugseng.com>
---
 xen/arch/arm/arm64/lib/bitops.c          |  6 ++++--
 xen/arch/arm/include/asm/arm64/cmpxchg.h | 10 +++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/arm64/lib/bitops.c b/xen/arch/arm/arm64/lib/bitops.c
index 20e3f3d6ce..275a780329 100644
--- a/xen/arch/arm/arm64/lib/bitops.c
+++ b/xen/arch/arm/arm64/lib/bitops.c
@@ -32,7 +32,8 @@
 static always_inline bool int_##name(int nr, volatile void *p, bool timeout,\
                                      unsigned int max_try)                  \
 {                                                                           \
-    volatile uint32_t *ptr = (uint32_t *)p + BITOP_WORD((unsigned int)nr);  \
+    volatile uint32_t *ptr = (volatile uint32_t *)p +                       \
+                             BITOP_WORD((unsigned int)nr);                  \
     const uint32_t mask = BITOP_MASK((unsigned int)nr);                     \
     unsigned long res, tmp;                                                 \
                                                                             \
@@ -67,7 +68,8 @@ bool name##_timeout(int nr, volatile void *p, unsigned int max_try)         \
 static always_inline bool int_##name(int nr, volatile void *p, int *oldbit, \
                                      bool timeout, unsigned int max_try)    \
 {                                                                           \
-    volatile uint32_t *ptr = (uint32_t *)p + BITOP_WORD((unsigned int)nr);  \
+    volatile uint32_t *ptr = (volatile uint32_t *)p +                       \
+                             BITOP_WORD((unsigned int)nr);                  \
     unsigned int bit = (unsigned int)nr % BITOP_BITS_PER_WORD;              \
     const uint32_t mask = BITOP_MASK(bit);                                  \
     unsigned long res, tmp;                                                 \
diff --git a/xen/arch/arm/include/asm/arm64/cmpxchg.h b/xen/arch/arm/include/asm/arm64/cmpxchg.h
index dbfaf91567..031fa6d92a 100644
--- a/xen/arch/arm/include/asm/arm64/cmpxchg.h
+++ b/xen/arch/arm/include/asm/arm64/cmpxchg.h
@@ -13,7 +13,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 		"1:	ldxrb	%w0, %2\n"
 		"	stlxrb	%w1, %w3, %2\n"
 		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr)
+			: "=&r" (ret), "=&r" (tmp), "+Q" (*(volatile u8 *)ptr)
 			: "r" (x)
 			: "memory");
 		break;
@@ -22,7 +22,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 		"1:	ldxrh	%w0, %2\n"
 		"	stlxrh	%w1, %w3, %2\n"
 		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr)
+			: "=&r" (ret), "=&r" (tmp), "+Q" (*(volatile u16 *)ptr)
 			: "r" (x)
 			: "memory");
 		break;
@@ -31,7 +31,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 		"1:	ldxr	%w0, %2\n"
 		"	stlxr	%w1, %w3, %2\n"
 		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr)
+			: "=&r" (ret), "=&r" (tmp), "+Q" (*(volatile u32 *)ptr)
 			: "r" (x)
 			: "memory");
 		break;
@@ -40,7 +40,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 		"1:	ldxr	%0, %2\n"
 		"	stlxr	%w1, %3, %2\n"
 		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr)
+			: "=&r" (ret), "=&r" (tmp), "+Q" (*(volatile u64 *)ptr)
 			: "r" (x)
 			: "memory");
 		break;
@@ -82,7 +82,7 @@ static inline bool __cmpxchg_case_##name(volatile void *ptr,		\
 		"	stxr" #sz "	%w0, %" #w "4, %2\n"		\
 		"1:\n"							\
 		: "=&r" (res), "=&r" (oldval),				\
-		  "+Q" (*(unsigned long *)ptr)				\
+		  "+Q" (*(volatile unsigned long *)ptr)	\
 		: "Ir" (*old), "r" (new)				\
 		: "cc");						\
 									\
-- 
2.40.0


