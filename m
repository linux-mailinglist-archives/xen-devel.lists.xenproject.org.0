Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C472A868C
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:57:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20055.45685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRi-0006uw-Ue; Thu, 05 Nov 2020 18:57:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20055.45685; Thu, 05 Nov 2020 18:57:18 +0000
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
	id 1kakRi-0006u1-Pz; Thu, 05 Nov 2020 18:57:18 +0000
Received: by outflank-mailman (input) for mailman id 20055;
 Thu, 05 Nov 2020 18:57:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kakRg-0006gr-O6
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:16 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d03e226e-0ae6-4cb5-b00d-74f4f27c7b7b;
 Thu, 05 Nov 2020 18:57:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w14so2987085wrs.9
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:10 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 10:57:08 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kakRg-0006gr-O6
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:16 +0000
X-Inumbo-ID: d03e226e-0ae6-4cb5-b00d-74f4f27c7b7b
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d03e226e-0ae6-4cb5-b00d-74f4f27c7b7b;
	Thu, 05 Nov 2020 18:57:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id w14so2987085wrs.9
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GnhkvWFpWDOq5MdCwowKxEgDQKGXysmyNosoeceNYd4=;
        b=oFwB6g/WwFFvWGjiqHwJln484BrGqoXtl9CsN/D367voX5UFdMBC8xgWVFybdWowDl
         Ltm++Yke4FSVdXQGMo2yGSfzk96atMhyNG1PVILi90JE9Jl+cScm8LVAil6bDoro5n1Q
         hcZzVQRwJ0WFgfy4p9wBdHzHByr2VoA+WhVcxvPnT4e8Q2RvX3R7RHATI8Gbd4nbJZee
         ZE1gicQorTqjPJiy9Fcr+TqB0xfuJdwvJW3o4mxuX2lDMUexibYf7yeKIdeMi/0LJSLY
         W5WfuSxLNRcTiZ06QSSFuR3bJq+7GlWgeCooYWvFxUPzTcB4KAkUHW0YIIStAAMXXqpX
         v30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GnhkvWFpWDOq5MdCwowKxEgDQKGXysmyNosoeceNYd4=;
        b=YB+ce3UuciavU/kodh3gauS7Vj9dlB76CzXFefXap42+miM1cXuWrYpMYupDd5Jc8d
         BJvVVpxGBuKEJoKEr3jvRr/iyWcMqbuHy7hTFwIIQ1D6v73R2tWb2pP29Le6j+s6uFLl
         yFNmr1C9+JiI1BIe4vK38RlouX5SNjBo6MNUIpgh2MCYFBpCdo+BH5NxKOBDrGN+3Ak9
         B+URZdJV6/rXcFK9D7EEjuZ8q683+1pGr7BqYFF/abxIJgDa5daxXyVffcDDNf5VkFBF
         k0Kc/uqggvcXA14FnNXavmR0CZyQHDzblQNnj7qFCGJI12ETW0IvBTgR6NGCmAxXSkr/
         kngg==
X-Gm-Message-State: AOAM532TiraOvNim2PEGFWbCrB+v40JBhu+56ijDvuYioX9+/iB4SPbv
	hv6Zmky27FgBwLKCnRLPICcQ//nnzM4=
X-Google-Smtp-Source: ABdhPJzFU2zN+NquNgaFKhweu17Rce7BEBgHZuLvIFeAbYvdnCHCQ4tb5zRoi2NGO0VlGup7gAYNqw==
X-Received: by 2002:adf:e9c6:: with SMTP id l6mr4600491wrn.257.1604602629112;
        Thu, 05 Nov 2020 10:57:09 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 10:57:08 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Ash Wilding <ash.j.wilding@gmail.com>
Subject: [RFC PATCH 5/6] xen/arm32: Port Linux LL/SC atomics helpers to Xen
Date: Thu,  5 Nov 2020 18:56:02 +0000
Message-Id: <20201105185603.24149-6-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201105185603.24149-1-ash.j.wilding@gmail.com>
References: <20201105185603.24149-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch ports Linux's arm32 LL/SC atomics helpers to Xen.

The opening comment of each header file details the changes made to
that file while porting it to Xen.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm32/atomic.h  | 261 ++++++++++--------
 xen/include/asm-arm/arm32/cmpxchg.h | 403 ++++++++++++++++++----------
 xen/include/asm-arm/arm32/system.h  |   2 +-
 3 files changed, 413 insertions(+), 253 deletions(-)

