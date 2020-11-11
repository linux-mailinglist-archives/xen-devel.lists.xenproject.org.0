Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED91B2AFADD
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:53:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25309.53045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy3S-0006r7-D6; Wed, 11 Nov 2020 21:53:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25309.53045; Wed, 11 Nov 2020 21:53:26 +0000
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
	id 1kcy3S-0006qD-8F; Wed, 11 Nov 2020 21:53:26 +0000
Received: by outflank-mailman (input) for mailman id 25309;
 Wed, 11 Nov 2020 21:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3Q-00064v-QQ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:24 +0000
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8535338f-947b-459b-80e8-fe6ceaf732ff;
 Wed, 11 Nov 2020 21:52:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 33so3976715wrl.7
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:50 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:49 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3Q-00064v-QQ
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:24 +0000
X-Inumbo-ID: 8535338f-947b-459b-80e8-fe6ceaf732ff
Received: from mail-wr1-x444.google.com (unknown [2a00:1450:4864:20::444])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8535338f-947b-459b-80e8-fe6ceaf732ff;
	Wed, 11 Nov 2020 21:52:50 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 33so3976715wrl.7
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+QHRVqSHfJTTG2Ygl57V4sYwrHfvgFCCMFL3g+IeQj8=;
        b=BZHrOBFOy/rx7QL8h3AKVZcmsqI9x8YiW8BYuJ4AfRMF07n2AqP9f1ySpuTIrbsgFL
         46ZB7u58zy5tEvCQZtJjo40QVdnxOlApbZYC2oPNE9ghAQr4XuVvVfEZ1SAv6H4crlHJ
         3X1/AnVsElMG0s4aJ3w0VnLhD5oNlzXe1y2GsaI3bBvF7Vhch9cMzx/w5S6D8vgQpYjS
         ROLsPAssDgJnfiYxS81SwuhiUY87EyZeMuFoHq+uZ8kaYZcekvLpQO08HAcpPUv9v5YV
         QRJS2/9g/6zhHWmh17IkhuG3Fpdncn8Pv54tYwo3ZqyaDUdZ7F2LJAtQ+1J0VTgEu/X1
         Gy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+QHRVqSHfJTTG2Ygl57V4sYwrHfvgFCCMFL3g+IeQj8=;
        b=TkxHe9hL8nTjcdHkbhXMm9aWuatYGK8TOzHYGyUE6+kDHdLfPjXTF0I60oJp0HT+s0
         Zuizc0f7CJnKI0TIH/O3z+gaFQtuOpTq+sF2TfTxwnCaIPljSktLnJDT7wPqKULWnRWX
         SouXnS3Jasp4uhxiFImtvBOpZ06I7U2t2cQgB7nWAoJElrxn94U/WDt8A1A2JCK4kxNe
         BPTbyFviVLHQURJSIQiZkAJWbItHH4cwlKuVfkJ2LUhLxfv9UR7YjNO+gWRGEKdzBPrc
         euzHrNNszN3E8xV3PBP43a1l9KqiEMPLMtpg6aKw/hEvnc4HuAe9K2YUh0XZVGDRm0TF
         bFQA==
X-Gm-Message-State: AOAM5324XN1TAgN5oSL5VEI6CzZ3tJ7pUzfPTdWNxyrubKjMOhVnIN7w
	oJHdYIVdF1MtJLQuarqVr0+gvZTeS24=
X-Google-Smtp-Source: ABdhPJzrjndt6cTML74tYem+23oe1Hq/1DfFe8NBK2vLCL6LPZBEZP0LJRX73ZzEZWEitTpSD1gDAw==
X-Received: by 2002:a05:6000:182:: with SMTP id p2mr22389539wrx.116.1605131569763;
        Wed, 11 Nov 2020 13:52:49 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:49 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 09/15] xen/arm64: port Linux's arm64 atomic_lse.h to Xen
Date: Wed, 11 Nov 2020 21:51:57 +0000
Message-Id: <20201111215203.80336-10-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

As with the LL/SC atomics helpers, most of the "work" here is simply
deleting the atomic64_t helper definitions as we don't have an
atomic64_t type in Xen.

We do also need to s/__always_inline/always_inline/ to match the
qualifier name used by Xen.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm64/atomic_lse.h | 189 ++-----------------------
 1 file changed, 8 insertions(+), 181 deletions(-)

diff --git a/xen/include/asm-arm/arm64/atomic_lse.h b/xen/include/asm-arm/arm64/atomic_lse.h
index b3b0d43a7d..81613f7250 100644
--- a/xen/include/asm-arm/arm64/atomic_lse.h
+++ b/xen/include/asm-arm/arm64/atomic_lse.h
@@ -1,14 +1,15 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+
 /*
- * Based on arch/arm/include/asm/atomic.h
+ * Taken from Linux 5.10-rc2 (last commit 3cea11cd5)
  *
  * Copyright (C) 1996 Russell King.
  * Copyright (C) 2002 Deep Blue Solutions Ltd.
  * Copyright (C) 2012 ARM Ltd.
+ * SPDX-License-Identifier: GPL-2.0-only
  */
 
