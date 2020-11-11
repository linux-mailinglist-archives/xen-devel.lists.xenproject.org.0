Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A3E2AFADB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25303.53021 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy3I-0006dr-Fv; Wed, 11 Nov 2020 21:53:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25303.53021; Wed, 11 Nov 2020 21:53:16 +0000
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
	id 1kcy3I-0006dB-AQ; Wed, 11 Nov 2020 21:53:16 +0000
Received: by outflank-mailman (input) for mailman id 25303;
 Wed, 11 Nov 2020 21:53:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3G-00064v-Pm
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:14 +0000
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 88650103-95b8-4958-818b-9ac90130e790;
 Wed, 11 Nov 2020 21:52:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 23so3964827wrc.8
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:49 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:47 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3G-00064v-Pm
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:14 +0000
X-Inumbo-ID: 88650103-95b8-4958-818b-9ac90130e790
Received: from mail-wr1-x443.google.com (unknown [2a00:1450:4864:20::443])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 88650103-95b8-4958-818b-9ac90130e790;
	Wed, 11 Nov 2020 21:52:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id 23so3964827wrc.8
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7RO1fbeEEFsgd7lyDUOy1fpofsP4z9rSI0cQwzw9Kvk=;
        b=KO+deDdjmc/oIfnFnkk3fe+ng2FQbdeGxiyUjiaBsxgdLFHgEZfW0cBBc135s2SxXl
         1+IUMKZ+bZCMZgHcX6+nOdZRGaRP5pooOtM+7omdkkXli0MzIp/Un1DJiwX1huQXRmcX
         aUbENgTHvbXOKP1nDXajqDDAoQvPjMeAlQdfreEpiexg+zIQ6YseOWaXyJ+Edj2r/ja8
         cY+5WDdHi4w4ugZEJGjizRia200NjurxQf/P1CheLezL7usvcI+CV2GHRHc+tOVnmlze
         0x3lC1yZDjH6FiPaGGBP53gcMIjlFD0yUVTcciGnsrjqMorwWt56ULf/DCb7bGhy+2bp
         rwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7RO1fbeEEFsgd7lyDUOy1fpofsP4z9rSI0cQwzw9Kvk=;
        b=mlPOxeKLlU2MzjVntzXUs80VxXseK6kouLhVS7pCAMmmQs8BDYydpsFZU/Zw7jn6G/
         maDJ3TpaauaiSOXO0cugar0yPMl7LndnC+qLq6YsGFAP5plsGqOmVZnWpxor+F0NSCBw
         ZAInjPM+7ZJUDqaKJtvFQ3/A4QX2QNHF9LQzjjnXJOdnXC7/ulw6zpDWDSo7Xmud6P0x
         ae0KLtkAIXgThY9HH2wSpFhPWy7gR4eiiCmvlncUMEJhXVjMQ4npHO2nFAomejeNjSc8
         o9oC6pxWbDqGnOwwvdCQA/rNYRhrrcpnWcSrWeNUHF/1xYlIbEw9ltrLvgHws+lHvAYA
         tyUQ==
X-Gm-Message-State: AOAM530NjQwd6uB4woP1+4nhZAX4/TEQnKWr+SlRz7kw2zoewhbM/Ea0
	+bE/5hinp+U+5s30l3XmdXmIQVkTV0I=
X-Google-Smtp-Source: ABdhPJzYqOUBmnW7c4C8WSAck44Yq++828fMpKee3j+Rd+usbytDU7wpgVgP8fBYmcQw2YmLWOtZwQ==
X-Received: by 2002:adf:d84b:: with SMTP id k11mr15840677wrl.305.1605131568233;
        Wed, 11 Nov 2020 13:52:48 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:47 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 08/15] xen/arm64: port Linux's arm64 atomic_ll_sc.h to Xen
Date: Wed, 11 Nov 2020 21:51:56 +0000
Message-Id: <20201111215203.80336-9-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

