Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F37F18CEAAB
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729755.1135099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8x-0001ec-L5; Fri, 24 May 2024 20:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729755.1135099; Fri, 24 May 2024 20:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8x-0001XB-8b; Fri, 24 May 2024 20:03:59 +0000
Received: by outflank-mailman (input) for mailman id 729755;
 Fri, 24 May 2024 20:03:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8u-000773-TT
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:56 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf9fe58b-1a08-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 22:03:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f464so1184464a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:55 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:53 -0700 (PDT)
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
X-Inumbo-ID: bf9fe58b-1a08-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581034; x=1717185834; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BArFVTq1bFwBqGRKgiR15fKQGJoXMQ04ywKksSWcrsw=;
        b=nce6VDKq+A7CD02EOSHb4AOw7H264K5pwaW25ZnM3aasO4mUoSAUz8Xg99jXVkyUxp
         WdkxEvouGhx14pxxNTTC8t04OUh1F9nXBwY8fJCNs7o2bKnqcxYs6sr2/HBQtR5pX+YN
         ZJNCMx6+UW+5+I0MAbZhtfSg3fgtSUGd8oApc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581034; x=1717185834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BArFVTq1bFwBqGRKgiR15fKQGJoXMQ04ywKksSWcrsw=;
        b=UvIwFnqnUxtHAvnJomBst7ofJMhQJkwzq4OVPaHkqVXi0NHczF7JGLoeWvIVOKEXBF
         3PP1+JzwVDkmuI/VZAKbnmX8OCcLkhy7TYkV4NMjjhOQyIqNgdIv7oXlzDTD/05vfSjD
         y3fAgiz9usW++eb0Yw8GdjFXP4gB/PxQPfvleqQMFIJiftoBDu6tnMSTDj+DBM8IvmkO
         cCk5X5WPLq0UOTedsCtj++g4lxpVOHgXJo6FEQaEJ9VnpE1IHUmyG5UxJhyvPjSwEJTl
         u1Qp0ZBj9HP6uhITwRCvba08Lxw2ms5KprDFcflhSE5XhRqaG+Shny8uNm92CzqHF+sJ
         BwoQ==
X-Gm-Message-State: AOJu0YwtlVGiqB/Nei71T2EuusE7moY+qYMnJ/n7ZjlR5C6VP69w2BOU
	J9rsT/t39zGJVVe4x/RuPjPHEgdS+WdV2fGju8o7zCx4n4JJGtO01BAzNNY/3ZqSoD9/9X24V8r
	/0j4=
X-Google-Smtp-Source: AGHT+IFS0sRKjwwnSdc3AQTMI7Dh0SyIHhDvuOE50/zkVG/FaN3PWKT6+IRAPUcfHZtNjlNVcg8Ydg==
X-Received: by 2002:a17:907:6d07:b0:a58:c80e:edd9 with SMTP id a640c23a62f3a-a626525da3bmr218463666b.77.1716581034101;
        Fri, 24 May 2024 13:03:54 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 11/13] xen/bitops: Implement fls()/flsl() in common logic
Date: Fri, 24 May 2024 21:03:36 +0100
Message-Id: <20240524200338.1232391-12-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Oleksii Kurochko <oleksii.kurochko@gmail.com>

This is most easily done together because of how arm32 is currently
structured, but it does just mirror the existing ffs()/ffsl() work.

Introduce compile and boot time testing.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 * New, incorperated from Oleksii's RISC-V series and adjusted.

for x86:

  add/remove: 0/0 grow/shrink: 3/17 up/down: 28/-153 (-125)
  Function                                     old     new   delta
  pci_enable_msi                              1033    1049     +16
  vlapic_lowest_prio                           330     338      +8
  kexec_early_calculations                      53      57      +4
  pci_restore_msi_state                       1159    1157      -2
  arch_hwdom_irqs                               61      59      -2
  control_read                                 132     129      -3
  pci_enable_msi.cold                          121     117      -4
  arch_get_dma_bitsize                         173     169      -4
  xmem_pool_alloc                             1039    1032      -7
  xenheap_max_mfn                               49      42      -7
  mba_sanitize_thrtl                            83      76      -7
  xstate_init                                  807     799      -8
  offline_page                                 965     957      -8
  apicid_to_socket                             160     152      -8
  vlapic_find_highest_vector                    61      48     -13
  xmem_pool_free                               983     967     -16
  iommu_alloc                                  935     919     -16
  free_heap_pages                             1512    1496     -16
  detect_ht                                    318     302     -16
  alloc_heap_pages                            1569    1553     -16

