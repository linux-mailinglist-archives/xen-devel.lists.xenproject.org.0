Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 908748BCBB9
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717437.1119703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNj-0003XN-Na; Mon, 06 May 2024 10:15:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717437.1119703; Mon, 06 May 2024 10:15:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNj-0003S8-Ih; Mon, 06 May 2024 10:15:39 +0000
Received: by outflank-mailman (input) for mailman id 717437;
 Mon, 06 May 2024 10:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNh-0001cU-3n
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:37 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 945c66a3-0b91-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:15:36 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59c448b44aso227499566b.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:36 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:34 -0700 (PDT)
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
X-Inumbo-ID: 945c66a3-0b91-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990535; x=1715595335; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDyjivvlEUajhlGlhnu2GxTfqYEGut5Q4+O15ImgrLo=;
        b=Bh4uasLPuei6T+dcn4SErSq8Af3R+8AagnBUAHifuRGlg6HBEDas0NpP3DsFF9yJCs
         DhuvIDQqiAXPmTk74EAEdwcQPxkGyUrNkMiNAgu/5WaF1a2s2zDyAVfgabXuilF4767O
         la8hXo2IP2xeu8tQR2tNv3s2ORwNZpyo6y9ShOkU8GpRZVP8gTwMYLEpHcQFSlsymmBo
         b+mJy+B4uhcSggsS82o4Khq0Sp5lWDC+NRqEHt2bVkxpG25zDqmMfdJHAtGloiJMCimr
         kMyFONHy1S0zpw8XG1nKK16aJoOb/k5wsVsn65+R9do3Wg/ayLlApRt3ux3SUtc5Kq9l
         BHQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990535; x=1715595335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDyjivvlEUajhlGlhnu2GxTfqYEGut5Q4+O15ImgrLo=;
        b=D2zpWJUvsHTbJZ2qUIm4OZ088/qfQ1IKTYuORC/AeIaNEuI7t+IvyKmJKpd1VybxTa
         QxPKb+EV10lUDAenjmCWqENRYYyRrlEKARMm+nvcdKo/WTWlUulKmVtTQsRMmU9N0G1V
         OCHoDXMrzii26l/mFTbYu4b7+TUsJt1MOeFwJyIQ92YpKO1ZIYqZ6+Qe7f0Z6FBDIK0M
         03FaCTn80HHRuGw/gFKs4C89ERonbI3AclmuiKfG4omVWf+BDTQafpvrYqHD4ep4eSAI
         ZO2tN/VcQ9hme1etZ/Q9V7j/w9Kik54yA/d+KRBdimkWVfoz+I9QeJy5JsBFc486xgZU
         1LMw==
X-Gm-Message-State: AOJu0Yy/o8XyxT/ma06ZM1MzQTSl1OUDgPyvANUKs0tVGY2fUyDIqgaK
	xsrInnRXrTJ/VAIGw/NAW4QgF1aKn+nQxGHP5DC8DyO4I1btPQnM66Jk0A==
X-Google-Smtp-Source: AGHT+IEY9DIUYyry5vXcx4xo2XAeKDNEjLER6Q69hYI4eQuaLoI8Gil7153BtXz6puW3HgOjx7hvJg==
X-Received: by 2002:a17:907:6d10:b0:a59:bd5b:a0f3 with SMTP id sa16-20020a1709076d1000b00a59bd5ba0f3mr3104781ejc.38.1714990535190;
        Mon, 06 May 2024 03:15:35 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 07/15] xen/riscv: introduce atomic.h
Date: Mon,  6 May 2024 12:15:16 +0200
Message-ID: <1b8d0d3e665adc10222a9e07cedab7bcb40d88f2.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initially the patch was introduced by Bobby, who takes the header from
Linux kernel.

