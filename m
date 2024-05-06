Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B028BCBBF
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717433.1119663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNf-0002Qh-QI; Mon, 06 May 2024 10:15:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717433.1119663; Mon, 06 May 2024 10:15:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNf-0002O3-Ln; Mon, 06 May 2024 10:15:35 +0000
Received: by outflank-mailman (input) for mailman id 717433;
 Mon, 06 May 2024 10:15:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNd-0001cU-Cl
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:33 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9263e977-0b91-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:15:32 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso231065766b.0
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:32 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:31 -0700 (PDT)
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
X-Inumbo-ID: 9263e977-0b91-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990532; x=1715595332; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GwX58G2PYucDxTd1xZ6gewg6BqcdHjkMPEio9G/R6/g=;
        b=W7UpMGCERnKa59Hjv66TwSO7jIqjTnFsHRNvKOOKeJHtIIFRxcPzOoJMLqhpCuEA0b
         5r4yAeFxPHcZYiPjgM6o18QcF1DkFlwM1pHLtjojyhipXbj4Nujyqx+JyD12foVR61ik
         eM6/lzJm+j+qEUWbHNW9r2WOE4hYtyY4et6f3inYM5vpEI24pHf4VsMt0Ydyr/aow6OT
         zmnOiwctTU3WjKufmTJVPWuC9pvVrQ+9aDpeRlTWzENYtPUGS3b2KvIED1ILmz3Mp391
         tJ+omlyM8yA+tKJRYobNhaon2MhDMYMqBwIWha6Us/dvvEeU5c4EOnNGMOVJ3buxgBCf
         ctwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990532; x=1715595332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwX58G2PYucDxTd1xZ6gewg6BqcdHjkMPEio9G/R6/g=;
        b=bay7K8i1+f0Ap5fCqe6sUGlUMQW3F3mT99PgO13bKwO4oJE+7fJzV1O06a47/x8Ay8
         vY9+INRJIOHd3HetEtkMl+iPe0YDFU9MRVF0Ebnv2xiHHFIuK2KeoSE6vimwtxbWbGIH
         iAEYI55UKUAAkdPd9FQajSRdTuFb9JqbYnHOHdZiBKQ/qs7zWDLfnS+qTGZhzXGXOTNP
         yBwK2xg2kyHMpBgbYzIAsGeAR7LCXcGFBJxn1+rQp2/Peu4/COvAIldKfrvho1c1BFqc
         YWbKk46lWhssc19RIl8NuiDy9CSNpA3ISA/bVJTvr5pA76qwmlTWt8ijN1aabAkCwaGo
         r+Ag==
X-Gm-Message-State: AOJu0Yw5wXCAn3xyMUWTcSdWttWngdNAMc0qoM2VFdxewUIgmmFH9Mdj
	0Uk5a3ZB6kTic3CODykTS0q3d5/M+THlO9Se0L4DFvM0K0X73jhdn75DdA==
X-Google-Smtp-Source: AGHT+IFc90sRqQ7a5yx1Wt+wBItRldSAvqCOT4TbDzIMWDfj+lR0G5ORNitsKnj7p8VY1ZMkBVKShw==
X-Received: by 2002:a17:907:e86:b0:a59:c6fd:5160 with SMTP id ho6-20020a1709070e8600b00a59c6fd5160mr2766166ejc.76.1714990531465;
        Mon, 06 May 2024 03:15:31 -0700 (PDT)
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
Subject: [PATCH v9 03/15] xen/bitops: implement fls{l}() in common logic
Date: Mon,  6 May 2024 12:15:12 +0200
Message-ID: <fe183f7e8ada7c3fb00ebf9b38f1fffffcc9c2d7.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
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

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 The patch is almost independent from Andrew's patch series
 ( https://lore.kernel.org/xen-devel/20240313172716.2325427-1-andrew.cooper3@citrix.com/T/#t)
 except test_fls() function which IMO can be merged as a separate patch after Andrew's patch
 will be fully ready.
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
 xen/arch/arm/include/asm/bitops.h       |  7 ++-----
 xen/arch/ppc/include/asm/bitops.h       |  3 ---
 xen/arch/x86/include/asm/bitops.h       |  6 ++++--
 xen/common/bitops.c                     | 22 ++++++++++++++++++++++
 xen/common/page_alloc.c                 |  4 ++--
 xen/include/xen/bitops.h                | 24 ++++++++++++++++++++++++
 8 files changed, 57 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/include/asm/arm32/bitops.h b/xen/arch/arm/include/asm/arm32/bitops.h
index d0309d47c1..5552d4e945 100644
--- a/xen/arch/arm/include/asm/arm32/bitops.h
+++ b/xen/arch/arm/include/asm/arm32/bitops.h
@@ -1,7 +1,7 @@
 #ifndef _ARM_ARM32_BITOPS_H
 #define _ARM_ARM32_BITOPS_H
 
-#define flsl fls
+#define arch_flsl fls
 
 /*
  * Little endian assembly bitops.  nr = 0 -> byte 0 bit 0.
diff --git a/xen/arch/arm/include/asm/arm64/bitops.h b/xen/arch/arm/include/asm/arm64/bitops.h
index 0efde29068..5f5d97faa0 100644
--- a/xen/arch/arm/include/asm/arm64/bitops.h
+++ b/xen/arch/arm/include/asm/arm64/bitops.h
@@ -22,17 +22,15 @@ static /*__*/always_inline unsigned long __ffs(unsigned long word)
  */
 #define ffz(x)  __ffs(~(x))
 
-static inline int flsl(unsigned long x)
+static inline int arch_flsl(unsigned long x)
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
index 8e16335e76..860d6d4689 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -78,17 +78,14 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
  * the clz instruction for much better code efficiency.
  */
 
-static inline int fls(unsigned int x)
+static inline int arch_fls(unsigned int x)
 {
         int ret;
 
-        if (__builtin_constant_p(x))
-               return generic_fls(x);
-
         asm("clz\t%"__OP32"0, %"__OP32"1" : "=r" (ret) : "r" (x));
         return 32 - ret;
 }
-
+#define arch_fls arch_fls
 
 #define arch_ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
 #define arch_ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index e2b6473c8c..ca308fd62b 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -119,9 +119,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
         (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
 }
 
-#define flsl(x) generic_flsl(x)
-#define fls(x) generic_fls(x)
-
 /* Based on linux/include/asm-generic/bitops/ffz.h */
 /*
  * ffz - find first zero in word.
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index 23f09fdb7a..8f3d76fe44 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -425,7 +425,7 @@ static always_inline unsigned int arch_ffsl(unsigned long x)
  *
  * This is defined the same way as ffs.
  */
-static inline int flsl(unsigned long x)
+static always_inline int arch_flsl(unsigned long x)
 {
     long r;
 
@@ -435,8 +435,9 @@ static inline int flsl(unsigned long x)
           "1:" : "=r" (r) : "rm" (x));
     return (int)r+1;
 }
+#define arch_flsl arch_flsl
 
-static inline int fls(unsigned int x)
+static always_inline int arch_fls(unsigned int x)
 {
     int r;
 
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
index 4f3399273a..f5be10b928 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -203,6 +203,30 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
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


