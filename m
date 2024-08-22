Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8609A95C142
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782006.1191509 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtD-0005sn-Va; Thu, 22 Aug 2024 23:06:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782006.1191509; Thu, 22 Aug 2024 23:06:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtD-0005n7-QL; Thu, 22 Aug 2024 23:06:47 +0000
Received: by outflank-mailman (input) for mailman id 782006;
 Thu, 22 Aug 2024 23:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGtC-00052v-K0
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:46 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3371b277-60db-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 01:06:45 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a86984e035aso130619766b.2
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:45 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:42 -0700 (PDT)
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
X-Inumbo-ID: 3371b277-60db-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368004; x=1724972804; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z32VSiikSGXLFKmdcP1zMNdlkMYVkQVHFcaYHWzqH0I=;
        b=bTj2R2eBRNsDxvMlENtJm2nUIzV/d/FdqWcoOYH7NugUyK0aB5LCmZ3zsnoOAM0Gvp
         RsZkdMi5tHeey/yC9js/aR/IE4npPB4hqLBjSRb4utOEvJtxPrlLEXEm6aambgif6wwc
         l5hT3usa4qyncQS0iI4Cet2HXdeLgN6cCmaaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368004; x=1724972804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z32VSiikSGXLFKmdcP1zMNdlkMYVkQVHFcaYHWzqH0I=;
        b=EmCzYAsHYR3mEuaNXcKvo8sC6owAEsXlte/84TdJQ9NqAASZj/vZsT7neGtduoGVdi
         UFrwigWwAI/koPomeLNVx7EnUBJjX7QrDCoYOJQ31sTNZ0SGtE5ZG3IUlEHjVaurMSkP
         NCpaF16ken/CECD0vwg5Dy4FdB8jn3zaheYnTbErCnGFywVB1OagoyZvDP9OIf+A/hr8
         jUyBsQmIhrBAnA9wJR2Y+3bLMzzAl2g8VDkyTUOBGcjDx2ex9C9zXyWnPNkjii8R6Jgv
         AY89O22NbTLymQFfde5UJ0QxbWjrGbVQ1RzsTh6BpGCTWkHBHmkfc6YkD3+4QvCYBjQM
         KNEQ==
X-Gm-Message-State: AOJu0YztvEZLOCKCN49xC8yHwFZgXizDgrFO6YmxW4ShYtFsywON/2fa
	PRWSw2Kb1vZhjTSAVOMNhXOm00ZzyS4+EyiJ8EQDLGn2rbBHos72SqDG8Su3lLxrWaYKqqrIhWo
	I
X-Google-Smtp-Source: AGHT+IFRDX/W4UY1H3WUEVSmOJeaLU8RAXCjyi52CvapXkXlmfnP6gHsMAgaeNOhzlOkCzNZeD3hMw==
X-Received: by 2002:a17:906:9c82:b0:a86:96b3:86be with SMTP id a640c23a62f3a-a86a54b70d3mr14312866b.63.1724368003385;
        Thu, 22 Aug 2024 16:06:43 -0700 (PDT)
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
Subject: [PATCH 4/9] xen/bitops: Drop the remnants of hweight{8,16}()
Date: Fri, 23 Aug 2024 00:06:30 +0100
Message-Id: <20240822230635.954557-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

They are no more, and won't be returning in this form.

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
index eb3355812ea3..a62c4f99c3bb 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -132,7 +132,5 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
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
index 74c0d04e6647..64d70a7a1cb5 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -371,23 +371,6 @@ static inline unsigned int generic_hweight32(unsigned int w)
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


