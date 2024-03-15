Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BAF87D339
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693991.1082737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwr-0007FD-0b; Fri, 15 Mar 2024 18:06:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693991.1082737; Fri, 15 Mar 2024 18:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwq-00079a-SM; Fri, 15 Mar 2024 18:06:28 +0000
Received: by outflank-mailman (input) for mailman id 693991;
 Fri, 15 Mar 2024 18:06:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwp-0005yW-BD
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:27 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bda8ec48-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:26 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2d2509c66daso33949101fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:26 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:24 -0700 (PDT)
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
X-Inumbo-ID: bda8ec48-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525985; x=1711130785; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZLjLu7NTZLQs4Ktw0PAaKJT749xyDrNgvm4eQvKv/jw=;
        b=XaWI6uKxw02paAqGsB4GaPOcUSvIRO40T+wVYItiUYobvZcMyOmW2CrBhnDVQRCWTO
         0lqke7b/Q9BX+ML2RQxjlPMLVrmkiXqZB85g35FwhjglwJbMY0nW6Bx0toCtGzPrDqUq
         v2TKeHA3hPdCGhQwpigIdanzAwUlsfGEpPoarnU+ePEKBB481P+KG/q0L7iX1GF1dksY
         zj3QKK37Cav4kGfAIM7rhxmGspWL4fJxZo1pfbJrkMtZ1A24fc3XXwN6gr3320kaRsIP
         m34vRLm6YfWEemJ4w6AsV6PrGPndAZw6B0EfW7kBdS0xDUwhsW6Va1OPJISoNaVSdmgP
         ZgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525985; x=1711130785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZLjLu7NTZLQs4Ktw0PAaKJT749xyDrNgvm4eQvKv/jw=;
        b=l0g4XXlYT0kNF6SaQ2+XnsGHBc0IC5k8GLONej1cW4l7q4HhKy60vDguJELshLaxQN
         roYkszp2jQ4zKCMVnZvsE9JncBpyYxy7X0M+kLsc0qLJ8fh4C7q45aZv64DO5LS0M3Gp
         ua2qPm8f/S2/bY5yx5kSIHE85Shvc9pL0o/AFcUXB/LiJTnavMk+wy/gV9dRHAanHMFP
         jCPvH4URxeEZkJUGhqLpmIEs15Al1yAUWVlFaNju5AD+a2aiCTlSGRDpwSuZX4YJg4DV
         DVEX/gnqHLuPqegstMtyZPCfoIKre5e25LcWwM9N6VN4I6PansW3bWkY66dq+b7Jg/jd
         yjRw==
X-Gm-Message-State: AOJu0Yz96wC2ZjUOqlPscj6jDVPSHiZ7hIKzCo3L8Zr/uJFodB3lZ4i8
	DOyvv4qhfDONdzeSaOFb+1vzXG7xwWE3O0B8SVc1vQ5K9alLtYRhZSJwUP07D/Y=
X-Google-Smtp-Source: AGHT+IGCsFBtBhS2vCW2niqNiPD74qj+Jg9e+Rhh+ldepWAMvFmN3caWAbPP+JYe7DVl2qxWuWwtjg==
X-Received: by 2002:a2e:9357:0:b0:2d3:f3bc:bb65 with SMTP id m23-20020a2e9357000000b002d3f3bcbb65mr3692888ljh.11.1710525985392;
        Fri, 15 Mar 2024 11:06:25 -0700 (PDT)
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
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v6 05/20] xen/bitops: implement fls{l}() in common logic
Date: Fri, 15 Mar 2024 19:06:01 +0100
Message-ID: <e7fc769a4f08ca00972faf4ce99e562d2eb3c00c.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
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
index 5104334e48..bcf7b48731 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -145,17 +145,14 @@ static inline int test_bit(int nr, const volatile void *addr)
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
index 989d341a44..16447a4be6 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -171,9 +171,6 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
     return (old & mask) != 0;
 }
 
-#define flsl(x) generic_flsl(x)
-#define fls(x) generic_fls(x)
-
 /* Based on linux/include/asm-generic/bitops/ffz.h */
 /*
  * ffz - find first zero in word.
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index dd439b69a0..87e91a1b7b 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -438,7 +438,7 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
  *
  * This is defined the same way as ffs.
  */
-static inline int flsl(unsigned long x)
+static always_inline int arch_flsl(unsigned long x)
 {
     long r;
 
@@ -448,8 +448,9 @@ static inline int flsl(unsigned long x)
           "1:" : "=r" (r) : "rm" (x));
     return (int)r+1;
 }
+#define arch_flsl arch_flsl
 
-static inline int fls(unsigned int x)
+static always_inline int arch_fls(unsigned int x)
 {
     int r;
 
@@ -459,6 +460,7 @@ static inline int fls(unsigned int x)
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
index f14ad0d33a..fac8f768ff 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -69,6 +69,30 @@ static inline int generic_flsl(unsigned long x)
 
 #include <asm/bitops.h>
 
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


