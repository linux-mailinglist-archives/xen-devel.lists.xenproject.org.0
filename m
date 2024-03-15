Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E087D344
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693996.1082787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwx-0000Gd-P6; Fri, 15 Mar 2024 18:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693996.1082787; Fri, 15 Mar 2024 18:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwx-00009g-Eb; Fri, 15 Mar 2024 18:06:35 +0000
Received: by outflank-mailman (input) for mailman id 693996;
 Fri, 15 Mar 2024 18:06:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwv-0005yW-If
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:33 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c14c5ec1-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:32 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d46dd8b0b8so29374971fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:30 -0700 (PDT)
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
X-Inumbo-ID: c14c5ec1-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525992; x=1711130792; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZE7a6DyG7HrhqHnuqKEHobFd4GYM12z6GA2D6v4ifc8=;
        b=Z2MoWYUGQALcPcJ97VuZRud3jX//YKjSkrE1hW5fdGhhPoiWJ7f4UFgWfyM5cU9WFu
         t7jC4XLJHpAd0pnXzpSkW8dbL/t9Dd1sitVZP6+cX9fkRAgsEz9Tim1+WApdawkGvpAh
         r0wGIg315VP7JMsuOkOVOw/zztR2EtjInnLZK3n1DYgvFWD5Ih4xEHjlaU5cBftuK7OL
         ES3B+ri5/nprEMS2BiNb0SCyTxmcZ1E4eVn7cl16gNMjOboek78KbD3UACHW0/TRiBo6
         xlPGs2jvJfc5b3qNjyvCPu5BaD1Nw3uLLVe8T3KUTTga/UtDR1zASh9hB/sX4Tu5ZtH7
         W7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525992; x=1711130792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZE7a6DyG7HrhqHnuqKEHobFd4GYM12z6GA2D6v4ifc8=;
        b=vf3ckjIMMfcNoEuUCg/io+toSiH4Jr+qR+7vJu7RY4h9AyZGouCVu3Z6me0emmgIDP
         +F/TqTSGGgJ5NbVBHOERWBzYqTaTvbi0FidAHzpZezInnuOzQIvz2B8wScB1JWUq57a7
         ZS7GEsGLDgLEJZfqXPtlpVnyGODNgUVkPW/AyFqJABuDhQtNdx7OrWQ02T3VDCwrligt
         mVeptWVue2oaPald7xqEVUG0p8dzgYF2bSZ50TzyyelagQSsAyerrNvjqqIsEKyESEhd
         C7/Nr2i8MuYpt05/rUZOd9iBVJ5GuU3FIMqT/dk0SzM3C5pkcMzSOT5f2Wfa6jREegy0
         DeNQ==
X-Gm-Message-State: AOJu0YxS2JYA7jhxr8H28Cz2w6je4i2R/Jq1WBP1fiXNIErEK03cX3eI
	RE1nj00kt+GT4LYAkkVqqn3gBUkIhmGKqR/EWq0wp8nNcHMG8KkmloLw/PN4X1s=
X-Google-Smtp-Source: AGHT+IHF2NwE4bkCdY2LkNbwj8ABqLCgMklVcNZTsMrupm3XEVgoRJVYDZhCGwW9fW/R1tUp4e6JMA==
X-Received: by 2002:a2e:9cc9:0:b0:2d4:54dc:28e3 with SMTP id g9-20020a2e9cc9000000b002d454dc28e3mr4139965ljj.28.1710525991336;
        Fri, 15 Mar 2024 11:06:31 -0700 (PDT)
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
Subject: [PATCH v6 10/20] xen/riscv: introduce atomic.h
Date: Fri, 15 Mar 2024 19:06:06 +0100
Message-ID: <22ee9c8cc62c76cfb799fed800636e7c8bf25a17.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
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
 - drop  atomic##prefix##_{cmp}xchg_{release, aquire, release}() as they
   are not used in Xen.
 - update the defintion of  atomic##prefix##_{cmp}xchg according to
   {cmp}xchg() implementation in Xen.

Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - drop atomic##prefix##_{cmp}xchg_{release, aquire, relaxed} as they aren't used
   by Xen
 - code style fixes.
 - %s/__asm__ __volatile__/asm volatile
 - add explanational comments.
 - move inclusion of "#include <asm-generic/atomic-ops.h>" further down in atomic.h
   header.
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
 xen/arch/riscv/include/asm/atomic.h  | 263 +++++++++++++++++++++++++++
 xen/include/asm-generic/atomic-ops.h |  97 ++++++++++
 2 files changed, 360 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/include/asm-generic/atomic-ops.h

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
new file mode 100644
index 0000000000..4964821f3a
--- /dev/null
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -0,0 +1,263 @@
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
+#define read_atomic(p) ({                                   \
+    union { typeof(*(p)) val; char c[sizeof(*(p))]; } x_;   \
+    read_atomic_size(p, x_.c, sizeof(*(p)));                \
+    x_.val;                                                 \
+})
+
+#define write_atomic(p, x)                              \
+({                                                      \
+    typeof(*(p)) x__ = (x);                             \
+    switch ( sizeof(*(p)) )                             \
+    {                                                   \
+    case 1: writeb(x__, p); break;                      \
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
+    case 8: writeq(read_atomic(p) + x__, p); break;     \
+    default: __bad_atomic_size(); break;                \
+    }                                                   \
+})
+
+#define __atomic_acquire_fence() \
+    asm volatile ( RISCV_ACQUIRE_BARRIER "" ::: "memory" )
+
+#define __atomic_release_fence() \
+    asm volatile ( RISCV_RELEASE_BARRIER "" ::: "memory" )
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
+    asm volatile (                                          \
+        "   amo" #asm_op "." #asm_type " zero, %1, %0"      \
+        : "+A" (v->counter)                                 \
+        : "r" (I)                                           \
+        : "memory" );                                       \
+}                                                           \
+
+/*
+ * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the reason why
+ * last argument for ATOMIC_OP isn't used.
+ */
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
+#include <asm-generic/atomic-ops.h>
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
+    asm volatile (                                                  \
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
+    asm volatile (                                                  \
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
+/*
+ * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the reason why
+ * last argument of ATOMIC_FETCH_OP, ATOMIC_OP_RETURN isn't used.
+ */
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
+    asm volatile (
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
+ * {cmp,}xchg and the operations that return.
+ */
+#define ATOMIC_OP(c_t, prefix, size)                            \
+static inline                                                   \
+c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)         \
+{                                                               \
+    return __xchg(&(v->counter), n, size);                      \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n) \
+{                                                               \
+    return __cmpxchg(&v->counter, o, n, size);                  \
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
+    asm volatile (
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
index 0000000000..da1ea5aac2
--- /dev/null
+++ b/xen/include/asm-generic/atomic-ops.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The header provides default implementations for every xen/atomic.h-provided
+ * forward inline declaration that can be synthesized from other atomic
+ * functions.
+ */
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


