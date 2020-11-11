Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D46E62AFAEA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25368.53077 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9Y-0007gT-RJ; Wed, 11 Nov 2020 21:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25368.53077; Wed, 11 Nov 2020 21:59:44 +0000
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
	id 1kcy9Y-0007fs-Is; Wed, 11 Nov 2020 21:59:44 +0000
Received: by outflank-mailman (input) for mailman id 25368;
 Wed, 11 Nov 2020 21:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3z-00064v-RZ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:59 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e89902fb-7dcf-49c9-809d-f4bae8f5d314;
 Wed, 11 Nov 2020 21:52:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 23so3965030wrc.8
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:56 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:54 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3z-00064v-RZ
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:59 +0000
X-Inumbo-ID: e89902fb-7dcf-49c9-809d-f4bae8f5d314
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e89902fb-7dcf-49c9-809d-f4bae8f5d314;
	Wed, 11 Nov 2020 21:52:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id 23so3965030wrc.8
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fD74UoudjvYdXmC0ErN+hXn9USTuY6/Q/RnD/8M+iRI=;
        b=Ng2wzGaRjSGtlmnnkCYihoMFHpZwADCLk1XYrol1yaUdmD12gN2MY9krmJLEMObL6M
         qeRfXzyFGXGEnelMKh4vUMrud0s6/iA/EUwfhCibNgEjEP566X9zJmiQTKX1q1ktTCLJ
         sjpCDE3p9TQ9wjWCnQQ3DZEZFqTHUKS7+uoqw8NhBfgxNhX4AeY/83a5/TN26GG57/m8
         BrqKON3pdQMW3y/pn0D9ZbfBJFvC4peOqNTzmfSMbnEyNsmhLAokvxy33FcYsY2rYPV4
         ETxMzPHoSjCSaulv2OL7l/j9EEjzSZM9JTc9q3ziGcwrZVFNQsQolZadfomxkWugAKcJ
         wqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fD74UoudjvYdXmC0ErN+hXn9USTuY6/Q/RnD/8M+iRI=;
        b=JCsgIbj02b2RowGtJ38pbdY+pQMjqSqjzi66CKL2A+lTIiB3sBb58+g/VetooaBwe9
         MfT5rdeTH1PLJlJx/bqI2G4vMxABM8sjMOTcnRHqkFiDGdEMXMZZqcRgb/iOR5AMqFGK
         6EI9+a1BtXFxtKO2U2qgz6yXlBXlAol8hO/kocR3cxr06pTH+xxPvSpabr0imzTA6A1l
         M/KaujIioWNYg/eObYvbCq5u7TCMKY5/VNwFREgRVr7bOZXBqCYL7eSb2lsBt+IcWVlC
         sTm+z9Ak07XUTqnolSA6HSOtjg8+B8bcND9DPXJ/Ij9pOPrPtOLWf9YtJB6Yv7ucxypJ
         RFeQ==
X-Gm-Message-State: AOAM530yv2AmksfNyxIGpWZ2AQdJZ6nya4NeHR32DKNkEOn+fR7WM6N1
	f4aWdU5xJgjiqUavkTa9NDt4Hid6aDw=
X-Google-Smtp-Source: ABdhPJyolI2is12QJH+ntYHmZaUJPBkLe6jN9v0sIQCa3sPAyKR5IWMzFSm2OnjNj32FgK5Am2o3aw==
X-Received: by 2002:a5d:69d1:: with SMTP id s17mr21879105wrw.104.1605131574983;
        Wed, 11 Nov 2020 13:52:54 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:54 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 14/15] xen/arm32: port Linux's arm32 cmpxchg.h to Xen
Date: Wed, 11 Nov 2020 21:52:02 +0000
Message-Id: <20201111215203.80336-15-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

 - Drop support for pre-Armv7 systems, including the workarounds for
   the swp instruction being broken on StrongARM.

 - Drop local variants as no callers in Xen.

 - Keep the compiler happy by fixing __cmpxchg64()'s ptr arg to be
   volatile, and casting ptr to be (const void *) in the call to
   prefetchw().

 - Add explicit strict variants of xchg(), cmpxchg(), and cmpxchg64(),
   as the Linux arm32 cmpxchg.h doesn't define these and they're needed
   for Xen. These strict variants are just wrappers that sandwich calls
   to the relaxed variants between two smp_mb()'s.

 - Pull in the timeout variants of cmpxchg from the original Xen
   arm32 cmpxchg.h as these are required for guest atomics and are
   not provided by Linux.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm32/cmpxchg.h | 322 ++++++++++++++++------------
 1 file changed, 188 insertions(+), 134 deletions(-)

diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
index 638ae84afb..d7189984d0 100644
--- a/xen/include/asm-arm/arm32/cmpxchg.h
+++ b/xen/include/asm-arm/arm32/cmpxchg.h
@@ -1,46 +1,24 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __ASM_ARM_CMPXCHG_H
-#define __ASM_ARM_CMPXCHG_H
-
-#include <linux/irqflags.h>
-#include <linux/prefetch.h>
-#include <asm/barrier.h>
-
-#if defined(CONFIG_CPU_SA1100) || defined(CONFIG_CPU_SA110)
 /*
- * On the StrongARM, "swp" is terminally broken since it bypasses the
- * cache totally.  This means that the cache becomes inconsistent, and,
- * since we use normal loads/stores as well, this is really bad.
- * Typically, this causes oopsen in filp_close, but could have other,
- * more disastrous effects.  There are two work-arounds:
- *  1. Disable interrupts and emulate the atomic swap
- *  2. Clean the cache, perform atomic swap, flush the cache
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
  *
- * We choose (1) since its the "easiest" to achieve here and is not
- * dependent on the processor type.
- *
- * NOTE that this solution won't work on an SMP system, so explcitly
- * forbid it here.
+ * SPDX-License-Identifier: GPL-2.0
  */
-#define swp_is_buggy
-#endif
+#ifndef __ASM_ARM_ARM32_CMPXCHG_H
+#define __ASM_ARM_ARM32_CMPXCHG_H
+
+#include <xen/prefetch.h>
+#include <xen/types.h>
+
+extern void __bad_cmpxchg(volatile void *ptr, int size);
 
 static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
 {
-	extern void __bad_xchg(volatile void *, int);
 	unsigned long ret;
-#ifdef swp_is_buggy
-	unsigned long flags;
-#endif
-#if __LINUX_ARM_ARCH__ >= 6
 	unsigned int tmp;
-#endif
 
 	prefetchw((const void *)ptr);
 
 	switch (size) {
-#if __LINUX_ARM_ARCH__ >= 6
-#ifndef CONFIG_CPU_V6 /* MIN ARCH >= V6K */
 	case 1:
 		asm volatile("@	__xchg1\n"
 		"1:	ldrexb	%0, [%3]\n"
@@ -61,7 +39,6 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
-#endif
 	case 4:
 		asm volatile("@	__xchg4\n"
 		"1:	ldrex	%0, [%3]\n"
@@ -72,42 +49,10 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 			: "r" (x), "r" (ptr)
 			: "memory", "cc");
 		break;
-#elif defined(swp_is_buggy)
-#ifdef CONFIG_SMP
-#error SMP is not supported on this platform
-#endif
-	case 1:
-		raw_local_irq_save(flags);
-		ret = *(volatile unsigned char *)ptr;
-		*(volatile unsigned char *)ptr = x;
-		raw_local_irq_restore(flags);
-		break;
 
-	case 4:
-		raw_local_irq_save(flags);
-		ret = *(volatile unsigned long *)ptr;
-		*(volatile unsigned long *)ptr = x;
-		raw_local_irq_restore(flags);
-		break;
-#else
-	case 1:
-		asm volatile("@	__xchg1\n"
-		"	swpb	%0, %1, [%2]"
-			: "=&r" (ret)
-			: "r" (x), "r" (ptr)
-			: "memory", "cc");
-		break;
-	case 4:
-		asm volatile("@	__xchg4\n"
-		"	swp	%0, %1, [%2]"
-			: "=&r" (ret)
-			: "r" (x), "r" (ptr)
-			: "memory", "cc");
-		break;
-#endif
 	default:
-		/* Cause a link-time error, the xchg() size is not supported */
-		__bad_xchg(ptr, size), ret = 0;
+		/* Cause a link-time error, the size is not supported */
+		__bad_cmpxchg(ptr, size), ret = 0;
 		break;
 	}
 
@@ -119,40 +64,6 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size
 				   sizeof(*(ptr)));			\
 })
 
