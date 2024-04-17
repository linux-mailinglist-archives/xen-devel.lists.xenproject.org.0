Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 759998A808A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:18:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707365.1105245 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2Mu-0001MW-Lo; Wed, 17 Apr 2024 10:18:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707365.1105245; Wed, 17 Apr 2024 10:18:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2Mu-0001K3-IT; Wed, 17 Apr 2024 10:18:20 +0000
Received: by outflank-mailman (input) for mailman id 707365;
 Wed, 17 Apr 2024 10:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2Ad-0007lI-DZ
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:39 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0a7aec8d-fca2-11ee-b909-491648fe20b8;
 Wed, 17 Apr 2024 12:05:38 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516cbf3fe68so6891558e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:38 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:07 -0700 (PDT)
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
X-Inumbo-ID: 0a7aec8d-fca2-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348338; x=1713953138; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q5ULn7J+C23bytnZegqIYlqxigksIJAvnkht5gx5amU=;
        b=Yq0hfKRGbxWLDAj2fnlMRlhxR/jHNx/a/J70Q8AVIl2z0sSaHAGQ+C6Zg/XSKl6Gs+
         Np0EnjaQDqoUmF4PFRK7BxVanwMZk36zaIHm3m92rdI4AvfbCM5JX7q0sl4UnpiCzOXT
         7+apaDe9vBJ3P0mmVD1qCu67f+LNEGmBzejAT01k4u9PqsAAFcUAC4zsYUVXfsh6sRqm
         Lw0zQ/KqyK3kAB9CCjNFW4/6xIn3P/kSA1RCIF9cWlkK5Ym/7SPnOuyLvepTn8qTB1OF
         DKL35aS9Vq90hnMYwCp08J/rgBJL7l/4vBoa1XUp9hp6/KYxYxisi8QF+s4yv3XbE7uN
         Z5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348338; x=1713953138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5ULn7J+C23bytnZegqIYlqxigksIJAvnkht5gx5amU=;
        b=mETPqGu+18VrUod1b8Fx6GrDEvncZgnX3Z1wv8Tm/YKi2Gkr08bI2A+uoPcEVaDpfg
         J0jHgLxjjnCO6yREgdTZi3fRyrKTNYQ2Yup2vRcRubxrOHmHJw41Pvml93d2xAuh/Izt
         N2Wc9GBg5mLX5/jgwFWE/G0oddGntRXY17mCq+19tvhrWsHDTwow9+g8oYJPvZnsOudM
         HeA6idIMwVWE29auCCE7JnpPxkYQfea1KcIcilBoFgiVyWX7TVgyFfADvRcLEZdyUdIQ
         DYGToFsLt9JC3m29DOqxEMqCK+G9zBsC5IWja58no/EvMKSyUSrJr3sJH5rRau6rpXqa
         Z2BA==
X-Gm-Message-State: AOJu0YxaOBuhzTlv926910wFIBMa6fa3iO/06vJv88QNLQO6XgrtOTZC
	POmwqfinFFESiiBettbrqDv8zQSIeE1KhS+yjzc4y9xiJE+/MNp5x/TK0A==
X-Google-Smtp-Source: AGHT+IFuNF9ms6azISaKCHmPIxauFJJF0/Y3ZA1fsWpaRswYHa+kDy29+3l8sQU3UTWlpJPMmPrhZA==
X-Received: by 2002:ac2:4182:0:b0:516:d0c2:755 with SMTP id z2-20020ac24182000000b00516d0c20755mr8877498lfh.63.1713348308113;
        Wed, 17 Apr 2024 03:05:08 -0700 (PDT)
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
Subject: [PATCH v8 03/17] xen/bitops: implement fls{l}() in common logic
Date: Wed, 17 Apr 2024 12:04:46 +0200
Message-ID: <60bc710b990ed1d45741888df7e97cf25d150e61.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return type was left 'int' because of the following compilation error:

./include/xen/kernel.h:18:21: error: comparison of distinct pointer types lacks a cast [-Werror]
       18 |         (void) (&_x == &_y);            \
          |                     ^~
    common/page_alloc.c:1843:34: note: in expansion of macro 'min'
     1843 |         unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);

generic_fls{l} was used instead of __builtin_clz{l}(x) as if x is 0,
the result in undefined.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 The patch is almost independent from Andrew's patch series
 ( https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t)
 except test_fls() function which IMO can be merged as a separate patch after Andrew's patch
 will be fully ready.
---
Changes in V8:
 - do proper rebase: back definition of fls{l} to the current patch.
 - drop the changes which removed ffz() in PPC. it should be done not
   in this patch.
 - add a message after Signed-off.
---
Changes in V7:
 - Code style fixes
---
Changes in V6:
 - new patch for the patch series.
