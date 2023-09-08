Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C87679927A
	for <lists+xen-devel@lfdr.de>; Sat,  9 Sep 2023 00:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598231.932853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qekJG-00089L-DG; Fri, 08 Sep 2023 22:50:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598231.932853; Fri, 08 Sep 2023 22:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qekJG-00086F-A2; Fri, 08 Sep 2023 22:50:42 +0000
Received: by outflank-mailman (input) for mailman id 598231;
 Fri, 08 Sep 2023 22:50:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6LDZ=EY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qekJF-000864-4k
 for xen-devel@lists.xenproject.org; Fri, 08 Sep 2023 22:50:41 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 218f091a-4e9a-11ee-8783-cb3800f73035;
 Sat, 09 Sep 2023 00:50:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C0DBD8286A44;
 Fri,  8 Sep 2023 17:50:38 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Sk29uo0OWNf3; Fri,  8 Sep 2023 17:50:37 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2DBB582853EE;
 Fri,  8 Sep 2023 17:50:37 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id bcA42MyN_NjI; Fri,  8 Sep 2023 17:50:37 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 9D481828541B;
 Fri,  8 Sep 2023 17:50:36 -0500 (CDT)
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
X-Inumbo-ID: 218f091a-4e9a-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2DBB582853EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694213437; bh=JiQdYn3CvYO7m9kM2CTrrP7H6NwgtpFmLhDch+sjc2Q=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=KaLT3wLHewoBuZrJYOQO3rNtd1rqCx7DtFMMKrwlrnacnvrXso7KZ/nbFZeGBrFXG
	 l4IxHcM4igTSWn98t3RU3+iLcZQq+JahV7f8v0TSARM04t0C8G4rEu5iSgxBJ7CxOP
	 oB//f2rhscibiFORONIAHDRh94d9mM30dVqkfPKw=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v4 1/5] xen/ppc: Implement atomic.h
Date: Fri,  8 Sep 2023 17:50:14 -0500
Message-Id: <7ed453323033a759427da33cea7d18ddca247ae7.1694211900.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1694211900.git.sanastasio@raptorengineering.com>
References: <cover.1694211900.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Implement atomic.h for PPC, based off of the original Xen 3.2
implementation. This implementation depends on some functions that are
not yet defined (notably __cmpxchg), so it can't yet be used.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v4:
  - Clarify dependency on __cmpxchg which doesn't get implemented until
    future patch
  - Drop !CONFIG_SMP case for PPC_ATOMIC_{ENTRY,EXIT}_BARRIER macro
    definitions
  - Add missing newlines to inline asm instructions preceeding
    PPC_ATOMIC_EXIT_BARRIER. This was only discovered by the change
    to drop the !CONFIG_SMP definitions of those macros.
  - Fix line wrapping in atomic_compareandswap
  - Fix formatting of arch_cmpxchg macro

v3:
  - Drop full copyright text headers
  - Drop unnecessary spaces after casts
  - const-ize write_atomic_size
  - Don't use GNU 0-length array extension in read_atomic
  - Use "+m" asm constraint instead of separate "=m" and "m"
  - Fix line-continuing backslash formatting in arch_cmpxchg

v2:
  - Fix style of asm block constraints to include required spaces
  - Fix macro local variable naming (use trailing underscore instead of
    leading)
  - Drop unnecessary parens in __atomic_add_unless

 xen/arch/ppc/include/asm/atomic.h | 385 ++++++++++++++++++++++++++++++
 xen/arch/ppc/include/asm/memory.h |  14 ++
 2 files changed, 399 insertions(+)
 create mode 100644 xen/arch/ppc/include/asm/atomic.h
 create mode 100644 xen/arch/ppc/include/asm/memory.h

