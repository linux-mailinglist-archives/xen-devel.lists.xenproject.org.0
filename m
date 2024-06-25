Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BB291696F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 15:52:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747732.1155210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6aY-0006vC-8r; Tue, 25 Jun 2024 13:52:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747732.1155210; Tue, 25 Jun 2024 13:52:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sM6aY-0006rt-4n; Tue, 25 Jun 2024 13:52:02 +0000
Received: by outflank-mailman (input) for mailman id 747732;
 Tue, 25 Jun 2024 13:52:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sI+y=N3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sM6aW-0006cc-Bl
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 13:52:00 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17a116d1-32fa-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 15:51:59 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a6fe81a5838so329936866b.3
 for <xen-devel@lists.xenproject.org>; Tue, 25 Jun 2024 06:51:59 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6fcf560627sm521042666b.148.2024.06.25.06.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 06:51:57 -0700 (PDT)
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
X-Inumbo-ID: 17a116d1-32fa-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719323518; x=1719928318; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AB0T3A1FkGRSgKa91wKeyYgsXSaWrOLREYcY7rl0FlM=;
        b=c97Tkp/enEWed50770h22bVUju9rFvGYH/xnwuz4AOlLEOpwsBorrB66+rtSQ3aenR
         jeIDAmxXRfwV4t0lsvbz+TJ6qXAPvLnI9a34hCDKdwZEPkAHmYVWv8/GQwHfEq2KLfdf
         1Au7oLg7FhxEmLIdC933zBCN3SMCtI1pl80dzhIlfkunZa5xrealFAjv4QyG/HI9pM5R
         pqXN2p1oR2xSioFFI4fI/UViQblmETVeyNNyqOaWaXp+Hlfm/cILV8D/4BNxj8SvpuFp
         NgLCag+9QGBg9A367Y40EsyOqla+NNpcsxnSHOyL7uv24jegji7YrtjDSKqx4Tm3v5hV
         UWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719323518; x=1719928318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AB0T3A1FkGRSgKa91wKeyYgsXSaWrOLREYcY7rl0FlM=;
        b=ZDoUaFpL1QKKcrOCNJNAEU4KBgaAKJJCNvt7v0eg0S9ReM6WTm+s0KUafn7EaNYgv+
         UUIHVLtXvvn0J5Vpf4M3avNv1vixW5RM5m8RShaem0zhggQTzANB7uEsoZBfmeUq5GrD
         OYQDkm/rECVtxmHpku1PKW2jk0+KPeHd8P+dOkDSDeluDfrM43vcqEcZN5GzPxIsq+4v
         4VfPyv1uxg7TX8gNuTkDqZVhwU/d3HHUPi4FhqA6ScYbI/VV8MM5Q4JZdEQAHUm0+tba
         futMCXuDlR+VV9BF8DxhLifmk0jC9wBICMzSpCAFcRAJ/FUdPUPJn9SmgFgGob6lJY62
         9/yQ==
X-Gm-Message-State: AOJu0YwAox8ft527LVziNsF7xGzHmdsJdTOi04pLs54/d6jRAEEVn9Sl
	7mYvuF8rWFi7e9AmUKufKpS/L05OW366Q+mr2phHF2pJdm9fvejycfZtJnxA
X-Google-Smtp-Source: AGHT+IEk++ZDxUS7RQ6d3SVnOntMsEWaCgNsj52pGBUV9+AK2No0h2dX8WJzid5KrTajUTQkROy4xw==
X-Received: by 2002:a17:907:cbc9:b0:a72:6849:cb0b with SMTP id a640c23a62f3a-a727f680739mr42308866b.17.1719323518020;
        Tue, 25 Jun 2024 06:51:58 -0700 (PDT)
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
Subject: [PATCH v13 01/10] xen: introduce generic non-atomic test_*bit()
Date: Tue, 25 Jun 2024 15:51:43 +0200
Message-ID: <b3052978b1ba36b37e9b844f1b70b0912f608ea0.1719319093.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719319093.git.oleksii.kurochko@gmail.com>
References: <cover.1719319093.git.oleksii.kurochko@gmail.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V13:
 - add Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V12:
 - revert change of moving the definition of BITS_PER_BYTE from <arch>/bitops.h to xen/bitops.h.
   ( a separate patch will be provided to put BITS_PER_BYTE to proper place )
 - drop comments on top of generic_*() functions and update the comments above __test_*() and test_bit().
 - update how static inline __test_*() are defined ( drop pointless fallback #define ) and test_bit().
 - drop the footer after Signed-off-by.
Changes in V11:
 - fix identation in generic_test_bit() function.
 - move definition of BITS_PER_BYTE from <arch>/bitops.h to xen/bitops.h
 - drop the changes in arm64/livepatch.c.
 - update the the comments on top of functions: generic__test_and_set_bit(), generic__test_and_clear_bit(),  generic__test_and_change_bit(),
   generic_test_bit().
 - Update footer after Signed-off section.
 - Rebase the patch on top of staging branch, so it can be merged when necessary approves will be given.
 - add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
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
 xen/include/xen/bitops.h          | 182 ++++++++++++++++++++++++++++++
 6 files changed, 193 insertions(+), 147 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 8f4bdc09d1..db23d7edc3 100644
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
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
 #define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 8119b5ace8..ee0e58e2e8 100644
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
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
 #define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
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
index aa71542e7b..f9aa60111f 100644
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
index 6a5e28730a..cc09d273c9 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -4,6 +4,19 @@
 #include <xen/compiler.h>
 #include <xen/types.h>
 
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
 #include <asm/bitops.h>
 
 /*
@@ -24,6 +37,175 @@
 unsigned int __pure generic_ffsl(unsigned long x);
 unsigned int __pure generic_flsl(unsigned long x);
 
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
 static always_inline __pure unsigned int ffs(unsigned int x)
 {
     if ( __builtin_constant_p(x) )
-- 
2.45.2


