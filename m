Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63332B3717D
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 19:42:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1094898.1450088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqxg3-0008Lb-Hx; Tue, 26 Aug 2025 17:41:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1094898.1450088; Tue, 26 Aug 2025 17:41:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqxg3-0008JN-EL; Tue, 26 Aug 2025 17:41:47 +0000
Received: by outflank-mailman (input) for mailman id 1094898;
 Tue, 26 Aug 2025 17:41:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xnf3=3G=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uqxg1-0008JG-2c
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 17:41:45 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb875f65-82a3-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 19:41:39 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-45b6278893eso7294765e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 26 Aug 2025 10:41:39 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6c5ab181sm1701275e9.20.2025.08.26.10.41.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 10:41:37 -0700 (PDT)
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
X-Inumbo-ID: eb875f65-82a3-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756230098; x=1756834898; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hzPowjWPzHz/JW3GlPL+G8vbG/xpjBZLpn8wPMsgIwk=;
        b=KRnrDATBJiEATBTeYtXL3W+lAHjDSwDr6YRjX/7Li/vCEIKdRLuN2RrZ1A8ItfajVr
         z3mMMxWjyl1SCjuiX8rtuCSWAUjTSEdAJNxcQdEwjeUStbygu0ZgFuxp1SjNuoksG3t0
         EjgbmgG5ZeTsUlvNlDFhy7WdeFejEGSb0Rqbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756230098; x=1756834898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hzPowjWPzHz/JW3GlPL+G8vbG/xpjBZLpn8wPMsgIwk=;
        b=lvO/zOJjEfL1gVxo7BeojZ1Q6ESyTJ3/Qj/U4p0BZURF8RGbaiRy9SNGDgcAyQPF18
         HmT9vhWtcBVJWKt/cWH2uKdDlxQBi3ZGudokm+AH+ud9iUCZbF0EV3u7boSYfzOVs8JY
         JbB3+LlLVk6enB19qwQBpjxe4wHqQmr1tXuBK3ueNNfZ0c4Tvp6OsmsdbrlKW4RPLAeI
         aq4U5ODdlHmVqiTxZxzSvpwo5/MlP2q5lw/NxUD9vD8R/YGem/clIdRPMtuFvbqPxdWS
         0yh7oBYiNvuOntiAsy2UtQLwGWnq9QvA7EcsGE95GqNA2LWhIerN/TKTlVniQyvbJodV
         +EKA==
X-Gm-Message-State: AOJu0YzpgVQyna69EllAo/DaGVxIcFSQ1QKnry2vwD5GFCorQNBUt1qL
	lmJL4OQ3u01iQgJsksYyZyGbgqt8aQ+ZxY5P9d42WZWH1ywHE0+6P8OcBbUglzJT3DkUAtWpPJ4
	NfNty
X-Gm-Gg: ASbGncvtt5MvXb3RD7+tV/dov/7iR0oOA5E3/agLtggxfdk0eozjaL3Sj2FB1qcA3gl
	WJkTapCReBNKbgmaZrs3vXsAvRc6WAYBi0pCIxuNxFAmnr9WqA0w2R/ivEzwzgfUMWVcsut/yYy
	E+y+rydF9x8nhUAsCfd4wJI4Da/rW4t+0/Pe337FaUQz3CbP0+QXPgxceG9cE2B8DOzLRfEjAgE
	ASE+174eQKPk0OuJOcHsud+ezrSJCE91JFgvxknwXt2JdTTnl06NRbQzW4eh8mlHYMYak0JYs6F
	3vQ0WV2h80kAwWx3m5bpGGOdqu6GlOc9mwjX4mWogzu8wtcOjD0mivAGv4C5EPGy+1yycsBNM/P
	iTvNyIWfK4migR7a7nFP0MgeIrLwxRXwDH0HWgG7qE2hOBkD7ljWTn+Zp3FB0mKzMhSXpv0sfEf
	kl0bF0ZCp8+Hk=
