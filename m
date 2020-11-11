Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 261A62AFADA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25295.52985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy33-0006Ks-6D; Wed, 11 Nov 2020 21:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25295.52985; Wed, 11 Nov 2020 21:53:01 +0000
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
	id 1kcy33-0006Jz-0P; Wed, 11 Nov 2020 21:53:01 +0000
Received: by outflank-mailman (input) for mailman id 25295;
 Wed, 11 Nov 2020 21:52:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy31-00064v-P1
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:59 +0000
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0773842-facd-4d42-8abf-566e5bfed63a;
 Wed, 11 Nov 2020 21:52:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c9so3559143wml.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:43 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:41 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy31-00064v-P1
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:52:59 +0000
X-Inumbo-ID: e0773842-facd-4d42-8abf-566e5bfed63a
Received: from mail-wm1-x334.google.com (unknown [2a00:1450:4864:20::334])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e0773842-facd-4d42-8abf-566e5bfed63a;
	Wed, 11 Nov 2020 21:52:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id c9so3559143wml.5
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3+/74+RXl1H91X5ZF9JOoW4t9e/MjX4Wl/UlElI//SE=;
        b=YNtR/mlRT3gzJELs4HDv+CjYlKzeA9m1SJjlGWxGo37smGmcx1ICeSJKDNHwWkGzJl
         TPapNwU+9WDbOBWUhoXtVU0w76Eub/Vjv15ma6WNTE41bo0Gsyw3vH8uP/J03PTi4FZm
         1dd7C1ak5dtWlarbez6hrpuYS7BaARZjrxDsnUvr18LpO6sNvhNfuQppy8GBidR7hBNI
         /8SjYpQ32yIkEjM9duRVd9KExhHcm7MC5jIK/aqxCcEvxMixJU/UutXyRHfORF+Xudbu
         q+owN+ghJ7KKRohwSU2ONwWesOkGC3L/eRvt9QMa05Xa9sFkEURd/6Omz8FQtuGroIcq
         jBhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3+/74+RXl1H91X5ZF9JOoW4t9e/MjX4Wl/UlElI//SE=;
        b=g472sGGJojv2gsoOEmaNS+vAERiATuAo/OQg6q0v1Dv00d6N/l4+xIJkPdfrjtsuAy
         4w1UVaT62HM3+OKCJA7hpT0i1p0HQNf/DzTFpBd+2PvSBgGTKDZ2zcGlbz1FkWkAjCzB
         s0hCUyF+Rvzs6T/YzzP0uRRGi2cQ3sNxm9FB8/NlPY7oWnQzjtjt+TZvJ7vgH/HLZNLU
         AvRxcNltzeGot4eYtAywsk/7wUqxfUNKZaHzDna0GYnpqFqOujrcIpdohwHBIJvA7Ebh
         uOi6y34CdUzXJf8bFDbraXfNF+pqiSFmD402DpxGHegwqJ4Zc0fQJlLHGsF3fiq+9iiN
         UP6g==
X-Gm-Message-State: AOAM530+jSKluZzvuDdQWCX5hRt3KmxItOYDQlovQrDj37S4kouTJck2
	Jeb1HxPlPFJVVY/heZOMqQr4Qe3D/Zs=
X-Google-Smtp-Source: ABdhPJxjbmQePSEubjeQTycD3G62AK4kgy1YGoyzSFvMK+1rR81b72aa16dQZoW5PugXxPajldPhBQ==
X-Received: by 2002:a05:600c:2319:: with SMTP id 25mr6471524wmo.102.1605131561937;
        Wed, 11 Nov 2020 13:52:41 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:41 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 04/15] xen/arm: Delete Xen atomics helpers
Date: Wed, 11 Nov 2020 21:51:52 +0000
Message-Id: <20201111215203.80336-5-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

To maintain clean diffs and dissectability, let's delete the existing
Xen atomics helpers before pulling in the Linux versions.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm32/atomic.h  | 175 ---------------------
 xen/include/asm-arm/arm32/cmpxchg.h | 229 ----------------------------
 xen/include/asm-arm/arm64/atomic.h  | 148 ------------------
 xen/include/asm-arm/arm64/cmpxchg.h | 183 ----------------------
 4 files changed, 735 deletions(-)
 delete mode 100644 xen/include/asm-arm/arm32/atomic.h
 delete mode 100644 xen/include/asm-arm/arm32/cmpxchg.h
 delete mode 100644 xen/include/asm-arm/arm64/atomic.h
 delete mode 100644 xen/include/asm-arm/arm64/cmpxchg.h

