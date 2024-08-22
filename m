Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEFD95C146
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782009.1191536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtH-0006cV-7E; Thu, 22 Aug 2024 23:06:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782009.1191536; Thu, 22 Aug 2024 23:06:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtH-0006Ub-37; Thu, 22 Aug 2024 23:06:51 +0000
Received: by outflank-mailman (input) for mailman id 782009;
 Thu, 22 Aug 2024 23:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGtF-00052v-LA
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:49 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35360f7f-60db-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 01:06:48 +0200 (CEST)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-429da8b5feaso13144605e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:48 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:45 -0700 (PDT)
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
X-Inumbo-ID: 35360f7f-60db-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368007; x=1724972807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=04R2tozSLk4UY2KQvXd1YOljv9lem5MX3oYM5xelDrU=;
        b=Go3pnA3IJPCAUr4/jE0eBz6wuNTqt4OHgIztAquFdtTn8NnK4d3W3V+00dd0SUWiDD
         b07kBFp7z0yRiK/QgGKUuD/VhOOMWJzcswN2ShpXZrgZcFoLtXK8sZDFeWcWnDJVjPwL
         bpkpCazN5fOwKccvjnsQmzHsJWSvpnpEH2Pk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368007; x=1724972807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=04R2tozSLk4UY2KQvXd1YOljv9lem5MX3oYM5xelDrU=;
        b=gAvru6LJGDkACBVHcbEPO2JAVZ4CQfJwwPT6V7rOqxMEBsdXugGO9fYc1eGI07GMB6
         yBO2YwVhYGHXN7k1jwnC1oMtmGdj+8nlXIfYL0JLI7ZgjG2HAqM2VuPfOYqKGjMiQhyA
         JnNn0QHzW7+nLQY4oEP7P3gW8K4qS51oEruLl8nxd+OH4nXV0BuKFan8TuMjIcgEglZY
         eTAiPrI71dbvSKhe7Q4wNipQKgwrnC3j5e25azEzXi0u3ZXrfN5IOjZeY4R2vVJM0X2h
         HxaZIm7i0J/rgFPrvR97lIu9gvTcjvVwYXblfLCkpZo5UTiXLfGvE/s6Z8FYL4a/sBYQ
         ybEA==
X-Gm-Message-State: AOJu0YxIel9F4X9QdQgREEmUqPIOOCm2RsHT01wWV9VSTM4SsVxDvvGG
	6M1mEVPYrQL3NFPqVzYjUKivWRxJauhMctk95lVv3hWslqKmllRpq8VA48hk0IIg5av/uBOmkOZ
	4
X-Google-Smtp-Source: AGHT+IHio/DKBV8jaKHOLljzZuYgJ+o3P9U5Tg3vcUpxjvZ+92Kcr0GWV4YmOYv7acgAE63q6nqrIQ==
X-Received: by 2002:a5d:404e:0:b0:368:6f64:307c with SMTP id ffacd0b85a97d-37311855fbdmr188983f8f.15.1724368006329;
        Thu, 22 Aug 2024 16:06:46 -0700 (PDT)
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
Subject: [PATCH 7/9] xen/bitops: Implement hweight64() in terms of hweightl()
Date: Fri, 23 Aug 2024 00:06:33 +0100
Message-Id: <20240822230635.954557-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and drop generic_hweight64().

This is identical on all architectures except ARM32.  Add one extra SELF_TEST
to check that hweight64() works when the input is split in half.

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
 xen/arch/arm/include/asm/bitops.h |  1 -
 xen/arch/ppc/include/asm/bitops.h |  1 -
 xen/arch/x86/include/asm/bitops.h |  1 -
 xen/common/bitops.c               |  3 +++
 xen/include/xen/bitops.h          | 26 ++++++++------------------
 5 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 91cd167b6bbb..bed6b3b98e08 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -84,7 +84,6 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
  *
  * The Hamming Weight of a number is the total number of bits set in it.
  */
-#define hweight64(x) generic_hweight64(x)
 #define hweight32(x) generic_hweight32(x)
 
 #endif /* _ARM_BITOPS_H */
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 64512e949530..24dc35ef644d 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -132,7 +132,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
  *
  * The Hamming Weight of a number is the total number of bits set in it.
  */
-#define hweight64(x) __builtin_popcountll(x)
 #define hweight32(x) __builtin_popcount(x)
 
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 4c5b21907a64..9d3a2448036e 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -481,7 +481,6 @@ static always_inline unsigned int arch_flsl(unsigned long x)
  *
  * The Hamming Weight of a number is the total number of bits set in it.
  */
-#define hweight64(x) generic_hweight64(x)
 #define hweight32(x) generic_hweight32(x)
 
 #endif /* _X86_BITOPS_H */
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index d0c268b4994a..f6a3eb5c9daf 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -117,6 +117,9 @@ static void __init test_hweight(void)
 
     CHECK(hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
     CHECK(hweightl, -1UL, BITS_PER_LONG);
+
+    /* unsigned int hweight64(uint64_t) */
+    CHECK(hweight64, -1ULL, 64);
 }
 
 static void __init __constructor test_bitops(void)
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 11a1c9130722..e97516552a2e 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -302,6 +302,14 @@ static always_inline __pure unsigned int hweightl(unsigned long x)
 #endif
 }
 
+static always_inline __pure unsigned int hweight64(uint64_t x)
+{
+    if ( BITS_PER_LONG == 64 )
+        return hweightl(x);
+    else
+        return hweightl(x >> 32) + hweightl(x);
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
@@ -389,24 +397,6 @@ static inline unsigned int generic_hweight32(unsigned int w)
     return (w + (w >> 16)) & 0xff;
 }
 
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


