Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6652D8CE4BA
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729357.1134509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnJ-0003iU-B3; Fri, 24 May 2024 11:09:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729357.1134509; Fri, 24 May 2024 11:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnJ-0003gq-7s; Fri, 24 May 2024 11:09:05 +0000
Received: by outflank-mailman (input) for mailman id 729357;
 Fri, 24 May 2024 11:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqrK=M3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sASnH-0003Cz-8A
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:09:03 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 060dc183-19be-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 13:09:00 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a62769075adso51716266b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:09:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817c81sm116051366b.28.2024.05.24.04.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 04:08:59 -0700 (PDT)
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
X-Inumbo-ID: 060dc183-19be-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716548940; x=1717153740; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VAAhE05amsEXGMuoLHu119Hm7q5hqdBYgzStrwEHgM=;
        b=LkIuXS6VBuwouDn3Z+NJ8C2lM4gnQtJpQmcDf5tEr+N8bKfn3yILOH2cueNm0n3aXU
         En6ZIhTeoOYP7xi3KB0v2/v0Pape3R7J+5WrN+vFjeLsMd9ECF8uOge5xHgjIYq2O8fo
         kFNHdN6liySXBTlU3dBud7oVC3vwZwoHZbVflR7+KKCREQZlPSeAUmUUDxEnunXC8ni5
         BnHB3yoKg96zg4iWWqOy0DEv29gF5aH0e2ZYfQRRGu2B+0PrLF4qU81tDBEaHsZRq4Jt
         ufvCaXRa0gzpUEac01riNtASPxAclfus/UN/D0jaPvM05n3SmZCKpwLQ0eKQZtSVxzB2
         At7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548940; x=1717153740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VAAhE05amsEXGMuoLHu119Hm7q5hqdBYgzStrwEHgM=;
        b=qDu2/aRMkxnXSS+M/T1/FpQgvbQM0vss0Csquu3X49csH3fJNxziuX7BYQ/o3dVNUn
         Ulq+UCjKi1dnBYGvr/oC44Z3deJq0+5tUd8uPZPmpTFM3H9lzvtn/Ie4Qq8DSnSaimSk
         I22EsoMGEhNVrqCG1Fpus48vXaaqN7YNo3Pxc9G3tO6+EbbRvV0n4hnhDvue46yZTJMZ
         5LbhAOrdPz6L+2tuzk5Pe5JgV/u4uELzVmW/+2oIJjdRUn7nXvJB/ZeoxyrnlRce+krP
         drW/o5imnWdpQ/53dPdi3AR7awPu6lwZ4v9kukcB6NQmlvm4TB3/DNuca6PGyJAIYcx5
         WVzA==
X-Gm-Message-State: AOJu0YzGChUoevLEX/6dVSF9Xzg+vT/8JwYj0KLtrvIJUA5yMnddscQ6
	A8xIn7GAV9Ia1wFotG3IGWkZMrWSStW/MsN4SwvCVogmdox9VmQLMytFhYz8
X-Google-Smtp-Source: AGHT+IH8Xhcb1dv8lZUHDI5J6yAYaAcBV72erzycFafIGTAk/CxjjZTaBtujwXSoOE/FwfWwC9cqVA==
X-Received: by 2002:a17:907:3f29:b0:a5a:6122:d64b with SMTP id a640c23a62f3a-a62641a33e7mr165738766b.5.1716548939777;
        Fri, 24 May 2024 04:08:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v11 2/9] xen: introduce generic non-atomic test_*bit()
Date: Fri, 24 May 2024 13:08:48 +0200
Message-ID: <79c3c31f0032a79c25d0a458b6091904457c8939.1716547693.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1716547693.git.oleksii.kurochko@gmail.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following generic functions were introduced:
* test_bit
* generic__test_and_set_bit
* generic__test_and_clear_bit
* generic__test_and_change_bit

These functions and macros can be useful for architectures
that don't have corresponding arch-specific instructions.

Also, the patch introduces the following generics which are
used by the functions mentioned above:
* BITOP_BITS_PER_WORD
* BITOP_MASK
* BITOP_WORD
* BITOP_TYPE

BITS_PER_BYTE was moved to xen/bitops.h as BITS_PER_BYTE is the same
across architectures.

