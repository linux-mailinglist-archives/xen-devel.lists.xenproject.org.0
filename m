Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE83790206
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 20:26:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594730.928159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc8pw-0000Tm-16; Fri, 01 Sep 2023 18:25:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594730.928159; Fri, 01 Sep 2023 18:25:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc8pv-0000PG-T5; Fri, 01 Sep 2023 18:25:39 +0000
Received: by outflank-mailman (input) for mailman id 594730;
 Fri, 01 Sep 2023 18:25:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dN/X=ER=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qc8pu-0000IZ-OJ
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 18:25:38 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f17ebf42-48f4-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 20:25:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 628D282856E0;
 Fri,  1 Sep 2023 13:25:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id JaV1nqkQtJne; Fri,  1 Sep 2023 13:25:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5CF7D82854A4;
 Fri,  1 Sep 2023 13:25:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id gF14Zje-3yKq; Fri,  1 Sep 2023 13:25:33 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id E06568285413;
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
X-Inumbo-ID: f17ebf42-48f4-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5CF7D82854A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1693592733; bh=u1+JzE6+tuD8L5yf+Orv/qg/MDEc7yHSArpA19fmM4Y=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=s6wsNyEzT1P32HEuRufP57jBPRv6+kyCy4nCdQigU8tEKmS2jnQ8O7HHVgB19PK98
	 fIeSHzzgOKrD4gol73tLULCaTLMoFyh25N9NxP0Hp6NGNAD6juSa4Q3bv2RbA/slUc
	 08CTW82ahrEQEe4DzJDpi+cWjJI3pOjIutI4yi4w=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 2/5] xen/ppc: Implement bitops.h
Date: Fri,  1 Sep 2023 13:25:15 -0500
Message-Id: <63e66eed26da8f957315cb1db05693b1799ee7ad.1693591462.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1693591462.git.sanastasio@raptorengineering.com>
References: <cover.1693591462.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implement bitops.h, based on Linux's implementation as of commit
5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
Linux's implementation, this code diverges significantly in a number of
ways:
  - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
  - PPC32-specific code paths dropped
  - Formatting completely re-done to more closely line up with Xen.
    Including 4 space indentation.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v3:
  - Fix style of inline asm blocks.
  - Fix underscore-prefixed macro parameters/variables
  - Use __builtin_popcount for hweight* implementation
  - Update C functions to use proper Xen coding style

v2:
  - Clarify changes from Linux implementation in commit message
  - Use PPC_ATOMIC_{ENTRY,EXIT}_BARRIER macros from <asm/memory.h> instea=
d
    of hardcoded "sync" instructions in inline assembly blocks.
  - Fix macro line-continuing backslash spacing
  - Fix hard-tab usage in find_*_bit C functions.

 xen/arch/ppc/include/asm/bitops.h | 330 +++++++++++++++++++++++++++++-
 1 file changed, 327 insertions(+), 3 deletions(-)

diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm=
/bitops.h
index 548e97b414..9e2bf8ef1b 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -1,9 +1,333 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Adapted from Linux's arch/powerpc/include/asm/bitops.h.
+ *
+ * Merged version by David Gibson <david@gibson.dropbear.id.au>.
+ * Based on ppc64 versions by: Dave Engebretsen, Todd Inglett, Don
+ * Reed, Pat McCarthy, Peter Bergner, Anton Blanchard.  They
+ * originally took it from the ppc32 code.
+ */
 #ifndef _ASM_PPC_BITOPS_H
 #define _ASM_PPC_BITOPS_H

+#include <asm/memory.h>
+
+#define __set_bit(n, p)         set_bit(n, p)
+#define __clear_bit(n, p)       clear_bit(n, p)
+
+#define BITOP_BITS_PER_WORD     32
+#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
+#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
+#define BITS_PER_BYTE           8
+
 /* PPC bit number conversion */
-#define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
-#define PPC_BIT(bit)		(1UL << PPC_BITLSHIFT(bit))
-#define PPC_BITMASK(bs, be)	((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
+#define PPC_BITLSHIFT(be)    (BITS_PER_LONG - 1 - (be))
+#define PPC_BIT(bit)         (1UL << PPC_BITLSHIFT(bit))
+#define PPC_BITMASK(bs, be)  ((PPC_BIT(bs) - PPC_BIT(be)) | PPC_BIT(bs))
+
+/* Macro for generating the ***_bits() functions */
+#define DEFINE_BITOP(fn, op, prefix)                                    =
       \
+static inline void fn(unsigned long mask,                               =
       \
+                      volatile unsigned int *p_)                        =
       \
+{                                                                       =
       \
+    unsigned long old;                                                  =
       \
+    unsigned int *p =3D (unsigned int *)p_;                             =
         \
+    asm volatile ( prefix                                               =
       \
+                   "1: lwarx %0,0,%3,0\n"                               =
       \
+                   #op "%I2 %0,%0,%2\n"                                 =
       \
+                   "stwcx. %0,0,%3\n"                                   =
       \
+                   "bne- 1b\n"                                          =
       \
+                   : "=3D&r" (old), "+m" (*p)                           =
         \
+                   : "rK" (mask), "r" (p)                               =
       \
+                   : "cc", "memory" );                                  =
       \
+}
+
+DEFINE_BITOP(set_bits, or, "")
+DEFINE_BITOP(change_bits, xor, "")
+
+#define DEFINE_CLROP(fn, prefix)                                        =
       \