diff --git a/xen/include/asm-arm/arm32/atomic.h b/xen/include/asm-arm/arm32/atomic.h
index 2832a72792..544a4ba492 100644
--- a/xen/include/asm-arm/arm32/atomic.h
+++ b/xen/include/asm-arm/arm32/atomic.h
@@ -1,124 +1,118 @@
 /*
- *  arch/arm/include/asm/atomic.h
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
  *
- *  Copyright (C) 1996 Russell King.
- *  Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * Summary of changes:
+ * 		- Drop redundant includes and redirect others to Xen equivalents
+ * 		- Rename header include guard to reflect Xen directory structure
+ * 		- Drop atomic64_t helper declarations
+ * 		- Drop pre-Armv6 support
+ * 		- Redirect READ_ONCE/WRITE_ONCE to __* equivalents in compiler.h
+ * 		- Add explicit atomic_add_return() and atomic_sub_return() as
+ *		  Linux doesn't define these for arm32. Here we just sandwich
+ *		  the atomic_<op>_return_relaxed() calls with smp_mb()s.
  *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
+ * Copyright (C) 1996 Russell King.
+ * Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * SPDX-License-Identifier: GPL-2.0-only
  */
-#ifndef __ARCH_ARM_ARM32_ATOMIC__
-#define __ARCH_ARM_ARM32_ATOMIC__
+#ifndef __ASM_ARM_ARM32_ATOMIC_H
+#define __ASM_ARM_ARM32_ATOMIC_H
+
+#include <xen/compiler.h>
+#include <xen/prefetch.h>
+#include <xen/types.h>
+#include "system.h"
+#include "cmpxchg.h"
+
+/*
+ * On ARM, ordinary assignment (str instruction) doesn't clear the local
+ * strex/ldrex monitor on some implementations. The reason we can use it for
+ * atomic_set() is the clrex or dummy strex done on every exception return.
+ */
+#define atomic_read(v)	__READ_ONCE((v)->counter)
+#define atomic_set(v,i)	__WRITE_ONCE(((v)->counter), (i))
 
 /*
  * ARMv6 UP and SMP safe atomic ops.  We use load exclusive and
  * store exclusive to ensure that these are atomic.  We may loop
  * to ensure that the update happens.
  */
-static inline void atomic_add(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
 
-	prefetchw(&v->counter);
-	__asm__ __volatile__("@ atomic_add\n"
-"1:	ldrex	%0, [%3]\n"
-"	add	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (i)
-	: "cc");
+#define ATOMIC_OP(op, c_op, asm_op)					\
+static inline void atomic_##op(int i, atomic_t *v)			\
+{									\
+	unsigned long tmp;						\
+	int result;							\
+									\
+	prefetchw(&v->counter);						\
+	__asm__ __volatile__("@ atomic_" #op "\n"			\
+"1:	ldrex	%0, [%3]\n"						\
+"	" #asm_op "	%0, %0, %4\n"					\
+"	strex	%1, %0, [%3]\n"						\
+"	teq	%1, #0\n"						\
+"	bne	1b"							\
+	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)		\
+	: "r" (&v->counter), "Ir" (i)					\
+	: "cc");							\
+}									\
+
+#define ATOMIC_OP_RETURN(op, c_op, asm_op)				\
+static inline int atomic_##op##_return_relaxed(int i, atomic_t *v)	\
+{									\
+	unsigned long tmp;						\
+	int result;							\
+									\
+	prefetchw(&v->counter);						\
+									\
+	__asm__ __volatile__("@ atomic_" #op "_return\n"		\
+"1:	ldrex	%0, [%3]\n"						\
+"	" #asm_op "	%0, %0, %4\n"					\
+"	strex	%1, %0, [%3]\n"						\
+"	teq	%1, #0\n"						\
+"	bne	1b"							\
+	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)		\
+	: "r" (&v->counter), "Ir" (i)					\
+	: "cc");							\
+									\
+	return result;							\
 }
 
