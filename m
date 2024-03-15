Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9538787D340
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693994.1082762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwu-0007tB-BJ; Fri, 15 Mar 2024 18:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693994.1082762; Fri, 15 Mar 2024 18:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwu-0007od-3s; Fri, 15 Mar 2024 18:06:32 +0000
Received: by outflank-mailman (input) for mailman id 693994;
 Fri, 15 Mar 2024 18:06:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBws-0005yW-Qv
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:30 +0000
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [2a00:1450:4864:20::234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bf829991-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:29 +0100 (CET)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d41d1bedc9so38585381fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:29 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:28 -0700 (PDT)
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
X-Inumbo-ID: bf829991-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525989; x=1711130789; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ti/NGZu80Gob+FUDMzaaMxrVNmtSZyxPSgcxSW8TGYY=;
        b=ioiHxM6YC4ipLL+FU8dPswJTlielQWGdGdaK5BztCVIMrqwCrzCvbUwThMeHZJQklJ
         gYf0OkydsQIeg2XIqfzikJsI/LVcTeZClhahTQnvHq+n1gmd+ymaKl3rVCHuRxgcKwmF
         ByqQxMG9Cqxp+t2P//hnHsuz3dOkcKCpTQHoF2EZteGydUGn0NPFwDFxdtGtDOPfM8A4
         bdNvURyNoRiPJdaMa3Wzc1NqUxdCeb+MXGLxrhKQIaxIkjn2wxFdU7HD1GCufNAM2sov
         Oj5l8isiXwC3nO7Dm3Pv/BDfFKPSyFMrHAfIvkJ24D0NIwi2DGqAbE6RJXN5YNCZ71hv
         iTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525989; x=1711130789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ti/NGZu80Gob+FUDMzaaMxrVNmtSZyxPSgcxSW8TGYY=;
        b=vuAHzaPXH1Ua+eC70HehzR6yYcjY2VWgF5DkyXyXhuk+9CpXtLFW+m0WLGY8b6Ogq/
         hmR35T/cBoPjYoiHxWUzl8Rc2G5KZrxaou00NasgbGyWK/mPFH6qlDjBPhqHSU7U94uQ
         4JzBz4H1kWzKm1/CiekExZWT7cTq+c7UdVIQbH5thwQ5JTcBCdxNDvAa35smu7hcYAlW
         fWaTZdX7P/TuMwdVue5pyExYkpGzbGiP+wG2Kw9JSIu37G6UdG3vk532qWWGjLyYUP6M
         GwAnI+seeo02J4gKFmMQ4LCEGoGoui15037mGS9vLdOkUiV9FMauUJRn6neFg9v7ZsXx
         GVjA==
X-Gm-Message-State: AOJu0YwEYDa/HvbDgKReOx3K53GphjxdpVQOiOSpKoH5PCXirGawSg1g
	B5KLmBKNOIqv83veVK7t+arUyNxiw9y6kWj2eAHQQzKKzmkut9v4+QJDoMdOBGY=
X-Google-Smtp-Source: AGHT+IF/Q5WWRUtov1Ash5MXosXNJ4R80T3CZiyJa9EhYCOflOTVmzB+NM1iRU/Noc+YnDxw2Ajs4A==
X-Received: by 2002:a05:651c:1039:b0:2d4:3e96:47ee with SMTP id w25-20020a05651c103900b002d43e9647eemr3262634ljm.26.1710525989052;
        Fri, 15 Mar 2024 11:06:29 -0700 (PDT)
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
Subject: [PATCH v6 08/20] xen/riscv: introduce cmpxchg.h
Date: Fri, 15 Mar 2024 19:06:04 +0100
Message-ID: <bf65ce1ff5f683cc6b638fa7de0c54d5e0aead33.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The header was taken from Linux kernl 6.4.0-rc1.

Addionally, were updated:
* add emulation of {cmp}xchg for 1/2 byte types using 32-bit atomic
  access.
* replace tabs with spaces
* replace __* variale with *__
* introduce generic version of xchg_* and cmpxchg_*.
* drop {cmp}xchg{release,relaxed,acquire} as Xen doesn't use them
* drop barries and use instruction suffixices instead ( .aq, .rl, .aqrl )

Implementation of 4- and 8-byte cases were updated according to the spec:
```
              ....
Linux Construct         RVWMO AMO Mapping
atomic <op> relaxed     amo<op>.{w|d}
atomic <op> acquire     amo<op>.{w|d}.aq
atomic <op> release     amo<op>.{w|d}.rl
atomic <op>             amo<op>.{w|d}.aqrl
Linux Construct         RVWMO LR/SC Mapping
atomic <op> relaxed     loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
atomic <op> acquire     loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
atomic <op> release     loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ; bnez loop OR
                        fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}∗ ; bnez loop
atomic <op>             loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez loop

Table A.5: Mappings from Linux memory primitives to RISC-V primitives

```

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
-  update the commit message? ( As before I don't understand this point. Can you give an example of what sort of opcode / instruction is missing?)
 - Code style fixes
 - change sizeof(*ptr) -> sizeof(*(ptr))
 - update operands names and some local variables for macros emulate_xchg_1_2() and emulate_cmpxchg_1_2()
 - drop {cmp}xchg_{relaxed,acquire,release) versions as they aren't needed for Xen
 - update __amoswap_generic() prototype and defintion: drop pre and post barries.
 - update emulate_xchg_1_2() prototype and definion: add lr_sfx, drop pre and post barries.
 - rename __xchg_generic to __xchg(), make __xchg as static inline function to be able to "#ifndef CONFIG_32BIT case 8:... " 
---
Changes in V5:
 - update the commit message.
 - drop ALIGN_DOWN().
 - update the definition of emulate_xchg_1_2(): 
   - lr.d -> lr.w, sc.d -> sc.w.
   - drop ret argument.
   - code style fixes around asm volatile.
   - update prototype.
   - use asm named operands.
   - rename local variables.
   - add comment above the macros
 - update the definition of __xchg_generic:
   - rename to __xchg()
   - transform it to static inline
   - code style fixes around switch()
   - update prototype.
 - redefine cmpxchg()
 - update emulate_cmpxchg_1_2():
   - update prototype
   - update local variables names and usage of them
   - use name asm operands.
   - add comment above the macros
 - drop pre and post, and use .aq,.rl, .aqrl suffixes.
 - drop {cmp}xchg_{relaxed, aquire, release} as they are not used by Xen.
 - drop unnessary details in comment above emulate_cmpxchg_1_2()
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
 xen/arch/riscv/include/asm/cmpxchg.h | 209 +++++++++++++++++++++++++++
 1 file changed, 209 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 0000000000..aba2858933
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -0,0 +1,209 @@
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
+#define __amoswap_generic(ptr, new, ret, sfx) \
+({ \
+    asm volatile ( \
+        " amoswap" sfx " %0, %2, %1" \
+        : "=r" (ret), "+A" (*ptr) \
+        : "r" (new) \
+        : "memory" ); \
+})
+
+/*
+ * For LR and SC, the A extension requires that the address held in rs1 be
+ * naturally aligned to the size of the operand (i.e., eight-byte aligned
+ * for 64-bit words and four-byte aligned for 32-bit words).
+ * If the address is not naturally aligned, an address-misaligned exception
+ * or an access-fault exception will be generated.
+ *
+ * Thereby:
+ * - for 1-byte xchg access the containing word by clearing low two bits
+ * - for 2-byte xchg ccess the containing word by clearing bit 1.
+ *
+ * If resulting 4-byte access is still misalgined, it will fault just as
+ * non-emulated 4-byte access would.
+ */
+#define emulate_xchg_1_2(ptr, new, lr_sfx, sc_sfx) \
+({ \
+    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr & ~(0x4 - sizeof(*(ptr)))); \
+    unsigned int new_val_pos = ((unsigned long)(ptr) & (0x4 - sizeof(*(ptr)))) * BITS_PER_BYTE; \
+    unsigned long mask = GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0) << new_val_pos; \
+    unsigned int new_ = new << new_val_pos; \
+    unsigned int old; \
+    unsigned int scratch; \
+    \
+    asm volatile ( \
+        "0: lr.w" lr_sfx " %[old], %[aligned_ptr]\n" \
+        "   and  %[scratch], %[old], %z[nmask]\n" \
+        "   or   %[scratch], %[scratch], %z[new_]\n" \
+        "   sc.w" sc_sfx " %[scratch], %[scratch], %[aligned_ptr]\n" \
+        "   bnez %[scratch], 0b\n" \
+        : [old] "=&r" (old), [scratch] "=&r" (scratch), [aligned_ptr] "+A" (*aligned_ptr) \
+        : [new_] "rJ" (new_), [nmask] "rJ" (~mask) \
+        : "memory" ); \
+    \
+    (__typeof__(*(ptr)))((old & mask) >> new_val_pos); \
+})
+
+static always_inline unsigned long __xchg(volatile void *ptr, unsigned long new, int size)
+{
+    unsigned long ret;
+
+    switch ( size )
+    {
+    case 1:
+        ret = emulate_xchg_1_2((volatile uint8_t *)ptr, new, ".aq", ".aqrl");
+        break;
+    case 2:
+        ret = emulate_xchg_1_2((volatile uint16_t *)ptr, new, ".aq", ".aqrl");
+        break;
+    case 4:
+        __amoswap_generic((volatile uint32_t *)ptr, new, ret, ".w.aqrl");
+        break;
+#ifndef CONFIG_32BIT
+    case 8:
+        __amoswap_generic((volatile uint64_t *)ptr, new, ret, ".d.aqrl");
+        break;
+#endif
+    default:
+        STATIC_ASSERT_UNREACHABLE();
+    }
+
+    return ret;
+}
+
+#define xchg(ptr, x) \
+({ \
+    __typeof__(*(ptr)) n_ = (x); \
+    (__typeof__(*(ptr))) \
+        __xchg((ptr), (unsigned long)(n_), sizeof(*(ptr))); \
+})
+
+#define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx)	\
+ ({ \
+    register unsigned int rc; \
+    __typeof__(*(ptr)) old__ = (__typeof__(*(ptr)))(old); \
+    __typeof__(*(ptr)) new__ = (__typeof__(*(ptr)))(new); \
+    asm volatile( \
+        "0: lr" lr_sfx " %0, %2\n" \
+        "   bne  %0, %z3, 1f\n" \
+        "   sc" sc_sfx " %1, %z4, %2\n" \
+        "   bnez %1, 0b\n" \
+        "1:\n" \
+        : "=&r" (ret), "=&r" (rc), "+A" (*ptr) \
+        : "rJ" (old__), "rJ" (new__) \
+        : "memory"); \
+ })
+
+/*
+ * For LR and SC, the A extension requires that the address held in rs1 be
+ * naturally aligned to the size of the operand (i.e., eight-byte aligned
+ * for 64-bit words and four-byte aligned for 32-bit words).
+ * If the address is not naturally aligned, an address-misaligned exception
+ * or an access-fault exception will be generated.
+ *
+ * Thereby:
+ * - for 1-byte xchg access the containing word by clearing low two bits
+ * - for 2-byte xchg ccess the containing word by clearing first bit.
+ * 
+ * If resulting 4-byte access is still misalgined, it will fault just as
+ * non-emulated 4-byte access would.
+ *
+ * old_val was casted to unsigned long for cmpxchgptr()
+ */
+#define emulate_cmpxchg_1_2(ptr, old, new, lr_sfx, sc_sfx) \
+({ \
+    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr & ~(0x4 - sizeof(*(ptr)))); \
+    uint8_t new_val_pos = ((unsigned long)(ptr) & (0x4 - sizeof(*(ptr)))) * BITS_PER_BYTE; \
+    unsigned long mask = GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0) << new_val_pos; \
+    unsigned int old_ = old << new_val_pos; \
+    unsigned int new_ = new << new_val_pos; \
+    unsigned int old_val; \
+    unsigned int scratch; \
+    \
+    __asm__ __volatile__ ( \
+        "0: lr.w" lr_sfx " %[scratch], %[aligned_ptr]\n" \
+        "   and  %[old_val], %[scratch], %z[mask]\n" \
+        "   bne  %[old_val], %z[old_], 1f\n" \
+        "   xor  %[scratch], %[old_val], %[scratch]\n" \
+        "   or   %[scratch], %[scratch], %z[new_]\n" \
+        "   sc.w" sc_sfx " %[scratch], %[scratch], %[aligned_ptr]\n" \
+        "   bnez %[scratch], 0b\n" \
+        "1:\n" \
+        : [old_val] "=&r" (old_val), [scratch] "=&r" (scratch), [aligned_ptr] "+A" (*aligned_ptr) \
+        : [old_] "rJ" (old_), [new_] "rJ" (new_), \
+          [mask] "rJ" (mask) \
+        : "memory" ); \
+    \
+    (__typeof__(*(ptr)))((unsigned long)old_val >> new_val_pos); \
+})
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+static always_inline unsigned long __cmpxchg(volatile void *ptr,
+                         unsigned long old,
+                         unsigned long new,
+                         int size)
+{
+    unsigned long ret;
+
+    switch ( size )
+    {
+    case 1:
+        ret = emulate_cmpxchg_1_2((volatile uint8_t *)ptr, old, new,
+                                  ".aq", ".aqrl");
+        break;
+    case 2:
+        ret = emulate_cmpxchg_1_2((volatile uint16_t *)ptr, old, new,
+                                   ".aq", ".aqrl");
+        break;
+    case 4:
+        __generic_cmpxchg((volatile uint32_t *)ptr, old, new, ret,
+                          ".w.aq", ".w.aqrl");
+        break;
+#ifndef CONFIG_32BIT
+    case 8:
+        __generic_cmpxchg((volatile uint64_t *)ptr, old, new,
+                           ret, ".d.aq", ".d.aqrl");
+        break;
+#endif
+    default:
+        STATIC_ASSERT_UNREACHABLE();
+    }
+
+    return ret;
+}
+
+#define cmpxchg(ptr, o, n) \
+({ \
+    __typeof__(*(ptr)) o_ = (o); \
+    __typeof__(*(ptr)) n_ = (n); \
+    (__typeof__(*(ptr))) \
+    __cmpxchg((ptr), (unsigned long)(o_), (unsigned long)(n_), \
+              sizeof(*(ptr))); \
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


