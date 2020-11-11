Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BBB92AFAE8
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25367.53068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9Y-0007fq-Ez; Wed, 11 Nov 2020 21:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25367.53068; Wed, 11 Nov 2020 21:59:44 +0000
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
	id 1kcy9Y-0007en-AW; Wed, 11 Nov 2020 21:59:44 +0000
Received: by outflank-mailman (input) for mailman id 25367;
 Wed, 11 Nov 2020 21:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3p-00064v-RB
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:49 +0000
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a7def3d-c819-4d01-8499-8cff76a05d08;
 Wed, 11 Nov 2020 21:52:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h2so3607180wmm.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:55 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:53 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3p-00064v-RB
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:49 +0000
X-Inumbo-ID: 5a7def3d-c819-4d01-8499-8cff76a05d08
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5a7def3d-c819-4d01-8499-8cff76a05d08;
	Wed, 11 Nov 2020 21:52:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id h2so3607180wmm.0
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IXFCViiQlQAZEJbjZ19ZkmNy8WD0OQFKlmdpW+wsKU8=;
        b=RnBL36HD997IHMhccuSQNZSZDDpVAU8KLGq0R59vlQGn7wBebSGfrp0mJtXAovT4c6
         EJyWLq3sYPTsA4cm9P6lMf1fuAHGLWzS3A+qX8gthR6F01Xm4VRPqXgXrgdGbyc7Xoa9
         YMFMZKI9GfeWIYWyAriVKNSjXBea1Q6/vsaUfU0fqy5AgYLUMjMZiLQOkVRhg8tVwIpL
         VA9UUlNQS4UWUDJZb5+5a/EYByAH/12OhCaBzDoP7Md6j6x0k5mLdrU/fG7Yj/mfMn3v
         BIO6R9T3RS0RBGllNLCW0QBzTLnfQzEl2V2ie/Mws1oaVW9aLYI5apmW91PUjAzYrAis
         qs+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IXFCViiQlQAZEJbjZ19ZkmNy8WD0OQFKlmdpW+wsKU8=;
        b=L4dzUbspzMXM7zQGaTVt7haalWANjKBqoXGs5cWpp4BiCNI73DfMVAPJliHY6jTXmf
         yljL5gQ9KvL3fEBt2cf95CoT3vcSiXtuZImwFu3prLOuV9mW/OPASdOW5JNcOboMb64V
         inaeRSADdAzz5caIHGt1GtiicXkGSndbvc1YbFvHAzJ6QaOGyz7toegDuu5NdlV58SNh
         WhxhTVy48IWfuZt2SG5byxtQprZafcF0HT2IQVASMGS9micRVmM/nV74Qxl62p7aQrUS
         BwGX2g0l12iqTA54xS2FgaIpFzhqGILlbczGTRS1t9pvhblPt6/Y2KIPEqFGKRkeq4i9
         khAQ==
X-Gm-Message-State: AOAM533K6tUSIqAMLIgb0RNSaG6syDVpgVJvL4fDHVN+pSq1Af0ghWdL
	sbSg130APpndTpGFZJySPCvm5tOtZ24=
X-Google-Smtp-Source: ABdhPJxQF6Pq2fJkYjLdTtlSw3AwUxsPPRK7RpLtDF2xcsJ1YDjaoI17FxqchSrlgwSxgtpfRKuXiw==
X-Received: by 2002:a1c:dd41:: with SMTP id u62mr6067891wmg.78.1605131574031;
        Wed, 11 Nov 2020 13:52:54 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.53
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:53 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 13/15] xen/arm32: port Linux's arm32 atomic.h to Xen
Date: Wed, 11 Nov 2020 21:52:01 +0000
Message-Id: <20201111215203.80336-14-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

 - Drop arch_* prefixes.

 - Redirect include of <xen/compiler.h> to <xen/rwonce.h>, and swap
   usage of READ_ONCE()/WRITE_ONCE() to the __* versions accordingly.
   As discussed earlier in the series, we can do this because we're
   accessing an atomic_t's counter member, which is an int, so the
   extra checks performed by READ_ONCE()/WRITE_ONCE() are redundant,
   and this actually matches the Linux arm64 code which already uses
   the __* variants.

 - Drop support for pre-Armv7 systems.

 - Drop atomic64_t helper definitions as we don't currently have an
   atomic64_t in Xen.

 - Add explicit strict variants of atomic_{add,sub}_return() as Linux
   does not define these for arm32 and they're needed for Xen. These
   strict variants are just wrappers that sandwich a call to the
   relaxed variants between two smp_mb()'s.'

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm32/atomic.h | 357 +++--------------------------
 1 file changed, 28 insertions(+), 329 deletions(-)

