Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E79790203
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 20:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594728.928149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc8pv-0000LO-Ib; Fri, 01 Sep 2023 18:25:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594728.928149; Fri, 01 Sep 2023 18:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc8pv-0000Ip-Ey; Fri, 01 Sep 2023 18:25:39 +0000
Received: by outflank-mailman (input) for mailman id 594728;
 Fri, 01 Sep 2023 18:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dN/X=ER=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qc8pu-0000IZ-2O
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 18:25:38 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0f4788e-48f4-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 20:25:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 786D38285699;
 Fri,  1 Sep 2023 13:25:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id bk8AZN-nrLEC; Fri,  1 Sep 2023 13:25:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E9D3C82856E0;
 Fri,  1 Sep 2023 13:25:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id c-8IhFVnTeTB; Fri,  1 Sep 2023 13:25:32 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 7D75782854A4;
 Fri,  1 Sep 2023 13:25:32 -0500 (CDT)
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
X-Inumbo-ID: f0f4788e-48f4-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E9D3C82856E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693592732; bh=YvUuOVQ1VMhq3G/ldYRNM00UTD+hjEULrIEUv41wqaM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Sy9almopYutXKEfcarJhDPhovJsIUnxJlTtlT5Ia5MnAQgRuIR5q5H0/viFJSMU1Z
	 6kHn6kbGn+ibIDtFFAhJC/eygDzzyMGQ1+PzqPekrJ4a0HbaqpzaWV1kYHR8lFsmsI
	 uKUFKKUxt0vD4dsNerWfBXBY0YczeRABIji8Sp1U=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 1/5] xen/ppc: Implement atomic.h
Date: Fri,  1 Sep 2023 13:25:14 -0500
Message-Id: <917dc5517b69657b48e69c4100234383f5c70e0e.1693590982.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1693590982.git.sanastasio@raptorengineering.com>
References: <cover.1693590982.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implement atomic.h for PPC, based off of the original Xen 3.2
implementation.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v3:
  - Drop full copyright text headers
  - Drop unnecessary spaces after casts
  - const-ize write_atomic_size
  - Don't use GNU 0-length array extension in read_atomic
  - Use "+m" asm constraint instead of separate "=3Dm" and "m"
  - Fix line-continuing backslash formatting in arch_cmpxchg

v2:
  - Fix style of asm block constraints to include required spaces
  - Fix macro local variable naming (use trailing underscore instead of
    leading)
  - Drop unnecessary parens in __atomic_add_unless

 xen/arch/ppc/include/asm/atomic.h | 384 ++++++++++++++++++++++++++++++
 xen/arch/ppc/include/asm/memory.h |  34 +++
 2 files changed, 418 insertions(+)
 create mode 100644 xen/arch/ppc/include/asm/atomic.h
 create mode 100644 xen/arch/ppc/include/asm/memory.h

diff --git a/xen/arch/ppc/include/asm/atomic.h b/xen/arch/ppc/include/asm=
/atomic.h
new file mode 100644
index 0000000000..06cd24ead4
--- /dev/null
+++ b/xen/arch/ppc/include/asm/atomic.h
@@ -0,0 +1,384 @@
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
+    v->counter =3D i;
+}
+
+static inline void _atomic_set(atomic_t *v, int i)
+{
+    v->counter =3D i;
+}
+
+void __bad_atomic_read(const volatile void *p, void *res);
+void __bad_atomic_size(void);
+
+#define build_atomic_read(name, insn, type)                             =
       \
+    static inline type name(const volatile type *addr)                  =
       \
+    {                                                                   =
       \
+        type ret;                                                       =
       \
+        asm volatile ( insn "%U1%X1 %0,%1" : "=3Dr" (ret) : "m<>" (*addr=
) );     \
+        return ret;                                                     =
       \
+    }
+
+#define build_atomic_write(name, insn, type)                            =
       \
+    static inline void name(volatile type *addr, type val)              =
       \
+    {                                                                   =
       \
+        asm volatile ( insn "%U0%X0 %1,%0" : "=3Dm<>" (*addr) : "r" (val=
) );     \
+    }
+
+#define build_add_sized(name, ldinsn, stinsn, type)                     =
       \
+    static inline void name(volatile type *addr, type val)              =
       \
