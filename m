Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476B08C878D
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724181.1129386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3H-0002Vd-6V; Fri, 17 May 2024 13:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724181.1129386; Fri, 17 May 2024 13:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3H-0002Sw-0m; Fri, 17 May 2024 13:55:15 +0000
Received: by outflank-mailman (input) for mailman id 724181;
 Fri, 17 May 2024 13:55:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3E-0001sq-M9
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:12 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13be8d67-1455-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 15:55:10 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a59a0e4b773so458873266b.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:10 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:09 -0700 (PDT)
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
X-Inumbo-ID: 13be8d67-1455-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954110; x=1716558910; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woatuozuOyseeL4cnN4KyDezDGVt7DBVcd4a7zZ/GoA=;
        b=WdzIylq215iprKTArZcnSdkcdpYaKOtSS+C2mhpMFtBrV+GcbPnPf3PMmmjxPeC2Yu
         4K+k8YXTpyYcjOAHkMMBNTKk9+Bk9PeKc1VXbgnkJYWIz7C+6lxzU+sOD8uuRZwOPI82
         R4eMkGtSybEpuBw+caCMR2UHyp2OVdNnTNbK45fuExWA33CEtiCDqISm7ABaj0PEe79S
         OMrb3N9BMZeAOqZTR9PyUlBzkcMBtFJpjPPPb4bwI1I7I358jmTXXHuuPtjNWP8SItwA
         rbfB0hq5EYoLnZl8ubnsTaA6+BAFefYeOWZVcu5uecM/zvJ5x15BRFsk4LD6Yc5yq7W4
         TdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954110; x=1716558910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woatuozuOyseeL4cnN4KyDezDGVt7DBVcd4a7zZ/GoA=;
        b=SNBogpROmET7WwsdeRG7rEQeQd1kR6BzS1vwOgRjrQ3cyUSBSNbIYoAvXg1X0RrTXj
         SzxBTWedRYrm7zVn4DuWgckYM3ExL/iWmKsz1TgaEDjOHrzg9MCHs2EuRvCBiQ4+mV4h
         l+7IN53BrKlSWBmiGbOcqY7uD6J+ugrTBc1Ub59k3JaGzkrC9AeM8EPHzCUGas76dPiD
         BR2GufdBlvR7L1U4SA5BBL06boHhIb5cOogJJmkGtVXd+deCwyZUcvhduLbC7qysjktg
         b75yV2Vw7gp5uu8Q0694JeS/xh3ow+xvasEthwiudA2I7CDaOx4ZG2s++fVhVnl66C11
         uilQ==
X-Gm-Message-State: AOJu0YxFDJs4oGgndC7ItssMbvnuWgefuENZJ5rplRH9Arz+6uLA4Z4e
	tbtkrLVjSZC4Nqc0gelrGFZqylqTXbCeMkIP/NqBs3Bo8ii/WI1p62VtU7cL
X-Google-Smtp-Source: AGHT+IHsehvx8pqw/g9Quv5gEW1QWWYdyQ7L1VBT233xZ+7+m0DFfBk+bO2yECVK8fjtIZ1/kLvG1A==
X-Received: by 2002:a17:906:2746:b0:a5a:84f9:df73 with SMTP id a640c23a62f3a-a5a84f9dfd2mr736182166b.38.1715954110155;
        Fri, 17 May 2024 06:55:10 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v10 03/14] xen/bitops: implement fls{l}() in common logic
Date: Fri, 17 May 2024 15:54:52 +0200
Message-ID: <43df611d1c7b7ac16b181fb819f5d886daa31bad.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To avoid the compilation error below, it is needed to update to places
in common/page_alloc.c where flsl() is used as now flsl() returns unsigned int:

./include/xen/kernel.h:18:21: error: comparison of distinct pointer types lacks a cast [-Werror]
       18 |         (void) (&_x == &_y);            \
          |                     ^~
    common/page_alloc.c:1843:34: note: in expansion of macro 'min'
     1843 |         unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);

generic_fls{l} was used instead of __builtin_clz{l}(x) as if x is 0,
the result in undefined.

