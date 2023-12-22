Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 099A581CC28
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:25:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659542.1029253 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhOU-0006qQ-PN; Fri, 22 Dec 2023 15:24:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659542.1029253; Fri, 22 Dec 2023 15:24:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhOU-0006of-MD; Fri, 22 Dec 2023 15:24:58 +0000
Received: by outflank-mailman (input) for mailman id 659542;
 Fri, 22 Dec 2023 15:24:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDZ-0007Ie-0U
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:41 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0141b8d-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:40 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e49a0b5caso2392226e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:40 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:38 -0800 (PST)
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
X-Inumbo-ID: b0141b8d-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258019; x=1703862819; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOwqAKIhXH+0XZ7x1OiU/ECPxpe/imzx7o+LpLoS1i0=;
        b=en2QSOETszdf5M2mVqeYWd4V3ujptKa14hGWQ8RWD67Dd6DXiySN54S3DDA+FmfWnp
         GAhshkDSgu/G9tgmd8AG6Bn5pCWWwS6f2mQZbzx95/NhZ1Zge2fVs/ypRtF8LoWQqKY2
         CK2CF+or/sdLyg+vGXAGWqrsbIpLhq11pOQzWsS+U7o2nmMnsMBGEEfB2d9I1Uv2B935
         qQ/phGBuzKdB/obJuF2gsIxY75inBC+2xMEHT0Zyq6xc64cPC8eG16DYJmwra/INcdvX
         ITD9mpuNPqxEG30XUBsQkubi0F9Bxt1KwfHIqTp3b8JNHMXAPad/hcd0hMEb68c5eK4e
         BNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258019; x=1703862819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mOwqAKIhXH+0XZ7x1OiU/ECPxpe/imzx7o+LpLoS1i0=;
        b=P3uhspXpeTCYrsQcWcl7gy9FspLKd39ij7LMWZpXvXZnDrlqd+0jpOP5Grxiybpo1l
         y5XWAw3AKmkz1c1svJPYilq006v9fODHAmyk/NKZWukMuyiOs4yn0WP2YKd5DzFLvofW
         365otdWP6SKG2pX2plFh4MbCRBvSF0RolrtxCT5SjaCbzE2qxsmgsS8+n5Bmxf2sZXim
         buy+vG11C/RZke7/T87GCNCV7gVGlE+rQcOxEH0dNxWxBHvi/H644F5DLTIGCgkQbPiZ
         YHeYJI3nEy4zRjMfwH9HogX378HSOrnsWuBh0EoovLOXeIAAKZXQDsr4Nuoht3tm1525
         e1kw==
X-Gm-Message-State: AOJu0Yz9yvkbBEMUAeaav2FJwzCL7hi4ki82onvnfCyhZLwXAOCtNMm5
	vHIpCFqv6nCptbtMnIcI+TFEfXMH9HA=
X-Google-Smtp-Source: AGHT+IH6EnT8IJBJwZ4VCRfWZjiCy5GmU+qEc/YW5PJ53Mw5nlU6Ak0wpMLw6M2Wj836iANLqaSE8w==
X-Received: by 2002:ac2:454e:0:b0:50e:384c:289a with SMTP id j14-20020ac2454e000000b0050e384c289amr761863lfm.78.1703258019469;
        Fri, 22 Dec 2023 07:13:39 -0800 (PST)
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
Subject: [PATCH v3 15/34] xen/riscv: introduce atomic.h
Date: Fri, 22 Dec 2023 17:12:59 +0200
Message-ID: <54f5f13a4ee3de3c3cf4ba2b4d0347bb77bb7d08.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobbyeshleman@gmail.com>

Additionally, this patch introduces macros in fence.h,
which are utilized in atomic.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
  - update the commit message
  - add SPDX for fence.h
  - code style fixes
  - Remove /* TODO: ... */ for add_sized macros. It looks correct to me.
  - re-order the patch
  - merge to this patch fence.h
---
Changes in V2:
 - Change an author of commit. I got this header from Bobby's old repo.
