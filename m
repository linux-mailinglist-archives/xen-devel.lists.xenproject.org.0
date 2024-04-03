Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E493896C00
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700398.1093504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjH-0000Of-L3; Wed, 03 Apr 2024 10:20:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700398.1093504; Wed, 03 Apr 2024 10:20:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjH-0000Jt-Cc; Wed, 03 Apr 2024 10:20:27 +0000
Received: by outflank-mailman (input) for mailman id 700398;
 Wed, 03 Apr 2024 10:20:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjE-0007Ob-RT
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:24 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7df53da-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:23 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-515a97846b5so6694336e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:23 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:21 -0700 (PDT)
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
X-Inumbo-ID: c7df53da-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139622; x=1712744422; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IwZl5pVjVnzQXQ1Xje0ocBXf1LvlWI8p41kWWtq8CMU=;
        b=CnMPdAQ4J2bdbJucMJc905xAzGkNSghgdoKzFdGzIr5jQt5rLxXvdz9M+zXqZr0Zo2
         SXnN2uWzBjIBJqv5xOBWajJKTQwDqFb9Vf6PGJId6twb/+ZUh1ZDQVQPHch9KAlul/g4
         gUfg3RFN13IEJ1nwuaSD0u1Ak3/6e2xJsNNr1qO8KdY6SRwdZSR0Yp0vsJSoFMPolP3u
         Ff94fbP6xX5By5keGJ+6XtI6s35CAStbEgyFS9GzxBS9IWuFcCIR8p3BCIl4a1kYG/aO
         6S592bTJUNJWyVeDw/97g+835hA4mV/X1RBwBeHdoOBJTRY0oTLlDcgP4xWI3N5Qoeub
         rLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139622; x=1712744422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IwZl5pVjVnzQXQ1Xje0ocBXf1LvlWI8p41kWWtq8CMU=;
        b=eA+Ga4UjQLVUlE942XD+ynkQLbLh/Iq5uqnX8iAKhb4Bx7rWWK8eC8lJMppsDmZeR9
         S8f2W/z9wioLInq2MD3tkZeDgNxlmcmMUJdK/jtoxZaZswGzCMF7o6E446B33z6cijsO
         WZ8NoJ9B+lSXBMMkI4J+kqiEjQbFLSEJ/lv5l+4XFb94vUs4pXIeJQ1dzDVAKm0pMHqW
         RND4pI10N3O8OOI6LeYxIf101Wdoq8s76CScK6KfiuQyAOjtbXUVMMhWhVZWnHLJNkBe
         +3lPCabA5cRWT22t3KQyhpmngRDLK0EGv2uO5VLapTN8rXqhreNOoUIbDiPy+DoKulDD
         9uWQ==
X-Gm-Message-State: AOJu0YwE2UqeU0oWAaHwuka67K8Lrz0afSIBPp2sST4SDspEXjS52IUi
	RhZIueci7o8dNLsQLLoRuoVbJ3/buUcxIlfq93Hrjk3J/YeqFsKGUM7CnNaX
X-Google-Smtp-Source: AGHT+IGQPi5pBwNLUdZ9zSNPOYdx4xHma/P+k3+ceSy8rX7EKnls+NuCGPESIKcyJ+5yPksd4J2x0w==
X-Received: by 2002:a05:6512:741:b0:515:c8fc:9d98 with SMTP id c1-20020a056512074100b00515c8fc9d98mr8994541lfs.20.1712139621854;
        Wed, 03 Apr 2024 03:20:21 -0700 (PDT)
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
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v7 05/19] xen/bitops: implement fls{l}() in common logic
Date: Wed,  3 Apr 2024 12:19:58 +0200
Message-ID: <f2fb33097608fc1317b81e78d00d1b91b0fc4c1d.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
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
Changes in V7:
 - Code style fixes
---
Changes in V6:
 - new patch for the patch series.
---
 xen/arch/arm/include/asm/arm32/bitops.h |  2 +-
 xen/arch/arm/include/asm/arm64/bitops.h |  6 ++----
 xen/arch/arm/include/asm/bitops.h       |  7 ++-----
 xen/arch/x86/include/asm/bitops.h       |  6 ++++--
 xen/common/bitops.c                     | 22 ++++++++++++++++++++++
 xen/include/xen/bitops.h                |  4 ++--
 6 files changed, 33 insertions(+), 14 deletions(-)

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
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 81b43da5db..9c4ab52df7 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -428,7 +428,7 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
  *
  * This is defined the same way as ffs.
  */
-static inline int flsl(unsigned long x)
+static always_inline int arch_flsl(unsigned long x)
 {
     long r;
 
@@ -438,8 +438,9 @@ static inline int flsl(unsigned long x)
           "1:" : "=r" (r) : "rm" (x));
     return (int)r+1;
 }
+#define arch_flsl arch_flsl
 
-static inline int fls(unsigned int x)
+static always_inline int arch_fls(unsigned int x)
 {
     int r;
 
@@ -449,6 +450,7 @@ static inline int fls(unsigned int x)
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
index 685c7540cc..bc8ae53997 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -201,7 +201,7 @@ static always_inline __pure int test_bit(int nr, const volatile void *addr)
 
 static always_inline __pure int fls(unsigned int x)
 {
-    if (__builtin_constant_p(x))
+    if ( __builtin_constant_p(x) )
         return generic_fls(x);
 
 #ifndef arch_fls
@@ -213,7 +213,7 @@ static always_inline __pure int fls(unsigned int x)
 
 static always_inline __pure int flsl(unsigned long x)
 {
-    if (__builtin_constant_p(x))
+    if ( __builtin_constant_p(x) )
         return generic_flsl(x);
 
 #ifndef arch_flsl
-- 
2.43.0


