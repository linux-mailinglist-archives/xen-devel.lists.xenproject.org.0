Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B47C8A804F
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707302.1105099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AA-0008HP-J6; Wed, 17 Apr 2024 10:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707302.1105099; Wed, 17 Apr 2024 10:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AA-0008Eq-G1; Wed, 17 Apr 2024 10:05:10 +0000
Received: by outflank-mailman (input) for mailman id 707302;
 Wed, 17 Apr 2024 10:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2A9-0007lI-1e
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:09 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f83744c7-fca1-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:08 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-518b9527c60so4406886e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:08 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:05 -0700 (PDT)
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
X-Inumbo-ID: f83744c7-fca1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348307; x=1713953107; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5adx25fr/wfz7f4xSiA3gP6b9sIwZkI9BbkpB5bnGdQ=;
        b=eL23N6sz/4feV/UHGVJQYCgQPerjOabc/Hh8tC45FB/odrODmnStckUTLu/1cIzIUo
         pR9bQ5lHvc3b8xpTSosoh4veHifqZzoOCs/hh+w4IfTK+hQ4qiO+gl5CGB8UQsFpAGIV
         9QzlcweMshq56wR2eGtPIjrYvjAWCCIHBsbk1bO1H5L9krBtgRV/O8XMBnstPqSLOX3b
         VOSBcHO3wqJ9ufStPrdy5Q7XXG4UFdiwNhoDPEb0996KHXht3I5330KkLcfXhSFcdSQn
         7jubxwuOKYW9ZHGn1PaP+evrj4TCctNClISJ7IPE58kzo3mIvf02m+O3r0h8C/pfYuyX
         DhCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348307; x=1713953107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5adx25fr/wfz7f4xSiA3gP6b9sIwZkI9BbkpB5bnGdQ=;
        b=dqOr5koc8N5n5GawajDRdLAHJqAB5WP/CobxW220S2050Glf+vbdk6PPOsA88HNaOj
         EA60qMS9j98mrlc/51d0X5XHi7Ud1qFJIsiM0d7H8ZufvpME4QAaZJFdA3dt7UGZf9SG
         8hvWmlLGUw7QABw1yIcKfnNcE7PX9H97UDi/jSapFQMgm5KBbkanRIfD6l7Nqld6WBw6
         w7+nRuK8mWQXxmSP0bIsd9Qo999JwdANg/NtvlfQw0yf6ECLU6h4NGI/wdXqJwPdHKb2
         6LVXQPluP51ZcnrGzYqYBll6/tXueAbmxpi97ovR2+Ihwyj73Q+CFLOookPsLqzDBqlE
         EiFQ==
X-Gm-Message-State: AOJu0YxnorGbROnE1f0xrdOqvthqgTbdbE7M4q34LgXlMLA9f68XTTZF
	FJ610IHgIQpFnZOk1+YagQWU5v2pBsVPN2VI+m6uRbFRJZnRM0YlyYgYNA==
X-Google-Smtp-Source: AGHT+IHqv+tV87zwWHtvBac0yl2JC5RhmbmABUwwWchebqFExK+K+h1ixV+trqLJFPFY0UxK7R1hsg==
X-Received: by 2002:a19:ca58:0:b0:516:d0ec:5308 with SMTP id h24-20020a19ca58000000b00516d0ec5308mr11734206lfj.10.1713348306456;
        Wed, 17 Apr 2024 03:05:06 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v8 02/17] xen: introduce generic non-atomic test_*bit()
Date: Wed, 17 Apr 2024 12:04:45 +0200
Message-ID: <1a0977e3cf5a2de9f760ca5ec89a0d096894a9e3.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following generic functions were introduced:
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
It was necessary to make bitop bad size check generic too, so
arch_check_bitop_size() was introduced and defined as empty for other
architectures except x86.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
   The context ("* Find First Set bit.  Bits are labelled from 1." in xen/bitops.h )
   suggests there's a dependency on an uncommitted patch. It happens becuase the current patch
   series is based on Andrew's patch series ( https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t ),
   but if everything is okay with the current one patch it can be merged without Andrew's patch series being merged.
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
 xen/arch/arm/arm64/livepatch.c    |   1 -
 xen/arch/arm/include/asm/bitops.h |  67 ----------------
 xen/arch/ppc/include/asm/bitops.h |  52 ------------
 xen/arch/ppc/include/asm/page.h   |   2 +-
 xen/arch/ppc/mm-radix.c           |   2 +-
 xen/arch/x86/include/asm/bitops.h |  30 +++----
 xen/include/xen/bitops.h          | 127 ++++++++++++++++++++++++++++++
 xen/include/xen/types.h           |   5 ++
 8 files changed, 145 insertions(+), 141 deletions(-)

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
index 989d341a44..e2b6473c8c 100644
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
 #define flsl(x) generic_flsl(x)
 #define fls(x) generic_fls(x)
 
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
index dd439b69a0..2b2d9219ef 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -21,6 +21,8 @@
 
 extern void __bitop_bad_size(void);
 #define bitop_bad_size(addr) (sizeof(*(addr)) < 4)