-#ifndef __ASM_ATOMIC_LSE_H
-#define __ASM_ATOMIC_LSE_H
+#ifndef __ASM_ARM_ARM64_ATOMIC_LSE_H
+#define __ASM_ARM_ARM64_ATOMIC_LSE_H
 
 #define ATOMIC_OP(op, asm_op)						\
 static inline void __lse_atomic_##op(int i, atomic_t *v)			\
@@ -163,182 +164,8 @@ ATOMIC_FETCH_OP_SUB(        , al, "memory")
 
 #undef ATOMIC_FETCH_OP_SUB
 
-#define ATOMIC64_OP(op, asm_op)						\
-static inline void __lse_atomic64_##op(s64 i, atomic64_t *v)		\
-{									\
-	asm volatile(							\
-	__LSE_PREAMBLE							\
-"	" #asm_op "	%[i], %[v]\n"					\
-	: [i] "+r" (i), [v] "+Q" (v->counter)				\
-	: "r" (v));							\
-}
-
-ATOMIC64_OP(andnot, stclr)
-ATOMIC64_OP(or, stset)
-ATOMIC64_OP(xor, steor)
-ATOMIC64_OP(add, stadd)
-
-#undef ATOMIC64_OP
-
-#define ATOMIC64_FETCH_OP(name, mb, op, asm_op, cl...)			\
-static inline long __lse_atomic64_fetch_##op##name(s64 i, atomic64_t *v)\
-{									\
-	asm volatile(							\
-	__LSE_PREAMBLE							\
-"	" #asm_op #mb "	%[i], %[i], %[v]"				\
-	: [i] "+r" (i), [v] "+Q" (v->counter)				\
-	: "r" (v)							\
-	: cl);								\
-									\
-	return i;							\
-}
-
-#define ATOMIC64_FETCH_OPS(op, asm_op)					\
-	ATOMIC64_FETCH_OP(_relaxed,   , op, asm_op)			\
-	ATOMIC64_FETCH_OP(_acquire,  a, op, asm_op, "memory")		\
-	ATOMIC64_FETCH_OP(_release,  l, op, asm_op, "memory")		\
-	ATOMIC64_FETCH_OP(        , al, op, asm_op, "memory")
-
-ATOMIC64_FETCH_OPS(andnot, ldclr)
-ATOMIC64_FETCH_OPS(or, ldset)
-ATOMIC64_FETCH_OPS(xor, ldeor)
-ATOMIC64_FETCH_OPS(add, ldadd)
-
-#undef ATOMIC64_FETCH_OP
-#undef ATOMIC64_FETCH_OPS
-
-#define ATOMIC64_OP_ADD_RETURN(name, mb, cl...)				\
-static inline long __lse_atomic64_add_return##name(s64 i, atomic64_t *v)\
-{									\
-	unsigned long tmp;						\
-									\
-	asm volatile(							\
-	__LSE_PREAMBLE							\
-	"	ldadd" #mb "	%[i], %x[tmp], %[v]\n"			\
-	"	add	%[i], %[i], %x[tmp]"				\
-	: [i] "+r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)	\
-	: "r" (v)							\
-	: cl);								\
-									\
-	return i;							\
-}
-
-ATOMIC64_OP_ADD_RETURN(_relaxed,   )
-ATOMIC64_OP_ADD_RETURN(_acquire,  a, "memory")
-ATOMIC64_OP_ADD_RETURN(_release,  l, "memory")
-ATOMIC64_OP_ADD_RETURN(        , al, "memory")
-
-#undef ATOMIC64_OP_ADD_RETURN
-
-static inline void __lse_atomic64_and(s64 i, atomic64_t *v)
-{
-	asm volatile(
-	__LSE_PREAMBLE
-	"	mvn	%[i], %[i]\n"
-	"	stclr	%[i], %[v]"
-	: [i] "+&r" (i), [v] "+Q" (v->counter)
-	: "r" (v));
-}
-
-#define ATOMIC64_FETCH_OP_AND(name, mb, cl...)				\
-static inline long __lse_atomic64_fetch_and##name(s64 i, atomic64_t *v)	\
-{									\
-	asm volatile(							\
-	__LSE_PREAMBLE							\
-	"	mvn	%[i], %[i]\n"					\
-	"	ldclr" #mb "	%[i], %[i], %[v]"			\
-	: [i] "+&r" (i), [v] "+Q" (v->counter)				\
-	: "r" (v)							\
-	: cl);								\
-									\
-	return i;							\
-}
-
-ATOMIC64_FETCH_OP_AND(_relaxed,   )
-ATOMIC64_FETCH_OP_AND(_acquire,  a, "memory")
-ATOMIC64_FETCH_OP_AND(_release,  l, "memory")
-ATOMIC64_FETCH_OP_AND(        , al, "memory")
-
-#undef ATOMIC64_FETCH_OP_AND
-
-static inline void __lse_atomic64_sub(s64 i, atomic64_t *v)
-{
-	asm volatile(
-	__LSE_PREAMBLE
-	"	neg	%[i], %[i]\n"
-	"	stadd	%[i], %[v]"
-	: [i] "+&r" (i), [v] "+Q" (v->counter)
-	: "r" (v));
-}
-
-#define ATOMIC64_OP_SUB_RETURN(name, mb, cl...)				\
-static inline long __lse_atomic64_sub_return##name(s64 i, atomic64_t *v)	\
-{									\
-	unsigned long tmp;						\
-									\
-	asm volatile(							\
-	__LSE_PREAMBLE							\
-	"	neg	%[i], %[i]\n"					\
-	"	ldadd" #mb "	%[i], %x[tmp], %[v]\n"			\
-	"	add	%[i], %[i], %x[tmp]"				\
-	: [i] "+&r" (i), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)	\
-	: "r" (v)							\
-	: cl);								\
-									\
-	return i;							\
-}
-
-ATOMIC64_OP_SUB_RETURN(_relaxed,   )
-ATOMIC64_OP_SUB_RETURN(_acquire,  a, "memory")
-ATOMIC64_OP_SUB_RETURN(_release,  l, "memory")
-ATOMIC64_OP_SUB_RETURN(        , al, "memory")
-
-#undef ATOMIC64_OP_SUB_RETURN
-
-#define ATOMIC64_FETCH_OP_SUB(name, mb, cl...)				\
-static inline long __lse_atomic64_fetch_sub##name(s64 i, atomic64_t *v)	\
-{									\
-	asm volatile(							\
-	__LSE_PREAMBLE							\
-	"	neg	%[i], %[i]\n"					\
-	"	ldadd" #mb "	%[i], %[i], %[v]"			\
-	: [i] "+&r" (i), [v] "+Q" (v->counter)				\
-	: "r" (v)							\
-	: cl);								\
-									\
-	return i;							\
-}
-
-ATOMIC64_FETCH_OP_SUB(_relaxed,   )
-ATOMIC64_FETCH_OP_SUB(_acquire,  a, "memory")
-ATOMIC64_FETCH_OP_SUB(_release,  l, "memory")
-ATOMIC64_FETCH_OP_SUB(        , al, "memory")
-
-#undef ATOMIC64_FETCH_OP_SUB
-
-static inline s64 __lse_atomic64_dec_if_positive(atomic64_t *v)
-{
-	unsigned long tmp;
-
-	asm volatile(
-	__LSE_PREAMBLE
-	"1:	ldr	%x[tmp], %[v]\n"
-	"	subs	%[ret], %x[tmp], #1\n"
-	"	b.lt	2f\n"
-	"	casal	%x[tmp], %[ret], %[v]\n"
-	"	sub	%x[tmp], %x[tmp], #1\n"
-	"	sub	%x[tmp], %x[tmp], %[ret]\n"
-	"	cbnz	%x[tmp], 1b\n"
-	"2:"
-	: [ret] "+&r" (v), [v] "+Q" (v->counter), [tmp] "=&r" (tmp)
-	:
-	: "cc", "memory");
-
-	return (long)v;
-}
-
 #define __CMPXCHG_CASE(w, sfx, name, sz, mb, cl...)			\
-static __always_inline u##sz						\
+static always_inline u##sz						\
 __lse__cmpxchg_case_##name##sz(volatile void *ptr,			\
 					      u##sz old,		\
 					      u##sz new)		\
@@ -381,7 +208,7 @@ __CMPXCHG_CASE(x,  ,  mb_, 64, al, "memory")
 #undef __CMPXCHG_CASE
 
 #define __CMPXCHG_DBL(name, mb, cl...)					\
-static __always_inline long						\
+static always_inline long						\
 __lse__cmpxchg_double##name(unsigned long old1,				\
 					 unsigned long old2,		\
 					 unsigned long new1,		\
@@ -416,4 +243,4 @@ __CMPXCHG_DBL(_mb, al, "memory")
 
 #undef __CMPXCHG_DBL
 
-#endif	/* __ASM_ATOMIC_LSE_H */
\ No newline at end of file
+#endif	/* __ASM_ARM_ARM64_ATOMIC_LSE_H */
\ No newline at end of file
-- 
2.24.3 (Apple Git-128)