showing that the optimiser can now do a better job in most cases.
---
 xen/arch/arm/include/asm/arm32/bitops.h |  2 --
 xen/arch/arm/include/asm/arm64/bitops.h | 12 -------
 xen/arch/arm/include/asm/bitops.h       | 19 ++--------
 xen/arch/ppc/include/asm/bitops.h       |  4 +--
 xen/arch/x86/include/asm/bitops.h       | 46 +++++++++++++++----------
 xen/common/bitops.c                     | 25 ++++++++++++++
 xen/include/xen/bitops.h                | 24 +++++++++++++
 7 files changed, 80 insertions(+), 52 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/bitops.h b/xen/arch/arm/include/asm/arm32/bitops.h
index d0309d47c188..0d7bb12d5c19 100644
--- a/xen/arch/arm/include/asm/arm32/bitops.h
+++ b/xen/arch/arm/include/asm/arm32/bitops.h
@@ -1,8 +1,6 @@
 #ifndef _ARM_ARM32_BITOPS_H
 #define _ARM_ARM32_BITOPS_H
 
-#define flsl fls
-
 /*
  * Little endian assembly bitops.  nr = 0 -> byte 0 bit 0.
  */
diff --git a/xen/arch/arm/include/asm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
index 906d84e5f295..a6135838dcfa 100644
--- a/xen/arch/arm/include/asm/arm64/bitops.h
+++ b/xen/arch/arm/include/asm/arm64/bitops.h
@@ -1,18 +1,6 @@
 #ifndef _ARM_ARM64_BITOPS_H
 #define _ARM_ARM64_BITOPS_H
 
-static inline int flsl(unsigned long x)
-{
-        uint64_t ret;
-
-        if (__builtin_constant_p(x))
-               return generic_flsl(x);
-
-        asm("clz\t%0, %1" : "=r" (ret) : "r" (x));
-
-        return BITS_PER_LONG - ret;
-}
-
 /* Based on linux/include/asm-generic/bitops/find.h */
 
 #ifndef CONFIG_GENERIC_FIND_FIRST_BIT
diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index d30ba44598e3..8f4bdc09d128 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -140,25 +140,10 @@ static inline int test_bit(int nr, const volatile void *addr)
         return 1UL & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD-1)));
 }
 