The following approach was chosen for generic*() and arch*() bit
operation functions:
If the bit operation function that is going to be generic starts
with the prefix "__", then the corresponding generic/arch function
will also contain the "__" prefix. For example:
 * test_bit() will be defined using arch_test_bit() and
   generic_test_bit().
 * __test_and_set_bit() will be defined using
   arch__test_and_set_bit() and generic__test_and_set_bit().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Reviewed-by: Jan Beulich jbeulich@suse.com? Jan gave his R-by for the previous
 version of the patch, but some changes were done, so I wasn't sure if I could
 use the R-by in this patch version.


 The current patch can be merged without waiting for Andrew's patch series as
 it was rebased on top of staging.
---
Changes in V11:
 - fix identation in generic_test_bit() function.
 - move definition of BITS_PER_BYTE from <arch>/bitops.h to xen/bitops.h
 - drop the changes in arm64/livepatch.c.
 - update the the comments on top of functions: generic__test_and_set_bit(),
   generic__test_and_clear_bit(),  generic__test_and_change_bit(),
   generic_test_bit().
 - Update footer after Signed-off section.
 - Rebase the patch on top of staging branch, so it can be merged when necessary
   approves will be given.
 - Update the commit message.
---
Changes in V10:
 - update the commit message. ( re-order paragraphs and add explanation usage of prefix "__" in bit
   operation function names )
 - add  parentheses around the whole expression of bitop_bad_size() macros.
 - move macros bitop_bad_size() above asm/bitops.h as it is not arch-specific anymore and there is
   no need for overriding it.
 - drop macros check_bitop_size() and use "if ( bitop_bad_size(addr) ) __bitop_bad_size();" implictly
   where it is needed.
 - in <xen/bitops.h> use 'int' as a first parameter for __test_and_*(), generic__test_and_*() to be
   consistent with how the mentioned functions were declared in the original per-arch functions.
 - add 'const' to p variable in generic_test_bit().
 - move definition of BITOP_BITS_PER_WORD and bitop_uint_t to xen/bitops.h as we don't allow for arch
   overrides these definitions anymore.
---
Changes in V9:
  - move up xen/bitops.h in ppc/asm/page.h.
  - update defintion of arch_check_bitop_size.
    And drop correspondent macros from x86/asm/bitops.h
  - drop parentheses in generic__test_and_set_bit() for definition of
    local variable p.
  - fix indentation inside #ifndef BITOP_TYPE...#endif
  - update the commit message.
---
 Changes in V8:
  - drop __pure for function which uses volatile.
  - drop unnessary () in generic__test_and_change_bit() for addr casting.
  - update prototype of generic_test_bit() and test_bit(): now it returns bool
    instead of int.
  - update generic_test_bit() to use BITOP_MASK().
  - Deal with fls{l} changes: it should be in the patch with introduced generic fls{l}.
  - add a footer with explanation of dependency on an uncommitted patch after Signed-off.
  - abstract bitop_size().
  - move BITOP_TYPE define to <xen/types.h>.
---
 Changes in V7:
  - move everything to xen/bitops.h to follow the same approach for all generic
    bit ops.
  - put together BITOP_BITS_PER_WORD and bitops_uint_t.
  - make BITOP_MASK more generic.
  - drop #ifdef ... #endif around BITOP_MASK, BITOP_WORD as they are generic
    enough.
  - drop "_" for generic__{test_and_set_bit,...}().
  - drop " != 0" for functions which return bool.
  - add volatile during the cast for generic__{...}().
  - update the commit message.
  - update arch related code to follow the proposed generic approach.
---
 Changes in V6:
  - Nothing changed ( only rebase )
---
 Changes in V5:
   - new patch
---
 xen/arch/arm/include/asm/bitops.h |  69 -----------
 xen/arch/ppc/include/asm/bitops.h |  54 ---------
 xen/arch/ppc/include/asm/page.h   |   2 +-
 xen/arch/ppc/mm-radix.c           |   2 +-
 xen/arch/x86/include/asm/bitops.h |  31 ++---
 xen/include/xen/bitops.h          | 185 ++++++++++++++++++++++++++++++
 6 files changed, 196 insertions(+), 147 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index ab030b6cb0..af38fbffdd 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -22,11 +22,6 @@
 #define __set_bit(n,p)            set_bit(n,p)
 #define __clear_bit(n,p)          clear_bit(n,p)
 
