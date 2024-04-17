Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B90A8A804A
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707306.1105132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AH-0000i8-J5; Wed, 17 Apr 2024 10:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707306.1105132; Wed, 17 Apr 2024 10:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AH-0000fx-DZ; Wed, 17 Apr 2024 10:05:17 +0000
Received: by outflank-mailman (input) for mailman id 707306;
 Wed, 17 Apr 2024 10:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AF-0007lO-34
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:15 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id faff5a3d-fca1-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 12:05:12 +0200 (CEST)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-516d2600569so6889752e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:13 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:11 -0700 (PDT)
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
X-Inumbo-ID: faff5a3d-fca1-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348312; x=1713953112; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYoKcuxPvIDjafJUN0WvYkwMi61LF4Xs84KxsS85VX4=;
        b=L2zL4PvwWAM0Y1fwKKfhwQNcCaxuQXKxlX9VrvG8JABa8z4OVNTDfNw8yBtkq3dF8k
         s54nl3DcFkKv/KYVOjwHfFONPGNW/hk1/96oH/FPjFfr+zPjwtAyPEpLi5BUP3N3D2co
         dy4s5DTASeh7euHjAuUDKpYgyOWHVumeT3oKMGgaGUX8mbYnSoWgoVxm7yPqwPcsXOOP
         nEHnylK/K4vzq6V7VxzMRrjrre2hUOs1H1LETQ9iRJ6JMR+OoBcPZPpXHSg533ImTWLx
         FmR2OFH1GPK1j4vMIZtpdfUvfFng/HdF840qyk3lZomDvCD4Oj8JhR18gKNsMRhT/ajB
         Q5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348312; x=1713953112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYoKcuxPvIDjafJUN0WvYkwMi61LF4Xs84KxsS85VX4=;
        b=KPLC5/U6+1iNzBDGMTXBNrU/Q3EBUOLXzqMfI6iaxgIcMorWvcDR6vSQ/4gRNRnL5i
         X9HJSK6CkcDT8ARvPNHULb+/H5MO0yUhiyeeIJQIFzHgLkNvOf7rpVH5WUXLT6A7M5OH
         n2OEkL2553ePVGiNHo3qTxQMHY2jE/d+ZCInKjt6xGzFbh0r1/qu0iE1yfgUZlYo4beC
         u5UEGINOpMWQ483weUFN42n9nKKkYRBiebE6zj0/VugT6ccqqeSb2oGHIIdwY4ybVn2C
         z/Qzt3X1xipOeTUJL1JPmYYY1A2k62QwknnugIQLcUbxnJi+0xarktFbRw3vPHN7H8nx
         bu+A==
X-Gm-Message-State: AOJu0Yy68/y00eDlBdjRWkZyw3dLReS6NlS+6ZmkLxnz6Gn2dkGtKM9k
	JR3XFIL1mASXqlJW1OEFjALGZrE4a9mwW3hharoLXvwVtsi/V8FknyoBdQ==
X-Google-Smtp-Source: AGHT+IGXxoKvArJVBsQyH2pZkMEg2vE/si8caQnQmfTBMQJb51y9oqRPoVm78eXmJhtIKnpnwn+hhg==
X-Received: by 2002:a05:6512:2351:b0:513:ec32:aa81 with SMTP id p17-20020a056512235100b00513ec32aa81mr12526419lfu.13.1713348311884;
        Wed, 17 Apr 2024 03:05:11 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 06/17] xen/riscv: introduce cmpxchg.h
Date: Wed, 17 Apr 2024 12:04:49 +0200
Message-ID: <6e068a2531f3ecbb7858739ecb5249d22ee01fff.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
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
    ...
atomic <op>             amo<op>.{w|d}.aqrl
Linux Construct         RVWMO LR/SC Mapping
    ...
atomic <op>             loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez loop

Table A.5: Mappings from Linux memory primitives to RISC-V primitives

