Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA485963459
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785168.1194621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlq-0007U5-LV; Wed, 28 Aug 2024 22:04:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785168.1194621; Wed, 28 Aug 2024 22:04:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlq-0007Sc-An; Wed, 28 Aug 2024 22:04:06 +0000
Received: by outflank-mailman (input) for mailman id 785168;
 Wed, 28 Aug 2024 22:04:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlo-0006E0-Fb
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:04 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 702a4b3d-6589-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 00:04:04 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5c0abaae174so4210006a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:04 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:04:01 -0700 (PDT)
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
X-Inumbo-ID: 702a4b3d-6589-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882643; x=1725487443; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1d4T7bgcWZFGEOhnXIFX9rzTrMxxv0mMcntif1gRWqE=;
        b=rDw/v8bnzRTZHYzsgx9qQyUe+lDE7zoQbJXY3qfHCrH/mg8bbfkUd0Su/1Vu/0MNGg
         j0zR7Pib5OFCMbqvpBxVz8fH+MM8gC19U9Jt27euoeltoTuwOJVPxK3xtos5A8Q30ho0
         z4nwJ4qqNGLBjyvaYWxs0PgLPFSVcLyolk734=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882643; x=1725487443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1d4T7bgcWZFGEOhnXIFX9rzTrMxxv0mMcntif1gRWqE=;
        b=cql2E8ZC2XHcazHTP+ukJ/6zv42aBKEZDF9+RUsnxgF5rDCprgaL869n1M4XpWzIN1
         9Xiok5uktFD5X0KAzrkmDJbKtO13Qd2StZpZAfyMRa9m97LcJ6Eoantt7OQgje8W7oXG
         VLiAoYOju5VDpZ7BTORNGmshxp0VEPOXXs0PXVkeoWkkX4ei+7yCG07mlr/LNX6M4bRH
         JAXJvnXE3C1Xsxju0gZ+S6T4nhS/p/dYFNwTviJR6/UMxD1AvEY3j10znrF3FAIAe0Qv
         jR2rZKjlAdCTY7cSen0VRF21B/uN+FsJY+NRVl0AAmF3IQcZPKK5oQcTXpONAB0xWQqj
         MWaQ==
X-Gm-Message-State: AOJu0YzYNc8jeASN8jAl4zcoKGUWB7XU+lJAtw/uXkVVMJmWTycaD8vz
	OStrptz00JAD8Fc7SVT0EnomPlXSfG2iHtmh1m1O8IdaDY0C8vFI/NcjIrIFdCjQPNjdcQR77Lx
	k
X-Google-Smtp-Source: AGHT+IF7BfYv8A77TM6Js7u46H/5nrrqGXZxWpYnBfYsiP2mHja+VUkq+v83YoMCSlV9Z3MbjxLEzg==
X-Received: by 2002:a05:6402:518e:b0:5be:fc44:d159 with SMTP id 4fb4d7f45d1cf-5c21ed52ba1mr605962a12.22.1724882642446;
        Wed, 28 Aug 2024 15:04:02 -0700 (PDT)
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
Subject: [PATCH v2 06/11] xen/bitops: Drop the remnants of hweight{8,16}()
Date: Wed, 28 Aug 2024 23:03:46 +0100
Message-Id: <20240828220351.2686408-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
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
index e7c2c5598275..1c160b643ed6 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -395,23 +395,6 @@ static inline unsigned int generic_hweight32(unsigned int w)
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


