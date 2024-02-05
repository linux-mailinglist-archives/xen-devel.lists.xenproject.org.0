Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC47B849E4A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676214.1052331 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y6-0004aS-Og; Mon, 05 Feb 2024 15:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676214.1052331; Mon, 05 Feb 2024 15:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y5-00040L-S3; Mon, 05 Feb 2024 15:33:09 +0000
Received: by outflank-mailman (input) for mailman id 676214;
 Mon, 05 Feb 2024 15:33:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0y0-0007Hv-3e
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:04 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d99e9ed1-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:33:02 +0100 (CET)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-511570b2f49so135907e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:02 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:55 -0800 (PST)
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
X-Inumbo-ID: d99e9ed1-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147182; x=1707751982; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DAJ7IaJfHQvUHlz0u6Dc8IIe22blASYjWQPSCDm2uk=;
        b=KbmjpN73Af4yHM7urjg9RVCIeenEEE4rlz0iVgAMIbdMvcpwpJSukT/KHByIsaKQYW
         lf2qCAyyw0K8lnozw7H4bQmwU/3fPpO5JBGW623OWNvHe4j3RCehMblwi+q7LlZE6Jdm
         noAxlbTSAASpoCtTagJQZT7nrDz/8OVF4eqD3B4UHYruplJgB1EepdgKlLOIoi0xCMsj
         b1I689aP9hs9XWgZD+ZaRyQ9dTrR0yJ3hYpb5CXosJlE5F32cHWg4YNNs4MtaNy1LNGx
         j6uadJ9lo0SiBjthH1+qxFECi5Vj9nDJjw+ERWInoESDoXStZcK5Hmhmrcpl2c/8UR18
         T4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147182; x=1707751982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2DAJ7IaJfHQvUHlz0u6Dc8IIe22blASYjWQPSCDm2uk=;
        b=kjW4zKzQIXey7VF6B0cwUkcn/X3NoH0eujJJf+MY8M82kWl7NmjItavIBdHBoPg++K
         IY9Zx4fUo7uugRYAKXUYURbjA3kkmj2CYb2MPdGifM6Hxc91Za2KMO/DZ16001Jil5TQ
         SwoVsRNhBkfi0HUW35mmHSqgTtj9bvDvpWoVEw568vp3E1zACvuZBYnze9ml8C/eiklX
         CwviOTDKpugXRNZTXsstBw4rCCXQPJy0F0AulbiJ42qwgo49xmh3iuUutWDKXXcviCqD
         0iyoxuWLy0VFS7NwtDkwsaCxAAwfUo4R8BEeahBGN3VToZgd56BIJiK8fnabHQdv6ymc
         0lyQ==
X-Gm-Message-State: AOJu0Yzxn3bnKFaOs0YyJk7gm9K6SZV9/87rvd/dYhuyy2Xd0NXDAMFo
	rn/E4w+ibMfoofdDHBWnle9O5+Cyq9x6jeZONE3iNglqxv5DQSyCR4PmJ7du
X-Google-Smtp-Source: AGHT+IFtbI9+CWD1Auxa9moJtSAklOkWsFFpBqwrVQEwf1r4zBMEyVFFRDmDo5gEKvONDfOdYqMwxg==
X-Received: by 2002:a05:6512:2812:b0:511:463c:32c1 with SMTP id cf18-20020a056512281200b00511463c32c1mr2648458lfb.19.1707147176431;
        Mon, 05 Feb 2024 07:32:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXjRqVStwX6pbmwqKFDtpxYXWQ2xqzbjeMcJjPMa8k5/uxF5sgYQ/3Nae4aUgMYqxDzYs87+I+3QjPQZ0dPS3MWDTuJSioRFJodZWLLfVT9fN5+euwV5j+LTMZQLdW1d+/1iBHjyVf9bG/1BxO8VtO1Zi++2TAz33rK0TmqIBhx/9V0EgNftyVnyHoyT+oh+fG+NQEPl6MkcX5dwUZyGod4ucetAsajapedUjFQcJpMMXyArBeKVmO66rp6UFno95+B55wrF/5hcDbAgsil5rrpGdiNOnzGaz4/FTBSh9CzhBXjj8AC3oiN6jk9mEbhNbxnEObsdgvl
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
Subject: [PATCH v4 14/30] xen/riscv: introduce atomic.h
Date: Mon,  5 Feb 2024 16:32:21 +0100
Message-ID: <6554f2479e19ed3eae6de842ac1568c31d236461.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bobby Eshleman <bobbyeshleman@gmail.com>

