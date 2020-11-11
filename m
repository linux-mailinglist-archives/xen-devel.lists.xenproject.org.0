Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D572AFAE9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25369.53097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9Z-0007j3-RO; Wed, 11 Nov 2020 21:59:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25369.53097; Wed, 11 Nov 2020 21:59:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9Z-0007hN-Cl; Wed, 11 Nov 2020 21:59:45 +0000
Received: by outflank-mailman (input) for mailman id 25369;
 Wed, 11 Nov 2020 21:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3V-00064v-QI
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:29 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c5224aac-a27f-435e-829f-b96da6d16fe3;
 Wed, 11 Nov 2020 21:52:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p8so3986703wrx.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:52 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:50 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3V-00064v-QI
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:29 +0000
X-Inumbo-ID: c5224aac-a27f-435e-829f-b96da6d16fe3
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c5224aac-a27f-435e-829f-b96da6d16fe3;
	Wed, 11 Nov 2020 21:52:52 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id p8so3986703wrx.5
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BBJwuz9SQvVyH51XqrVftJIZ0i+2M/l+kiSJyhKCl9k=;
        b=XlzDxZVRka1KzvX5UJrwjhiosi0LTKxfDC1uz5BD3yOlL+I42WiaVPwKI9+aqVKXql
         5YBd4vgOHXP4dK47MDifcU3g2YSqLpxdvo+pAaGTLsPTj9NdIaphWCTKGSnUlkHMg+4S
         fs3zpJKk77/1AfGsFX1E6KRnBYP8uBpkPLtVasjZFSJL/6lKpmiPA/JBKEOBapTUFiKH
         cRr9WFfgk1InFZPGSUHkKJ3hV/fV9APjaw2abeMHb8vo1ONFxu19mPPmmDBAdI3r5gR+
         cJjpO++2/qhasb2xm057E8xKo7UjRoRC81aXvxvDmiJ8avbDfS/65UFyiKgfOPYl+Wkb
         ZM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BBJwuz9SQvVyH51XqrVftJIZ0i+2M/l+kiSJyhKCl9k=;
        b=in/N5AYoKBXnrx+nnFqfsoTaB+4rdiDjvzRM0ECjc2WxxIM3Lgu6g1u/c7u5//9pt0
         0eYyyAsEU6HfMaiumAxxHQUA52M/3WPL7+p++cb7Es0+WrJFm7XyDgwY3LOrMJUzRmco
         lnhewLYFqGRM6asiyE9gQ+v2KVATzZKycgXvSAWwpd0dpi0NCZ/6Kx5w+kxT1XbKv2Ub
         E7DTFTf3f/xB2Nj2v7GD456fUBuAldalxHdV+zocH6obWb9diIutQ01XYpyY1SnYqk80
         Gbt21wH2ZMvcKu17CHA6NowtFKUdbRLT6SKO1p0G8kNyu2oJTFUGZukkfr6As1SlRhoe
         XvyA==
X-Gm-Message-State: AOAM533EmdtH0NrUAYDgn15R73o0nmMsD6XysvkcvM1qb/14IWZKe6vH
	DyMkWr5DqUJeLHJAl6nXoyLafJZ8TO0=
X-Google-Smtp-Source: ABdhPJzCLdv2deDdC5HyuuTbfyEyMVsfKt4vC1Cap1tpREd6zqOgCLxp6yQlpIo2fvH7a8l43IhQhA==
X-Received: by 2002:adf:f246:: with SMTP id b6mr3825186wrp.238.1605131570813;
        Wed, 11 Nov 2020 13:52:50 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:50 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 10/15] xen/arm64: port Linux's arm64 cmpxchg.h to Xen
Date: Wed, 11 Nov 2020 21:51:58 +0000
Message-Id: <20201111215203.80336-11-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

 - s/arch_xchg/xchg/

 - s/arch_cmpxchg/cmpxchg/

 - Replace calls to BUILD_BUG() with calls to __bad_cmpxchg() as we
   don't currently have a BUILD_BUG() macro in Xen and this will
   equivalently cause a link-time error.

 - Replace calls to VM_BUG_ON() with BUG_ON() as we don't currently
   have a VM_BUG_ON() macro in Xen.

 - Pull in the timeout variants of cmpxchg from the original Xen
   arm64 cmpxchg.h as these are required for guest atomics and are
   not provided by Linux. Note these are always using LL/SC so we
   should ideally write LSE versions at some point.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm64/cmpxchg.h | 165 ++++++++++++++++++++++------
 1 file changed, 131 insertions(+), 34 deletions(-)

diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
index c51388216e..a5282cf66e 100644
--- a/xen/include/asm-arm/arm64/cmpxchg.h
+++ b/xen/include/asm-arm/arm64/cmpxchg.h
@@ -1,17 +1,16 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Based on arch/arm/include/asm/cmpxchg.h
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
  *
  * Copyright (C) 2012 ARM Ltd.
+ * SPDX-License-Identifier: GPL-2.0-only
  */
-#ifndef __ASM_CMPXCHG_H
-#define __ASM_CMPXCHG_H
+#ifndef __ASM_ARM_ARM64_CMPXCHG_H
+#define __ASM_ARM_ARM64_CMPXCHG_H
 
-#include <linux/build_bug.h>
-#include <linux/compiler.h>
+#include <asm/bug.h>
+#include "lse.h"
 
-#include <asm/barrier.h>
-#include <asm/lse.h>
+extern unsigned long __bad_cmpxchg(volatile void *ptr, int size);
 
 /*
  * We need separate acquire parameters for ll/sc and lse, since the full
@@ -33,7 +32,9 @@ static inline u##sz __xchg_case_##name##sz(u##sz x, volatile void *ptr)		\
 	"	" #mb,								\
 	/* LSE atomics */							\
 	"	swp" #acq_lse #rel #sfx "\t%" #w "3, %" #w "0, %2\n"		\
-		__nops(3)							\
+		"nop\n"							\
+		"nop\n"							\
+		"nop\n"							\
 	"	" #nop_lse)							\
 	: "=&r" (ret), "=&r" (tmp), "+Q" (*(u##sz *)ptr)			\
 	: "r" (x)								\
@@ -62,7 +63,7 @@ __XCHG_CASE( ,  ,  mb_, 64, dmb ish, nop,  , a, l, "memory")
 #undef __XCHG_CASE
 
 #define __XCHG_GEN(sfx)							\
-static __always_inline  unsigned long __xchg##sfx(unsigned long x,	\
+static always_inline  unsigned long __xchg##sfx(unsigned long x,	\
 					volatile void *ptr,		\
 					int size)			\
 {									\
@@ -76,7 +77,7 @@ static __always_inline  unsigned long __xchg##sfx(unsigned long x,	\
 	case 8:								\
 		return __xchg_case##sfx##_64(x, ptr);			\
 	default:							\
-		BUILD_BUG();						\
+		return __bad_cmpxchg(ptr, size);						\
 	}								\
 									\
 	unreachable();							\
@@ -98,10 +99,10 @@ __XCHG_GEN(_mb)
 })
 
 /* xchg */
-#define arch_xchg_relaxed(...)	__xchg_wrapper(    , __VA_ARGS__)
-#define arch_xchg_acquire(...)	__xchg_wrapper(_acq, __VA_ARGS__)
-#define arch_xchg_release(...)	__xchg_wrapper(_rel, __VA_ARGS__)
-#define arch_xchg(...)		__xchg_wrapper( _mb, __VA_ARGS__)
+#define xchg_relaxed(...)	__xchg_wrapper(    , __VA_ARGS__)
+#define xchg_acquire(...)	__xchg_wrapper(_acq, __VA_ARGS__)
+#define xchg_release(...)	__xchg_wrapper(_rel, __VA_ARGS__)
+#define xchg(...)		__xchg_wrapper( _mb, __VA_ARGS__)
 
 #define __CMPXCHG_CASE(name, sz)			\
 static inline u##sz __cmpxchg_case_##name##sz(volatile void *ptr,	\
@@ -148,7 +149,7 @@ __CMPXCHG_DBL(_mb)
 #undef __CMPXCHG_DBL
 
 #define __CMPXCHG_GEN(sfx)						\
-static __always_inline unsigned long __cmpxchg##sfx(volatile void *ptr,	\
+static always_inline unsigned long __cmpxchg##sfx(volatile void *ptr,	\
 					   unsigned long old,		\
 					   unsigned long new,		\
 					   int size)			\