-static inline int atomic_add_return(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	smp_mb();
-	prefetchw(&v->counter);
-
-	__asm__ __volatile__("@ atomic_add_return\n"
-"1:	ldrex	%0, [%3]\n"
-"	add	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (i)
-	: "cc");
-
-	smp_mb();
-
-	return result;
-}
-
-static inline void atomic_sub(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	prefetchw(&v->counter);
-	__asm__ __volatile__("@ atomic_sub\n"
-"1:	ldrex	%0, [%3]\n"
-"	sub	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (i)
-	: "cc");
+#define ATOMIC_FETCH_OP(op, c_op, asm_op)				\
+static inline int atomic_fetch_##op##_relaxed(int i, atomic_t *v)	\
+{									\
+	unsigned long tmp;						\
+	int result, val;						\
+									\
+	prefetchw(&v->counter);						\
+									\
+	__asm__ __volatile__("@ atomic_fetch_" #op "\n"			\
+"1:	ldrex	%0, [%4]\n"						\
+"	" #asm_op "	%1, %0, %5\n"					\
+"	strex	%2, %1, [%4]\n"						\
+"	teq	%2, #0\n"						\
+"	bne	1b"							\
+	: "=&r" (result), "=&r" (val), "=&r" (tmp), "+Qo" (v->counter)	\
+	: "r" (&v->counter), "Ir" (i)					\
+	: "cc");							\
+									\
+	return result;							\
 }
 
-static inline int atomic_sub_return(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
+#define atomic_add_return_relaxed	atomic_add_return_relaxed
+#define atomic_sub_return_relaxed	atomic_sub_return_relaxed
+#define atomic_fetch_add_relaxed	atomic_fetch_add_relaxed
+#define atomic_fetch_sub_relaxed	atomic_fetch_sub_relaxed
 
-	smp_mb();
-	prefetchw(&v->counter);
-
-	__asm__ __volatile__("@ atomic_sub_return\n"
-"1:	ldrex	%0, [%3]\n"
-"	sub	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (i)
-	: "cc");
-
-	smp_mb();
-
-	return result;
-}
-
-static inline void atomic_and(int m, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	prefetchw(&v->counter);
-	__asm__ __volatile__("@ atomic_and\n"
-"1:	ldrex	%0, [%3]\n"
-"	and	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (m)
-	: "cc");
-}
+#define atomic_fetch_and_relaxed	atomic_fetch_and_relaxed
+#define atomic_fetch_andnot_relaxed	atomic_fetch_andnot_relaxed
+#define atomic_fetch_or_relaxed		atomic_fetch_or_relaxed
+#define atomic_fetch_xor_relaxed	atomic_fetch_xor_relaxed
 
-static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
+static inline int atomic_cmpxchg_relaxed(atomic_t *ptr, int old, int new)
 {
 	int oldval;
 	unsigned long res;
 
-	smp_mb();
 	prefetchw(&ptr->counter);
 
 	do {
@@ -132,12 +126,11 @@ static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
 		    : "cc");
 	} while (res);
 
-	smp_mb();
-
 	return oldval;
 }
+#define atomic_cmpxchg_relaxed		atomic_cmpxchg_relaxed
 
-static inline int __atomic_add_unless(atomic_t *v, int a, int u)
+static inline int atomic_fetch_add_unless(atomic_t *v, int a, int u)
 {
 	int oldval, newval;
 	unsigned long tmp;
@@ -163,13 +156,61 @@ static inline int __atomic_add_unless(atomic_t *v, int a, int u)
 
 	return oldval;
 }
+#define atomic_fetch_add_unless		atomic_fetch_add_unless
+
+#define ATOMIC_OPS(op, c_op, asm_op)					\
+	ATOMIC_OP(op, c_op, asm_op)					\
+	ATOMIC_OP_RETURN(op, c_op, asm_op)				\
+	ATOMIC_FETCH_OP(op, c_op, asm_op)
+
+ATOMIC_OPS(add, +=, add)
+ATOMIC_OPS(sub, -=, sub)
+
+#define atomic_andnot atomic_andnot
+
+#undef ATOMIC_OPS
+#define ATOMIC_OPS(op, c_op, asm_op)					\
+	ATOMIC_OP(op, c_op, asm_op)					\
+	ATOMIC_FETCH_OP(op, c_op, asm_op)
+
+ATOMIC_OPS(and, &=, and)
+ATOMIC_OPS(andnot, &= ~, bic)
+ATOMIC_OPS(or,  |=, orr)
+ATOMIC_OPS(xor, ^=, eor)
+
+#undef ATOMIC_OPS
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_OP_RETURN
+#undef ATOMIC_OP
+
+#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 
-#endif /* __ARCH_ARM_ARM32_ATOMIC__ */
 /*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 8
- * indent-tabs-mode: t
- * End:
+ * Linux doesn't define strict atomic_add_return() or atomic_sub_return()
+ * for /arch/arm -- Let's manually define these for Xen.
  */
