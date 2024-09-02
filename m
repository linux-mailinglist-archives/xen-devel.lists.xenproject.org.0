Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1354F968409
	for <lists+xen-devel@lfdr.de>; Mon,  2 Sep 2024 12:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.787720.1197175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3um-0006xs-5l; Mon, 02 Sep 2024 10:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 787720.1197175; Mon, 02 Sep 2024 10:04:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sl3um-0006sg-2O; Mon, 02 Sep 2024 10:04:04 +0000
Received: by outflank-mailman (input) for mailman id 787720;
 Mon, 02 Sep 2024 10:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qspk=QA=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sl3uk-0006eE-UK
 for xen-devel@lists.xenproject.org; Mon, 02 Sep 2024 10:04:02 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad4a6cf7-6912-11ef-99a1-01e77a169b0f;
 Mon, 02 Sep 2024 12:04:01 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a868b8bb0feso487901966b.0
 for <xen-devel@lists.xenproject.org>; Mon, 02 Sep 2024 03:04:01 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89940980a1sm480884466b.47.2024.09.02.03.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 03:03:58 -0700 (PDT)
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
X-Inumbo-ID: ad4a6cf7-6912-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1725271440; x=1725876240; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRCg1jmfHpSD6hMA8JKfMrJcYE4/mnPcXDrT1M87yqg=;
        b=roxhjGIx5FnGJrbBtR7yhAvkr7JcX/GzxDIieaVVL3uulT2aslwRVZ9A6M5k/dhubH
         ms4iaAg3rHSes/kZWt3hF2e0vwSLPjcxp/EbCKYOFqWTIhdU16Kp8+qT5KocKN+M6UX5
         hr69D5WmXGmNgzbIvW/bpJ76gA+onEnZtV54k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725271440; x=1725876240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pRCg1jmfHpSD6hMA8JKfMrJcYE4/mnPcXDrT1M87yqg=;
        b=mJui+PpOf4RmYRlcbyL9aNyhzR1Dq4hSnBMsd54bAbU+U0LhGh+JdDF0kC5lUVKRb+
         Pci8wnSkXOjPrxojy83TCKMSaBfsszvj8oxHTtunabnfE00wsg73Q4rhUoG/eN1GHhxB
         GBsdXxla2Se0HcPzLYYBZ3i9qU9RFrlaxsXr6J5Q+wRI8gb0IXUoGIwz7PdYULZLn2E3
         6LiWBFnYpO8cT0SWCyRntA8JoDKCLy4Hy0jD7JigBS/EosCcc4PZN3k12iZT4RnbsTl1
         qvMDiB+9B7T3R3tpacl/l+UHGGZtB4u0GpDvvr6rY+/9zABWVNCKXhJ9PDyMM9j4nnd6
         d2qw==
X-Gm-Message-State: AOJu0YzBl4depcmuoFINdprwP/mIs/fAi1IMajFIxGy1Pr9y8UpORqRN
	yai+C1MnMu9sSZCuQnyIsFd0f49VO39CUQS/iuDieB1zWSELTWZ2FtNwbBP0lnixKtJ/Gdtlp+F
	N
X-Google-Smtp-Source: AGHT+IFreOakxtGzLSflAWXa8o17fcyXgFRjPUaWE5bEzrt13N5mu9ClmkqD/rw9EBWuWbiBwz0NMA==
X-Received: by 2002:a17:906:478c:b0:a86:6fa8:c6a3 with SMTP id a640c23a62f3a-a89a36d084dmr603286466b.39.1725271439406;
        Mon, 02 Sep 2024 03:03:59 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 1/4] ARM/div: Drop __div64_fls()
Date: Mon,  2 Sep 2024 11:03:52 +0100
Message-Id: <20240902100355.3032079-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
References: <20240902100355.3032079-1-andrew.cooper3@citrix.com>
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
-- 
2.39.2


