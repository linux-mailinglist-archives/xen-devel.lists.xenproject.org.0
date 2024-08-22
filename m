Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A285095C148
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 01:07:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782007.1191523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtG-0006Ka-9V; Thu, 22 Aug 2024 23:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782007.1191523; Thu, 22 Aug 2024 23:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shGtG-0006IE-46; Thu, 22 Aug 2024 23:06:50 +0000
Received: by outflank-mailman (input) for mailman id 782007;
 Thu, 22 Aug 2024 23:06:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gAWf=PV=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1shGtE-0005x0-BD
 for xen-devel@lists.xenproject.org; Thu, 22 Aug 2024 23:06:48 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 34e28d5b-60db-11ef-a50a-bb4a2ccca743;
 Fri, 23 Aug 2024 01:06:47 +0200 (CEST)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-533463f6b16so1643376e87.1
 for <xen-devel@lists.xenproject.org>; Thu, 22 Aug 2024 16:06:47 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f21ff19sm174676866b.39.2024.08.22.16.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 16:06:43 -0700 (PDT)
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
X-Inumbo-ID: 34e28d5b-60db-11ef-a50a-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1724368006; x=1724972806; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AFP1jZxVxjDc6UuHRCIC5TORBnTsTsKkcvJ4HC7gOwo=;
        b=sJr3ax5WDcIYW9IT9jsb+X7jCjKugh7iocNh8PcZDIAHwUXrn4s3DDwYDUIwxCFcMM
         kdOHY5Vl3SDaHmXCksuRgZ4cBmTocbXxD0mPBtDnLlhAGJM/GtA+ZE4aNN/f/MkN/1uw
         gWnfoCp8lx3kyNpbZED3j4V7IrD5jWPppPCNQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724368006; x=1724972806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AFP1jZxVxjDc6UuHRCIC5TORBnTsTsKkcvJ4HC7gOwo=;
        b=uhMYUjlLOnQcPYYR5gaFO7OZ1Dp4cFUh+8MLn0Qw3DF18bpmpJq+pWZcRhDonjfk2n
         RC3z+mJ3fvjJk+HrZZcfKmWqzjjjA8lhg8KmrT6leeXWik7usmA2CXXAAPuBxz5NHSL0
         ZG99Q8TRLKiz1ZDU8TNrfsUxVDZ2XwAlb7xhj2KHyHvCh/WELfcKr4feeE61d041iLvg
         W5NKABiMz6/4syRWwKDbi2xkip2LNtKVXEB8qC8OQ18Mz76yyYYeRACOvUnc2soE/lZy
         vuXVlVR8foFO0SHGo8SuVWsQBIgqZT7N+DS2/WQRBRD+OueulioLamdoxokAcU9Ghkah
         E3ZQ==
X-Gm-Message-State: AOJu0Yyd4DKdX3F9koSntbK1serhHYv+lalOos2IrIOMjjQITbSh7sq0
	Dts+LTn1vdoAlgz3AQqhyw8qJ3vRWnHA2E5Z9uYuabAKqLeRfysDggHSuQf9N7dtfafWARe0wto
	v
X-Google-Smtp-Source: AGHT+IH4elKNA9PI3Ye/Rk6RqPEOVDFJKs/8JLNAzXLdemfeMbGWP7YuXjdSF8ZeK/iVyrA7vwZ9Hw==
X-Received: by 2002:a05:6512:33ce:b0:52e:8b15:7c55 with SMTP id 2adb3069b0e04-534387853e7mr203955e87.27.1724368004524;
        Thu, 22 Aug 2024 16:06:44 -0700 (PDT)
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
Subject: [PATCH 5/9] xen/bitops: Introduce generic_hweightl() and hweightl()
Date: Fri, 23 Aug 2024 00:06:31 +0100
Message-Id: <20240822230635.954557-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240822230635.954557-1-andrew.cooper3@citrix.com>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

There are 6 remaining callers in Xen:

  * The two hweight32() calls, _domain_struct_bits() and efi_find_gop_mode(),
    are __init only.
  * The two hweight_long() calls are both in bitmap_weight().
  * The two hweight64() calls are hv_vpset_nr_banks() and x86_emulate().

Only bitmap_weight() and possibly hv_vpset_nr_banks() can be considered
fast(ish) paths, and they're all of GPR-width form.

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
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>
CC: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/bitops.h |  2 ++
 xen/common/bitops.c               | 14 ++++++++++
 xen/include/xen/bitops.h          | 18 ++++++++++++
 xen/lib/Makefile                  |  1 +
 xen/lib/generic-hweightl.c        | 46 +++++++++++++++++++++++++++++++
 5 files changed, 81 insertions(+)
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
index 4545682aa8e0..d0c268b4994a 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -106,10 +106,24 @@ static void __init test_multiple_bits_set(void)
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
     test_fls();
 
     test_multiple_bits_set();
+    test_hweight();
 }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 64d70a7a1cb5..3aac10b7f532 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -35,6 +35,12 @@ extern void __bitop_bad_size(void);
 unsigned int __pure generic_ffsl(unsigned long x);
 unsigned int __pure generic_flsl(unsigned long x);
 
+/*
+ * Hamming Weight, also called Population Count.  Returns the number of set
+ * bits in @x.
+ */
+unsigned int __pure generic_hweightl(unsigned long x);
+
 /**
  * generic__test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
@@ -284,6 +290,18 @@ static always_inline __pure unsigned int fls64(uint64_t x)
         (_v & (_v - 1)) != 0;                   \
     })
 
+static always_inline __pure unsigned int hweightl(unsigned long x)
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
index 000000000000..fa4bbec273ab
--- /dev/null
+++ b/xen/lib/generic-hweightl.c
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bitops.h>
+#include <xen/init.h>
+#include <xen/self-tests.h>
+
+/* Mask value @b broadcast to every byte in a long */
+#if BITS_PER_LONG == 32
+# define MASK(b) ((b) * 0x01010101UL)
+#elif BITS_PER_LONG == 64
+# define MASK(b) ((b) * 0x0101010101010101UL)
+#else
+# error Extend me please
+#endif
+
+unsigned int generic_hweightl(unsigned long x)
+{
+    x -= (x >> 1) & MASK(0x55);
+    x =  (x & MASK(0x33)) + ((x >> 2) & MASK(0x33));
+    x =  (x + (x >> 4)) & MASK(0x0f);
+
+    if ( IS_ENABLED(CONFIG_HAS_FAST_MULTIPLY) )
+        return (x * MASK(0x01)) >> (BITS_PER_LONG - 8);
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
+    RUNTIME_CHECK(generic_hweightl, 1 | (1UL << (BITS_PER_LONG - 1)), 2);
+    RUNTIME_CHECK(generic_hweightl, -1UL, BITS_PER_LONG);
+}
+#endif /* CONFIG_SELF_TESTS */
-- 
2.39.2