-#define BITOP_BITS_PER_WORD     32
-#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
-#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
-#define BITS_PER_BYTE           8
-
 #define ADDR (*(volatile int *) addr)
 #define CONST_ADDR (*(const volatile int *) addr)
 
@@ -76,70 +71,6 @@ bool test_and_change_bit_timeout(int nr, volatile void *p,
 bool clear_mask16_timeout(uint16_t mask, volatile void *p,
                           unsigned int max_try);
 
-/**
- * __test_and_set_bit - Set a bit and return its old value
- * @nr: Bit to set
- * @addr: Address to count from
- *
- * This operation is non-atomic and can be reordered.
- * If two examples of this operation race, one can appear to succeed
- * but actually fail.  You must protect multiple accesses with a lock.
- */
-static inline int __test_and_set_bit(int nr, volatile void *addr)
-{
-        unsigned int mask = BITOP_MASK(nr);
-        volatile unsigned int *p =
-                ((volatile unsigned int *)addr) + BITOP_WORD(nr);
-        unsigned int old = *p;
-
-        *p = old | mask;
-        return (old & mask) != 0;
-}
-
-/**
- * __test_and_clear_bit - Clear a bit and return its old value
- * @nr: Bit to clear
- * @addr: Address to count from
- *
- * This operation is non-atomic and can be reordered.
- * If two examples of this operation race, one can appear to succeed
- * but actually fail.  You must protect multiple accesses with a lock.
- */
-static inline int __test_and_clear_bit(int nr, volatile void *addr)
-{
-        unsigned int mask = BITOP_MASK(nr);
-        volatile unsigned int *p =
-                ((volatile unsigned int *)addr) + BITOP_WORD(nr);
-        unsigned int old = *p;
-
-        *p = old & ~mask;
-        return (old & mask) != 0;
-}
-
-/* WARNING: non atomic and it can be reordered! */
-static inline int __test_and_change_bit(int nr,
-                                            volatile void *addr)
-{
-        unsigned int mask = BITOP_MASK(nr);
-        volatile unsigned int *p =
-                ((volatile unsigned int *)addr) + BITOP_WORD(nr);
-        unsigned int old = *p;
-
-        *p = old ^ mask;
-        return (old & mask) != 0;
-}
-
-/**
- * test_bit - Determine whether a bit is set
- * @nr: bit number to test
- * @addr: Address to start counting from
- */
-static inline int test_bit(int nr, const volatile void *addr)
-{
-        const volatile unsigned int *p = (const volatile unsigned int *)addr;
-        return 1UL & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD-1)));
-}
-
 /*
  * On ARMv5 and above those functions can be implemented around
  * the clz instruction for much better code efficiency.
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index bea655796d..71bbb5f16a 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -15,11 +15,6 @@
 #define __set_bit(n, p)         set_bit(n, p)
 #define __clear_bit(n, p)       clear_bit(n, p)
 
-#define BITOP_BITS_PER_WORD     32
-#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
-#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
-#define BITS_PER_BYTE           8
-
 /* PPC bit number conversion */
 #define PPC_BITLSHIFT(be)    (BITS_PER_LONG - 1 - (be))
 #define PPC_BIT(bit)         (1UL << PPC_BITLSHIFT(bit))
@@ -69,17 +64,6 @@ static inline void clear_bit(int nr, volatile void *addr)
     clear_bits(BITOP_MASK(nr), (volatile unsigned int *)addr + BITOP_WORD(nr));
 }
 
-/**
- * test_bit - Determine whether a bit is set
- * @nr: bit number to test
- * @addr: Address to start counting from
- */
-static inline int test_bit(int nr, const volatile void *addr)
-{
-    const volatile unsigned int *p = addr;
-    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
-}
-
 static inline unsigned int test_and_clear_bits(
     unsigned int mask,
     volatile unsigned int *p)
@@ -133,44 +117,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
         (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
 }
 
