Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D1D7F717A
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640381.998551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TTC-0002zf-MB; Fri, 24 Nov 2023 10:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640381.998551; Fri, 24 Nov 2023 10:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TTB-0002p0-R6; Fri, 24 Nov 2023 10:31:33 +0000
Received: by outflank-mailman (input) for mailman id 640381;
 Fri, 24 Nov 2023 10:31:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TT8-0006hx-1D
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:30 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a042a396-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:28 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9fffa4c4f43so245835166b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:28 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:26 -0800 (PST)
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
X-Inumbo-ID: a042a396-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821887; x=1701426687; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9riaokCWExjFFZnUk2kE6ssbpq4/t90lh8ou5GK8cws=;
        b=hcBk1MVWFADvXYOajjYsggTEUZs7SwxRg9UZq5djuXc94iyPNXrdJXME/UfRYQWP2h
         0Gt0+JqJuKrcyGkaPW4omivg92Biwq3dZLGeAeMddTUjB1Y7vgJMOPqfwZNDnwfxB5SO
         K3V9BvBHXz94XXCoZwjeU+xHFp171Ql67yq5nlLsE6tnKBs/gXiiiGNIC8yKZNMroDhu
         HRyGEIc0R7g02adoUINvTNTSbuLAK/VW9AMGcy2zM9hfZI47OJoLFGH6NVBkoVcNqYz/
         HFKJiWGg2CXIrfBT2fKPaBlwTsZ67pP4xZjVFnI1BDUq45z5I9B7kyOxjpquj+G5toUi
         unrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821887; x=1701426687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9riaokCWExjFFZnUk2kE6ssbpq4/t90lh8ou5GK8cws=;
        b=ghY60AROaN3jLH7+0cKeZG5UNvBxu6aYQdr90xsRRh2AtVwUEMJtsq3ehEXN0Kh+9n
         Z6pUDkb+kO+LcSoAjXQGfTrUPvPCVkjNcWZQ0KZtpBb/Nmgamx9G0/2iEhKXNtvmWRck
         Efqb1duJQslRRVovwmUWG3BR0uJlKiSBKsPYQgzGd1uQfOUJzqGriAEH5fpaaciHzYe/
         Y+VsYBHmUN8BnfpyojAVK5dL6qktOikZ+vhbiX3jUtp5ZhzLjgQCiCfcwxuWL86qe+VN
         A5PE85uzLfm6vjAkmt0JyWvp1HmLmhCPd046rF0z0K6bBPjGoKymJXK8jC8mdVnLIqlh
         FyFg==
X-Gm-Message-State: AOJu0Yw1hVsAA5kv6GJ3HlZnbaDlrRPFFLCglLouBSDQmgcJMt0zmYXM
	TyOeH8xCeu1yP/FMMj385p8rxTq8FfgmgA==
X-Google-Smtp-Source: AGHT+IG698d3KMDeF4UhW/xSE30Qxjj9yiXgYr3I4OGIxQewyYST6MbRm8Wd9VW0YOU1euKq2wYSeg==
X-Received: by 2002:a17:906:5299:b0:a00:8706:c82e with SMTP id c25-20020a170906529900b00a008706c82emr1910109ejm.18.1700821887071;
        Fri, 24 Nov 2023 02:31:27 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Bobby Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v2 17/39] xen/riscv: introduce asm/atomic.h
