Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83F8CE4B7
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:09:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729359.1134521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnK-0003t4-11; Fri, 24 May 2024 11:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729359.1134521; Fri, 24 May 2024 11:09:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sASnJ-0003li-Mz; Fri, 24 May 2024 11:09:05 +0000
Received: by outflank-mailman (input) for mailman id 729359;
 Fri, 24 May 2024 11:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vqrK=M3=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sASnH-0003Cz-RW
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:09:03 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06b269ad-19be-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 13:09:02 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a62769075adso51717966b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:09:02 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c817c81sm116051366b.28.2024.05.24.04.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 04:09:00 -0700 (PDT)
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
X-Inumbo-ID: 06b269ad-19be-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716548941; x=1717153741; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd/DGVLnKJ3GtywGuSmeUy0gbzAiv6eqVrDkcFb+xAQ=;
        b=LmQszo4JSC5P2geKR+tI6RLKfJcUH3JqyXSvybyZh1EF5p3ayn0krV9eSpZ78A3rw+
         lPQtx9TyhhtY9h2VVv7zEOMGz2cXkBKqfBbPsTGoHUj3DriyyEjZwfFVyYWrok+6bRMz
         ryRsfw2LJ9qcE07vipfZaIkJMcoMBJJOXjweDS5oUciUqLwDF1fEY0C5oOxprBqf1mp2
         GQSxpllKaRxEU3DusEP02oW/yb8y6PdctUAZO05w0K1XKhaPtd8jAK+9UEw+xKbRIrId
         c7mMCzXwiCywzzwd5S5BjVFpqLKZJOmCyJwnee138Qk3D/B05B62tzAv5hLr/VUhjHCV
         lYKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716548941; x=1717153741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd/DGVLnKJ3GtywGuSmeUy0gbzAiv6eqVrDkcFb+xAQ=;
        b=DldyTDxGlYw5qYAbaaYaOqWyWNAsJuTL+5a/zVDOYp/MeTPXB3inIcyAA1ekHE+RwF
         xU0WSQWLviXfKusgv6Kh/BIgFzJGaj97TlUbFUK2+WHgr1wTKk49PySEZTtiyNZliEAU
         lltPaVJ64yEXeyA2RqPi6IsCyd+d60P8Aij4/Gq2es3W+awkSv/7V0uwqMQ2XzZ9FXtM
         G5GhBM3/F0fkZ/DCPrdoakA6Yh3+YQZu2UqDpTMtVPRXLSE+trP7aaboPF6eGcbYkDk4
         b4AK7e86hvrGSFvIdU8Ba2J5KmkGTD1JODC0Zk5T4t4kzM031WZ/Kee8I5n5JviSJmkK
         4xWw==
X-Gm-Message-State: AOJu0YxXanfNmUc6gKQWmPhdFcPFOMDzDzUpbPFTgIXVLYm7cF6tTU70
	kNy7eDY+vnOAE2ZmHt1Jy8P58w9Y9/5bVu+WhljhdATV+Ye70m7Fzy+ngnVH
X-Google-Smtp-Source: AGHT+IHhqAZDjBHBhgoru8Yb8g2qsIBr02+0uTRek59eZRvOMQ4xA+qVHiPyAFEp4ebYGzazT1zCCg==
X-Received: by 2002:a17:906:4f01:b0:a59:b784:ced4 with SMTP id a640c23a62f3a-a6265118800mr123826166b.75.1716548940991;
        Fri, 24 May 2024 04:09:00 -0700 (PDT)
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
Subject: [PATCH v11 3/9] xen/bitops: implement fls{l}() in common logic
Date: Fri, 24 May 2024 13:08:49 +0200
Message-ID: <e48f86210422eff81dc2dbcfe50f6a9fcdaac6ac.1716547693.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1716547693.git.oleksii.kurochko@gmail.com>
References: <cover.1716547693.git.oleksii.kurochko@gmail.com>
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
 The current one patch can be merged w/o waiting of Andrew's patch series.
 
 Andrew C. could you please consider the following patch to be as a part of your bit operation
 patch series if your patch series will be in staging before mine:
   https://gitlab.com/xen-project/people/olkur/xen/-/commit/24a346c7aa4f51ba34eacb7bfee2808e431daf00
 
 Thanks in advance.
---
Changes in V11:
 - drop unnessary case and fix code style for x86's arch_flsl()
 - rebase on top of staging, so it can be merged to staging if necessary apporves will be given
 - move changes related to fls related function to separate patch on top of Andrew's patch series
   as the C file with tests is introduced in his patch series. The patch is mentioned in footer.
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
 xen/arch/ppc/include/asm/bitops.h       |  2 --
 xen/arch/x86/include/asm/bitops.h       | 12 +++++++-----
 xen/common/page_alloc.c                 |  4 ++--
 xen/include/xen/bitops.h                | 24 ++++++++++++++++++++++++
 7 files changed, 39 insertions(+), 20 deletions(-)

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
index af38fbffdd..52fd33a797 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -76,17 +76,14 @@ bool clear_mask16_timeout(uint16_t mask, volatile void *p,
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
 
 #define ffs(x) ({ unsigned int __t = (x); fls(ISOLATE_LSB(__t)); })
 #define ffsl(x) ({ unsigned long __t = (x); flsl(ISOLATE_LSB(__t)); })
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index 71bbb5f16a..82f9d92c7a 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -117,8 +117,6 @@ static inline int test_and_set_bit(unsigned int nr, volatile void *addr)
         (volatile unsigned int *)addr + BITOP_WORD(nr)) != 0;
 }
 
-#define flsl(x) generic_flsl(x)
-#define fls(x) generic_fls(x)
 #define ffs(x) ({ unsigned int t_ = (x); fls(t_ & -t_); })
 #define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & -t_); })
 
diff --git a/xen/arch/x86/include/asm/bitops.h b/xen/arch/x86/include/asm/bitops.h
index c4e7a06155..e488b39728 100644
--- a/xen/arch/x86/include/asm/bitops.h
+++ b/xen/arch/x86/include/asm/bitops.h
@@ -434,20 +434,21 @@ static inline int ffs(unsigned int x)
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
+    return r + 1;
 }
+#define arch_flsl arch_flsl
 
-static inline int fls(unsigned int x)
+static always_inline unsigned int arch_fls(unsigned int x)
 {
-    int r;
+    unsigned int r;
 
     asm ( "bsr %1,%0\n\t"
           "jnz 1f\n\t"
@@ -455,6 +456,7 @@ static inline int fls(unsigned int x)
           "1:" : "=r" (r) : "rm" (x));
     return r + 1;
 }
+#define arch_fls arch_fls
 
 /**
  * hweightN - returns the hamming weight of a N-bit word
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 7c1bdfc046..d4d05d02b7 100644
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
index 9f89232ba6..c98eb827e3 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -290,6 +290,30 @@ static always_inline bool test_bit(int nr, const volatile void *addr)
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
 #ifndef find_next_bit
 /**
  * find_next_bit - find the next set bit in a memory region
-- 
2.45.0


