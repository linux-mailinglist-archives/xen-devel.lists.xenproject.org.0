Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D2960907
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 13:40:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.783866.1193159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuYY-0002tW-2v; Tue, 27 Aug 2024 11:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 783866.1193159; Tue, 27 Aug 2024 11:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1siuYX-0002qy-V7; Tue, 27 Aug 2024 11:40:13 +0000
Received: by outflank-mailman (input) for mailman id 783866;
 Tue, 27 Aug 2024 11:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ovuO=P2=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1siuYX-0002qs-Bd
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 11:40:13 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1e26772a-6469-11ef-99a0-01e77a169b0f;
 Tue, 27 Aug 2024 13:40:11 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5bed83488b3so6259225a12.0
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 04:40:11 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e5484ff7sm98682366b.45.2024.08.27.04.40.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2024 04:40:09 -0700 (PDT)
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
X-Inumbo-ID: 1e26772a-6469-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724758810; x=1725363610; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RDmZvKQ6fjiLWHIUIGLrzY14fFzTra7oQYlpHWiCvvQ=;
        b=u6yxaSSID14d2DyB9WyRCdvVsB++9DNfLtt2VPfUrmopL8CYd7AgXnAtDVMMPWJbLi
         FKSnGNVhDqFwwIhFwF0p7GYqmwcDwkBYP9+gd7ySPXJRNLUzRuCCzWhfCxtD8AnqRPt8
         OiwO9Zmikt7QmE32yN3mYsxxqZZ5l4UwWxGhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724758810; x=1725363610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RDmZvKQ6fjiLWHIUIGLrzY14fFzTra7oQYlpHWiCvvQ=;
        b=SVH91yV1Qkd5lV0+iXuptFjmNhZJ7P77IijVMXQiNL8JKfNTQDBr0tSJxhWNVH+6Zb
         Suazoj5FxtDM8YRC5gg6Ad4FvwqFuER+uxhgIJrkdWnEB5Bx+HVVnEaEIMOKMnvkX5ni
         DY85zyM47GzE58lDV4ZblVteUBS+hg+ws/sskTB9uJQqppzf1Hdl0RiR+FEOiNIiewAz
         g3eloSV54SUfdPC5nXIinShAS8BIV7rQvTY5zuSihndR2EHJznMa4cYWcjmZ5o8CRKEA
         bkgWBF4bpIRfD5Zx9EqG23anbHHT1i8TK5OwoMBUbWRhkX2oA62vriYnGooeY+nQ5Q2y
         AIMQ==
X-Gm-Message-State: AOJu0Yw9fnuhS2RWSnUuTv5DymLOOyYx0QDvAOJcvvRgNmEFC4iSt657
	Ahcsl48ELpZzJdAW7Gbh5gVxUQQhY4wrU0ZmxQEeOfqjp7Up4RLbfx5fmNkM4LKSCTqyJKJbhbd
	2
X-Google-Smtp-Source: AGHT+IHhou3lu8mGOt542ce9wqfSxSoeBy93QDNjsmKOcFUCIKJO3nCYgDIwtrHrSegpg+fVh0Glag==
X-Received: by 2002:a17:907:da2:b0:a86:a73e:7ec9 with SMTP id a640c23a62f3a-a86a73e81ffmr955395866b.46.1724758809974;
        Tue, 27 Aug 2024 04:40:09 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH] xen/ARM: Drop __div64_fls()
Date: Tue, 27 Aug 2024 12:40:07 +0100
Message-Id: <20240827114007.1886130-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following the improvements to Xen's bitops, fls() does constant propagation in
all cases.  Use it, and drop the local opencoded helper.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>

ARM32 gets a very minor code generation improvement:

  xen.git/xen$ ../scripts/bloat-o-meter xen-syms-arm32-{before,after}
  add/remove: 0/0 grow/shrink: 0/6 up/down: 0/-48 (-48)
  Function                                     old     new   delta
  wallclock_time                               288     280      -8
  printk_start_of_line                         560     552      -8
  domain_vtimer_init                           472     464      -8
  do_settime                                   376     368      -8
  burn_credits                                 760     752      -8
  __printk_ratelimit                           424     416      -8

But it's just a couple of operations improvement and no real change in code
structure.  I expect that the constant propagation being done through
__builtin_clz(), rather than pure C, is giving the optimiser a bit more
information to work with.

