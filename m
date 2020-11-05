Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1311F2A8694
	for <lists+xen-devel@lfdr.de>; Thu,  5 Nov 2020 19:57:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.20063.45709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kakRs-000779-Re; Thu, 05 Nov 2020 18:57:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 20063.45709; Thu, 05 Nov 2020 18:57:28 +0000
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
	id 1kakRs-00076C-Lx; Thu, 05 Nov 2020 18:57:28 +0000
Received: by outflank-mailman (input) for mailman id 20063;
 Thu, 05 Nov 2020 18:57:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kakRq-0006gr-OZ
 for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:26 +0000
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c3384f2-72bb-4bd0-8af0-7b6d26181d2a;
 Thu, 05 Nov 2020 18:57:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n15so3008933wrq.2
 for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:10 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Nov 2020 10:57:07 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kakRq-0006gr-OZ
	for xen-devel@lists.xenproject.org; Thu, 05 Nov 2020 18:57:26 +0000
X-Inumbo-ID: 3c3384f2-72bb-4bd0-8af0-7b6d26181d2a
Received: from mail-wr1-x441.google.com (unknown [2a00:1450:4864:20::441])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 3c3384f2-72bb-4bd0-8af0-7b6d26181d2a;
	Thu, 05 Nov 2020 18:57:10 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n15so3008933wrq.2
        for <xen-devel@lists.xenproject.org>; Thu, 05 Nov 2020 10:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=8I2Ok6wpRdbW4t7D33HeYP/XkP6I7e2EsC6fbv4S2J4=;
        b=RSifhXyjfPPNLWT28QaLbOs16saU8yP5G7sfH5Wf/cLNS2zGFmWJhgoxiqJd/kIoYY
         1+TaDUmvO2ZeonOKEMKidi1aXwEp66+S8+cVjxo/xo54n7n7ImK7lSVD2+O3Ocx06heB
         hVzseaLgHKGpELZgE3QDct0nKF+eZ/jMBZPKHG9efY8x38gIoLUzcaSsvT8YQZqQUbwl
         XWrH0cUrHNK2SrSxrr55FYd++9Yd7LB6hS3docWhGJLQLsNbgBJsvY9QlZjoc/p5U70+
         7FUzszjkPvoRia5lRNoLncMrvaUSD6uE8uq/HDKfuKn6KeMPpiQTee+S91wzSS7/NI1w
         txEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8I2Ok6wpRdbW4t7D33HeYP/XkP6I7e2EsC6fbv4S2J4=;
        b=I4eSMBFkOX2x2p/x0tXjfx+WujSuSmYTZRELbRrZiy+fJLC9yhd9mZLC001FBzuj/D
         S+0EUTAe2bP1TneOLsd7pSeuWYwvegpZ7gHGSsx/eSukhpkvf5hYRDJydvxha08vC1rz
         nRA+NEIcqWn923yuoiIuZlC/dTwU51Nn9z71LIYjJmrEv3bNwm27UFz5WrJgItb1G06s
         yVkhE9NybuhtDjfa5wll798TKs8X5IY7PPQQSPChWNZGVvVi46f2MDcZ/3ihj+Y1yaf9
         fvytTHylNdeTKSFGbAfR/JpwVc4r7TultUhbVpic2CixVH0MLE6A8V3H/FLGM8khYwOw
         rv/g==
X-Gm-Message-State: AOAM532NhtT2tNatluTetwDoEO+ocO2+BF0YB2GGupBYQ0a5fw26bYu0
	+EdLGodBXYma5KBZl7Jn8qOYSHkAQjA=
X-Google-Smtp-Source: ABdhPJwu7tJnCNE3rvZyMq5nd9ZRgtDX+P8XJETy908fBefF8RGAvA0HeH6w48G9zlwwXuRPawsP8Q==
X-Received: by 2002:adf:ead1:: with SMTP id o17mr2263636wrn.396.1604602628146;
        Thu, 05 Nov 2020 10:57:08 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id n14sm3451536wrt.8.2020.11.05.10.57.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Nov 2020 10:57:07 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Ash Wilding <ash.j.wilding@gmail.com>