-#include <asm-generic/cmpxchg-local.h>
-
-#if __LINUX_ARM_ARCH__ < 6
-/* min ARCH < ARMv6 */
-
-#ifdef CONFIG_SMP
-#error "SMP is not supported on this platform"
-#endif
-
-#define xchg xchg_relaxed
-
-/*
- * cmpxchg_local and cmpxchg64_local are atomic wrt current CPU. Always make
- * them available.
- */
-#define cmpxchg_local(ptr, o, n) ({					\
-	(__typeof(*ptr))__cmpxchg_local_generic((ptr),			\
-					        (unsigned long)(o),	\
-					        (unsigned long)(n),	\
-					        sizeof(*(ptr)));	\
-})
-
-#define cmpxchg64_local(ptr, o, n) __cmpxchg64_local_generic((ptr), (o), (n))
-
-#include <asm-generic/cmpxchg.h>
-
-#else	/* min ARCH >= ARMv6 */
-
-extern void __bad_cmpxchg(volatile void *ptr, int size);
-
-/*
- * cmpxchg only support 32-bits operands on ARMv6.
- */
-
 static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				      unsigned long new, int size)
 {
@@ -161,7 +72,6 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 	prefetchw((const void *)ptr);
 
 	switch (size) {
-#ifndef CONFIG_CPU_V6	/* min ARCH >= ARMv6K */
 	case 1:
 		do {
 			asm volatile("@ __cmpxchg1\n"
@@ -186,7 +96,6 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				: "memory", "cc");
 		} while (res);
 		break;
-#endif
 	case 4:
 		do {
 			asm volatile("@ __cmpxchg4\n"
@@ -199,6 +108,7 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				: "memory", "cc");
 		} while (res);
 		break;
+
 	default:
 		__bad_cmpxchg(ptr, size);
 		oldval = 0;
@@ -214,41 +124,14 @@ static inline unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
 				      sizeof(*(ptr)));			\
 })
 