+
+static inline int atomic_add_return(int i, atomic_t *v)
+{
+	int ret;
+
+	smp_mb();
+	ret = atomic_add_return_relaxed(i, v);
+	smp_mb();
+
+	return ret;
+}
+
+static inline int atomic_sub_return(int i, atomic_t *v)
+{
+	int ret;
+
+	smp_mb();
+	ret = atomic_sub_return_relaxed(i, v);
+	smp_mb();
+
+	return ret;
+}
+
+
+#endif /* __ASM_ARM_ARM32_ATOMIC_H */
diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
index b0bd1d8b68..7aa8d93fc2 100644
--- a/xen/include/asm-arm/arm32/cmpxchg.h
+++ b/xen/include/asm-arm/arm32/cmpxchg.h
@@ -1,16 +1,36 @@
-#ifndef __ASM_ARM32_CMPXCHG_H
-#define __ASM_ARM32_CMPXCHG_H
+/*
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
+ *
+ * Summary of changes:
+ * 		- Rename header include guard to reflect Xen directory structure
+ * 		- Drop redundant includes and redirect others to Xen equivalents
+ * 		- Assume running on Armv7 so drop support for <= Armv6, and drop
+ * 		  workarounds for StrongARM "swp" instruction errata
+ * 		- Drop local() variants (no callers in Xen)
+ * 		- Add strict versions of xchg(), cmpxchg(), and cmpxchg64() as
+ * 		  Linux does not provide these
+ * 		- Keep the compiler happy by updating __cmpxchg64() ptr arg to
+ * 		  be volatile and make the call to prefetchw() correctly cast
+ * 		  ptr to (const volatile *)
+ * 		- Pull in original Xen arm32 cmpxchg.h definitions of
+ * 		  cmpxchg_timeout*() and cmpxchg64_timeout*() as these are not
+ * 		  provided by Linux and are required for Xen's guest atomics
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+#ifndef __ASM_ARM_ARM32_CMPXCHG_H
+#define __ASM_ARM_ARM32_CMPXCHG_H
 
 #include <xen/prefetch.h>
+#include <xen/types.h>
 
-extern void __bad_xchg(volatile void *, int);
+extern void __bad_cmpxchg(volatile void *ptr, int size);
 
 static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
 {
 	unsigned long ret;
 	unsigned int tmp;
 
-	smp_mb();
 	prefetchw((const void *)ptr);
 
 	switch (size) {
@@ -24,6 +44,16 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
+	case 2:
+		asm volatile("@	__xchg2\n"
+		"1:	ldrexh	%0, [%3]\n"
+		"	strexh	%1, %2, [%3]\n"
+		"	teq	%1, #0\n"
+		"	bne	1b"
+			: "=&r" (ret), "=&r" (tmp)
+			: "r" (x), "r" (ptr)
+			: "memory", "cc");
+		break;
 	case 4:
 		asm volatile("@	__xchg4\n"
 		"1:	ldrex	%0, [%3]\n"
@@ -34,121 +64,236 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
+
 	default:
-		__bad_xchg(ptr, size), ret = 0;
+		/* Cause a link-time error, the size is not supported */
+		__bad_cmpxchg(ptr, size), ret = 0;
 		break;
 	}
-	smp_mb();
 
 	return ret;
 }
 
