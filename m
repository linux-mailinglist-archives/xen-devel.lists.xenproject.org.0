Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47ED08CEAA4
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 22:04:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729749.1135044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8q-0008QP-50; Fri, 24 May 2024 20:03:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729749.1135044; Fri, 24 May 2024 20:03:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAb8p-0008MR-V6; Fri, 24 May 2024 20:03:51 +0000
Received: by outflank-mailman (input) for mailman id 729749;
 Fri, 24 May 2024 20:03:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PGXh=M3=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sAb8n-00076x-DI
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 20:03:49 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbbae797-1a08-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 22:03:48 +0200 (CEST)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a626ac4d299so130913866b.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 13:03:48 -0700 (PDT)
Received: from andrewcoop.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c9377d8sm173553066b.55.2024.05.24.13.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 13:03:47 -0700 (PDT)
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
X-Inumbo-ID: bbbae797-1a08-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716581028; x=1717185828; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bu+ePM1Qu+LYpA9RNu9XXOypr94Ji2YBQcexG1JyIro=;
        b=TbjXv1tHzR34Fx5UGQJaxQolIWj9YEHixaD1SyQBMNID3ug8TGtF8/0E/7LHD6Lrud
         eCtUXM02q/AnGODv4nbSGDcCNC1P04MjVLsVp3IdS3u2e//2sIaDoYkvzBI6rbS1AdP5
         A6hVosMtYeKceyhHvAzG1apaLakpjd5SXMdSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716581028; x=1717185828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bu+ePM1Qu+LYpA9RNu9XXOypr94Ji2YBQcexG1JyIro=;
        b=ietkOnjL9OekdGIH8rzK4gBJDxvdcFMBSLT8qo/1/2G+78ncJy1p4wOSgQK1tTI1fU
         TOC7LL+zsVSxmUd8G58L/6Bbpf0HFRxnQyUzaKzpIWVfRe6W7uXg2pRMcsSr8tRO0fVE
         XYfAvIsQfgh187fTtaYTC7FdZAn69xsEWqlvdjtvugC7DuSkjgG35gQtROPIl0CKl8ww
         g41EHQazrotoxzhqE9+SoLjO1obBMMvyog9gX0wTYEgGITxipka+DUfpnXTd3/2ij8j3
         Wv3OA0QDM0urIaNSeSqTXep3n7KGwKrHroyEYUqesPbv0lRuGjwRNWiGakaYoK/5WkGj
         8agw==
X-Gm-Message-State: AOJu0YySZuK8L+BmQyPM4u7mh9vRXrg83WGYTFxZgt5mhHRiqVwDrQCa
	y/0PqSRJDlZsxbarxhbnBabuNkn+n7MWPRQy52NMuhciSXPRb8HXeCYwIP4Pr+XnwZlkdIcg1CE
	HVWg=
X-Google-Smtp-Source: AGHT+IGl+jcja4m/MU00cdn/ZAVvrCiijYwwRz1no2Yal4kdantqZIbqF2IKRw0UMtOqBz/1vjY/fg==
X-Received: by 2002:a17:906:e907:b0:a59:bd78:34ca with SMTP id a640c23a62f3a-a62643e2443mr220690166b.36.1716581027828;
        Fri, 24 May 2024 13:03:47 -0700 (PDT)
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	"consulting @ bugseng . com" <consulting@bugseng.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>,
	Federico Serafini <federico.serafini@bugseng.com>,
	Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH v2 05/13] xen/bitops: Implement generic_f?sl() in lib/
Date: Fri, 24 May 2024 21:03:30 +0100
Message-Id: <20240524200338.1232391-6-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

generic_f?s() being static inline is the cause of lots of the complexity
between the common and arch-specific bitops.h

They appear to be static inline for constant-folding reasons (ARM uses them
for this), but there are better ways to achieve the same effect.

It is presumptuous that an unrolled binary search is the right algorithm to
use on all microarchitectures.  Indeed, it's not for the eventual users, but
that can be addressed at a later point.

It is also nonsense to implement the int form as the base primitive and
construct the long form from 2x int in 64-bit builds, when it's just one extra
step to operate at the native register width.

Therefore, implement generic_f?sl() in lib/.  They're not actually needed in
x86/ARM/PPC by the end of the cleanup (i.e. the functions will be dropped by
the linker), and they're only expected be needed by RISC-V on hardware which
lacks the Zbb extension.

Implement generic_fls() in terms of generic_flsl() for now, but this will be
cleaned up in due course.

Provide basic runtime testing using __constructor inside the lib/ file.  This
is important, as it means testing runs if and only if generic_f?sl() are used
elsewhere in Xen.

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
 * New

