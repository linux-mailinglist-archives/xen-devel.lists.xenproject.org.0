Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF992AFAEB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 22:59:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25365.53060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcy9Y-0007ei-2z; Wed, 11 Nov 2020 21:59:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25365.53060; Wed, 11 Nov 2020 21:59:44 +0000
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
	id 1kcy9X-0007e3-Vx; Wed, 11 Nov 2020 21:59:43 +0000
Received: by outflank-mailman (input) for mailman id 25365;
 Wed, 11 Nov 2020 21:59:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1kcy3a-00064v-Qa
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:34 +0000
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8572d65-a88e-4d6d-9e12-c7b7451f14b3;
 Wed, 11 Nov 2020 21:52:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a3so3669141wmb.5
 for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:52 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com.
 [5.71.162.151])
 by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 11 Nov 2020 13:52:51 -0800 (PST)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	id 1kcy3a-00064v-Qa
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 21:53:34 +0000
X-Inumbo-ID: e8572d65-a88e-4d6d-9e12-c7b7451f14b3
Received: from mail-wm1-x341.google.com (unknown [2a00:1450:4864:20::341])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e8572d65-a88e-4d6d-9e12-c7b7451f14b3;
	Wed, 11 Nov 2020 21:52:53 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a3so3669141wmb.5
        for <xen-devel@lists.xenproject.org>; Wed, 11 Nov 2020 13:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Df9Xh6fAL7MEGN4PPLSLvsKAz4yhwBBWrhg9iGXHQa0=;
        b=uF84L1YgWpK/16Gee/yPHZGbKLt/KXZASJ7oPFGrzoDBMo9l5AYMJJhAJ9qsF5H2BY
         cO3x/E//asW6nbzdufmOh9GmOJR/N/paqbsGcR+xPJfvsVfob471OJYsuA0V2l5YPyhq
         IfBYCvgrDPHpL2bd/xm5RJF/3DvmJ4J1Ou/u+5lDEZ38bffyPIP5ceVeviSbmv/oFd2K
         G+30yIhQ6ZrqQWbYIGRJ9vQeXelVwSZIVsvQWnVT/aHk8yZqAMGI1yBZiQ5F6BWJQ7M+
         /HSp2vvFd5Ekd8WMtEB0FRsCndmsl8YqIwGEyrBgQvkoLMx8vJT0ozbW5ZM4VPWn4mDd
         X8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Df9Xh6fAL7MEGN4PPLSLvsKAz4yhwBBWrhg9iGXHQa0=;
        b=t04dM7dcHtzBXMoWlPkbqfh55S3bwr/zk2sfSzsXCSsJqzlcP6gUJyqW6U2K4E8Hf8
         KCgq8/aKDbgfCLu8s2VWyQpFRPILjeSe3k1K6CIs27KU0ZcjhEKaQv4MnKhAPgqAGjrX
         UvvfYXLi3CHNEurR2ALXvUVV0m/dKLOURAWewlbkbePx8rHyHvXqjusXlwvP+gna+ypR
         tDR5cJCJmetRFD5Qi7eMM/o3MNZK0qKgkiUZHAHVmmy1PIk3Px6hKWU06bVZBoTyiD2i
         LXjcP+37SNXGoeQBmdRxmpwcwpQkAvFBFGG99D/FN26+A1v2b39ypfNUuIicOZJ14URW
         RsNA==
X-Gm-Message-State: AOAM5302I364Xht1AmHnleotcy0jeUSqmWxAKCB4BiY925lO9ICmOtMs
	6zkJn886CMwK+MpgwX4qVS2rvHZUrpc=
X-Google-Smtp-Source: ABdhPJz998xdMQgMVAfS5d5KafAZkwOa43oizKaiuZiuVOvTHxZwM7rWKfd7OzHDt3uJAVh9K0k1XA==
X-Received: by 2002:a7b:c77a:: with SMTP id x26mr6304609wmk.63.1605131571835;
        Wed, 11 Nov 2020 13:52:51 -0800 (PST)
Received: from C02ZJ1BNLVDN.emea.arm.com (0547a297.skybroadband.com. [5.71.162.151])
        by smtp.gmail.com with ESMTPSA id u23sm4096078wmc.32.2020.11.11.13.52.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2020 13:52:51 -0800 (PST)