-#define xchg(ptr,x) \
-	((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
+#define xchg_relaxed(ptr, x) ({						\
+	(__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr),		\
+				   sizeof(*(ptr)));			\
+})
+
+static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
+				      unsigned long new, int size)
+{
+	unsigned long oldval, res;
+
+	prefetchw((const void *)ptr);
+
+	switch (size) {
+	case 1:
+		do {
+			asm volatile("@ __cmpxchg1\n"
+			"	ldrexb	%1, [%2]\n"
+			"	mov	%0, #0\n"
+			"	teq	%1, %3\n"
+			"	strexbeq %0, %4, [%2]\n"
+				: "=&r" (res), "=&r" (oldval)
+				: "r" (ptr), "Ir" (old), "r" (new)
+				: "memory", "cc");
+		} while (res);
+		break;
+	case 2:
+		do {
+			asm volatile("@ __cmpxchg1\n"
+			"	ldrexh	%1, [%2]\n"
+			"	mov	%0, #0\n"
+			"	teq	%1, %3\n"
+			"	strexheq %0, %4, [%2]\n"
+				: "=&r" (res), "=&r" (oldval)
+				: "r" (ptr), "Ir" (old), "r" (new)
+				: "memory", "cc");
+		} while (res);
+		break;
+	case 4:
+		do {
+			asm volatile("@ __cmpxchg4\n"
+			"	ldrex	%1, [%2]\n"
+			"	mov	%0, #0\n"
+			"	teq	%1, %3\n"
+			"	strexeq %0, %4, [%2]\n"
+				: "=&r" (res), "=&r" (oldval)
+				: "r" (ptr), "Ir" (old), "r" (new)
+				: "memory", "cc");
+		} while (res);
+		break;
+
+	default:
+		__bad_cmpxchg(ptr, size);
+		oldval = 0;
+	}
+
+	return oldval;
+}
+
+#define cmpxchg_relaxed(ptr,o,n) ({					\
+	(__typeof__(*(ptr)))__cmpxchg((ptr),				\
+				      (unsigned long)(o),		\
+				      (unsigned long)(n),		\
+				      sizeof(*(ptr)));			\
+})
+
+static inline unsigned long long __cmpxchg64(volatile unsigned long long *ptr,
+					     unsigned long long old,
+					     unsigned long long new)
+{
+	unsigned long long oldval;
+	unsigned long res;
+
+	prefetchw((const void *)ptr);
+
+	__asm__ __volatile__(
+"1:	ldrexd		%1, %H1, [%3]\n"
+"	teq		%1, %4\n"
+"	teqeq		%H1, %H4\n"
+"	bne		2f\n"
+"	strexd		%0, %5, %H5, [%3]\n"
+"	teq		%0, #0\n"
+"	bne		1b\n"
+"2:"
+	: "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
+	: "r" (ptr), "r" (old), "r" (new)
+	: "cc");
+
+	return oldval;
+}
+
+#define cmpxchg64_relaxed(ptr, o, n) ({					\
+	(__typeof__(*(ptr)))__cmpxchg64((ptr),				\
+					(unsigned long long)(o),	\
+					(unsigned long long)(n));	\
+})
+
+
+/*
+ * Linux doesn't provide strict versions of xchg(), cmpxchg(), and cmpxchg64(),
+ * so manually define these for Xen as smp_mb() wrappers around the relaxed
+ * variants.
+ */
+
+#define xchg(ptr, x) ({ \
+	long ret; \
+	smp_mb(); \
+	ret = xchg_relaxed(ptr, x); \
+	smp_mb(); \
+	ret; \
+})
+
+#define cmpxchg(ptr, o, n) ({ \
+	long ret; \
+	smp_mb(); \
+	ret = cmpxchg_relaxed(ptr, o, n); \
+	smp_mb(); \
+	ret; \
+})
+
+#define cmpxchg64(ptr, o, n) ({ \
+	long long ret; \
+	smp_mb(); \
+	ret = cmpxchg64_relaxed(ptr, o, n); \
+	smp_mb(); \
+	ret; \
+})
 
 /*
- * Atomic compare and exchange.  Compare OLD with MEM, if identical,
- * store NEW in MEM.  Return the initial value in MEM.  Success is
- * indicated by comparing RETURN with OLD.
+ * This code is from the original Xen arm32 cmpxchg.h, from before the
+ * Linux 5.10-rc2 atomics helpers were ported over. The only changes
+ * here are renaming the macros and functions to explicitly use
+ * "timeout" in their names so that they don't clash with the above.
+ *
+ * We need this here for guest atomics (the only user of the timeout
+ * variants).
  */
 
