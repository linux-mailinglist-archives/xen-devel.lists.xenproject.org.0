Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E5E963463
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 00:04:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785170.1194639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQlt-00082z-23; Wed, 28 Aug 2024 22:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785170.1194639; Wed, 28 Aug 2024 22:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjQls-000808-Rr; Wed, 28 Aug 2024 22:04:08 +0000
Received: by outflank-mailman (input) for mailman id 785170;
 Wed, 28 Aug 2024 22:04:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mQTD=P3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sjQlq-0006E0-U7
 for xen-devel@lists.xenproject.org; Wed, 28 Aug 2024 22:04:06 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 717cec95-6589-11ef-a0b0-8be0dac302b0;
 Thu, 29 Aug 2024 00:04:06 +0200 (CEST)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5bed72ff2f2so9048435a12.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Aug 2024 15:04:06 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0bb1c2d2esm2695898a12.16.2024.08.28.15.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 15:04:02 -0700 (PDT)
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
X-Inumbo-ID: 717cec95-6589-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724882645; x=1725487445; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uz9gF0kJ1ww5Xl2kbFnbXvQPW3lQQ7rY+fD3ahbYndw=;
        b=cD2ielAqEZaS2j5hMPfNsDbJHvhVBtoNOjRxh9zYLUMwJHxVrhznwXtC7OaKu11UV2
         TnY+CUXaLS8qSluASp75oWH45GL+EXPFmZlFE3xWsW7Tctq6yt3ey9D4X/LMXVbtwTfg
         fOnJcZK/e1CeJUJmeSBauK47f3I7reFLjWg0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724882645; x=1725487445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uz9gF0kJ1ww5Xl2kbFnbXvQPW3lQQ7rY+fD3ahbYndw=;
        b=cQ6F2vwa15laAUFUndfNlvD6vg1KnZB4Ri0T2w4bRecy7zJkF1G2S56SohTr8B6Y9D
         mjcDOGRau0yd344j804XqIn3Vk5x4yb8l8IPQv4T9DiGwkhA5lYnzH9sAkChzsoOkV4P
         pMFs/Zqfcs8A9vwHrC4nI2FEkhe1n0XYtXO5Q3RK950epguYBWRfOJH/dzu+TaQfyVsC
         bV5yoqLpZU4/2c58QgqtFye8Sz056wRWw57FQFbNUdGjJB+G0VbneL+kD/cQowPxjEDr
         npJkZUgu4SH5zZuq50ahf+U2IthOUYvs3ONE795bXUs8Bj6k9j8Dunhe2naEf/4ds9aq
         /4kA==
X-Gm-Message-State: AOJu0YxxwdVVj+doHyAo+EWhYXMoiNcTX+hKHKIFpwM6JwdSMNw2G/gl
	GGK1wllbBoOKI+1zoLeniDrsOg27o0rWMuxfyqQ1jO7i6J3itXjU607vOY6lOhYsBLEfOdGIVeZ
	3
X-Google-Smtp-Source: AGHT+IFPnPelOGlHkbSiWoLUTbbBX0ocH1aTm9zD7+Aeom2DD0tWujvgwCU1PAM7VBJ3aUgzB/qqxA==
X-Received: by 2002:a05:6402:1d48:b0:5b8:34a9:7fd9 with SMTP id 4fb4d7f45d1cf-5c21ed86b5amr661354a12.27.1724882644363;
        Wed, 28 Aug 2024 15:04:04 -0700 (PDT)
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
Subject: [PATCH v2 07/11] xen/bitops: Introduce generic_hweightl() and hweightl()
Date: Wed, 28 Aug 2024 23:03:47 +0100
Message-Id: <20240828220351.2686408-8-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
References: <20240828220351.2686408-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are 6 remaining callers in Xen:

  * The two hweight32() calls, _domain_struct_bits() and efi_find_gop_mode(),
    are __init only.
  * The two hweight_long() calls are both in bitmap_weight().
  * The two hweight64() calls are hv_vpset_nr_banks() and x86_emulate().

Only bitmap_weight() and possibly hv_vpset_nr_banks() can be considered fast
paths, and they're all of GPR-width form.

Furthermore, the differences between a generic int and generic long form is
only an ADD and SHIFT, and only in !CONFIG_HAS_FAST_MULTIPLY builds.

Therefore, it is definitely not worth having both generic implemenations.

Implement generic_hweightl() based on the current generic_hweight64(),
adjusted to be compatible with ARM32, along with standard SELF_TESTS.

Implement hweightl() with usual constant-folding and arch opt-in support.  PPC
is the only architecture that devates from generic, and it simply uses the
builtin.

No functional change.

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
 * s/MASK/BCST/.  Extend testing
 * s/__pure/attr_const/.
---
 xen/arch/ppc/include/asm/bitops.h |  2 ++
 xen/common/bitops.c               | 14 +++++++++
 xen/include/xen/bitops.h          | 18 ++++++++++++
 xen/lib/Makefile                  |  1 +
 xen/lib/generic-hweightl.c        | 49 +++++++++++++++++++++++++++++++
 5 files changed, 84 insertions(+)
 create mode 100644 xen/lib/generic-hweightl.c

diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index a62c4f99c3bb..64512e949530 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -124,6 +124,8 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
 #define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
 #define arch_flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
 
+#define arch_hweightl(x) __builtin_popcountl(x)
+
 /**
  * hweightN - returns the hamming weight of a N-bit word
  * @x: the word to weigh
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index b504dd1308b8..5e5d20d225d7 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -133,6 +133,19 @@ static void __init test_multiple_bits_set(void)
     CHECK(multiple_bits_set, 0xc000000000000000ULL, true);
 }
 
+static void __init test_hweight(void)
+{
+    /* unsigned int hweightl(unsigned long) */
+    CHECK(hweightl, 0, 0);
+    CHECK(hweightl, 1, 1);
+    CHECK(hweightl, 3, 2);
+    CHECK(hweightl, 7, 3);
+    CHECK(hweightl, 0xff, 8);
+
+    CHECK(hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
+    CHECK(hweightl, -1UL, BITS_PER_LONG);
+}
+
 static void __init __constructor test_bitops(void)
 {
     test_ffs();
@@ -140,4 +153,5 @@ static void __init __constructor test_bitops(void)
     test_for_each_set_bit();
 
     test_multiple_bits_set();
+    test_hweight();
 }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 1c160b643ed6..96dfe0f2c71a 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -35,6 +35,12 @@ extern void __bitop_bad_size(void);
 unsigned int attr_const generic_ffsl(unsigned long x);
 unsigned int attr_const generic_flsl(unsigned long x);
 
+/*
+ * Hamming Weight, also called Population Count.  Returns the number of set
+ * bits in @x.
+ */
+unsigned int attr_const generic_hweightl(unsigned long x);
+
 /**
  * generic__test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
@@ -308,6 +314,18 @@ static always_inline attr_const unsigned int fls64(uint64_t x)
         (_v & (_v - 1)) != 0;                   \
     })
 
+static always_inline attr_const unsigned int hweightl(unsigned long x)
+{
+    if ( __builtin_constant_p(x) )
+        return __builtin_popcountl(x);
+
+#ifdef arch_hweightl
+    return arch_hweightl(x);
+#else
+    return generic_hweightl(x);
+#endif
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index a48541596470..b6558e108bd9 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -6,6 +6,7 @@ lib-y += ctype.o
 lib-y += find-next-bit.o
 lib-y += generic-ffsl.o
 lib-y += generic-flsl.o
+lib-y += generic-hweightl.o
 lib-y += list-sort.o
 lib-y += memchr.o
 lib-y += memchr_inv.o
diff --git a/xen/lib/generic-hweightl.c b/xen/lib/generic-hweightl.c
new file mode 100644
index 000000000000..c242d4c2d9ab
--- /dev/null
+++ b/xen/lib/generic-hweightl.c
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bitops.h>
+#include <xen/init.h>
+#include <xen/self-tests.h>
+
+/* Value @b broadcast to every byte in a long */
+#if BITS_PER_LONG == 32
+# define BCST(b) ((b) * 0x01010101UL)
+#elif BITS_PER_LONG == 64
+# define BCST(b) ((b) * 0x0101010101010101UL)
+#else
+# error Extend me please
+#endif
+
+unsigned int generic_hweightl(unsigned long x)
+{
+    x -= (x >> 1) & BCST(0x55);
+    x =  (x & BCST(0x33)) + ((x >> 2) & BCST(0x33));
+    x =  (x + (x >> 4)) & BCST(0x0f);
+
+    if ( IS_ENABLED(CONFIG_HAS_FAST_MULTIPLY) )
+        return (x * BCST(0x01)) >> (BITS_PER_LONG - 8);
+
+    x += x >> 8;
+    x += x >> 16;
+#if BITS_PER_LONG > 32
+    x += x >> 32;
+#endif
+
+    return x & 0xff;
+}
+
+#ifdef CONFIG_SELF_TESTS
+static void __init __constructor test_generic_hweightl(void)
+{
+    RUNTIME_CHECK(generic_hweightl, 0, 0);
+    RUNTIME_CHECK(generic_hweightl, 1, 1);
+    RUNTIME_CHECK(generic_hweightl, 3, 2);
+    RUNTIME_CHECK(generic_hweightl, 7, 3);
+    RUNTIME_CHECK(generic_hweightl, 0xff, 8);
+
+    RUNTIME_CHECK(generic_hweightl, BCST(0x55), BITS_PER_LONG / 2);
+    RUNTIME_CHECK(generic_hweightl, BCST(0xaa), BITS_PER_LONG / 2);
+
+    RUNTIME_CHECK(generic_hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
+    RUNTIME_CHECK(generic_hweightl, -1UL, BITS_PER_LONG);
+}
+#endif /* CONFIG_SELF_TESTS */
-- 
2.39.2