The prototype of the per-architecture fls{l}() functions was changed to
return 'unsigned int' to align with the generic implementation of these
functions and avoid introducing signed/unsigned mismatches.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 The patch is almost independent from Andrew's patch series
 ( https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t)
 except test_fls() function which IMO can be merged as a separate patch after Andrew's patch
 will be fully ready.
---
Changes in V10:
 - update return type of arch_flsl() across arcitectures to 'unsigned int' to be aligned
   with return type of generic flsl() in xen/bitops.h.
 - switch inline to always_inline for arch_flsl() across architectures to be in sync
   with other similar changes.
 - define arch_flsl as arch_fls not just only fls.
 - update the commit message ( add information that per-arch fls{l)() protypes were
   changed ).
---
Changes in V9:
 - update return type of fls and flsl() to unsigned int to be aligned with other
   bit ops.
 - update places where return value of fls() and flsl() is compared with int.
 - update the commit message.
---
Changes in V8:
 - do proper rebase: back definition of fls{l} to the current patch.
 - drop the changes which removed ffz() in PPC. it should be done not
   in this patch.
 - add a message after Signed-off.
---
Changes in V7:
 - Code style fixes
---
Changes in V6:
 - new patch for the patch series.
---
 xen/arch/arm/include/asm/arm32/bitops.h |  2 +-
 xen/arch/arm/include/asm/arm64/bitops.h |  6 ++----
 xen/arch/arm/include/asm/bitops.h       |  9 +++------
 xen/arch/ppc/include/asm/bitops.h       |  3 ---
 xen/arch/x86/include/asm/bitops.h       | 12 +++++++-----
 xen/common/bitops.c                     | 22 ++++++++++++++++++++++
 xen/common/page_alloc.c                 |  4 ++--
 xen/include/xen/bitops.h                | 24 ++++++++++++++++++++++++
 8 files changed, 61 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/bitops.h b/xen/arch/arm/include/asm/arm32/bitops.h
index d0309d47c1..9ee96f568b 100644
--- a/xen/arch/arm/include/asm/arm32/bitops.h
+++ b/xen/arch/arm/include/asm/arm32/bitops.h
@@ -1,7 +1,7 @@
 #ifndef _ARM_ARM32_BITOPS_H
 #define _ARM_ARM32_BITOPS_H
 
-#define flsl fls
+#define arch_flsl arch_fls
 
 /*
  * Little endian assembly bitops.  nr = 0 -> byte 0 bit 0.
diff --git a/xen/arch/arm/include/asm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
index 906d84e5f2..d942077392 100644
--- a/xen/arch/arm/include/asm/arm64/bitops.h
+++ b/xen/arch/arm/include/asm/arm64/bitops.h
@@ -1,17 +1,15 @@
 #ifndef _ARM_ARM64_BITOPS_H
 #define _ARM_ARM64_BITOPS_H
 
-static inline int flsl(unsigned long x)
+static always_inline unsigned int arch_flsl(unsigned long x)
 {
         uint64_t ret;
 
-        if (__builtin_constant_p(x))
-               return generic_flsl(x);
-
         asm("clz\t%0, %1" : "=r" (ret) : "r" (x));
 
         return BITS_PER_LONG - ret;
 }
+#define arch_flsl arch_flsl
 
 /* Based on linux/include/asm-generic/bitops/find.h */
 
diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 8e16335e76..f428cf8338 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -78,17 +78,14 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
  * the clz instruction for much better code efficiency.
  */
 
-static inline int fls(unsigned int x)
+static always_inline unsigned int arch_fls(unsigned int x)
 {
-        int ret;
-
-        if (__builtin_constant_p(x))
-               return generic_fls(x);
+        unsigned int ret;
 
         asm("clz\t%"__OP32"0, %"__OP32"1" : "=r" (ret) : "r" (x));
         return 32 - ret;
 }
-
+#define arch_fls arch_fls
 
 #define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
 #define arch_ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 049aa62b89..46154fc957 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -119,9 +119,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
         (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
 }
 
-#define flsl(x) generic_flsl(x)
-#define fls(x) generic_fls(x)
-
 /**
  * hweightN - returns the hamming weight of a N-bit word
  * @x: the word to weigh
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 23f09fdb7a..17849fae97 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -425,20 +425,21 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
  *
  * This is defined the same way as ffs.
  */
