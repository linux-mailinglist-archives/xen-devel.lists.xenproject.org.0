Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A5381CC2C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:27:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659587.1029303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhR0-0001yJ-8e; Fri, 22 Dec 2023 15:27:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659587.1029303; Fri, 22 Dec 2023 15:27:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhR0-0001wf-4d; Fri, 22 Dec 2023 15:27:34 +0000
Received: by outflank-mailman (input) for mailman id 659587;
 Fri, 22 Dec 2023 15:27:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDW-0007Ie-RV
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:38 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aeb859c4-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:38 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50e3cdcf010so2163803e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:38 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:35 -0800 (PST)
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
X-Inumbo-ID: aeb859c4-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258017; x=1703862817; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6djMdmcp+oQ5VeTVRCtFMD3D8OXqSdpy9AyZmZkL/Fs=;
        b=Ako25RV/DDJM450mzMvHEADoXfjj0gHsjFYanZJ1kmSK7g6QQIH7GND94FJtc2c4gA
         QLtNmcsEvv0Lsq6hH6s6E0g/+RsOQ0GjPBj9GfLbGLODKQ4brMQmved29BYEDQoQmlzd
         u9F+SH6HuWYsuzR5Qja7y7JG3ge6jsSoZ93hydISHVPc0WYZmkzmYOuupu2JTmwIhOzg
         aXENroDf+Yv8Zc9w1WSnZgWUDFZvv/AZzjd276bbVY4y9Q9wZ25ebhmvLcyPOy/wUDWo
         th+wsXlWiyxJSWPWQRJivkINosKXR3PsB1W9Tszy1jKxweAoJ4iXEEYwgvldn+ek+cG3
         6MPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258017; x=1703862817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6djMdmcp+oQ5VeTVRCtFMD3D8OXqSdpy9AyZmZkL/Fs=;
        b=kgfl9Kc9ih7l66VGi7Tskx3zXIgzjp45W4g2BulkdPMzIDbp2AFv7BEjTqNlY8dYJb
         s9bdfgBAQzw7EKyJDWxgyVWEP+jBU4aTQLOAEpUi+UORpuqqCzJpUXHrT6S6kpm3MItY
         MKlmjkP65nCH+Bv/hNpVLrtxffUYKNR2jNw8Xz/76uvTX3DABzf4lF0WqcBVFR5NuAld
         iatap6a/xKyooRPghBzCZIshh4j4wvIvxRAAiMSHIcnqH5R1dLdIY1PN4b0lioZ79+bN
         H8ETgnBhQX2AarVcvk7ePOuGhDB4TJdgUQsKUVFgIjWROe72FRQ55Ly1IT9cmvKmVpEi
         WB+A==
X-Gm-Message-State: AOJu0Yw2Rj6HDwTfCxk5hqTNMXJJq8JwN+SgW2iyyKTV6fv/J5cB1tTP
	qRdGXpbrmBEzZEUD4GIjUl98F6aObzg=
X-Google-Smtp-Source: AGHT+IETVYaZtwubgJgA+UIzZ/dAnt7ALciTtZ5Y+mXn+m/1tOGV9c+WVXmpzkbWXoBa5nBMaJ9zIg==
X-Received: by 2002:a19:f018:0:b0:50e:5bab:63c9 with SMTP id p24-20020a19f018000000b0050e5bab63c9mr422640lfc.56.1703258016768;
        Fri, 22 Dec 2023 07:13:36 -0800 (PST)
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
Subject: [PATCH v3 13/34] xen/riscv: introduce cmpxchg.h
Date: Fri, 22 Dec 2023 17:12:57 +0200
Message-ID: <214bfd61c8ccf2a5b2c640b815ebfa6a705f6234.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header was taken from Linux kernl 6.4.0-rc1.

Addionally, were updated:
* add emulation of {cmp}xchg for 1/2 byte types
* replace tabs with spaces
* replace __* varialbed with *__

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - update the commit message
 - add emulation of {cmp}xchg_... for 1 and 2 bytes types
---
Changes in V2:
	- update the comment at the top of the header.
	- change xen/lib.h to xen/bug.h.
	- sort inclusion of headers properly.
