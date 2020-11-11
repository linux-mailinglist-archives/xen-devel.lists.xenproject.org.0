Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B252AFADC
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25307.53033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy3M-0006k6-RK; Wed, 11 Nov 2020 21:53:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25307.53033; Wed, 11 Nov 2020 21:53:20 +0000
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
	id 1kcy3M-0006jH-Mq; Wed, 11 Nov 2020 21:53:20 +0000
Received: by outflank-mailman (input) for mailman id 25307;
 Wed, 11 Nov 2020 21:53:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3L-00064v-Py
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:19 +0000
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ca30c0ad-830d-40c8-b73b-4dacfcc7c5d6;
 Wed, 11 Nov 2020 21:52:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 10so3584954wml.2
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:47 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:44 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3L-00064v-Py
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:19 +0000
X-Inumbo-ID: ca30c0ad-830d-40c8-b73b-4dacfcc7c5d6
Received: from mail-wm1-x343.google.com (unknown [2a00:1450:4864:20::343])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id ca30c0ad-830d-40c8-b73b-4dacfcc7c5d6;
	Wed, 11 Nov 2020 21:52:47 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 10so3584954wml.2
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=stsGgsmPbfxHthK3Am66kcnwhe4wDikUxtnO5WZxAiU=;
        b=kyBB746iC2H+sCtyhNfe3jdl7s85sBgieXlHnVn30CG9UlKN9LTYdp0LcUKgWzOCMn
         NvWpVAMOROBaRQUD0pwEX7qy1lNZt9X4j6EF/Y939OOJ30YCC6NgSSXQfebgM+dpQC88
         3saZGesFj9Ynj5AcQzHmdATWiHoKdnFKPbPemHVV6e55ir56v77eg7e2flzEADZKZ2W9
         OwEb83hFwxX1iRyQK2Na43iSWolCTtUKodxbx+9bMlKp3BR/UFcGEr65+Hke5v2W5h94
         3gTMDMg2HThq3ygOJW9VbxOv+iVW+diW79jTYytAD3h+q+KedzWgHfmQVA1SPAAIJVFw
         ReRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=stsGgsmPbfxHthK3Am66kcnwhe4wDikUxtnO5WZxAiU=;
        b=g1l6e6AgV8YGidbNLeKbYA44hrntVtMPn76K/q5NLIlnk8LOZL8cgWc7kXApmig0Ce
         2zzzSsfW5vlRgRBTc6RL5b0bhwZ6NMyCEuIFh90+cZMtRfGGKMSdyLaGSxB7FvBIkynE
         pallaOzWIX9pKMLXUnZESKTuEVJ3i+aT8hQmNN5f0nHudMhvCyd+67/sjR0lnPb5dU/J
         RrNXgOlr+fWP55GTUvHOgOJCBvEJhJ6xaGP6yLDI4nmyS80Xy3g+P9wJI+yjghUWXd5n
         ZxblLLoTDsB9MqxiTfd5k7c6S4SAyO/dEtTaNQymjnU28HdN9TfGg52mV27/2AoI1M8W
         rF7w==
X-Gm-Message-State: AOAM531aA/uRVjzeqf2mW2naNKApZyx7cx2Q10g5/jApONtM9Z2oRIt3
	LMbVA28mn0tV1T/901JutkFSwWN77Ho=
X-Google-Smtp-Source: ABdhPJyW39UzUt7ed5ebZOO8NTkvWiogc3vf3WA3Pa8enHq6kgxZm2mt25CWSTTFbfqeOptnsCiA6w==
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr6175980wmq.178.1605131565244;
        Wed, 11 Nov 2020 13:52:45 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:44 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 05/15] xen/arm: pull in Linux atomics helpers and dependencies
Date: Wed, 11 Nov 2020 21:51:53 +0000
Message-Id: <20201111215203.80336-6-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

This patch pulls in Linux's atomics helpers for arm32 and arm64, and
their dependencies, as-is.

Note that Linux's arm32 atomics helpers use the READ_ONCE() and
WRITE_ONCE() macros defined in <asm-generic/rwonce.h>, while Linux's
arm64 atomics helpers use __READ_ONCE() and __WRITE_ONCE().

The only difference is that the __* versions skip checking whether the
object being accessed is the same size as a native C type (e.g. char,
int, long, etc). Given the arm32 helpers are using the macros to access
an atomic_t's counter member, which is an int, we can skip this check by
using the __* versions like the arm64 code does.

I mention this here because it forms the first part of my justification
for *not* copying Linux's <linux/compiler_types.h> to Xen; the size
check described above is performed by __native_word() defined in that
header.

The second part of my justification may be more contentious; as you'll
see in the next patch, I intend to drop the __unqual_scalar_typeof()
calls in __READ_ONCE() and __WRITE_ONCE(). This is because the pointer
to the atomic_t's counter member is always a basic (int *) so we don't
need this, and dropping it means we can avoid having to port Linux's
<linux/compiler_types.h>.

If people are against this approach, please bear in mind that the
current version of __unqual_scalar_typeof() in <linux/compiler_types.h>
was actually the reason for Linux upgrading the minimum GCC version
required to 4.9 earlier this year so that they can guarantee C11
_Generic support [1].

So if we do want to take Linux's <linux/compiler_types.h> we'll either
need to:

   A) bump up the minimum required version of GCC to 4.9 to match
      that required by Linux; in the Xen README we currently state
      GCC 4.8 for Arm and GCC 4.1.2_20070115 for x86.

or:

   B) mix-and-match an older version of Linux's <linux/compiler_types.h>
      with the other headers taken from a newer version of Linux.

Thoughts?

[1] https://lkml.org/lkml/2020/7/8/1308

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm32/atomic.h       | 507 +++++++++++++++++++++++
 xen/include/asm-arm/arm32/cmpxchg.h      | 279 +++++++++++++
 xen/include/asm-arm/arm64/atomic.h       | 228 ++++++++++
 xen/include/asm-arm/arm64/atomic_ll_sc.h | 353 ++++++++++++++++
 xen/include/asm-arm/arm64/atomic_lse.h   | 419 +++++++++++++++++++
 xen/include/asm-arm/arm64/cmpxchg.h      | 285 +++++++++++++
 xen/include/asm-arm/arm64/lse.h          |  48 +++
 xen/include/xen/rwonce.h                 |  90 ++++
 8 files changed, 2209 insertions(+)
 create mode 100644 xen/include/asm-arm/arm32/atomic.h
 create mode 100644 xen/include/asm-arm/arm32/cmpxchg.h
 create mode 100644 xen/include/asm-arm/arm64/atomic.h
 create mode 100644 xen/include/asm-arm/arm64/atomic_ll_sc.h
 create mode 100644 xen/include/asm-arm/arm64/atomic_lse.h
 create mode 100644 xen/include/asm-arm/arm64/cmpxchg.h
 create mode 100644 xen/include/asm-arm/arm64/lse.h
 create mode 100644 xen/include/xen/rwonce.h

