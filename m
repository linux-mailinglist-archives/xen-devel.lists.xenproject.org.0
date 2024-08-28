Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C28C896345B
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785173.1194669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlz-0000dz-De; Wed, 28 Aug 2024 22:04:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785173.1194669; Wed, 28 Aug 2024 22:04:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlz-0000b1-5H; Wed, 28 Aug 2024 22:04:15 +0000
Received: by outflank-mailman (input) for mailman id 785173;
 Wed, 28 Aug 2024 22:04:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlw-0006E8-Sa
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:12 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7474ae6a-6589-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 00:04:11 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4280ca0791bso65455495e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:11 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:04:08 -0700 (PDT)
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
X-Inumbo-ID: 7474ae6a-6589-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882650; x=1725487450; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RsrqcBVubseMkc2czg+d/Lcx765jVnGIyUSplcSJKR4=;
        b=D3CKCn9t1BNiwkxkuLB+WwvPpw6Z8+6Lv73F3ZbjFcxLTqE7sJsLZXmbf3DoYTqCBv
         pFBV+/xjXWrPpVPbltFHpDpiM4efF25Ja+hA5Tqd6c5Tcm+Zuvdb7jNGHv0FQZIo9zLW
         5jOY3XwvAu/sqs3HIbRyRL+0/AiSociLXnE2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882650; x=1725487450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RsrqcBVubseMkc2czg+d/Lcx765jVnGIyUSplcSJKR4=;
        b=RZfJnFEddSefUo7KtSwOQHkhZ2FeqKTsr8trj2g5EuLa0pLTm4iksrfKcgcopDQbhV
         l44moESqNRBBIeXsrCeYQuGyXEcgy5KPa6Dfpfd6zwWYKZO9qKrYi1wjhypqIAy7cTmy
         8FMR8cTC0CdJBZVZZzcIkNZhLUtUQ4TKn4tn0HFt/AKEAqJCC83R299kISL37nSo8pZ2
         zWPUXTkinkt7XtMpyYH2sTWQNNy9clqqHKU4o91HICDEc2YmTkS3logEQ5vHyyiaPHtW
         Hfs0+EWoca+FgayY/UR5gTiZMMzZUGI8pT1MU979+ZcVVM7D3sd3+H2XjsUtRax6Vg5N
         2Tcg==
X-Gm-Message-State: AOJu0YwioL/bi11+y0f3b4GyZui6fhckNTdZ8iy8WOQ+8qQHMKudbx2X
	/GxQonCu7IOvsLcd6aaNWtinV1Ccmlvfi3m3JmKWY1fB490EoqfaXIvataDmcAi1ZExW0OQmzih
	K
X-Google-Smtp-Source: AGHT+IH9thU/Kzrpd446ZuHrwCQxl0T9VP7RRAW0814zcCW2MU0Qfv9Jbyb29dJP8AwWWDR2moSOtQ==
X-Received: by 2002:a05:6000:b89:b0:371:846d:12b3 with SMTP id ffacd0b85a97d-3749b54d1abmr469774f8f.28.1724882649798;
        Wed, 28 Aug 2024 15:04:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 10/11] xen/bitops: Implement hweight64() in terms of hweight{l,32}()
Date: Wed, 28 Aug 2024 23:03:50 +0100
Message-Id: <20240828220351.2686408-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and drop generic_hweight{32,64}().

This is identical on all architectures except ARM32.  Add one extra SELF_TEST
to check that hweight64() works when the input is split in half.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>

v2:
 * Reorder with respect to the hweight32() patch
 * s/__pure/attr_const/
---
 xen/arch/arm/include/asm/bitops.h |  8 ------
 xen/arch/ppc/include/asm/bitops.h |  8 ------
 xen/arch/x86/include/asm/bitops.h |  8 ------
 xen/common/bitops.c               |  3 +++
 xen/include/xen/bitops.h          | 45 ++++++-------------------------
 5 files changed, 11 insertions(+), 61 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index b28c25b3d52d..f163d9bb4578 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -78,14 +78,6 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
 #define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
 #define arch_flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
 
-/**
- * hweightN - returns the hamming weight of a N-bit word
- * @x: the word to weigh
- *
- * The Hamming Weight of a number is the total number of bits set in it.
- */
-#define hweight64(x) generic_hweight64(x)
-
 #endif /* _ARM_BITOPS_H */
 /*
  * Local variables:
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index f488a7c03425..c942e9432e20 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -126,12 +126,4 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
 
 #define arch_hweightl(x) __builtin_popcountl(x)
 
-/**
- * hweightN - returns the hamming weight of a N-bit word
- * @x: the word to weigh
- *
- * The Hamming Weight of a number is the total number of bits set in it.
- */
-#define hweight64(x) __builtin_popcountll(x)
-
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 507b043b8a86..642d8e58b288 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -475,12 +475,4 @@ static always_inline unsigned int arch_flsl(unsigned long x)
 }
 #define arch_flsl arch_flsl
 
-/**
- * hweightN - returns the hamming weight of a N-bit word
- * @x: the word to weigh
- *
- * The Hamming Weight of a number is the total number of bits set in it.
- */
-#define hweight64(x) generic_hweight64(x)
-
 #endif /* _X86_BITOPS_H */
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 5e5d20d225d7..91ae961440af 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -144,6 +144,9 @@ static void __init test_hweight(void)
 
     CHECK(hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
     CHECK(hweightl, -1UL, BITS_PER_LONG);
+
+    /* unsigned int hweight64(uint64_t) */
+    CHECK(hweight64, -1ULL, 64);
 }
 
 static void __init __constructor test_bitops(void)
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index a462c3065158..c4cb432eed23 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -331,6 +331,14 @@ static always_inline attr_const unsigned int hweight32(uint32_t x)
     return hweightl(x);
 }
 
+static always_inline attr_const unsigned int hweight64(uint64_t x)
+{
+    if ( BITS_PER_LONG == 64 )
+        return hweightl(x);
+    else
+        return hweight32(x >> 32) + hweight32(x);
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
@@ -399,43 +407,6 @@ static inline int get_count_order(unsigned int count)
     return order;
 }
 
-/*
- * hweightN: returns the hamming weight (i.e. the number
- * of bits set) of a N-bit word
- */
-
-static inline unsigned int generic_hweight32(unsigned int w)
-{
-    w -= (w >> 1) & 0x55555555;
-    w =  (w & 0x33333333) + ((w >> 2) & 0x33333333);
-    w =  (w + (w >> 4)) & 0x0f0f0f0f;
-
-    if ( IS_ENABLED(CONFIG_HAS_FAST_MULTIPLY) )
-        return (w * 0x01010101) >> 24;
-
-    w += w >> 8;
-
-    return (w + (w >> 16)) & 0xff;
-}
-
-static inline unsigned int generic_hweight64(uint64_t w)
-{
-    if ( BITS_PER_LONG < 64 )
-        return generic_hweight32(w >> 32) + generic_hweight32(w);
-
-    w -= (w >> 1) & 0x5555555555555555UL;
-    w =  (w & 0x3333333333333333UL) + ((w >> 2) & 0x3333333333333333UL);
-    w =  (w + (w >> 4)) & 0x0f0f0f0f0f0f0f0fUL;
-
-    if ( IS_ENABLED(CONFIG_HAS_FAST_MULTIPLY) )
-        return (w * 0x0101010101010101UL) >> 56;
-
-    w += w >> 8;
-    w += w >> 16;
-
-    return (w + (w >> 32)) & 0xFF;
-}
-
 /*
  * rol32 - rotate a 32-bit value left
  *
-- 
2.39.2