This file also has an __GNUC__ < 4 case which seems ripe for removing...
---
 xen/arch/arm/include/asm/div64.h | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/div64.h b/xen/arch/arm/include/asm/div64.h
index 0459d5cc0122..da1f1fcbd503 100644
--- a/xen/arch/arm/include/asm/div64.h
+++ b/xen/arch/arm/include/asm/div64.h
@@ -102,7 +102,7 @@
 		/* preserve low part of n for reminder computation */	\
 		__r = __n;						\
 		/* determine number of bits to represent __b */		\
-		__p = 1 << __div64_fls(__b);				\
+		__p = 1 << fls(__b);					\
 		/* compute __m = ((__p << 64) + __b - 1) / __b */	\
 		__m = (~0ULL / __b) * __p;				\
 		__m += (((~0ULL % __b + 1) * __p) + __b - 1) / __b;	\
@@ -150,8 +150,8 @@
 				__p /= (__m & -__m);			\
 				__m /= (__m & -__m);			\
 			} else {					\
-				__p >>= __div64_fls(__bits);		\
-				__m >>= __div64_fls(__bits);		\
+				__p >>= fls(__bits);			\
+				__m >>= fls(__bits);			\
 			}						\
 			/* No correction needed. */			\
 			__c = 0;					\
@@ -217,18 +217,6 @@
 	__r;								\
 })
 
-/* our own fls implementation to make sure constant propagation is fine */
-#define __div64_fls(bits)						\
-({									\
-	unsigned int __left = (bits), __nr = 0;				\
-	if (__left & 0xffff0000) __nr += 16, __left >>= 16;		\
-	if (__left & 0x0000ff00) __nr +=  8, __left >>=  8;		\
-	if (__left & 0x000000f0) __nr +=  4, __left >>=  4;		\
-	if (__left & 0x0000000c) __nr +=  2, __left >>=  2;		\
-	if (__left & 0x00000002) __nr +=  1;				\
-	__nr;								\
-})
-
 #endif /* GCC version */
 
 #endif /* BITS_PER_LONG */

base-commit: b8cdfac2be38c98dd3ad0e911a3f7f787f5bcf6b
prerequisite-patch-id: 57ffe02b03d27a12f20d9e08fa21eed01c8c6299
prerequisite-patch-id: 56393fef18638a92eae127f36ffddb655fc7b9f4
prerequisite-patch-id: 4f963f44331104dc00663f8ff22bd306ef04f301
prerequisite-patch-id: 81a434352bbb36e17d3b7a45f489974fc4603ecb
prerequisite-patch-id: f2f2a00eee52f668b3f557fb6d357ec3bf00ac92
prerequisite-patch-id: 67b871715259e60fbf7db917233dbdecce6891da
prerequisite-patch-id: f8562e07c91fa42b1501efa759734a7874b9d909
prerequisite-patch-id: a5f304a67525412f0669a298a5f66285b56c3a58
prerequisite-patch-id: 6b5b1dc3f6760888a15c11cc658c52ba6fd3f33d
prerequisite-patch-id: 29eb6b854e9df37f5e8ed212215baab0ac7fbe87
prerequisite-patch-id: d87fe52c264dc5a33883a04b615043fbefd94f92
prerequisite-patch-id: 26a2978b861386fda945f1e60e9153cf0bdd24f3
prerequisite-patch-id: ab50b5247a29b4fbbd7207a558647dd3c57d5175
prerequisite-patch-id: 0f2a6cfa7d77c6f05f23c3aada161d02a9fc7660
prerequisite-patch-id: 7153c7bb3a45877fd84286dd9915046fa0a76056
prerequisite-patch-id: 74830838bac94ed1e036a8173cf3210a314b35d8
prerequisite-patch-id: 74a6e5ffb9f477afb61e73ed80a40c9359bc77a2
prerequisite-patch-id: 795f6e9425cc6a953166b530ae68df466a7a3c2b
prerequisite-patch-id: e37b1bc5dd69e7e68abf0e6c004431537f70175f
prerequisite-patch-id: 2e510b0a05df30c68bec8baf8b411a71e5f14d74
prerequisite-patch-id: e0397c86b545a1d65f2e6b2049c282b926c40c64
prerequisite-patch-id: 44606527ccbdf980a4c2401394f728f9c2011b8a
prerequisite-patch-id: 65b83839f7a477b9fa8e8913380e8eac2ac1ca0e
-- 
2.39.2