diff --git a/xen/include/asm-arm/arm32/atomic.h b/xen/include/asm-arm/arm32/atomic.h
index ac6338dd9b..2d8cd3c586 100644
--- a/xen/include/asm-arm/arm32/atomic.h
+++ b/xen/include/asm-arm/arm32/atomic.h
@@ -1,31 +1,26 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- *  arch/arm/include/asm/atomic.h
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
  *
- *  Copyright (C) 1996 Russell King.
- *  Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * Copyright (C) 1996 Russell King.
+ * Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * SPDX-License-Identifier: GPL-2.0-only
  */
-#ifndef __ASM_ARM_ATOMIC_H
-#define __ASM_ARM_ATOMIC_H
+#ifndef __ASM_ARM_ARM32_ATOMIC_H
+#define __ASM_ARM_ARM32_ATOMIC_H
 
-#include <linux/compiler.h>
-#include <linux/prefetch.h>
-#include <linux/types.h>
-#include <linux/irqflags.h>
-#include <asm/barrier.h>
-#include <asm/cmpxchg.h>
-
-#ifdef __KERNEL__
+#include <xen/rwonce.h>
+#include <xen/prefetch.h>
+#include <xen/types.h>
+#include "system.h"
+#include "cmpxchg.h"
 
 /*
  * On ARM, ordinary assignment (str instruction) doesn't clear the local
  * strex/ldrex monitor on some implementations. The reason we can use it for
  * atomic_set() is the clrex or dummy strex done on every exception return.
  */
-#define atomic_read(v)	READ_ONCE((v)->counter)
-#define atomic_set(v,i)	WRITE_ONCE(((v)->counter), (i))
-
-#if __LINUX_ARM_ARCH__ >= 6
+#define atomic_read(v)	__READ_ONCE((v)->counter)
+#define atomic_set(v,i)	__WRITE_ONCE(((v)->counter), (i))
 
 /*
  * ARMv6 UP and SMP safe atomic ops.  We use load exclusive and
@@ -153,68 +148,6 @@ static inline int atomic_fetch_add_unless(atomic_t *v, int a, int u)
 }
 #define atomic_fetch_add_unless		atomic_fetch_add_unless
 
-#else /* ARM_ARCH_6 */
-
-#ifdef CONFIG_SMP
-#error SMP not supported on pre-ARMv6 CPUs
-#endif
-
-#define ATOMIC_OP(op, c_op, asm_op)					\
-static inline void atomic_##op(int i, atomic_t *v)			\
-{									\
-	unsigned long flags;						\
-									\
-	raw_local_irq_save(flags);					\
-	v->counter c_op i;						\
-	raw_local_irq_restore(flags);					\
-}									\
-
-#define ATOMIC_OP_RETURN(op, c_op, asm_op)				\
-static inline int atomic_##op##_return(int i, atomic_t *v)		\
-{									\
-	unsigned long flags;						\
-	int val;							\
-									\
-	raw_local_irq_save(flags);					\
-	v->counter c_op i;						\
-	val = v->counter;						\
-	raw_local_irq_restore(flags);					\
-									\
-	return val;							\
-}
-
-#define ATOMIC_FETCH_OP(op, c_op, asm_op)				\
-static inline int atomic_fetch_##op(int i, atomic_t *v)			\
-{									\
-	unsigned long flags;						\
-	int val;							\
-									\
-	raw_local_irq_save(flags);					\
-	val = v->counter;						\
-	v->counter c_op i;						\
-	raw_local_irq_restore(flags);					\
-									\
-	return val;							\
-}
-
-static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
-{
-	int ret;
-	unsigned long flags;
-
-	raw_local_irq_save(flags);
-	ret = v->counter;
-	if (likely(ret == old))
-		v->counter = new;
-	raw_local_irq_restore(flags);
-
-	return ret;
-}
-
-#define atomic_fetch_andnot		atomic_fetch_andnot
-
-#endif /* __LINUX_ARM_ARCH__ */
-
 #define ATOMIC_OPS(op, c_op, asm_op)					\
 	ATOMIC_OP(op, c_op, asm_op)					\
 	ATOMIC_OP_RETURN(op, c_op, asm_op)				\
@@ -242,266 +175,32 @@ ATOMIC_OPS(xor, ^=, eor)
 
 #define atomic_xchg(v, new) (xchg(&((v)->counter), new))
 
-#ifndef CONFIG_GENERIC_ATOMIC64
-typedef struct {
-	s64 counter;
-} atomic64_t;
+/*
+ * Linux doesn't define strict atomic_add_return() or atomic_sub_return()
+ * for /arch/arm -- Let's manually define these for Xen.
+ */
 
