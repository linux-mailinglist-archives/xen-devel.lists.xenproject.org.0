Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E626977DEAD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584410.915137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDna-0001Nh-UU; Wed, 16 Aug 2023 10:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584410.915137; Wed, 16 Aug 2023 10:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDna-0001JS-QF; Wed, 16 Aug 2023 10:30:46 +0000
Received: by outflank-mailman (input) for mailman id 584410;
 Wed, 16 Aug 2023 10:30:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdp-0003RA-07
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:41 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b0b7a2e-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:37 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-313e742a787so3760964f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:37 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:36 -0700 (PDT)
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
X-Inumbo-ID: 8b0b7a2e-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181237; x=1692786037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=faZN0PTWNbimEuXos1DkocfCWtrw9mSeUqlog2BUeiI=;
        b=YdCBSPSKbYCBxpDMBHXEQhGFr8AgEm/LkqDl1kqIZ000qx+DJCDH62tqCWWgFQyeIs
         CDTmrEO09BVDhVoY/xulFCAtQLtcKuS4NpEaUdY4QPr/BYgktG0lVaZpSQueaTGYMNyg
         Pk2y8HEhpBkEJgyHYdtbDv5cDLJQ7UfQHxS0SOAfRCGR9i3GaYVGNDSEd/PBkj8hCv/4
         p1a8nyDjCQz6AmmjbqgaAjMyG14SQw0FhmAO0s8ofpp2ITFOokfp5+5+AFGRHB9DKJoQ
         3htgiCnQYSQ+Iht27fLP8c5pcRMobpCAir0fL5eZ0Ke110Wi37e2wsQQ2HD43BM67Msz
         ABNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181237; x=1692786037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=faZN0PTWNbimEuXos1DkocfCWtrw9mSeUqlog2BUeiI=;
        b=WD/CILCaYAmBkKkNQqOwtgsCqgO0V/qCrCCDHlNVUM/a0hDLFnsxHbbJ6CjwRWeDWn
         GZdgWXcIIA7lL4hdcJuRcHxtmRn1w8uqwPHLdrChfG97ywCrmyoa4d0v7SdeuePdW2Nk
         d6YO/etkyI7ZMm72r+mDBu4jAFMCU5dGE50DtxX5cbhPYfSslDceM9cl0x/PhtbnPm2T
         DAcPu6NrL/ZRZwGKkECMd2pINRjvJM01dnblWWAPyBRrcOHH8K7jfmxpCZbx5BYYeyzg
         T2KdAKXjwEj+sbpxZxAmQn4kXyQmNSNmDTPNbp7zIbDsMpmlJ7bgHGxfgKLxqOE77dm4
         di/Q==
X-Gm-Message-State: AOJu0YyEEz1gyPKXYvWKKvQvIZnJHUPNqk48Yob1V6cJTgJ9R2dzj5ZE
	jZpJlifwBNau/tEqpMs38gejXrNSd9eUdS6A
X-Google-Smtp-Source: AGHT+IF8tuHIm+FkkBwpLbydHWbU9mFl4l7bkcD3+wGHwX/5HpYqSeCo7GHdjNYhQzso5iBPXeACxQ==
X-Received: by 2002:adf:ff82:0:b0:313:e391:e492 with SMTP id j2-20020adfff82000000b00313e391e492mr1185063wrr.17.1692181236671;
        Wed, 16 Aug 2023 03:20:36 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 27/57] xen/riscv: introduce cmpxchg.h