Subject: [RFC PATCH 4/6] xen/arm64: Port Linux LL/SC and LSE atomics helpers to Xen
Date: Thu,  5 Nov 2020 18:56:01 +0000
Message-Id: <20201105185603.24149-5-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201105185603.24149-1-ash.j.wilding@gmail.com>
References: <20201105185603.24149-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch ports Linux's arm64 LL/SC and LSE atomics helpers to Xen,
using Linux 5.10-rc2 (last commit 3cea11cd5) as a basis.

The opening comment of each header file details the changes made to
that file while porting it to Xen.

    !! NB: This patch breaks arm32 builds until the next patch in the
           series ports Linux's 32-bit LL/SC helpers. The patches have
           been split in this way to aid in reviewing and discussing.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm64/atomic.h       | 242 +++++------
 xen/include/asm-arm/arm64/atomic_ll_sc.h | 236 +++++++++++
 xen/include/asm-arm/arm64/atomic_lse.h   | 251 +++++++++++
 xen/include/asm-arm/arm64/cmpxchg.h      | 505 ++++++++++++++++-------
 xen/include/asm-arm/arm64/lse.h          |  53 +++
 xen/include/asm-arm/arm64/system.h       |   2 +-
 xen/include/asm-arm/atomic.h             |  15 +-
 xen/include/xen/compiler.h               |   3 +
 8 files changed, 1021 insertions(+), 286 deletions(-)
 create mode 100644 xen/include/asm-arm/arm64/atomic_ll_sc.h
 create mode 100644 xen/include/asm-arm/arm64/atomic_lse.h
 create mode 100644 xen/include/asm-arm/arm64/lse.h

diff --git a/xen/include/asm-arm/arm64/atomic.h b/xen/include/asm-arm/arm64/atomic.h
index 2d42567866..5632ff7b13 100644
--- a/xen/include/asm-arm/arm64/atomic.h
+++ b/xen/include/asm-arm/arm64/atomic.h
@@ -1,148 +1,124 @@
+
 /*
- * Based on arch/arm64/include/asm/atomic.h
- * which in turn is
- * Based on arch/arm/include/asm/atomic.h
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
+ *
+ * Summary of changes:
+ * 		- Rename header include guard to reflect Xen directory structure
+ * 		- Drop redundant includes and redirect others to Xen equivalents
+ * 		- Rename declarations from arch_atomic_<op>() to atomic_<op>()
+ * 		- Drop atomic64_t helper declarations
  *
  * Copyright (C) 1996 Russell King.
  * Copyright (C) 2002 Deep Blue Solutions Ltd.
  * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ * SPDX-License-Identifier: GPL-2.0-only
  */
-#ifndef __ARCH_ARM_ARM64_ATOMIC
-#define __ARCH_ARM_ARM64_ATOMIC
+#ifndef __ASM_ARM_ARM64_ATOMIC_H
+#define __ASM_ARM_ARM64_ATOMIC_H
 
-/*
- * AArch64 UP and SMP safe atomic ops.  We use load exclusive and
- * store exclusive to ensure that these are atomic.  We may loop
- * to ensure that the update happens.
- */
-static inline void atomic_add(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_add\n"
-"1:	ldxr	%w0, %2\n"
-"	add	%w0, %w0, %w3\n"
-"	stxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (i));
-}
+#include <xen/compiler.h>
+#include <xen/types.h>
 
-static inline int atomic_add_return(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_add_return\n"
-"1:	ldxr	%w0, %2\n"
-"	add	%w0, %w0, %w3\n"
-"	stlxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (i)
-	: "memory");
-
-	smp_mb();
-	return result;
-}
+#include "lse.h"
+#include "cmpxchg.h"
 
-static inline void atomic_sub(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_sub\n"
-"1:	ldxr	%w0, %2\n"
-"	sub	%w0, %w0, %w3\n"
-"	stxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (i));
+#define ATOMIC_OP(op)							\
+static inline void op(int i, atomic_t *v)			\
+{									\
+	__lse_ll_sc_body(op, i, v);					\
 }
 
-static inline int atomic_sub_return(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_sub_return\n"
-"1:	ldxr	%w0, %2\n"
-"	sub	%w0, %w0, %w3\n"
-"	stlxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (i)
-	: "memory");
-
-	smp_mb();
-	return result;
-}
+ATOMIC_OP(atomic_andnot)
+ATOMIC_OP(atomic_or)
+ATOMIC_OP(atomic_xor)
+ATOMIC_OP(atomic_add)
+ATOMIC_OP(atomic_and)
+ATOMIC_OP(atomic_sub)
 