---
 xen/arch/riscv/include/asm/cmpxchg.h | 496 +++++++++++++++++++++++++++
 1 file changed, 496 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 0000000000..916776c403
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -0,0 +1,496 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright (C) 2014 Regents of the University of California */
+
+#ifndef _ASM_RISCV_CMPXCHG_H
+#define _ASM_RISCV_CMPXCHG_H
+
+#include <xen/compiler.h>
+#include <xen/lib.h>
+
+#include <asm/fence.h>
+#include <asm/io.h>
+#include <asm/system.h>
+
+#define __xchg_relaxed(ptr, new, size) \
+({ \
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(new) new__ = (new); \
+    __typeof__(*(ptr)) ret__; \
+    switch (size) \
+	{ \
+    case 4: \
+        asm volatile( \
+            "	amoswap.w %0, %2, %1\n" \
+            : "=r" (ret__), "+A" (*ptr__) \
+            : "r" (new__) \
+            : "memory" ); \
+        break; \
+    case 8: \
+        asm volatile( \
+            "	amoswap.d %0, %2, %1\n" \
+            : "=r" (ret__), "+A" (*ptr__) \
+            : "r" (new__) \
+            : "memory" ); \
+        break; \
+    default: \
+        ASSERT_UNREACHABLE(); \
+    } \
+    ret__; \
+})
+
+#define xchg_relaxed(ptr, x) \
+({ \
+    __typeof__(*(ptr)) x_ = (x); \
+    (__typeof__(*(ptr))) __xchg_relaxed((ptr), x_, sizeof(*(ptr))); \
+})
+
+#define __xchg_acquire(ptr, new, size) \
+({ \
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(new) new__ = (new); \
+    __typeof__(*(ptr)) ret__; \
+    switch (size) \
+	{ \
+    case 4: \
+        asm volatile( \
+            "	amoswap.w %0, %2, %1\n" \
+            RISCV_ACQUIRE_BARRIER \
+            : "=r" (ret__), "+A" (*ptr__) \
+            : "r" (new__) \
+            : "memory" ); \
+        break; \
+    case 8: \
+        asm volatile( \
+            "	amoswap.d %0, %2, %1\n" \
+            RISCV_ACQUIRE_BARRIER \
+            : "=r" (ret__), "+A" (*ptr__) \
+            : "r" (new__) \
+            : "memory" ); \
+        break; \
+    default: \
+        ASSERT_UNREACHABLE(); \
+    } \
+    ret__; \
+})
+
+#define xchg_acquire(ptr, x) \
+({ \
+    __typeof__(*(ptr)) x_ = (x); \
+    (__typeof__(*(ptr))) __xchg_acquire((ptr), x_, sizeof(*(ptr))); \
+})
+
+#define __xchg_release(ptr, new, size) \
+({ \
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(new) new__ = (new); \
+    __typeof__(*(ptr)) ret__; \
+    switch (size) \
+	{ \
+    case 4: \
+        asm volatile ( \
+            RISCV_RELEASE_BARRIER \
+            "	amoswap.w %0, %2, %1\n" \
+            : "=r" (ret__), "+A" (*ptr__) \
+            : "r" (new__) \
+            : "memory"); \
+        break; \
+    case 8: \
+        asm volatile ( \
+            RISCV_RELEASE_BARRIER \
+            "	amoswap.d %0, %2, %1\n" \
+            : "=r" (ret__), "+A" (*ptr__) \
+            : "r" (new__) \
+            : "memory"); \
+        break; \
+    default: \
+        ASSERT_UNREACHABLE(); \
+    } \
+    ret__; \
+})
+
+#define xchg_release(ptr, x) \
+({ \
+    __typeof__(*(ptr)) x_ = (x); \
+    (__typeof__(*(ptr))) __xchg_release((ptr), x_, sizeof(*(ptr))); \
+})
+
+static always_inline uint32_t __xchg_case_4(volatile uint32_t *ptr,
+                                            uint32_t new)
+{
+    __typeof__(*(ptr)) ret;
+
+    asm volatile (
+        "   amoswap.w.aqrl %0, %2, %1\n"
+        : "=r" (ret), "+A" (*ptr)
+        : "r" (new)
+        : "memory" );
+
+    return ret;
+}
+
+static always_inline uint64_t __xchg_case_8(volatile uint64_t *ptr,
+                                            uint64_t new)
+{
+    __typeof__(*(ptr)) ret;
+
+    asm volatile( \
+        "   amoswap.d.aqrl %0, %2, %1\n" \
+        : "=r" (ret), "+A" (*ptr) \
+        : "r" (new) \
+        : "memory" ); \
+
+    return ret;
+}
+
+static always_inline unsigned short __cmpxchg_case_2(volatile uint32_t *ptr,
+                                                     uint32_t old,
+                                                     uint32_t new);
+
+static always_inline unsigned short __cmpxchg_case_1(volatile uint32_t *ptr,
+                                                     uint32_t old,
+                                                     uint32_t new);
+
+static inline unsigned long __xchg(volatile void *ptr, unsigned long x, int size)
+{
+    switch (size) {
+    case 1:
+        return __cmpxchg_case_1(ptr, (uint32_t)-1, x);
+    case 2:
+        return __cmpxchg_case_2(ptr, (uint32_t)-1, x);
+    case 4:
+        return __xchg_case_4(ptr, x);
+    case 8:
+        return __xchg_case_8(ptr, x);
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return -1;
+}
+
+#define xchg(ptr,x) \
+({ \
+    __typeof__(*(ptr)) ret__; \
+    ret__ = (__typeof__(*(ptr))) \
+            __xchg((ptr), (unsigned long)(x), sizeof(*(ptr))); \
+    ret__; \
+})
+
+#define xchg32(ptr, x) \
+({ \
+    BUILD_BUG_ON(sizeof(*(ptr)) != 4); \
+    xchg((ptr), (x)); \
+})
+
+#define xchg64(ptr, x) \
+({ \
+    BUILD_BUG_ON(sizeof(*(ptr)) != 8); \
+    xchg((ptr), (x)); \
+})
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+#define __cmpxchg_relaxed(ptr, old, new, size) \
+({ \
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(*(ptr)) __old = (old); \
+    __typeof__(*(ptr)) new__ = (new); \
+    __typeof__(*(ptr)) ret__; \
+    register unsigned int __rc; \
+    switch (size) \
+	{ \
+    case 4: \
+        asm volatile( \
+            "0:	lr.w %0, %2\n" \
+            "	bne  %0, %z3, 1f\n" \
+            "	sc.w %1, %z4, %2\n" \
+            "	bnez %1, 0b\n" \
+            "1:\n" \
+            : "=&r" (ret__), "=&r" (__rc), "+A" (*ptr__) \
+            : "rJ" (__old), "rJ" (new__) \
+            : "memory"); \
+        break; \
+    case 8: \
+        asm volatile( \
+            "0:	lr.d %0, %2\n" \
+            "	bne %0, %z3, 1f\n" \
+            "	sc.d %1, %z4, %2\n" \
+            "	bnez %1, 0b\n" \
+            "1:\n" \
+            : "=&r" (ret__), "=&r" (__rc), "+A" (*ptr__) \
+            : "rJ" (__old), "rJ" (new__) \
+            : "memory"); \
+        break; \
+    default: \
+        ASSERT_UNREACHABLE(); \
+    } \
+    ret__; \
+})
+
+#define cmpxchg_relaxed(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) o_ = (o); \
+    __typeof__(*(ptr)) n_ = (n); \
+    (__typeof__(*(ptr))) __cmpxchg_relaxed((ptr), \
+                    o_, n_, sizeof(*(ptr))); \
+})
+
+#define __cmpxchg_acquire(ptr, old, new, size) \
+({ \
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(*(ptr)) __old = (old); \
+    __typeof__(*(ptr)) new__ = (new); \
+    __typeof__(*(ptr)) ret__; \
+    register unsigned int __rc; \
+    switch (size) \
+	{ \
+    case 4: \
+        asm volatile( \
+            "0:	lr.w %0, %2\n" \
+            "	bne  %0, %z3, 1f\n" \
+            "	sc.w %1, %z4, %2\n" \
+            "	bnez %1, 0b\n" \
+            RISCV_ACQUIRE_BARRIER \
+            "1:\n"	 \
+            : "=&r" (ret__), "=&r" (__rc), "+A" (*ptr__) \
+            : "rJ" (__old), "rJ" (new__) \
+            : "memory"); \
+        break; \
+    case 8: \
+        asm volatile( \
+            "0:	lr.d %0, %2\n" \
+            "	bne %0, %z3, 1f\n" \
+            "	sc.d %1, %z4, %2\n" \
+            "	bnez %1, 0b\n" \
+            RISCV_ACQUIRE_BARRIER \
+            "1:\n" \
+            : "=&r" (ret__), "=&r" (__rc), "+A" (*ptr__) \
+            : "rJ" (__old), "rJ" (new__) \
+            : "memory"); \
+        break; \
+    default: \
+        ASSERT_UNREACHABLE(); \
+    } \
+    ret__; \
+})
+
+#define cmpxchg_acquire(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) o_ = (o); \
+    __typeof__(*(ptr)) n_ = (n); \
+    (__typeof__(*(ptr))) __cmpxchg_acquire((ptr), o_, n_, sizeof(*(ptr))); \
+})
+
+#define __cmpxchg_release(ptr, old, new, size) \
+({									\
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(*(ptr)) __old = (old); \
+    __typeof__(*(ptr)) new__ = (new); \
+    __typeof__(*(ptr)) ret__; \
+    register unsigned int __rc; \
+    switch (size) \
+	{ \
+    case 4: \
+        asm volatile ( \
+            RISCV_RELEASE_BARRIER \
+            "0:	lr.w %0, %2\n" \
+            "	bne  %0, %z3, 1f\n" \
+            "	sc.w %1, %z4, %2\n" \
+            "	bnez %1, 0b\n" \
+            "1:\n" \
+            : "=&r" (ret__), "=&r" (__rc), "+A" (*ptr__)	\
+            : "rJ" (__old), "rJ" (new__) \
+            : "memory" ); \
+        break; \
+    case 8: \
+        asm volatile ( \
+            RISCV_RELEASE_BARRIER \
+            "0:	lr.d %0, %2\n" \
+            "	bne %0, %z3, 1f\n" \
+            "	sc.d %1, %z4, %2\n" \
+            "	bnez %1, 0b\n" \
+            "1:\n" \
+            : "=&r" (ret__), "=&r" (__rc), "+A" (*ptr__) \
+            : "rJ" (__old), "rJ" (new__) \
+            : "memory" ); \
+        break; \
+    default: \
+        ASSERT_UNREACHABLE(); \
+    } \
+    ret__; \
+})
+
+#define cmpxchg_release(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) _o_ = (o); \
+    __typeof__(*(ptr)) _n_ = (n); \
+    (__typeof__(*(ptr))) __cmpxchg_release((ptr), _o_, _n_, sizeof(*(ptr))); \
+})
+
+static always_inline uint32_t __cmpxchg_case_4(volatile uint32_t *ptr,
+                                               uint32_t old,
+                                               uint32_t new)
+{
+    uint32_t ret;
+    register uint32_t rc;
+
+    asm volatile (
+        "0: lr.w %0, %2\n"
+        "   bne  %0, %z3, 1f\n"
+        "   sc.w.rl %1, %z4, %2\n"
+        "   bnez %1, 0b\n"
+        "   fence rw, rw\n"
+        "1:\n"
+        : "=&r" (ret), "=&r" (rc), "+A" (*ptr)
+        : "rJ" (old), "rJ" (new)
+        : "memory" );
+
+    return ret;
+}
+
+static always_inline uint64_t __cmpxchg_case_8(volatile uint64_t *ptr,
+                                               uint64_t old,
+                                               uint64_t new)
+{
+    uint64_t ret;
+    register uint32_t rc;
+
+    asm volatile(
+        "0: lr.d %0, %2\n"
+        "   bne %0, %z3, 1f\n"
+        "   sc.d.rl %1, %z4, %2\n"
+        "   bnez %1, 0b\n"
+        "   fence rw, rw\n"
+        "1:\n"
+        : "=&r" (ret), "=&r" (rc), "+A" (*ptr)
+        : "rJ" (old), "rJ" (new)
+        : "memory");
+
+    return ret;
+}
+
+#define __emulate_cmpxchg_case1_2(ptr, new, read_func, cmpxchg_func, swap_byte_mask_base)\
+({                                                                              \
+    __typeof__(*(ptr)) read_val;                                                \
+    __typeof__(*(ptr)) swapped_new;                                             \
+    __typeof__(*(ptr)) ret;                                                     \
+    __typeof__(*(ptr)) new_ = (__typeof__(*(ptr)))new;                          \
+                                                                                \
+    __typeof__(ptr) aligned_ptr = (__typeof__(ptr))((unsigned long)ptr & ~3);   \
+    __typeof__(*(ptr)) mask_off = ((unsigned long)ptr & 3) * 8;                 \
+    __typeof__(*(ptr)) mask =                                                   \
+      (__typeof__(*(ptr)))swap_byte_mask_base << mask_off;                      \
+    __typeof__(*(ptr)) masked_new = (new_ << mask_off) & mask;                  \
+                                                                                \
+    do {                                                                        \
+        read_val = read_func(aligned_ptr);                                      \
+        swapped_new = read_val & ~mask;                                         \
+        swapped_new |= masked_new;                                              \
+        ret = cmpxchg_func(aligned_ptr, read_val, swapped_new);                 \
+    } while ( ret != read_val );                                                \
+                                                                                \
+    ret = MASK_EXTR(swapped_new, mask);                                         \
+    ret;                                                                        \
+})
+
+static always_inline unsigned short __cmpxchg_case_2(volatile uint32_t *ptr,
+                                                     uint32_t old,
+                                                     uint32_t new)
+{
+    (void) old;
+
+    if (((unsigned long)ptr & 3) == 3)
+    {
+#ifdef CONFIG_64BIT
+        return __emulate_cmpxchg_case1_2((uint64_t *)ptr, new,
+                                         readq, __cmpxchg_case_8, 0xffffU);
+#else
+        #error "add emulation support of cmpxchg for CONFIG_32BIT"
+#endif
+    }
+    else
+        return __emulate_cmpxchg_case1_2((uint32_t *)ptr, new,
+                                         readl, __cmpxchg_case_4, 0xffffU);
+}
+
+static always_inline unsigned short __cmpxchg_case_1(volatile uint32_t *ptr,
+                                                     uint32_t old,
+                                                     uint32_t new)
+{
+    (void) old;
+
+    return __emulate_cmpxchg_case1_2((uint32_t *)ptr, new,
+                                     readl, __cmpxchg_case_4, 0xffU);
+}
+
+static always_inline unsigned long __cmpxchg(volatile void *ptr,
+                                             unsigned long old,
+                                             unsigned long new,
+                                             int size)
+{
+    switch (size)
+    {
+    case 1:
+        return __cmpxchg_case_1(ptr, old, new);
+    case 2:
+        return __cmpxchg_case_2(ptr, old, new);
+    case 4:
+        return __cmpxchg_case_4(ptr, old, new);
+    case 8:
+        return __cmpxchg_case_8(ptr, old, new);
+    default:
+        ASSERT_UNREACHABLE();
+    }
+
+    return old;
+}
+
+#define cmpxchg(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) ret__; \
+    ret__ = (__typeof__(*(ptr))) \
+            __cmpxchg((ptr), (unsigned long)(o), (unsigned long)(n), \
+                      sizeof(*(ptr))); \
+    ret__; \
+})
+
+#define cmpxchg_local(ptr, o, n) \
+    (__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
+
+#define cmpxchg32(ptr, o, n) \
+({ \
+    BUILD_BUG_ON(sizeof(*(ptr)) != 4); \
+    cmpxchg((ptr), (o), (n)); \
+})
+
+#define cmpxchg32_local(ptr, o, n) \
+({ \
+    BUILD_BUG_ON(sizeof(*(ptr)) != 4); \
+    cmpxchg_relaxed((ptr), (o), (n)) \
+})
+
+#define cmpxchg64(ptr, o, n) \
+({ \
+    BUILD_BUG_ON(sizeof(*(ptr)) != 8); \
+    cmpxchg((ptr), (o), (n)); \
+})
+
+#define cmpxchg64_local(ptr, o, n) \
+({ \
+    BUILD_BUG_ON(sizeof(*(ptr)) != 8); \
+    cmpxchg_relaxed((ptr), (o), (n)); \
+})
+
+#endif /* _ASM_RISCV_CMPXCHG_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