The following changes were done on top of Bobby's changes:
 - atomic##prefix##_*xchg_*(atomic##prefix##_t *v, c_t n) were updated
   to use__*xchg_generic()
 - drop casts in write_atomic() as they are unnecessary
 - drop introduction of WRITE_ONCE() and READ_ONCE().
   Xen provides ACCESS_ONCE()
 - remove zero-length array access in read_atomic()
 - drop defines similar to pattern:
   #define atomic_add_return_relaxed   atomic_add_return_relaxed
 - move not RISC-V specific functions to asm-generic/atomics-ops.h
 - drop  atomic##prefix##_{cmp}xchg_{release, aquire, release}() as they
   are not used in Xen.
 - update the defintion of  atomic##prefix##_{cmp}xchg according to
   {cmp}xchg() implementation in Xen.
 - some ATOMIC_OP() macros were updated:
   - drop size argument for ATOMIC_OP which defines atomic##prefix##_xchg()
     and atomic##prefix##_cmpxchg().
   - drop c_op argument for ATOMIC_OPS which defines ATOMIC_OPS(and, and),
     ATOMIC_OPS( or,  or), ATOMIC_OPS(xor, xor), ATOMIC_OPS(add, add, +),
     ATOMIC_OPS(sub, add, -) as c_op is always "+" for them.
   - drop "" from definition of __atomic_{acquire/release"}_fence.

The current implementation is the same with 8e86f0b409a4
("arm64: atomics: fix use of acquire + release for full barrier
semantics") [1].
RISC-V could combine acquire and release into the SC
instructions and it could reduce a fence instruction to gain better
performance. Here is related description from RISC-V ISA 10.2
Load-Reserved/Store-Conditional Instructions:

 - .aq:   The LR/SC sequence can be given acquire semantics by
          setting the aq bit on the LR instruction.
 - .rl:   The LR/SC sequence can be given release semantics by
              setting the rl bit on the SC instruction.
 - .aqrl: Setting the aq bit on the LR instruction, and setting
          both the aq and the rl bit on the SC instruction makes
          the LR/SC sequence sequentially consistent, meaning that
          it cannot be reordered with earlier or later memory
          operations from the same hart.

 Software should not set the rl bit on an LR instruction unless
 the aq bit is also set, nor should software set the aq bit on an
 SC instruction unless the rl bit is also set. LR.rl and SC.aq
 instructions are not guaranteed to provide any stronger ordering
 than those with both bits clear, but may result in lower
 performance.

Also, I way of transforming ".rl + full barrier" to ".aqrl" was approved
by (the author of the RVWMO spec) [2]

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/1391516953-14541-1-git-send-email-will.deacon@arm.com/
[2] https://lore.kernel.org/linux-riscv/41e01514-74ca-84f2-f5cc-2645c444fd8e@nvidia.com/

Signed-off-by: Bobby Eshleman <bobbyeshleman@gmail.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V9:
 - update the defintion of write_atomic macros:
   drop the return value as this macros isn't expeceted to return something
   drop unnessary parentheses around p.
 - drop casts inside _add_sized() for ptr variable as they aren't necessary.
---
Changes in V8:
 - ???? add the explanatory comment to _add_sized().
 - drop "" in __atomic_{acquire, release}_fence().
 - code style fixes in atomic##prefix##_##op##_return(): indentation.
 - drop an unary_op argument ("+") for ATOMIC_OPS(and, and), ATOMIC_OPS( or,  or), ATOMIC_OPS(xor, xor)
   and use "+" directly inside definition of ATOMIC_OPS().
 - drop c_op for ATOMIC_OPS(add, add, +) and ATOMIC_OPS(sub, add, -) as it is always "+" for now.
   Just use "+" inside definition of ATOMIC_OPS().
 - drop size argument for ATOMIC_OP() defintions of atomic##prefix##_{xchg,cmpxchg}()
 - update the commit message.
---
Changes in V7:
 - drop relaxed version of atomic ops as they are not used.
 - update the commit message
 - code style fixes
 - refactor functions write_atomic(), add_sized() to be able to use #ifdef CONFIG_RISCV_32 ... #endif
   for {write,read}q().
 - update ATOMIC_OPS to receive unary operator.
 - update the header on top of atomic-ops.h.
 - some minor movements of function inside atomic-ops.h header.
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

 xen/arch/riscv/include/asm/atomic.h  | 280 +++++++++++++++++++++++++++
 xen/include/asm-generic/atomic-ops.h |  97 ++++++++++
 2 files changed, 377 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/atomic.h
 create mode 100644 xen/include/asm-generic/atomic-ops.h

diff --git a/xen/arch/riscv/include/asm/atomic.h b/xen/arch/riscv/include/asm/atomic.h
new file mode 100644
index 0000000000..097e27c51b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/atomic.h
@@ -0,0 +1,280 @@
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
+ * read/write access. Thereby read* is used instead of read*_cpu()
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
+#ifndef CONFIG_RISCV_32
+    case 8: *(uint32_t *)res = readq(p); break;
+#endif
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
+static always_inline void _write_atomic(volatile void *p,
+                                       unsigned long x, unsigned int size)
+{
+    switch ( size )
+    {
+    case 1: writeb(x, p); break;
+    case 2: writew(x, p); break;
+    case 4: writel(x, p); break;
+#ifndef CONFIG_RISCV_32
+    case 8: writeq(x, p); break;
+#endif
+    default: __bad_atomic_size(); break;
+    }
+}
+
+#define write_atomic(p, x)                              \
+({                                                      \
+    typeof(*(p)) x_ = (x);                              \
+    _write_atomic(p, x_, sizeof(*(p)));                 \
+})
+
+static always_inline void _add_sized(volatile void *p,
+                                     unsigned long x, unsigned int size)
+{
+    switch ( size )
+    {
+    case 1:
+    {
+        volatile uint8_t *ptr = p;
+        write_atomic(ptr, read_atomic(ptr) + x);
+        break;
+    }
+    case 2:
+    {
+        volatile uint16_t *ptr = p;
+        write_atomic(ptr, read_atomic(ptr) + x);
+        break;
+    }
+    case 4:
+    {
+        volatile uint32_t *ptr = p;
+        write_atomic(ptr, read_atomic(ptr) + x);
+        break;
+    }
+#ifndef CONFIG_RISCV_32
+    case 8:
+    {
+        volatile uint64_t *ptr = p;
+        write_atomic(ptr, read_atomic(ptr) + x);
+        break;
+    }
+#endif
+    default: __bad_atomic_size(); break;
+    }
+}
+
+#define add_sized(p, x)                                 \
+({                                                      \
+    typeof(*(p)) x_ = (x);                              \
+    _add_sized((p), x_, sizeof(*(p)));                  \
+})
+
+#define __atomic_acquire_fence() \
+    asm volatile ( RISCV_ACQUIRE_BARRIER ::: "memory" )
+
+#define __atomic_release_fence() \
+    asm volatile ( RISCV_RELEASE_BARRIER ::: "memory" )
+
+/*
+ * First, the atomic ops that have no ordering constraints and therefor don't
+ * have the AQ or RL bits set.  These don't return anything, so there's only
+ * one version to worry about.
+ */
+#define ATOMIC_OP(op, asm_op, unary_op, asm_type, c_type, prefix)  \
+static inline                                               \
+void atomic##prefix##_##op(c_type i, atomic##prefix##_t *v) \
+{                                                           \
+    asm volatile (                                          \
+        "   amo" #asm_op "." #asm_type " zero, %1, %0"      \
+        : "+A" (v->counter)                                 \
+        : "r" (unary_op i)                                  \
+        : "memory" );                                       \
+}                                                           \
+
+/*
+ * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the reason why
+ * last argument for ATOMIC_OP isn't used.
+ */
+#define ATOMIC_OPS(op, asm_op, unary_op)                    \
+        ATOMIC_OP (op, asm_op, unary_op, w, int,   )
+
+ATOMIC_OPS(add, add, +)
+ATOMIC_OPS(sub, add, -)
+ATOMIC_OPS(and, and, +)
+ATOMIC_OPS( or,  or, +)
+ATOMIC_OPS(xor, xor, +)
+
+#undef ATOMIC_OP
+#undef ATOMIC_OPS
+
+#include <asm-generic/atomic-ops.h>
+
+/*
+ * Atomic ops that have ordered variant.
+ * There's two flavors of these: the arithmatic ops have both fetch and return
+ * versions, while the logical ops only have fetch versions.
+ */
+#define ATOMIC_FETCH_OP(op, asm_op, unary_op, asm_type, c_type, prefix) \
+static inline                                                       \
+c_type atomic##prefix##_fetch_##op(c_type i, atomic##prefix##_t *v) \
+{                                                                   \
+    register c_type ret;                                            \
+    asm volatile (                                                  \
+        "   amo" #asm_op "." #asm_type ".aqrl  %1, %2, %0"          \
+        : "+A" (v->counter), "=r" (ret)                             \
+        : "r" (unary_op i)                                          \
+        : "memory" );                                               \
+    return ret;                                                     \
+}
+
+#define ATOMIC_OP_RETURN(op, asm_op, c_op, unary_op, asm_type, c_type, prefix) \
+static inline                                                           \
+c_type atomic##prefix##_##op##_return(c_type i, atomic##prefix##_t *v)  \
+{                                                                       \
+    return atomic##prefix##_fetch_##op(i, v) c_op (unary_op i);         \
+}
+
+/*
+ * Only CONFIG_GENERIC_ATOMIC64=y was ported to Xen that is the reason why
+ * last argument of ATOMIC_FETCH_OP, ATOMIC_OP_RETURN isn't used.
+ */
+#define ATOMIC_OPS(op, asm_op, unary_op)                        \
+        ATOMIC_FETCH_OP( op, asm_op,    unary_op, w, int,   )   \
+        ATOMIC_OP_RETURN(op, asm_op, +, unary_op, w, int,   )
+
+ATOMIC_OPS(add, add, +)
+ATOMIC_OPS(sub, add, -)
+
+#undef ATOMIC_OPS
+
+#define ATOMIC_OPS(op, asm_op) \
+        ATOMIC_FETCH_OP(op, asm_op, +, w, int,   )
+
+ATOMIC_OPS(and, and)
+ATOMIC_OPS( or,  or)
+ATOMIC_OPS(xor, xor)
+
+#undef ATOMIC_OPS
+
+#undef ATOMIC_FETCH_OP
+#undef ATOMIC_OP_RETURN
+
+/* This is required to provide a full barrier on success. */
+static inline int atomic_add_unless(atomic_t *v, int a, int u)
+{
+    int prev, rc;
+
+    asm volatile (
+        "0: lr.w     %[p],  %[c]\n"
+        "   beq      %[p],  %[u], 1f\n"
+        "   add      %[rc], %[p], %[a]\n"
+        "   sc.w.aqrl  %[rc], %[rc], %[c]\n"
+        "   bnez     %[rc], 0b\n"
+        "1:\n"
+        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
+        : [a] "r" (a), [u] "r" (u)
+        : "memory");
+    return prev;
+}
+
+static inline int atomic_sub_if_positive(atomic_t *v, int offset)
+{
+    int prev, rc;
+
+    asm volatile (
+        "0: lr.w     %[p],  %[c]\n"
+        "   sub      %[rc], %[p], %[o]\n"
+        "   bltz     %[rc], 1f\n"
+        "   sc.w.aqrl  %[rc], %[rc], %[c]\n"
+        "   bnez     %[rc], 0b\n"
+        "1:\n"
+        : [p] "=&r" (prev), [rc] "=&r" (rc), [c] "+A" (v->counter)
+        : [o] "r" (offset)
+        : "memory" );
+    return prev - offset;
+}
+
+/*
+ * atomic_{cmp,}xchg is required to have exactly the same ordering semantics as
+ * {cmp,}xchg and the operations that return.
+ */
+#define ATOMIC_OP(c_t, prefix)                                  \
+static inline                                                   \
+c_t atomic##prefix##_xchg(atomic##prefix##_t *v, c_t n)         \
+{                                                               \
+    return __xchg(&v->counter, n, sizeof(c_t));                 \
+}                                                               \
+static inline                                                   \
+c_t atomic##prefix##_cmpxchg(atomic##prefix##_t *v, c_t o, c_t n) \
+{                                                               \
+    return __cmpxchg(&v->counter, o, n, sizeof(c_t));           \
+}
+
+#define ATOMIC_OPS() \
+    ATOMIC_OP(int,   )
+
+ATOMIC_OPS()
+
+#undef ATOMIC_OPS
+#undef ATOMIC_OP
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
index 0000000000..98dd907942
--- /dev/null
+++ b/xen/include/asm-generic/atomic-ops.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * The header provides default implementations for every xen/atomic.h-provided
+ * forward inline declaration that can be synthesized from other atomic
+ * functions or being created from scratch.
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
+#ifndef ATOMIC_INC_AND_TEST
+static inline int atomic_inc_and_test(atomic_t *v)
+{
+    return atomic_add_return(1, v) == 0;
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
+#endif /* _ASM_GENERIC_ATOMIC_OPS_H_ */
-- 
2.45.0