-#define ATOMIC64_INIT(i) { (i) }
-
-#ifdef CONFIG_ARM_LPAE
-static inline s64 atomic64_read(const atomic64_t *v)
-{
-	s64 result;
-
-	__asm__ __volatile__("@ atomic64_read\n"
-"	ldrd	%0, %H0, [%1]"
-	: "=&r" (result)
-	: "r" (&v->counter), "Qo" (v->counter)
-	);
-
-	return result;
-}
-
-static inline void atomic64_set(atomic64_t *v, s64 i)
-{
-	__asm__ __volatile__("@ atomic64_set\n"
-"	strd	%2, %H2, [%1]"
-	: "=Qo" (v->counter)
-	: "r" (&v->counter), "r" (i)
-	);
-}
-#else
-static inline s64 atomic64_read(const atomic64_t *v)
-{
-	s64 result;
-
-	__asm__ __volatile__("@ atomic64_read\n"
-"	ldrexd	%0, %H0, [%1]"
-	: "=&r" (result)
-	: "r" (&v->counter), "Qo" (v->counter)
-	);
-
-	return result;
-}
-
-static inline void atomic64_set(atomic64_t *v, s64 i)
+static inline int atomic_add_return(int i, atomic_t *v)
 {
-	s64 tmp;
-
-	prefetchw(&v->counter);
-	__asm__ __volatile__("@ atomic64_set\n"
-"1:	ldrexd	%0, %H0, [%2]\n"
-"	strexd	%0, %3, %H3, [%2]\n"
-"	teq	%0, #0\n"
-"	bne	1b"
-	: "=&r" (tmp), "=Qo" (v->counter)
-	: "r" (&v->counter), "r" (i)
-	: "cc");
-}
-#endif
-
-#define ATOMIC64_OP(op, op1, op2)					\
-static inline void atomic64_##op(s64 i, atomic64_t *v)			\
-{									\
-	s64 result;							\
-	unsigned long tmp;						\
-									\
-	prefetchw(&v->counter);						\
-	__asm__ __volatile__("@ atomic64_" #op "\n"			\
-"1:	ldrexd	%0, %H0, [%3]\n"					\
-"	" #op1 " %Q0, %Q0, %Q4\n"					\
-"	" #op2 " %R0, %R0, %R4\n"					\
-"	strexd	%1, %0, %H0, [%3]\n"					\
-"	teq	%1, #0\n"						\
-"	bne	1b"							\
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)		\
-	: "r" (&v->counter), "r" (i)					\
-	: "cc");							\
-}									\
-
-#define ATOMIC64_OP_RETURN(op, op1, op2)				\
-static inline s64							\
-atomic64_##op##_return_relaxed(s64 i, atomic64_t *v)			\
-{									\
-	s64 result;							\
-	unsigned long tmp;						\
-									\
-	prefetchw(&v->counter);						\
-									\
-	__asm__ __volatile__("@ atomic64_" #op "_return\n"		\
-"1:	ldrexd	%0, %H0, [%3]\n"					\
-"	" #op1 " %Q0, %Q0, %Q4\n"					\
-"	" #op2 " %R0, %R0, %R4\n"					\
-"	strexd	%1, %0, %H0, [%3]\n"					\
-"	teq	%1, #0\n"						\
-"	bne	1b"							\
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)		\
-	: "r" (&v->counter), "r" (i)					\
-	: "cc");							\
-									\
-	return result;							\
-}
-
-#define ATOMIC64_FETCH_OP(op, op1, op2)					\
-static inline s64							\
-atomic64_fetch_##op##_relaxed(s64 i, atomic64_t *v)			\
-{									\
-	s64 result, val;						\
-	unsigned long tmp;						\
-									\
-	prefetchw(&v->counter);						\
-									\
-	__asm__ __volatile__("@ atomic64_fetch_" #op "\n"		\
-"1:	ldrexd	%0, %H0, [%4]\n"					\
-"	" #op1 " %Q1, %Q0, %Q5\n"					\
-"	" #op2 " %R1, %R0, %R5\n"					\
-"	strexd	%2, %1, %H1, [%4]\n"					\
-"	teq	%2, #0\n"						\
-"	bne	1b"							\
-	: "=&r" (result), "=&r" (val), "=&r" (tmp), "+Qo" (v->counter)	\
-	: "r" (&v->counter), "r" (i)					\
-	: "cc");							\
-									\
-	return result;							\
-}
-
-#define ATOMIC64_OPS(op, op1, op2)					\
-	ATOMIC64_OP(op, op1, op2)					\
-	ATOMIC64_OP_RETURN(op, op1, op2)				\
-	ATOMIC64_FETCH_OP(op, op1, op2)
-
-ATOMIC64_OPS(add, adds, adc)
-ATOMIC64_OPS(sub, subs, sbc)
-
-#define atomic64_add_return_relaxed	atomic64_add_return_relaxed
-#define atomic64_sub_return_relaxed	atomic64_sub_return_relaxed
-#define atomic64_fetch_add_relaxed	atomic64_fetch_add_relaxed
-#define atomic64_fetch_sub_relaxed	atomic64_fetch_sub_relaxed
-
-#undef ATOMIC64_OPS
-#define ATOMIC64_OPS(op, op1, op2)					\
-	ATOMIC64_OP(op, op1, op2)					\
-	ATOMIC64_FETCH_OP(op, op1, op2)
-
-#define atomic64_andnot atomic64_andnot
-
-ATOMIC64_OPS(and, and, and)
-ATOMIC64_OPS(andnot, bic, bic)
-ATOMIC64_OPS(or,  orr, orr)
-ATOMIC64_OPS(xor, eor, eor)
-
-#define atomic64_fetch_and_relaxed	atomic64_fetch_and_relaxed
-#define atomic64_fetch_andnot_relaxed	atomic64_fetch_andnot_relaxed
-#define atomic64_fetch_or_relaxed	atomic64_fetch_or_relaxed
-#define atomic64_fetch_xor_relaxed	atomic64_fetch_xor_relaxed
-
-#undef ATOMIC64_OPS
-#undef ATOMIC64_FETCH_OP
-#undef ATOMIC64_OP_RETURN
-#undef ATOMIC64_OP
-
-static inline s64 atomic64_cmpxchg_relaxed(atomic64_t *ptr, s64 old, s64 new)
-{
-	s64 oldval;
-	unsigned long res;
-
-	prefetchw(&ptr->counter);
-
-	do {
-		__asm__ __volatile__("@ atomic64_cmpxchg\n"
-		"ldrexd		%1, %H1, [%3]\n"
-		"mov		%0, #0\n"
-		"teq		%1, %4\n"
-		"teqeq		%H1, %H4\n"
-		"strexdeq	%0, %5, %H5, [%3]"
-		: "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
-		: "r" (&ptr->counter), "r" (old), "r" (new)
-		: "cc");
-	} while (res);
-
-	return oldval;
-}
-#define atomic64_cmpxchg_relaxed	atomic64_cmpxchg_relaxed
-
-static inline s64 atomic64_xchg_relaxed(atomic64_t *ptr, s64 new)
-{
-	s64 result;
-	unsigned long tmp;
-
-	prefetchw(&ptr->counter);
-
-	__asm__ __volatile__("@ atomic64_xchg\n"
-"1:	ldrexd	%0, %H0, [%3]\n"
-"	strexd	%1, %4, %H4, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (ptr->counter)
-	: "r" (&ptr->counter), "r" (new)
-	: "cc");
-
-	return result;
-}
-#define atomic64_xchg_relaxed		atomic64_xchg_relaxed
-
-static inline s64 atomic64_dec_if_positive(atomic64_t *v)
-{
-	s64 result;
-	unsigned long tmp;
+	int ret;
 
 	smp_mb();
-	prefetchw(&v->counter);
-
-	__asm__ __volatile__("@ atomic64_dec_if_positive\n"
-"1:	ldrexd	%0, %H0, [%3]\n"
-"	subs	%Q0, %Q0, #1\n"
-"	sbc	%R0, %R0, #0\n"
-"	teq	%R0, #0\n"
-"	bmi	2f\n"
-"	strexd	%1, %0, %H0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b\n"
-"2:"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter)
-	: "cc");
-
+	ret = atomic_add_return_relaxed(i, v);
 	smp_mb();
 