-extern unsigned long __bad_cmpxchg(volatile void *ptr, int size);
-
-#define __CMPXCHG_CASE(sz, name)					\
-static inline bool __cmpxchg_case_##name(volatile void *ptr,		\
-					 unsigned long *old,		\
-					 unsigned long new,		\
-					 bool timeout,			\
-					 unsigned int max_try)		\
-{									\
-	unsigned long oldval;						\
-	unsigned long res;						\
-									\
-	do {								\
-		asm volatile("@ __cmpxchg_case_" #name "\n"		\
-		"	ldrex" #sz "	%1, [%2]\n"			\
-		"	mov	%0, #0\n"				\
-		"	teq	%1, %3\n"				\
-		"	strex" #sz "eq %0, %4, [%2]\n"			\
-		: "=&r" (res), "=&r" (oldval)				\
-		: "r" (ptr), "Ir" (*old), "r" (new)			\
-		: "memory", "cc");					\
-									\
-		if (!res)						\
-			break;						\
-	} while (!timeout || ((--max_try) > 0));			\
-									\
-	*old = oldval;							\
-									\
-	return !res;							\
+#define __CMPXCHG_TIMEOUT_CASE(sz, name)                                        \
+static inline bool __cmpxchg_timeout_case_##name(volatile void *ptr,            \
+                                         unsigned long *old,            \
+                                         unsigned long new,             \
+                                         bool timeout,                  \
+                                         unsigned int max_try)          \
+{                                                                       \
+        unsigned long oldval;                                           \
+        unsigned long res;                                              \
+                                                                        \
+        do {                                                            \
+                asm volatile("@ __cmpxchg_timeout_case_" #name "\n"             \
+                "       ldrex" #sz "    %1, [%2]\n"                     \
+                "       mov     %0, #0\n"                               \
+                "       teq     %1, %3\n"                               \
+                "       strex" #sz "eq %0, %4, [%2]\n"                  \
+                : "=&r" (res), "=&r" (oldval)                           \
+                : "r" (ptr), "Ir" (*old), "r" (new)                     \
+                : "memory", "cc");                                      \
+                                                                        \
+                if (!res)                                               \
+                        break;                                          \
+        } while (!timeout || ((--max_try) > 0));                        \
+                                                                        \
+        *old = oldval;                                                  \
+                                                                        \
+        return !res;                                                    \
 }
 
-__CMPXCHG_CASE(b, 1)
-__CMPXCHG_CASE(h, 2)
-__CMPXCHG_CASE( , 4)
+__CMPXCHG_TIMEOUT_CASE(b, 1)
+__CMPXCHG_TIMEOUT_CASE(h, 2)
+__CMPXCHG_TIMEOUT_CASE( , 4)
 
-static inline bool __cmpxchg_case_8(volatile uint64_t *ptr,
-			 	    uint64_t *old,
-			 	    uint64_t new,
-			 	    bool timeout,
-				    unsigned int max_try)
+static inline bool __cmpxchg_timeout_case_8(volatile uint64_t *ptr,
+                                    uint64_t *old,
+                                    uint64_t new,
+                                    bool timeout,
+                                    unsigned int max_try)
 {
-	uint64_t oldval;
-	uint64_t res;
-
-	do {
-		asm volatile(
-		"	ldrexd		%1, %H1, [%3]\n"
-		"	teq		%1, %4\n"
-		"	teqeq		%H1, %H4\n"
-		"	movne		%0, #0\n"
-		"	movne		%H0, #0\n"
-		"	bne		2f\n"
-		"	strexd		%0, %5, %H5, [%3]\n"
-		"2:"
-		: "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
-		: "r" (ptr), "r" (*old), "r" (new)
-		: "memory", "cc");
-		if (!res)
-			break;
-	} while (!timeout || ((--max_try) > 0));
-
-	*old = oldval;
-
-	return !res;
+        uint64_t oldval;
+        uint64_t res;
+
+        do {
+                asm volatile(
+                "       ldrexd          %1, %H1, [%3]\n"
+                "       teq             %1, %4\n"
+                "       teqeq           %H1, %H4\n"
+                "       movne           %0, #0\n"
+                "       movne           %H0, #0\n"
+                "       bne             2f\n"
+                "       strexd          %0, %5, %H5, [%3]\n"
+                "2:"
+                : "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
+                : "r" (ptr), "r" (*old), "r" (new)
+                : "memory", "cc");
+                if (!res)
+                        break;
+        } while (!timeout || ((--max_try) > 0));
+
+        *old = oldval;
+
+        return !res;
 }
 
 static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
