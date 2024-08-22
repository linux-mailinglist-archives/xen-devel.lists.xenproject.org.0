Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A16D595C144
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782011.1191559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtK-0007F4-2K; Thu, 22 Aug 2024 23:06:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782011.1191559; Thu, 22 Aug 2024 23:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtJ-0007B6-Na; Thu, 22 Aug 2024 23:06:53 +0000
Received: by outflank-mailman (input) for mailman id 782011;
 Thu, 22 Aug 2024 23:06:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGtH-00052v-SP
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:51 +0000
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3699e577-60db-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 01:06:50 +0200 (CEST)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-533462b9428so2424368e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:50 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:46 -0700 (PDT)
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
X-Inumbo-ID: 3699e577-60db-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368009; x=1724972809; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hv9HlPwXrRYZdKJJ+1+hjJMFB9PxOUm7mKL1fwt8sqc=;
        b=LkHq+bj66eQWwX2bfzMPnXlvAKAFUu3jUVVFazOW9yIp53btyNksaiUTQ+FCBUNB+8
         Bu0CBDtqz0qY/inO45Pd4c+F8f0Jn0RiQ76XAEF7dIzRj8C16tDCM6zeu1FwO7OG9O/Z
         i5mXyA13Kkehef4hC0S5xKA6LNiCj98HfrMwQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368009; x=1724972809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hv9HlPwXrRYZdKJJ+1+hjJMFB9PxOUm7mKL1fwt8sqc=;
        b=hyb6h/6ctauQtAulfnXTrRmePhuZx6e5NcWTnMQUs4hGzqrV7gRNfeigU1mzT8riV7
         53eSVp2I6Zt2Q8mu0EgBtm6lbYt7j0rmubLKYPO7pIhgLmh3g0sr11ThO49MY+gOpXY2
         mHJZYftURAVO5AmPqIlGL7uH4wreYfAoE9CaCK+TdUpGUBLNu7D3jZgiSi3cPK217t3H
         3hQMPdpGfltpRpm6gBfw1GHLO2L6jUXOSO3sEoCARzCYZaT90xqfHxcg+g/Gg8uwGC4r
         nPdZbnFu8B51xk5Kt07w2QX3FId01hWUImaQleclgDHYmfckzR67uhAE3CXiRqBdVbZd
         +upQ==
X-Gm-Message-State: AOJu0YzxZwpF8TaIFxyTxGtsCzcWQwfwrRzLLYbf0xxr51WWqUxinlWv
	SXEYGwbeUrirXtZcBCOg4ut3vQAZYBEyH3mqX6PJ06kSnoFWLfiD/bH9NtPRLRXukodIkNwrqpZ
	9
X-Google-Smtp-Source: AGHT+IE7t0IfrG/EKoPzKoWKQ7aMXt59Dnlv0A5uSbNgbXpz8Nz7/5pY6zVU/KKdUSpN6o8Cct/2wA==
X-Received: by 2002:a05:6512:114b:b0:52e:9808:3f48 with SMTP id 2adb3069b0e04-5343884701cmr433413e87.21.1724368008957;
        Thu, 22 Aug 2024 16:06:48 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 8/9] xen/bitops: Implement hweight32() in terms of hweightl()
Date: Fri, 23 Aug 2024 00:06:34 +0100
Message-Id: <20240822230635.954557-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and drop generic_hweight32().

As noted previously, the only two users of hweight32() and they're both
singleton callers in __init paths, so it's not interesting to have a sub-GPR
optimised generic.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/arm/include/asm/bitops.h |  8 --------
 xen/arch/ppc/include/asm/bitops.h |  8 --------
 xen/arch/x86/include/asm/bitops.h |  8 --------
 xen/include/xen/bitops.h          | 24 +++++-------------------
 4 files changed, 5 insertions(+), 43 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index bed6b3b98e08..f163d9bb4578 100644
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
-#define hweight32(x) generic_hweight32(x)
-
 #endif /* _ARM_BITOPS_H */
 /*
  * Local variables:
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 24dc35ef644d..c942e9432e20 100644
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
-#define hweight32(x) __builtin_popcount(x)
-
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 9d3a2448036e..642d8e58b288 100644
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
-#define hweight32(x) generic_hweight32(x)
-
 #endif /* _X86_BITOPS_H */
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index e97516552a2e..bad2601b0fe6 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -302,6 +302,11 @@ static always_inline __pure unsigned int hweightl(unsigned long x)
 #endif
 }
 
+static always_inline __pure unsigned int hweight32(uint32_t x)
+{
+    return hweightl(x);
+}
+
 static always_inline __pure unsigned int hweight64(uint64_t x)
 {
     if ( BITS_PER_LONG == 64 )
@@ -378,25 +383,6 @@ static inline int get_count_order(unsigned int count)
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
 /*
  * rol32 - rotate a 32-bit value left
  *
-- 
2.39.2