-/*
- * On ARMv5 and above those functions can be implemented around
- * the clz instruction for much better code efficiency.
- */
-
-static inline int fls(unsigned int x)
-{
-        int ret;
-
-        if (__builtin_constant_p(x))
-               return generic_flsl(x);
-
-        asm("clz\t%"__OP32"0, %"__OP32"1" : "=r" (ret) : "r" (x));
-        return 32 - ret;
-}
-
-
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
+#define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
+#define arch_flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
 
 /**
  * hweightN - returns the hamming weight of a N-bit word
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 761361291e6f..8119b5ace877 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -171,10 +171,10 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
     return (old & mask) != 0;
 }
 
-#define flsl(x) generic_flsl(x)
-#define fls(x) generic_flsl(x)
 #define arch_ffs(x)  ((x) ? 1 + __builtin_ctz(x) : 0)
 #define arch_ffsl(x) ((x) ? 1 + __builtin_ctzl(x) : 0)
+#define arch_fls(x)  ((x) ? 32 - __builtin_clz(x) : 0)
+#define arch_flsl(x) ((x) ? BITS_PER_LONG - __builtin_clzl(x) : 0)
 
 /**
  * hweightN - returns the hamming weight of a N-bit word
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 830e488f33a0..fc9fe73ad5ba 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -447,33 +447,41 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
 }
 #define arch_ffsl arch_ffsl
 
-/**
- * fls - find last bit set
- * @x: the word to search
- *
- * This is defined the same way as ffs.
- */
-static inline int flsl(unsigned long x)
+static always_inline unsigned int arch_fls(unsigned int x)
 {
-    long r;
+    unsigned int r;
+
+    /* See arch_ffs() for safety discussions. */
+    if ( __builtin_constant_p(x > 0) && x > 0 )
+        asm ( "bsr %[val], %[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (x) );
+    else
+        asm ( "bsr %[val], %[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (x), "[res]" (-1) );
 
-    asm ( "bsr %1,%0\n\t"
-          "jnz 1f\n\t"
-          "mov $-1,%0\n"
-          "1:" : "=r" (r) : "rm" (x));
-    return (int)r+1;
+    return r + 1;
 }
+#define arch_fls arch_fls
 
-static inline int fls(unsigned int x)
+static always_inline unsigned int arch_flsl(unsigned long x)
 {
-    int r;
+    unsigned int r;
+
+    /* See arch_ffs() for safety discussions. */
+    if ( __builtin_constant_p(x > 0) && x > 0 )
+        asm ( "bsr %[val], %q[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (x) );
+    else
+        asm ( "bsr %[val], %q[res]"
+              : [res] "=r" (r)
+              : [val] "rm" (x), "[res]" (-1) );
 
-    asm ( "bsr %1,%0\n\t"
-          "jnz 1f\n\t"
-          "mov $-1,%0\n"
-          "1:" : "=r" (r) : "rm" (x));
     return r + 1;
 }
+#define arch_flsl arch_flsl
 
 /**
  * hweightN - returns the hamming weight of a N-bit word
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index b3813f818198..b4845d9e84d1 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -26,7 +26,32 @@ static void __init test_ffs(void)
 #endif
 }
 
+static void __init test_fls(void)
+{
+    /* unsigned int fls(unsigned int) */
+    CHECK(fls, 0, 0);
+    CHECK(fls, 1, 1);
+    CHECK(fls, 3, 2);
+    CHECK(fls, 7, 3);
+    CHECK(fls, 6, 3);
+    CHECK(fls, 0x80000000U, 32);
+
+    /* unsigned int flsl(unsigned long) */
+    CHECK(flsl, 0, 0);
+    CHECK(flsl, 1, 1);
+    CHECK(flsl, 3, 2);
+    CHECK(flsl, 7, 3);
+    CHECK(flsl, 6, 3);
+
+    CHECK(flsl, 1 | (1UL << (BITS_PER_LONG - 1)), BITS_PER_LONG);
+#if BITS_PER_LONG > 32
+    CHECK(flsl, 1 | (1UL << 32), 33);
+    CHECK(flsl, 1 | (1UL << 63), 64);
+#endif
+}
+
 static void __init __constructor test_bitops(void)
 {
     test_ffs();
+    test_fls();
 }
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 88cf27a88bcf..e7df6377372d 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -60,6 +60,30 @@ static always_inline __pure unsigned int ffsl(unsigned long x)
 #endif
 }
 
+static always_inline __pure unsigned int fls(unsigned int x)
+{
+    if ( __builtin_constant_p(x) )
+        return x ? 32 - __builtin_clz(x) : 0;
+
+#ifdef arch_fls
+    return arch_fls(x);
+#else
+    return generic_flsl(x);
+#endif
+}
+
+static always_inline __pure unsigned int flsl(unsigned long x)
+{
+    if ( __builtin_constant_p(x) )
+        return x ? BITS_PER_LONG - __builtin_clzl(x) : 0;
+
+#ifdef arch_fls
+    return arch_flsl(x);
+#else
+    return generic_flsl(x);
+#endif
+}
+
 /* --------------------- Please tidy below here --------------------- */
 
 #ifndef find_next_bit
-- 
2.30.2