+static inline void fn(unsigned long mask, volatile unsigned int *_p)    =
       \
+{                                                                       =
       \
+    unsigned long old;                                                  =
       \
+    unsigned int *p =3D (unsigned int *)_p;                             =
         \
+    asm volatile ( prefix                                               =
       \
+                   "1: lwarx %0,0,%3,0\n"                               =
       \
+                   "andc %0,%0,%2\n"                                    =
       \
+                   "stwcx. %0,0,%3\n"                                   =
       \
+                   "bne- 1b\n"                                          =
       \
+                   : "=3D&r" (old), "+m" (*p)                           =
         \
+                   : "r" (mask), "r" (p)                                =
       \
+                   : "cc", "memory" );                                  =
       \
+}
+
+DEFINE_CLROP(clear_bits, "")
+
+static inline void set_bit(int nr, volatile void *addr)
+{
+    set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(=
nr));
+}
+static inline void clear_bit(int nr, volatile void *addr)
+{
+    clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WOR=
D(nr));
+}
+
+/**
+ * test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static inline int test_bit(int nr, const volatile void *addr)
+{
+    const volatile unsigned long *p =3D (const volatile unsigned long *)=
addr;
+    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
+}
+
+static inline unsigned long test_and_clear_bits(unsigned long mask, vola=
tile void *_p)
+{
+    unsigned long old, t;
+    unsigned int *p =3D (unsigned int *)_p;
+
+    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
+                   "1: lwarx %0,0,%3,0\n"
+                   "andc %1,%0,%2\n"
+                   "stwcx. %1,0,%3\n"
+                   "bne- 1b\n"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=3D&r" (old), "=3D&r" (t)
+                   : "r" (mask), "r" (p)
+                   : "cc", "memory" );
+
+    return (old & mask);
+}
+
+static inline int test_and_clear_bit(unsigned int nr,
+                                     volatile void *addr)
+{
+    return test_and_clear_bits(BITOP_MASK(nr), addr + BITOP_WORD(nr)) !=3D=
 0;
+}
+
+#define DEFINE_TESTOP(fn, op, eh)                                       =
       \
+static inline unsigned long fn(unsigned long mask, volatile unsigned int=
 *_p)  \
+{                                                                       =
       \
+    unsigned long old, t;                                               =
       \
+    unsigned int *p =3D (unsigned int *)_p;                             =
         \
+    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER                             =
       \
+                   "1: lwarx %0,0,%3,%4\n"                              =
       \
+                   #op "%I2 %1,%0,%2\n"                                 =
       \
+                   "stwcx. %1,0,%3\n"                                   =
       \
+                   "bne- 1b\n"                                          =
       \
+                   PPC_ATOMIC_EXIT_BARRIER                              =
       \
+                   : "=3D&r" (old), "=3D&r" (t)                         =
           \
+                   : "rK" (mask), "r" (p), "n" (eh)                     =
       \
+                   : "cc", "memory" );                                  =
       \
+    return (old & mask);                                                =
       \
+}
+
+DEFINE_TESTOP(test_and_set_bits, or, 0)
+
+static inline int test_and_set_bit(unsigned long nr, volatile void *addr=
)
+{
+    return test_and_set_bits(BITOP_MASK(nr), (volatile unsigned int *)ad=
dr +
+                                             BITOP_WORD(nr)) !=3D 0;
+}
+
+/**
+ * __test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static inline int __test_and_set_bit(int nr, volatile void *addr)
+{
+    unsigned int mask =3D BITOP_MASK(nr);
+    volatile unsigned int *p =3D ((volatile unsigned int *)addr) + BITOP=
_WORD(nr);
+    unsigned int old =3D *p;
+
+    *p =3D old | mask;
+    return (old & mask) !=3D 0;
+}
+
+/**
+ * __test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static inline int __test_and_clear_bit(int nr, volatile void *addr)
+{
+    unsigned int mask =3D BITOP_MASK(nr);
+    volatile unsigned int *p =3D ((volatile unsigned int *)addr) + BITOP=
_WORD(nr);
+    unsigned int old =3D *p;
+
+    *p =3D old & ~mask;
+    return (old & mask) !=3D 0;
+}
+
+#define flsl(x) generic_flsl(x)
+#define fls(x) generic_fls(x)
+#define ffs(x) ({ unsigned int t_ =3D (x); fls(t_ & - t_); })
+#define ffsl(x) ({ unsigned long t_ =3D (x); flsl(t_ & - t_); })
+
+/* Based on linux/include/asm-generic/bitops/ffz.h */
+/*
+ * ffz - find first zero in word.
+ * @word: The word to search
+ *
+ * Undefined if no zero exists, so code should check against ~0UL first.
+ */
+#define ffz(x)  __ffs(~(x))
+
+/**
+ * hweightN - returns the hamming weight of a N-bit word
+ * @x: the word to weigh
+ *
+ * The Hamming Weight of a number is the total number of bits set in it.
+ */
+#define hweight64(x) __builtin_popcountll(x)
+#define hweight32(x) __builtin_popcount(x)
+#define hweight16(x) __builtin_popcount((uint16_t)(x))
+#define hweight8(x)  __builtin_popcount((uint8_t)(x))
+
+/* Based on linux/include/asm-generic/bitops/builtin-__ffs.h */
+/**
+ * __ffs - find first bit in word.
+ * @word: The word to search
+ *
+ * Undefined if no bit exists, so code should check against 0 first.
+ */
+static always_inline unsigned long __ffs(unsigned long word)
+{
+    return __builtin_ctzl(word);
+}
+
+/**
+ * find_first_set_bit - find the first set bit in @word
+ * @word: the word to search
+ *
+ * Returns the bit-number of the first set bit (first bit being 0).
+ * The input must *not* be zero.
+ */
+#define find_first_set_bit(x) (ffsl(x) - 1)
+
+/*
+ * Find the first set bit in a memory region.
+ */
+static inline unsigned long find_first_bit(const unsigned long *addr,
+                                           unsigned long size)
+{
+    const unsigned long *p =3D addr;
+    unsigned long result =3D 0;
+    unsigned long tmp;
+
+    while ( size & ~(BITS_PER_LONG - 1) )
+    {
+        if ( (tmp =3D *(p++)) )
+            goto found;
+        result +=3D BITS_PER_LONG;
+        size -=3D BITS_PER_LONG;
+    }
+    if ( !size )
+        return result;
+
+    tmp =3D (*p) & (~0UL >> (BITS_PER_LONG - size));
+    if ( tmp =3D=3D 0UL )         /* Are any bits set? */
+        return result + size; /* Nope. */
+ found:
+    return result + __ffs(tmp);
+}
+
+static inline unsigned long find_next_bit(const unsigned long *addr,
+                                          unsigned long size,
+                                          unsigned long offset)
+{
+    const unsigned long *p =3D addr + BITOP_WORD(offset);
+    unsigned long result =3D offset & ~(BITS_PER_LONG - 1);
+    unsigned long tmp;
+
+    if ( offset >=3D size )
+        return size;
+    size -=3D result;
+    offset %=3D BITS_PER_LONG;
+    if ( offset )
+    {
+        tmp =3D *(p++);
+        tmp &=3D (~0UL << offset);
+        if ( size < BITS_PER_LONG )
+            goto found_first;
+        if ( tmp )
+            goto found_middle;
+        size -=3D BITS_PER_LONG;
+        result +=3D BITS_PER_LONG;
+    }
+    while ( size & ~(BITS_PER_LONG - 1) )
+    {
+        if ( (tmp =3D *(p++)) )
+            goto found_middle;
+        result +=3D BITS_PER_LONG;
+        size -=3D BITS_PER_LONG;
+    }
+    if ( !size )
+        return result;
+    tmp =3D *p;
+
+ found_first:
+    tmp &=3D (~0UL >> (BITS_PER_LONG - size));
+    if ( tmp =3D=3D 0UL )         /* Are any bits set? */
+        return result + size; /* Nope. */
+ found_middle:
+    return result + __ffs(tmp);
+}
+
+/*
+ * This implementation of find_{first,next}_zero_bit was stolen from
+ * Linus' asm-alpha/bitops.h.
+ */
+static inline unsigned long find_next_zero_bit(const unsigned long *addr=
,
+                                               unsigned long size,
+                                               unsigned long offset)
+{
+    const unsigned long *p =3D addr + BITOP_WORD(offset);
+    unsigned long result =3D offset & ~(BITS_PER_LONG - 1);
+    unsigned long tmp;
+
+    if ( offset >=3D size )
+        return size;
+    size -=3D result;
+    offset %=3D BITS_PER_LONG;
+    if ( offset )
+    {
+        tmp =3D *(p++);
+        tmp |=3D ~0UL >> (BITS_PER_LONG - offset);
+        if ( size < BITS_PER_LONG )
+            goto found_first;
+        if ( ~tmp )
+            goto found_middle;
+        size -=3D BITS_PER_LONG;
+        result +=3D BITS_PER_LONG;
+    }
+    while ( size & ~(BITS_PER_LONG - 1) )
+    {
+        if ( ~(tmp =3D *(p++)) )
+            goto found_middle;
+        result +=3D BITS_PER_LONG;
+        size -=3D BITS_PER_LONG;
+    }
+    if ( !size )
+        return result;
+    tmp =3D *p;
+
+ found_first:
+    tmp |=3D ~0UL << size;
+    if ( tmp =3D=3D ~0UL )        /* Are any bits zero? */
+        return result + size; /* Nope. */
+ found_middle:
+    return result + ffz(tmp);
+}

 #endif /* _ASM_PPC_BITOPS_H */
--
2.30.2