I suspect we want to swap CONFIG_DEBUG for CONFIG_BOOT_UNIT_TESTS in due
course.  These ought to be able to be used in a release build too.
---
 xen/arch/arm/include/asm/bitops.h |  2 +-
 xen/arch/ppc/include/asm/bitops.h |  2 +-
 xen/include/xen/bitops.h          | 89 ++-----------------------------
 xen/lib/Makefile                  |  2 +
 xen/lib/generic-ffsl.c            | 65 ++++++++++++++++++++++
 xen/lib/generic-flsl.c            | 68 +++++++++++++++++++++++
 6 files changed, 142 insertions(+), 86 deletions(-)
 create mode 100644 xen/lib/generic-ffsl.c
 create mode 100644 xen/lib/generic-flsl.c

diff --git a/xen/arch/arm/include/asm/bitops.h b/xen/arch/arm/include/asm/bitops.h
index 199252201291..ec1cf7b9b323 100644
--- a/xen/arch/arm/include/asm/bitops.h
+++ b/xen/arch/arm/include/asm/bitops.h
@@ -150,7 +150,7 @@ static inline int fls(unsigned int x)
         int ret;
 
         if (__builtin_constant_p(x))
-               return generic_fls(x);
+               return generic_flsl(x);
 
         asm("clz\t%"__OP32"0, %"__OP32"1" : "=r" (ret) : "r" (x));
         return 32 - ret;
diff --git a/xen/arch/ppc/include/asm/bitops.h b/xen/arch/ppc/include/asm/bitops.h
index bea655796d64..ab692d01717b 100644
--- a/xen/arch/ppc/include/asm/bitops.h
+++ b/xen/arch/ppc/include/asm/bitops.h
@@ -172,7 +172,7 @@ static inline int __test_and_clear_bit(int nr, volatile void *addr)
 }
 
 #define flsl(x) generic_flsl(x)
-#define fls(x) generic_fls(x)
+#define fls(x) generic_flsl(x)
 #define ffs(x) ({ unsigned int t_ = (x); fls(t_ & -t_); })
 #define ffsl(x) ({ unsigned long t_ = (x); flsl(t_ & -t_); })
 
diff --git a/xen/include/xen/bitops.h b/xen/include/xen/bitops.h
index 9b40f20381a2..cd405df96180 100644
--- a/xen/include/xen/bitops.h
+++ b/xen/include/xen/bitops.h
@@ -15,91 +15,12 @@
     (((~0ULL) << (l)) & (~0ULL >> (BITS_PER_LLONG - 1 - (h))))
 
 /*
- * ffs: find first bit set. This is defined the same way as
- * the libc and compiler builtin ffs routines, therefore
- * differs in spirit from the above ffz (man ffs).
- */
-
-static inline int generic_ffs(unsigned int x)
-{
-    int r = 1;
-
-    if (!x)
-        return 0;
-    if (!(x & 0xffff)) {
-        x >>= 16;
-        r += 16;
-    }
-    if (!(x & 0xff)) {
-        x >>= 8;
-        r += 8;
-    }
-    if (!(x & 0xf)) {
-        x >>= 4;
-        r += 4;
-    }
-    if (!(x & 3)) {
-        x >>= 2;
-        r += 2;
-    }
-    if (!(x & 1)) {
-        x >>= 1;
-        r += 1;
-    }
-    return r;
-}
-
-/*
- * fls: find last bit set.
+ * Find First/Last Set bit.
+ *
+ * Bits are labelled from 1.  Returns 0 if given 0.
  */
