Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 980DC963460
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785167.1194609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlp-0007FX-8V; Wed, 28 Aug 2024 22:04:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785167.1194609; Wed, 28 Aug 2024 22:04:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlp-0007BJ-3y; Wed, 28 Aug 2024 22:04:05 +0000
Received: by outflank-mailman (input) for mailman id 785167;
 Wed, 28 Aug 2024 22:04:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQln-0006E8-Nb
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:03 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f09f2af-6589-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 00:04:02 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f3e9fb6ee9so84001561fa.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:02 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:03:58 -0700 (PDT)
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
X-Inumbo-ID: 6f09f2af-6589-11ef-99a0-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882641; x=1725487441; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE7MF4AvTxU0huYOPOMOwWO7uwI5OHylKNn5LBEsDiE=;
        b=Fyud8T8eUx8itFWQ9uj6AEwijMh64XFVIwQo1D2Ku0LpVc2FXHP1Wh0n+foZU+K1Ru
         pY0Nl1fvQzqLqm9/yS9UrU/8UpsvKbQR2BgtBS0i7Gz1dZe7Cpvs3jLl4Teip/2+NQhD
         aGQCbjwJLHw13B21XWPSIlFlF+awbJ2y7JK7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882641; x=1725487441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jE7MF4AvTxU0huYOPOMOwWO7uwI5OHylKNn5LBEsDiE=;
        b=jtZMiZ/GrGT6yVY98Cqm4Z1B3uE8fX02uYv2tXAuDPBIklmpOwGWWZlAWiKcZF2NIC
         Is7ccXLiPYc40u6IjHadDGtdzDdo2XYclSjKj5F3ItZH4Pyag10DRusw3MxMkRkI/w8W
         rO1Yi68SLbtyIn9twki5T5S1kvuuQyT/rZJ3czChtniOst9pqo8Glyfk/q/6YpdyotA9
         9+oPtRqGdyUM+J6zvDo0xtxtjr2dubgt9t8Sd6JQgmbl/U/RP0SPz7opV6dw8Z/IcS5O
         VSNiZIcaU0RPqxNsMvYpVgt1g4l7U4P8cx1b0W52lxPMb9UYFNcez1dpon8O411evRe3
         Uh0g==
X-Gm-Message-State: AOJu0YyGWT/b87zZYcd59eIJyRTOcSdCIYf+In452ja1sh3UuxN7/ygh
	7rAdEPPmjUL9SSdOWwftmY7T1+iT3QVHOGWlcbkbBKN4tm8fTCCXG39IBkPKkPLXsKtxQOOGt8Y
	/
X-Google-Smtp-Source: AGHT+IGskY5mUpIjN+AdOMHhdI+obRxCcgVMM986wSrN/PLyjC7vqCbNurLLvgdunNzRC4wX05XAQg==
X-Received: by 2002:a05:651c:1543:b0:2ef:2dfd:15e3 with SMTP id 38308e7fff4ca-2f6103a28femr5671851fa.19.1724882640541;
        Wed, 28 Aug 2024 15:04:00 -0700 (PDT)
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
Subject: [PATCH v2 04/11] xen/bitops: Introduce a multiple_bits_set() helper
Date: Wed, 28 Aug 2024 23:03:44 +0100
Message-Id: <20240828220351.2686408-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This will be used to simplify real logic in the following patch.  Add compile
and boot time testing as with other bitops.

Because the expression is so simple, implement it as a function-like macro
which is generic on the type of it's argument, rather than having multiple
variants.

Testing function-like macros needs a minor adjustments to the infrastructure
in xen/self-tests.h to avoid bracketing the fn parameter.  The utility of this
outweighs the associated risks.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
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

Name inevitably subject to nitpicking.  I'd prefer it to be shorter but I
can't think of anything suitable.

v2:
 * Drop redundant CHECK() in the BITS_PER_LONG > 32 case.
---
 xen/common/bitops.c          | 23 +++++++++++++++++++++++
 xen/include/xen/bitops.h     | 10 ++++++++++
 xen/include/xen/self-tests.h | 10 ++++++++--
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 9e532f0d87aa..b504dd1308b8 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -112,9 +112,32 @@ static void __init test_for_each_set_bit(void)
         panic("for_each_set_bit(uint64) expected %#"PRIx64", got %#"PRIx64"\n", ull, ull_res);
 }
 
+static void __init test_multiple_bits_set(void)
+{
+    /*
+     * multiple_bits_set() is generic on the type of it's parameter, as the
+     * internal expression is so simple.
+     */
+
+    CHECK(multiple_bits_set, 0, false);
+    CHECK(multiple_bits_set, 1, false);
+    CHECK(multiple_bits_set, 2, false);
+    CHECK(multiple_bits_set, 3, true);
+
+    CHECK(multiple_bits_set, 1 | (1UL << (BITS_PER_LONG - 1)), true);
+#if BITS_PER_LONG > 32
+    CHECK(multiple_bits_set, 1 | (1UL << 32), true);
+#endif
+
+    CHECK(multiple_bits_set, 0x8000000000000001ULL, true);
+    CHECK(multiple_bits_set, 0xc000000000000000ULL, true);
+}
+
 static void __init __constructor test_bitops(void)
 {
     test_ffs();
     test_fls();
     test_for_each_set_bit();
+
+    test_multiple_bits_set();
 }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 9f0a0ce4a73b..e7c2c5598275 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -298,6 +298,16 @@ static always_inline attr_const unsigned int fls64(uint64_t x)
               __v && ((iter) = ffs_g(__v) - 1, true);   \
               __v &= __v - 1 )
 
+/*
+ * Calculate if a value has two or more bits set.  Always use this in
+ * preference to an expression of the form 'hweight(x) > 1'.
+ */
+#define multiple_bits_set(x)                    \
+    ({                                          \
+        typeof(x) _v = (x);                     \
+        (_v & (_v - 1)) != 0;                   \
+    })
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
diff --git a/xen/include/xen/self-tests.h b/xen/include/xen/self-tests.h
index e9a879489363..bd8a4867aa40 100644
--- a/xen/include/xen/self-tests.h
+++ b/xen/include/xen/self-tests.h
@@ -15,11 +15,14 @@
  *
  * Clang < 8 can't fold constants through static inlines, causing this to
  * fail.  Simply skip it for incredibly old compilers.
+ *
+ * N.B. fn is intentionally not bracketed to allow us to test function-like
+ * macros too.
  */
 #if !defined(CONFIG_CC_IS_CLANG) || CONFIG_CLANG_VERSION >= 80000
 #define COMPILE_CHECK(fn, val, res)                                     \
     do {                                                                \
-        typeof((fn)(val)) real = (fn)(val);                             \
+        typeof(fn(val)) real = fn(val);                                 \
                                                                         \
         if ( !__builtin_constant_p(real) )                              \
             BUILD_ERROR("'" STR(fn(val)) "' not compile-time constant"); \
@@ -34,10 +37,13 @@
  * Check that Xen's runtime logic for fn(val) gives the expected answer.  This
  * requires using HIDE() to prevent the optimiser from collapsing the logic
  * into a constant.
+ *
+ * N.B. fn is intentionally not bracketed to allow us to test function-like
+ * macros too.
  */
 #define RUNTIME_CHECK(fn, val, res)                     \
     do {                                                \
-        typeof((fn)(val)) real = (fn)(HIDE(val));       \
+        typeof(fn(val)) real = fn(HIDE(val));           \
                                                         \
         if ( real != (res) )                            \
             panic("%s: %s(%s) expected %u, got %u\n",   \
-- 
2.39.2


