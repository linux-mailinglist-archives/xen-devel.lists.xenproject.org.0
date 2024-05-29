Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D9E28D3F27
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 21:55:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732321.1138272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOJ-0003sW-7T; Wed, 29 May 2024 19:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732321.1138272; Wed, 29 May 2024 19:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOJ-0003qv-22; Wed, 29 May 2024 19:55:19 +0000
Received: by outflank-mailman (input) for mailman id 732321;
 Wed, 29 May 2024 19:55:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCPOH-0003Nf-1G
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 19:55:17 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5e3be7a4-1df5-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 21:55:15 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52b7b829bc7so171602e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 12:55:15 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066b249sm1344203e87.178.2024.05.29.12.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 12:55:14 -0700 (PDT)
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
X-Inumbo-ID: 5e3be7a4-1df5-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717012515; x=1717617315; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVBXN5m3ZDHo1lfuHzyltxfOnJFU0pSyHgrlkIAnckU=;
        b=VkJ8aBeqhPAZRb9xwykDdEuUB4rbf6kjOkRcirCWCsp4BZ3ghATBXhqvnH90nca+g5
         DifOsL/aYoIeD6+NV1sANXb/Fj73BWJSe49uYJCAMzEMzuPhUZ48opNbQn1CA+X599iL
         5qbgl06f8/Rj6TJICFvgb7QLZBhjaUf7ca9sdxjaFU6T3okhdfVv3JPEphJRVzD1Bmnc
         EVVioO+rkbVoQwagIgrNMFJPC4KcS3+EbeN9XhDVTX6gl7VxvkDm1UwsI4Swm9DOLDcn
         +uLZRLtedlCSWBTqSAIwp8jeN/XwrunPwIHj5gqq++zQmhUDWKE7Vu+v1bN+3j7P9HO8
         3E5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012515; x=1717617315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVBXN5m3ZDHo1lfuHzyltxfOnJFU0pSyHgrlkIAnckU=;
        b=AJKtaYlN7J0Gxsil+NxQ3zA01V+mv5FQHhKRLdmM70Imo7J5oPr3CzYfvtOQIVnd0i
         lWY+MEZgMQLeAArLTaoOgCyT3QtqKWZ4zTyCVCYejg7VEpBIZCR8qFWbrfyeD28pQDxy
         kQAgamQCCkntdW1LtGybbPBkYGompWfTAfw0aeTAta+MG4lAkw4kb8kWQri6OglCmSLh
         UdrEF6bCCK+IhMDjBzxazD784VF5kcTbOU0Crj1CcNbT3omjpACU8O8Z9xkwb4ovH78n
         8NiMFPEdUAHNGdO4t+jHj1FGkPRmDwyEADPzKWfBu/hct+OQRY0vlFbPDXugvfOG0+h3
         Qi3Q==
X-Gm-Message-State: AOJu0YxStiB55mIq0s7IyCIe/X2I7HutEBybS+fXZuMvEa215zUtt8eo
	3O7b4J8e+K9ttBitWcbJldiTLTUuMIubMCX+kqAzHYKYL6T64Po7v2sXq1qB