-static inline unsigned long __cmpxchg_local(volatile void *ptr,
-					    unsigned long old,
-					    unsigned long new, int size)
-{
-	unsigned long ret;
-
-	switch (size) {
-#ifdef CONFIG_CPU_V6	/* min ARCH == ARMv6 */
-	case 1:
-	case 2:
-		ret = __cmpxchg_local_generic(ptr, old, new, size);
-		break;
-#endif
-	default:
-		ret = __cmpxchg(ptr, old, new, size);
-	}
-
-	return ret;
-}
-
-#define cmpxchg_local(ptr, o, n) ({					\
-	(__typeof(*ptr))__cmpxchg_local((ptr),				\
-				        (unsigned long)(o),		\
-				        (unsigned long)(n),		\
-				        sizeof(*(ptr)));		\
-})
-
-static inline unsigned long long __cmpxchg64(unsigned long long *ptr,
+static inline unsigned long long __cmpxchg64(volatile unsigned long long *ptr,
 					     unsigned long long old,
 					     unsigned long long new)
 {
 	unsigned long long oldval;
 	unsigned long res;
 
-	prefetchw(ptr);
+	prefetchw((const void *)ptr);
 
 	__asm__ __volatile__(
 "1:	ldrexd		%1, %H1, [%3]\n"
@@ -272,8 +155,179 @@ static inline unsigned long long __cmpxchg64(unsigned long long *ptr,
 					(unsigned long long)(n));	\
 })
 
-#define cmpxchg64_local(ptr, o, n) cmpxchg64_relaxed((ptr), (o), (n))
 
-#endif	/* __LINUX_ARM_ARCH__ >= 6 */
+/*
+ * Linux doesn't provide strict versions of xchg(), cmpxchg(), and cmpxchg64(),
+ * so manually define these for Xen as smp_mb() wrappers around the relaxed
+ * variants.
+ */
 
-#endif /* __ASM_ARM_CMPXCHG_H */
\ No newline at end of file
+#define xchg(ptr, x) ({ \
+	long ret; \
+	smp_mb(); \
+	ret = xchg_relaxed(ptr, x); \
+	smp_mb(); \
+	ret; \
+})
+
+#define cmpxchg(ptr, o, n) ({ \
+	long ret; \
+	smp_mb(); \
+	ret = cmpxchg_relaxed(ptr, o, n); \
+	smp_mb(); \
+	ret; \
+})
+
+#define cmpxchg64(ptr, o, n) ({ \
+	long long ret; \
+	smp_mb(); \
+	ret = cmpxchg64_relaxed(ptr, o, n); \
+	smp_mb(); \
+	ret; \
+})
+
+/*
+ * This code is from the original Xen arm32 cmpxchg.h, from before the
+ * Linux 5.10-rc2 atomics helpers were ported over. The only changes
+ * here are renaming the macros and functions to explicitly use
+ * "timeout" in their names so that they don't clash with the above.
+ *
+ * We need this here for guest atomics (the only user of the timeout
+ * variants).
+ */
+
+#define __CMPXCHG_TIMEOUT_CASE(sz, name)                                        \
+static inline bool __cmpxchg_timeout_case_##name(volatile void *ptr,            \
+                                         unsigned long *old,            \
+                                         unsigned long new,             \
+                                         bool timeout,                  \
+                                         unsigned int max_try)          \
+{                                                                       \
+        unsigned long oldval;                                           \
+        unsigned long res;                                              \
+                                                                        \
+        do {                                                            \
+                asm volatile("@ __cmpxchg_timeout_case_" #name "\n"             \
+                "       ldrex" #sz "    %1, [%2]\n"                     \
+                "       mov     %0, #0\n"                               \
+                "       teq     %1, %3\n"                               \
+                "       strex" #sz "eq %0, %4, [%2]\n"                  \
+                : "=&r" (res), "=&r" (oldval)                           \
+                : "r" (ptr), "Ir" (*old), "r" (new)                     \
+                : "memory", "cc");                                      \
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
+__CMPXCHG_TIMEOUT_CASE(b, 1)
+__CMPXCHG_TIMEOUT_CASE(h, 2)
+__CMPXCHG_TIMEOUT_CASE( , 4)
+
+static inline bool __cmpxchg_timeout_case_8(volatile uint64_t *ptr,
+                                    uint64_t *old,
+                                    uint64_t new,
+                                    bool timeout,
+                                    unsigned int max_try)
+{
+        uint64_t oldval;
+        uint64_t res;
+
+        do {
+                asm volatile(
+                "       ldrexd          %1, %H1, [%3]\n"
+                "       teq             %1, %4\n"
+                "       teqeq           %H1, %H4\n"
+                "       movne           %0, #0\n"
+                "       movne           %H0, #0\n"
+                "       bne             2f\n"
+                "       strexd          %0, %5, %H5, [%3]\n"
+                "2:"
+                : "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
+                : "r" (ptr), "r" (*old), "r" (new)
+                : "memory", "cc");
+                if (!res)
+                        break;
+        } while (!timeout || ((--max_try) > 0));
+
+        *old = oldval;
+
+        return !res;
+}
+
+static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
+                                        unsigned long new, int size,
+                                        bool timeout, unsigned int max_try)
+{
+        prefetchw((const void *)ptr);
+
+        switch (size) {
+        case 1:
+                return __cmpxchg_timeout_case_1(ptr, old, new, timeout, max_try);
+        case 2:
+                return __cmpxchg_timeout_case_2(ptr, old, new, timeout, max_try);
+        case 4:
+                return __cmpxchg_timeout_case_4(ptr, old, new, timeout, max_try);
+        default:
+                __bad_cmpxchg(ptr, size);
+				return false;
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
+static always_inline bool __cmpxchg64_timeout(volatile uint64_t *ptr,
+                                              uint64_t *old,
+                                              uint64_t new,
+                                              unsigned int max_try)
+{
+        bool ret;
+
+        smp_mb();
+        ret = __cmpxchg_timeout_case_8(ptr, old, new, true, max_try);
+        smp_mb();
+
+        return ret;
+}
+
+#endif /* __ASM_ARM_ARM32_CMPXCHG_H */
-- 
2.24.3 (Apple Git-128)