Date: Wed, 16 Aug 2023 13:19:38 +0300
Message-ID: <40b81d8e401e375bc3723657e6b41f6b8d256490.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/cmpxchg.h | 373 +++++++++++++++++++++++++++
 1 file changed, 373 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 0000000000..8660ecd287
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -0,0 +1,373 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2014 Regents of the University of California */
+
+#ifndef _ASM_RISCV_CMPXCHG_H
+#define _ASM_RISCV_CMPXCHG_H
+
+#include <asm/system.h>
+#include <asm/fence.h>
+#include <xen/lib.h>
+
+#define __xchg_relaxed(ptr, new, size)					\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __ret;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.w %0, %2, %1\n"			\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.d %0, %2, %1\n"			\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define xchg_relaxed(ptr, x)						\
+({									\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	(__typeof__(*(ptr))) __xchg_relaxed((ptr),			\
+					    _x_, sizeof(*(ptr)));	\
+})
+
+#define __xchg_acquire(ptr, new, size)					\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __ret;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.w %0, %2, %1\n"			\
+			RISCV_ACQUIRE_BARRIER				\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.d %0, %2, %1\n"			\
+			RISCV_ACQUIRE_BARRIER				\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define xchg_acquire(ptr, x)						\
+({									\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	(__typeof__(*(ptr))) __xchg_acquire((ptr),			\
+					    _x_, sizeof(*(ptr)));	\
+})
+
+#define __xchg_release(ptr, new, size)					\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __ret;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			RISCV_RELEASE_BARRIER				\
+			"	amoswap.w %0, %2, %1\n"			\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			RISCV_RELEASE_BARRIER				\
+			"	amoswap.d %0, %2, %1\n"			\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define xchg_release(ptr, x)						\
+({									\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	(__typeof__(*(ptr))) __xchg_release((ptr),			\
+					    _x_, sizeof(*(ptr)));	\
+})
+
+#define __xchg(ptr, new, size)						\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(new) __new = (new);					\
+	__typeof__(*(ptr)) __ret;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.w.aqrl %0, %2, %1\n"		\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"	amoswap.d.aqrl %0, %2, %1\n"		\
+			: "=r" (__ret), "+A" (*__ptr)			\
+			: "r" (__new)					\
+			: "memory");					\
+		break;							\
+	default:							\
+		__ret = 0; \
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define xchg(ptr, x)							\
+({									\
+	__typeof__(*(ptr)) _x_ = (x);					\
+	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
+})
+
+#define xchg32(ptr, x)							\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
+	xchg((ptr), (x));						\
+})
+
+#define xchg64(ptr, x)							\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	xchg((ptr), (x));						\
+})
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+#define __cmpxchg_relaxed(ptr, old, new, size)				\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __new = (new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, %2\n"				\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc.w %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg_relaxed(ptr, o, n)					\
+({									\
+	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _n_ = (n);					\
+	(__typeof__(*(ptr))) __cmpxchg_relaxed((ptr),			\
+					_o_, _n_, sizeof(*(ptr)));	\
+})
+
+#define __cmpxchg_acquire(ptr, old, new, size)				\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __new = (new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, %2\n"				\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc.w %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			RISCV_ACQUIRE_BARRIER				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			RISCV_ACQUIRE_BARRIER				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg_acquire(ptr, o, n)					\
+({									\
+	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _n_ = (n);					\
+	(__typeof__(*(ptr))) __cmpxchg_acquire((ptr),			\
+					_o_, _n_, sizeof(*(ptr)));	\
+})
+
+#define __cmpxchg_release(ptr, old, new, size)				\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (old);				\
+	__typeof__(*(ptr)) __new = (new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			RISCV_RELEASE_BARRIER				\
+			"0:	lr.w %0, %2\n"				\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc.w %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			RISCV_RELEASE_BARRIER				\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg_release(ptr, o, n)					\
+({									\
+	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _n_ = (n);					\
+	(__typeof__(*(ptr))) __cmpxchg_release((ptr),			\
+					_o_, _n_, sizeof(*(ptr)));	\
+})
+
+#define __cmpxchg(ptr, old, new, size)					\
+({									\
+	__typeof__(ptr) __ptr = (ptr);					\
+	__typeof__(*(ptr)) __old = (__typeof__(*(ptr)))(old);				\
+	__typeof__(*(ptr)) __new = (__typeof__(*(ptr)))(new);				\
+	__typeof__(*(ptr)) __ret;					\
+	register unsigned int __rc;					\
+	switch (size) {							\
+	case 4:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.w %0, %2\n"				\
+			"	bne  %0, %z3, 1f\n"			\
+			"	sc.w.rl %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"	fence rw, rw\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	case 8:								\
+		__asm__ __volatile__ (					\
+			"0:	lr.d %0, %2\n"				\
+			"	bne %0, %z3, 1f\n"			\
+			"	sc.d.rl %1, %z4, %2\n"			\
+			"	bnez %1, 0b\n"				\
+			"	fence rw, rw\n"				\
+			"1:\n"						\
+			: "=&r" (__ret), "=&r" (__rc), "+A" (*__ptr)	\
+			: "rJ" (__old), "rJ" (__new)			\
+			: "memory");					\
+		break;							\
+	default:							\
+		ASSERT_UNREACHABLE();					\
+	}								\
+	__ret;								\
+})
+
+#define cmpxchg(ptr, o, n)						\
+({									\
+	__typeof__(*(ptr)) _o_ = (o);					\
+	__typeof__(*(ptr)) _n_ = (n);					\
+	(__typeof__(*(ptr))) __cmpxchg((ptr),				\
+				       _o_, _n_, sizeof(*(ptr)));	\
+})
+
+#define cmpxchg_local(ptr, o, n)					\
+	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
+
+#define cmpxchg32(ptr, o, n)						\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
+	cmpxchg((ptr), (o), (n));					\
+})
+
+#define cmpxchg32_local(ptr, o, n)					\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
+	cmpxchg_relaxed((ptr), (o), (n))				\
+})
+
+#define cmpxchg64(ptr, o, n)						\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	cmpxchg((ptr), (o), (n));					\
+})
+
+#define cmpxchg64_local(ptr, o, n)					\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	cmpxchg_relaxed((ptr), (o), (n));				\
+})
+
+#endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.41.0