X-Google-Smtp-Source: AGHT+IGxVp6idhC7Wfi+drTwdCPMybv1eYUhKHQinDOkohJRTyyuhIhTpio2EZiatCVKYOV4qkkf7w==
X-Received: by 2002:ac2:4839:0:b0:529:b3c9:7261 with SMTP id 2adb3069b0e04-52b7d40f4c4mr106781e87.5.1717012514495;
        Wed, 29 May 2024 12:55:14 -0700 (PDT)
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
Subject: [PATCH v12 2/8] xen: introduce generic non-atomic test_*bit()
Date: Wed, 29 May 2024 21:55:03 +0200
Message-ID: <526d2a5a76f03aa0e3cc7ee3192b1c87834f0e9e.1717008161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1717008161.git.oleksii.kurochko@gmail.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
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
---
Changes in V12:
 - revert change of moving the definition of BITS_PER_BYTE from <arch>/bitops.h to xen/bitops.h.
   ( a separate patch will be provided to put BITS_PER_BYTE to proper place )
 - drop comments on top of generic_*() functions and update the comments above __test_*() and test_bit().
 - update how static inline __test_*() are defined ( drop pointless fallback #define ) and test_bit().
 - drop the footer after Signed-off-by.
---
Changes in V11:
 - fix identation in generic_test_bit() function.
 - move definition of BITS_PER_BYTE from <arch>/bitops.h to xen/bitops.h
 - drop the changes in arm64/livepatch.c.
 - update the the comments on top of functions: generic__test_and_set_bit(), generic__test_and_clear_bit(),  generic__test_and_change_bit(),
   generic_test_bit().
 - Update footer after Signed-off section.
 - Rebase the patch on top of staging branch, so it can be merged when necessary approves will be given.
 - ? add Reviewed-by: Jan Beulich <jbeulich@suse.com>.
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
 xen/arch/arm/include/asm/bitops.h |  67 --------------
 xen/arch/ppc/include/asm/bitops.h |  52 -----------
 xen/arch/ppc/include/asm/page.h   |   2 +-
 xen/arch/ppc/mm-radix.c           |   2 +-
 xen/arch/x86/include/asm/bitops.h |  31 ++-----
 xen/include/xen/bitops.h          | 146 ++++++++++++++++++++++++++++++
 6 files changed, 157 insertions(+), 143 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 8f4bdc09d1..3c023103f7 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -22,9 +22,6 @@
 #define __set_bit(n,p)            set_bit(n,p)
 #define __clear_bit(n,p)          clear_bit(n,p)
 
-#define BITOP_BITS_PER_WORD     32
-#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
-#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
 #define BITS_PER_BYTE           8
 
 #define ADDR (*(volatile int *) addr)
@@ -76,70 +73,6 @@ bool test_and_change_bit_timeout(int nr, volatile void *p,
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
index 8119b5ace8..eb3355812e 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -15,9 +15,6 @@
 #define __set_bit(n, p)         set_bit(n, p)
 #define __clear_bit(n, p)       clear_bit(n, p)
 
-#define BITOP_BITS_PER_WORD     32
-#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
-#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
 #define BITS_PER_BYTE           8
 
 /* PPC bit number conversion */
@@ -69,17 +66,6 @@ static inline void clear_bit(int nr, volatile void *addr)
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
@@ -133,44 +119,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
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
index fc9fe73ad5..8ee5cbf127 100644
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
index 6a5e28730a..be54122556 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -4,6 +4,17 @@
 #include <xen/compiler.h>
 #include <xen/types.h>
 
+#define BITOP_BITS_PER_WORD 32
+typedef uint32_t bitop_uint_t;
+
+#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
+
+#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
+
+extern void __bitop_bad_size(void);
+
+#define bitop_bad_size(addr) (sizeof(*(addr)) < sizeof(bitop_uint_t))
+
 #include <asm/bitops.h>
 
 /*
@@ -94,6 +105,141 @@ static always_inline __pure unsigned int fls64(uint64_t x)
 
 /* --------------------- Please tidy below here --------------------- */
 
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
+ * If two instances of this operation race, both may update memory with
+ * their view of the new value, not taking into account the update the
+ * respectively other one did. It should be protected from potentially
+ * racy behavior.
+ */
+static always_inline bool
+__test_and_set_bit(int nr, volatile void *addr)
+{
+#ifdef arch__test_and_set_bit
+    return arch__test_and_set_bit(nr, addr);
+#else
+    return generic__test_and_set_bit(nr, addr);
+#endif
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
+ * If two instances of this operation race, both may update memory with
+ * their view of the new value, not taking into account the update the
+ * respectively other one did. It should be protected from potentially
+ * racy behavior.
+ */
+static always_inline bool
+__test_and_clear_bit(int nr, volatile void *addr)
+{
+#ifdef arch__test_and_clear_bit
+    return arch__test_and_clear_bit(nr, addr);
+#else
+    return generic__test_and_clear_bit(nr, addr);
+#endif
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
+ * If two instances of this operation race, both may update memory with
+ * their view of the new value, not taking into account the update the
+ * respectively other one did. It should be protected from potentially
+ * racy behavior.
+ */
+static always_inline bool
+__test_and_change_bit(int nr, volatile void *addr)
+{
+#ifdef arch__test_and_change_bit
+    return arch__test_and_change_bit(nr, addr);
+#else
+    return generic__test_and_change_bit(nr, addr);
+#endif
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
+ */
+static always_inline bool test_bit(int nr, const volatile void *addr)
+{
+#ifdef arch_test_bit
+    return arch_test_bit(nr, addr);
+#else
+    return generic_test_bit(nr, addr);
+#endif
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