@@ -163,7 +164,7 @@ static __always_inline unsigned long __cmpxchg##sfx(volatile void *ptr,	\
 	case 8:								\
 		return __cmpxchg_case##sfx##_64(ptr, old, new);		\
 	default:							\
-		BUILD_BUG();						\
+		return __bad_cmpxchg(ptr, size);						\
 	}								\
 									\
 	unreachable();							\
@@ -186,18 +187,18 @@ __CMPXCHG_GEN(_mb)
 })
 
 /* cmpxchg */
-#define arch_cmpxchg_relaxed(...)	__cmpxchg_wrapper(    , __VA_ARGS__)
-#define arch_cmpxchg_acquire(...)	__cmpxchg_wrapper(_acq, __VA_ARGS__)
-#define arch_cmpxchg_release(...)	__cmpxchg_wrapper(_rel, __VA_ARGS__)
-#define arch_cmpxchg(...)		__cmpxchg_wrapper( _mb, __VA_ARGS__)
-#define arch_cmpxchg_local		arch_cmpxchg_relaxed
+#define cmpxchg_relaxed(...)	__cmpxchg_wrapper(    , __VA_ARGS__)
+#define cmpxchg_acquire(...)	__cmpxchg_wrapper(_acq, __VA_ARGS__)
+#define cmpxchg_release(...)	__cmpxchg_wrapper(_rel, __VA_ARGS__)
+#define cmpxchg(...)		__cmpxchg_wrapper( _mb, __VA_ARGS__)
+#define cmpxchg_local		cmpxchg_relaxed
 
 /* cmpxchg64 */
-#define arch_cmpxchg64_relaxed		arch_cmpxchg_relaxed
-#define arch_cmpxchg64_acquire		arch_cmpxchg_acquire
-#define arch_cmpxchg64_release		arch_cmpxchg_release
-#define arch_cmpxchg64			arch_cmpxchg
-#define arch_cmpxchg64_local		arch_cmpxchg_local
+#define cmpxchg64_relaxed		cmpxchg_relaxed
+#define cmpxchg64_acquire		cmpxchg_acquire
+#define cmpxchg64_release		cmpxchg_release
+#define cmpxchg64			cmpxchg
+#define cmpxchg64_local		cmpxchg_local
 
 /* cmpxchg_double */
 #define system_has_cmpxchg_double()     1
@@ -205,11 +206,11 @@ __CMPXCHG_GEN(_mb)
 #define __cmpxchg_double_check(ptr1, ptr2)					\
 ({										\
 	if (sizeof(*(ptr1)) != 8)						\
-		BUILD_BUG();							\
-	VM_BUG_ON((unsigned long *)(ptr2) - (unsigned long *)(ptr1) != 1);	\
+		return __bad_cmpxchg(ptr, size);							\
+	BUG_ON((unsigned long *)(ptr2) - (unsigned long *)(ptr1) != 1);	\
 })
 
-#define arch_cmpxchg_double(ptr1, ptr2, o1, o2, n1, n2)				\
+#define cmpxchg_double(ptr1, ptr2, o1, o2, n1, n2)				\
 ({										\
 	int __ret;								\
 	__cmpxchg_double_check(ptr1, ptr2);					\
@@ -219,7 +220,7 @@ __CMPXCHG_GEN(_mb)
 	__ret;									\
 })
 