-static inline void atomic_and(int m, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_and\n"
-"1:	ldxr	%w0, %2\n"
-"	and	%w0, %w0, %w3\n"
-"	stxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (m));
-}
+#undef ATOMIC_OP
 
-static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
-{
-	unsigned long tmp;
-	int oldval;
-
-	smp_mb();
-
-	asm volatile("// atomic_cmpxchg\n"
-"1:	ldxr	%w1, %2\n"
-"	cmp	%w1, %w3\n"
-"	b.ne	2f\n"
-"	stxr	%w0, %w4, %2\n"
-"	cbnz	%w0, 1b\n"
-"2:"
-	: "=&r" (tmp), "=&r" (oldval), "+Q" (ptr->counter)
-	: "Ir" (old), "r" (new)
-	: "cc");
-
-	smp_mb();
-	return oldval;
+#define ATOMIC_FETCH_OP(name, op)					\
+static inline int op##name(int i, atomic_t *v)			\
+{									\
+	return __lse_ll_sc_body(op##name, i, v);			\
 }
 
-static inline int __atomic_add_unless(atomic_t *v, int a, int u)
-{
-	int c, old;
-
-	c = atomic_read(v);
-	while (c != u && (old = atomic_cmpxchg((v), c, c + a)) != c)
-		c = old;
-	return c;
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
+#define atomic_read(v)			__READ_ONCE((v)->counter)
+#define atomic_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
+
+#define atomic_add_return_relaxed		atomic_add_return_relaxed
+#define atomic_add_return_acquire		atomic_add_return_acquire
+#define atomic_add_return_release		atomic_add_return_release
+#define atomic_add_return			atomic_add_return
+
+#define atomic_sub_return_relaxed		atomic_sub_return_relaxed
+#define atomic_sub_return_acquire		atomic_sub_return_acquire
+#define atomic_sub_return_release		atomic_sub_return_release
+#define atomic_sub_return			atomic_sub_return
+
+#define atomic_fetch_add_relaxed		atomic_fetch_add_relaxed
+#define atomic_fetch_add_acquire		atomic_fetch_add_acquire
+#define atomic_fetch_add_release		atomic_fetch_add_release
+#define atomic_fetch_add			atomic_fetch_add
+
+#define atomic_fetch_sub_relaxed		atomic_fetch_sub_relaxed
+#define atomic_fetch_sub_acquire		atomic_fetch_sub_acquire
+#define atomic_fetch_sub_release		atomic_fetch_sub_release
+#define atomic_fetch_sub			atomic_fetch_sub
+
+#define atomic_fetch_and_relaxed		atomic_fetch_and_relaxed
+#define atomic_fetch_and_acquire		atomic_fetch_and_acquire
+#define atomic_fetch_and_release		atomic_fetch_and_release
+#define atomic_fetch_and			atomic_fetch_and
+
+#define atomic_fetch_andnot_relaxed	atomic_fetch_andnot_relaxed
+#define atomic_fetch_andnot_acquire	atomic_fetch_andnot_acquire
+#define atomic_fetch_andnot_release	atomic_fetch_andnot_release
+#define atomic_fetch_andnot		atomic_fetch_andnot
+
+#define atomic_fetch_or_relaxed		atomic_fetch_or_relaxed
+#define atomic_fetch_or_acquire		atomic_fetch_or_acquire
+#define atomic_fetch_or_release		atomic_fetch_or_release
+#define atomic_fetch_or			atomic_fetch_or
+
+#define atomic_fetch_xor_relaxed		atomic_fetch_xor_relaxed
+#define atomic_fetch_xor_acquire		atomic_fetch_xor_acquire
+#define atomic_fetch_xor_release		atomic_fetch_xor_release
+#define atomic_fetch_xor			atomic_fetch_xor
+
+#define atomic_xchg_relaxed(v, new) \
+	xchg_relaxed(&((v)->counter), (new))
+#define atomic_xchg_acquire(v, new) \
+	xchg_acquire(&((v)->counter), (new))
+#define atomic_xchg_release(v, new) \
+	xchg_release(&((v)->counter), (new))
+#define atomic_xchg(v, new) \
+	xchg(&((v)->counter), (new))
+
+#define atomic_cmpxchg_relaxed(v, old, new) \
+	cmpxchg_relaxed(&((v)->counter), (old), (new))
+#define atomic_cmpxchg_acquire(v, old, new) \
+	cmpxchg_acquire(&((v)->counter), (old), (new))
+#define atomic_cmpxchg_release(v, old, new) \
+	cmpxchg_release(&((v)->counter), (old), (new))
+
+#define atomic_andnot			atomic_andnot
+
+#endif /* __ASM_ARM_ARM64_ATOMIC_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/atomic_ll_sc.h b/xen/include/asm-arm/arm64/atomic_ll_sc.h
new file mode 100644
index 0000000000..dbcb0e9fe7
--- /dev/null
+++ b/xen/include/asm-arm/arm64/atomic_ll_sc.h
@@ -0,0 +1,236 @@
+/*
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
+ *
+ * Summary of changes:
+ * 		- Rename header include guard to reflect Xen directory structure
+ * 		- Redirect includes to Xen equivalents
+ * 		- Drop atomic64_t helper definitions
+ *
+ * Copyright (C) 1996 Russell King.
+ * Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * Copyright (C) 2012 ARM Ltd.
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#ifndef __ASM_ARM_ARM64_ATOMIC_LL_SC_H
+#define __ASM_ARM_ARM64_ATOMIC_LL_SC_H
+
+#include <xen/stringify.h>
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
+#endif	/* __ASM_ARM_ARM64_ATOMIC_LL_SC_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/atomic_lse.h b/xen/include/asm-arm/arm64/atomic_lse.h
new file mode 100644
index 0000000000..0d579f3262
--- /dev/null
+++ b/xen/include/asm-arm/arm64/atomic_lse.h
@@ -0,0 +1,251 @@
+
+/*
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
+ *
+ * Summary of changes:
+ * 		- Rename header include guard to reflect Xen directory structure
+ * 		- Drop atomic64_t helper definitions
+ * 		- Switch __always_inline qualifier to always_inline
+ *
+ * Copyright (C) 1996 Russell King.
+ * Copyright (C) 2002 Deep Blue Solutions Ltd.
+ * Copyright (C) 2012 ARM Ltd.
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+
+#ifndef __ASM_ARM_ARM64_ATOMIC_LSE_H
+#define __ASM_ARM_ARM64_ATOMIC_LSE_H
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
+#define __CMPXCHG_CASE(w, sfx, name, sz, mb, cl...)			\
+static always_inline u##sz						\
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
+static always_inline long						\
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
+#endif	/* __ASM_ARM_ARM64_ATOMIC_LSE_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
index 10e4edc022..4ee8291d3e 100644
--- a/xen/include/asm-arm/arm64/cmpxchg.h
+++ b/xen/include/asm-arm/arm64/cmpxchg.h
@@ -1,136 +1,363 @@
-#ifndef __ASM_ARM64_CMPXCHG_H
-#define __ASM_ARM64_CMPXCHG_H
+/*
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
+ *
+ * Summary of changes:
+ * 		- Rename header include guard to reflect Xen directory structure
+ * 		- Drop redundant includes and redirect others to Xen equivalents
+ * 		- Rename definitions from arch_xchg_<qual>() to xchg_<qual>()
+ * 		- Switch __always_inline qualifier to always_inline
+ * 		- Switch usage of BUILD_BUG() to returning __bad_cmpxchg()
+ * 		- Pull in original Xen arm64 cmpxchg.h definitions of
+ * 		  cmpxchg_timeout*() and cmpxchg64_timeout*() as these are not
+ * 		  provided by Linux and are required for Xen's guest atomics
+ *
+ * Copyright (C) 2012 ARM Ltd.
+ * SPDX-License-Identifier: GPL-2.0-only
+ */
+#ifndef __ASM_ARM_ARM64_CMPXCHG_H
+#define __ASM_ARM_ARM64_CMPXCHG_H
 
-extern void __bad_xchg(volatile void *, int);
-
-static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
-{
-	unsigned long ret, tmp;
-
-	switch (size) {
-	case 1:
-		asm volatile("//	__xchg1\n"
-		"1:	ldxrb	%w0, %2\n"
-		"	stlxrb	%w1, %w3, %2\n"
-		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr)
-			: "r" (x)
-			: "memory");
-		break;
-	case 2:
-		asm volatile("//	__xchg2\n"
-		"1:	ldxrh	%w0, %2\n"
-		"	stlxrh	%w1, %w3, %2\n"
-		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr)
-			: "r" (x)
-			: "memory");
-		break;
-	case 4:
-		asm volatile("//	__xchg4\n"
-		"1:	ldxr	%w0, %2\n"
-		"	stlxr	%w1, %w3, %2\n"
-		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr)
-			: "r" (x)
-			: "memory");
-		break;
-	case 8:
-		asm volatile("//	__xchg8\n"
-		"1:	ldxr	%0, %2\n"
-		"	stlxr	%w1, %3, %2\n"
-		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr)
-			: "r" (x)
-			: "memory");
-		break;
-	default:
-		__bad_xchg(ptr, size), ret = 0;
-		break;
-	}
-
-	smp_mb();
-	return ret;
-}
-
-#define xchg(ptr,x) \
-({ \
-	__typeof__(*(ptr)) __ret; \
-	__ret = (__typeof__(*(ptr))) \
-		__xchg((unsigned long)(x), (ptr), sizeof(*(ptr))); \
-	__ret; \
-})
+#include <asm/bug.h>
+#include "lse.h"
 
 extern unsigned long __bad_cmpxchg(volatile void *ptr, int size);
 
