Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A18C8C878C
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724180.1129371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3E-00024H-Of; Fri, 17 May 2024 13:55:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724180.1129371; Fri, 17 May 2024 13:55:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3E-0001yl-LN; Fri, 17 May 2024 13:55:12 +0000
Received: by outflank-mailman (input) for mailman id 724180;
 Fri, 17 May 2024 13:55:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3D-0001cB-3M
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:11 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1341fefd-1455-11ef-909e-e314d9c70b13;
 Fri, 17 May 2024 15:55:10 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52389c1308dso767289e87.3
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:10 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:08 -0700 (PDT)
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
X-Inumbo-ID: 1341fefd-1455-11ef-909e-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954109; x=1716558909; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54376BKXaMRj0bU8DqMJL73bnzloZBB1RI+aKenu2eI=;
        b=gdP/4CI5TOgI/sY/pNh+WFS4+XybeGcT1WuN6QrFkaQ4JFfbQuBsbhCeZertfIEhV3
         69LA4PywRqRIGyU3Cn8h8mSC5tgYJEG9SE0BloJoGtNVre7+LkqrJBAzLZoPonu8o9kZ
         XvDy96JtXu7gKGCLfSW65UblpDTvzUCGHCXj7+ou/D1z1Kb5IuUxR+0cNqWqxTPFOnhW
         XKIEI0Am24RD6pzMKN0c4kOFPB+TLyNpC4Sgpv/lvtaJnaP4+aAnuDgNfbyOYSB6ssJE
         5vDs0wfBh+OIAoGtyzi9zP5IArq2qPwP8YYtRug4B+4KhPt0XfqMOS7x4xndQXQpR+8E
         6TCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954109; x=1716558909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54376BKXaMRj0bU8DqMJL73bnzloZBB1RI+aKenu2eI=;
        b=Y/8Yp/59OpnUNW8pYT3D3QSE7fN7NNjLc9yXkUiZeYPeiCMari0sCEYLswm89steCB
         CBOfvGzPb8eTbAACd7Su08GrQ1D34WwMRUk/Ybreul9fCMGY4V4fJH0ov3lT62dpVrXi
         1N2KDbeKWedse3cf99pJyPcNCcbFzr/7kSQCHhl95gddbVnBF9PL+MEHEHJKUaZvDiax
         hQIuAMAY845ftd2RBA1P2miGzMukWjRe1j1EnJG8mTRtT51VuOLPQLAnuIcunIy7evIo
         /n/SuiyZkdWUQRJaO8p57SlTJAoYJHkhHf2wTD3PDnTcsF3pDOId4J1G8cg6T17c3esK
         X4hw==
X-Gm-Message-State: AOJu0YzBbBrhRZMSMP8OVOzAUBTZDM1cEy+MmcXAhfxL4tujukVvjlMj
	pR2YlZvy6FysaQ2xEB7wydPohuySEv8db5Xs27/apBlJ+JjgTiCmjg6RYTn7
X-Google-Smtp-Source: AGHT+IFTfWDRo3Tqa1PCPq1VbAzDPpfputSHVqpLpWWJ1xgDRzivP3CQXXKgxgm1Xq7uMSyW791i5A==
X-Received: by 2002:a05:6512:2254:b0:523:294f:7fe6 with SMTP id 2adb3069b0e04-523294f806bmr11415779e87.44.1715954109015;
        Fri, 17 May 2024 06:55:09 -0700 (PDT)
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
Subject: [PATCH v10 02/14] xen: introduce generic non-atomic test_*bit()
Date: Fri, 17 May 2024 15:54:51 +0200
Message-ID: <219df9d840a183fc55de02aff011c0972a68587c.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
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
   The context ("* Find First Set bit.  Bits are labelled from 1." in xen/bitops.h )
   suggests there's a dependency on an uncommitted patch. It happens becuase the current patch
   series is based on Andrew's patch series ( https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t ),
   but if everything is okay with the current one patch it can be merged without Andrew's patch series being merged.
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
 xen/arch/arm/arm64/livepatch.c    |   1 -
 xen/arch/arm/include/asm/bitops.h |  67 ---------------
 xen/arch/ppc/include/asm/bitops.h |  52 ------------
 xen/arch/ppc/include/asm/page.h   |   2 +-
 xen/arch/ppc/mm-radix.c           |   2 +-
 xen/arch/x86/include/asm/bitops.h |  31 ++-----
 xen/include/xen/bitops.h          | 131 ++++++++++++++++++++++++++++++
 7 files changed, 142 insertions(+), 144 deletions(-)

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
index 20f7865358..049aa62b89 100644
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
index dd439b69a0..23f09fdb7a 100644
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
index f14ad0d33a..6eeeff0117 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -65,10 +65,141 @@ static inline int generic_flsl(unsigned long x)
  * scope
  */
 
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
 /* --------------------- Please tidy above here --------------------- */
 
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
+/* WARNING: non atomic and it can be reordered! */
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
+/**
+ * generic_test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static always_inline bool generic_test_bit(int nr, const volatile void *addr)
+{
+    bitop_uint_t mask = BITOP_MASK(nr);
+    const volatile bitop_uint_t *p =
+                        (const volatile bitop_uint_t *)addr + BITOP_WORD(nr);
+
+    return (*p & mask);
+}
+
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
 /*
  * Find First Set bit.  Bits are labelled from 1.
  */
-- 
2.45.0