diff --git a/xen/include/asm-arm/arm32/atomic.h b/xen/include/asm-arm/arm32/atomic.h
deleted file mode 100644
index 2832a72792..0000000000
--- a/xen/include/asm-arm/arm32/atomic.h
+++ /dev/null
@@ -1,175 +0,0 @@
-/*
- *  arch/arm/include/asm/atomic.h
- *
- *  Copyright (C) 1996 Russell King.
- *  Copyright (C) 2002 Deep Blue Solutions Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- */
-#ifndef __ARCH_ARM_ARM32_ATOMIC__
-#define __ARCH_ARM_ARM32_ATOMIC__
-
-/*
- * ARMv6 UP and SMP safe atomic ops.  We use load exclusive and
- * store exclusive to ensure that these are atomic.  We may loop
- * to ensure that the update happens.
- */
-static inline void atomic_add(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	prefetchw(&v->counter);
-	__asm__ __volatile__("@ atomic_add\n"
-"1:	ldrex	%0, [%3]\n"
-"	add	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (i)
-	: "cc");
-}
-
-static inline int atomic_add_return(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	smp_mb();
-	prefetchw(&v->counter);
-
-	__asm__ __volatile__("@ atomic_add_return\n"
-"1:	ldrex	%0, [%3]\n"
-"	add	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (i)
-	: "cc");
-
-	smp_mb();
-
-	return result;
-}
-
-static inline void atomic_sub(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	prefetchw(&v->counter);
-	__asm__ __volatile__("@ atomic_sub\n"
-"1:	ldrex	%0, [%3]\n"
-"	sub	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (i)
-	: "cc");
-}
-
-static inline int atomic_sub_return(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	smp_mb();
-	prefetchw(&v->counter);
-
-	__asm__ __volatile__("@ atomic_sub_return\n"
-"1:	ldrex	%0, [%3]\n"
-"	sub	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (i)
-	: "cc");
-
-	smp_mb();
-
-	return result;
-}
-
-static inline void atomic_and(int m, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	prefetchw(&v->counter);
-	__asm__ __volatile__("@ atomic_and\n"
-"1:	ldrex	%0, [%3]\n"
-"	and	%0, %0, %4\n"
-"	strex	%1, %0, [%3]\n"
-"	teq	%1, #0\n"
-"	bne	1b"
-	: "=&r" (result), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "Ir" (m)
-	: "cc");
-}
-
-static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
-{
-	int oldval;
-	unsigned long res;
-
-	smp_mb();
-	prefetchw(&ptr->counter);
-
-	do {
-		__asm__ __volatile__("@ atomic_cmpxchg\n"
-		"ldrex	%1, [%3]\n"
-		"mov	%0, #0\n"
-		"teq	%1, %4\n"
-		"strexeq %0, %5, [%3]\n"
-		    : "=&r" (res), "=&r" (oldval), "+Qo" (ptr->counter)
-		    : "r" (&ptr->counter), "Ir" (old), "r" (new)
-		    : "cc");
-	} while (res);
-
-	smp_mb();
-
-	return oldval;
-}
-
-static inline int __atomic_add_unless(atomic_t *v, int a, int u)
-{
-	int oldval, newval;
-	unsigned long tmp;
-
-	smp_mb();
-	prefetchw(&v->counter);
-
-	__asm__ __volatile__ ("@ atomic_add_unless\n"
-"1:	ldrex	%0, [%4]\n"
-"	teq	%0, %5\n"
-"	beq	2f\n"
-"	add	%1, %0, %6\n"
-"	strex	%2, %1, [%4]\n"
-"	teq	%2, #0\n"
-"	bne	1b\n"
-"2:"
-	: "=&r" (oldval), "=&r" (newval), "=&r" (tmp), "+Qo" (v->counter)
-	: "r" (&v->counter), "r" (u), "r" (a)
-	: "cc");
-
-	if (oldval != u)
-		smp_mb();
-
-	return oldval;
-}
-
-#endif /* __ARCH_ARM_ARM32_ATOMIC__ */
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 8
- * indent-tabs-mode: t
- * End:
- */
diff --git a/xen/include/asm-arm/arm32/cmpxchg.h b/xen/include/asm-arm/arm32/cmpxchg.h
deleted file mode 100644
index b0bd1d8b68..0000000000
--- a/xen/include/asm-arm/arm32/cmpxchg.h
+++ /dev/null
@@ -1,229 +0,0 @@
-#ifndef __ASM_ARM32_CMPXCHG_H
-#define __ASM_ARM32_CMPXCHG_H
-
-#include <xen/prefetch.h>
-
-extern void __bad_xchg(volatile void *, int);
-
-static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
-{
-	unsigned long ret;
-	unsigned int tmp;
-
-	smp_mb();
-	prefetchw((const void *)ptr);
-
-	switch (size) {
-	case 1:
-		asm volatile("@	__xchg1\n"
-		"1:	ldrexb	%0, [%3]\n"
-		"	strexb	%1, %2, [%3]\n"
-		"	teq	%1, #0\n"
-		"	bne	1b"
-			: "=&r" (ret), "=&r" (tmp)
-			: "r" (x), "r" (ptr)
-			: "memory", "cc");
-		break;
-	case 4:
-		asm volatile("@	__xchg4\n"
-		"1:	ldrex	%0, [%3]\n"
-		"	strex	%1, %2, [%3]\n"
-		"	teq	%1, #0\n"
-		"	bne	1b"
-			: "=&r" (ret), "=&r" (tmp)
-			: "r" (x), "r" (ptr)
-			: "memory", "cc");
-		break;
-	default:
-		__bad_xchg(ptr, size), ret = 0;
-		break;
-	}
-	smp_mb();
-
-	return ret;
-}
-
-#define xchg(ptr,x) \
-	((__typeof__(*(ptr)))__xchg((unsigned long)(x),(ptr),sizeof(*(ptr))))
-
-/*
- * Atomic compare and exchange.  Compare OLD with MEM, if identical,
- * store NEW in MEM.  Return the initial value in MEM.  Success is
- * indicated by comparing RETURN with OLD.
- */
-
-extern unsigned long __bad_cmpxchg(volatile void *ptr, int size);
-
-#define __CMPXCHG_CASE(sz, name)					\
-static inline bool __cmpxchg_case_##name(volatile void *ptr,		\
-					 unsigned long *old,		\
-					 unsigned long new,		\
-					 bool timeout,			\
-					 unsigned int max_try)		\
-{									\
-	unsigned long oldval;						\
-	unsigned long res;						\
-									\
-	do {								\
-		asm volatile("@ __cmpxchg_case_" #name "\n"		\
-		"	ldrex" #sz "	%1, [%2]\n"			\
-		"	mov	%0, #0\n"				\
-		"	teq	%1, %3\n"				\
-		"	strex" #sz "eq %0, %4, [%2]\n"			\
-		: "=&r" (res), "=&r" (oldval)				\
-		: "r" (ptr), "Ir" (*old), "r" (new)			\
-		: "memory", "cc");					\
-									\
-		if (!res)						\
-			break;						\
-	} while (!timeout || ((--max_try) > 0));			\
-									\
-	*old = oldval;							\
-									\
-	return !res;							\
-}
-
-__CMPXCHG_CASE(b, 1)
-__CMPXCHG_CASE(h, 2)
-__CMPXCHG_CASE( , 4)
-
-static inline bool __cmpxchg_case_8(volatile uint64_t *ptr,
-			 	    uint64_t *old,
-			 	    uint64_t new,
-			 	    bool timeout,
-				    unsigned int max_try)
-{
-	uint64_t oldval;
-	uint64_t res;
-
-	do {
-		asm volatile(
-		"	ldrexd		%1, %H1, [%3]\n"
-		"	teq		%1, %4\n"
-		"	teqeq		%H1, %H4\n"
-		"	movne		%0, #0\n"
-		"	movne		%H0, #0\n"
-		"	bne		2f\n"
-		"	strexd		%0, %5, %H5, [%3]\n"
-		"2:"
-		: "=&r" (res), "=&r" (oldval), "+Qo" (*ptr)
-		: "r" (ptr), "r" (*old), "r" (new)
-		: "memory", "cc");
-		if (!res)
-			break;
-	} while (!timeout || ((--max_try) > 0));
-
-	*old = oldval;
-
-	return !res;
-}
-
-static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
-					unsigned long new, int size,
-					bool timeout, unsigned int max_try)
-{
-	prefetchw((const void *)ptr);
-
-	switch (size) {
-	case 1:
-		return __cmpxchg_case_1(ptr, old, new, timeout, max_try);
-	case 2:
-		return __cmpxchg_case_2(ptr, old, new, timeout, max_try);
-	case 4:
-		return __cmpxchg_case_4(ptr, old, new, timeout, max_try);
-	default:
-		return __bad_cmpxchg(ptr, size);
-	}
-
-	ASSERT_UNREACHABLE();
-}
-
-static always_inline unsigned long __cmpxchg(volatile void *ptr,
-					     unsigned long old,
-					     unsigned long new,
-					     int size)
-{
-	smp_mb();
-	if (!__int_cmpxchg(ptr, &old, new, size, false, 0))
-		ASSERT_UNREACHABLE();
-	smp_mb();
-
-	return old;
-}
-
-/*
- * The helper may fail to update the memory if the action takes too long.
- *
- * @old: On call the value pointed contains the expected old value. It will be
- * updated to the actual old value.
- * @max_try: Maximum number of iterations
- *
- * The helper will return true when the update has succeeded (i.e no
- * timeout) and false if the update has failed.
- */
-static always_inline bool __cmpxchg_timeout(volatile void *ptr,
-					    unsigned long *old,
-					    unsigned long new,
-					    int size,
-					    unsigned int max_try)
-{
-	bool ret;
-
-	smp_mb();
-	ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
-	smp_mb();
-
-	return ret;
-}
-
-/*
- * The helper may fail to update the memory if the action takes too long.
- *
- * @old: On call the value pointed contains the expected old value. It will be
- * updated to the actual old value.
- * @max_try: Maximum number of iterations
- *
- * The helper will return true when the update has succeeded (i.e no
- * timeout) and false if the update has failed.
- */
-static always_inline bool __cmpxchg64_timeout(volatile uint64_t *ptr,
-					      uint64_t *old,
-					      uint64_t new,
-					      unsigned int max_try)
-{
-	bool ret;
-
-	smp_mb();
-	ret = __cmpxchg_case_8(ptr, old, new, true, max_try);
-	smp_mb();
-
-	return ret;
-}
-
-#define cmpxchg(ptr,o,n)						\
-	((__typeof__(*(ptr)))__cmpxchg((ptr),				\
-				       (unsigned long)(o),		\
-				       (unsigned long)(n),		\
-				       sizeof(*(ptr))))
-
-static inline uint64_t cmpxchg64(volatile uint64_t *ptr,
-				 uint64_t old,
-				 uint64_t new)
-{
-	smp_mb();
-	if (!__cmpxchg_case_8(ptr, &old, new, false, 0))
-		ASSERT_UNREACHABLE();
-	smp_mb();
-
-	return old;
-}
-
-#endif
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 8
- * indent-tabs-mode: t
- * End:
- */
diff --git a/xen/include/asm-arm/arm64/atomic.h b/xen/include/asm-arm/arm64/atomic.h
deleted file mode 100644
index 2d42567866..0000000000
--- a/xen/include/asm-arm/arm64/atomic.h
+++ /dev/null
@@ -1,148 +0,0 @@
-/*
- * Based on arch/arm64/include/asm/atomic.h
- * which in turn is
- * Based on arch/arm/include/asm/atomic.h
- *
- * Copyright (C) 1996 Russell King.
- * Copyright (C) 2002 Deep Blue Solutions Ltd.
- * Copyright (C) 2012 ARM Ltd.
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License
- * along with this program.  If not, see <http://www.gnu.org/licenses/>.
- */
-#ifndef __ARCH_ARM_ARM64_ATOMIC
-#define __ARCH_ARM_ARM64_ATOMIC
-
-/*
- * AArch64 UP and SMP safe atomic ops.  We use load exclusive and
- * store exclusive to ensure that these are atomic.  We may loop
- * to ensure that the update happens.
- */
-static inline void atomic_add(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_add\n"
-"1:	ldxr	%w0, %2\n"
-"	add	%w0, %w0, %w3\n"
-"	stxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (i));
-}
-
-static inline int atomic_add_return(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_add_return\n"
-"1:	ldxr	%w0, %2\n"
-"	add	%w0, %w0, %w3\n"
-"	stlxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (i)
-	: "memory");
-
-	smp_mb();
-	return result;
-}
-
-static inline void atomic_sub(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_sub\n"
-"1:	ldxr	%w0, %2\n"
-"	sub	%w0, %w0, %w3\n"
-"	stxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (i));
-}
-
-static inline int atomic_sub_return(int i, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_sub_return\n"
-"1:	ldxr	%w0, %2\n"
-"	sub	%w0, %w0, %w3\n"
-"	stlxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (i)
-	: "memory");
-
-	smp_mb();
-	return result;
-}
-
-static inline void atomic_and(int m, atomic_t *v)
-{
-	unsigned long tmp;
-	int result;
-
-	asm volatile("// atomic_and\n"
-"1:	ldxr	%w0, %2\n"
-"	and	%w0, %w0, %w3\n"
-"	stxr	%w1, %w0, %2\n"
-"	cbnz	%w1, 1b"
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	: "Ir" (m));
-}
-
-static inline int atomic_cmpxchg(atomic_t *ptr, int old, int new)
-{
-	unsigned long tmp;
-	int oldval;
-
-	smp_mb();
-
-	asm volatile("// atomic_cmpxchg\n"
-"1:	ldxr	%w1, %2\n"
-"	cmp	%w1, %w3\n"
-"	b.ne	2f\n"
-"	stxr	%w0, %w4, %2\n"
-"	cbnz	%w0, 1b\n"
-"2:"
-	: "=&r" (tmp), "=&r" (oldval), "+Q" (ptr->counter)
-	: "Ir" (old), "r" (new)
-	: "cc");
-
-	smp_mb();
-	return oldval;
-}
-
-static inline int __atomic_add_unless(atomic_t *v, int a, int u)
-{
-	int c, old;
-
-	c = atomic_read(v);
-	while (c != u && (old = atomic_cmpxchg((v), c, c + a)) != c)
-		c = old;
-	return c;
-}
-
-#endif
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 8
- * indent-tabs-mode: t
- * End:
- */
diff --git a/xen/include/asm-arm/arm64/cmpxchg.h b/xen/include/asm-arm/arm64/cmpxchg.h
deleted file mode 100644
index 10e4edc022..0000000000
--- a/xen/include/asm-arm/arm64/cmpxchg.h
+++ /dev/null
@@ -1,183 +0,0 @@
-#ifndef __ASM_ARM64_CMPXCHG_H
-#define __ASM_ARM64_CMPXCHG_H
-
-extern void __bad_xchg(volatile void *, int);
-
-static inline unsigned long __xchg(unsigned long x, volatile void *ptr, int size)
-{
-	unsigned long ret, tmp;
-
-	switch (size) {
-	case 1:
-		asm volatile("//	__xchg1\n"
-		"1:	ldxrb	%w0, %2\n"
-		"	stlxrb	%w1, %w3, %2\n"
-		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u8 *)ptr)
-			: "r" (x)
-			: "memory");
-		break;
-	case 2:
-		asm volatile("//	__xchg2\n"
-		"1:	ldxrh	%w0, %2\n"
-		"	stlxrh	%w1, %w3, %2\n"
-		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u16 *)ptr)
-			: "r" (x)
-			: "memory");
-		break;
-	case 4:
-		asm volatile("//	__xchg4\n"
-		"1:	ldxr	%w0, %2\n"
-		"	stlxr	%w1, %w3, %2\n"
-		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u32 *)ptr)
-			: "r" (x)
-			: "memory");
-		break;
-	case 8:
-		asm volatile("//	__xchg8\n"
-		"1:	ldxr	%0, %2\n"
-		"	stlxr	%w1, %3, %2\n"
-		"	cbnz	%w1, 1b\n"
-			: "=&r" (ret), "=&r" (tmp), "+Q" (*(u64 *)ptr)
-			: "r" (x)
-			: "memory");
-		break;
-	default:
-		__bad_xchg(ptr, size), ret = 0;
-		break;
-	}
-
-	smp_mb();
-	return ret;
-}
-
-#define xchg(ptr,x) \
-({ \
-	__typeof__(*(ptr)) __ret; \
-	__ret = (__typeof__(*(ptr))) \
-		__xchg((unsigned long)(x), (ptr), sizeof(*(ptr))); \
-	__ret; \
-})
-
-extern unsigned long __bad_cmpxchg(volatile void *ptr, int size);
-
-#define __CMPXCHG_CASE(w, sz, name)					\
-static inline bool __cmpxchg_case_##name(volatile void *ptr,		\
-					 unsigned long *old,		\
-					 unsigned long new,		\
-					 bool timeout,			\
-					 unsigned int max_try)		\
-{									\
-	unsigned long oldval;						\
-	unsigned long res;						\
-									\
-	do {								\
-		asm volatile("// __cmpxchg_case_" #name "\n"		\
-		"	ldxr" #sz "	%" #w "1, %2\n"			\
-		"	mov	%w0, #0\n"				\
-		"	cmp	%" #w "1, %" #w "3\n"			\
-		"	b.ne	1f\n"					\
-		"	stxr" #sz "	%w0, %" #w "4, %2\n"		\
-		"1:\n"							\
-		: "=&r" (res), "=&r" (oldval),				\
-		  "+Q" (*(unsigned long *)ptr)				\
-		: "Ir" (*old), "r" (new)				\
-		: "cc");						\
-									\
-		if (!res)						\
-			break;						\
-	} while (!timeout || ((--max_try) > 0));			\
-									\
-	*old = oldval;							\
-									\
-	return !res;							\
-}
-
-__CMPXCHG_CASE(w, b, 1)
-__CMPXCHG_CASE(w, h, 2)
-__CMPXCHG_CASE(w,  , 4)
-__CMPXCHG_CASE( ,  , 8)
-
-static always_inline bool __int_cmpxchg(volatile void *ptr, unsigned long *old,
-					unsigned long new, int size,
-					bool timeout, unsigned int max_try)
-{
-	switch (size) {
-	case 1:
-		return __cmpxchg_case_1(ptr, old, new, timeout, max_try);
-	case 2:
-		return __cmpxchg_case_2(ptr, old, new, timeout, max_try);
-	case 4:
-		return __cmpxchg_case_4(ptr, old, new, timeout, max_try);
-	case 8:
-		return __cmpxchg_case_8(ptr, old, new, timeout, max_try);
-	default:
-		return __bad_cmpxchg(ptr, size);
-	}
-
-	ASSERT_UNREACHABLE();
-}
-
-static always_inline unsigned long __cmpxchg(volatile void *ptr,
-					     unsigned long old,
-					     unsigned long new,
-					     int size)
-{
-	smp_mb();
-	if (!__int_cmpxchg(ptr, &old, new, size, false, 0))
-		ASSERT_UNREACHABLE();
-	smp_mb();
-
-	return old;
-}
-
-/*
- * The helper may fail to update the memory if the action takes too long.
- *
- * @old: On call the value pointed contains the expected old value. It will be
- * updated to the actual old value.
- * @max_try: Maximum number of iterations
- *
- * The helper will return true when the update has succeeded (i.e no
- * timeout) and false if the update has failed.
- */
-static always_inline bool __cmpxchg_timeout(volatile void *ptr,
-					    unsigned long *old,
-					    unsigned long new,
-					    int size,
-					    unsigned int max_try)
-{
-	bool ret;
-
-	smp_mb();
-	ret = __int_cmpxchg(ptr, old, new, size, true, max_try);
-	smp_mb();
-
-	return ret;
-}
-
-#define cmpxchg(ptr, o, n) \
-({ \
-	__typeof__(*(ptr)) __ret; \
-	__ret = (__typeof__(*(ptr))) \
-		__cmpxchg((ptr), (unsigned long)(o), (unsigned long)(n), \
-			  sizeof(*(ptr))); \
-	__ret; \
-})
-
-#define cmpxchg64(ptr, o, n) cmpxchg(ptr, o, n)
-
-#define __cmpxchg64_timeout(ptr, old, new, max_try)	\
-	__cmpxchg_timeout(ptr, old, new, 8, max_try)
-
-#endif
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 8
- * indent-tabs-mode: t
- * End:
- */
-- 
2.24.3 (Apple Git-128)