Most of the "work" here is simply deleting the atomic64_t helper
definitions as we don't have an atomic64_t type in Xen.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm64/atomic_ll_sc.h | 134 +----------------------
 1 file changed, 6 insertions(+), 128 deletions(-)

diff --git a/xen/include/asm-arm/arm64/atomic_ll_sc.h b/xen/include/asm-arm/arm64/atomic_ll_sc.h
index e1009c0f94..20b0cb174e 100644
--- a/xen/include/asm-arm/arm64/atomic_ll_sc.h
+++ b/xen/include/asm-arm/arm64/atomic_ll_sc.h
@@ -1,16 +1,16 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Based on arch/arm/include/asm/atomic.h
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
  *
  * Copyright (C) 1996 Russell King.
  * Copyright (C) 2002 Deep Blue Solutions Ltd.
  * Copyright (C) 2012 ARM Ltd.
+ * SPDX-License-Identifier: GPL-2.0-only
  */
 
-#ifndef __ASM_ATOMIC_LL_SC_H
-#define __ASM_ATOMIC_LL_SC_H
+#ifndef __ASM_ARM_ARM64_ATOMIC_LL_SC_H
+#define __ASM_ARM_ARM64_ATOMIC_LL_SC_H
 
-#include <linux/stringify.h>
+#include <xen/stringify.h>
 
 #ifdef CONFIG_ARM64_LSE_ATOMICS
 #define __LL_SC_FALLBACK(asm_ops)					\
@@ -134,128 +134,6 @@ ATOMIC_OPS(andnot, bic, )
 #undef ATOMIC_OP_RETURN
 #undef ATOMIC_OP
 