-	return result;
+	return ret;
 }
-#define atomic64_dec_if_positive atomic64_dec_if_positive
+#define atomic_fetch_add(i, v) atomic_add_return(i, v)
 
-static inline s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
+static inline int atomic_sub_return(int i, atomic_t *v)
 {
-	s64 oldval, newval;
-	unsigned long tmp;
+	int ret;
 
 	smp_mb();
-	prefetchw(&v->counter);
-
-	__asm__ __volatile__("@ atomic64_add_unless\n"
-"1:	ldrexd	%0, %H0, [%4]\n"
-"	teq	%0, %5\n"
-"	teqeq	%H0, %H5\n"
-"	beq	2f\n"
-"	adds	%Q1, %Q0, %Q6\n"
-"	adc	%R1, %R0, %R6\n"
-"	strexd	%2, %1, %H1, [%4]\n"
-"	teq	%2, #0\n"
-"	bne	1b\n"
-"2:"
-	: "=&r" (oldval), "=&r" (newval), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "r" (u), "r" (a)
-	: "cc");
-
-	if (oldval != u)
-		smp_mb();
+	ret = atomic_sub_return_relaxed(i, v);
+	smp_mb();
 
-	return oldval;
+	return ret;
 }
-#define atomic64_fetch_add_unless atomic64_fetch_add_unless
 
-#endif /* !CONFIG_GENERIC_ATOMIC64 */
-#endif
-#endif
\ No newline at end of file
+#endif /* __ASM_ARM_ARM32_ATOMIC_H */
-- 
2.24.3 (Apple Git-128)


