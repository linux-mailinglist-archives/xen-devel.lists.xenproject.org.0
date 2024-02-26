Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28795867F43
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:49:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685732.1066998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ref6B-0002K5-Hy; Mon, 26 Feb 2024 17:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685732.1066998; Mon, 26 Feb 2024 17:49:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ref6B-0002GQ-Dw; Mon, 26 Feb 2024 17:49:07 +0000
Received: by outflank-mailman (input) for mailman id 685732;
 Mon, 26 Feb 2024 17:49:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewr-0007o5-U0
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:30 +0000
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fd6ea638-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:28 +0100 (CET)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d24a727f78so47698731fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:28 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:26 -0800 (PST)
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
X-Inumbo-ID: fd6ea638-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969167; x=1709573967; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUqcPrIhWe0Vk4v1sB7d9+i8qhCirbfaZ3hk8sBz3cE=;
        b=MjrTnmlokNSCB+mpY7bQraWTco6yjA8xr35swExpUhrctW27PpLK8LOi5nZ1tW3oYz
         0IVvWv4R8AU3a5gR9FVkB3+UEHn2ZkTMY+HKeE0bNmgs5UtGnMKKzvxwuhXTqq7bTfk4
         +AjSJh7d8Nc6Q+kyrZsSrWPbKp+vVGQsRB5m5yLflLBbF98RAtV44mqj4rDBCzXql33j
         2uKOPxOkqJouVIpJmqV7jB2cbCQ0la2k8smvqevH0CiPF8ZEvcsqhQlaJhqhkSorQUUH
         ED4Ykue5YBDHsn7ONrc1jQJvGHDgIUbWOVojWNoHexFHPaCRmeuO83+nenGePXxCsO7/
         kGCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969167; x=1709573967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUqcPrIhWe0Vk4v1sB7d9+i8qhCirbfaZ3hk8sBz3cE=;
        b=PTIDupHoo9xCN5F9k3XnO+vGDmuupAyJjFzgJU2S/Gb3dusBrLJYycrnfk9F8KzcTb
         s0srM42akEHPv3CnbWdcUoh63lWTCJzQfXlChjLMvHH3qBJksZYhe31FvfH5EY+EgjPS
         qDGAlN5NWRvWSrLjVCzO6FkMObNCD+eJf9gAiPgEE7LHDHm37UvvsJFRYQkY7fYFU9Nr
         uAiNJnlyvzw59kyXraE+o3ogepo+A9GD+IdImIBvQz28TXvmzmoh4W+XB1bMTaqG4eIN
         creIJx60C5OYgtqDslN8dcBciKESC1Z70QlSZmV0a4Pxfl32WNWyz9RRqPXU/c4KW42P
         iDGg==
X-Gm-Message-State: AOJu0Yyu3gnkHqrlkGx0PYjwtAL0YKrHYKUGCG6Njs+IbekPLFira6uO
	RB2Mk1ypwkSKjIqpmoaz4TxP8SKeEEwkuaD9NwtnbGlMUIZCGxkhejecz3by
X-Google-Smtp-Source: AGHT+IE2jjYrQGrLtX7+yNNjBIujy1867FvMwRnqSl90csYLZUvko1M+Hz4cnzgF6OT31oX4csk5Pw==
X-Received: by 2002:a2e:8784:0:b0:2d2:3c10:4b6c with SMTP id n4-20020a2e8784000000b002d23c104b6cmr4490012lji.24.1708969166768;
        Mon, 26 Feb 2024 09:39:26 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 13/23] xen/riscv: introduce atomic.h
Date: Mon, 26 Feb 2024 18:38:55 +0100
Message-ID: <85ad8c86901d045beed228947d4c3faf277af3ca.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initially the patch was introduced by Bobby, who takes the header from
Linux kernel.

