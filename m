Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BF7A0DC8
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 21:04:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602643.939354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrd0-0002mu-Ja; Thu, 14 Sep 2023 19:03:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602643.939354; Thu, 14 Sep 2023 19:03:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgrd0-0002fM-Ed; Thu, 14 Sep 2023 19:03:50 +0000
Received: by outflank-mailman (input) for mailman id 602643;
 Thu, 14 Sep 2023 19:03:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYVF=E6=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qgrcz-0002IU-0y
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 19:03:49 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d856f67-5331-11ee-9b0d-b553b5be7939;
 Thu, 14 Sep 2023 21:03:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DF8888285212;
 Thu, 14 Sep 2023 14:03:44 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id jQfIU8PxyYcS; Thu, 14 Sep 2023 14:03:43 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 02AC28285A2E;
 Thu, 14 Sep 2023 14:03:43 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cTSnquN6p1NZ; Thu, 14 Sep 2023 14:03:42 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A27888285212;
 Thu, 14 Sep 2023 14:03:42 -0500 (CDT)
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
X-Inumbo-ID: 6d856f67-5331-11ee-9b0d-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 02AC28285A2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694718223; bh=YqWpi95sOQcLMwxuQcOpynCFfcQBaws8ez62Tor+SXM=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=e8Xki5827SalMTbLxHPPb9iZbSxUKvjTO3ln+/mWETFNb9d82SLy42D/Jo4fJd9rn
	 u67a0UgsVmhrkCEFmIM0TXgfY+WWGSi2LYYWPINB0HNlpMbKqxsN7bPXVNaQNA0a/I
	 fpOq2IHdj94J43LADSwD7gnhDbDrbwrcBmiE0Jqg=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v6 1/4] xen/ppc: Implement bitops.h
Date: Thu, 14 Sep 2023 14:03:31 -0500
Message-Id: <b0a77fda0c663ecfbf40d177f275a51817efb28e.1694717278.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1694717278.git.sanastasio@raptorengineering.com>
References: <cover.1694717278.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Implement bitops.h, based on Linux's implementation as of commit
5321d1b1afb9a17302c6cec79f0cbf823eb0d3fc. Though it is based off of
Linux's implementation, this code diverges significantly in a number of
ways:
  - Bitmap entries changed to 32-bit words to match X86 and Arm on Xen
  - PPC32-specific code paths dropped
  - Formatting completely re-done to more closely line up with Xen.
    Including 4 space indentation.
  - Use GCC's __builtin_popcount* for hweight* implementation

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
v6:
  - Fix spacing of line-continuing backslashes in DEFINE_*OP macros
  - Drop unused prefix parameter from DEFINE_*OP macros
  - Reformat argument list in calls to test_and_{set,clear}_bits.

v5:
  - Switch lingering ulong bitop parameters/return values to uint.

v4:
  - Mention __builtin_popcount impelmentation of hweight* in message
  - Change type of BITOP_MASK expression from unsigned long to unsigned
    int
  - Fix remaining underscore-prefixed macro params/vars
  - Fix line wrapping in test_and_clear_bit{,s}
  - Change type of test_and_clear_bits' pointer parameter from void *
    to unsigned int *. This was already done for other functions but
    missed here.
  - De-macroize test_and_set_bits.
  - Fix formatting of ffs{,l} macro's unary operators
  - Drop extra blank in ffz() macro definition

v3:
  - Fix style of inline asm blocks.
  - Fix underscore-prefixed macro parameters/variables
  - Use __builtin_popcount for hweight* implementation
  - Update C functions to use proper Xen coding style

v2:
  - Clarify changes from Linux implementation in commit message
  - Use PPC_ATOMIC_{ENTRY,EXIT}_BARRIER macros from <asm/memory.h> instead
    of hardcoded "sync" instructions in inline assembly blocks.
  - Fix macro line-continuing backslash spacing
  - Fix hard-tab usage in find_*_bit C functions.

 xen/arch/ppc/include/asm/bitops.h | 332 +++++++++++++++++++++++++++++-
 1 file changed, 329 insertions(+), 3 deletions(-)

diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 548e97b414..82a097e401 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -1,9 +1,335 @@
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
+#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
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
+#define DEFINE_BITOP(fn, op)                                                   \
+static inline void fn(unsigned int mask,                                       \
+                      volatile unsigned int *p_)                               \
+{                                                                              \
+    unsigned int old;                                                          \
+    unsigned int *p = (unsigned int *)p_;                                      \
+    asm volatile ( "1: lwarx %0,0,%3,0\n"                                      \
+                   #op "%I2 %0,%0,%2\n"                                        \
+                   "stwcx. %0,0,%3\n"                                          \
+                   "bne- 1b\n"                                                 \
+                   : "=&r" (old), "+m" (*p)                                    \
+                   : "rK" (mask), "r" (p)                                      \
+                   : "cc", "memory" );                                         \
+}
+
+DEFINE_BITOP(set_bits, or)
+DEFINE_BITOP(change_bits, xor)
+
+#define DEFINE_CLROP(fn)                                                       \
+static inline void fn(unsigned int mask, volatile unsigned int *p_)            \
+{                                                                              \
+    unsigned int old;                                                          \
+    unsigned int *p = (unsigned int *)p_;                                      \
+    asm volatile ( "1: lwarx %0,0,%3,0\n"                                      \
+                   "andc %0,%0,%2\n"                                           \
+                   "stwcx. %0,0,%3\n"                                          \
+                   "bne- 1b\n"                                                 \
+                   : "=&r" (old), "+m" (*p)                                    \
+                   : "r" (mask), "r" (p)                                       \
+                   : "cc", "memory" );                                         \
+}
+
+DEFINE_CLROP(clear_bits)
+
+static inline void set_bit(int nr, volatile void *addr)
+{
+    set_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
+}
+static inline void clear_bit(int nr, volatile void *addr)
+{
+    clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
+}
+
+/**
+ * test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static inline int test_bit(int nr, const volatile void *addr)
+{
+    const volatile unsigned int *p = addr;
+    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
+}
+
+static inline unsigned int test_and_clear_bits(
+    unsigned int mask,
+    volatile unsigned int *p)
+{
+    unsigned int old, t;
+
+    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
+                   "1: lwarx %0,0,%3,0\n"
+                   "andc %1,%0,%2\n"
+                   "stwcx. %1,0,%3\n"
+                   "bne- 1b\n"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=&r" (old), "=&r" (t)
+                   : "r" (mask), "r" (p)
+                   : "cc", "memory" );
+
+    return (old & mask);
+}
+
+static inline int test_and_clear_bit(unsigned int nr,
+                                     volatile void *addr)
+{
+    return test_and_clear_bits(
+        BITOP_MASK(nr),
+        (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
+}
+
+static inline unsigned int test_and_set_bits(
+    unsigned int mask,
+    volatile unsigned int *p)
+{
+    unsigned int old, t;
+
+    asm volatile ( PPC_ATOMIC_ENTRY_BARRIER
+                   "1: lwarx %0,0,%3,0\n"
+                   "or%I2 %1,%0,%2\n"
+                   "stwcx. %1,0,%3\n"
+                   "bne- 1b\n"
+                   PPC_ATOMIC_EXIT_BARRIER
+                   : "=&r" (old), "=&r" (t)
+                   : "rK" (mask), "r" (p)
+                   : "cc", "memory" );
+
+    return (old & mask);
+}
+
+static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
+{
+    return test_and_set_bits(
+        BITOP_MASK(nr),
+        (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
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
+    unsigned int mask = BITOP_MASK(nr);
+    volatile unsigned int *p = ((volatile unsigned int *)addr) + BITOP_WORD(nr);
+    unsigned int old = *p;
+
+    *p = old | mask;
+    return (old & mask) != 0;
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
+    unsigned int mask = BITOP_MASK(nr);
+    volatile unsigned int *p = ((volatile unsigned int *)addr) + BITOP_WORD(nr);
+    unsigned int old = *p;
+
+    *p = old & ~mask;
+    return (old & mask) != 0;
+}
+
+#define flsl(x) generic_flsl(x)
+#define fls(x) generic_fls(x)
+#define ffs(x) ({ unsigned int t_ = (x); fls(t_ & -t_); })
+#define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & -t_); })
+
+/* Based on linux/include/asm-generic/bitops/ffz.h */
+/*
+ * ffz - find first zero in word.
+ * @word: The word to search
+ *
+ * Undefined if no zero exists, so code should check against ~0UL first.
+ */
+#define ffz(x) __ffs(~(x))
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
+    const unsigned long *p = addr;
+    unsigned long result = 0;
+    unsigned long tmp;
+
+    while ( size & ~(BITS_PER_LONG - 1) )
+    {
+        if ( (tmp = *(p++)) )
+            goto found;
+        result += BITS_PER_LONG;
+        size -= BITS_PER_LONG;
+    }
+    if ( !size )
+        return result;
+
+    tmp = (*p) & (~0UL >> (BITS_PER_LONG - size));
+    if ( tmp == 0UL )         /* Are any bits set? */
+        return result + size; /* Nope. */
+ found:
+    return result + __ffs(tmp);
+}
+
+static inline unsigned long find_next_bit(const unsigned long *addr,
+                                          unsigned long size,
+                                          unsigned long offset)
+{
+    const unsigned long *p = addr + BITOP_WORD(offset);
+    unsigned long result = offset & ~(BITS_PER_LONG - 1);
+    unsigned long tmp;
+
+    if ( offset >= size )
+        return size;
+    size -= result;
+    offset %= BITS_PER_LONG;
+    if ( offset )
+    {
+        tmp = *(p++);
+        tmp &= (~0UL << offset);
+        if ( size < BITS_PER_LONG )
+            goto found_first;
+        if ( tmp )
+            goto found_middle;
+        size -= BITS_PER_LONG;
+        result += BITS_PER_LONG;
+    }
+    while ( size & ~(BITS_PER_LONG - 1) )
+    {
+        if ( (tmp = *(p++)) )
+            goto found_middle;
+        result += BITS_PER_LONG;
+        size -= BITS_PER_LONG;
+    }
+    if ( !size )
+        return result;
+    tmp = *p;
+
+ found_first:
+    tmp &= (~0UL >> (BITS_PER_LONG - size));
+    if ( tmp == 0UL )         /* Are any bits set? */
+        return result + size; /* Nope. */
+ found_middle:
+    return result + __ffs(tmp);
+}
+
+/*
+ * This implementation of find_{first,next}_zero_bit was stolen from
+ * Linus' asm-alpha/bitops.h.
+ */
+static inline unsigned long find_next_zero_bit(const unsigned long *addr,
+                                               unsigned long size,
+                                               unsigned long offset)
+{
+    const unsigned long *p = addr + BITOP_WORD(offset);
+    unsigned long result = offset & ~(BITS_PER_LONG - 1);
+    unsigned long tmp;
+
+    if ( offset >= size )
+        return size;
+    size -= result;
+    offset %= BITS_PER_LONG;
+    if ( offset )
+    {
+        tmp = *(p++);
+        tmp |= ~0UL >> (BITS_PER_LONG - offset);
+        if ( size < BITS_PER_LONG )
+            goto found_first;
+        if ( ~tmp )
+            goto found_middle;
+        size -= BITS_PER_LONG;
+        result += BITS_PER_LONG;
+    }
+    while ( size & ~(BITS_PER_LONG - 1) )
+    {
+        if ( ~(tmp = *(p++)) )
+            goto found_middle;
+        result += BITS_PER_LONG;
+        size -= BITS_PER_LONG;
+    }
+    if ( !size )
+        return result;
+    tmp = *p;
+
+ found_first:
+    tmp |= ~0UL << size;
+    if ( tmp == ~0UL )        /* Are any bits zero? */
+        return result + size; /* Nope. */
+ found_middle:
+    return result + ffz(tmp);
+}

 #endif /* _ASM_PPC_BITOPS_H */
--
2.30.2


