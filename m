Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E31D596CA9B
	for <lists+xen-devel@lfdr.de>; Thu,  5 Sep 2024 00:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790820.1200613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyud-00022x-0W; Wed, 04 Sep 2024 22:55:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790820.1200613; Wed, 04 Sep 2024 22:55:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slyuc-0001zg-Qq; Wed, 04 Sep 2024 22:55:42 +0000
Received: by outflank-mailman (input) for mailman id 790820;
 Wed, 04 Sep 2024 22:55:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EFI/=QC=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1slyua-0001Vf-L5
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 22:55:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cde1f527-6b10-11ef-99a1-01e77a169b0f;
 Thu, 05 Sep 2024 00:55:39 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-5c09fd20eddso169692a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 15:55:39 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a679755b3sm21546166b.146.2024.09.04.15.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 15:55:35 -0700 (PDT)
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
X-Inumbo-ID: cde1f527-6b10-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725490538; x=1726095338; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n1i07dEr5xjoYZGp4+3iu4w7N+mO8cikgWiOPeIxB34=;
        b=HBrQW0Ucc8kdRydaiwxvOAMI4sODI+Ijlhrne5/KjYIgtyJJV/ojhIlcJTJCio0wwb
         Th24cl5PvXcUNH+dZuKBTjvf7uKKIQzihg4p1OAVGcCQ0ZgAI7GFnmsNn72YtnH45SLj
         oLRPWShDysusgLmOOo4DdhgeiMklBUrMjhHkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725490538; x=1726095338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n1i07dEr5xjoYZGp4+3iu4w7N+mO8cikgWiOPeIxB34=;
        b=QpbAhWQz30n73oZ0ROoXgVmTYK5ikjU3nn6L68ciMgfUxYShWsdoC3DvR6H4ITaVde
         MfzcsGNlFss6W7lO52Xf9IAmWrU4wV4J9gZA7mCfHEG6MsUU66ynH8CaGabxJxfEUFjl
         LewJN6KaAicPqD9mO2+L6Spt+RB8EI4ZMo8IwZjI/bwueKOMqPm+wjZr25Ck+KDJAlxy
         BoxKcSf1PcMzYzjDug3/Rd6T+oHguhMQED8U5PzzsnqOFX3KPeuzAE/wh1OAAAouf+eH
         wc6FcXovQh9z1DctCUQbcZfaZ0CrWhra0jTEyFQu59khNmWR8dj9L+Wm2NjtAntm8Sv3
         fTgg==
X-Gm-Message-State: AOJu0Ywg9LYOArvSLX8mf6UfksAZSO4qLprYoV0Ks2f6K94ACrFIiHiu
	Pbv9KQbZ7LBqH5DzlYnetZ+kotbwvMnozTEtDeo/RcpaidnKSQ97hQfUAu1FFjBehDqw80jRtSP
	o
X-Google-Smtp-Source: AGHT+IGmD25QJYk6ymyce2efzSO/kxV6Ds+Iw/QZfDQRrhmzCGhKgvvxhkQ9tc8SBF+0sjO2Cyq1Ug==
X-Received: by 2002:a17:907:3fa9:b0:a86:4649:28e6 with SMTP id a640c23a62f3a-a897fad290emr1957484366b.57.1725490537574;
        Wed, 04 Sep 2024 15:55:37 -0700 (PDT)
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
Subject: [PATCH v3 2/5] xen/bitops: Drop the remnants of hweight{8,16}()
Date: Wed,  4 Sep 2024 23:55:27 +0100
Message-Id: <20240904225530.3888315-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
References: <20240904225530.3888315-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They are no more.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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
---
 xen/arch/arm/include/asm/bitops.h |  2 --
 xen/arch/ppc/include/asm/bitops.h |  2 --
 xen/arch/x86/include/asm/bitops.h |  2 --
 xen/include/xen/bitops.h          | 17 -----------------
 4 files changed, 23 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 3c023103f734..91cd167b6bbb 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -86,8 +86,6 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
  */
 #define hweight64(x) generic_hweight64(x)
 #define hweight32(x) generic_hweight32(x)
-#define hweight16(x) generic_hweight16(x)
-#define hweight8(x) generic_hweight8(x)
 
 #endif /* _ARM_BITOPS_H */
 /*
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 6e4e112b8b92..64512e949530 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -134,7 +134,5 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
  */
 #define hweight64(x) __builtin_popcountll(x)
 #define hweight32(x) __builtin_popcount(x)
-#define hweight16(x) __builtin_popcount((uint16_t)(x))
-#define hweight8(x)  __builtin_popcount((uint8_t)(x))
 
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 8c0403405aa2..4c5b21907a64 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -483,7 +483,5 @@ static always_inline unsigned int arch_flsl(unsigned long x)
  */
 #define hweight64(x) generic_hweight64(x)
 #define hweight32(x) generic_hweight32(x)
-#define hweight16(x) generic_hweight16(x)
-#define hweight8(x) generic_hweight8(x)
 
 #endif /* _X86_BITOPS_H */
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 6f8e36f1c755..58c600155f7e 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -413,23 +413,6 @@ static inline unsigned int generic_hweight32(unsigned int w)
     return (w + (w >> 16)) & 0xff;
 }
 
-static inline unsigned int generic_hweight16(unsigned int w)
-{
-    w -= ((w >> 1) & 0x5555);
-    w =  (w & 0x3333) + ((w >> 2) & 0x3333);
-    w =  (w + (w >> 4)) & 0x0f0f;
-
-    return (w + (w >> 8)) & 0xff;
-}
-
-static inline unsigned int generic_hweight8(unsigned int w)
-{
-    w -= ((w >> 1) & 0x55);
-    w =  (w & 0x33) + ((w >> 2) & 0x33);
-
-    return (w + (w >> 4)) & 0x0f;
-}
-
 static inline unsigned int generic_hweight64(uint64_t w)
 {
     if ( BITS_PER_LONG < 64 )
-- 
2.39.2