-#define __CMPXCHG_CASE(w, sz, name)					\
-static inline bool __cmpxchg_case_##name(volatile void *ptr,		\
-					 unsigned long *old,		\
-					 unsigned long new,		\
-					 bool timeout,			\
-					 unsigned int max_try)		\
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
+		"nop\n"							\
+		"nop\n"							\
+		"nop\n"							\
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
+static always_inline  unsigned long __xchg##sfx(unsigned long x,	\
+					volatile void *ptr,		\
+					int size)			\
 {									\
-	unsigned long oldval;						\
-	unsigned long res;						\
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
+		return __bad_cmpxchg(ptr, size);						\
+	}								\
 									\
-	do {								\
-		asm volatile("// __cmpxchg_case_" #name "\n"		\
-		"	ldxr" #sz "	%" #w "1, %2\n"			\
-		"	mov	%w0, #0\n"				\
-		"	cmp	%" #w "1, %" #w "3\n"			\
-		"	b.ne	1f\n"					\
-		"	stxr" #sz "	%w0, %" #w "4, %2\n"		\
-		"1:\n"							\
-		: "=&r" (res), "=&r" (oldval),				\
-		  "+Q" (*(unsigned long *)ptr)				\
-		: "Ir" (*old), "r" (new)				\
-		: "cc");						\
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
+#define xchg_relaxed(...)	__xchg_wrapper(    , __VA_ARGS__)
+#define xchg_acquire(...)	__xchg_wrapper(_acq, __VA_ARGS__)
+#define xchg_release(...)	__xchg_wrapper(_rel, __VA_ARGS__)
+#define xchg(...)		__xchg_wrapper( _mb, __VA_ARGS__)
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
+static always_inline unsigned long __cmpxchg##sfx(volatile void *ptr,	\
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
+		return __bad_cmpxchg(ptr, size);						\
+	}								\
 									\