diff --git a/xen/arch/ppc/include/asm/atomic.h b/xen/arch/ppc/include/asm/atomic.h
new file mode 100644
index 0000000000..64168aa3f1
--- /dev/null
+++ b/xen/arch/ppc/include/asm/atomic.h
@@ -0,0 +1,385 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * PowerPC64 atomic operations
+ *
+ * Copyright (C) 2001 Paul Mackerras <paulus@au.ibm.com>, IBM
+ * Copyright (C) 2001 Anton Blanchard <anton@au.ibm.com>, IBM
+ * Copyright Raptor Engineering LLC
+ */
+
+#ifndef _ASM_PPC64_ATOMIC_H_
+#define _ASM_PPC64_ATOMIC_H_
+
+#include <xen/atomic.h>
+
+#include <asm/memory.h>
+
+static inline int atomic_read(const atomic_t *v)
+{
+    return *(volatile int *)&v->counter;
+}
+
+static inline int _atomic_read(atomic_t v)
+{
+    return v.counter;
+}
+
+static inline void atomic_set(atomic_t *v, int i)
+{
+    v->counter = i;
+}
+
+static inline void _atomic_set(atomic_t *v, int i)
+{
+    v->counter = i;
+}
+
+void __bad_atomic_read(const volatile void *p, void *res);
+void __bad_atomic_size(void);
+
+#define build_atomic_read(name, insn, type)                                    \
+    static inline type name(const volatile type *addr)                         \
+    {                                                                          \
+        type ret;                                                              \
+        asm volatile ( insn "%U1%X1 %0,%1" : "=r" (ret) : "m<>" (*addr) );     \
+        return ret;                                                            \
+    }
+
+#define build_atomic_write(name, insn, type)                                   \
+    static inline void name(volatile type *addr, type val)                     \
+    {                                                                          \
+        asm volatile ( insn "%U0%X0 %1,%0" : "=m<>" (*addr) : "r" (val) );     \
+    }
+
+#define build_add_sized(name, ldinsn, stinsn, type)                            \
+    static inline void name(volatile type *addr, type val)                     \
+    {                                                                          \
+        type t;                                                                \
+        asm volatile ( "1: " ldinsn " %0,0,%3\n"                               \
+                       "add%I2 %0,%0,%2\n"                                     \
+                       stinsn " %0,0,%3 \n"                                    \
+                       "bne- 1b\n"                                             \
+                       : "=&r" (t), "+m" (*addr)                               \
+                       : "r" (val), "r" (addr)                                 \
+                       : "cc" );                                               \
+    }
+
+build_atomic_read(read_u8_atomic, "lbz", uint8_t)
+build_atomic_read(read_u16_atomic, "lhz", uint16_t)
+build_atomic_read(read_u32_atomic, "lwz", uint32_t)
+build_atomic_read(read_u64_atomic, "ldz", uint64_t)
+
+build_atomic_write(write_u8_atomic, "stb", uint8_t)
+build_atomic_write(write_u16_atomic, "sth", uint16_t)
+build_atomic_write(write_u32_atomic, "stw", uint32_t)
+build_atomic_write(write_u64_atomic, "std", uint64_t)
+
+build_add_sized(add_u8_sized, "lbarx", "stbcx.",uint8_t)
+build_add_sized(add_u16_sized, "lharx", "sthcx.", uint16_t)
+build_add_sized(add_u32_sized, "lwarx", "stwcx.", uint32_t)
+
+#undef build_atomic_read
+#undef build_atomic_write
+#undef build_add_sized
+
+static always_inline void read_atomic_size(const volatile void *p, void *res,
+                                           unsigned int size)
+{
+    ASSERT(IS_ALIGNED((vaddr_t)p, size));
+    switch ( size )
+    {
+    case 1:
+        *(uint8_t *)res = read_u8_atomic(p);
+        break;
+    case 2:
+        *(uint16_t *)res = read_u16_atomic(p);
+        break;
+    case 4:
+        *(uint32_t *)res = read_u32_atomic(p);
+        break;
+    case 8:
+        *(uint64_t *)res = read_u64_atomic(p);
+        break;
+    default:
+        __bad_atomic_read(p, res);
+        break;
+    }
+}
+
+static always_inline void write_atomic_size(volatile void *p, const void *val,
+                                            unsigned int size)
+{
+    ASSERT(IS_ALIGNED((vaddr_t)p, size));
+    switch ( size )
+    {
+    case 1:
+        write_u8_atomic(p, *(const uint8_t *)val);
+        break;
+    case 2:
+        write_u16_atomic(p, *(const uint16_t *)val);
+        break;
+    case 4:
+        write_u32_atomic(p, *(const uint32_t *)val);
+        break;
+    case 8:
+        write_u64_atomic(p, *(const uint64_t *)val);
+        break;
+    default:
+        __bad_atomic_size();
+        break;
+    }
+}
+
+#define read_atomic(p)                                                         \
+    ({                                                                         \
+        union {                                                                \
+            typeof(*(p)) val;                                                  \
+            char c[sizeof(*(p))];                                              \
+        } x_;                                                                  \
+        read_atomic_size(p, x_.c, sizeof(*(p)));                               \
+        x_.val;                                                                \
+    })
+
+#define write_atomic(p, x)                                                     \
+    do                                                                         \
+    {                                                                          \
+        typeof(*(p)) x_ = (x);                                                 \
+        write_atomic_size(p, &x_, sizeof(*(p)));                               \
+    } while ( 0 )
+
+#define add_sized(p, x)                                                        \
+    ({                                                                         \
+        typeof(*(p)) x_ = (x);                                                 \
+        switch ( sizeof(*(p)) )                                                \
+        {                                                                      \
+        case 1:                                                                \
+            add_u8_sized((uint8_t *)(p), x_);                                  \
+            break;                                                             \
+        case 2:                                                                \
+            add_u16_sized((uint16_t *)(p), x_);                                \
+            break;                                                             \
+        case 4:                                                                \
+            add_u32_sized((uint32_t *)(p), x_);                                \
+            break;                                                             \
+        default:                                                               \
+            __bad_atomic_size();                                               \
+            break;                                                             \
+        }                                                                      \
+    })
+
+static inline void atomic_add(int a, atomic_t *v)
+{
+    int t;
+
+    asm volatile ( "1: lwarx %0,0,%3\n"
+                   "add %0,%2,%0\n"
+                   "stwcx. %0,0,%3\n"
+                   "bne- 1b"
+                   : "=&r" (t), "+m" (v->counter)
+                   : "r" (a), "r" (&v->counter)
+                   : "cc" );
+}
+
+static inline int atomic_add_return(int a, atomic_t *v)
+{
+    int t;
+
+    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
+                   "1: lwarx %0,0,%2\n"
+                   "add %0,%1,%0\n"
+                   "stwcx. %0,0,%2\n"
+                   "bne- 1b\n"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=&r" (t)
+                   : "r" (a), "r" (&v->counter)
+                   : "cc", "memory" );
+
+    return t;
+}
+
+static inline void atomic_sub(int a, atomic_t *v)
+{
+    int t;
+
+    asm volatile ( "1: lwarx %0,0,%3\n"
+                   "subf %0,%2,%0\n"
+                   "stwcx. %0,0,%3\n"
+                   "bne- 1b"
+                   : "=&r" (t), "+m" (v->counter)
+                   : "r" (a), "r" (&v->counter)
+                   : "cc" );
+}
+
+static inline int atomic_sub_return(int a, atomic_t *v)
+{
+    int t;
+
+    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
+                   "1: lwarx %0,0,%2\n"
+                   "subf %0,%1,%0\n"
+                   "stwcx. %0,0,%2\n"
+                   "bne- 1b\n"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=&r" (t)
+                   : "r" (a), "r" (&v->counter)
+                   : "cc", "memory" );
+
+    return t;
+}
+
+static inline void atomic_inc(atomic_t *v)
+{
+    int t;
+
+    asm volatile ( "1: lwarx %0,0,%2\n"
+                   "addic %0,%0,1\n"
+                   "stwcx. %0,0,%2\n"
+                   "bne- 1b"
+                   : "=&r" (t), "+m" (v->counter)
+                   : "r" (&v->counter)
+                   : "cc" );
+}
+
+static inline int atomic_inc_return(atomic_t *v)
+{
+    int t;
+
+    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
+                   "1: lwarx %0,0,%1\n"
+                   "addic %0,%0,1\n"
+                   "stwcx. %0,0,%1\n"
+                   "bne- 1b\n"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=&r" (t)
+                   : "r" (&v->counter)
+                   : "cc", "memory" );
+
+    return t;
+}
+
+static inline void atomic_dec(atomic_t *v)
+{
+    int t;
+
+    asm volatile ( "1: lwarx %0,0,%2\n"
+                   "addic %0,%0,-1\n"
+                   "stwcx. %0,0,%2\n"
+                   "bne- 1b"
+                   : "=&r" (t), "+m" (v->counter)
+                   : "r" (&v->counter)
+                   : "cc" );
+}
+
+static inline int atomic_dec_return(atomic_t *v)
+{
+    int t;
+
+    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
+                   "1: lwarx %0,0,%1\n"
+                   "addic %0,%0,-1\n"
+                   "stwcx. %0,0,%1\n"
+                   "bne- 1b\n"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=&r" (t)
+                   : "r" (&v->counter)
+                   : "cc", "memory" );
+
+    return t;
+}
+
+/*
+ * Atomically test *v and decrement if it is greater than 0.
+ * The function returns the old value of *v minus 1.
+ */
+static inline int atomic_dec_if_positive(atomic_t *v)
+{
+    int t;
+
+    asm volatile( PPC_ATOMIC_ENTRY_BARRIER
+                  "1: lwarx %0,0,%1 # atomic_dec_if_positive\n"
+                  "addic. %0,%0,-1\n"
+                  "blt- 2f\n"
+                  "stwcx. %0,0,%1\n"
+                  "bne- 1b\n"
+                  PPC_ATOMIC_EXIT_BARRIER
+                  "2:"
+                  : "=&r" (t)
+                  : "r" (&v->counter)
+                  : "cc", "memory" );
+
+    return t;
+}
+
+static inline atomic_t atomic_compareandswap(atomic_t old, atomic_t new,
+                                             atomic_t *v)
+{
+    atomic_t rc;
+    rc.counter = __cmpxchg(&v->counter, old.counter, new.counter,
+                           sizeof(v->counter));
+    return rc;
+}
+
+#define arch_cmpxchg(ptr, o, n)                                                \
+    ({                                                                         \
+        __typeof__(*(ptr)) o_ = (o);                                           \
+        __typeof__(*(ptr)) n_ = (n);                                           \
+        (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long)o_,               \
+                                       (unsigned long)n_, sizeof(*(ptr)));     \
+    })
+
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
+{
+    return arch_cmpxchg(&v->counter, old, new);
+}
+
+#define ATOMIC_OP(op, insn, suffix, sign) \
+    static inline void atomic_##op(int a, atomic_t *v)                           \
+    {                                                                            \
+        int t;                                                                   \
+        asm volatile ( "1: lwarx %0,0,%3\n"                                      \
+                       insn "%I2" suffix " %0,%0,%2\n"                           \
+                       "stwcx. %0,0,%3 \n"                                       \
+                       "bne- 1b\n"                                               \
+                       : "=&r" (t), "+m" (v->counter)                            \
+                       : "r" #sign (a), "r" (&v->counter)                        \
+                       : "cc" );                                                 \
+    }
+
+ATOMIC_OP(and, "and", ".", K)
+
+static inline int atomic_sub_and_test(int i, atomic_t *v)
+{
+    return atomic_sub_return(i, v) == 0;
+}
+
+static inline int atomic_inc_and_test(atomic_t *v)
+{
+    return atomic_add_return(1, v) == 0;
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
+static inline int __atomic_add_unless(atomic_t *v, int a, int u)
+{
+	int c, old;
+
+	c = atomic_read(v);
+	while (c != u && (old = atomic_cmpxchg(v, c, c + a)) != c)
+		c = old;
+	return c;
+}
+
+static inline int atomic_add_unless(atomic_t *v, int a, int u)
+{
+    return __atomic_add_unless(v, a, u);
+}
+
+#endif /* _ASM_PPC64_ATOMIC_H_ */
diff --git a/xen/arch/ppc/include/asm/memory.h b/xen/arch/ppc/include/asm/memory.h
new file mode 100644
index 0000000000..57310eb690
--- /dev/null
+++ b/xen/arch/ppc/include/asm/memory.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) IBM Corp. 2005
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ */
+
+#ifndef _ASM_MEMORY_H_
+#define _ASM_MEMORY_H_
+
+#define PPC_ATOMIC_ENTRY_BARRIER "sync\n"
+#define PPC_ATOMIC_EXIT_BARRIER  "sync\n"
+
+#endif
--
2.30.2