-					unsigned long new, int size,
-					bool timeout, unsigned int max_try)
+                                        unsigned long new, int size,
+                                        bool timeout, unsigned int max_try)
 {
-	prefetchw((const void *)ptr);
+        prefetchw((const void *)ptr);
 
-	switch (size) {
-	case 1:
-		return __cmpxchg_case_1(ptr, old, new, timeout, max_try);
-	case 2:
-		return __cmpxchg_case_2(ptr, old, new, timeout, max_try);
-	case 4:
-		return __cmpxchg_case_4(ptr, old, new, timeout, max_try);
-	default:
-		return __bad_cmpxchg(ptr, size);
-	}
+        switch (size) {
+        case 1:
+                return __cmpxchg_timeout_case_1(ptr, old, new, timeout, max_try);
+        case 2:
+                return __cmpxchg_timeout_case_2(ptr, old, new, timeout, max_try);
+        case 4:
+                return __cmpxchg_timeout_case_4(ptr, old, new, timeout, max_try);
+        default:
+                __bad_cmpxchg(ptr, size);
+				return false;
+        }
 
-	ASSERT_UNREACHABLE();
-}
-
-static always_inline unsigned long __cmpxchg(volatile void *ptr,
-					     unsigned long old,
-					     unsigned long new,
-					     int size)
-{
-	smp_mb();
-	if (!__int_cmpxchg(ptr, &old, new, size, false, 0))
-		ASSERT_UNREACHABLE();
-	smp_mb();
-
-	return old;
+        ASSERT_UNREACHABLE();
 }
 
 /*
@@ -162,18 +307,18 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
  * timeout) and false if the update has failed.
  */
 static always_inline bool __cmpxchg_timeout(volatile void *ptr,
-					    unsigned long *old,
-					    unsigned long new,
-					    int size,
-					    unsigned int max_try)
+                                            unsigned long *old,
+                                            unsigned long new,
+                                            int size,
+                                            unsigned int max_try)
 {
-	bool ret;
+        bool ret;
 
-	smp_mb();
-	ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
-	smp_mb();
+        smp_mb();
+        ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
+        smp_mb();
 
-	return ret;
+        return ret;
 }
 
 /*
@@ -187,43 +332,17 @@ static always_inline bool __cmpxchg_timeout(volatile void *ptr,
  * timeout) and false if the update has failed.
  */
 static always_inline bool __cmpxchg64_timeout(volatile uint64_t *ptr,
-					      uint64_t *old,
-					      uint64_t new,
-					      unsigned int max_try)
+                                              uint64_t *old,
+                                              uint64_t new,
+                                              unsigned int max_try)
 {
-	bool ret;
+        bool ret;
 
-	smp_mb();
-	ret = __cmpxchg_case_8(ptr, old, new, true, max_try);
-	smp_mb();
+        smp_mb();
+        ret = __cmpxchg_timeout_case_8(ptr, old, new, true, max_try);
+        smp_mb();
 
-	return ret;
+        return ret;
 }
 
-#define cmpxchg(ptr,o,n)						\
-	((__typeof__(*(ptr)))__cmpxchg((ptr),				\
-				       (unsigned long)(o),		\
-				       (unsigned long)(n),		\
-				       sizeof(*(ptr))))
-
-static inline uint64_t cmpxchg64(volatile uint64_t *ptr,
-				 uint64_t old,
-				 uint64_t new)
-{
-	smp_mb();
-	if (!__cmpxchg_case_8(ptr, &old, new, false, 0))
-		ASSERT_UNREACHABLE();
-	smp_mb();
-
-	return old;
-}
-
-#endif
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 8
- * indent-tabs-mode: t
- * End:
- */
+#endif /* __ASM_ARM_ARM32_CMPXCHG_H */
diff --git a/xen/include/asm-arm/arm32/system.h b/xen/include/asm-arm/arm32/system.h
index ab57abfbc5..88798d11db 100644
--- a/xen/include/asm-arm/arm32/system.h
+++ b/xen/include/asm-arm/arm32/system.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_ARM32_SYSTEM_H
 #define __ASM_ARM32_SYSTEM_H
 
-#include <asm/arm32/cmpxchg.h>
+#include <asm/atomic.h>
 
 #define local_irq_disable() asm volatile ( "cpsid i @ local_irq_disable\n" : : : "cc" )
 #define local_irq_enable()  asm volatile ( "cpsie i @ local_irq_enable\n" : : : "cc" )
-- 
2.24.3 (Apple Git-128)


