Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFA896CA9F
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 00:55:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790822.1200631 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyue-0002WM-IP; Wed, 04 Sep 2024 22:55:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790822.1200631; Wed, 04 Sep 2024 22:55:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyue-0002Sp-DU; Wed, 04 Sep 2024 22:55:44 +0000
Received: by outflank-mailman (input) for mailman id 790822;
 Wed, 04 Sep 2024 22:55:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slyuc-0001Vf-KE
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 22:55:42 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf0d46d4-6b10-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 00:55:41 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a8a1d78e7b0so29700166b.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 15:55:41 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a679755b3sm21546166b.146.2024.09.04.15.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 15:55:38 -0700 (PDT)
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
X-Inumbo-ID: cf0d46d4-6b10-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725490540; x=1726095340; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hd3H+h3D3FJFoKSFWHnu0JXTNonfMBRV1dP4GfZ7wVk=;
        b=f1GZ1qryOrE+AIVt8dIDF4Cwv3AXhIjWhsBr2FZ561KeXFI2cyQ5OYkz7p9o8UNzMo
         cSIPYwox1axo0XiPOgXsPIh/NI4o1cNiea8uSBj0JYqlRKUeTS82AITox5PyB06baato
         BWJ2NuFDzaKUVOxkJ7WegpgkwEIKaPbUBUQ7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490540; x=1726095340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hd3H+h3D3FJFoKSFWHnu0JXTNonfMBRV1dP4GfZ7wVk=;
        b=a8Y1lGlf3tE4FudhwKXMQrIQRr0YFOjr8KU9Uxfo+xYzEjR6Ws6eQS5/8o31tbE7Lz
         2x+lpR+OtONZlXlUM6WMkkZeYpzkYjpah2JD1uzZ+M52zgTl6PTU7bVAa3zZ7vv8/rGC
         J6BihmPfwST0//+Go6K9qIMvW5FkLq+t//JXb7Qg0sIz/qvScudIZhGRCO+XRh+GwY0r
         2kpjPpPz9xij7nz8idNoPWD/zAPmCLvMBm2LucbucFS3GRom0+kA8ha7Exx41Q54jzPq
         raO88WsJBVFEOgduajjA9dbdJ9HMSKiewsE9JLQnaQHsbxiCVYHrpCOkV3Skk+/SPSQB
         4/ZA==
X-Gm-Message-State: AOJu0Yy/25ftMedo/qmoGqete4XoZrHmp3/pbnvWhRcNRFzbJan0f8r9
	PZxr2GLXG4okxeLsrZdD7nTM5WSEAREKQx0BmKJTtBHuxJjbuds3j6IaBchpJAwv3g0v5o22UE7
	t
X-Google-Smtp-Source: AGHT+IE9VLaaMtlNwXPcEcM6pwwWuJWcGfSEwfsF1cBZ1/BY0yP0ykTmeD26W5mnQHHrC45r7ZjwjA==
X-Received: by 2002:a17:907:7e9c:b0:a7a:a06b:eecd with SMTP id a640c23a62f3a-a8a3f0ee73emr344872666b.5.1725490539513;
        Wed, 04 Sep 2024 15:55:39 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 4/5] xen/bitops: Implement hweight64() in terms of hweight{l,32}()
Date: Wed,  4 Sep 2024 23:55:29 +0100
Message-Id: <20240904225530.3888315-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and drop generic_hweight{32,64}().

This is identical on all architectures except ARM32.  Add one extra SELF_TEST
to check that hweight64() works when the input is split in half.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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

v3:
 * Use >=, even if it does differ from ffs()
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
index a462c3065158..12eb88fb1255 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -331,6 +331,14 @@ static always_inline attr_const unsigned int hweight32(uint32_t x)
     return hweightl(x);
 }
 
+static always_inline attr_const unsigned int hweight64(uint64_t x)
+{
+    if ( BITS_PER_LONG >= 64 )
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


