Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9407196345F
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785172.1194658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlw-0000GM-UL; Wed, 28 Aug 2024 22:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785172.1194658; Wed, 28 Aug 2024 22:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlw-0000DJ-Ql; Wed, 28 Aug 2024 22:04:12 +0000
Received: by outflank-mailman (input) for mailman id 785172;
 Wed, 28 Aug 2024 22:04:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlu-0006E8-U2
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:10 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 735b5ad8-6589-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 00:04:09 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5a108354819so9317577a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:09 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:04:05 -0700 (PDT)
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
X-Inumbo-ID: 735b5ad8-6589-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882648; x=1725487448; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+a9rZjwjT4T/KMzHim0E6pRI1Xb37U68VQt9wRm391Y=;
        b=b/lenRI932SyEytxCAFEiO/qsUMJQcj46yK/2EQwJV5yqOiR4EfYhmBFIUvNGcNERG
         uJ1yO725B4mqWpd2WorZFUuLsOjeCfPq0bBp/mPW7olusr7UpKTfgIf9dDVjUByXqDx7
         Ba61YuBnA8xLFcCSQT+7LZHwjVPopcpjTBd/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882648; x=1725487448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+a9rZjwjT4T/KMzHim0E6pRI1Xb37U68VQt9wRm391Y=;
        b=YKHg9Aain2ThG+UogaAxRg+bjMXfbWFsu2HDKDRvJplSmD7OqR5yfrLS59SeVhnbIc
         iwu36hPf9h1yifargx9fmWpQpdB3mmOuDnx5MbKcD/XiE1UhC1gCOCIX12d31H97AS/5
         JtCeAG+bryp6aTIPqYMIf3EtT6K1GPEO20RPY2cAr2PxlMB5vuF5f+U5jn6j29RYhUnn
         i3DBJay4rI5/B6Y2B5mJ6AUQsez9y2vvBHJl+9fMwf74CEkzexf1pbGW2Fx+U18ibXJD
         vEnac9DNCxBY3z4XM8MKXRiu3Gy89JF5oFJV6M8FdE6lBqJVUW29tH4/0zORbiysg2S4
         27Pg==
X-Gm-Message-State: AOJu0YzXKkhqB9ejgcm1yKZHKeniB9pHZu+VgO/2vpvRJjKC8/xBfotM
	zOVHzGf1K53hnUYhxOKhPnd3YaRw5u4VZqaSzk6+6yeS09/ygecOCRb2hArcL9QwbI9KH6EB0I/
	e
X-Google-Smtp-Source: AGHT+IE3qOrSiwEVqCW9Hnp03aRaF70/QvtqPk4oYtkklqTrDEe2lMIHKCK2PJjCz4Asj6oY3RjTrQ==
X-Received: by 2002:a05:6402:40c1:b0:5c2:17b7:5a7e with SMTP id 4fb4d7f45d1cf-5c21ed9fcbcmr609830a12.36.1724882647591;
        Wed, 28 Aug 2024 15:04:07 -0700 (PDT)
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
Subject: [PATCH v2 09/11] xen/bitops: Implement hweight32() in terms of hweightl()
Date: Wed, 28 Aug 2024 23:03:49 +0100
Message-Id: <20240828220351.2686408-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... and drop generic_hweight32().

As noted previously, the only two users of hweight32() are in __init paths.

The int-optimised form of generic_hweight() is only two instructions shorter
than the long-optimised form, and even then only on architectures which lack
fast multiplication, so there's no point providing an int-optimised form.

No functional change.

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

v2:
 * Reorder with respect to the hweight64() patch
 * Rerwrite the commit message
 * s/__pure/attr_const/
---
 xen/arch/arm/include/asm/bitops.h | 1 -
 xen/arch/ppc/include/asm/bitops.h | 1 -
 xen/arch/x86/include/asm/bitops.h | 1 -
 xen/include/xen/bitops.h          | 5 +++++
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 91cd167b6bbb..b28c25b3d52d 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -85,7 +85,6 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
  * The Hamming Weight of a number is the total number of bits set in it.
  */
 #define hweight64(x) generic_hweight64(x)
-#define hweight32(x) generic_hweight32(x)
 
 #endif /* _ARM_BITOPS_H */
 /*
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 64512e949530..f488a7c03425 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -133,6 +133,5 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
  * The Hamming Weight of a number is the total number of bits set in it.
  */
 #define hweight64(x) __builtin_popcountll(x)
-#define hweight32(x) __builtin_popcount(x)
 
 #endif /* _ASM_PPC_BITOPS_H */
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 4c5b21907a64..507b043b8a86 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -482,6 +482,5 @@ static always_inline unsigned int arch_flsl(unsigned long x)
  * The Hamming Weight of a number is the total number of bits set in it.
  */
 #define hweight64(x) generic_hweight64(x)
-#define hweight32(x) generic_hweight32(x)
 
 #endif /* _X86_BITOPS_H */
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 58c600155f7e..a462c3065158 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -326,6 +326,11 @@ static always_inline attr_const unsigned int hweightl(unsigned long x)
 #endif
 }
 
+static always_inline attr_const unsigned int hweight32(uint32_t x)
+{
+    return hweightl(x);
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
-- 
2.39.2