From: Ash Wilding <ash.j.wilding@gmail.com>
X-Google-Original-From: Ash Wilding
To: xen-devel@lists.xenproject.org
Cc: Ash Wilding <ash.j.wilding@gmail.com>,
	julien@xen.org,
	bertrand.marquis@arm.com,
	rahul.singh@arm.com
Subject: [RFC PATCH v2 11/15] xen/arm64: port Linux's arm64 atomic.h to Xen
Date: Wed, 11 Nov 2020 21:51:59 +0000
Message-Id: <20201111215203.80336-12-ash.j.wilding@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201111215203.80336-1-ash.j.wilding@gmail.com>
References: <20201111215203.80336-1-ash.j.wilding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ash Wilding <ash.j.wilding@gmail.com>

 - Drop atomic64_t helper declarations as we don't currently have an
   atomic64_t in Xen.

 - Drop arch_* prefixes.

 - Swap include of <linux/compiler.h> to just <xen/rwonce.h>.

Signed-off-by: Ash Wilding <ash.j.wilding@gmail.com>
---
 xen/include/asm-arm/arm64/atomic.h | 256 ++++++++---------------------
 1 file changed, 73 insertions(+), 183 deletions(-)

diff --git a/xen/include/asm-arm/arm64/atomic.h b/xen/include/asm-arm/arm64/atomic.h
index a2eab9f091..b695cc6e09 100644
--- a/xen/include/asm-arm/arm64/atomic.h
+++ b/xen/include/asm-arm/arm64/atomic.h
@@ -1,23 +1,23 @@
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
-#ifndef __ASM_ATOMIC_H
-#define __ASM_ATOMIC_H
+#ifndef __ASM_ARM_ARM64_ATOMIC_H
+#define __ASM_ARM_ARM64_ATOMIC_H
 
-#include <linux/compiler.h>
-#include <linux/types.h>
+#include <xen/rwonce.h>
+#include <xen/types.h>
 
-#include <asm/barrier.h>
-#include <asm/cmpxchg.h>
-#include <asm/lse.h>
+#include "lse.h"
+#include "cmpxchg.h"
 
 #define ATOMIC_OP(op)							\
-static inline void arch_##op(int i, atomic_t *v)			\
+static inline void op(int i, atomic_t *v)			\
 {									\
 	__lse_ll_sc_body(op, i, v);					\
 }
@@ -32,7 +32,7 @@ ATOMIC_OP(atomic_sub)
 #undef ATOMIC_OP
 
 #define ATOMIC_FETCH_OP(name, op)					\
