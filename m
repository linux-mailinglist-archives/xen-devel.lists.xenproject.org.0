Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB84896BFF
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700396.1093487 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjF-0008ST-R9; Wed, 03 Apr 2024 10:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700396.1093487; Wed, 03 Apr 2024 10:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjF-0008QM-Ny; Wed, 03 Apr 2024 10:20:25 +0000
Received: by outflank-mailman (input) for mailman id 700396;
 Wed, 03 Apr 2024 10:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjD-0007Ob-TZ
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:24 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7072cc0-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:21 +0200 (CEST)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-516c116f480so57899e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:19 -0700 (PDT)
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
X-Inumbo-ID: c7072cc0-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139620; x=1712744420; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L0uPVf1jCR3tqYLa0zqi1s+m6TuFgH7d+8FDa8AQO3c=;
        b=U5m+zDLN5FGoABuL9y/tuKJhuYudQXml+54Ghxu/U3vHrmMpLQccl4wVufGjFHu637
         7wu230yznj4sSCE92P+eLtiaucbZnbN/3C9Du9jvBRHSUWobh83oxnpLQKwTGyMouC3x
         J55UfIGY15AbGSgSEl1H2R8Q6oTRbEaKAUi9pjj+/d0piY+PxoVGJx2rGNoQpGcjDUy2
         vQNclbauECKfFhq3RH2Re3pcRxK6T0qvco0bKc6w1j4Font1h8TAWUsHXLt3MGb4ig57
         1Jxk5zC/LH+6ztcBgRngLxbHlWm8fTrkzaLyvyWLE3mnbYyoj2I+LHxRMpjOnqCR3PIU
         GKoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139620; x=1712744420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L0uPVf1jCR3tqYLa0zqi1s+m6TuFgH7d+8FDa8AQO3c=;
        b=jlVILF/Q/34SfKgapsf7gNDg9jdA1n+Z7N78knZ8pYX2CMQZgWT7zrmgsHIXQDpOB2
         GbE78h6Pti94S71fvnKMFsXUYebkD+WOyBJUbcd8/pGVKCGc1pfjsT8QTLw1xs/3XAR3
         9ILw4f05V2ymN2YzupgT5ZlKPPC3Q031hQcSrN1K1wGcRr/fsd4PwqZmFftiIiM/BdqO
         FgqHA6u4MgO5D+PiIGxb9yQu7KDJQhBwir111cKW8bGkB4JEHd/TyYa3pTNWvf1S/b+q
         svWXLvWPyLvSQiZr9R2npv9AO94tEcZKoKvKlObbcKMQ+09/ruQl6MnNFYLBcZQoI9uc
         FJ1Q==
X-Gm-Message-State: AOJu0Yxg3NCs6Ljs2+dDEEmCAdoDf1cA59xAfTIXBpOj7JDREG31sc3C
	4GBX+JbWrQSdtsf5oEiA7LlKgoiH/982ZnF/bMp9vJJH6c/SiM1alLQCW4aA
X-Google-Smtp-Source: AGHT+IEbRxi3ynj4+/uCwddDpt0J2nb0WLun5K2bmbuMV9hMwoyPb+hIMmeAcKff3i6CMpG7HjNVtA==
X-Received: by 2002:ac2:5f9a:0:b0:516:a1ce:6a20 with SMTP id r26-20020ac25f9a000000b00516a1ce6a20mr1419426lfe.24.1712139620350;
        Wed, 03 Apr 2024 03:20:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
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
Subject: [PATCH v7 04/19] xen: introduce generic non-atomic test_*bit()
Date: Wed,  3 Apr 2024 12:19:57 +0200
Message-ID: <ff6922206ab5476df907e2a05255663865f07301.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces the following generic functions:
* test_bit
* generic__test_and_set_bit
* generic__test_and_clear_bit
* generic__test_and_change_bit

Also, the patch introduces the following generics which are
used by the functions mentioned above:
* BITOP_BITS_PER_WORD
* BITOP_MASK
* BITOP_WORD
* BITOP_TYPE

These functions and macros can be useful for architectures
that don't have corresponding arch-specific instructions.

Because of that x86 has the following check in the macros test_bit(),
__test_and_set_bit(), __test_and_clear_bit(), __test_and_change_bit():
    if ( bitop_bad_size(addr) ) __bitop_bad_size();
It was necessary to move the check to generic code and define as 0
for other architectures as they do not require this check.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/arm/arm64/livepatch.c    |   1 -
 xen/arch/arm/include/asm/bitops.h |  67 -------------
 xen/arch/ppc/include/asm/bitops.h |  64 -------------
 xen/arch/ppc/include/asm/page.h   |   2 +-
 xen/arch/ppc/mm-radix.c           |   2 +-
 xen/arch/x86/include/asm/bitops.h |  28 ++----
 xen/include/xen/bitops.h          | 154 ++++++++++++++++++++++++++++++
 7 files changed, 165 insertions(+), 153 deletions(-)

diff --git a/xen/arch/arm/arm64/livepatch.c b/xen/arch/arm/arm64/livepatch.c
index df2cebedde..4bc8ed9be5 100644
--- a/xen/arch/arm/arm64/livepatch.c
+++ b/xen/arch/arm/arm64/livepatch.c
@@ -10,7 +10,6 @@
 #include <xen/mm.h>
 #include <xen/vmap.h>
 
-#include <asm/bitops.h>
 #include <asm/byteorder.h>
 #include <asm/insn.h>
 #include <asm/livepatch.h>
diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 5104334e48..8e16335e76 100644
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
 /*
  * On ARMv5 and above those functions can be implemented around
  * the clz instruction for much better code efficiency.
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 989d341a44..a17060c7c2 100644
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
@@ -133,56 +119,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
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
-#define flsl(x) generic_flsl(x)
-#define fls(x) generic_fls(x)
-
-/* Based on linux/include/asm-generic/bitops/ffz.h */
-/*
- * ffz - find first zero in word.
- * @word: The word to search
- *
- * Undefined if no zero exists, so code should check against ~0UL first.
- */
-#define ffz(x) __ffs(~(x))
-
 /**
  * hweightN - returns the hamming weight of a N-bit word
  * @x: the word to weigh
diff --git a/xen/arch/ppc/include/asm/page.h b/xen/arch/ppc/include/asm/page.h
index 890e285051..482053b023 100644
--- a/xen/arch/ppc/include/asm/page.h
+++ b/xen/arch/ppc/include/asm/page.h
@@ -4,7 +4,7 @@
 
 #include <xen/types.h>
 
-#include <asm/bitops.h>
+#include <xen/bitops.h>
 #include <asm/byteorder.h>
 
 #define PDE_VALID     PPC_BIT(0)
diff --git a/xen/arch/ppc/mm-radix.c b/xen/arch/ppc/mm-radix.c
index daa411a6fa..3cd8c4635a 100644
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
index dd439b69a0..81b43da5db 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -175,7 +175,7 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
 })
 
 /**
- * __test_and_set_bit - Set a bit and return its old value
+ * arch__test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -183,7 +183,7 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_set_bit(int nr, void *addr)
+static inline int arch__test_and_set_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
@@ -194,10 +194,7 @@ static inline int __test_and_set_bit(int nr, void *addr)
 
     return oldbit;
 }
-#define __test_and_set_bit(nr, addr) ({                 \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    __test_and_set_bit(nr, addr);                       \
-})
+#define arch__test_and_set_bit arch__test_and_set_bit
 
 /**
  * test_and_clear_bit - Clear a bit and return its old value
@@ -224,7 +221,7 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
 })
 
 /**
- * __test_and_clear_bit - Clear a bit and return its old value
+ * arch__test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -232,7 +229,7 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_clear_bit(int nr, void *addr)
+static inline int arch__test_and_clear_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
@@ -243,13 +240,10 @@ static inline int __test_and_clear_bit(int nr, void *addr)
 
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
 
@@ -260,10 +254,7 @@ static inline int __test_and_change_bit(int nr, void *addr)
 
     return oldbit;
 }
-#define __test_and_change_bit(nr, addr) ({              \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    __test_and_change_bit(nr, addr);                    \
-})
+#define arch__test_and_change_bit arch__test_and_change_bit
 
 /**
  * test_and_change_bit - Change a bit and return its new value
@@ -307,8 +298,7 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
     return oldbit;
 }
 
-#define test_bit(nr, addr) ({                           \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
+#define arch_test_bit(nr, addr) ({                      \
     __builtin_constant_p(nr) ?                          \
         constant_test_bit(nr, addr) :                   \
         variable_test_bit(nr, addr);                    \
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index f14ad0d33a..685c7540cc 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -65,10 +65,164 @@ static inline int generic_flsl(unsigned long x)
  * scope
  */
 
+#define BITOP_BITS_PER_WORD 32
+/* typedef uint32_t bitop_uint_t; */
+#define bitop_uint_t uint32_t
+
+#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
+
+#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
+
 /* --------------------- Please tidy above here --------------------- */
 
 #include <asm/bitops.h>
 
+#ifndef bitop_bad_size
+extern void __bitop_bad_size(void);
+#define bitop_bad_size(addr) 0
+#endif
+
+/**
+ * generic__test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline __pure bool
+generic__test_and_set_bit(unsigned long nr, volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = ((volatile bitop_uint_t *)addr) + BITOP_WORD(nr);
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
+static always_inline __pure bool
+generic__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = ((volatile bitop_uint_t *)addr) + BITOP_WORD(nr);
+    bitop_uint_t old = *p;
+
+    *p = old & ~mask;
+    return (old & mask);
+}
+
+/* WARNING: non atomic and it can be reordered! */
+static always_inline __pure bool
+generic__test_and_change_bit(unsigned long nr, volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = ((volatile bitop_uint_t *)addr) + BITOP_WORD(nr);
+    bitop_uint_t old = *p;
+
+    *p = old ^ mask;
+    return (old & mask);
+}
+/**
+ * generic_test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static always_inline __pure int generic_test_bit(int nr, const volatile void *addr)
+{
+    const volatile bitop_uint_t *p = addr;
+    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
+}
+
+static always_inline __pure bool
+__test_and_set_bit(unsigned long nr, volatile void *addr)
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
+static always_inline __pure bool
+__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
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
+static always_inline __pure bool
+__test_and_change_bit(unsigned long nr, volatile void *addr)
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
+static always_inline __pure int test_bit(int nr, const volatile void *addr)
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
+static always_inline __pure int fls(unsigned int x)
+{
+    if (__builtin_constant_p(x))
+        return generic_fls(x);
+
+#ifndef arch_fls
+#define arch_fls generic_fls
+#endif
+
+    return arch_fls(x);
+}
+
+static always_inline __pure int flsl(unsigned long x)
+{
+    if (__builtin_constant_p(x))
+        return generic_flsl(x);
+
+#ifndef arch_flsl
+#define arch_flsl generic_flsl
+#endif
+
+    return arch_flsl(x);
+}
+
 /*
  * Find First Set bit.  Bits are labelled from 1.
  */
-- 
2.43.0


