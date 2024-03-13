Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5092287AD2F
	for <lists+xen-devel@lfdr.de>; Wed, 13 Mar 2024 18:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.692675.1080066 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSO5-0003QE-9d; Wed, 13 Mar 2024 17:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 692675.1080066; Wed, 13 Mar 2024 17:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkSO5-0003MV-3z; Wed, 13 Mar 2024 17:27:33 +0000
Received: by outflank-mailman (input) for mailman id 692675;
 Wed, 13 Mar 2024 17:27:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M9/O=KT=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1rkSO2-00023P-Se
 for xen-devel@lists.xenproject.org; Wed, 13 Mar 2024 17:27:30 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8401d88-e15e-11ee-afdd-a90da7624cb6;
 Wed, 13 Mar 2024 18:27:30 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-513cc23b93aso134352e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 13 Mar 2024 10:27:30 -0700 (PDT)
Received: from andrewcoop.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 f15-20020a170906048f00b00a42ee62b634sm5005732eja.106.2024.03.13.10.27.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 10:27:28 -0700 (PDT)
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
X-Inumbo-ID: f8401d88-e15e-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710350849; x=1710955649; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=33TXDSAxPDO8bnXw5DlUbCOINftbDhFb4uNtskElrXY=;
        b=GQDGzq70NgXh8q66UCQMVnMT511HyPobC7cKbWr7LRG7LUyTtuOIGe4JUrdclFzeCr
         HjS2wRh9DvXQZKzgNCfbAmtx1X1tfMwyFn7DKcEmkXCKjMJYfIxMFY3LMdhxSl/1tCfM
         qkyTiQgr447cwrJDYlCt8nj0aktwFfmcUGZTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710350849; x=1710955649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=33TXDSAxPDO8bnXw5DlUbCOINftbDhFb4uNtskElrXY=;
        b=v0jz6G5XE+Fgj3mJKismko8oY4a+v7uTCtKGd7o8+bGtbS2omd09yawy/TIZwU6Zhg
         SrHXl65PgUS8B9pzMiXsnVLaO0SFCDdV1BjNnaBJv6/pfMSbGvA5Xp6AiRqVPLyq2rmU
         QNDlkXm+MKGa7Cag0g9OnQ/sxJYxDWm+T8JVBrjiRPJZrYdfgMLhb7LBEhKfyRdoykyE
         SQAo81vOfnLFKauNNjHbMq/4bEXTns3P6Mkl1BqF5Z5eKza7oXXBOVTLLfAOtU3wGkv6
         fJrmapDvP7/OJ7IlhdRw8vRL4c8VSMy9+z9c6e2ztSyli0FImnj81h7wpBoVXR4IG1NU
         +HIw==
X-Gm-Message-State: AOJu0YwmQrUQ25pxf008pYpjHwGnLYPdiy2UEDxofqwJ1coMxTHyWs+G
	xxywgzzPP74WKUjr/a0hn1CKO7cVX/UuMJqAMHu2T3VQVrm6XXuVfqic3F+NCwuIhgP3oAOlSi4
	i
X-Google-Smtp-Source: AGHT+IH+wJrXbeahOJLqrDjcYaBZ9zU2I/cXRNPjMfx4C/xQoBg042rLDW5ZSKpV7udLszZCL7H5+w==
X-Received: by 2002:a05:6512:239f:b0:513:b8c7:7ecc with SMTP id c31-20020a056512239f00b00513b8c77eccmr3385947lfv.60.1710350849218;
        Wed, 13 Mar 2024 10:27:29 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 7/7] xen/bitops: Delete find_first_set_bit()
Date: Wed, 13 Mar 2024 17:27:16 +0000
Message-Id: <20240313172716.2325427-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
References: <20240313172716.2325427-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

No more users.

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
CC: consulting@bugseng.com <consulting@bugseng.com>
CC: Simone Ballarin <simone.ballarin@bugseng.com>
CC: Federico Serafini <federico.serafini@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/arch/arm/include/asm/bitops.h | 12 ------------
 xen/arch/ppc/include/asm/bitops.h |  9 ---------
 xen/arch/x86/include/asm/bitops.h | 12 ------------
 3 files changed, 33 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 59ae8ed150b6..5104334e4874 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -160,18 +160,6 @@ static inline int fls(unsigned int x)
 #define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
 #define arch_ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
 
-/**
- * find_first_set_bit - find the first set bit in @word
- * @word: the word to search
- *
- * Returns the bit-number of the first set bit (first bit being 0).
- * The input must *not* be zero.
- */
-static inline unsigned int find_first_set_bit(unsigned long word)
-{
-        return ffsl(word) - 1;
-}
-
 /**
  * hweightN - returns the hamming weight of a N-bit word
  * @x: the word to weigh
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index ecec2a826660..989d341a44c7 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -206,13 +206,4 @@ static always_inline unsigned long __ffs(unsigned long word)
     return __builtin_ctzl(word);
 }
 
-/**
- * find_first_set_bit - find the first set bit in @word
- * @word: the word to search
- *
- * Returns the bit-number of the first set bit (first bit being 0).
- * The input must *not* be zero.
- */
-#define find_first_set_bit(x) (ffsl(x) - 1)
-
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 99342877e32f..2835bb6814d5 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -401,18 +401,6 @@ static always_inline unsigned int __scanbit(unsigned long val, unsigned int max)
     r__;                                                                    \
 })
 
-/**
- * find_first_set_bit - find the first set bit in @word
- * @word: the word to search
- * 
- * Returns the bit-number of the first set bit. The input must *not* be zero.
- */
-static inline unsigned int find_first_set_bit(unsigned long word)
-{
-    asm ( "rep; bsf %1,%0" : "=r" (word) : "rm" (word) );
-    return (unsigned int)word;
-}
-
 static inline unsigned int arch_ffs(unsigned int x)
 {
     int r = -1;
-- 
2.30.2