-		if (!res)						\
-			break;						\
-	} while (!timeout || ((--max_try) > 0));			\
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
+#define cmpxchg_relaxed(...)	__cmpxchg_wrapper(    , __VA_ARGS__)
+#define cmpxchg_acquire(...)	__cmpxchg_wrapper(_acq, __VA_ARGS__)
+#define cmpxchg_release(...)	__cmpxchg_wrapper(_rel, __VA_ARGS__)
+#define cmpxchg(...)		__cmpxchg_wrapper( _mb, __VA_ARGS__)
+#define cmpxchg_local		cmpxchg_relaxed
+
+/* cmpxchg64 */
+#define cmpxchg64_relaxed		cmpxchg_relaxed
+#define cmpxchg64_acquire		cmpxchg_acquire
+#define cmpxchg64_release		cmpxchg_release
+#define cmpxchg64			cmpxchg
+#define cmpxchg64_local		cmpxchg_local
+
+/* cmpxchg_double */
+#define system_has_cmpxchg_double()     1
+
+#define __cmpxchg_double_check(ptr1, ptr2)					\
+({										\
+	if (sizeof(*(ptr1)) != 8)						\
+		return __bad_cmpxchg(ptr, size);							\
+	VM_BUG_ON((unsigned long *)(ptr2) - (unsigned long *)(ptr1) != 1);	\
+})
+
+#define cmpxchg_double(ptr1, ptr2, o1, o2, n1, n2)				\
+({										\
+	int __ret;								\
+	__cmpxchg_double_check(ptr1, ptr2);					\
+	__ret = !__cmpxchg_double_mb((unsigned long)(o1), (unsigned long)(o2),	\
+				     (unsigned long)(n1), (unsigned long)(n2),	\
+				     ptr1);					\
+	__ret;									\
+})
+
+#define cmpxchg_double_local(ptr1, ptr2, o1, o2, n1, n2)			\
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
 									\
