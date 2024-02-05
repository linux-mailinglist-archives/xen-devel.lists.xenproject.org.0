Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A895849E3C
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676206.1052266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xv-0001xG-2T; Mon, 05 Feb 2024 15:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676206.1052266; Mon, 05 Feb 2024 15:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xu-0001pe-QA; Mon, 05 Feb 2024 15:32:58 +0000
Received: by outflank-mailman (input) for mailman id 676206;
 Mon, 05 Feb 2024 15:32:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xr-0007Hv-Hn
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:55 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d4d97775-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:32:54 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-511413e52d4so2567629e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:54 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:53 -0800 (PST)
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
X-Inumbo-ID: d4d97775-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147174; x=1707751974; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yd/D5KaXlx6vAlR/DP81B7tIQ/qT+Y2h20i78E/WLDg=;
        b=QCZdrNgrS5sBYrAY+mi6VZtZ8hObK27cLVEjSNf+xBTqFV7b38xGMoQ8OJvsS65Ihh
         fVGHQSduci/l9vftwCcfjq0lCZnvnKtvt7EKK1fGt3UeEZWik3+MZjBCrl32dkLZ98pU
         RG/LBatFPqD7luoQZxWFfp+NPrfrjv3v56sn+gMCUH210wOhJOzKGCRreVLOU3TdSiCI
         oSKEOnAOFaYVWZzqtSjCgVR71j9v0yXENhNYY68MpeGj5yZzqXOzAJlczx8lTzRv2GsW
         OEzOXqIAuwfVG0ENf2I6R/1+D+QP2EcBhNC/7iHgPsGq6KBiEIr2YbioRbxOtBOoOATv
         CCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147174; x=1707751974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd/D5KaXlx6vAlR/DP81B7tIQ/qT+Y2h20i78E/WLDg=;
        b=txPOsLnQSERRWGFdSIUz4Zg/LOnDQJRBug/RRcjoWMit+ufqv42Y4quX04ARMarSNn
         5lsbT2wKoJ+SAAUOtCIZPR3MiSsUnCSn8TNfLMKoqkqD90QBoG8Ugytlt3gjTyB507XY
         woYiNictvWl6UTIIV09HxX1VsBfkkZ+mKkRB8xt7cxlB1QKEkTgXdMZJwh5nEh7yLAss
         mvICa7KNRrJ5CPH5sIuQtEInkDWAaxUUu/chXEKPnFLLM4kDcmTMlCwU9iX7Jh1t+T1I
         0sfUdCgRV7E08ybZUjdVtC18xLmUYzcN4Yqp5bxUpMq8KTf+h7fo3LVGXJxDel9HpSa2
         mlkw==
X-Gm-Message-State: AOJu0YwishMIX0092W269kl1DmVCsvkUGfIkV2jbt29FMqsectsAuTKI
	3kGGrDPndMAXzJ5niA98CIdPLJL8llAJTtFGJHS0XGJXHyOKWrzJQwkgz7eH
X-Google-Smtp-Source: AGHT+IHvXEiNZHWqya7iE9QdE2B0AV78daWPxqCRsZsXBuoNhkLis/5I/7wpWYR/PjNzgQ183HXw5g==
X-Received: by 2002:a05:6512:38a2:b0:50f:18f7:855e with SMTP id o2-20020a05651238a200b0050f18f7855emr7997617lft.39.1707147174216;
        Mon, 05 Feb 2024 07:32:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUrm07S+ZfxtX5MVJHn3PsHlgEtGQmHiXSobCqh/I+VR62nJIKm1bE6ufQD8xujoZpT0TK/rwboGJGfRVmk9xdeUu62LTmRbn2mr3m97AjMDPSVR7ZiOsxo1cQ6zpLpgXJkmUzKvI74qwbMiH6mnGbtTCgqupwjGFccSALSaYx+kly9rDXvDVVcxEm7gIaTWPADpmt8PupnMUFm8X6U0KqYj2gvT1q+qZyIa+id81n7fj0j324Pk44DNDUS1aYK5pvQTyJXTQoZpZrSmqNuek+UwsS7w5iOIJDhnn06Qhv2vFAI12E+sBdfmzJl3U+OGHhmqfL7
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
Subject: [PATCH v4 12/30] xen/riscv: introduce cmpxchg.h
Date: Mon,  5 Feb 2024 16:32:19 +0100
Message-ID: <25315ca95baffc9b222fb0ae89375a94b01a9b46.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header was taken from Linux kernl 6.4.0-rc1.

