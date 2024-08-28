Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA68696345C
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785165.1194581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQll-0006SC-Fy; Wed, 28 Aug 2024 22:04:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785165.1194581; Wed, 28 Aug 2024 22:04:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQll-0006L2-C8; Wed, 28 Aug 2024 22:04:01 +0000
Received: by outflank-mailman (input) for mailman id 785165;
 Wed, 28 Aug 2024 22:03:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlj-0006E8-R2
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:03:59 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6c704332-6589-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 00:03:57 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bf006f37daso18895a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:03:57 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:03:55 -0700 (PDT)
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
X-Inumbo-ID: 6c704332-6589-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882636; x=1725487436; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA9zJhMMiP1cl4HW7H7RUH127emY4xJNbEczm6wLMBU=;
        b=lyzXYIpTlZfTLoaktw/83gq7NnZCWtARmJkEIoQg5D4Pib7zbZpYyn2u5yNA7FpXnz
         tgBz+3kgRjR0N/XlEzTqG5XYZGp365TraSWmolI/7gjXgeE8C8TZDB/VEqIXXYGxbtx8
         zlYVTJKqy0j3GqSJmgtowx7G+ZG9qmpb/nU00=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882636; x=1725487436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA9zJhMMiP1cl4HW7H7RUH127emY4xJNbEczm6wLMBU=;
        b=hCh7KmDEMvZnpyoauCDBT2Fai5iMShq726JkLH3u2aTt4FsiOio8JEE3nYZ3S6NKxn
         4Pakmnjv1PGhr8DZIr5B2N+Lw/dlmCrgY+7JInTd0iDNOnCRFOHpTYZqyVLoOnsoMKlO
         SMpK6Y0/zsMkRxc1rgRpW+fSFzwG9JxcatwV/G4zZYIG/Xc7CajEmU5xQZSlbTzOWXID
         +1mIMd4vUxSqQ1MLUq/QdKIg5TcjNH5c/fjqf37xwJbS2mLxP0IEB2J41FlwYGj+MnbM
         DPbssmse1Q4whgtutIwahJMa7s6vijoprRZ9E6CcGHEyg3Oo5UHUem7/9/hfxJTKVnpU
         ugUg==
X-Gm-Message-State: AOJu0YwOD4rO/GR266l1+QibihGXDwHUDLwBpHkP/q1Y+LarA0qbbXIi
	ecVEifQvb4UW2wgGfB5OdQztNtkI0mgOOqovnzpwLAj1Ws8g8MmEB+EK2kl+oOr7VgH+Z4SWuhI
	l
X-Google-Smtp-Source: AGHT+IGD9DKTjQXlDEnryzLj/nD4dCJYNsZnTxN+I9P6dA3O2JfEGef4Tj0eX54rIlOSfqwvDZUzNg==
X-Received: by 2002:a05:6402:3506:b0:5c0:a8b8:dd6b with SMTP id 4fb4d7f45d1cf-5c22018ad3dmr620843a12.14.1724882636093;
        Wed, 28 Aug 2024 15:03:56 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 01/11] xen/compiler: Rename __attribute_const__ to attr_const
Date: Wed, 28 Aug 2024 23:03:41 +0100
Message-Id: <20240828220351.2686408-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There's no need for the name to be so verbose.

No functional change.

Suggest-by: Jan Beulich <JBeulich@suse.com>
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
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
 * New
---
 tools/libs/guest/xg_dom_decompress_unsafe_zstd.c |  2 +-
 xen/arch/arm/include/asm/arm64/cpufeature.h      | 12 ++++++------
 xen/arch/x86/include/asm/byteorder.h             |  4 ++--
 xen/arch/x86/include/asm/endbr.h                 |  4 ++--
 xen/include/xen/byteorder/swab.h                 |  6 +++---
 xen/include/xen/compiler.h                       |  2 +-
 6 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
index 7cd266444bb1..ff45732a3616 100644
--- a/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
+++ b/tools/libs/guest/xg_dom_decompress_unsafe_zstd.c
@@ -22,7 +22,7 @@ typedef uint16_t __be16;
 typedef uint32_t __be32;
 typedef uint64_t __be64;
 
-#define __attribute_const__
+#define attr_const
 #define __force
 #define always_inline
 #define noinline
diff --git a/xen/arch/arm/include/asm/arm64/cpufeature.h b/xen/arch/arm/include/asm/arm64/cpufeature.h
index d9b9fa77cbd2..1bb503e857e9 100644
--- a/xen/arch/arm/include/asm/arm64/cpufeature.h
+++ b/xen/arch/arm/include/asm/arm64/cpufeature.h
@@ -44,25 +44,25 @@ struct arm64_ftr_bits {
 	s64		safe_val; /* safe value for FTR_EXACT features */
 };
 
-static inline int __attribute_const__
+static inline int attr_const
 cpuid_feature_extract_signed_field_width(u64 features, int field, int width)
 {
 	return (s64)(features << (64 - width - field)) >> (64 - width);
 }
 