-	*old = oldval;							\
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
+static always_inline void __cmpwait##sfx(volatile void *ptr,		\
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
+		__bad_cmpxchg(ptr, size);						\
+	}								\
 									\
-	return !res;							\
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
+/*
+ * This code is from the original Xen arm32 cmpxchg.h, from before the
+ * Linux 5.10-rc2 atomics helpers were ported over. The only changes
+ * here are renaming the macros and functions to explicitly use
+ * "timeout" in their names so that they don't clash with the above.
+ *
+ * We need this here for guest atomics (the only user of the timeout
+ * variants).
+ */
+
+#define __CMPXCHG_TIMEOUT_CASE(w, sz, name)                             \
+static inline bool __cmpxchg_timeout_case_##name(volatile void *ptr,    \
+                                         unsigned long *old,            \
+                                         unsigned long new,             \
+                                         bool timeout,                  \
+                                         unsigned int max_try)          \
+{                                                                       \
+        unsigned long oldval;                                           \
+        unsigned long res;                                              \
+                                                                        \
+        do {                                                            \
+                asm volatile("// __cmpxchg_timeout_case_" #name "\n"    \
+                "       ldxr" #sz "     %" #w "1, %2\n"                 \
+                "       mov     %w0, #0\n"                              \
+                "       cmp     %" #w "1, %" #w "3\n"                   \
+                "       b.ne    1f\n"                                   \
+                "       stxr" #sz "     %w0, %" #w "4, %2\n"            \
+                "1:\n"                                                  \
+                : "=&r" (res), "=&r" (oldval),                          \
+                  "+Q" (*(unsigned long *)ptr)                          \
+                : "Ir" (*old), "r" (new)                                \
+                : "cc");                                                \
+                                                                        \
+                if (!res)                                               \
+                        break;                                          \
+        } while (!timeout || ((--max_try) > 0));                        \
+                                                                        \
+        *old = oldval;                                                  \
+                                                                        \
+        return !res;                                                    \
 }
 
-__CMPXCHG_CASE(w, b, 1)
-__CMPXCHG_CASE(w, h, 2)
-__CMPXCHG_CASE(w,  , 4)
-__CMPXCHG_CASE( ,  , 8)
+__CMPXCHG_TIMEOUT_CASE(w, b, 1)
+__CMPXCHG_TIMEOUT_CASE(w, h, 2)
+__CMPXCHG_TIMEOUT_CASE(w,  , 4)
+__CMPXCHG_TIMEOUT_CASE( ,  , 8)
 
 static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