---
 xen/arch/riscv/include/asm/atomic.h | 384 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/fence.h  |  13 +
 2 files changed, 397 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/fence.h

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
new file mode 100644
index 0000000000..725326a9d1
--- /dev/null
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -0,0 +1,384 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
+    switch ( size )
+    {
+    case 1: *(uint8_t *)res = readb((const uint8_t *)p); break;
+    case 2: *(uint16_t *)res = readw((const uint16_t *)p); break;
+    case 4: *(uint32_t *)res = readl((const uint32_t *)p); break;
+    case 8: *(uint32_t *)res  = readq((const uint64_t *)p); break;
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
+    typeof(*p) x__ = (x);                                               \
+    switch ( sizeof(*p) )												\
+    {                                             						\
+    case 1: writeb((uint8_t)x__,  (uint8_t *)  p); break;              	\
+    case 2: writew((uint16_t)x__, (uint16_t *) p); break;              	\
+    case 4: writel((uint32_t)x__, (uint32_t *) p); break;              	\
+    case 8: writeq((uint64_t)x__, (uint64_t *) p); break;              	\
+    default: __bad_atomic_size(); break;                                \
+    }                                                                   \
+    x__;                                                                \
+})
+
+#define add_sized(p, x) ({                                              \
+    typeof(*(p)) x__ = (x);                                             \
+    switch ( sizeof(*(p)) )                                             \
+    {                                                                   \
+    case 1: writeb(read_atomic(p) + x__, (uint8_t *)(p)); break;        \
+    case 2: writew(read_atomic(p) + x__, (uint16_t *)(p)); break;       \
+    case 4: writel(read_atomic(p) + x__, (uint32_t *)(p)); break;       \
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
+        *(volatile typeof(x) *)&(x) = (val);                    \
+    } while (0)
+
+#define __atomic_acquire_fence() \
+    __asm__ __volatile__( RISCV_ACQUIRE_BARRIER "" ::: "memory" )
+
+#define __atomic_release_fence() \
+    __asm__ __volatile__( RISCV_RELEASE_BARRIER "" ::: "memory" );
+
+static inline int atomic_read(const atomic_t *v)
+{
+    return READ_ONCE(v->counter);
+}
+
+static inline int _atomic_read(atomic_t v)
+{
+    return v.counter;
+}
+
+static inline void atomic_set(atomic_t *v, int i)
+{
+    WRITE_ONCE(v->counter, i);
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
+#define ATOMIC_OP(op, asm_op, I, asm_type, c_type, prefix)  \
+static inline                                               \
+void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
+{                                                           \
+    __asm__ __volatile__ (                                  \
+        "   amo" #asm_op "." #asm_type " zero, %1, %0"      \
+        : "+A" (v->counter)                                 \
+        : "r" (I)                                           \
+        : "memory" );                                       \
+}                                                           \
+
+#define ATOMIC_OPS(op, asm_op, I)                           \
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
+#define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)    \
+static inline                                                       \
+c_type atomic##prefix##_fetch_##op##_relaxed(c_type i,              \
+                         atomic##prefix##_t *v)                     \
+{                                                                   \
+    register c_type ret;                                            \
+    __asm__ __volatile__ (                                          \
+        "   amo" #asm_op "." #asm_type " %1, %2, %0"                \
+        : "+A" (v->counter), "=r" (ret)                             \
+        : "r" (I)                                                   \
+        : "memory" );                                               \
+    return ret;                                                     \
+}                                                                   \
+static inline                                                       \
+c_type atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v) \
+{                                                                   \
+    register c_type ret;                                            \
+    __asm__ __volatile__ (                                          \
+        "   amo" #asm_op "." #asm_type ".aqrl  %1, %2, %0"          \
+        : "+A" (v->counter), "=r" (ret)                             \
+        : "r" (I)                                                   \
+        : "memory" );                                               \
+    return ret;                                                     \
+}
+
+#define ATOMIC_OP_RETURN(op, asm_op, c_op, I, asm_type, c_type, prefix) \
+static inline                                                           \
+c_type atomic##prefix##_##op##_return_relaxed(c_type i,                 \
+                          atomic##prefix##_t *v)                        \
+{                                                                       \
+        return atomic##prefix##_fetch_##op##_relaxed(i, v) c_op I;      \
+}                                                                       \
+static inline                                                           \
+c_type atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)  \
+{                                                                       \
+        return atomic##prefix##_fetch_##op(i, v) c_op I;                \
+}
+
+#define ATOMIC_OPS(op, asm_op, c_op, I)                                 \
+        ATOMIC_FETCH_OP( op, asm_op,       I, w, int,   )               \
+        ATOMIC_OP_RETURN(op, asm_op, c_op, I, w, int,   )
+
+ATOMIC_OPS(add, add, +,  i)
+ATOMIC_OPS(sub, add, +, -i)
+
+#define atomic_add_return_relaxed   atomic_add_return_relaxed
+#define atomic_sub_return_relaxed   atomic_sub_return_relaxed
+#define atomic_add_return   atomic_add_return
+#define atomic_sub_return   atomic_sub_return
+
+#define atomic_fetch_add_relaxed    atomic_fetch_add_relaxed
+#define atomic_fetch_sub_relaxed    atomic_fetch_sub_relaxed
+#define atomic_fetch_add    atomic_fetch_add
+#define atomic_fetch_sub    atomic_fetch_sub
+
+#undef ATOMIC_OPS
+
+#define ATOMIC_OPS(op, asm_op, I) \
+        ATOMIC_FETCH_OP(op, asm_op, I, w, int,   )
+
+ATOMIC_OPS(and, and, i)
+ATOMIC_OPS( or,  or, i)
+ATOMIC_OPS(xor, xor, i)
+
+#define atomic_fetch_and_relaxed    atomic_fetch_and_relaxed
+#define atomic_fetch_or_relaxed	    atomic_fetch_or_relaxed
+#define atomic_fetch_xor_relaxed    atomic_fetch_xor_relaxed
+#define atomic_fetch_and    atomic_fetch_and
+#define atomic_fetch_or     atomic_fetch_or
+#define atomic_fetch_xor    atomic_fetch_xor
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
+    __asm__ __volatile__ (
+        "0: lr.w     %[p],  %[c]\n"
+        "   beq      %[p],  %[u], 1f\n"
+        "   add      %[rc], %[p], %[a]\n"
+        "   sc.w.rl  %[rc], %[rc], %[c]\n"
+        "   bnez     %[rc], 0b\n"
+        "   fence    rw, rw\n"
+        "1:\n"
+        : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+        : [a]"r" (a), [u]"r" (u)
+        : "memory");
+    return prev;
+}
+#define atomic_fetch_add_unless atomic_fetch_add_unless
+
+/*
+ * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
+ * {cmp,}xchg and the operations that return, so they need a full barrier.
+ */
+#define ATOMIC_OP(c_t, prefix, size)                            \
+static inline                                                   \
+c_t atomic##prefix##_xchg_relaxed(atomic##prefix##_t *v, c_t n) \
+{                                                               \
+    return __xchg_relaxed(&(v->counter), n, size);              \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n) \
+{                                                               \
+    return __xchg_acquire(&(v->counter), n, size);              \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n) \
+{                                                               \
+    return __xchg_release(&(v->counter), n, size);              \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)         \
+{                                                               \
+    return __xchg(&(v->counter), n, size);                      \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,     \
+                     c_t o, c_t n)                              \
+{                                                               \
+    return __cmpxchg_relaxed(&(v->counter), o, n, size);        \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,     \
+                     c_t o, c_t n)                              \
+{                                                               \
+    return __cmpxchg_acquire(&(v->counter), o, n, size);        \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,     \
+                     c_t o, c_t n)                              \
+{	                                                            \
+    return __cmpxchg_release(&(v->counter), o, n, size);        \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n) \
+{                                                               \
+    return __cmpxchg(&(v->counter), o, n, size);                \
+}
+
+#define ATOMIC_OPS() \
+    ATOMIC_OP(int,   , 4)
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
+    __asm__ __volatile__ (
+        "0: lr.w     %[p],  %[c]\n"
+        "   sub      %[rc], %[p], %[o]\n"
+        "   bltz     %[rc], 1f\n"
+        "   sc.w.rl  %[rc], %[rc], %[c]\n"
+        "   bnez     %[rc], 0b\n"
+        "   fence    rw, rw\n"
+        "1:\n"
+        : [p]"=&r" (prev), [rc]"=&r" (rc), [c]"+A" (v->counter)
+        : [o]"r" (offset)
+        : "memory" );
+    return prev - offset;
+}
+
+#define atomic_dec_if_positive(v)	atomic_sub_if_positive(v, 1)
+
+#endif /* _ASM_RISCV_ATOMIC_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/riscv/include/asm/fence.h b/xen/arch/riscv/include/asm/fence.h
new file mode 100644
index 0000000000..b3f6b1c20a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_RISCV_FENCE_H
+#define _ASM_RISCV_FENCE_H
+
+#ifdef CONFIG_SMP
+#define RISCV_ACQUIRE_BARRIER		"\tfence r , rw\n"
+#define RISCV_RELEASE_BARRIER		"\tfence rw,  w\n"
+#else
+#define RISCV_ACQUIRE_BARRIER
+#define RISCV_RELEASE_BARRIER
+#endif
+
+#endif	/* _ASM_RISCV_FENCE_H */
-- 
2.43.0