-#define ATOMIC64_OP(op, asm_op, constraint)				\
-static inline void							\
-__ll_sc_atomic64_##op(s64 i, atomic64_t *v)				\
-{									\
-	s64 result;							\
-	unsigned long tmp;						\
-									\
-	asm volatile("// atomic64_" #op "\n"				\
-	__LL_SC_FALLBACK(						\
-"	prfm	pstl1strm, %2\n"					\
-"1:	ldxr	%0, %2\n"						\
-"	" #asm_op "	%0, %0, %3\n"					\
-"	stxr	%w1, %0, %2\n"						\
-"	cbnz	%w1, 1b")						\
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)		\
-	: __stringify(constraint) "r" (i));				\
-}
-
-#define ATOMIC64_OP_RETURN(name, mb, acq, rel, cl, op, asm_op, constraint)\
-static inline long							\
-__ll_sc_atomic64_##op##_return##name(s64 i, atomic64_t *v)		\
-{									\
-	s64 result;							\
-	unsigned long tmp;						\
-									\
-	asm volatile("// atomic64_" #op "_return" #name "\n"		\
-	__LL_SC_FALLBACK(						\
-"	prfm	pstl1strm, %2\n"					\
-"1:	ld" #acq "xr	%0, %2\n"					\
-"	" #asm_op "	%0, %0, %3\n"					\
-"	st" #rel "xr	%w1, %0, %2\n"					\
-"	cbnz	%w1, 1b\n"						\
-"	" #mb )								\
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)		\
-	: __stringify(constraint) "r" (i)				\
-	: cl);								\
-									\
-	return result;							\
-}
-
-#define ATOMIC64_FETCH_OP(name, mb, acq, rel, cl, op, asm_op, constraint)\
-static inline long							\
-__ll_sc_atomic64_fetch_##op##name(s64 i, atomic64_t *v)		\
-{									\
-	s64 result, val;						\
-	unsigned long tmp;						\
-									\
-	asm volatile("// atomic64_fetch_" #op #name "\n"		\
-	__LL_SC_FALLBACK(						\
-"	prfm	pstl1strm, %3\n"					\
-"1:	ld" #acq "xr	%0, %3\n"					\
-"	" #asm_op "	%1, %0, %4\n"					\
-"	st" #rel "xr	%w2, %1, %3\n"					\
-"	cbnz	%w2, 1b\n"						\
-"	" #mb )								\
-	: "=&r" (result), "=&r" (val), "=&r" (tmp), "+Q" (v->counter)	\
-	: __stringify(constraint) "r" (i)				\
-	: cl);								\
-									\
-	return result;							\
-}
-
-#define ATOMIC64_OPS(...)						\
-	ATOMIC64_OP(__VA_ARGS__)					\
-	ATOMIC64_OP_RETURN(, dmb ish,  , l, "memory", __VA_ARGS__)	\
-	ATOMIC64_OP_RETURN(_relaxed,,  ,  ,         , __VA_ARGS__)	\
-	ATOMIC64_OP_RETURN(_acquire,, a,  , "memory", __VA_ARGS__)	\
-	ATOMIC64_OP_RETURN(_release,,  , l, "memory", __VA_ARGS__)	\
-	ATOMIC64_FETCH_OP (, dmb ish,  , l, "memory", __VA_ARGS__)	\
-	ATOMIC64_FETCH_OP (_relaxed,,  ,  ,         , __VA_ARGS__)	\
-	ATOMIC64_FETCH_OP (_acquire,, a,  , "memory", __VA_ARGS__)	\
-	ATOMIC64_FETCH_OP (_release,,  , l, "memory", __VA_ARGS__)
-
-ATOMIC64_OPS(add, add, I)
-ATOMIC64_OPS(sub, sub, J)
-
-#undef ATOMIC64_OPS
-#define ATOMIC64_OPS(...)						\
-	ATOMIC64_OP(__VA_ARGS__)					\
-	ATOMIC64_FETCH_OP (, dmb ish,  , l, "memory", __VA_ARGS__)	\
-	ATOMIC64_FETCH_OP (_relaxed,,  ,  ,         , __VA_ARGS__)	\
-	ATOMIC64_FETCH_OP (_acquire,, a,  , "memory", __VA_ARGS__)	\
-	ATOMIC64_FETCH_OP (_release,,  , l, "memory", __VA_ARGS__)
-
-ATOMIC64_OPS(and, and, L)
-ATOMIC64_OPS(or, orr, L)
-ATOMIC64_OPS(xor, eor, L)
-/*
- * GAS converts the mysterious and undocumented BIC (immediate) alias to
- * an AND (immediate) instruction with the immediate inverted. We don't
- * have a constraint for this, so fall back to register.
- */
-ATOMIC64_OPS(andnot, bic, )
-
-#undef ATOMIC64_OPS
-#undef ATOMIC64_FETCH_OP
-#undef ATOMIC64_OP_RETURN
-#undef ATOMIC64_OP
-
-static inline s64
-__ll_sc_atomic64_dec_if_positive(atomic64_t *v)
-{
-	s64 result;
-	unsigned long tmp;
-
-	asm volatile("// atomic64_dec_if_positive\n"
-	__LL_SC_FALLBACK(
-"	prfm	pstl1strm, %2\n"
-"1:	ldxr	%0, %2\n"
-"	subs	%0, %0, #1\n"
-"	b.lt	2f\n"
-"	stlxr	%w1, %0, %2\n"
-"	cbnz	%w1, 1b\n"
-"	dmb	ish\n"
-"2:")
-	: "=&r" (result), "=&r" (tmp), "+Q" (v->counter)
-	:
-	: "cc", "memory");
-
-	return result;
-}
-
 #define __CMPXCHG_CASE(w, sfx, name, sz, mb, acq, rel, cl, constraint)	\
 static inline u##sz							\
 __ll_sc__cmpxchg_case_##name##sz(volatile void *ptr,			\
@@ -350,4 +228,4 @@ __CMPXCHG_DBL(_mb, dmb ish, l, "memory")
 #undef __CMPXCHG_DBL
 #undef K
 
-#endif	/* __ASM_ATOMIC_LL_SC_H */
\ No newline at end of file
+#endif	/* __ASM_ARM_ARM64_ATOMIC_LL_SC_H */
\ No newline at end of file
-- 
2.24.3 (Apple Git-128)