-					unsigned long new, int size,
-					bool timeout, unsigned int max_try)
+                                        unsigned long new, int size,
+                                        bool timeout, unsigned int max_try)
 {
-	switch (size) {
-	case 1:
-		return __cmpxchg_case_1(ptr, old, new, timeout, max_try);
-	case 2:
-		return __cmpxchg_case_2(ptr, old, new, timeout, max_try);
-	case 4:
-		return __cmpxchg_case_4(ptr, old, new, timeout, max_try);
-	case 8:
-		return __cmpxchg_case_8(ptr, old, new, timeout, max_try);
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
+        case 8:
+                return __cmpxchg_timeout_case_8(ptr, old, new, timeout, max_try);
+        default:
+                return __bad_cmpxchg(ptr, size);
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
@@ -144,40 +371,22 @@ static always_inline unsigned long __cmpxchg(volatile void *ptr,
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
 
-#define cmpxchg(ptr, o, n) \
-({ \
-	__typeof__(*(ptr)) __ret; \
-	__ret = (__typeof__(*(ptr))) \
-		__cmpxchg((ptr), (unsigned long)(o), (unsigned long)(n), \
-			  sizeof(*(ptr))); \
-	__ret; \
-})
+#define __cmpxchg64_timeout(ptr, old, new, max_try)     \
+        __cmpxchg_timeout(ptr, old, new, 8, max_try)
 
-#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
 
-#define __cmpxchg64_timeout(ptr, old, new, max_try)	\
-	__cmpxchg_timeout(ptr, old, new, 8, max_try)
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
+#endif	/* __ASM_ARM_ARM64_CMPXCHG_H */
diff --git a/xen/include/asm-arm/arm64/lse.h b/xen/include/asm-arm/arm64/lse.h
new file mode 100644
index 0000000000..e26245a74b
--- /dev/null
+++ b/xen/include/asm-arm/arm64/lse.h
@@ -0,0 +1,53 @@
+/*
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
+ *
+ * Summary of changes:
+ * 		- Rename header include guard to reflect Xen directory structure
+ * 		- Drop redundant includes and redirect others to Xen equivalents
+ * 		- Modify hwcap check to use cpus_have_cap()
+ *
+ * SPDX-License-Identifier: GPL-2.0
+ */
+#ifndef __ASM_ARM_ARM64_LSE_H
+#define __ASM_ARM_ARM64_LSE_H
+
+#include "atomic_ll_sc.h"
+
+#ifdef CONFIG_ARM64_LSE_ATOMICS
+
+#define __LSE_PREAMBLE	".arch_extension lse\n"
+
+#include <xen/compiler.h>
+#include <xen/stringify.h>
+#include <xen/types.h>
+
+#include <asm/alternative.h>
+
+#include "atomic_lse.h"
+
+static inline bool system_uses_lse_atomics(void)
+{
+	return cpus_have_cap(ARM64_HAS_LSE_ATOMICS);
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
+#endif	/* __ASM_ARM_ARM64_LSE_H */
\ No newline at end of file
diff --git a/xen/include/asm-arm/arm64/system.h b/xen/include/asm-arm/arm64/system.h
index 2e36573ac6..dfbbe4b87d 100644
--- a/xen/include/asm-arm/arm64/system.h
+++ b/xen/include/asm-arm/arm64/system.h
@@ -2,7 +2,7 @@
 #ifndef __ASM_ARM64_SYSTEM_H
 #define __ASM_ARM64_SYSTEM_H
 
-#include <asm/arm64/cmpxchg.h>
+#include <asm/atomic.h>
 
 /* Uses uimm4 as a bitmask to select the clearing of one or more of
  * the DAIF exception mask bits:
diff --git a/xen/include/asm-arm/atomic.h b/xen/include/asm-arm/atomic.h
index ac2798d095..866f54d03c 100644
--- a/xen/include/asm-arm/atomic.h
+++ b/xen/include/asm-arm/atomic.h
@@ -2,8 +2,6 @@
 #define __ARCH_ARM_ATOMIC__
 
 #include <xen/atomic.h>
-#include <xen/prefetch.h>
-#include <asm/system.h>
 
 #define build_atomic_read(name, size, width, type) \
 static inline type name(const volatile type *addr) \
@@ -220,10 +218,19 @@ static inline int atomic_add_negative(int i, atomic_t *v)
 
 static inline int atomic_add_unless(atomic_t *v, int a, int u)
 {
-    return __atomic_add_unless(v, a, u);
+	int c, old;
+
+	c = atomic_read(v);
+	while (c != u && (old = atomic_cmpxchg((v), c, c + a)) != c)
+		c = old;
+
+	return c;
 }
 
-#define atomic_xchg(v, new) (xchg(&((v)->counter), new))
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
+{
+	return cmpxchg(&((v)->counter), (old), (new));
+}
 
 #endif /* __ARCH_ARM_ATOMIC__ */
 /*
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index c0e0ee9f27..aa0546bfe8 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -138,4 +138,7 @@
 # define CLANG_DISABLE_WARN_GCC_COMPAT_END
 #endif
 
+#define __READ_ONCE(x)	    (*(volatile typeof(x) *)&(x))
+#define __WRITE_ONCE(x, v)  (*(volatile typeof(x) *)&(x) = (v))
+
 #endif /* __LINUX_COMPILER_H */
-- 
2.24.3 (Apple Git-128)