---
 xen/arch/arm/include/asm/arm32/bitops.h |  2 +-
 xen/arch/arm/include/asm/arm64/bitops.h |  6 ++----
 xen/arch/arm/include/asm/bitops.h       |  7 ++-----
 xen/arch/ppc/include/asm/bitops.h       |  3 ---
 xen/arch/x86/include/asm/bitops.h       |  6 ++++--
 xen/common/bitops.c                     | 22 ++++++++++++++++++++++
 xen/include/xen/bitops.h                | 24 ++++++++++++++++++++++++
 7 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/bitops.h b/xen/arch/arm/include/asm/arm32/bitops.h
index d0309d47c1..5552d4e945 100644
--- a/xen/arch/arm/include/asm/arm32/bitops.h
+++ b/xen/arch/arm/include/asm/arm32/bitops.h
@@ -1,7 +1,7 @@
 #ifndef _ARM_ARM32_BITOPS_H
 #define _ARM_ARM32_BITOPS_H
 
-#define flsl fls
+#define arch_flsl fls
 
 /*
  * Little endian assembly bitops.  nr = 0 -> byte 0 bit 0.
diff --git a/xen/arch/arm/include/asm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
index 0efde29068..5f5d97faa0 100644
--- a/xen/arch/arm/include/asm/arm64/bitops.h
+++ b/xen/arch/arm/include/asm/arm64/bitops.h
@@ -22,17 +22,15 @@ static /*__*/always_inline unsigned long __ffs(unsigned long word)
  */
 #define ffz(x)  __ffs(~(x))
 
-static inline int flsl(unsigned long x)
+static inline int arch_flsl(unsigned long x)
 {
         uint64_t ret;
 
-        if (__builtin_constant_p(x))
-               return generic_flsl(x);
-
         asm("clz\t%0, %1" : "=r" (ret) : "r" (x));
 
         return BITS_PER_LONG - ret;
 }
+#define arch_flsl arch_flsl
 
 /* Based on linux/include/asm-generic/bitops/find.h */
 
diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 8e16335e76..860d6d4689 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -78,17 +78,14 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
  * the clz instruction for much better code efficiency.
  */
 
-static inline int fls(unsigned int x)
+static inline int arch_fls(unsigned int x)
 {
         int ret;
 
-        if (__builtin_constant_p(x))
-               return generic_fls(x);
-
         asm("clz\t%"__OP32"0, %"__OP32"1" : "=r" (ret) : "r" (x));
         return 32 - ret;
 }
-
+#define arch_fls arch_fls
 
 #define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
 #define arch_ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index e2b6473c8c..ca308fd62b 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -119,9 +119,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
         (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
 }
 
-#define flsl(x) generic_flsl(x)
-#define fls(x) generic_fls(x)
-
 /* Based on linux/include/asm-generic/bitops/ffz.h */
 /*
  * ffz - find first zero in word.
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 2b2d9219ef..5d5b9445c5 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -430,7 +430,7 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
  *
  * This is defined the same way as ffs.
  */
-static inline int flsl(unsigned long x)
+static always_inline int arch_flsl(unsigned long x)
 {
     long r;
 
@@ -440,8 +440,9 @@ static inline int flsl(unsigned long x)
           "1:" : "=r" (r) : "rm" (x));
     return (int)r+1;
 }
+#define arch_flsl arch_flsl
 
-static inline int fls(unsigned int x)
+static always_inline int arch_fls(unsigned int x)
 {
     int r;
 
@@ -451,6 +452,7 @@ static inline int fls(unsigned int x)
           "1:" : "=r" (r) : "rm" (x));
     return r + 1;
 }
+#define arch_fls arch_fls
 
 /**
  * hweightN - returns the hamming weight of a N-bit word
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index a8c32f6767..95bc47176b 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -62,9 +62,31 @@ static void test_ffs(void)
     CHECK(ffs64, (uint64_t)0x8000000000000000, 64);
 }
 
+static void test_fls(void)
+{
+    /* unsigned int ffs(unsigned int) */
+    CHECK(fls, 1, 1);
+    CHECK(fls, 3, 2);
+    CHECK(fls, 3U << 30, 32);
+
+    /* unsigned int flsl(unsigned long) */
+    CHECK(flsl, 1, 1);
+    CHECK(flsl, 1UL << (BITS_PER_LONG - 1), BITS_PER_LONG);
+#if BITS_PER_LONG > 32
+    CHECK(flsl, 3UL << 32, 34);
+#endif
+
+    /* unsigned int fls64(uint64_t) */
+    CHECK(fls64, 1, 1);
+    CHECK(fls64, 0x00000000C0000000ULL, 32);
+    CHECK(fls64, 0x0000000180000000ULL, 33);
+    CHECK(fls64, 0xC000000000000000ULL, 64);
+}
+
 static int __init cf_check test_bitops(void)
 {
     test_ffs();
+    test_fls();
 
     return 0;
 }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a41ec44064..a7edee4a95 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -196,6 +196,30 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
     test_bit(nr, addr);                                 \
 })
 
+static always_inline __pure int fls(unsigned int x)
+{
+    if ( __builtin_constant_p(x) )
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
+    if ( __builtin_constant_p(x) )
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
2.44.0