+    {                                                                   =
       \
+        type t;                                                         =
       \
+        asm volatile ( "1: " ldinsn " %0,0,%3\n"                        =
       \
+                       "add%I2 %0,%0,%2\n"                              =
       \
+                       stinsn " %0,0,%3 \n"                             =
       \
+                       "bne- 1b\n"                                      =
       \
+                       : "=3D&r" (t), "+m" (*addr)                      =
         \
+                       : "r" (val), "r" (addr)                          =
       \
+                       : "cc" );                                        =
       \
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
+static always_inline void read_atomic_size(const volatile void *p, void =
*res,
+                                           unsigned int size)
+{
+    ASSERT(IS_ALIGNED((vaddr_t)p, size));
+    switch ( size )
+    {
+    case 1:
+        *(uint8_t *)res =3D read_u8_atomic(p);
+        break;
+    case 2:
+        *(uint16_t *)res =3D read_u16_atomic(p);
+        break;
+    case 4:
+        *(uint32_t *)res =3D read_u32_atomic(p);
+        break;
+    case 8:
+        *(uint64_t *)res =3D read_u64_atomic(p);
+        break;
+    default:
+        __bad_atomic_read(p, res);
+        break;
+    }
+}
+
+static always_inline void write_atomic_size(volatile void *p, const void=
 *val,
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
+#define read_atomic(p)                                                  =
       \
+    ({                                                                  =
       \
+        union {                                                         =
       \
+            typeof(*(p)) val;                                           =
       \
+            char c[sizeof(*(p))];                                       =
       \
+        } x_;                                                           =
       \
+        read_atomic_size(p, x_.c, sizeof(*(p)));                        =
       \
+        x_.val;                                                         =
       \
+    })
+
+#define write_atomic(p, x)                                              =
       \
+    do                                                                  =
       \
+    {                                                                   =
       \
+        typeof(*(p)) x_ =3D (x);                                        =
         \
+        write_atomic_size(p, &x_, sizeof(*(p)));                        =
       \
+    } while ( 0 )
+
+#define add_sized(p, x)                                                 =
       \
+    ({                                                                  =
       \
+        typeof(*(p)) x_ =3D (x);                                        =
         \
+        switch ( sizeof(*(p)) )                                         =
       \
+        {                                                               =
       \
+        case 1:                                                         =
       \
+            add_u8_sized((uint8_t *)(p), x_);                           =
       \
+            break;                                                      =
       \
+        case 2:                                                         =
       \
+            add_u16_sized((uint16_t *)(p), x_);                         =
       \
+            break;                                                      =
       \
+        case 4:                                                         =
       \
+            add_u32_sized((uint32_t *)(p), x_);                         =
       \
+            break;                                                      =
       \
+        default:                                                        =
       \
+            __bad_atomic_size();                                        =
       \
+            break;                                                      =
       \
+        }                                                               =
       \
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
+                   : "=3D&r" (t), "+m" (v->counter)
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
+                   "bne- 1b"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=3D&r" (t)
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
+                   : "=3D&r" (t), "+m" (v->counter)
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
+                   "bne- 1b"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=3D&r" (t)
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
+                   : "=3D&r" (t), "+m" (v->counter)
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
+                   "bne- 1b"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=3D&r" (t)
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
+                   : "=3D&r" (t), "+m" (v->counter)
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
+                   "bne- 1b"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=3D&r" (t)
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
+                  : "=3D&r" (t)
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
+    rc.counter =3D __cmpxchg(&v->counter, old.counter, new.counter, size=
of(int));
+    return rc;
+}
+
+#define arch_cmpxchg(ptr, o, n)                                         =
       \
+    ({                                                                  =
       \
+        __typeof__(*(ptr)) o_ =3D (o);                                  =
         \
+        __typeof__(*(ptr)) n_ =3D (n);                                  =
         \
+        (__typeof__(*(ptr))) __cmpxchg((ptr), (unsigned long) o_,       =
       \
+                                       (unsigned long) n_, sizeof(*(ptr)=
));    \
+    })
+
+static inline int atomic_cmpxchg(atomic_t *v, int old, int new)
+{
+    return arch_cmpxchg(&v->counter, old, new);
+}
+
+#define ATOMIC_OP(op, insn, suffix, sign) \
+    static inline void atomic_##op(int a, atomic_t *v)                  =
         \
+    {                                                                   =
         \
+        int t;                                                          =
         \
+        asm volatile ( "1: lwarx %0,0,%3\n"                             =
         \
+                       insn "%I2" suffix " %0,%0,%2\n"                  =
         \
+                       "stwcx. %0,0,%3 \n"                              =
         \
+                       "bne- 1b\n"                                      =
         \
+                       : "=3D&r" (t), "+m" (v->counter)                 =
           \
+                       : "r" #sign (a), "r" (&v->counter)               =
         \
+                       : "cc" );                                        =
         \
+    }
+
+ATOMIC_OP(and, "and", ".", K)
+
+static inline int atomic_sub_and_test(int i, atomic_t *v)
+{
+    return atomic_sub_return(i, v) =3D=3D 0;
+}
+
+static inline int atomic_inc_and_test(atomic_t *v)
+{
+    return atomic_add_return(1, v) =3D=3D 0;
+}
+
+static inline int atomic_dec_and_test(atomic_t *v)
+{
+    return atomic_sub_return(1, v) =3D=3D 0;
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
+	c =3D atomic_read(v);
+	while (c !=3D u && (old =3D atomic_cmpxchg(v, c, c + a)) !=3D c)
+		c =3D old;
+	return c;
+}
+
+static inline int atomic_add_unless(atomic_t *v, int a, int u)
+{
+    return __atomic_add_unless(v, a, u);
+}
+
+#endif /* _ASM_PPC64_ATOMIC_H_ */
diff --git a/xen/arch/ppc/include/asm/memory.h b/xen/arch/ppc/include/asm=
/memory.h
new file mode 100644
index 0000000000..a159ba2d63
--- /dev/null
+++ b/xen/arch/ppc/include/asm/memory.h
@@ -0,0 +1,21 @@
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
+#include <xen/config.h>
+
+#ifdef CONFIG_SMP
+#define PPC_ATOMIC_ENTRY_BARRIER "sync\n"
+#define PPC_ATOMIC_EXIT_BARRIER  "sync\n"
+#else
+#define PPC_ATOMIC_ENTRY_BARRIER
+#define PPC_ATOMIC_EXIT_BARRIER
+#endif
+
+#endif
--
2.30.2