+#define arch_check_bitop_size(addr) \
+    if ( bitop_bad_size(addr) ) __bitop_bad_size();
 
 /**
  * set_bit - Atomically set a bit in memory
@@ -175,7 +177,7 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
 })
 
 /**
- * __test_and_set_bit - Set a bit and return its old value
+ * arch__test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -183,7 +185,7 @@ static inline int test_and_set_bit(int nr, volatile void *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_set_bit(int nr, void *addr)
+static inline int arch__test_and_set_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
@@ -194,10 +196,7 @@ static inline int __test_and_set_bit(int nr, void *addr)
 
     return oldbit;
 }
-#define __test_and_set_bit(nr, addr) ({                 \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    __test_and_set_bit(nr, addr);                       \
-})
+#define arch__test_and_set_bit arch__test_and_set_bit
 
 /**
  * test_and_clear_bit - Clear a bit and return its old value
@@ -224,7 +223,7 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
 })
 
 /**
- * __test_and_clear_bit - Clear a bit and return its old value
+ * arch__test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
@@ -232,7 +231,7 @@ static inline int test_and_clear_bit(int nr, volatile void *addr)
  * If two examples of this operation race, one can appear to succeed
  * but actually fail.  You must protect multiple accesses with a lock.
  */
-static inline int __test_and_clear_bit(int nr, void *addr)
+static inline int arch__test_and_clear_bit(int nr, volatile void *addr)
 {
     int oldbit;
 
@@ -243,13 +242,10 @@ static inline int __test_and_clear_bit(int nr, void *addr)
 
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
 
@@ -260,10 +256,7 @@ static inline int __test_and_change_bit(int nr, void *addr)
 
     return oldbit;
 }
-#define __test_and_change_bit(nr, addr) ({              \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
-    __test_and_change_bit(nr, addr);                    \
-})
+#define arch__test_and_change_bit arch__test_and_change_bit
 
 /**
  * test_and_change_bit - Change a bit and return its new value
@@ -307,8 +300,7 @@ static inline int variable_test_bit(int nr, const volatile void *addr)
     return oldbit;
 }
 
-#define test_bit(nr, addr) ({                           \
-    if ( bitop_bad_size(addr) ) __bitop_bad_size();     \
+#define arch_test_bit(nr, addr) ({                      \
     __builtin_constant_p(nr) ?                          \
         constant_test_bit(nr, addr) :                   \
         variable_test_bit(nr, addr);                    \
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index f14ad0d33a..a41ec44064 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -65,10 +65,137 @@ static inline int generic_flsl(unsigned long x)
  * scope
  */
 
+#define BITOP_MASK(nr)  ((bitop_uint_t)1 << ((nr) % BITOP_BITS_PER_WORD))
+
+#define BITOP_WORD(nr)  ((nr) / BITOP_BITS_PER_WORD)
+
 /* --------------------- Please tidy above here --------------------- */
 
 #include <asm/bitops.h>
 
+#ifndef arch_check_bitop_size
+#define arch_check_bitop_size(addr)
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
+static always_inline bool
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
+static always_inline bool
+generic__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
+    bitop_uint_t old = *p;
+
+    *p = old & ~mask;
+    return (old & mask);
+}
+
+/* WARNING: non atomic and it can be reordered! */
+static always_inline bool
+generic__test_and_change_bit(unsigned long nr, volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
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
+static always_inline bool generic_test_bit(int nr, const volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    volatile bitop_uint_t *p = (volatile bitop_uint_t *)addr + BITOP_WORD(nr);
+
+    return (*p & mask);
+}
+
+static always_inline bool
+__test_and_set_bit(unsigned long nr, volatile void *addr)
+{
+#ifndef arch__test_and_set_bit
+#define arch__test_and_set_bit generic__test_and_set_bit
+#endif
+
+    return arch__test_and_set_bit(nr, addr);
+}
+#define __test_and_set_bit(nr, addr) ({             \
+    arch_check_bitop_size(addr);                    \
+    __test_and_set_bit(nr, addr);                   \
+})
+
+static always_inline bool
+__test_and_clear_bit(bitop_uint_t nr, volatile void *addr)
+{
+#ifndef arch__test_and_clear_bit
+#define arch__test_and_clear_bit generic__test_and_clear_bit
+#endif
+
+    return arch__test_and_clear_bit(nr, addr);
+}
+#define __test_and_clear_bit(nr, addr) ({           \
+    arch_check_bitop_size(addr);                    \
+    __test_and_clear_bit(nr, addr);                 \
+})
+
+static always_inline bool
+__test_and_change_bit(unsigned long nr, volatile void *addr)
+{
+#ifndef arch__test_and_change_bit
+#define arch__test_and_change_bit generic__test_and_change_bit
+#endif
+
+    return arch__test_and_change_bit(nr, addr);
+}
+#define __test_and_change_bit(nr, addr) ({              \
+    arch_check_bitop_size(addr);                        \
+    __test_and_change_bit(nr, addr);                    \
+})
+
+static always_inline bool test_bit(int nr, const volatile void *addr)
+{
+#ifndef arch_test_bit
+#define arch_test_bit generic_test_bit
+#endif
+
+    return arch_test_bit(nr, addr);
+}
+#define test_bit(nr, addr) ({                           \
+    arch_check_bitop_size(addr);                        \
+    test_bit(nr, addr);                                 \
+})
+
 /*
  * Find First Set bit.  Bits are labelled from 1.
  */
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index 449947b353..7a1f5021bd 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -64,6 +64,11 @@ typedef __u64 __be64;
 
 typedef unsigned int __attribute__((__mode__(__pointer__))) uintptr_t;
 
+#ifndef BITOP_TYPE
+    #define BITOP_BITS_PER_WORD 32
+    typedef uint32_t bitop_uint_t;
+#endif
+
 #define test_and_set_bool(b)   xchg(&(b), true)
 #define test_and_clear_bool(b) xchg(&(b), false)
 
-- 
2.44.0