-static inline int flsl(unsigned long x)
+static always_inline unsigned int arch_flsl(unsigned long x)
 {
-    long r;
+    unsigned long r;
 
     asm ( "bsr %1,%0\n\t"
           "jnz 1f\n\t"
           "mov $-1,%0\n"
           "1:" : "=r" (r) : "rm" (x));
-    return (int)r+1;
+    return (unsigned int)r+1;
 }
+#define arch_flsl arch_flsl
 
-static inline int fls(unsigned int x)
+static always_inline unsigned int arch_fls(unsigned int x)
 {
-    int r;
+    unsigned int r;
 
     asm ( "bsr %1,%0\n\t"
           "jnz 1f\n\t"
@@ -446,6 +447,7 @@ static inline int fls(unsigned int x)
           "1:" : "=r" (r) : "rm" (x));
     return r + 1;
 }
+#define arch_fls arch_fls
 
 /**
  * hweightN - returns the hamming weight of a N-bit word
diff --git a/xen/common/bitops.c b/xen/common/bitops.c
index a8c32f6767..95bc47176b 100644
--- a/xen/common/bitops.c
+++ b/xen/common/bitops.c
@@ -62,9 +62,31 @@ static void test_ffs(void)
     CHECK(ffs64, (uint64_t)0x8000000000000000, 64);
 }
 
+static void test_fls(void)
+{
+    /* unsigned int ffs(unsigned int) */
+    CHECK(fls, 1, 1);
+    CHECK(fls, 3, 2);
+    CHECK(fls, 3U << 30, 32);
+
+    /* unsigned int flsl(unsigned long) */
+    CHECK(flsl, 1, 1);
+    CHECK(flsl, 1UL << (BITS_PER_LONG - 1), BITS_PER_LONG);
+#if BITS_PER_LONG > 32
+    CHECK(flsl, 3UL << 32, 34);
+#endif
+
+    /* unsigned int fls64(uint64_t) */
+    CHECK(fls64, 1, 1);
+    CHECK(fls64, 0x00000000C0000000ULL, 32);
+    CHECK(fls64, 0x0000000180000000ULL, 33);
+    CHECK(fls64, 0xC000000000000000ULL, 64);
+}
+
 static int __init cf_check test_bitops(void)
 {
     test_ffs();
+    test_fls();
 
     return 0;
 }
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index be4ba3962a..eed6b2a901 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1842,7 +1842,7 @@ static void _init_heap_pages(const struct page_info *pg,
          * Note that the value of ffsl() and flsl() starts from 1 so we need
          * to decrement it by 1.
          */
-        unsigned int inc_order = min(MAX_ORDER, flsl(e - s) - 1);
+        unsigned int inc_order = min(MAX_ORDER + 0U, flsl(e - s) - 1);
 
         if ( s )
             inc_order = min(inc_order, ffsl(s) - 1U);
@@ -2266,7 +2266,7 @@ void __init xenheap_max_mfn(unsigned long mfn)
     ASSERT(!first_node_initialised);
     ASSERT(!xenheap_bits);
     BUILD_BUG_ON((PADDR_BITS - PAGE_SHIFT) >= BITS_PER_LONG);
-    xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS);
+    xenheap_bits = min(flsl(mfn + 1) - 1 + PAGE_SHIFT, PADDR_BITS + 0U);
     printk(XENLOG_INFO "Xen heap: %u bits\n", xenheap_bits);
 }
 
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 6eeeff0117..59b8028894 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -200,6 +200,30 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
     test_bit(nr, addr);                                 \
 })
 
+static always_inline __pure unsigned int fls(unsigned int x)
+{
+    if ( __builtin_constant_p(x) )
+        return generic_fls(x);
+
+#ifndef arch_fls
+#define arch_fls generic_fls
+#endif
+
+    return arch_fls(x);
+}
+
+static always_inline __pure unsigned int flsl(unsigned long x)
+{
+    if ( __builtin_constant_p(x) )
+        return generic_flsl(x);
+
+#ifndef arch_flsl
+#define arch_flsl generic_flsl
+#endif
+
+    return arch_flsl(x);
+}
+
 /*
  * Find First Set bit.  Bits are labelled from 1.
  */
-- 
2.45.0