diff --git a/xen/include/asm-arm/arm32/atomic.h b/xen/include/asm-arm/arm32/atomic.h
new file mode 100644
index 0000000000..ac6338dd9b
--- /dev/null
+++ b/xen/include/asm-arm/arm32/atomic.h
@@ -0,0 +1,507 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *  arch/arm/include/asm/atomic.h
+ *
+ *  Copyright (C) 1996 Russell King.
+ *  Copyright (C) 2002 Deep Blue Solutions Ltd.
+ */
+#ifndef __ASM_ARM_ATOMIC_H
+#define __ASM_ARM_ATOMIC_H
+
+#include <linux/compiler.h>
+#include <linux/prefetch.h>
+#include <linux/types.h>
+#include <linux/irqflags.h>
+#include <asm/barrier.h>
+#include <asm/cmpxchg.h>
+
+#ifdef __KERNEL__
+
+/*
+ * On ARM, ordinary assignment (str instruction) doesn't clear the local
+ * strex/ldrex monitor on some implementations. The reason we can use it for
+ * atomic_set() is the clrex or dummy strex done on every exception return.
+ */
+#define atomic_read(v)	READ_ONCE((v)->counter)
+#define atomic_set(v,i)	WRITE_ONCE(((v)->counter), (i))
+
+#if __LINUX_ARM_ARCH__ >= 6
+
+/*
+ * ARMv6 UP and SMP safe atomic ops.  We use load exclusive and
+ * store exclusive to ensure that these are atomic.  We may loop
+ * to ensure that the update happens.
+ */
+
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
+}
+
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
+}
+
+#define atomic_add_return_relaxed	atomic_add_return_relaxed
+#define atomic_sub_return_relaxed	atomic_sub_return_relaxed
+#define atomic_fetch_add_relaxed	atomic_fetch_add_relaxed
+#define atomic_fetch_sub_relaxed	atomic_fetch_sub_relaxed
+
+#define atomic_fetch_and_relaxed	atomic_fetch_and_relaxed
+#define atomic_fetch_andnot_relaxed	atomic_fetch_andnot_relaxed
+#define atomic_fetch_or_relaxed		atomic_fetch_or_relaxed
+#define atomic_fetch_xor_relaxed	atomic_fetch_xor_relaxed
+
+static inline int atomic_cmpxchg_relaxed(atomic_t *ptr, int old, int new)
+{
+	int oldval;
+	unsigned long res;
+
+	prefetchw(&ptr->counter);
+
+	do {
+		__asm__ __volatile__("@ atomic_cmpxchg\n"
+		"ldrex	%1, [%3]\n"
+		"mov	%0, #0\n"
+		"teq	%1, %4\n"
+		"strexeq %0, %5, [%3]\n"
+		    : "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
+		    : "r" (&ptr->counter), "Ir" (old), "r" (new)
+		    : "cc");
+	} while (res);
+
+	return oldval;
+}
+#define atomic_cmpxchg_relaxed		atomic_cmpxchg_relaxed
+
+static inline int atomic_fetch_add_unless(atomic_t *v, int a, int u)
+{
+	int oldval, newval;
+	unsigned long tmp;
+
+	smp_mb();
+	prefetchw(&v->counter);
+
+	__asm__ __volatile__ ("@ atomic_add_unless\n"
+"1:	ldrex	%0, [%4]\n"
+"	teq	%0, %5\n"
+"	beq	2f\n"
+"	add	%1, %0, %6\n"
+"	strex	%2, %1, [%4]\n"
+"	teq	%2, #0\n"
+"	bne	1b\n"
+"2:"
+	: "=&r" (oldval), "=&r" (newval), "=&r" (tmp), "+Qo" (v->counter)
+	: "r" (&v->counter), "r" (u), "r" (a)
+	: "cc");
+
+	if (oldval != u)
+		smp_mb();
+
+	return oldval;
+}
+#define atomic_fetch_add_unless		atomic_fetch_add_unless
+
+#else /* ARM_ARCH_6 */
+
+#ifdef CONFIG_SMP
+#error SMP not supported on pre-ARMv6 CPUs
+#endif
+
+#define ATOMIC_OP(op, c_op, asm_op)					\
+static inline void atomic_##op(int i, atomic_t *v)			\
+{									\
+	unsigned long flags;						\
+									\
+	raw_local_irq_save(flags);					\
+	v->counter c_op i;						\
+	raw_local_irq_restore(flags);					\
+}									\
+
+#define ATOMIC_OP_RETURN(op, c_op, asm_op)				\
+static inline int atomic_##op##_return(int i, atomic_t *v)		\
+{									\
+	unsigned long flags;						\
+	int val;							\
+									\
+	raw_local_irq_save(flags);					\
+	v->counter c_op i;						\
+	val = v->counter;						\
+	raw_local_irq_restore(flags);					\
+									\
+	return val;							\
+}
+
+#define ATOMIC_FETCH_OP(op, c_op, asm_op)				\
+static inline int atomic_fetch_##op(int i, atomic_t *v)			\
+{									\
+	unsigned long flags;						\
+	int val;							\
+									\
+	raw_local_irq_save(flags);					\
+	val = v->counter;						\
+	v->counter c_op i;						\
+	raw_local_irq_restore(flags);					\
+									\
+	return val;							\
+}
+
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
+{
+	int ret;
+	unsigned long flags;
+
+	raw_local_irq_save(flags);
+	ret = v->counter;
+	if (likely(ret == old))
+		v->counter = new;
+	raw_local_irq_restore(flags);
+
+	return ret;
+}
+
+#define atomic_fetch_andnot		atomic_fetch_andnot
+
+#endif /* __LINUX_ARM_ARCH__ */
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
+
+#ifndef CONFIG_GENERIC_ATOMIC64
+typedef struct {
+	s64 counter;
+} atomic64_t;
+
+#define ATOMIC64_INIT(i) { (i) }
+
+#ifdef CONFIG_ARM_LPAE
+static inline s64 atomic64_read(const atomic64_t *v)
+{
+	s64 result;
+
+	__asm__ __volatile__("@ atomic64_read\n"
+"	ldrd	%0, %H0, [%1]"
+	: "=&r" (result)
+	: "r" (&v->counter), "Qo" (v->counter)
+	);
+
+	return result;
+}
+
+static inline void atomic64_set(atomic64_t *v, s64 i)
+{
+	__asm__ __volatile__("@ atomic64_set\n"
+"	strd	%2, %H2, [%1]"
+	: "=Qo" (v->counter)
+	: "r" (&v->counter), "r" (i)
+	);
+}
+#else
+static inline s64 atomic64_read(const atomic64_t *v)
+{
+	s64 result;
+
+	__asm__ __volatile__("@ atomic64_read\n"
+"	ldrexd	%0, %H0, [%1]"
+	: "=&r" (result)
+	: "r" (&v->counter), "Qo" (v->counter)
+	);
+
+	return result;
+}
+
+static inline void atomic64_set(atomic64_t *v, s64 i)
+{
+	s64 tmp;
+
+	prefetchw(&v->counter);
+	__asm__ __volatile__("@ atomic64_set\n"
+"1:	ldrexd	%0, %H0, [%2]\n"
+"	strexd	%0, %3, %H3, [%2]\n"
+"	teq	%0, #0\n"
+"	bne	1b"
+	: "=&r" (tmp), "=Qo" (v->counter)
+	: "r" (&v->counter), "r" (i)
+	: "cc");
+}
+#endif
+
+#define ATOMIC64_OP(op, op1, op2)					\
+static inline void atomic64_##op(s64 i, atomic64_t *v)			\
+{									\
+	s64 result;							\
+	unsigned long tmp;						\
+									\
+	prefetchw(&v->counter);						\
+	__asm__ __volatile__("@ atomic64_" #op "\n"			\
+"1:	ldrexd	%0, %H0, [%3]\n"					\
+"	" #op1 " %Q0, %Q0, %Q4\n"					\
+"	" #op2 " %R0, %R0, %R4\n"					\
+"	strexd	%1, %0, %H0, [%3]\n"					\
+"	teq	%1, #0\n"						\
+"	bne	1b"							\
+	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)		\
+	: "r" (&v->counter), "r" (i)					\
+	: "cc");							\
+}									\
+
+#define ATOMIC64_OP_RETURN(op, op1, op2)				\
+static inline s64							\
+atomic64_##op##_return_relaxed(s64 i, atomic64_t *v)			\
+{									\
+	s64 result;							\
+	unsigned long tmp;						\
+									\
+	prefetchw(&v->counter);						\
+									\
+	__asm__ __volatile__("@ atomic64_" #op "_return\n"		\
+"1:	ldrexd	%0, %H0, [%3]\n"					\
+"	" #op1 " %Q0, %Q0, %Q4\n"					\
+"	" #op2 " %R0, %R0, %R4\n"					\
+"	strexd	%1, %0, %H0, [%3]\n"					\
+"	teq	%1, #0\n"						\
+"	bne	1b"							\
+	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)		\
+	: "r" (&v->counter), "r" (i)					\
+	: "cc");							\
+									\
+	return result;							\
+}
+
+#define ATOMIC64_FETCH_OP(op, op1, op2)					\
+static inline s64							\
+atomic64_fetch_##op##_relaxed(s64 i, atomic64_t *v)			\
+{									\
+	s64 result, val;						\
+	unsigned long tmp;						\
+									\
+	prefetchw(&v->counter);						\
+									\
+	__asm__ __volatile__("@ atomic64_fetch_" #op "\n"		\
+"1:	ldrexd	%0, %H0, [%4]\n"					\
+"	" #op1 " %Q1, %Q0, %Q5\n"					\
+"	" #op2 " %R1, %R0, %R5\n"					\
+"	strexd	%2, %1, %H1, [%4]\n"					\
+"	teq	%2, #0\n"						\
+"	bne	1b"							\
+	: "=&r" (result), "=&r" (val), "=&r" (tmp), "+Qo" (v->counter)	\
+	: "r" (&v->counter), "r" (i)					\
+	: "cc");							\
+									\
+	return result;							\
+}
+
+#define ATOMIC64_OPS(op, op1, op2)					\
+	ATOMIC64_OP(op, op1, op2)					\
+	ATOMIC64_OP_RETURN(op, op1, op2)				\
+	ATOMIC64_FETCH_OP(op, op1, op2)
+
+ATOMIC64_OPS(add, adds, adc)
+ATOMIC64_OPS(sub, subs, sbc)
+
+#define atomic64_add_return_relaxed	atomic64_add_return_relaxed
+#define atomic64_sub_return_relaxed	atomic64_sub_return_relaxed
+#define atomic64_fetch_add_relaxed	atomic64_fetch_add_relaxed
+#define atomic64_fetch_sub_relaxed	atomic64_fetch_sub_relaxed
+
+#undef ATOMIC64_OPS
+#define ATOMIC64_OPS(op, op1, op2)					\
+	ATOMIC64_OP(op, op1, op2)					\
+	ATOMIC64_FETCH_OP(op, op1, op2)
+
+#define atomic64_andnot atomic64_andnot
+
+ATOMIC64_OPS(and, and, and)
+ATOMIC64_OPS(andnot, bic, bic)
+ATOMIC64_OPS(or,  orr, orr)
+ATOMIC64_OPS(xor, eor, eor)
+
+#define atomic64_fetch_and_relaxed	atomic64_fetch_and_relaxed
+#define atomic64_fetch_andnot_relaxed	atomic64_fetch_andnot_relaxed
+#define atomic64_fetch_or_relaxed	atomic64_fetch_or_relaxed
+#define atomic64_fetch_xor_relaxed	atomic64_fetch_xor_relaxed
+
+#undef ATOMIC64_OPS
+#undef ATOMIC64_FETCH_OP
+#undef ATOMIC64_OP_RETURN
+#undef ATOMIC64_OP
+
+static inline s64 atomic64_cmpxchg_relaxed(atomic64_t *ptr, s64 old, s64 new)
+{
+	s64 oldval;
+	unsigned long res;
+
+	prefetchw(&ptr->counter);
+
+	do {
+		__asm__ __volatile__("@ atomic64_cmpxchg\n"
+		"ldrexd		%1, %H1, [%3]\n"
+		"mov		%0, #0\n"
+		"teq		%1, %4\n"
+		"teqeq		%H1, %H4\n"
+		"strexdeq	%0, %5, %H5, [%3]"
+		: "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
+		: "r" (&ptr->counter), "r" (old), "r" (new)
+		: "cc");
+	} while (res);
+
+	return oldval;
+}
+#define atomic64_cmpxchg_relaxed	atomic64_cmpxchg_relaxed
+
+static inline s64 atomic64_xchg_relaxed(atomic64_t *ptr, s64 new)
+{
+	s64 result;
+	unsigned long tmp;
+
+	prefetchw(&ptr->counter);
+
+	__asm__ __volatile__("@ atomic64_xchg\n"
+"1:	ldrexd	%0, %H0, [%3]\n"
+"	strexd	%1, %4, %H4, [%3]\n"
+"	teq	%1, #0\n"
+"	bne	1b"
+	: "=&r" (result), "=&r" (tmp), "+Qo" (ptr->counter)
+	: "r" (&ptr->counter), "r" (new)
+	: "cc");
+
+	return result;
+}
+#define atomic64_xchg_relaxed		atomic64_xchg_relaxed
+
+static inline s64 atomic64_dec_if_positive(atomic64_t *v)
+{
+	s64 result;
+	unsigned long tmp;
+
+	smp_mb();
+	prefetchw(&v->counter);
+
+	__asm__ __volatile__("@ atomic64_dec_if_positive\n"
+"1:	ldrexd	%0, %H0, [%3]\n"
+"	subs	%Q0, %Q0, #1\n"
+"	sbc	%R0, %R0, #0\n"
+"	teq	%R0, #0\n"
+"	bmi	2f\n"
+"	strexd	%1, %0, %H0, [%3]\n"
+"	teq	%1, #0\n"
+"	bne	1b\n"
+"2:"
+	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
+	: "r" (&v->counter)
+	: "cc");
+
+	smp_mb();
+
+	return result;
+}
+#define atomic64_dec_if_positive atomic64_dec_if_positive
+
+static inline s64 atomic64_fetch_add_unless(atomic64_t *v, s64 a, s64 u)
+{
+	s64 oldval, newval;
+	unsigned long tmp;
+
+	smp_mb();
+	prefetchw(&v->counter);
+
+	__asm__ __volatile__("@ atomic64_add_unless\n"
+"1:	ldrexd	%0, %H0, [%4]\n"
+"	teq	%0, %5\n"
+"	teqeq	%H0, %H5\n"
+"	beq	2f\n"
+"	adds	%Q1, %Q0, %Q6\n"
+"	adc	%R1, %R0, %R6\n"
+"	strexd	%2, %1, %H1, [%4]\n"
+"	teq	%2, #0\n"
+"	bne	1b\n"
+"2:"
+	: "=&r" (oldval), "=&r" (newval), "=&r" (tmp), "+Qo" (v->counter)
+	: "r" (&v->counter), "r" (u), "r" (a)
+	: "cc");
+
+	if (oldval != u)
+		smp_mb();
+
+	return oldval;
+}
+#define atomic64_fetch_add_unless atomic64_fetch_add_unless
+
+#endif /* !CONFIG_GENERIC_ATOMIC64 */
+#endif
+#endif
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
new file mode 100644
index 0000000000..638ae84afb
--- /dev/null
+++ b/xen/include/asm-arm/arm32/cmpxchg.h
@@ -0,0 +1,279 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_ARM_CMPXCHG_H
+#define __ASM_ARM_CMPXCHG_H
+
+#include <linux/irqflags.h>
+#include <linux/prefetch.h>
+#include <asm/barrier.h>
+
+#if defined(CONFIG_CPU_SA1100) || defined(CONFIG_CPU_SA110)
+/*
+ * On the StrongARM, "swp" is terminally broken since it bypasses the
+ * cache totally.  This means that the cache becomes inconsistent, and,
+ * since we use normal loads/stores as well, this is really bad.
+ * Typically, this causes oopsen in filp_close, but could have other,
+ * more disastrous effects.  There are two work-arounds:
+ *  1. Disable interrupts and emulate the atomic swap
+ *  2. Clean the cache, perform atomic swap, flush the cache
+ *
+ * We choose (1) since its the "easiest" to achieve here and is not
+ * dependent on the processor type.
+ *
+ * NOTE that this solution won't work on an SMP system, so explcitly
+ * forbid it here.
+ */
+#define swp_is_buggy
+#endif
+
+static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
+{
+	extern void __bad_xchg(volatile void *, int);
+	unsigned long ret;
+#ifdef swp_is_buggy
+	unsigned long flags;
+#endif
+#if __LINUX_ARM_ARCH__ >= 6
+	unsigned int tmp;
+#endif
+
+	prefetchw((const void *)ptr);
+
+	switch (size) {
+#if __LINUX_ARM_ARCH__ >= 6
+#ifndef CONFIG_CPU_V6 /* MIN ARCH >= V6K */
+	case 1:
+		asm volatile("@	__xchg1\n"
+		"1:	ldrexb	%0, [%3]\n"
+		"	strexb	%1, %2, [%3]\n"
+		"	teq	%1, #0\n"
+		"	bne	1b"
+			: "=&r" (ret), "=&r" (tmp)
+			: "r" (x), "r" (ptr)
+			: "memory", "cc");
+		break;
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
+#endif
+	case 4:
+		asm volatile("@	__xchg4\n"
+		"1:	ldrex	%0, [%3]\n"
+		"	strex	%1, %2, [%3]\n"
+		"	teq	%1, #0\n"
+		"	bne	1b"
+			: "=&r" (ret), "=&r" (tmp)
+			: "r" (x), "r" (ptr)
+			: "memory", "cc");
+		break;
+#elif defined(swp_is_buggy)
+#ifdef CONFIG_SMP
+#error SMP is not supported on this platform
+#endif
+	case 1:
+		raw_local_irq_save(flags);
+		ret = *(volatile unsigned char *)ptr;
+		*(volatile unsigned char *)ptr = x;
+		raw_local_irq_restore(flags);
+		break;
+
+	case 4:
+		raw_local_irq_save(flags);
+		ret = *(volatile unsigned long *)ptr;
+		*(volatile unsigned long *)ptr = x;
+		raw_local_irq_restore(flags);
+		break;
+#else
+	case 1:
+		asm volatile("@	__xchg1\n"
+		"	swpb	%0, %1, [%2]"
+			: "=&r" (ret)
+			: "r" (x), "r" (ptr)
+			: "memory", "cc");
+		break;
+	case 4:
+		asm volatile("@	__xchg4\n"
+		"	swp	%0, %1, [%2]"
+			: "=&r" (ret)
+			: "r" (x), "r" (ptr)
+			: "memory", "cc");
+		break;
+#endif
+	default:
+		/* Cause a link-time error, the xchg() size is not supported */
+		__bad_xchg(ptr, size), ret = 0;
+		break;
+	}
+
+	return ret;
+}
+
+#define xchg_relaxed(ptr, x) ({						\
+	(__typeof__(*(ptr)))__xchg((unsigned long)(x), (ptr),		\
+				   sizeof(*(ptr)));			\
+})
+
+#include <asm-generic/cmpxchg-local.h>
+
+#if __LINUX_ARM_ARCH__ < 6
+/* min ARCH < ARMv6 */
+
+#ifdef CONFIG_SMP
+#error "SMP is not supported on this platform"
+#endif
+
+#define xchg xchg_relaxed
+
+/*
+ * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
+ * them available.
+ */
+#define cmpxchg_local(ptr, o, n) ({					\
+	(__typeof(*ptr))__cmpxchg_local_generic((ptr),			\
+					        (unsigned long)(o),	\
+					        (unsigned long)(n),	\
+					        sizeof(*(ptr)));	\
+})
+
+#define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
+
+#include <asm-generic/cmpxchg.h>
+
+#else	/* min ARCH >= ARMv6 */
+
+extern void __bad_cmpxchg(volatile void *ptr, int size);
+
+/*
+ * cmpxchg only support 32-bits operands on ARMv6.
+ */
+
+static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
+				      unsigned long new, int size)
+{
+	unsigned long oldval, res;
+
+	prefetchw((const void *)ptr);
+
+	switch (size) {
+#ifndef CONFIG_CPU_V6	/* min ARCH >= ARMv6K */
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
+#endif
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
+static inline unsigned long __cmpxchg_local(volatile void *ptr,
+					    unsigned long old,
+					    unsigned long new, int size)
+{
+	unsigned long ret;
+
+	switch (size) {
+#ifdef CONFIG_CPU_V6	/* min ARCH == ARMv6 */
+	case 1:
+	case 2:
+		ret = __cmpxchg_local_generic(ptr, old, new, size);
+		break;
+#endif
+	default:
+		ret = __cmpxchg(ptr, old, new, size);
+	}
+
+	return ret;
+}
+
+#define cmpxchg_local(ptr, o, n) ({					\
+	(__typeof(*ptr))__cmpxchg_local((ptr),				\
+				        (unsigned long)(o),		\
+				        (unsigned long)(n),		\
+				        sizeof(*(ptr)));		\
+})
+
+static inline unsigned long long __cmpxchg64(unsigned long long *ptr,
+					     unsigned long long old,
+					     unsigned long long new)
+{
+	unsigned long long oldval;
+	unsigned long res;
+
+	prefetchw(ptr);
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
+#define cmpxchg64_local(ptr, o, n) cmpxchg64_relaxed((ptr), (o), (n))
+
+#endif	/* __LINUX_ARM_ARCH__ >= 6 */
+
+#endif /* __ASM_ARM_CMPXCHG_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/atomic.h b/xen/include/asm-arm/arm64/atomic.h
new file mode 100644
index 0000000000..a2eab9f091
--- /dev/null
+++ b/xen/include/asm-arm/arm64/atomic.h
@@ -0,0 +1,228 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Based on arch/arm/include/asm/atomic.h
+ *
+ * Copyright (C) 1996 Russell King.
+ * Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * Copyright (C) 2012 ARM Ltd.
+ */
+#ifndef __ASM_ATOMIC_H
+#define __ASM_ATOMIC_H
+
+#include <linux/compiler.h>
+#include <linux/types.h>
+
+#include <asm/barrier.h>
+#include <asm/cmpxchg.h>
+#include <asm/lse.h>
+
+#define ATOMIC_OP(op)							\
+static inline void arch_##op(int i, atomic_t *v)			\
+{									\
+	__lse_ll_sc_body(op, i, v);					\
+}
+
+ATOMIC_OP(atomic_andnot)
+ATOMIC_OP(atomic_or)
+ATOMIC_OP(atomic_xor)
+ATOMIC_OP(atomic_add)
+ATOMIC_OP(atomic_and)
+ATOMIC_OP(atomic_sub)
+
+#undef ATOMIC_OP
+
+#define ATOMIC_FETCH_OP(name, op)					\
+static inline int arch_##op##name(int i, atomic_t *v)			\
+{									\
+	return __lse_ll_sc_body(op##name, i, v);			\
+}
+
+#define ATOMIC_FETCH_OPS(op)						\
+	ATOMIC_FETCH_OP(_relaxed, op)					\
+	ATOMIC_FETCH_OP(_acquire, op)					\
+	ATOMIC_FETCH_OP(_release, op)					\
+	ATOMIC_FETCH_OP(        , op)
+
+ATOMIC_FETCH_OPS(atomic_fetch_andnot)
+ATOMIC_FETCH_OPS(atomic_fetch_or)
+ATOMIC_FETCH_OPS(atomic_fetch_xor)
+ATOMIC_FETCH_OPS(atomic_fetch_add)
+ATOMIC_FETCH_OPS(atomic_fetch_and)
+ATOMIC_FETCH_OPS(atomic_fetch_sub)
+ATOMIC_FETCH_OPS(atomic_add_return)
+ATOMIC_FETCH_OPS(atomic_sub_return)
+
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_FETCH_OPS
+
+#define ATOMIC64_OP(op)							\
+static inline void arch_##op(long i, atomic64_t *v)			\
+{									\
+	__lse_ll_sc_body(op, i, v);					\
+}
+
+ATOMIC64_OP(atomic64_andnot)
+ATOMIC64_OP(atomic64_or)
+ATOMIC64_OP(atomic64_xor)
+ATOMIC64_OP(atomic64_add)
+ATOMIC64_OP(atomic64_and)
+ATOMIC64_OP(atomic64_sub)
+
+#undef ATOMIC64_OP
+
+#define ATOMIC64_FETCH_OP(name, op)					\
+static inline long arch_##op##name(long i, atomic64_t *v)		\
+{									\
+	return __lse_ll_sc_body(op##name, i, v);			\
+}
+
+#define ATOMIC64_FETCH_OPS(op)						\
+	ATOMIC64_FETCH_OP(_relaxed, op)					\
+	ATOMIC64_FETCH_OP(_acquire, op)					\
+	ATOMIC64_FETCH_OP(_release, op)					\
+	ATOMIC64_FETCH_OP(        , op)
+
+ATOMIC64_FETCH_OPS(atomic64_fetch_andnot)
+ATOMIC64_FETCH_OPS(atomic64_fetch_or)
+ATOMIC64_FETCH_OPS(atomic64_fetch_xor)
+ATOMIC64_FETCH_OPS(atomic64_fetch_add)
+ATOMIC64_FETCH_OPS(atomic64_fetch_and)
+ATOMIC64_FETCH_OPS(atomic64_fetch_sub)
+ATOMIC64_FETCH_OPS(atomic64_add_return)
+ATOMIC64_FETCH_OPS(atomic64_sub_return)
+
+#undef ATOMIC64_FETCH_OP
+#undef ATOMIC64_FETCH_OPS
+
+static inline long arch_atomic64_dec_if_positive(atomic64_t *v)
+{
+	return __lse_ll_sc_body(atomic64_dec_if_positive, v);
+}
+
+#define arch_atomic_read(v)			__READ_ONCE((v)->counter)
+#define arch_atomic_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
+
+#define arch_atomic_add_return_relaxed		arch_atomic_add_return_relaxed
+#define arch_atomic_add_return_acquire		arch_atomic_add_return_acquire
+#define arch_atomic_add_return_release		arch_atomic_add_return_release
+#define arch_atomic_add_return			arch_atomic_add_return
+
+#define arch_atomic_sub_return_relaxed		arch_atomic_sub_return_relaxed
+#define arch_atomic_sub_return_acquire		arch_atomic_sub_return_acquire
+#define arch_atomic_sub_return_release		arch_atomic_sub_return_release
+#define arch_atomic_sub_return			arch_atomic_sub_return
+
+#define arch_atomic_fetch_add_relaxed		arch_atomic_fetch_add_relaxed
+#define arch_atomic_fetch_add_acquire		arch_atomic_fetch_add_acquire
+#define arch_atomic_fetch_add_release		arch_atomic_fetch_add_release
+#define arch_atomic_fetch_add			arch_atomic_fetch_add
+
+#define arch_atomic_fetch_sub_relaxed		arch_atomic_fetch_sub_relaxed
+#define arch_atomic_fetch_sub_acquire		arch_atomic_fetch_sub_acquire
+#define arch_atomic_fetch_sub_release		arch_atomic_fetch_sub_release
+#define arch_atomic_fetch_sub			arch_atomic_fetch_sub
+
+#define arch_atomic_fetch_and_relaxed		arch_atomic_fetch_and_relaxed
+#define arch_atomic_fetch_and_acquire		arch_atomic_fetch_and_acquire
+#define arch_atomic_fetch_and_release		arch_atomic_fetch_and_release
+#define arch_atomic_fetch_and			arch_atomic_fetch_and
+
+#define arch_atomic_fetch_andnot_relaxed	arch_atomic_fetch_andnot_relaxed
+#define arch_atomic_fetch_andnot_acquire	arch_atomic_fetch_andnot_acquire
+#define arch_atomic_fetch_andnot_release	arch_atomic_fetch_andnot_release
+#define arch_atomic_fetch_andnot		arch_atomic_fetch_andnot
+
+#define arch_atomic_fetch_or_relaxed		arch_atomic_fetch_or_relaxed
+#define arch_atomic_fetch_or_acquire		arch_atomic_fetch_or_acquire
+#define arch_atomic_fetch_or_release		arch_atomic_fetch_or_release
+#define arch_atomic_fetch_or			arch_atomic_fetch_or
+
+#define arch_atomic_fetch_xor_relaxed		arch_atomic_fetch_xor_relaxed
+#define arch_atomic_fetch_xor_acquire		arch_atomic_fetch_xor_acquire
+#define arch_atomic_fetch_xor_release		arch_atomic_fetch_xor_release
+#define arch_atomic_fetch_xor			arch_atomic_fetch_xor
+
+#define arch_atomic_xchg_relaxed(v, new) \
+	arch_xchg_relaxed(&((v)->counter), (new))
+#define arch_atomic_xchg_acquire(v, new) \
+	arch_xchg_acquire(&((v)->counter), (new))
+#define arch_atomic_xchg_release(v, new) \
+	arch_xchg_release(&((v)->counter), (new))
+#define arch_atomic_xchg(v, new) \
+	arch_xchg(&((v)->counter), (new))
+
+#define arch_atomic_cmpxchg_relaxed(v, old, new) \
+	arch_cmpxchg_relaxed(&((v)->counter), (old), (new))
+#define arch_atomic_cmpxchg_acquire(v, old, new) \
+	arch_cmpxchg_acquire(&((v)->counter), (old), (new))
+#define arch_atomic_cmpxchg_release(v, old, new) \
+	arch_cmpxchg_release(&((v)->counter), (old), (new))
+#define arch_atomic_cmpxchg(v, old, new) \
+	arch_cmpxchg(&((v)->counter), (old), (new))
+
+#define arch_atomic_andnot			arch_atomic_andnot
+
+/*
+ * 64-bit arch_atomic operations.
+ */
+#define ATOMIC64_INIT				ATOMIC_INIT
+#define arch_atomic64_read			arch_atomic_read
+#define arch_atomic64_set			arch_atomic_set
+
+#define arch_atomic64_add_return_relaxed	arch_atomic64_add_return_relaxed
+#define arch_atomic64_add_return_acquire	arch_atomic64_add_return_acquire
+#define arch_atomic64_add_return_release	arch_atomic64_add_return_release
+#define arch_atomic64_add_return		arch_atomic64_add_return
+
+#define arch_atomic64_sub_return_relaxed	arch_atomic64_sub_return_relaxed
+#define arch_atomic64_sub_return_acquire	arch_atomic64_sub_return_acquire
+#define arch_atomic64_sub_return_release	arch_atomic64_sub_return_release
+#define arch_atomic64_sub_return		arch_atomic64_sub_return
+
+#define arch_atomic64_fetch_add_relaxed		arch_atomic64_fetch_add_relaxed
+#define arch_atomic64_fetch_add_acquire		arch_atomic64_fetch_add_acquire
+#define arch_atomic64_fetch_add_release		arch_atomic64_fetch_add_release
+#define arch_atomic64_fetch_add			arch_atomic64_fetch_add
+
+#define arch_atomic64_fetch_sub_relaxed		arch_atomic64_fetch_sub_relaxed
+#define arch_atomic64_fetch_sub_acquire		arch_atomic64_fetch_sub_acquire
+#define arch_atomic64_fetch_sub_release		arch_atomic64_fetch_sub_release
+#define arch_atomic64_fetch_sub			arch_atomic64_fetch_sub
+
+#define arch_atomic64_fetch_and_relaxed		arch_atomic64_fetch_and_relaxed
+#define arch_atomic64_fetch_and_acquire		arch_atomic64_fetch_and_acquire
+#define arch_atomic64_fetch_and_release		arch_atomic64_fetch_and_release
+#define arch_atomic64_fetch_and			arch_atomic64_fetch_and
+
+#define arch_atomic64_fetch_andnot_relaxed	arch_atomic64_fetch_andnot_relaxed
+#define arch_atomic64_fetch_andnot_acquire	arch_atomic64_fetch_andnot_acquire
+#define arch_atomic64_fetch_andnot_release	arch_atomic64_fetch_andnot_release
+#define arch_atomic64_fetch_andnot		arch_atomic64_fetch_andnot
+
+#define arch_atomic64_fetch_or_relaxed		arch_atomic64_fetch_or_relaxed
+#define arch_atomic64_fetch_or_acquire		arch_atomic64_fetch_or_acquire
+#define arch_atomic64_fetch_or_release		arch_atomic64_fetch_or_release
+#define arch_atomic64_fetch_or			arch_atomic64_fetch_or
+
+#define arch_atomic64_fetch_xor_relaxed		arch_atomic64_fetch_xor_relaxed
+#define arch_atomic64_fetch_xor_acquire		arch_atomic64_fetch_xor_acquire
+#define arch_atomic64_fetch_xor_release		arch_atomic64_fetch_xor_release
+#define arch_atomic64_fetch_xor			arch_atomic64_fetch_xor
+
+#define arch_atomic64_xchg_relaxed		arch_atomic_xchg_relaxed
+#define arch_atomic64_xchg_acquire		arch_atomic_xchg_acquire
+#define arch_atomic64_xchg_release		arch_atomic_xchg_release
+#define arch_atomic64_xchg			arch_atomic_xchg
+
+#define arch_atomic64_cmpxchg_relaxed		arch_atomic_cmpxchg_relaxed
+#define arch_atomic64_cmpxchg_acquire		arch_atomic_cmpxchg_acquire
+#define arch_atomic64_cmpxchg_release		arch_atomic_cmpxchg_release
+#define arch_atomic64_cmpxchg			arch_atomic_cmpxchg
+
+#define arch_atomic64_andnot			arch_atomic64_andnot
+
+#define arch_atomic64_dec_if_positive		arch_atomic64_dec_if_positive
+
+#define ARCH_ATOMIC
+
+#endif /* __ASM_ATOMIC_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/atomic_ll_sc.h b/xen/include/asm-arm/arm64/atomic_ll_sc.h
new file mode 100644
index 0000000000..e1009c0f94
--- /dev/null
+++ b/xen/include/asm-arm/arm64/atomic_ll_sc.h
@@ -0,0 +1,353 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Based on arch/arm/include/asm/atomic.h
+ *
+ * Copyright (C) 1996 Russell King.
+ * Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * Copyright (C) 2012 ARM Ltd.
+ */
+
+#ifndef __ASM_ATOMIC_LL_SC_H
+#define __ASM_ATOMIC_LL_SC_H
+
+#include <linux/stringify.h>
+
+#ifdef CONFIG_ARM64_LSE_ATOMICS
+#define __LL_SC_FALLBACK(asm_ops)					\
+"	b	3f\n"							\
+"	.subsection	1\n"						\
+"3:\n"									\
+asm_ops "\n"								\
+"	b	4f\n"							\
+"	.previous\n"							\
+"4:\n"
+#else
+#define __LL_SC_FALLBACK(asm_ops) asm_ops
+#endif
+
+#ifndef CONFIG_CC_HAS_K_CONSTRAINT
+#define K
+#endif
+
+/*
+ * AArch64 UP and SMP safe atomic ops.  We use load exclusive and
+ * store exclusive to ensure that these are atomic.  We may loop
+ * to ensure that the update happens.
+ */
+
+#define ATOMIC_OP(op, asm_op, constraint)				\
+static inline void							\
+__ll_sc_atomic_##op(int i, atomic_t *v)					\
+{									\
+	unsigned long tmp;						\
+	int result;							\
+									\
+	asm volatile("// atomic_" #op "\n"				\
+	__LL_SC_FALLBACK(						\
+"	prfm	pstl1strm, %2\n"					\
+"1:	ldxr	%w0, %2\n"						\
+"	" #asm_op "	%w0, %w0, %w3\n"				\
+"	stxr	%w1, %w0, %2\n"						\
+"	cbnz	%w1, 1b\n")						\
+	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)		\
+	: __stringify(constraint) "r" (i));				\
+}
+
+#define ATOMIC_OP_RETURN(name, mb, acq, rel, cl, op, asm_op, constraint)\
+static inline int							\
+__ll_sc_atomic_##op##_return##name(int i, atomic_t *v)			\
+{									\
+	unsigned long tmp;						\
+	int result;							\
+									\
+	asm volatile("// atomic_" #op "_return" #name "\n"		\
+	__LL_SC_FALLBACK(						\
+"	prfm	pstl1strm, %2\n"					\
+"1:	ld" #acq "xr	%w0, %2\n"					\
+"	" #asm_op "	%w0, %w0, %w3\n"				\
+"	st" #rel "xr	%w1, %w0, %2\n"					\
+"	cbnz	%w1, 1b\n"						\
+"	" #mb )								\
+	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)		\
+	: __stringify(constraint) "r" (i)				\
+	: cl);								\
+									\
+	return result;							\
+}
+
+#define ATOMIC_FETCH_OP(name, mb, acq, rel, cl, op, asm_op, constraint) \
+static inline int							\
+__ll_sc_atomic_fetch_##op##name(int i, atomic_t *v)			\
+{									\
+	unsigned long tmp;						\
+	int val, result;						\
+									\
+	asm volatile("// atomic_fetch_" #op #name "\n"			\
+	__LL_SC_FALLBACK(						\
+"	prfm	pstl1strm, %3\n"					\
+"1:	ld" #acq "xr	%w0, %3\n"					\
+"	" #asm_op "	%w1, %w0, %w4\n"				\
+"	st" #rel "xr	%w2, %w1, %3\n"					\
+"	cbnz	%w2, 1b\n"						\
+"	" #mb )								\
+	: "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter)	\
+	: __stringify(constraint) "r" (i)				\
+	: cl);								\
+									\
+	return result;							\
+}
+
+#define ATOMIC_OPS(...)							\
+	ATOMIC_OP(__VA_ARGS__)						\
+	ATOMIC_OP_RETURN(        , dmb ish,  , l, "memory", __VA_ARGS__)\
+	ATOMIC_OP_RETURN(_relaxed,        ,  ,  ,         , __VA_ARGS__)\
+	ATOMIC_OP_RETURN(_acquire,        , a,  , "memory", __VA_ARGS__)\
+	ATOMIC_OP_RETURN(_release,        ,  , l, "memory", __VA_ARGS__)\
+	ATOMIC_FETCH_OP (        , dmb ish,  , l, "memory", __VA_ARGS__)\
+	ATOMIC_FETCH_OP (_relaxed,        ,  ,  ,         , __VA_ARGS__)\
+	ATOMIC_FETCH_OP (_acquire,        , a,  , "memory", __VA_ARGS__)\
+	ATOMIC_FETCH_OP (_release,        ,  , l, "memory", __VA_ARGS__)
+
+ATOMIC_OPS(add, add, I)
+ATOMIC_OPS(sub, sub, J)
+
+#undef ATOMIC_OPS
+#define ATOMIC_OPS(...)							\
+	ATOMIC_OP(__VA_ARGS__)						\
+	ATOMIC_FETCH_OP (        , dmb ish,  , l, "memory", __VA_ARGS__)\
+	ATOMIC_FETCH_OP (_relaxed,        ,  ,  ,         , __VA_ARGS__)\
+	ATOMIC_FETCH_OP (_acquire,        , a,  , "memory", __VA_ARGS__)\
+	ATOMIC_FETCH_OP (_release,        ,  , l, "memory", __VA_ARGS__)
+
+ATOMIC_OPS(and, and, K)
+ATOMIC_OPS(or, orr, K)
+ATOMIC_OPS(xor, eor, K)
+/*
+ * GAS converts the mysterious and undocumented BIC (immediate) alias to
+ * an AND (immediate) instruction with the immediate inverted. We don't
+ * have a constraint for this, so fall back to register.
+ */
+ATOMIC_OPS(andnot, bic, )
+
+#undef ATOMIC_OPS
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_OP_RETURN
+#undef ATOMIC_OP
+
+#define ATOMIC64_OP(op, asm_op, constraint)				\
+static inline void							\
+__ll_sc_atomic64_##op(s64 i, atomic64_t *v)				\
+{									\
+	s64 result;							\
+	unsigned long tmp;						\
+									\
+	asm volatile("// atomic64_" #op "\n"				\
+	__LL_SC_FALLBACK(						\
+"	prfm	pstl1strm, %2\n"					\
+"1:	ldxr	%0, %2\n"						\
+"	" #asm_op "	%0, %0, %3\n"					\
+"	stxr	%w1, %0, %2\n"						\
+"	cbnz	%w1, 1b")						\
+	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)		\
+	: __stringify(constraint) "r" (i));				\
+}
+
+#define ATOMIC64_OP_RETURN(name, mb, acq, rel, cl, op, asm_op, constraint)\
+static inline long							\
+__ll_sc_atomic64_##op##_return##name(s64 i, atomic64_t *v)		\
+{									\
+	s64 result;							\
+	unsigned long tmp;						\
+									\
+	asm volatile("// atomic64_" #op "_return" #name "\n"		\
+	__LL_SC_FALLBACK(						\
+"	prfm	pstl1strm, %2\n"					\
+"1:	ld" #acq "xr	%0, %2\n"					\
+"	" #asm_op "	%0, %0, %3\n"					\
+"	st" #rel "xr	%w1, %0, %2\n"					\
+"	cbnz	%w1, 1b\n"						\
+"	" #mb )								\
+	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)		\
+	: __stringify(constraint) "r" (i)				\
+	: cl);								\
+									\
+	return result;							\
+}
+
+#define ATOMIC64_FETCH_OP(name, mb, acq, rel, cl, op, asm_op, constraint)\
+static inline long							\
+__ll_sc_atomic64_fetch_##op##name(s64 i, atomic64_t *v)		\
+{									\
+	s64 result, val;						\
+	unsigned long tmp;						\
+									\
+	asm volatile("// atomic64_fetch_" #op #name "\n"		\
+	__LL_SC_FALLBACK(						\
+"	prfm	pstl1strm, %3\n"					\
+"1:	ld" #acq "xr	%0, %3\n"					\
+"	" #asm_op "	%1, %0, %4\n"					\
+"	st" #rel "xr	%w2, %1, %3\n"					\
+"	cbnz	%w2, 1b\n"						\
+"	" #mb )								\
+	: "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter)	\
+	: __stringify(constraint) "r" (i)				\
+	: cl);								\
+									\
+	return result;							\
+}
+
+#define ATOMIC64_OPS(...)						\
+	ATOMIC64_OP(__VA_ARGS__)					\
+	ATOMIC64_OP_RETURN(, dmb ish,  , l, "memory", __VA_ARGS__)	\
+	ATOMIC64_OP_RETURN(_relaxed,,  ,  ,         , __VA_ARGS__)	\
+	ATOMIC64_OP_RETURN(_acquire,, a,  , "memory", __VA_ARGS__)	\
+	ATOMIC64_OP_RETURN(_release,,  , l, "memory", __VA_ARGS__)	\
+	ATOMIC64_FETCH_OP (, dmb ish,  , l, "memory", __VA_ARGS__)	\
+	ATOMIC64_FETCH_OP (_relaxed,,  ,  ,         , __VA_ARGS__)	\
+	ATOMIC64_FETCH_OP (_acquire,, a,  , "memory", __VA_ARGS__)	\
+	ATOMIC64_FETCH_OP (_release,,  , l, "memory", __VA_ARGS__)
+
+ATOMIC64_OPS(add, add, I)
+ATOMIC64_OPS(sub, sub, J)
+
+#undef ATOMIC64_OPS
+#define ATOMIC64_OPS(...)						\
+	ATOMIC64_OP(__VA_ARGS__)					\
+	ATOMIC64_FETCH_OP (, dmb ish,  , l, "memory", __VA_ARGS__)	\
+	ATOMIC64_FETCH_OP (_relaxed,,  ,  ,         , __VA_ARGS__)	\
+	ATOMIC64_FETCH_OP (_acquire,, a,  , "memory", __VA_ARGS__)	\
+	ATOMIC64_FETCH_OP (_release,,  , l, "memory", __VA_ARGS__)
+
+ATOMIC64_OPS(and, and, L)
+ATOMIC64_OPS(or, orr, L)
+ATOMIC64_OPS(xor, eor, L)
+/*
+ * GAS converts the mysterious and undocumented BIC (immediate) alias to
+ * an AND (immediate) instruction with the immediate inverted. We don't
+ * have a constraint for this, so fall back to register.
+ */
+ATOMIC64_OPS(andnot, bic, )
+
+#undef ATOMIC64_OPS
+#undef ATOMIC64_FETCH_OP
+#undef ATOMIC64_OP_RETURN
+#undef ATOMIC64_OP
+
+static inline s64
+__ll_sc_atomic64_dec_if_positive(atomic64_t *v)
+{
+	s64 result;
+	unsigned long tmp;
+
+	asm volatile("// atomic64_dec_if_positive\n"
+	__LL_SC_FALLBACK(
+"	prfm	pstl1strm, %2\n"
+"1:	ldxr	%0, %2\n"
+"	subs	%0, %0, #1\n"
+"	b.lt	2f\n"
+"	stlxr	%w1, %0, %2\n"
+"	cbnz	%w1, 1b\n"
+"	dmb	ish\n"
+"2:")
+	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
+	:
+	: "cc", "memory");
+
+	return result;
+}
+
+#define __CMPXCHG_CASE(w, sfx, name, sz, mb, acq, rel, cl, constraint)	\
+static inline u##sz							\
+__ll_sc__cmpxchg_case_##name##sz(volatile void *ptr,			\
+					 unsigned long old,		\
+					 u##sz new)			\
+{									\
+	unsigned long tmp;						\
+	u##sz oldval;							\
+									\
+	/*								\
+	 * Sub-word sizes require explicit casting so that the compare  \
+	 * part of the cmpxchg doesn't end up interpreting non-zero	\
+	 * upper bits of the register containing "old".			\
+	 */								\
+	if (sz < 32)							\
+		old = (u##sz)old;					\
+									\
+	asm volatile(							\
+	__LL_SC_FALLBACK(						\
+	"	prfm	pstl1strm, %[v]\n"				\
+	"1:	ld" #acq "xr" #sfx "\t%" #w "[oldval], %[v]\n"		\
+	"	eor	%" #w "[tmp], %" #w "[oldval], %" #w "[old]\n"	\
+	"	cbnz	%" #w "[tmp], 2f\n"				\
+	"	st" #rel "xr" #sfx "\t%w[tmp], %" #w "[new], %[v]\n"	\
+	"	cbnz	%w[tmp], 1b\n"					\
+	"	" #mb "\n"						\
+	"2:")								\
+	: [tmp] "=&r" (tmp), [oldval] "=&r" (oldval),			\
+	  [v] "+Q" (*(u##sz *)ptr)					\
+	: [old] __stringify(constraint) "r" (old), [new] "r" (new)	\
+	: cl);								\
+									\
+	return oldval;							\
+}
+
+/*
+ * Earlier versions of GCC (no later than 8.1.0) appear to incorrectly
+ * handle the 'K' constraint for the value 4294967295 - thus we use no
+ * constraint for 32 bit operations.
+ */
+__CMPXCHG_CASE(w, b,     ,  8,        ,  ,  ,         , K)
+__CMPXCHG_CASE(w, h,     , 16,        ,  ,  ,         , K)
+__CMPXCHG_CASE(w,  ,     , 32,        ,  ,  ,         , K)
+__CMPXCHG_CASE( ,  ,     , 64,        ,  ,  ,         , L)
+__CMPXCHG_CASE(w, b, acq_,  8,        , a,  , "memory", K)
+__CMPXCHG_CASE(w, h, acq_, 16,        , a,  , "memory", K)
+__CMPXCHG_CASE(w,  , acq_, 32,        , a,  , "memory", K)
+__CMPXCHG_CASE( ,  , acq_, 64,        , a,  , "memory", L)
+__CMPXCHG_CASE(w, b, rel_,  8,        ,  , l, "memory", K)
+__CMPXCHG_CASE(w, h, rel_, 16,        ,  , l, "memory", K)
+__CMPXCHG_CASE(w,  , rel_, 32,        ,  , l, "memory", K)
+__CMPXCHG_CASE( ,  , rel_, 64,        ,  , l, "memory", L)
+__CMPXCHG_CASE(w, b,  mb_,  8, dmb ish,  , l, "memory", K)
+__CMPXCHG_CASE(w, h,  mb_, 16, dmb ish,  , l, "memory", K)
+__CMPXCHG_CASE(w,  ,  mb_, 32, dmb ish,  , l, "memory", K)
+__CMPXCHG_CASE( ,  ,  mb_, 64, dmb ish,  , l, "memory", L)
+
+#undef __CMPXCHG_CASE
+
+#define __CMPXCHG_DBL(name, mb, rel, cl)				\
+static inline long							\
+__ll_sc__cmpxchg_double##name(unsigned long old1,			\
+				      unsigned long old2,		\
+				      unsigned long new1,		\
+				      unsigned long new2,		\
+				      volatile void *ptr)		\
+{									\
+	unsigned long tmp, ret;						\
+									\
+	asm volatile("// __cmpxchg_double" #name "\n"			\
+	__LL_SC_FALLBACK(						\
+	"	prfm	pstl1strm, %2\n"				\
+	"1:	ldxp	%0, %1, %2\n"					\
+	"	eor	%0, %0, %3\n"					\
+	"	eor	%1, %1, %4\n"					\
+	"	orr	%1, %0, %1\n"					\
+	"	cbnz	%1, 2f\n"					\
+	"	st" #rel "xp	%w0, %5, %6, %2\n"			\
+	"	cbnz	%w0, 1b\n"					\
+	"	" #mb "\n"						\
+	"2:")								\
+	: "=&r" (tmp), "=&r" (ret), "+Q" (*(unsigned long *)ptr)	\
+	: "r" (old1), "r" (old2), "r" (new1), "r" (new2)		\
+	: cl);								\
+									\
+	return ret;							\
+}
+
+__CMPXCHG_DBL(   ,        ,  ,         )
+__CMPXCHG_DBL(_mb, dmb ish, l, "memory")
+
+#undef __CMPXCHG_DBL
+#undef K
+
+#endif	/* __ASM_ATOMIC_LL_SC_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/atomic_lse.h b/xen/include/asm-arm/arm64/atomic_lse.h
new file mode 100644
index 0000000000..b3b0d43a7d
--- /dev/null
+++ b/xen/include/asm-arm/arm64/atomic_lse.h
@@ -0,0 +1,419 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Based on arch/arm/include/asm/atomic.h
+ *
+ * Copyright (C) 1996 Russell King.
+ * Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * Copyright (C) 2012 ARM Ltd.
+ */
+
+#ifndef __ASM_ATOMIC_LSE_H
+#define __ASM_ATOMIC_LSE_H
+
+#define ATOMIC_OP(op, asm_op)						\
+static inline void __lse_atomic_##op(int i, atomic_t *v)			\
+{									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+"	" #asm_op "	%w[i], %[v]\n"					\
+	: [i] "+r" (i), [v] "+Q" (v->counter)				\
+	: "r" (v));							\
+}
+
+ATOMIC_OP(andnot, stclr)
+ATOMIC_OP(or, stset)
+ATOMIC_OP(xor, steor)
+ATOMIC_OP(add, stadd)
+
+#undef ATOMIC_OP
+
+#define ATOMIC_FETCH_OP(name, mb, op, asm_op, cl...)			\
+static inline int __lse_atomic_fetch_##op##name(int i, atomic_t *v)	\
+{									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+"	" #asm_op #mb "	%w[i], %w[i], %[v]"				\
+	: [i] "+r" (i), [v] "+Q" (v->counter)				\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+#define ATOMIC_FETCH_OPS(op, asm_op)					\
+	ATOMIC_FETCH_OP(_relaxed,   , op, asm_op)			\
+	ATOMIC_FETCH_OP(_acquire,  a, op, asm_op, "memory")		\
+	ATOMIC_FETCH_OP(_release,  l, op, asm_op, "memory")		\
+	ATOMIC_FETCH_OP(        , al, op, asm_op, "memory")
+
+ATOMIC_FETCH_OPS(andnot, ldclr)
+ATOMIC_FETCH_OPS(or, ldset)
+ATOMIC_FETCH_OPS(xor, ldeor)
+ATOMIC_FETCH_OPS(add, ldadd)
+
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_FETCH_OPS
+
+#define ATOMIC_OP_ADD_RETURN(name, mb, cl...)				\
+static inline int __lse_atomic_add_return##name(int i, atomic_t *v)	\
+{									\
+	u32 tmp;							\
+									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	ldadd" #mb "	%w[i], %w[tmp], %[v]\n"			\
+	"	add	%w[i], %w[i], %w[tmp]"				\
+	: [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)	\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+ATOMIC_OP_ADD_RETURN(_relaxed,   )
+ATOMIC_OP_ADD_RETURN(_acquire,  a, "memory")
+ATOMIC_OP_ADD_RETURN(_release,  l, "memory")
+ATOMIC_OP_ADD_RETURN(        , al, "memory")
+
+#undef ATOMIC_OP_ADD_RETURN
+
+static inline void __lse_atomic_and(int i, atomic_t *v)
+{
+	asm volatile(
+	__LSE_PREAMBLE
+	"	mvn	%w[i], %w[i]\n"
+	"	stclr	%w[i], %[v]"
+	: [i] "+&r" (i), [v] "+Q" (v->counter)
+	: "r" (v));
+}
+
+#define ATOMIC_FETCH_OP_AND(name, mb, cl...)				\
+static inline int __lse_atomic_fetch_and##name(int i, atomic_t *v)	\
+{									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	mvn	%w[i], %w[i]\n"					\
+	"	ldclr" #mb "	%w[i], %w[i], %[v]"			\
+	: [i] "+&r" (i), [v] "+Q" (v->counter)				\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+ATOMIC_FETCH_OP_AND(_relaxed,   )
+ATOMIC_FETCH_OP_AND(_acquire,  a, "memory")
+ATOMIC_FETCH_OP_AND(_release,  l, "memory")
+ATOMIC_FETCH_OP_AND(        , al, "memory")
+
+#undef ATOMIC_FETCH_OP_AND
+
+static inline void __lse_atomic_sub(int i, atomic_t *v)
+{
+	asm volatile(
+	__LSE_PREAMBLE
+	"	neg	%w[i], %w[i]\n"
+	"	stadd	%w[i], %[v]"
+	: [i] "+&r" (i), [v] "+Q" (v->counter)
+	: "r" (v));
+}
+
+#define ATOMIC_OP_SUB_RETURN(name, mb, cl...)				\
+static inline int __lse_atomic_sub_return##name(int i, atomic_t *v)	\
+{									\
+	u32 tmp;							\
+									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	neg	%w[i], %w[i]\n"					\
+	"	ldadd" #mb "	%w[i], %w[tmp], %[v]\n"			\
+	"	add	%w[i], %w[i], %w[tmp]"				\
+	: [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)	\
+	: "r" (v)							\
+	: cl);							\
+									\
+	return i;							\
+}
+
+ATOMIC_OP_SUB_RETURN(_relaxed,   )
+ATOMIC_OP_SUB_RETURN(_acquire,  a, "memory")
+ATOMIC_OP_SUB_RETURN(_release,  l, "memory")
+ATOMIC_OP_SUB_RETURN(        , al, "memory")
+
+#undef ATOMIC_OP_SUB_RETURN
+
+#define ATOMIC_FETCH_OP_SUB(name, mb, cl...)				\
+static inline int __lse_atomic_fetch_sub##name(int i, atomic_t *v)	\
+{									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	neg	%w[i], %w[i]\n"					\
+	"	ldadd" #mb "	%w[i], %w[i], %[v]"			\
+	: [i] "+&r" (i), [v] "+Q" (v->counter)				\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+ATOMIC_FETCH_OP_SUB(_relaxed,   )
+ATOMIC_FETCH_OP_SUB(_acquire,  a, "memory")
+ATOMIC_FETCH_OP_SUB(_release,  l, "memory")
+ATOMIC_FETCH_OP_SUB(        , al, "memory")
+
+#undef ATOMIC_FETCH_OP_SUB
+
+#define ATOMIC64_OP(op, asm_op)						\
+static inline void __lse_atomic64_##op(s64 i, atomic64_t *v)		\
+{									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+"	" #asm_op "	%[i], %[v]\n"					\
+	: [i] "+r" (i), [v] "+Q" (v->counter)				\
+	: "r" (v));							\
+}
+
+ATOMIC64_OP(andnot, stclr)
+ATOMIC64_OP(or, stset)
+ATOMIC64_OP(xor, steor)
+ATOMIC64_OP(add, stadd)
+
+#undef ATOMIC64_OP
+
+#define ATOMIC64_FETCH_OP(name, mb, op, asm_op, cl...)			\
+static inline long __lse_atomic64_fetch_##op##name(s64 i, atomic64_t *v)\
+{									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+"	" #asm_op #mb "	%[i], %[i], %[v]"				\
+	: [i] "+r" (i), [v] "+Q" (v->counter)				\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+#define ATOMIC64_FETCH_OPS(op, asm_op)					\
+	ATOMIC64_FETCH_OP(_relaxed,   , op, asm_op)			\
+	ATOMIC64_FETCH_OP(_acquire,  a, op, asm_op, "memory")		\
+	ATOMIC64_FETCH_OP(_release,  l, op, asm_op, "memory")		\
+	ATOMIC64_FETCH_OP(        , al, op, asm_op, "memory")
+
+ATOMIC64_FETCH_OPS(andnot, ldclr)
+ATOMIC64_FETCH_OPS(or, ldset)
+ATOMIC64_FETCH_OPS(xor, ldeor)
+ATOMIC64_FETCH_OPS(add, ldadd)
+
+#undef ATOMIC64_FETCH_OP
+#undef ATOMIC64_FETCH_OPS
+
+#define ATOMIC64_OP_ADD_RETURN(name, mb, cl...)				\
+static inline long __lse_atomic64_add_return##name(s64 i, atomic64_t *v)\
+{									\
+	unsigned long tmp;						\
+									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	ldadd" #mb "	%[i], %x[tmp], %[v]\n"			\
+	"	add	%[i], %[i], %x[tmp]"				\
+	: [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)	\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+ATOMIC64_OP_ADD_RETURN(_relaxed,   )
+ATOMIC64_OP_ADD_RETURN(_acquire,  a, "memory")
+ATOMIC64_OP_ADD_RETURN(_release,  l, "memory")
+ATOMIC64_OP_ADD_RETURN(        , al, "memory")
+
+#undef ATOMIC64_OP_ADD_RETURN
+
+static inline void __lse_atomic64_and(s64 i, atomic64_t *v)
+{
+	asm volatile(
+	__LSE_PREAMBLE
+	"	mvn	%[i], %[i]\n"
+	"	stclr	%[i], %[v]"
+	: [i] "+&r" (i), [v] "+Q" (v->counter)
+	: "r" (v));
+}
+
+#define ATOMIC64_FETCH_OP_AND(name, mb, cl...)				\
+static inline long __lse_atomic64_fetch_and##name(s64 i, atomic64_t *v)	\
+{									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	mvn	%[i], %[i]\n"					\
+	"	ldclr" #mb "	%[i], %[i], %[v]"			\
+	: [i] "+&r" (i), [v] "+Q" (v->counter)				\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+ATOMIC64_FETCH_OP_AND(_relaxed,   )
+ATOMIC64_FETCH_OP_AND(_acquire,  a, "memory")
+ATOMIC64_FETCH_OP_AND(_release,  l, "memory")
+ATOMIC64_FETCH_OP_AND(        , al, "memory")
+
+#undef ATOMIC64_FETCH_OP_AND
+
+static inline void __lse_atomic64_sub(s64 i, atomic64_t *v)
+{
+	asm volatile(
+	__LSE_PREAMBLE
+	"	neg	%[i], %[i]\n"
+	"	stadd	%[i], %[v]"
+	: [i] "+&r" (i), [v] "+Q" (v->counter)
+	: "r" (v));
+}
+
+#define ATOMIC64_OP_SUB_RETURN(name, mb, cl...)				\
+static inline long __lse_atomic64_sub_return##name(s64 i, atomic64_t *v)	\
+{									\
+	unsigned long tmp;						\
+									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	neg	%[i], %[i]\n"					\
+	"	ldadd" #mb "	%[i], %x[tmp], %[v]\n"			\
+	"	add	%[i], %[i], %x[tmp]"				\
+	: [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)	\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+ATOMIC64_OP_SUB_RETURN(_relaxed,   )
+ATOMIC64_OP_SUB_RETURN(_acquire,  a, "memory")
+ATOMIC64_OP_SUB_RETURN(_release,  l, "memory")
+ATOMIC64_OP_SUB_RETURN(        , al, "memory")
+
+#undef ATOMIC64_OP_SUB_RETURN
+
+#define ATOMIC64_FETCH_OP_SUB(name, mb, cl...)				\
+static inline long __lse_atomic64_fetch_sub##name(s64 i, atomic64_t *v)	\
+{									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	neg	%[i], %[i]\n"					\
+	"	ldadd" #mb "	%[i], %[i], %[v]"			\
+	: [i] "+&r" (i), [v] "+Q" (v->counter)				\
+	: "r" (v)							\
+	: cl);								\
+									\
+	return i;							\
+}
+
+ATOMIC64_FETCH_OP_SUB(_relaxed,   )
+ATOMIC64_FETCH_OP_SUB(_acquire,  a, "memory")
+ATOMIC64_FETCH_OP_SUB(_release,  l, "memory")
+ATOMIC64_FETCH_OP_SUB(        , al, "memory")
+
+#undef ATOMIC64_FETCH_OP_SUB
+
+static inline s64 __lse_atomic64_dec_if_positive(atomic64_t *v)
+{
+	unsigned long tmp;
+
+	asm volatile(
+	__LSE_PREAMBLE
+	"1:	ldr	%x[tmp], %[v]\n"
+	"	subs	%[ret], %x[tmp], #1\n"
+	"	b.lt	2f\n"
+	"	casal	%x[tmp], %[ret], %[v]\n"
+	"	sub	%x[tmp], %x[tmp], #1\n"
+	"	sub	%x[tmp], %x[tmp], %[ret]\n"
+	"	cbnz	%x[tmp], 1b\n"
+	"2:"
+	: [ret] "+&r" (v), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)
+	:
+	: "cc", "memory");
+
+	return (long)v;
+}
+
+#define __CMPXCHG_CASE(w, sfx, name, sz, mb, cl...)			\
+static __always_inline u##sz						\
+__lse__cmpxchg_case_##name##sz(volatile void *ptr,			\
+					      u##sz old,		\
+					      u##sz new)		\
+{									\
+	register unsigned long x0 asm ("x0") = (unsigned long)ptr;	\
+	register u##sz x1 asm ("x1") = old;				\
+	register u##sz x2 asm ("x2") = new;				\
+	unsigned long tmp;						\
+									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	mov	%" #w "[tmp], %" #w "[old]\n"			\
+	"	cas" #mb #sfx "\t%" #w "[tmp], %" #w "[new], %[v]\n"	\
+	"	mov	%" #w "[ret], %" #w "[tmp]"			\
+	: [ret] "+r" (x0), [v] "+Q" (*(unsigned long *)ptr),		\
+	  [tmp] "=&r" (tmp)						\
+	: [old] "r" (x1), [new] "r" (x2)				\
+	: cl);								\
+									\
+	return x0;							\
+}
+
+__CMPXCHG_CASE(w, b,     ,  8,   )
+__CMPXCHG_CASE(w, h,     , 16,   )
+__CMPXCHG_CASE(w,  ,     , 32,   )
+__CMPXCHG_CASE(x,  ,     , 64,   )
+__CMPXCHG_CASE(w, b, acq_,  8,  a, "memory")
+__CMPXCHG_CASE(w, h, acq_, 16,  a, "memory")
+__CMPXCHG_CASE(w,  , acq_, 32,  a, "memory")
+__CMPXCHG_CASE(x,  , acq_, 64,  a, "memory")
+__CMPXCHG_CASE(w, b, rel_,  8,  l, "memory")
+__CMPXCHG_CASE(w, h, rel_, 16,  l, "memory")
+__CMPXCHG_CASE(w,  , rel_, 32,  l, "memory")
+__CMPXCHG_CASE(x,  , rel_, 64,  l, "memory")
+__CMPXCHG_CASE(w, b,  mb_,  8, al, "memory")
+__CMPXCHG_CASE(w, h,  mb_, 16, al, "memory")
+__CMPXCHG_CASE(w,  ,  mb_, 32, al, "memory")
+__CMPXCHG_CASE(x,  ,  mb_, 64, al, "memory")
+
+#undef __CMPXCHG_CASE
+
+#define __CMPXCHG_DBL(name, mb, cl...)					\
+static __always_inline long						\
+__lse__cmpxchg_double##name(unsigned long old1,				\
+					 unsigned long old2,		\
+					 unsigned long new1,		\
+					 unsigned long new2,		\
+					 volatile void *ptr)		\
+{									\
+	unsigned long oldval1 = old1;					\
+	unsigned long oldval2 = old2;					\
+	register unsigned long x0 asm ("x0") = old1;			\
+	register unsigned long x1 asm ("x1") = old2;			\
+	register unsigned long x2 asm ("x2") = new1;			\
+	register unsigned long x3 asm ("x3") = new2;			\
+	register unsigned long x4 asm ("x4") = (unsigned long)ptr;	\
+									\
+	asm volatile(							\
+	__LSE_PREAMBLE							\
+	"	casp" #mb "\t%[old1], %[old2], %[new1], %[new2], %[v]\n"\
+	"	eor	%[old1], %[old1], %[oldval1]\n"			\
+	"	eor	%[old2], %[old2], %[oldval2]\n"			\
+	"	orr	%[old1], %[old1], %[old2]"			\
+	: [old1] "+&r" (x0), [old2] "+&r" (x1),				\
+	  [v] "+Q" (*(unsigned long *)ptr)				\
+	: [new1] "r" (x2), [new2] "r" (x3), [ptr] "r" (x4),		\
+	  [oldval1] "r" (oldval1), [oldval2] "r" (oldval2)		\
+	: cl);								\
+									\
+	return x0;							\
+}
+
+__CMPXCHG_DBL(   ,   )
+__CMPXCHG_DBL(_mb, al, "memory")
+
+#undef __CMPXCHG_DBL
+
+#endif	/* __ASM_ATOMIC_LSE_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
new file mode 100644
index 0000000000..c51388216e
--- /dev/null
+++ b/xen/include/asm-arm/arm64/cmpxchg.h
@@ -0,0 +1,285 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Based on arch/arm/include/asm/cmpxchg.h
+ *
+ * Copyright (C) 2012 ARM Ltd.
+ */
+#ifndef __ASM_CMPXCHG_H
+#define __ASM_CMPXCHG_H
+
+#include <linux/build_bug.h>
+#include <linux/compiler.h>
+
+#include <asm/barrier.h>
+#include <asm/lse.h>
+
+/*
+ * We need separate acquire parameters for ll/sc and lse, since the full
+ * barrier case is generated as release+dmb for the former and
+ * acquire+release for the latter.
+ */
+#define __XCHG_CASE(w, sfx, name, sz, mb, nop_lse, acq, acq_lse, rel, cl)	\
+static inline u##sz __xchg_case_##name##sz(u##sz x, volatile void *ptr)		\
+{										\
+	u##sz ret;								\
+	unsigned long tmp;							\
+										\
+	asm volatile(ARM64_LSE_ATOMIC_INSN(					\
+	/* LL/SC */								\
+	"	prfm	pstl1strm, %2\n"					\
+	"1:	ld" #acq "xr" #sfx "\t%" #w "0, %2\n"				\
+	"	st" #rel "xr" #sfx "\t%w1, %" #w "3, %2\n"			\
+	"	cbnz	%w1, 1b\n"						\
+	"	" #mb,								\
+	/* LSE atomics */							\
+	"	swp" #acq_lse #rel #sfx "\t%" #w "3, %" #w "0, %2\n"		\
+		__nops(3)							\
+	"	" #nop_lse)							\
+	: "=&r" (ret), "=&r" (tmp), "+Q" (*(u##sz *)ptr)			\
+	: "r" (x)								\
+	: cl);									\
+										\
+	return ret;								\
+}
+
+__XCHG_CASE(w, b,     ,  8,        ,    ,  ,  ,  ,         )
+__XCHG_CASE(w, h,     , 16,        ,    ,  ,  ,  ,         )
+__XCHG_CASE(w,  ,     , 32,        ,    ,  ,  ,  ,         )
+__XCHG_CASE( ,  ,     , 64,        ,    ,  ,  ,  ,         )
+__XCHG_CASE(w, b, acq_,  8,        ,    , a, a,  , "memory")
+__XCHG_CASE(w, h, acq_, 16,        ,    , a, a,  , "memory")
+__XCHG_CASE(w,  , acq_, 32,        ,    , a, a,  , "memory")
+__XCHG_CASE( ,  , acq_, 64,        ,    , a, a,  , "memory")
+__XCHG_CASE(w, b, rel_,  8,        ,    ,  ,  , l, "memory")
+__XCHG_CASE(w, h, rel_, 16,        ,    ,  ,  , l, "memory")
+__XCHG_CASE(w,  , rel_, 32,        ,    ,  ,  , l, "memory")
+__XCHG_CASE( ,  , rel_, 64,        ,    ,  ,  , l, "memory")
+__XCHG_CASE(w, b,  mb_,  8, dmb ish, nop,  , a, l, "memory")
+__XCHG_CASE(w, h,  mb_, 16, dmb ish, nop,  , a, l, "memory")
+__XCHG_CASE(w,  ,  mb_, 32, dmb ish, nop,  , a, l, "memory")
+__XCHG_CASE( ,  ,  mb_, 64, dmb ish, nop,  , a, l, "memory")
+
+#undef __XCHG_CASE
+
+#define __XCHG_GEN(sfx)							\
+static __always_inline  unsigned long __xchg##sfx(unsigned long x,	\
+					volatile void *ptr,		\
+					int size)			\
+{									\
+	switch (size) {							\
+	case 1:								\
+		return __xchg_case##sfx##_8(x, ptr);			\
+	case 2:								\
+		return __xchg_case##sfx##_16(x, ptr);			\
+	case 4:								\
+		return __xchg_case##sfx##_32(x, ptr);			\
+	case 8:								\
+		return __xchg_case##sfx##_64(x, ptr);			\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+									\
+	unreachable();							\
+}
+
+__XCHG_GEN()
+__XCHG_GEN(_acq)
+__XCHG_GEN(_rel)
+__XCHG_GEN(_mb)
+
+#undef __XCHG_GEN
+
+#define __xchg_wrapper(sfx, ptr, x)					\
+({									\
+	__typeof__(*(ptr)) __ret;					\
+	__ret = (__typeof__(*(ptr)))					\
+		__xchg##sfx((unsigned long)(x), (ptr), sizeof(*(ptr))); \
+	__ret;								\
+})
+
+/* xchg */
+#define arch_xchg_relaxed(...)	__xchg_wrapper(    , __VA_ARGS__)
+#define arch_xchg_acquire(...)	__xchg_wrapper(_acq, __VA_ARGS__)
+#define arch_xchg_release(...)	__xchg_wrapper(_rel, __VA_ARGS__)
+#define arch_xchg(...)		__xchg_wrapper( _mb, __VA_ARGS__)
+
+#define __CMPXCHG_CASE(name, sz)			\
+static inline u##sz __cmpxchg_case_##name##sz(volatile void *ptr,	\
+					      u##sz old,		\
+					      u##sz new)		\
+{									\
+	return __lse_ll_sc_body(_cmpxchg_case_##name##sz,		\
+				ptr, old, new);				\
+}
+
+__CMPXCHG_CASE(    ,  8)
+__CMPXCHG_CASE(    , 16)
+__CMPXCHG_CASE(    , 32)
+__CMPXCHG_CASE(    , 64)
+__CMPXCHG_CASE(acq_,  8)
+__CMPXCHG_CASE(acq_, 16)
+__CMPXCHG_CASE(acq_, 32)
+__CMPXCHG_CASE(acq_, 64)
+__CMPXCHG_CASE(rel_,  8)
+__CMPXCHG_CASE(rel_, 16)
+__CMPXCHG_CASE(rel_, 32)
+__CMPXCHG_CASE(rel_, 64)
+__CMPXCHG_CASE(mb_,  8)
+__CMPXCHG_CASE(mb_, 16)
+__CMPXCHG_CASE(mb_, 32)
+__CMPXCHG_CASE(mb_, 64)
+
+#undef __CMPXCHG_CASE
+
+#define __CMPXCHG_DBL(name)						\
+static inline long __cmpxchg_double##name(unsigned long old1,		\
+					 unsigned long old2,		\
+					 unsigned long new1,		\
+					 unsigned long new2,		\
+					 volatile void *ptr)		\
+{									\
+	return __lse_ll_sc_body(_cmpxchg_double##name, 			\
+				old1, old2, new1, new2, ptr);		\
+}
+
+__CMPXCHG_DBL(   )
+__CMPXCHG_DBL(_mb)
+
+#undef __CMPXCHG_DBL
+
+#define __CMPXCHG_GEN(sfx)						\
+static __always_inline unsigned long __cmpxchg##sfx(volatile void *ptr,	\
+					   unsigned long old,		\
+					   unsigned long new,		\
+					   int size)			\
+{									\
+	switch (size) {							\
+	case 1:								\
+		return __cmpxchg_case##sfx##_8(ptr, old, new);		\
+	case 2:								\
+		return __cmpxchg_case##sfx##_16(ptr, old, new);		\
+	case 4:								\
+		return __cmpxchg_case##sfx##_32(ptr, old, new);		\
+	case 8:								\
+		return __cmpxchg_case##sfx##_64(ptr, old, new);		\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+									\
+	unreachable();							\
+}
+
+__CMPXCHG_GEN()
+__CMPXCHG_GEN(_acq)
+__CMPXCHG_GEN(_rel)
+__CMPXCHG_GEN(_mb)
+
+#undef __CMPXCHG_GEN
+
+#define __cmpxchg_wrapper(sfx, ptr, o, n)				\
+({									\
+	__typeof__(*(ptr)) __ret;					\
+	__ret = (__typeof__(*(ptr)))					\
+		__cmpxchg##sfx((ptr), (unsigned long)(o),		\
+				(unsigned long)(n), sizeof(*(ptr)));	\
+	__ret;								\
+})
+
+/* cmpxchg */
+#define arch_cmpxchg_relaxed(...)	__cmpxchg_wrapper(    , __VA_ARGS__)
+#define arch_cmpxchg_acquire(...)	__cmpxchg_wrapper(_acq, __VA_ARGS__)
+#define arch_cmpxchg_release(...)	__cmpxchg_wrapper(_rel, __VA_ARGS__)
+#define arch_cmpxchg(...)		__cmpxchg_wrapper( _mb, __VA_ARGS__)
+#define arch_cmpxchg_local		arch_cmpxchg_relaxed
+
+/* cmpxchg64 */
+#define arch_cmpxchg64_relaxed		arch_cmpxchg_relaxed
+#define arch_cmpxchg64_acquire		arch_cmpxchg_acquire
+#define arch_cmpxchg64_release		arch_cmpxchg_release
+#define arch_cmpxchg64			arch_cmpxchg
+#define arch_cmpxchg64_local		arch_cmpxchg_local
+
+/* cmpxchg_double */
+#define system_has_cmpxchg_double()     1
+
+#define __cmpxchg_double_check(ptr1, ptr2)					\
+({										\
+	if (sizeof(*(ptr1)) != 8)						\
+		BUILD_BUG();							\
+	VM_BUG_ON((unsigned long *)(ptr2) - (unsigned long *)(ptr1) != 1);	\
+})
+
+#define arch_cmpxchg_double(ptr1, ptr2, o1, o2, n1, n2)				\
+({										\
+	int __ret;								\
+	__cmpxchg_double_check(ptr1, ptr2);					\
+	__ret = !__cmpxchg_double_mb((unsigned long)(o1), (unsigned long)(o2),	\
+				     (unsigned long)(n1), (unsigned long)(n2),	\
+				     ptr1);					\
+	__ret;									\
+})
+
+#define arch_cmpxchg_double_local(ptr1, ptr2, o1, o2, n1, n2)			\
+({										\
+	int __ret;								\
+	__cmpxchg_double_check(ptr1, ptr2);					\
+	__ret = !__cmpxchg_double((unsigned long)(o1), (unsigned long)(o2),	\
+				  (unsigned long)(n1), (unsigned long)(n2),	\
+				  ptr1);					\
+	__ret;									\
+})
+
+#define __CMPWAIT_CASE(w, sfx, sz)					\
+static inline void __cmpwait_case_##sz(volatile void *ptr,		\
+				       unsigned long val)		\
+{									\
+	unsigned long tmp;						\
+									\
+	asm volatile(							\
+	"	sevl\n"							\
+	"	wfe\n"							\
+	"	ldxr" #sfx "\t%" #w "[tmp], %[v]\n"			\
+	"	eor	%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
+	"	cbnz	%" #w "[tmp], 1f\n"				\
+	"	wfe\n"							\
+	"1:"								\
+	: [tmp] "=&r" (tmp), [v] "+Q" (*(unsigned long *)ptr)		\
+	: [val] "r" (val));						\
+}
+
+__CMPWAIT_CASE(w, b, 8);
+__CMPWAIT_CASE(w, h, 16);
+__CMPWAIT_CASE(w,  , 32);
+__CMPWAIT_CASE( ,  , 64);
+
+#undef __CMPWAIT_CASE
+
+#define __CMPWAIT_GEN(sfx)						\
+static __always_inline void __cmpwait##sfx(volatile void *ptr,		\
+				  unsigned long val,			\
+				  int size)				\
+{									\
+	switch (size) {							\
+	case 1:								\
+		return __cmpwait_case##sfx##_8(ptr, (u8)val);		\
+	case 2:								\
+		return __cmpwait_case##sfx##_16(ptr, (u16)val);		\
+	case 4:								\
+		return __cmpwait_case##sfx##_32(ptr, val);		\
+	case 8:								\
+		return __cmpwait_case##sfx##_64(ptr, val);		\
+	default:							\
+		BUILD_BUG();						\
+	}								\
+									\
+	unreachable();							\
+}
+
+__CMPWAIT_GEN()
+
+#undef __CMPWAIT_GEN
+
+#define __cmpwait_relaxed(ptr, val) \
+	__cmpwait((ptr), (unsigned long)(val), sizeof(*(ptr)))
+
+#endif	/* __ASM_CMPXCHG_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/lse.h b/xen/include/asm-arm/arm64/lse.h
new file mode 100644
index 0000000000..704be3e4e4
--- /dev/null
+++ b/xen/include/asm-arm/arm64/lse.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_LSE_H
+#define __ASM_LSE_H
+
+#include <asm/atomic_ll_sc.h>
+
+#ifdef CONFIG_ARM64_LSE_ATOMICS
+
+#define __LSE_PREAMBLE	".arch_extension lse\n"
+
+#include <linux/compiler_types.h>
+#include <linux/export.h>
+#include <linux/jump_label.h>
+#include <linux/stringify.h>
+#include <asm/alternative.h>
+#include <asm/atomic_lse.h>
+#include <asm/cpucaps.h>
+
+extern struct static_key_false cpu_hwcap_keys[ARM64_NCAPS];
+extern struct static_key_false arm64_const_caps_ready;
+
+static inline bool system_uses_lse_atomics(void)
+{
+	return (static_branch_likely(&arm64_const_caps_ready)) &&
+		static_branch_likely(&cpu_hwcap_keys[ARM64_HAS_LSE_ATOMICS]);
+}
+
+#define __lse_ll_sc_body(op, ...)					\
+({									\
+	system_uses_lse_atomics() ?					\
+		__lse_##op(__VA_ARGS__) :				\
+		__ll_sc_##op(__VA_ARGS__);				\
+})
+
+/* In-line patching at runtime */
+#define ARM64_LSE_ATOMIC_INSN(llsc, lse)				\
+	ALTERNATIVE(llsc, __LSE_PREAMBLE lse, ARM64_HAS_LSE_ATOMICS)
+
+#else	/* CONFIG_ARM64_LSE_ATOMICS */
+
+static inline bool system_uses_lse_atomics(void) { return false; }
+
+#define __lse_ll_sc_body(op, ...)		__ll_sc_##op(__VA_ARGS__)
+
+#define ARM64_LSE_ATOMIC_INSN(llsc, lse)	llsc
+
+#endif	/* CONFIG_ARM64_LSE_ATOMICS */
+#endif	/* __ASM_LSE_H */
\ No newline at end of file
diff --git a/xen/include/xen/rwonce.h b/xen/include/xen/rwonce.h
new file mode 100644
index 0000000000..6b47392d1c
--- /dev/null
+++ b/xen/include/xen/rwonce.h
@@ -0,0 +1,90 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Prevent the compiler from merging or refetching reads or writes. The
+ * compiler is also forbidden from reordering successive instances of
+ * READ_ONCE and WRITE_ONCE, but only when the compiler is aware of some
+ * particular ordering. One way to make the compiler aware of ordering is to
+ * put the two invocations of READ_ONCE or WRITE_ONCE in different C
+ * statements.
+ *
+ * These two macros will also work on aggregate data types like structs or
+ * unions.
+ *
+ * Their two major use cases are: (1) Mediating communication between
+ * process-level code and irq/NMI handlers, all running on the same CPU,
+ * and (2) Ensuring that the compiler does not fold, spindle, or otherwise
+ * mutilate accesses that either do not require ordering or that interact
+ * with an explicit memory barrier or atomic instruction that provides the
+ * required ordering.
+ */
+#ifndef __ASM_GENERIC_RWONCE_H
+#define __ASM_GENERIC_RWONCE_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/compiler_types.h>
+#include <linux/kasan-checks.h>
+#include <linux/kcsan-checks.h>
+
+/*
+ * Yes, this permits 64-bit accesses on 32-bit architectures. These will
+ * actually be atomic in some cases (namely Armv7 + LPAE), but for others we
+ * rely on the access being split into 2x32-bit accesses for a 32-bit quantity
+ * (e.g. a virtual address) and a strong prevailing wind.
+ */
+#define compiletime_assert_rwonce_type(t)					\
+	compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),	\
+		"Unsupported access size for {READ,WRITE}_ONCE().")
+
+/*
+ * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
+ * atomicity. Note that this may result in tears!
+ */
+#ifndef __READ_ONCE
+#define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
+#endif
+
+#define READ_ONCE(x)							\
+({									\
+	compiletime_assert_rwonce_type(x);				\
+	__READ_ONCE(x);							\
+})
+
+#define __WRITE_ONCE(x, val)						\
+do {									\
+	*(volatile typeof(x) *)&(x) = (val);				\
+} while (0)
+
+#define WRITE_ONCE(x, val)						\
+do {									\
+	compiletime_assert_rwonce_type(x);				\
+	__WRITE_ONCE(x, val);						\
+} while (0)
+
+static __no_sanitize_or_inline
+unsigned long __read_once_word_nocheck(const void *addr)
+{
+	return __READ_ONCE(*(unsigned long *)addr);
+}
+
+/*
+ * Use READ_ONCE_NOCHECK() instead of READ_ONCE() if you need to load a
+ * word from memory atomically but without telling KASAN/KCSAN. This is
+ * usually used by unwinding code when walking the stack of a running process.
+ */
+#define READ_ONCE_NOCHECK(x)						\
+({									\
+	compiletime_assert(sizeof(x) == sizeof(unsigned long),		\
+		"Unsupported access size for READ_ONCE_NOCHECK().");	\
+	(typeof(x))__read_once_word_nocheck(&(x));			\
+})
+
+static __no_kasan_or_inline
+unsigned long read_word_at_a_time(const void *addr)
+{
+	kasan_check_read(addr, 1);
+	return *(unsigned long *)addr;
+}
+
+#endif /* __ASSEMBLY__ */
+#endif	/* __ASM_GENERIC_RWONCE_H */
\ No newline at end of file
-- 
2.24.3 (Apple Git-128)