X-Google-Smtp-Source: AGHT+IEfTIn2hUlhIz0VxIEUhUNibh7JsTH1+JJJmsl+8YO0uWhy6aJfGHQS+T+d9nu1rL0z6V6nMQ==
X-Received: by 2002:a05:600c:1e8b:b0:45b:47e1:ef6f with SMTP id 5b1f17b1804b1-45b517fabfbmr125965045e9.34.1756230098232;
        Tue, 26 Aug 2025 10:41:38 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] x86/bitops: Optimise arch_ffs{,l}() some more on AMD
Date: Tue, 26 Aug 2025 18:41:35 +0100
Message-Id: <20250826174135.605220-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
References: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

One aspect of the old ffs() infrastructure was the use of TZCNT without a
CPUID check.  Given no obvious justification, I dropped it during the cleanup.

It turns out there is a good reason, on all but the most recent AMD CPUs.

Reinstate the use of "blind" TZCNT when safe to do so.  This happens to be
preferentially in loops where a repeated saving of 5-6 uops becomes far more
relevant than a one-off scenario.  Leave an explanation of why.

It is not safe to perform this transformation for BSR and LZCNT, because they
count from opposite ends of the input operand.  Furthermore, this incorrect
transform was not caught by the selftests.

Extend the selftests with test_for_each_set_bit_reverse() as that exercises
the "x known non-zero" optimsiation path in x86's helpers.  Adjust the
existing test_for_each_set_bit() to intentionally use an asymmetric input bit
pattern, otherwise "counting from the wrong end" bugs continue to slip by.

No functional change.

Fixes: 989e5f08d33e ("x86/bitops: Improve arch_ffs() in the general case")
Fixes: 5ed26fc0768d ("xen/bitops: Implement ffsl() in common logic")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v2:
 * Use TZCNT mnemonic given the updated toolchain baseline
 * Do not convert LZCNT.
 * Extend selftests.

https://gitlab.com/xen-project/hardware/xen-staging/-/pipelines/2004918013

I've kept Jan's R-by as this is a subset of what was previously reviewed, but
I'm posting it for clarity as there are a lot of selftest changes.
---
 xen/arch/x86/include/asm/bitops.h | 13 ++++--
 xen/common/bitops.c               | 78 ++++++++++++++++++++++++++++++-
 2 files changed, 86 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 87eac7782f10..b17d67e8ca61 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -399,9 +399,16 @@ static always_inline unsigned int arch_ffs(unsigned int x)
          *
          * and the optimiser really can work with the knowledge of x being
          * non-zero without knowing it's exact value, in which case we don't
-         * need to compensate for BSF's corner cases.  Otherwise...
+         * need to compensate for BSF's corner cases.
+         *
+         * That said, we intentionally use TZCNT on capable hardware when the
+         * behaviour for the 0 case doesn't matter.  On AMD CPUs prior to
+         * Zen4, TZCNT is 1-2 uops while BSF is 6-8 with a latency to match.
+         * Intel CPUs don't suffer this discrepancy.
+         *
+         * Otherwise...
          */
-        asm ( "bsf %[val], %[res]"
+        asm ( "tzcnt %[val], %[res]"
               : [res] "=r" (r)
               : [val] "rm" (x) );
     }
@@ -428,7 +435,7 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
 
     /* See arch_ffs() for safety discussions. */
     if ( __builtin_constant_p(x > 0) && x > 0 )
-        asm ( "bsf %[val], %q[res]"
+        asm ( "tzcnt %[val], %q[res]"
               : [res] "=r" (r)
               : [val] "rm" (x) );
     else
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index bd17ddef5700..14e6265037f1 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -97,14 +97,14 @@ static void __init test_for_each_set_bit(void)
     if ( ui != ui_res )
         panic("for_each_set_bit(uint) expected %#x, got %#x\n", ui, ui_res);
 
-    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 1);
+    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 0x11);
     for_each_set_bit ( i, ul )
         ul_res |= 1UL << i;
 
     if ( ul != ul_res )
         panic("for_each_set_bit(ulong) expected %#lx, got %#lx\n", ul, ul_res);
 
