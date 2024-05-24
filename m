Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EAD8CEAA9
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729754.1135089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8v-0001DE-Sh; Fri, 24 May 2024 20:03:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729754.1135089; Fri, 24 May 2024 20:03:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8v-000199-7g; Fri, 24 May 2024 20:03:57 +0000
Received: by outflank-mailman (input) for mailman id 729754;
 Fri, 24 May 2024 20:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8t-000773-H2
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:55 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bef910bf-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:53 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a626ac4d299so130919566b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:53 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:52 -0700 (PDT)
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
X-Inumbo-ID: bef910bf-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581033; x=1717185833; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maIVB65jYfI2PBFJy7D4AeslonYmTipzI0EBcOkzwDs=;
        b=sSaqMABUIPyLRyf6r687lQ1thueAYWaRJs9DlJbq1+yOmHENekFQ5FZxIjxyrcfHNx
         KALPRB72LhM1GdiCsX6lpwPPn34KK8kfSogSWTy0sVhA5Ah1KC036viIFktdANOwxTvZ
         rZ6kbdfncTnc3a4aG8YxUuLnB4r0gCDQR4NLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581033; x=1717185833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=maIVB65jYfI2PBFJy7D4AeslonYmTipzI0EBcOkzwDs=;
        b=JdUk45ey20tgqN1zew/P3VN/7TswOr+gKjxheoc5R10b/XI1Qyn05qF3vs8kSf1/7y
         jqweRteMzvxiaKoyoMJWfgK7neDZnOTzezNFKzIhw+KdqOZoLRpESnjjz0FXr94+40Vh
         R2RUptBq2dQfa/7rTgIDagcHJfV24ei/bgwU9Ui+32m0DoCxW1PwoSRMD9B0oKsnoCka
         wEz+b3c3CvdgSmijIghoOLqPUUFvG6Wtt6BAKUaECU6aUzs2uitbwo9OxK6VIuzDJdYO
         1eR73iuqXU3KNE5iA1DYqyVhUAGuYbb5YCxQ3W0ErrsWTBzA8upIVq9VlyTJUA/EvweM
         J0Jw==
X-Gm-Message-State: AOJu0Yx0CtKp+Ohfix2xZqWEaJDjAWk2ruhfkPAp33QdSBuZ3vianH1L
	ASKNj955FW7FgF/RIy6SnIYSCOP4XGxlj+uHKOXpmvQFwOnSvaRqSw0eMhf0CxG83/ghGMvDOlu
	v+yU=
X-Google-Smtp-Source: AGHT+IHQSVGsB2hFnOlOMuOQReZaremOY3IsH9dioCeOBypWLpouROaY+1nCR6o1hiTm3xLeTealKA==
X-Received: by 2002:a17:906:c44c:b0:a5a:3a6c:8b56 with SMTP id a640c23a62f3a-a6264179f89mr213603866b.11.1716581033309;
        Fri, 24 May 2024 13:03:53 -0700 (PDT)
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
Subject: [PATCH v2 10/13] xen/bitops: Delete find_first_set_bit()
Date: Fri, 24 May 2024 21:03:35 +0100
Message-Id: <20240524200338.1232391-11-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
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

v2:
 * Reorder from later in the series to keep ARM bisectable
---
 xen/arch/arm/include/asm/bitops.h |  9 ---------
 xen/arch/ppc/include/asm/bitops.h |  9 ---------
 xen/arch/x86/include/asm/bitops.h | 12 ------------
 3 files changed, 30 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index ba39802c9de3..d30ba44598e3 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -160,15 +160,6 @@ static inline int fls(unsigned int x)
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
 
-/**
- * find_first_set_bit - find the first set bit in @word
- * @word: the word to search
- *
- * Returns the bit-number of the first set bit (first bit being 0).
- * The input must *not* be zero.
- */
-#define find_first_set_bit(w) (ffsl(w) - 1)
-
 /**
  * hweightN - returns the hamming weight of a N-bit word
  * @x: the word to weigh
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index ce0f6436f727..761361291e6f 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -187,13 +187,4 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
 #define hweight16(x) __builtin_popcount((uint16_t)(x))
 #define hweight8(x)  __builtin_popcount((uint8_t)(x))
 
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
index 51d3c0f40473..830e488f33a0 100644
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
 static always_inline unsigned int arch_ffs(unsigned int x)
 {
     unsigned int r;
-- 
2.30.2