-
-static inline int generic_fls(unsigned int x)
-{
-    int r = 32;
-
-    if (!x)
-        return 0;
-    if (!(x & 0xffff0000u)) {
-        x <<= 16;
-        r -= 16;
-    }
-    if (!(x & 0xff000000u)) {
-        x <<= 8;
-        r -= 8;
-    }
-    if (!(x & 0xf0000000u)) {
-        x <<= 4;
-        r -= 4;
-    }
-    if (!(x & 0xc0000000u)) {
-        x <<= 2;
-        r -= 2;
-    }
-    if (!(x & 0x80000000u)) {
-        x <<= 1;
-        r -= 1;
-    }
-    return r;
-}
-
-#if BITS_PER_LONG == 64
-
-static inline int generic_ffsl(unsigned long x)
-{
-    return !x || (u32)x ? generic_ffs(x) : generic_ffs(x >> 32) + 32;
-}
-
-static inline int generic_flsl(unsigned long x)
-{
-    u32 h = x >> 32;
-
-    return h ? generic_fls(h) + 32 : generic_fls(x);
-}
-
-#else
-# define generic_ffsl generic_ffs
-# define generic_flsl generic_fls
-#endif
+unsigned int __pure generic_ffsl(unsigned long x);
+unsigned int __pure generic_flsl(unsigned long x);
 
 /*
  * Include this here because some architectures need generic_ffs/fls in
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index e63798e1d452..a48541596470 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -4,6 +4,8 @@ lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
 lib-y += find-next-bit.o
+lib-y += generic-ffsl.o
+lib-y += generic-flsl.o
 lib-y += list-sort.o
 lib-y += memchr.o
 lib-y += memchr_inv.o
diff --git a/xen/lib/generic-ffsl.c b/xen/lib/generic-ffsl.c
new file mode 100644
index 000000000000..804cbd752efe
--- /dev/null
+++ b/xen/lib/generic-ffsl.c
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <xen/bitops.h>
+#include <xen/boot-check.h>
+#include <xen/init.h>
+
+unsigned int generic_ffsl(unsigned long x)
+{
+    unsigned int r = 1;
+
+    if ( !x )
+        return 0;
+
+#if BITS_PER_LONG > 32
+    if ( !(x & 0xffffffffU) )
+    {
+        x >>= 32;
+        r += 32;
+    }
+#endif
+    if ( !(x & 0xffff) )
+    {
+        x >>= 16;
+        r += 16;
+    }
+    if ( !(x & 0xff) )
+    {
+        x >>= 8;
+        r += 8;
+    }
+    if ( !(x & 0xf) )
+    {
+        x >>= 4;
+        r += 4;
+    }
+    if ( !(x & 3) )
+    {
+        x >>= 2;
+        r += 2;
+    }
+    if ( !(x & 1) )
+    {
+        x >>= 1;
+        r += 1;
+    }
+
+    return r;
+}
+
+#ifdef CONFIG_DEBUG
+static void __init __constructor test_generic_ffsl(void)
+{
+    RUNTIME_CHECK(generic_ffsl, 0, 0);
+    RUNTIME_CHECK(generic_ffsl, 1, 1);
+    RUNTIME_CHECK(generic_ffsl, 3, 1);
+    RUNTIME_CHECK(generic_ffsl, 7, 1);
+    RUNTIME_CHECK(generic_ffsl, 6, 2);
+
+    RUNTIME_CHECK(generic_ffsl, 1UL << (BITS_PER_LONG - 1), BITS_PER_LONG);
+#if BITS_PER_LONG > 32
+    RUNTIME_CHECK(generic_ffsl, 1UL << 32, 33);
+    RUNTIME_CHECK(generic_ffsl, 1UL << 63, 64);
+#endif
+}
+#endif /* CONFIG_DEBUG */
diff --git a/xen/lib/generic-flsl.c b/xen/lib/generic-flsl.c
new file mode 100644
index 000000000000..e4543aeaf100
--- /dev/null
+++ b/xen/lib/generic-flsl.c
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <xen/bitops.h>
+#include <xen/boot-check.h>
+#include <xen/init.h>
+
+/* Mask of type UL with the upper x bits set. */
+#define UPPER_MASK(x) (~0UL << (BITS_PER_LONG - (x)))
+
+unsigned int generic_flsl(unsigned long x)
+{
+    unsigned int r = BITS_PER_LONG;
+
+    if ( !x )
+        return 0;
+
+#if BITS_PER_LONG > 32
+    if ( !(x & UPPER_MASK(32)) )
+    {
+        x <<= 32;
+        r -= 32;
+    }
+#endif
+    if ( !(x & UPPER_MASK(16)) )
+    {
+        x <<= 16;
+        r -= 16;
+    }
+    if ( !(x & UPPER_MASK(8)) )
+    {
+        x <<= 8;
+        r -= 8;
+    }
+    if ( !(x & UPPER_MASK(4)) )
+    {
+        x <<= 4;
+        r -= 4;
+    }
+    if ( !(x & UPPER_MASK(2)) )
+    {
+        x <<= 2;
+        r -= 2;
+    }
+    if ( !(x & UPPER_MASK(1)) )
+    {
+        x <<= 1;
+        r -= 1;
+    }
+
+    return r;
+}
+
+#ifdef CONFIG_DEBUG
+static void __init __constructor test_generic_flsl(void)
+{
+    RUNTIME_CHECK(generic_flsl, 0, 0);
+    RUNTIME_CHECK(generic_flsl, 1, 1);
+    RUNTIME_CHECK(generic_flsl, 3, 2);
+    RUNTIME_CHECK(generic_flsl, 7, 3);
+    RUNTIME_CHECK(generic_flsl, 6, 3);
+
+    RUNTIME_CHECK(generic_flsl, 1 | (1UL << (BITS_PER_LONG - 1)), BITS_PER_LONG);
+#if BITS_PER_LONG > 32
+    RUNTIME_CHECK(generic_flsl, 1 | (1UL << 32), 33);
+    RUNTIME_CHECK(generic_flsl, 1 | (1UL << 63), 64);
+#endif
+}
+#endif /* CONFIG_DEBUG */
-- 
2.30.2