-#define arch_cmpxchg_double_local(ptr1, ptr2, o1, o2, n1, n2)			\
+#define cmpxchg_double_local(ptr1, ptr2, o1, o2, n1, n2)			\
 ({										\
 	int __ret;								\
 	__cmpxchg_double_check(ptr1, ptr2);					\
@@ -255,7 +256,7 @@ __CMPWAIT_CASE( ,  , 64);
 #undef __CMPWAIT_CASE
 
 #define __CMPWAIT_GEN(sfx)						\
-static __always_inline void __cmpwait##sfx(volatile void *ptr,		\
+static always_inline void __cmpwait##sfx(volatile void *ptr,		\
 				  unsigned long val,			\
 				  int size)				\
 {									\
@@ -269,7 +270,7 @@ static __always_inline void __cmpwait##sfx(volatile void *ptr,		\
 	case 8:								\
 		return __cmpwait_case##sfx##_64(ptr, val);		\
 	default:							\
-		BUILD_BUG();						\
+		__bad_cmpxchg(ptr, size);						\
 	}								\
 									\
 	unreachable();							\
@@ -282,4 +283,100 @@ __CMPWAIT_GEN()
 #define __cmpwait_relaxed(ptr, val) \
 	__cmpwait((ptr), (unsigned long)(val), sizeof(*(ptr)))
 
-#endif	/* __ASM_CMPXCHG_H */
\ No newline at end of file
+/*
+ * This code is from the original Xen arm64 cmpxchg.h, from before the
+ * Linux 5.10-rc2 atomics helpers were ported over. The only changes
+ * here are renaming the macros and functions to explicitly use
+ * "timeout" in their names so that they don't clash with the above.
+ *
+ * We need this here for guest atomics (the only user of the timeout
+ * variants).
+ */
+
+#define __CMPXCHG_TIMEOUT_CASE(w, sz, name)                             \
+static inline bool __cmpxchg_timeout_case_##name(volatile void *ptr,    \
+                                         unsigned long *old,            \
+                                         unsigned long new,             \
+                                         bool timeout,                  \
+                                         unsigned int max_try)          \
+{                                                                       \
+        unsigned long oldval;                                           \
+        unsigned long res;                                              \
+                                                                        \
+        do {                                                            \
+                asm volatile("// __cmpxchg_timeout_case_" #name "\n"    \
+                "       ldxr" #sz "     %" #w "1, %2\n"                 \
+                "       mov     %w0, #0\n"                              \
+                "       cmp     %" #w "1, %" #w "3\n"                   \
+                "       b.ne    1f\n"                                   \
+                "       stxr" #sz "     %w0, %" #w "4, %2\n"            \
+                "1:\n"                                                  \
+                : "=&r" (res), "=&r" (oldval),                          \
+                  "+Q" (*(unsigned long *)ptr)                          \
+                : "Ir" (*old), "r" (new)                                \
+                : "cc");                                                \
+                                                                        \
+                if (!res)                                               \
+                        break;                                          \
+        } while (!timeout || ((--max_try) > 0));                        \
+                                                                        \
+        *old = oldval;                                                  \
+                                                                        \
+        return !res;                                                    \
+}
+
+__CMPXCHG_TIMEOUT_CASE(w, b, 1)
+__CMPXCHG_TIMEOUT_CASE(w, h, 2)
+__CMPXCHG_TIMEOUT_CASE(w,  , 4)
+__CMPXCHG_TIMEOUT_CASE( ,  , 8)
+
+static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
+                                        unsigned long new, int size,
+                                        bool timeout, unsigned int max_try)
+{
+        switch (size) {
+        case 1:
+                return __cmpxchg_timeout_case_1(ptr, old, new, timeout, max_try);
+        case 2:
+                return __cmpxchg_timeout_case_2(ptr, old, new, timeout, max_try);
+        case 4:
+                return __cmpxchg_timeout_case_4(ptr, old, new, timeout, max_try);
+        case 8:
+                return __cmpxchg_timeout_case_8(ptr, old, new, timeout, max_try);
+        default:
+                return __bad_cmpxchg(ptr, size);
+        }
+
+        ASSERT_UNREACHABLE();
+}
+
+/*
+ * The helper may fail to update the memory if the action takes too long.
+ *
+ * @old: On call the value pointed contains the expected old value. It will be
+ * updated to the actual old value.
+ * @max_try: Maximum number of iterations
+ *
+ * The helper will return true when the update has succeeded (i.e no
+ * timeout) and false if the update has failed.
+ */
+static always_inline bool __cmpxchg_timeout(volatile void *ptr,
+                                            unsigned long *old,
+                                            unsigned long new,
+                                            int size,
+                                            unsigned int max_try)
+{
+        bool ret;
+
+        smp_mb();
+        ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
+        smp_mb();
+
+        return ret;
+}
+
+#define __cmpxchg64_timeout(ptr, old, new, max_try)     \
+        __cmpxchg_timeout(ptr, old, new, 8, max_try)
+
+
+#endif	/* __ASM_ARM_ARM64_CMPXCHG_H */
-- 
2.24.3 (Apple Git-128)