-/**
- * __test_and_set_bit - Set a bit and return its old value
- * @nr: Bit to set
- * @addr: Address to count from
- *
- * This operation is non-atomic and can be reordered.
- * If two examples of this operation race, one can appear to succeed
- * but actually fail.  You must protect multiple accesses with a lock.
- */
-static inline int __test_and_set_bit(int nr, volatile void *addr)
-{
-    unsigned int mask = BITOP_MASK(nr);
-    volatile unsigned int *p = (volatile unsigned int *)addr + BITOP_WORD(nr);
-    unsigned int old = *p;
-
-    *p = old | mask;
-    return (old & mask) != 0;
-}
-
-/**
- * __test_and_clear_bit - Clear a bit and return its old value
- * @nr: Bit to clear
- * @addr: Address to count from
- *
- * This operation is non-atomic and can be reordered.
- * If two examples of this operation race, one can appear to succeed
- * but actually fail.  You must protect multiple accesses with a lock.
- */
-static inline int __test_and_clear_bit(int nr, volatile void *addr)
-{
-    unsigned int mask = BITOP_MASK(nr);
-    volatile unsigned int *p = (volatile unsigned int *)addr + BITOP_WORD(nr);
-    unsigned int old = *p;
-
-    *p = old & ~mask;
-    return (old & mask) != 0;
-}
-
 #define flsl(x) generic_flsl(x)
 #define fls(x) generic_fls(x)
 #define ffs(x) ({ unsigned int t_ = (x); fls(t_ & -t_); })
diff --git a/xen/arch/ppc/include/asm/page.h b/xen/arch/ppc/include/asm/page.h
index 890e285051..6d4cd2611c 100644
--- a/xen/arch/ppc/include/asm/page.h
+++ b/xen/arch/ppc/include/asm/page.h
@@ -2,9 +2,9 @@
 #ifndef _ASM_PPC_PAGE_H
 #define _ASM_PPC_PAGE_H
 
+#include <xen/bitops.h>
 #include <xen/types.h>
 
-#include <asm/bitops.h>
 #include <asm/byteorder.h>
 
 #define PDE_VALID     PPC_BIT(0)
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index ab5a10695c..9055730997 100644
--- a/xen/arch/ppc/mm-radix.c
+++ b/xen/arch/ppc/mm-radix.c
@@ -1,11 +1,11 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/bitops.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
 #include <xen/mm.h>
 #include <xen/types.h>
 #include <xen/lib.h>
 
-#include <asm/bitops.h>
 #include <asm/byteorder.h>
 #include <asm/early_printk.h>
 #include <asm/page.h>
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 5a71afbc89..c4e7a06155 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -19,9 +19,6 @@
 #define ADDR (*(volatile int *) addr)
 #define CONST_ADDR (*(const volatile int *) addr)
 
-extern void __bitop_bad_size(void);
-#define bitop_bad_size(addr) (sizeof(*(addr)) < 4)
-
 /**
  * set_bit - Atomically set a bit in memory
  * @nr: the bit to set
@@ -175,7 +172,7 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
 })
 
 /**
- * __test_and_set_bit - Set a bit and return its old value
+ * arch__test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -183,7 +180,7 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_set_bit(int nr, void *addr)
+static inline int arch__test_and_set_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
@@ -194,10 +191,7 @@ static inline int __test_and_set_bit(int nr, void *addr)
 
     return oldbit;
 }
-#define __test_and_set_bit(nr, addr) ({                 \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    __test_and_set_bit(nr, addr);                       \
-})
+#define arch__test_and_set_bit arch__test_and_set_bit
 
 /**
  * test_and_clear_bit - Clear a bit and return its old value
@@ -224,7 +218,7 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
 })
 
 /**
- * __test_and_clear_bit - Clear a bit and return its old value
+ * arch__test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -232,7 +226,7 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_clear_bit(int nr, void *addr)
+static inline int arch__test_and_clear_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
@@ -243,13 +237,10 @@ static inline int __test_and_clear_bit(int nr, void *addr)
 
     return oldbit;
 }
-#define __test_and_clear_bit(nr, addr) ({               \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    __test_and_clear_bit(nr, addr);                     \
-})
+#define arch__test_and_clear_bit arch__test_and_clear_bit
 
 /* WARNING: non atomic and it can be reordered! */
