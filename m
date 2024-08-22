Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0341895C141
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782004.1191492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtC-0005XI-7N; Thu, 22 Aug 2024 23:06:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782004.1191492; Thu, 22 Aug 2024 23:06:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtC-0005Vh-3t; Thu, 22 Aug 2024 23:06:46 +0000
Received: by outflank-mailman (input) for mailman id 782004;
 Thu, 22 Aug 2024 23:06:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGtA-00052v-Bs
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:44 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 31c0e354-60db-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 01:06:42 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a869332c2c2so182236666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:42 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:40 -0700 (PDT)
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
X-Inumbo-ID: 31c0e354-60db-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368001; x=1724972801; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Z50rUek42kgTiveeKTgR2WMlKuKbEecpCox+h79eBY=;
        b=C56+IeeF4PwlqSsDWuIb0/VOP1/ZnziWSbJZ+MsuNGG43R9MIK8ApuP2r+QjDVFF+J
         yEpNVHKbzxfUsXsDnrr1rKR6aNYhVw3miIpSGASSY0bu+9fm9heYemp9QLoZQHQUKqYa
         ZgZIa/zZyb5tVI6oc9DlvVev3exFldFvpznvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368001; x=1724972801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Z50rUek42kgTiveeKTgR2WMlKuKbEecpCox+h79eBY=;
        b=S1xQQyKCtESOjdUr2uCfbVilRAaadyh0i3rhkceNL2iRleH0uZE4w9abLK3WyOhvix
         2Sdu3ySPRzJey50RrMTXM0EZo2I0LXuvLoXrV9wJjC8SgyvhdGdLupRMdCFDR2l5/6Za
         X0kAd/FDiMWgIq8+JHrpPNN5sAeu+BtyDDU3hd3T6EzPa0ud3FxNlAq5eJywLKRg3HiN
         X2C/Qg+E3a8g/z7z7Dxo1zKXGo5YLyWiPAl56yHwu+xP6SBK2NSdAGUsbabSwAbd74VH
         BP+sMqTQpo38dn53P+IcAE/FNkCQL5RL6zfBFponETDMON5cUBA9C5ZPl0otduVIjjTT
         qtfw==
X-Gm-Message-State: AOJu0YxLVzlllHpTME8vo9jGk6nvHCp+3hlynO2r3RBKMv8fbjTxolj2
	0i0up79JZX/1pwQJVpQPPACusv4Vv6Vhh5wjtNe5xOpxfuNe6FLipYjowD9ukfiHwwKWzqVpLA9
	O
X-Google-Smtp-Source: AGHT+IGsUggwR5NOud8P1JQNlp5q7xeSM5LIrPIsYEgMon9pttFSlivUmD8Is2ZkHkpnZwkWVAyHgg==
X-Received: by 2002:a17:907:3d8a:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a86a309ac9bmr48081766b.22.1724368000957;
        Thu, 22 Aug 2024 16:06:40 -0700 (PDT)
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
Subject: [PATCH 2/9] xen/bitops: Introduce a multiple_bits_set() helper
Date: Fri, 23 Aug 2024 00:06:28 +0100
Message-Id: <20240822230635.954557-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
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

Name inevitably subject to nitpicking.  I'd prefer it to be shorter but I
can't think of anything suitable.
---
 xen/common/bitops.c          | 24 ++++++++++++++++++++++++
 xen/include/xen/bitops.h     | 10 ++++++++++
 xen/include/xen/self-tests.h | 10 ++++++++--
 3 files changed, 42 insertions(+), 2 deletions(-)

diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index 94a8983af99c..4545682aa8e0 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -84,8 +84,32 @@ static void __init test_fls(void)
     CHECK(fls64, 0x8000000000000001ULL, 64);
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
+    CHECK(multiple_bits_set, 1 | (1UL << 63), true);
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
+
+    test_multiple_bits_set();
 }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index b8bb2ffcd337..74c0d04e6647 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -274,6 +274,16 @@ static always_inline __pure unsigned int fls64(uint64_t x)
     }
 }
 
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
index 58484fe5a8ae..e5a6ba748aba 100644
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
             asm ( ".error \"'" STR(fn(val)) "' not compile-time constant\"" ); \
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