-    ull = HIDE(0x8000000180000001ULL);
+    ull = HIDE(0x8000000180000011ULL);
     for_each_set_bit ( i, ull )
         ull_res |= 1ULL << i;
 
@@ -127,6 +127,79 @@ static void __init test_for_each_set_bit(void)
         panic("for_each_set_bit(break) expected 0x1008, got %#x\n", ui_res);
 }
 
+/*
+ * A type-generic fls() which picks the appropriate fls{,l,64}() based on it's
+ * argument.
+ */
+#define fls_g(x)                                        \
+    (sizeof(x) <= sizeof(int)      ? fls(x) :           \
+     sizeof(x) <= sizeof(long)     ? flsl(x) :          \
+     sizeof(x) <= sizeof(uint64_t) ? fls64(x) :         \
+     ({ BUILD_ERROR("fls_g() Bad input type"); 0; }))
+
+/*
+ * for_each_set_bit_reverse() - Iterate over all set bits in a scalar value,
+ * from MSB to LSB.
+ *
+ * @iter An iterator name.  Scoped is within the loop only.
+ * @val  A scalar value to iterate over.
+ *
+ * A copy of @val is taken internally.
+ */
+#define for_each_set_bit_reverse(iter, val)             \
+    for ( typeof(val) __v = (val); __v; __v = 0 )       \
+        for ( unsigned int (iter);                      \
+              __v && ((iter) = fls_g(__v) - 1, true);   \
+              __clear_bit(iter, &__v) )
+
+/*
+ * Xen doesn't have need of for_each_set_bit_reverse() at present, but the
+ * construct does exercise a case of arch_fls*() not covered anywhere else by
+ * these tests.
+ */
+static void __init test_for_each_set_bit_reverse(void)
+{
+    unsigned int  ui,  ui_res = 0, tmp;
+    unsigned long ul,  ul_res = 0;
+    uint64_t      ull, ull_res = 0;
+
+    ui = HIDE(0x80008001U);
+    for_each_set_bit_reverse ( i, ui )
+        ui_res |= 1U << i;
+
+    if ( ui != ui_res )
+        panic("for_each_set_bit_reverse(uint) expected %#x, got %#x\n", ui, ui_res);
+
+    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 0x11);
+    for_each_set_bit_reverse ( i, ul )
+        ul_res |= 1UL << i;
+
+    if ( ul != ul_res )
+        panic("for_each_set_bit_reverse(ulong) expected %#lx, got %#lx\n", ul, ul_res);
+
+    ull = HIDE(0x8000000180000011ULL);
+    for_each_set_bit_reverse ( i, ull )
+        ull_res |= 1ULL << i;
+
+    if ( ull != ull_res )
+        panic("for_each_set_bit_reverse(uint64) expected %#"PRIx64", got %#"PRIx64"\n", ull, ull_res);
+
+    /* Check that we can break from the middle of the loop. */
+    ui = HIDE(0x80001008U);
+    tmp = 0;
+    ui_res = 0;
+    for_each_set_bit_reverse ( i, ui )
+    {
+        if ( tmp++ > 1 )
+            break;
+
+        ui_res |= 1U << i;
+    }
+
+    if ( ui_res != 0x80001000U )
+        panic("for_each_set_bit_reverse(break) expected 0x80001000, got %#x\n", ui_res);
+}
+
 static void __init test_multiple_bits_set(void)
 {
     /*
@@ -169,6 +242,7 @@ static void __init __constructor test_bitops(void)
     test_ffs();
     test_fls();
     test_for_each_set_bit();
+    test_for_each_set_bit_reverse();
 
     test_multiple_bits_set();
     test_hweight();
-- 
2.39.5