Additionally, this patch introduces macros in fence.h,
which are utilized in atomic.h.

atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n)
were updated to use __*xchg_generic().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - do changes related to the updates of [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
 - drop casts in read_atomic_size(), write_atomic(), add_sized()
 - tabs -> spaces
 - drop #ifdef CONFIG_SMP ... #endif in fence.ha as it is simpler to handle NR_CPUS=1
   the same as NR_CPUS>1 with accepting less than ideal performance.
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
 xen/arch/riscv/include/asm/atomic.h | 395 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/fence.h  |   8 +
 2 files changed, 403 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/arch/riscv/include/asm/fence.h

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
new file mode 100644
index 0000000000..267d3c0803
--- /dev/null
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -0,0 +1,395 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Taken and modified from Linux.
+ *
+ * atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated to use
+ * __*xchg_generic()
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
+    case 1: *(uint8_t *)res = readb(p); break;
+    case 2: *(uint16_t *)res = readw(p); break;
+    case 4: *(uint32_t *)res = readl(p); break;
+    case 8: *(uint32_t *)res  = readq(p); break;
+    default: __bad_atomic_size(); break;
+    }
+}
+
+#define read_atomic(p) ({                               \
+    union { typeof(*p) val; char c[0]; } x_;            \
+    read_atomic_size(p, x_.c, sizeof(*p));              \
+    x_.val;                                             \
+})
+
+#define write_atomic(p, x)                              \
+({                                                      \
+    typeof(*p) x__ = (x);                               \
+    switch ( sizeof(*p) )                               \
+    {                                                   \
+    case 1: writeb((uint8_t)x__,  p); break;            \
+    case 2: writew((uint16_t)x__, p); break;            \
+    case 4: writel((uint32_t)x__, p); break;            \
+    case 8: writeq((uint64_t)x__, p); break;            \
+    default: __bad_atomic_size(); break;                \
+    }                                                   \
+    x__;                                                \
+})
+
+#define add_sized(p, x)                                 \
+({                                                      \
+    typeof(*(p)) x__ = (x);                             \
+    switch ( sizeof(*(p)) )                             \
+    {                                                   \
+    case 1: writeb(read_atomic(p) + x__, p); break;     \
+    case 2: writew(read_atomic(p) + x__, p); break;     \
+    case 4: writel(read_atomic(p) + x__, p); break;     \
+    default: __bad_atomic_size(); break;                \
+    }                                                   \
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
+    return __xchg_generic(&(v->counter), n, size, "", "", "");  \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_xchg_acquire(atomic##prefix##_t *v, c_t n) \
+{                                                               \
+    return __xchg_generic(&(v->counter), n, size,               \
+                          "", "", RISCV_ACQUIRE_BARRIER);       \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_xchg_release(atomic##prefix##_t *v, c_t n) \
+{                                                               \
+    return __xchg_generic(&(v->counter), n, size,               \
+                          "", RISCV_RELEASE_BARRIER, "");       \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)         \
+{                                                               \
+    return __xchg_generic(&(v->counter), n, size,               \
+                          ".aqrl", "", "");                     \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg_relaxed(atomic##prefix##_t *v,     \
+                     c_t o, c_t n)                              \
+{                                                               \
+    return __cmpxchg_generic(&(v->counter), o, n, size,         \
+                             "", "", "");                       \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg_acquire(atomic##prefix##_t *v,     \
+                     c_t o, c_t n)                              \
+{                                                               \
+    return __cmpxchg_generic(&(v->counter), o, n, size,         \
+                             "", "", RISCV_ACQUIRE_BARRIER);    \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg_release(atomic##prefix##_t *v,     \
+                     c_t o, c_t n)                              \
+{	                                                            \
+    return __cmpxchg_generic(&(v->counter), o, n, size,         \
+                             "", RISCV_RELEASE_BARRIER, "");    \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n) \
+{                                                               \
+    return __cmpxchg_generic(&(v->counter), o, n, size,         \
+                             ".rl", "", " fence rw, rw\n");     \
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
index 0000000000..ff3f23dbd7
--- /dev/null
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_RISCV_FENCE_H
+#define _ASM_RISCV_FENCE_H
+
+#define RISCV_ACQUIRE_BARRIER   "\tfence r , rw\n"
+#define RISCV_RELEASE_BARRIER   "\tfence rw,  w\n"
+
+#endif	/* _ASM_RISCV_FENCE_H */
-- 
2.43.0