The following changes were done on top of Linux kernel header:
 - atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated
     to use__*xchg_generic()
 - drop casts in write_atomic() as they are unnecessary
 - drop introduction of WRITE_ONCE() and READ_ONCE().
   Xen provides ACCESS_ONCE()
 - remove zero-length array access in read_atomic()
 - drop defines similar to pattern
 - #define atomic_add_return_relaxed   atomic_add_return_relaxed
 - move not RISC-V specific functions to asm-generic/atomics-ops.h

Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - fence.h changes were moved to separate patch as patches related to io.h and cmpxchg.h,
   which are dependecies for this patch, also needed changes in fence.h
 - remove accessing of zero-length array
 - drops cast in write_atomic()
 - drop introduction of WRITE_ONCE() and READ_ONCE().
 - drop defines similar to pattern #define atomic_add_return_relaxed   atomic_add_return_relaxed
 - Xen code style fixes
 - move not RISC-V specific functions to asm-generic/atomics-ops.h
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
 xen/arch/riscv/include/asm/atomic.h  | 296 +++++++++++++++++++++++++++
 xen/include/asm-generic/atomic-ops.h |  92 +++++++++
 2 files changed, 388 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/include/asm-generic/atomic-ops.h

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
new file mode 100644
index 0000000000..8007ae4c90
--- /dev/null
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -0,0 +1,296 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Taken and modified from Linux.
+ *
+ * The following changes were done:
+ * - * atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated
+ *     to use__*xchg_generic()
+ * - drop casts in write_atomic() as they are unnecessary
+ * - drop introduction of WRITE_ONCE() and READ_ONCE().
+ *   Xen provides ACCESS_ONCE()
+ * - remove zero-length array access in read_atomic()
+ * - drop defines similar to pattern
+ *   #define atomic_add_return_relaxed   atomic_add_return_relaxed
+ * - move not RISC-V specific functions to asm-generic/atomics-ops.h
+ * 
+ * Copyright (C) 2007 Red Hat, Inc. All Rights Reserved.
+ * Copyright (C) 2012 Regents of the University of California
+ * Copyright (C) 2017 SiFive
+ * Copyright (C) 2024 Vates SAS
+ */
+
+#ifndef _ASM_RISCV_ATOMIC_H
+#define _ASM_RISCV_ATOMIC_H
+
+#include <xen/atomic.h>
+
+#include <asm/cmpxchg.h>
+#include <asm/fence.h>
+#include <asm/io.h>
+#include <asm/system.h>
+
+#include <asm-generic/atomic-ops.h>
+
+void __bad_atomic_size(void);
+
+/*
+ * Legacy from Linux kernel. For some reason they wanted to have ordered
+ * read/write access. Thereby read* is used instead of read<X>_cpu()
+ */
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
+    union { typeof(*p) val; char c[sizeof(*p)]; } x_;   \
+    read_atomic_size(p, x_.c, sizeof(*p));              \
+    x_.val;                                             \
+})
+
+#define write_atomic(p, x)                              \
+({                                                      \
+    typeof(*p) x__ = (x);                               \
+    switch ( sizeof(*p) )                               \
+    {                                                   \
+    case 1: writeb(x__,  p); break;                     \
+    case 2: writew(x__, p); break;                      \
+    case 4: writel(x__, p); break;                      \
+    case 8: writeq(x__, p); break;                      \
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
+#define __atomic_acquire_fence() \
+    __asm__ __volatile__ ( RISCV_ACQUIRE_BARRIER "" ::: "memory" )
+
+#define __atomic_release_fence() \
+    __asm__ __volatile__ ( RISCV_RELEASE_BARRIER "" ::: "memory" )
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
+#undef ATOMIC_OPS
+
+#define ATOMIC_OPS(op, asm_op, I) \
+        ATOMIC_FETCH_OP(op, asm_op, I, w, int,   )
+
+ATOMIC_OPS(and, and, i)
+ATOMIC_OPS( or,  or, i)
+ATOMIC_OPS(xor, xor, i)
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
+        RISCV_FULL_BARRIER
+        "1:\n"
+        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
+        : [a] "r" (a), [u] "r" (u)
+        : "memory");
+    return prev;
+}
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
+        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
+        : [o] "r" (offset)
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
diff --git a/xen/include/asm-generic/atomic-ops.h b/xen/include/asm-generic/atomic-ops.h
new file mode 100644
index 0000000000..fdd5a93ed8
--- /dev/null
+++ b/xen/include/asm-generic/atomic-ops.h
@@ -0,0 +1,92 @@
+#/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_ATOMIC_OPS_H_
+#define _ASM_GENERIC_ATOMIC_OPS_H_
+
+#include <xen/atomic.h>
+#include <xen/lib.h>
+
+#ifndef ATOMIC_READ
+static inline int atomic_read(const atomic_t *v)
+{
+    return ACCESS_ONCE(v->counter);
+}
+#endif
+
+#ifndef _ATOMIC_READ
+static inline int _atomic_read(atomic_t v)
+{
+    return v.counter;
+}
+#endif
+
+#ifndef ATOMIC_SET
+static inline void atomic_set(atomic_t *v, int i)
+{
+    ACCESS_ONCE(v->counter) = i;
+}
+#endif
+
+#ifndef _ATOMIC_SET
+static inline void _atomic_set(atomic_t *v, int i)
+{
+    v->counter = i;
+}
+#endif
+
+#ifndef ATOMIC_SUB_AND_TEST
+static inline int atomic_sub_and_test(int i, atomic_t *v)
+{
+    return atomic_sub_return(i, v) == 0;
+}
+#endif
+
+#ifndef ATOMIC_INC
+static inline void atomic_inc(atomic_t *v)
+{
+    atomic_add(1, v);
+}
+#endif
+
+#ifndef ATOMIC_INC_RETURN
+static inline int atomic_inc_return(atomic_t *v)
+{
+    return atomic_add_return(1, v);
+}
+#endif
+
+#ifndef ATOMIC_DEC
+static inline void atomic_dec(atomic_t *v)
+{
+    atomic_sub(1, v);
+}
+#endif
+
+#ifndef ATOMIC_DEC_RETURN
+static inline int atomic_dec_return(atomic_t *v)
+{
+    return atomic_sub_return(1, v);
+}
+#endif
+
+#ifndef ATOMIC_DEC_AND_TEST
+static inline int atomic_dec_and_test(atomic_t *v)
+{
+    return atomic_sub_return(1, v) == 0;
+}
+#endif
+
+#ifndef ATOMIC_ADD_NEGATIVE
+static inline int atomic_add_negative(int i, atomic_t *v)
+{
+    return atomic_add_return(i, v) < 0;
+}
+#endif
+
+#ifndef ATOMIC_INC_AND_TEST
+static inline int atomic_inc_and_test(atomic_t *v)
+{
+    return atomic_add_return(1, v) == 0;
+}
+#endif
+
+#endif /* _ASM_GENERIC_ATOMIC_OPS_H_ */
-- 
2.43.0