Date: Fri, 24 Nov 2023 12:30:37 +0200
Message-ID: <e9ead40abe380cf768a2a0150dc4c9e479a75307.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobbyeshleman@gmail.com>

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Change an author of commit. I got this header from Bobby's old repo.
---
 xen/arch/riscv/include/asm/atomic.h | 375 ++++++++++++++++++++++++++++
 1 file changed, 375 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/atomic.h

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
new file mode 100644
index 0000000000..d4849cf282
--- /dev/null
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -0,0 +1,375 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Taken and modified from Linux.
+ * 
+ * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2021 Vates SAS
+ */
+
+#ifndef _ASM_RISCV_ATOMIC_H
+#define _ASM_RISCV_ATOMIC_H
+
+#include <xen/atomic.h>
+#include <asm/cmpxchg.h>
+#include <asm/fence.h>
+#include <asm/io.h>
+#include <asm/system.h>
+
+void __bad_atomic_size(void);
+
+static always_inline void read_atomic_size(const volatile void *p,
+                                           void *res,
+                                           unsigned int size)
+{
+    switch ( size ) {
+    case 1: *(uint8_t *)res = readb((uint8_t *)p); break;
+    case 2: *(uint16_t *)res = readw((uint16_t *)p); break;
+    case 4: *(uint32_t *)res = readl((uint32_t *)p); break;
+    case 8: *(uint32_t *)res  = readq((uint64_t *)p); break;
+    default: __bad_atomic_size(); break;
+    }
+}
+
+#define read_atomic(p) ({                                               \
+    union { typeof(*p) val; char c[0]; } x_;                            \
+    read_atomic_size(p, x_.c, sizeof(*p));                              \
+    x_.val;                                                             \
+})
+
+
+#define write_atomic(p, x) ({                                           \
+    typeof(*p) __x = (x);                                               \
+    switch ( sizeof(*p) ) {                                             \
+    case 1: writeb((uint8_t)__x,  (uint8_t *)  p); break;              \
+    case 2: writew((uint16_t)__x, (uint16_t *) p); break;              \
+    case 4: writel((uint32_t)__x, (uint32_t *) p); break;              \
+    case 8: writeq((uint64_t)__x, (uint64_t *) p); break;              \
+    default: __bad_atomic_size(); break;                                \
+    }                                                                   \
+    __x;                                                                \
+})
+
+/* TODO: Fix this */
+#define add_sized(p, x) ({                                              \
+    typeof(*(p)) __x = (x);                                             \
+    switch ( sizeof(*(p)) )                                             \
+    {                                                                   \
+    case 1: writeb(read_atomic(p) + __x, (uint8_t *)(p)); break;        \
+    case 2: writew(read_atomic(p) + __x, (uint16_t *)(p)); break;       \
+    case 4: writel(read_atomic(p) + __x, (uint32_t *)(p)); break;       \
+    default: __bad_atomic_size(); break;                                \
+    }                                                                   \
+})
+
+/*
+ *  __unqual_scalar_typeof(x) - Declare an unqualified scalar type, leaving
+ *               non-scalar types unchanged.
+ *
+ * Prefer C11 _Generic for better compile-times and simpler code. Note: 'char'
+ * is not type-compatible with 'signed char', and we define a separate case.
+ */
+#define __scalar_type_to_expr_cases(type)               \
+    unsigned type:  (unsigned type)0,                   \
+    signed type:    (signed type)0
+
+#define __unqual_scalar_typeof(x) typeof(               \
+    _Generic((x),                                       \
+        char:  (char)0,                                 \
+        __scalar_type_to_expr_cases(char),              \
+        __scalar_type_to_expr_cases(short),             \
+        __scalar_type_to_expr_cases(int),               \
+        __scalar_type_to_expr_cases(long),              \
+        __scalar_type_to_expr_cases(long long),         \
+        default: (x)))
+
+#define READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
+#define WRITE_ONCE(x, val)                                      \
+    do {                                                        \
+            *(volatile typeof(x) *)&(x) = (val);                \
+    } while (0)
+
+#define __atomic_acquire_fence()					\
+	__asm__ __volatile__(RISCV_ACQUIRE_BARRIER "" ::: "memory")
+
+#define __atomic_release_fence()					\
+	__asm__ __volatile__(RISCV_RELEASE_BARRIER "" ::: "memory");
+
+static inline int atomic_read(const atomic_t *v)
+{
+	return READ_ONCE(v->counter);
+}
+
+static inline int _atomic_read(atomic_t v)
+{
+    return v.counter;
+}
+
+static inline void atomic_set(atomic_t *v, int i)
+{
+	WRITE_ONCE(v->counter, i);
+}
+
+static inline void _atomic_set(atomic_t *v, int i)
+{
+    v->counter = i;
+}
+
+static inline int atomic_sub_and_test(int i, atomic_t *v)
+{
+    return atomic_sub_return(i, v) == 0;
+}
+
+static inline void atomic_inc(atomic_t *v)
+{
+    atomic_add(1, v);
+}
+
+static inline int atomic_inc_return(atomic_t *v)
+{
+    return atomic_add_return(1, v);
+}
+
+static inline void atomic_dec(atomic_t *v)
+{
+    atomic_sub(1, v);
+}
+
+static inline int atomic_dec_return(atomic_t *v)
+{
+    return atomic_sub_return(1, v);
+}
+
+
+static inline int atomic_dec_and_test(atomic_t *v)
+{
+    return atomic_sub_return(1, v) == 0;
+}
+
+static inline int atomic_add_negative(int i, atomic_t *v)
+{
+    return atomic_add_return(i, v) < 0;
+}
+
+static inline int atomic_inc_and_test(atomic_t *v)
+{
+    return atomic_add_return(1, v) == 0;
+}
+
+/*
+ * First, the atomic ops that have no ordering constraints and therefor don't
+ * have the AQ or RL bits set.  These don't return anything, so there's only
+ * one version to worry about.
+ */
+#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)		\
+static inline							\
+void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v)		\
+{									\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type " zero, %1, %0"	\
+		: "+A" (v->counter)					\
+		: "r" (I)						\
+		: "memory");						\
+}									\
+
+#define ATOMIC_OPS(op, asm_op, I)					\
+        ATOMIC_OP (op, asm_op, I, w, int,   )
+
+ATOMIC_OPS(add, add,  i)
+ATOMIC_OPS(sub, add, -i)
+ATOMIC_OPS(and, and,  i)
+ATOMIC_OPS( or,  or,  i)
+ATOMIC_OPS(xor, xor,  i)
+
+#undef ATOMIC_OP
+#undef ATOMIC_OPS
+
+/*
+ * Atomic ops that have ordered, relaxed, acquire, and release variants.
+ * There's two flavors of these: the arithmatic ops have both fetch and return
+ * versions, while the logical ops only have fetch versions.
+ */
+#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
+static inline							\
+c_type atomic##prefix##_fetch_##op##_relaxed(c_type i,			\
+					     atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type " %1, %2, %0"	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}									\
+static inline							\
+c_type atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v)	\
+{									\
+	register c_type ret;						\
+	__asm__ __volatile__ (						\
+		"	amo" #asm_op "." #asm_type ".aqrl  %1, %2, %0"	\
+		: "+A" (v->counter), "=r" (ret)				\
+		: "r" (I)						\
+		: "memory");						\
+	return ret;							\
+}
+
+#define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix)	\
+static inline							\
+c_type atomic##prefix##_##op##_return_relaxed(c_type i,			\
+					      atomic##prefix##_t *v)	\
+{									\
+        return atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;	\
+}									\
+static inline							\
+c_type atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)	\
+{									\
+        return atomic##prefix##_fetch_##op(i, v) c_op I;		\
+}
+
+#define ATOMIC_OPS(op, asm_op, c_op, I)					\
+        ATOMIC_FETCH_OP( op, asm_op,       I, w, int,   )		\
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I, w, int,   )
+
+ATOMIC_OPS(add, add, +,  i)
+ATOMIC_OPS(sub, add, +, -i)
+
+#define atomic_add_return_relaxed	atomic_add_return_relaxed
+#define atomic_sub_return_relaxed	atomic_sub_return_relaxed
+#define atomic_add_return		atomic_add_return
+#define atomic_sub_return		atomic_sub_return
+
+#define atomic_fetch_add_relaxed	atomic_fetch_add_relaxed
+#define atomic_fetch_sub_relaxed	atomic_fetch_sub_relaxed
+#define atomic_fetch_add		atomic_fetch_add
+#define atomic_fetch_sub		atomic_fetch_sub
+
+#undef ATOMIC_OPS
+
+#define ATOMIC_OPS(op, asm_op, I)					\
+        ATOMIC_FETCH_OP(op, asm_op, I, w, int,   )
+
+ATOMIC_OPS(and, and, i)
+ATOMIC_OPS( or,  or, i)
+ATOMIC_OPS(xor, xor, i)
+
+#define atomic_fetch_and_relaxed	atomic_fetch_and_relaxed
+#define atomic_fetch_or_relaxed		atomic_fetch_or_relaxed
+#define atomic_fetch_xor_relaxed	atomic_fetch_xor_relaxed
+#define atomic_fetch_and		atomic_fetch_and
+#define atomic_fetch_or			atomic_fetch_or
+#define atomic_fetch_xor		atomic_fetch_xor
+
+#undef ATOMIC_OPS
+
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_OP_RETURN
+
+/* This is required to provide a full barrier on success. */
+static inline int atomic_add_unless(atomic_t *v, int a, int u)
+{
+       int prev, rc;
+
+	__asm__ __volatile__ (
+		"0:	lr.w     %[p],  %[c]\n"
+		"	beq      %[p],  %[u], 1f\n"
+		"	add      %[rc], %[p], %[a]\n"
+		"	sc.w.rl  %[rc], %[rc], %[c]\n"
+		"	bnez     %[rc], 0b\n"
+		"	fence    rw, rw\n"
+		"1:\n"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		: [a]"r" (a), [u]"r" (u)
+		: "memory");
+	return prev;
+}
+#define atomic_fetch_add_unless atomic_fetch_add_unless
+
+/*
+ * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
+ * {cmp,}xchg and the operations that return, so they need a full barrier.
+ */
+#define ATOMIC_OP(c_t, prefix, size)					\
+static inline							\
+c_t atomic##prefix##_xchg_relaxed(atomic##prefix##_t *v, c_t n)		\
+{									\
+	return __xchg_relaxed(&(v->counter), n, size);			\
+}									\
+static inline							\
+c_t atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n)		\
+{									\
+	return __xchg_acquire(&(v->counter), n, size);			\
+}									\
+static inline							\
+c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n)		\
+{									\
+	return __xchg_release(&(v->counter), n, size);			\
+}									\
+static inline							\
+c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)			\
+{									\
+	return __xchg(&(v->counter), n, size);				\
+}									\
+static inline							\
+c_t atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,		\
+				     c_t o, c_t n)			\
+{									\
+	return __cmpxchg_relaxed(&(v->counter), o, n, size);		\
+}									\
+static inline							\
+c_t atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,		\
+				     c_t o, c_t n)			\
+{									\
+	return __cmpxchg_acquire(&(v->counter), o, n, size);		\
+}									\
+static inline							\
+c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,		\
+				     c_t o, c_t n)			\
+{									\
+	return __cmpxchg_release(&(v->counter), o, n, size);		\
+}									\
+static inline							\
+c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n)	\
+{									\
+	return __cmpxchg(&(v->counter), o, n, size);			\
+}
+
+#define ATOMIC_OPS()							\
+	ATOMIC_OP(int,   , 4)
+
+ATOMIC_OPS()
+
+#define atomic_xchg_relaxed atomic_xchg_relaxed
+#define atomic_xchg_acquire atomic_xchg_acquire
+#define atomic_xchg_release atomic_xchg_release
+#define atomic_xchg atomic_xchg
+#define atomic_cmpxchg_relaxed atomic_cmpxchg_relaxed
+#define atomic_cmpxchg_acquire atomic_cmpxchg_acquire
+#define atomic_cmpxchg_release atomic_cmpxchg_release
+#define atomic_cmpxchg atomic_cmpxchg
+
+#undef ATOMIC_OPS
+#undef ATOMIC_OP
+
+static inline int atomic_sub_if_positive(atomic_t *v, int offset)
+{
+       int prev, rc;
+
+	__asm__ __volatile__ (
+		"0:	lr.w     %[p],  %[c]\n"
+		"	sub      %[rc], %[p], %[o]\n"
+		"	bltz     %[rc], 1f\n"
+		"	sc.w.rl  %[rc], %[rc], %[c]\n"
+		"	bnez     %[rc], 0b\n"
+		"	fence    rw, rw\n"
+		"1:\n"
+		: [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+		: [o]"r" (offset)
+		: "memory");
+	return prev - offset;
+}
+
+#define atomic_dec_if_positive(v)	atomic_sub_if_positive(v, 1)
+
+#endif /* _ASM_RISCV_ATOMIC_H */
-- 
2.42.0