```

The current implementation is the same with 8e86f0b409a4
("arm64: atomics: fix use of acquire + release for full barrier
semantics") [1].
RISC-V could combine acquire and release into the SC
instructions and it could reduce a fence instruction to gain better
performance. Here is related description from RISC-V ISA 10.2
Load-Reserved/Store-Conditional Instructions:

 - .aq:   The LR/SC sequence can be given acquire semantics by
          setting the aq bit on the LR instruction.
 - .rl:   The LR/SC sequence can be given release semantics by
          setting the rl bit on the SC instruction.
 - .aqrl: Setting the aq bit on the LR instruction, and setting
          both the aq and the rl bit on the SC instruction makes
          the LR/SC sequence sequentially consistent, meaning that
          it cannot be reordered with earlier or later memory
          operations from the same hart.

 Software should not set the rl bit on an LR instruction unless
 the aq bit is also set, nor should software set the aq bit on an
 SC instruction unless the rl bit is also set. LR.rl and SC.aq
 instructions are not guaranteed to provide any stronger ordering
 than those with both bits clear, but may result in lower
 performance.

Also, I way of transforming ".rl + full barrier" to ".aqrl" was approved
by (the author of the RVWMO spec) [2]

[1] https://patchwork.kernel.org/project/linux-arm-kernel/patch/1391516953-14541-1-git-send-email-will.deacon@arm.com/
[2] https://lore.kernel.org/linux-riscv/41e01514-74ca-84f2-f5cc-2645c444fd8e@nvidia.com/

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V8:
 - use __bad_{xchg,cmpxch}(ptr,size) insetead of STATIC_ASSERT_UNREACHABLE() to
   make this patch be independent from the macros that haven't been committed yet
   and may never be.
---
Changes in V7:
 - replace __*() -> _*() in cmpxchg.h
 - add () around ptr in _amoswap_generic(), emulate_xchg_1_2()
 - fix typos
 - code style fixes.
 - refactor emulate_xcgh_1_2():
   - add parentheses for new argument.
   - use instead of constant 0x4 -> sizeof(*aligned_ptr).
   - add alignment_mask to save  sizeof(*aligned_ptr) - sizeof(*(ptr));
 - s/CONFIG_32BIT/CONFIG_RISCV_32
 - drop unnecessary parentheses in xchg()
 - drop register in _generic_cmpxchg()
 - refactor and update prototype of _generic_cmpxchg():
   add named operands, return value instead of passing ret as an argument, drop %z and J
   constraints for mask operand as it can't be zero
 - refactor and code style fixes in emulate_cmpxchg_1_2():
   - add explanatory comment for emulate_cmpxchg_1_2().
   - add parentheses for old and new arguments.
   - use instead of constant 0x4 -> sizeof(*aligned_ptr).
   - add alignment_mask to save  sizeof(*aligned_ptr) - sizeof(*(ptr));
 - drop unnessary parenthesses in cmpxchg().
 - update the commit message.
 - s/__asm__ __volatile__/asm volatile
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
 xen/arch/riscv/include/asm/cmpxchg.h | 237 +++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/config.h  |   2 +
 2 files changed, 239 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 0000000000..f7b53d3848
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
+#define _amoswap_generic(ptr, new, ret, sfx) \
+    asm volatile ( \
+        " amoswap" sfx " %0, %2, %1" \
+        : "=r" (ret), "+A" (*(ptr)) \
+        : "r" (new) \
+        : "memory" );
+
+/*
+ * For LR and SC, the A extension requires that the address held in rs1 be
+ * naturally aligned to the size of the operand (i.e., eight-byte aligned
+ * for 64-bit words and four-byte aligned for 32-bit words).
+ * If the address is not naturally aligned, an address-misaligned exception
+ * or an access-fault exception will be generated.
+ *
+ * Thereby:
+ * - for 1-byte xchg access the containing word by clearing low two bits.
+ * - for 2-byte xchg access the containing word by clearing bit 1.
+ *
+ * If resulting 4-byte access is still misalgined, it will fault just as
+ * non-emulated 4-byte access would.
+ */
+#define emulate_xchg_1_2(ptr, new, lr_sfx, sc_sfx) \
+({ \
+    uint32_t *aligned_ptr; \
+    unsigned long alignment_mask = sizeof(*aligned_ptr) - sizeof(*(ptr)); \
+    unsigned int new_val_bit = \
+        ((unsigned long)(ptr) & alignment_mask) * BITS_PER_BYTE; \
+    unsigned long mask = \
+        GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0) << new_val_bit; \
+    unsigned int new_ = (new) << new_val_bit; \
+    unsigned int old; \
+    unsigned int scratch; \
+    \
+    aligned_ptr = (uint32_t *)((unsigned long)(ptr) & ~alignment_mask); \
+    \
+    asm volatile ( \
+        "0: lr.w" lr_sfx " %[old], %[ptr_]\n" \
+        "   andn  %[scratch], %[old], %[mask]\n" \
+        "   or   %[scratch], %[scratch], %z[new_]\n" \
+        "   sc.w" sc_sfx " %[scratch], %[scratch], %[ptr_]\n" \
+        "   bnez %[scratch], 0b\n" \
+        : [old] "=&r" (old), [scratch] "=&r" (scratch), \
+          [ptr_] "+A" (*aligned_ptr) \
+        : [new_] "rJ" (new_), [mask] "r" (mask) \
+        : "memory" ); \
+    \
+    (__typeof__(*(ptr)))((old & mask) >> new_val_bit); \
+})
+
+/*
+ * This function doesn't exist, so you'll get a linker error
+ * if something tries to do an invalid xchg().
+ */
+extern void __bad_xchg(volatile void *ptr, int size);
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
+        _amoswap_generic((volatile uint32_t *)ptr, new, ret, ".w.aqrl");
+        break;
+#ifndef CONFIG_RISCV_32
+    case 8:
+        _amoswap_generic((volatile uint64_t *)ptr, new, ret, ".d.aqrl");
+        break;
+#endif
+    default:
+        __bad_xchg(ptr, size), ret = 0;
+    }
+
+    return ret;
+}
+
+#define xchg(ptr, x) \
+({ \
+    __typeof__(*(ptr)) n_ = (x); \
+    (__typeof__(*(ptr))) \
+        __xchg((ptr), (unsigned long)n_, sizeof(*(ptr))); \
+})
+
+#define _generic_cmpxchg(ptr, old, new, lr_sfx, sc_sfx) \
+ ({ \
+    unsigned int rc; \
+    unsigned long ret; \
+    unsigned long mask = GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0); \
+    asm volatile ( \
+        "0: lr" lr_sfx " %[ret], %[ptr_]\n" \
+        "   and  %[ret], %[ret], %[mask]\n" \
+        "   bne  %[ret], %z[old_], 1f\n" \
+        "   sc" sc_sfx " %[rc], %z[new_], %[ptr_]\n" \
+        "   bnez %[rc], 0b\n" \
+        "1:\n" \
+        : [ret] "=&r" (ret), [rc] "=&r" (rc), [ptr_] "+A" (*ptr) \
+        : [old_] "rJ" (old), [new_] "rJ" (new), [mask] "r" (mask)  \
+        : "memory" ); \
+    ret; \
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
+    uint32_t *aligned_ptr; \
+    unsigned long alignment_mask = sizeof(*aligned_ptr) - sizeof(*(ptr)); \
+    uint8_t new_val_bit = \
+        ((unsigned long)(ptr) & alignment_mask) * BITS_PER_BYTE; \
+    unsigned long mask = \
+        GENMASK(((sizeof(*(ptr))) * BITS_PER_BYTE) - 1, 0) << new_val_bit; \
+    unsigned int old_ = (old) << new_val_bit; \
+    unsigned int new_ = (new) << new_val_bit; \
+    unsigned int old_val; \
+    unsigned int scratch; \
+    \
+    aligned_ptr = (uint32_t *)((unsigned long)ptr & ~alignment_mask); \
+    \
+    asm volatile ( \
+        "0: lr.w" lr_sfx " %[scratch], %[ptr_]\n" \
+        "   and  %[old_val], %[scratch], %[mask]\n" \
+        "   bne  %[old_val], %z[old_], 1f\n" \
+        /* the following line is an equivalent to: \
+         *     scratch = old_val & ~mask; \
+         * And to elimanate one ( likely register ) input it was decided \
+         * to use: \
+         *     scratch = old_val ^ scratch \
+         */ \
+        "   xor  %[scratch], %[old_val], %[scratch]\n" \
+        "   or   %[scratch], %[scratch], %z[new_]\n" \
+        "   sc.w" sc_sfx " %[scratch], %[scratch], %[ptr_]\n" \
+        "   bnez %[scratch], 0b\n" \
+        "1:\n" \
+        : [old_val] "=&r" (old_val), [scratch] "=&r" (scratch), \
+          [ptr_] "+A" (*aligned_ptr) \
+        : [old_] "rJ" (old_), [new_] "rJ" (new_), \
+          [mask] "r" (mask) \
+        : "memory" ); \
+    \
+    (__typeof__(*(ptr)))((unsigned long)old_val >> new_val_bit); \
+})
+
+/* This function doesn't exist, so you'll get a linker error
+   if something tries to do an invalid cmpxchg().  */
+extern unsigned long __bad_cmpxchg(volatile void *ptr, int size);
+
+/*
+ * Atomic compare and exchange.  Compare OLD with MEM, if identical,
+ * store NEW in MEM.  Return the initial value in MEM.  Success is
+ * indicated by comparing RETURN with OLD.
+ */
+static always_inline unsigned long __cmpxchg(volatile void *ptr,
+                                             unsigned long old,
+                                             unsigned long new,
+                                             int size)
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
+        ret = _generic_cmpxchg((volatile uint32_t *)ptr, old, new,
+                          ".w.aq", ".w.aqrl");
+        break;
+#ifndef CONFIG_32BIT
+    case 8:
+        ret = _generic_cmpxchg((volatile uint64_t *)ptr, old, new,
+                           ".d.aq", ".d.aqrl");
+        break;
+#endif
+    default:
+        return __bad_cmpxchg(ptr, size);
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
+    __cmpxchg((ptr), (unsigned long)o_, (unsigned long)n_, \
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
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index c5f93e6a01..50583aafdc 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -119,6 +119,8 @@
 
 #define BITS_PER_LLONG 64
 
+#define BITS_PER_BYTE 8
+
 /* xen_ulong_t is always 64 bits */
 #define BITS_PER_XEN_ULONG 64
 
-- 
2.44.0