-static inline int __test_and_change_bit(int nr, void *addr)
+static inline int arch__test_and_change_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
@@ -260,10 +251,7 @@ static inline int __test_and_change_bit(int nr, void *addr)
 
     return oldbit;
 }
-#define __test_and_change_bit(nr, addr) ({              \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    __test_and_change_bit(nr, addr);                    \
-})
+#define arch__test_and_change_bit arch__test_and_change_bit
 
 /**
  * test_and_change_bit - Change a bit and return its new value
@@ -307,8 +295,7 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
     return oldbit;
 }
 
-#define test_bit(nr, addr) ({                           \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
+#define arch_test_bit(nr, addr) ({                      \
     __builtin_constant_p(nr) ?                          \
         constant_test_bit(nr, addr) :                   \
         variable_test_bit(nr, addr);                    \
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index e3c5a4ccf3..9f89232ba6 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -103,8 +103,193 @@ static inline int generic_flsl(unsigned long x)
  * Include this here because some architectures need generic_ffs/fls in
  * scope
  */
+
+#define BITOP_BITS_PER_WORD 32
+typedef uint32_t bitop_uint_t;
+
+#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
+
+#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
+
+#define BITS_PER_BYTE 8
+
+extern void __bitop_bad_size(void);
+
+#define bitop_bad_size(addr) (sizeof(*(addr)) < sizeof(bitop_uint_t))
+
+/* --------------------- Please tidy above here --------------------- */
+
 #include <asm/bitops.h>
 
+/**
+ * generic__test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool
+generic__test_and_set_bit(int nr, volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
+    bitop_uint_t old = *p;
+
+    *p = old | mask;
+    return (old & mask);
+}
+
+/**
+ * generic__test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool
+generic__test_and_clear_bit(int nr, volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
+    bitop_uint_t old = *p;
+
+    *p = old & ~mask;
+    return (old & mask);
+}
+
+/**
+ * generic__test_and_change_bit - Change a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool
+generic__test_and_change_bit(int nr, volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
+    bitop_uint_t old = *p;
+
+    *p = old ^ mask;
+    return (old & mask);
+}
+
+/**
+ * generic_test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool generic_test_bit(int nr, const volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    const volatile bitop_uint_t *p =
+        (const volatile bitop_uint_t *)addr + BITOP_WORD(nr);
+
+    return (*p & mask);
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
+static always_inline bool
+__test_and_set_bit(int nr, volatile void *addr)
+{
+#ifndef arch__test_and_set_bit
+#define arch__test_and_set_bit generic__test_and_set_bit
+#endif
+
+    return arch__test_and_set_bit(nr, addr);
+}
+#define __test_and_set_bit(nr, addr) ({             \
+    if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
+    __test_and_set_bit(nr, addr);                   \
+})
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
+static always_inline bool
+__test_and_clear_bit(int nr, volatile void *addr)
+{
+#ifndef arch__test_and_clear_bit
+#define arch__test_and_clear_bit generic__test_and_clear_bit
+#endif
+
+    return arch__test_and_clear_bit(nr, addr);
+}
+#define __test_and_clear_bit(nr, addr) ({           \
+    if ( bitop_bad_size(addr) ) __bitop_bad_size(); \
+    __test_and_clear_bit(nr, addr);                 \
+})
+
+/**
+ * __test_and_change_bit - Change a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool
+__test_and_change_bit(int nr, volatile void *addr)
+{
+#ifndef arch__test_and_change_bit
+#define arch__test_and_change_bit generic__test_and_change_bit
+#endif
+
+    return arch__test_and_change_bit(nr, addr);
+}
+#define __test_and_change_bit(nr, addr) ({              \
+    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
+    __test_and_change_bit(nr, addr);                    \
+})
+
+/**
+ * test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool test_bit(int nr, const volatile void *addr)
+{
+#ifndef arch_test_bit
+#define arch_test_bit generic_test_bit
+#endif
+
+    return arch_test_bit(nr, addr);
+}
+#define test_bit(nr, addr) ({                           \
+    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
+    test_bit(nr, addr);                                 \
+})
+
 #ifndef find_next_bit
 /**
  * find_next_bit - find the next set bit in a memory region
-- 
2.45.0