Addionally, were updated:
* add emulation of {cmp}xchg for 1/2 byte types
* replace tabs with spaces
* replace __* varialbed with *__
* introduce generic version of xchg_* and cmpxchg_*.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - Code style fixes.
 - enforce in __xchg_*() has the same type for new and *ptr, also "\n"
   was removed at the end of asm instruction.
 - dependency from https://lore.kernel.org/xen-devel/cover.1706259490.git.federico.serafini@bugseng.com/
 - switch from ASSERT_UNREACHABLE to STATIC_ASSERT_UNREACHABLE().
 - drop xchg32(ptr, x) and xchg64(ptr, x) as they aren't used.
 - drop cmpxcg{32,64}_{local} as they aren't used.
 - introduce generic version of xchg_* and cmpxchg_*.
 - update the commit message.
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
 xen/arch/riscv/include/asm/cmpxchg.h | 237 +++++++++++++++++++++++++++
 1 file changed, 237 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 0000000000..b751a50cbf
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -0,0 +1,237 @@
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
+#define ALIGN_DOWN(addr, size)  ((addr) & (~((size) - 1)))
+
+#define __amoswap_generic(ptr, new, ret, sfx, release_barrier, acquire_barrier) \
+({ \
+    asm volatile( \
+        release_barrier \
+        " amoswap" sfx " %0, %2, %1\n" \
+        acquire_barrier \
+        : "=r" (ret), "+A" (*ptr) \
+        : "r" (new) \
+        : "memory" ); \
+})
+
+#define emulate_xchg_1_2(ptr, new, ret, release_barrier, acquire_barrier) \
+({ \
+    uint32_t *ptr_32b_aligned = (uint32_t *)ALIGN_DOWN((unsigned long)ptr, 4); \
+    uint8_t mask_l = ((unsigned long)(ptr) & (0x8 - sizeof(*ptr))) * BITS_PER_BYTE; \
+    uint8_t mask_size = sizeof(*ptr) * BITS_PER_BYTE; \
+    uint8_t mask_h = mask_l + mask_size - 1; \
+    unsigned long mask = GENMASK(mask_h, mask_l); \
+    unsigned long new_ = (unsigned long)(new) << mask_l; \
+    unsigned long ret_; \
+    unsigned long rc; \
+    \
+    asm volatile( \
+        release_barrier \
+        "0: lr.d %0, %2\n" \
+        "   and  %1, %0, %z4\n" \
+        "   or   %1, %1, %z3\n" \
+        "   sc.d %1, %1, %2\n" \
+        "   bnez %1, 0b\n" \
+        acquire_barrier \
+        : "=&r" (ret_), "=&r" (rc), "+A" (*ptr_32b_aligned) \
+        : "rJ" (new_), "rJ" (~mask) \
+        : "memory"); \
+    \
+    ret = (__typeof__(*(ptr)))((ret_ & mask) >> mask_l); \
+})
+
+#define __xchg_generic(ptr, new, size, sfx, release_barrier, acquire_barrier) \
+({ \
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(*(ptr)) new__ = (new); \
+    __typeof__(*(ptr)) ret__; \
+    switch (size) \
+    { \
+    case 1: \
+    case 2: \
+        emulate_xchg_1_2(ptr__, new__, ret__, release_barrier, acquire_barrier); \
+        break; \
+    case 4: \
+        __amoswap_generic(ptr__, new__, ret__,\
+                          ".w" sfx,  release_barrier, acquire_barrier); \
+        break; \
+    case 8: \
+        __amoswap_generic(ptr__, new__, ret__,\
+                          ".d" sfx,  release_barrier, acquire_barrier); \
+        break; \
+    default: \
+        STATIC_ASSERT_UNREACHABLE(); \
+    } \
+    ret__; \
+})
+
+#define xchg_relaxed(ptr, x) \
+({ \
+    __typeof__(*(ptr)) x_ = (x); \
+    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)), "", "", ""); \
+})
+
+#define xchg_acquire(ptr, x) \
+({ \
+    __typeof__(*(ptr)) x_ = (x); \
+    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)), \
+                                       "", "", RISCV_ACQUIRE_BARRIER); \
+})
+
+#define xchg_release(ptr, x) \
+({ \
+    __typeof__(*(ptr)) x_ = (x); \
+    (__typeof__(*(ptr)))__xchg_generic(ptr, x_, sizeof(*(ptr)),\
+                                       "", RISCV_RELEASE_BARRIER, ""); \
+})
+
+#define xchg(ptr,x) \
+({ \
+    __typeof__(*(ptr)) ret__; \
+    ret__ = (__typeof__(*(ptr))) \
+            __xchg_generic(ptr, (unsigned long)(x), sizeof(*(ptr)), \
+                           ".aqrl", "", ""); \
+    ret__; \
+})
+
+#define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx, release_barrier, acquire_barrier)	\
+ ({ \
+    register unsigned int rc; \
+    asm volatile( \
+        release_barrier \
+        "0: lr" lr_sfx " %0, %2\n" \
+        "   bne  %0, %z3, 1f\n" \
+        "   sc" sc_sfx " %1, %z4, %2\n" \
+        "   bnez %1, 0b\n" \
+        acquire_barrier \
+        "1:\n" \
+        : "=&r" (ret), "=&r" (rc), "+A" (*ptr) \
+        : "rJ" (old), "rJ" (new) \
+        : "memory"); \
+ })
+
+#define emulate_cmpxchg_1_2(ptr, old, new, ret, sc_sfx, release_barrier, acquire_barrier) \
+({ \
+    uint32_t *ptr_32b_aligned = (uint32_t *)ALIGN_DOWN((unsigned long)ptr, 4); \
+    uint8_t mask_l = ((unsigned long)(ptr) & (0x8 - sizeof(*ptr))) * BITS_PER_BYTE; \
+    uint8_t mask_size = sizeof(*ptr) * BITS_PER_BYTE; \
+    uint8_t mask_h = mask_l + mask_size - 1; \
+    unsigned long mask = GENMASK(mask_h, mask_l); \
+    unsigned long old_ = (unsigned long)(old) << mask_l; \
+    unsigned long new_ = (unsigned long)(new) << mask_l; \
+    unsigned long ret_; \
+    unsigned long rc; \
+    \
+    __asm__ __volatile__ ( \
+        release_barrier \
+        "0: lr.d %0, %2\n" \
+        "   and  %1, %0, %z5\n" \
+        "   bne  %1, %z3, 1f\n" \
+        "   and  %1, %0, %z6\n" \
+        "   or   %1, %1, %z4\n" \
+        "   sc.d" sc_sfx " %1, %1, %2\n" \
+        "   bnez %1, 0b\n" \
+        acquire_barrier \
+        "1:\n" \
+        : "=&r" (ret_), "=&r" (rc), "+A" (*ptr_32b_aligned) \
+        : "rJ" (old_), "rJ" (new_), \
+          "rJ" (mask), "rJ" (~mask) \
+        : "memory"); \
+    \
+    ret = (__typeof__(*(ptr)))((ret_ & mask) >> mask_l); \
+})
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+#define __cmpxchg_generic(ptr, old, new, size, sc_sfx, release_barrier, acquire_barrier) \
+({ \
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(*(ptr)) old__ = (__typeof__(*(ptr)))(old); \
+    __typeof__(*(ptr)) new__ = (__typeof__(*(ptr)))(new); \
+    __typeof__(*(ptr)) ret__; \
+    switch (size) \
+    { \
+    case 1: \
+    case 2: \
+        emulate_cmpxchg_1_2(ptr, old, new, ret__,\
+                            sc_sfx, release_barrier, acquire_barrier); \
+        break; \
+    case 4: \
+        __generic_cmpxchg(ptr__, old__, new__, ret__, \
+                          ".w", ".w"sc_sfx, release_barrier, acquire_barrier); \
+        break; \
+    case 8: \
+        __generic_cmpxchg(ptr__, old__, new__, ret__, \
+                          ".d", ".d"sc_sfx, release_barrier, acquire_barrier); \
+        break; \
+    default: \
+        STATIC_ASSERT_UNREACHABLE(); \
+    } \
+    ret__; \
+})
+
+#define cmpxchg_relaxed(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) o_ = (o); \
+    __typeof__(*(ptr)) n_ = (n); \
+    (__typeof__(*(ptr)))__cmpxchg_generic(ptr, \
+                    o_, n_, sizeof(*(ptr)), "", "", ""); \
+})
+
+#define cmpxchg_acquire(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) o_ = (o); \
+    __typeof__(*(ptr)) n_ = (n); \
+    (__typeof__(*(ptr)))__cmpxchg_generic(ptr, o_, n_, sizeof(*(ptr)), \
+                                          "", "", RISCV_ACQUIRE_BARRIER); \
+})
+
+#define cmpxchg_release(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) o_ = (o); \
+    __typeof__(*(ptr)) n_ = (n); \
+    (__typeof__(*(ptr)))__cmpxchg_release(ptr, o_, n_, sizeof(*(ptr)), \
+                                          "", RISCV_RELEASE_BARRIER, ""); \
+})
+
+#define cmpxchg(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) ret__; \
+    ret__ = (__typeof__(*(ptr))) \
+            __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
+                              sizeof(*(ptr)), ".rl", "", " fence rw, rw\n"); \
+    ret__; \
+})
+
+#define __cmpxchg(ptr, o, n, s) \
+({ \
+    __typeof__(*(ptr)) ret__; \
+    ret__ = (__typeof__(*(ptr))) \
+            __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
+                              s, ".rl", "", " fence rw, rw\n"); \
+    ret__; \
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


