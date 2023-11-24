Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8737F7179
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640382.998556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TTE-0003Jj-Bf; Fri, 24 Nov 2023 10:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640382.998556; Fri, 24 Nov 2023 10:31:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TTD-00030S-AC; Fri, 24 Nov 2023 10:31:35 +0000
Received: by outflank-mailman (input) for mailman id 640382;
 Fri, 24 Nov 2023 10:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TT8-0006hx-Ri
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:30 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0b9701d-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:29 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a00cbb83c82so252087366b.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:29 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:27 -0800 (PST)
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
X-Inumbo-ID: a0b9701d-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821888; x=1701426688; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z6zyrgWKV9uY+EAKr5mS41Ot5++Nclsc1qYYGHxaNGc=;
        b=TIdv8Ub8Lt8XU8PBu63pNGvs0MKlPyGQGBTc+hurVGzaNOo0eEsPyncQ+RqA1UbP5R
         pQRVzpz802ipkx07tQiPV016sw0f5Joepfs/Z16kc7b1cX7tLEuao7rxAHcmqlu/4jCC
         77ahvVJgmdEZgCWvanD9EsfwRobp+ZbQJ9qFvRpbGgn8EXcGcKOibfLMIQZfSpdiuFsy
         4FT6WIVZL72q42qRglEIgqxKEnZWGMzTdOyTK7s1AKJXxfD50wiOyMPAvaRPKRNP1k3N
         uD1ymPdEyI2YBQO817zeUIRel74BmbZ+BnrZ+ZdC35hY7FozoWLcaR6n01U7k3AVOOWI
         YmAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821888; x=1701426688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z6zyrgWKV9uY+EAKr5mS41Ot5++Nclsc1qYYGHxaNGc=;
        b=ONwcA0pjIphiLkWP/VHGLOZrMpL4XUeCVpwK+B3zlMfB8eBa2QmED53La8y/m4EgOO
         3jI1oncCZIjOxl5fyTmftT3e7EztAl2ip09ZJDBKon3c9E2sroCkfJEYjGfLfbq/QYTp
         +JOg93mv3D0jFtujV2eLMJDO+m4ZrokBMHdplTx8cDDA3EFGwxwR/2oioRktG57gthn1
         WRCXxQxLFls9faxO90/blr4mR4LtKT9NTbHk5pqOWZ431i6e8dMNebHCiE9vk1nJkNgt
         CI562tGwEbA3V4UCfFtILA5fKn74+pUCXSlb7CMUc8O5WeRQ7DQOyeFExAxAYcRTRU2o
         /Ofw==
X-Gm-Message-State: AOJu0Yw5Jdqg+KNbzZvEkpmUJWFTszQ/EZhWh1qlrvRBAOBwdjybgDBd
	td29Qtsj1yDgN+TScvXfFs7bGkxgyDD+rw==
X-Google-Smtp-Source: AGHT+IGiW2xMWCZQkZVFkoFW3aIzAbJRBhQlbSCDbTG01/yiBNU9kQC2paUrZWKaff86JzdgCwdJ5A==
X-Received: by 2002:a17:906:fcc:b0:9bd:a75a:5644 with SMTP id c12-20020a1709060fcc00b009bda75a5644mr1533166ejk.16.1700821888385;
        Fri, 24 Nov 2023 02:31:28 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 18/39] xen/riscv: introduce cmpxchg.h
Date: Fri, 24 Nov 2023 12:30:38 +0200
Message-ID: <981cabb593fb4b5d8927071d456ec7016891fe71.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- update the comment at the top of the header.
	- change xen/lib.h to xen/bug.h.
	- sort inclusion of headers properly.
---
 xen/arch/riscv/include/asm/cmpxchg.h | 379 +++++++++++++++++++++++++++
 1 file changed, 379 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 0000000000..c535bc9660
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -0,0 +1,379 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Taken and modified from Linux.
+ *
+ *  Copyright (C) 2014 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_CMPXCHG_H
+#define _ASM_RISCV_CMPXCHG_H
+
+#include <xen/bug.h>
+
+#include <asm/fence.h>
+#include <asm/system.h>
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
+		__ret = 0; \
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
2.42.0