-static inline int arch_##op##name(int i, atomic_t *v)			\
+static inline int op##name(int i, atomic_t *v)			\
 {									\
 	return __lse_ll_sc_body(op##name, i, v);			\
 }
@@ -54,175 +54,65 @@ ATOMIC_FETCH_OPS(atomic_sub_return)
 
 #undef ATOMIC_FETCH_OP
 #undef ATOMIC_FETCH_OPS
-
-#define ATOMIC64_OP(op)							\
-static inline void arch_##op(long i, atomic64_t *v)			\
-{									\
-	__lse_ll_sc_body(op, i, v);					\
-}
-
-ATOMIC64_OP(atomic64_andnot)
-ATOMIC64_OP(atomic64_or)
-ATOMIC64_OP(atomic64_xor)
-ATOMIC64_OP(atomic64_add)
-ATOMIC64_OP(atomic64_and)
-ATOMIC64_OP(atomic64_sub)
-
-#undef ATOMIC64_OP
-
-#define ATOMIC64_FETCH_OP(name, op)					\
-static inline long arch_##op##name(long i, atomic64_t *v)		\
-{									\
-	return __lse_ll_sc_body(op##name, i, v);			\
-}
-
-#define ATOMIC64_FETCH_OPS(op)						\
-	ATOMIC64_FETCH_OP(_relaxed, op)					\
-	ATOMIC64_FETCH_OP(_acquire, op)					\
-	ATOMIC64_FETCH_OP(_release, op)					\
-	ATOMIC64_FETCH_OP(        , op)
-
-ATOMIC64_FETCH_OPS(atomic64_fetch_andnot)
-ATOMIC64_FETCH_OPS(atomic64_fetch_or)
-ATOMIC64_FETCH_OPS(atomic64_fetch_xor)
-ATOMIC64_FETCH_OPS(atomic64_fetch_add)
-ATOMIC64_FETCH_OPS(atomic64_fetch_and)
-ATOMIC64_FETCH_OPS(atomic64_fetch_sub)
-ATOMIC64_FETCH_OPS(atomic64_add_return)
-ATOMIC64_FETCH_OPS(atomic64_sub_return)
-
-#undef ATOMIC64_FETCH_OP
-#undef ATOMIC64_FETCH_OPS
-
-static inline long arch_atomic64_dec_if_positive(atomic64_t *v)
-{
-	return __lse_ll_sc_body(atomic64_dec_if_positive, v);
-}
-
-#define arch_atomic_read(v)			__READ_ONCE((v)->counter)
-#define arch_atomic_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
-
-#define arch_atomic_add_return_relaxed		arch_atomic_add_return_relaxed
-#define arch_atomic_add_return_acquire		arch_atomic_add_return_acquire
-#define arch_atomic_add_return_release		arch_atomic_add_return_release
-#define arch_atomic_add_return			arch_atomic_add_return
-
-#define arch_atomic_sub_return_relaxed		arch_atomic_sub_return_relaxed
-#define arch_atomic_sub_return_acquire		arch_atomic_sub_return_acquire
-#define arch_atomic_sub_return_release		arch_atomic_sub_return_release
-#define arch_atomic_sub_return			arch_atomic_sub_return
-
-#define arch_atomic_fetch_add_relaxed		arch_atomic_fetch_add_relaxed
-#define arch_atomic_fetch_add_acquire		arch_atomic_fetch_add_acquire
-#define arch_atomic_fetch_add_release		arch_atomic_fetch_add_release
-#define arch_atomic_fetch_add			arch_atomic_fetch_add
-
-#define arch_atomic_fetch_sub_relaxed		arch_atomic_fetch_sub_relaxed
-#define arch_atomic_fetch_sub_acquire		arch_atomic_fetch_sub_acquire
-#define arch_atomic_fetch_sub_release		arch_atomic_fetch_sub_release
-#define arch_atomic_fetch_sub			arch_atomic_fetch_sub
-
-#define arch_atomic_fetch_and_relaxed		arch_atomic_fetch_and_relaxed
-#define arch_atomic_fetch_and_acquire		arch_atomic_fetch_and_acquire
-#define arch_atomic_fetch_and_release		arch_atomic_fetch_and_release
-#define arch_atomic_fetch_and			arch_atomic_fetch_and
-
-#define arch_atomic_fetch_andnot_relaxed	arch_atomic_fetch_andnot_relaxed
-#define arch_atomic_fetch_andnot_acquire	arch_atomic_fetch_andnot_acquire
-#define arch_atomic_fetch_andnot_release	arch_atomic_fetch_andnot_release
-#define arch_atomic_fetch_andnot		arch_atomic_fetch_andnot
-
-#define arch_atomic_fetch_or_relaxed		arch_atomic_fetch_or_relaxed
-#define arch_atomic_fetch_or_acquire		arch_atomic_fetch_or_acquire
-#define arch_atomic_fetch_or_release		arch_atomic_fetch_or_release
-#define arch_atomic_fetch_or			arch_atomic_fetch_or
-
-#define arch_atomic_fetch_xor_relaxed		arch_atomic_fetch_xor_relaxed
-#define arch_atomic_fetch_xor_acquire		arch_atomic_fetch_xor_acquire
-#define arch_atomic_fetch_xor_release		arch_atomic_fetch_xor_release
-#define arch_atomic_fetch_xor			arch_atomic_fetch_xor
-
-#define arch_atomic_xchg_relaxed(v, new) \
-	arch_xchg_relaxed(&((v)->counter), (new))
-#define arch_atomic_xchg_acquire(v, new) \
-	arch_xchg_acquire(&((v)->counter), (new))
-#define arch_atomic_xchg_release(v, new) \
-	arch_xchg_release(&((v)->counter), (new))
-#define arch_atomic_xchg(v, new) \
-	arch_xchg(&((v)->counter), (new))
-
-#define arch_atomic_cmpxchg_relaxed(v, old, new) \
-	arch_cmpxchg_relaxed(&((v)->counter), (old), (new))
-#define arch_atomic_cmpxchg_acquire(v, old, new) \
-	arch_cmpxchg_acquire(&((v)->counter), (old), (new))
-#define arch_atomic_cmpxchg_release(v, old, new) \
-	arch_cmpxchg_release(&((v)->counter), (old), (new))
-#define arch_atomic_cmpxchg(v, old, new) \
-	arch_cmpxchg(&((v)->counter), (old), (new))
-
-#define arch_atomic_andnot			arch_atomic_andnot
-
-/*
- * 64-bit arch_atomic operations.
- */
-#define ATOMIC64_INIT				ATOMIC_INIT
-#define arch_atomic64_read			arch_atomic_read
-#define arch_atomic64_set			arch_atomic_set
-
-#define arch_atomic64_add_return_relaxed	arch_atomic64_add_return_relaxed
-#define arch_atomic64_add_return_acquire	arch_atomic64_add_return_acquire
-#define arch_atomic64_add_return_release	arch_atomic64_add_return_release
-#define arch_atomic64_add_return		arch_atomic64_add_return
-
-#define arch_atomic64_sub_return_relaxed	arch_atomic64_sub_return_relaxed
-#define arch_atomic64_sub_return_acquire	arch_atomic64_sub_return_acquire
-#define arch_atomic64_sub_return_release	arch_atomic64_sub_return_release
-#define arch_atomic64_sub_return		arch_atomic64_sub_return
-
-#define arch_atomic64_fetch_add_relaxed		arch_atomic64_fetch_add_relaxed
-#define arch_atomic64_fetch_add_acquire		arch_atomic64_fetch_add_acquire
-#define arch_atomic64_fetch_add_release		arch_atomic64_fetch_add_release
-#define arch_atomic64_fetch_add			arch_atomic64_fetch_add
-
-#define arch_atomic64_fetch_sub_relaxed		arch_atomic64_fetch_sub_relaxed
-#define arch_atomic64_fetch_sub_acquire		arch_atomic64_fetch_sub_acquire
-#define arch_atomic64_fetch_sub_release		arch_atomic64_fetch_sub_release
-#define arch_atomic64_fetch_sub			arch_atomic64_fetch_sub
-
-#define arch_atomic64_fetch_and_relaxed		arch_atomic64_fetch_and_relaxed
-#define arch_atomic64_fetch_and_acquire		arch_atomic64_fetch_and_acquire
-#define arch_atomic64_fetch_and_release		arch_atomic64_fetch_and_release
-#define arch_atomic64_fetch_and			arch_atomic64_fetch_and
-
-#define arch_atomic64_fetch_andnot_relaxed	arch_atomic64_fetch_andnot_relaxed
-#define arch_atomic64_fetch_andnot_acquire	arch_atomic64_fetch_andnot_acquire
-#define arch_atomic64_fetch_andnot_release	arch_atomic64_fetch_andnot_release
-#define arch_atomic64_fetch_andnot		arch_atomic64_fetch_andnot
-
-#define arch_atomic64_fetch_or_relaxed		arch_atomic64_fetch_or_relaxed
-#define arch_atomic64_fetch_or_acquire		arch_atomic64_fetch_or_acquire
-#define arch_atomic64_fetch_or_release		arch_atomic64_fetch_or_release
-#define arch_atomic64_fetch_or			arch_atomic64_fetch_or
-
-#define arch_atomic64_fetch_xor_relaxed		arch_atomic64_fetch_xor_relaxed
-#define arch_atomic64_fetch_xor_acquire		arch_atomic64_fetch_xor_acquire
-#define arch_atomic64_fetch_xor_release		arch_atomic64_fetch_xor_release
-#define arch_atomic64_fetch_xor			arch_atomic64_fetch_xor
-
-#define arch_atomic64_xchg_relaxed		arch_atomic_xchg_relaxed
-#define arch_atomic64_xchg_acquire		arch_atomic_xchg_acquire
-#define arch_atomic64_xchg_release		arch_atomic_xchg_release
-#define arch_atomic64_xchg			arch_atomic_xchg
-
-#define arch_atomic64_cmpxchg_relaxed		arch_atomic_cmpxchg_relaxed
-#define arch_atomic64_cmpxchg_acquire		arch_atomic_cmpxchg_acquire
-#define arch_atomic64_cmpxchg_release		arch_atomic_cmpxchg_release
-#define arch_atomic64_cmpxchg			arch_atomic_cmpxchg
-
-#define arch_atomic64_andnot			arch_atomic64_andnot
-
-#define arch_atomic64_dec_if_positive		arch_atomic64_dec_if_positive
-
-#define ARCH_ATOMIC
-
-#endif /* __ASM_ATOMIC_H */
\ No newline at end of file
+#define atomic_read(v)			__READ_ONCE((v)->counter)
+#define atomic_set(v, i)			__WRITE_ONCE(((v)->counter), (i))
+
+#define atomic_add_return_relaxed		atomic_add_return_relaxed
+#define atomic_add_return_acquire		atomic_add_return_acquire
+#define atomic_add_return_release		atomic_add_return_release
+#define atomic_add_return			atomic_add_return
+
+#define atomic_sub_return_relaxed		atomic_sub_return_relaxed
+#define atomic_sub_return_acquire		atomic_sub_return_acquire
+#define atomic_sub_return_release		atomic_sub_return_release
+#define atomic_sub_return			atomic_sub_return
+
+#define atomic_fetch_add_relaxed		atomic_fetch_add_relaxed
+#define atomic_fetch_add_acquire		atomic_fetch_add_acquire
+#define atomic_fetch_add_release		atomic_fetch_add_release
+#define atomic_fetch_add			atomic_fetch_add
+
+#define atomic_fetch_sub_relaxed		atomic_fetch_sub_relaxed
+#define atomic_fetch_sub_acquire		atomic_fetch_sub_acquire
+#define atomic_fetch_sub_release		atomic_fetch_sub_release
+#define atomic_fetch_sub			atomic_fetch_sub
+
+#define atomic_fetch_and_relaxed		atomic_fetch_and_relaxed
+#define atomic_fetch_and_acquire		atomic_fetch_and_acquire
+#define atomic_fetch_and_release		atomic_fetch_and_release
+#define atomic_fetch_and			atomic_fetch_and
+
+#define atomic_fetch_andnot_relaxed	atomic_fetch_andnot_relaxed
+#define atomic_fetch_andnot_acquire	atomic_fetch_andnot_acquire
+#define atomic_fetch_andnot_release	atomic_fetch_andnot_release
+#define atomic_fetch_andnot		atomic_fetch_andnot
+
+#define atomic_fetch_or_relaxed		atomic_fetch_or_relaxed
+#define atomic_fetch_or_acquire		atomic_fetch_or_acquire
+#define atomic_fetch_or_release		atomic_fetch_or_release
+#define atomic_fetch_or			atomic_fetch_or
+
+#define atomic_fetch_xor_relaxed		atomic_fetch_xor_relaxed
+#define atomic_fetch_xor_acquire		atomic_fetch_xor_acquire
+#define atomic_fetch_xor_release		atomic_fetch_xor_release
+#define atomic_fetch_xor			atomic_fetch_xor
+
+#define atomic_xchg_relaxed(v, new) \
+	xchg_relaxed(&((v)->counter), (new))
+#define atomic_xchg_acquire(v, new) \
+	xchg_acquire(&((v)->counter), (new))
+#define atomic_xchg_release(v, new) \
+	xchg_release(&((v)->counter), (new))
+#define atomic_xchg(v, new) \
+	xchg(&((v)->counter), (new))
+
+#define atomic_cmpxchg_relaxed(v, old, new) \
+	cmpxchg_relaxed(&((v)->counter), (old), (new))
+#define atomic_cmpxchg_acquire(v, old, new) \
+	cmpxchg_acquire(&((v)->counter), (old), (new))
+#define atomic_cmpxchg_release(v, old, new) \
+	cmpxchg_release(&((v)->counter), (old), (new))
+
+#define atomic_andnot			atomic_andnot
+
+#endif /* __ASM_ARM_ARM64_ATOMIC_H */
\ No newline at end of file
-- 
2.24.3 (Apple Git-128)