-static inline int __attribute_const__
+static inline int attr_const
 cpuid_feature_extract_signed_field(u64 features, int field)
 {
 	return cpuid_feature_extract_signed_field_width(features, field, 4);
 }
 
-static inline unsigned int __attribute_const__
+static inline unsigned int attr_const
 cpuid_feature_extract_unsigned_field_width(u64 features, int field, int width)
 {
 	return (u64)(features << (64 - width - field)) >> (64 - width);
 }
 
-static inline unsigned int __attribute_const__
+static inline unsigned int attr_const
 cpuid_feature_extract_unsigned_field(u64 features, int field)
 {
 	return cpuid_feature_extract_unsigned_field_width(features, field, 4);
@@ -73,7 +73,7 @@ static inline u64 arm64_ftr_mask(const struct arm64_ftr_bits *ftrp)
 	return (u64)GENMASK(ftrp->shift + ftrp->width - 1, ftrp->shift);
 }
 
-static inline int __attribute_const__
+static inline int attr_const
 cpuid_feature_extract_field_width(u64 features, int field, int width, bool sign)
 {
 	return (sign) ?
@@ -81,7 +81,7 @@ cpuid_feature_extract_field_width(u64 features, int field, int width, bool sign)
 		cpuid_feature_extract_unsigned_field_width(features, field, width);
 }
 
-static inline int __attribute_const__
+static inline int attr_const
 cpuid_feature_extract_field(u64 features, int field, bool sign)
 {
 	return cpuid_feature_extract_field_width(features, field, 4, sign);
diff --git a/xen/arch/x86/include/asm/byteorder.h b/xen/arch/x86/include/asm/byteorder.h
index e935f7b2b03b..a877c07f6796 100644
--- a/xen/arch/x86/include/asm/byteorder.h
+++ b/xen/arch/x86/include/asm/byteorder.h
@@ -4,13 +4,13 @@
 #include <xen/types.h>
 #include <xen/compiler.h>
 
-static inline __attribute_const__ __u32 ___arch__swab32(__u32 x)
+static inline attr_const __u32 ___arch__swab32(__u32 x)
 {
     asm("bswap %0" : "=r" (x) : "0" (x));
     return x;
 }
 
-static inline __attribute_const__ __u64 ___arch__swab64(__u64 val)
+static inline attr_const __u64 ___arch__swab64(__u64 val)
 { 
     union { 
         struct { __u32 a,b; } s;
diff --git a/xen/arch/x86/include/asm/endbr.h b/xen/arch/x86/include/asm/endbr.h
index 3033e40d29a8..ba3bae714787 100644
--- a/xen/arch/x86/include/asm/endbr.h
+++ b/xen/arch/x86/include/asm/endbr.h
@@ -19,7 +19,7 @@
  * gen_endbr64() is written deliberately to avoid the problematic operand, and
  * marked __const__ as it is safe for the optimiser to hoist/merge/etc.
  */
-static inline uint32_t __attribute_const__ gen_endbr64(void)
+static inline uint32_t attr_const gen_endbr64(void)
 {
     uint32_t res;
 
@@ -45,7 +45,7 @@ static inline void place_endbr64(void *ptr)
  * contain an ENDBR64 instruction.  Use an encoding which isn't the default
  * P6_NOP4.  Specifically, nopw (%rcx)
  */
-static inline uint32_t __attribute_const__ gen_endbr64_poison(void)
+static inline uint32_t attr_const gen_endbr64_poison(void)
 {
     uint32_t res;
 
diff --git a/xen/include/xen/byteorder/swab.h b/xen/include/xen/byteorder/swab.h
index b7e30f050385..9f817e3c4492 100644
--- a/xen/include/xen/byteorder/swab.h
+++ b/xen/include/xen/byteorder/swab.h
@@ -123,7 +123,7 @@
 #endif /* OPTIMIZE */
 
 
-static inline __attribute_const__ __u16 __fswab16(__u16 x)
+static inline attr_const __u16 __fswab16(__u16 x)
 {
     return __arch__swab16(x);
 }
@@ -136,7 +136,7 @@ static inline void __swab16s(__u16 *addr)
     __arch__swab16s(addr);
 }
 
-static inline __attribute_const__ __u32 __fswab32(__u32 x)
+static inline attr_const __u32 __fswab32(__u32 x)
 {
     return __arch__swab32(x);
 }
@@ -150,7 +150,7 @@ static inline void __swab32s(__u32 *addr)
 }
 
 #ifdef __BYTEORDER_HAS_U64__
-static inline __attribute_const__ __u64 __fswab64(__u64 x)
+static inline attr_const __u64 __fswab64(__u64 x)
 {
 #  ifdef __SWAB_64_THRU_32__
     __u32 h = x >> 32;
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 444bf80142c7..b118e4ba62eb 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -88,7 +88,7 @@
 
 #define __constructor       __attribute__((__constructor__)) cf_check
 #define __pure              __attribute__((__pure__))
-#define __attribute_const__ __attribute__((__const__))
+#define attr_const          __attribute__((__const__))
 #define __transparent__     __attribute__((__transparent_union__))
 
 /*
-- 
2.39.2


