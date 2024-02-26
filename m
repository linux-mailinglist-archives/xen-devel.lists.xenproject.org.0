Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE4867ED9
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685701.1066914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewq-0002JQ-RY; Mon, 26 Feb 2024 17:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685701.1066914; Mon, 26 Feb 2024 17:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewq-00025R-C4; Mon, 26 Feb 2024 17:39:28 +0000
Received: by outflank-mailman (input) for mailman id 685701;
 Mon, 26 Feb 2024 17:39:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewo-0007pd-3E
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:26 +0000
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [2a00:1450:4864:20::22c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fbbcd017-d4cd-11ee-8a58-1f161083a0e0;
 Mon, 26 Feb 2024 18:39:25 +0100 (CET)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2d2533089f6so40294501fa.1
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:25 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:23 -0800 (PST)
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
X-Inumbo-ID: fbbcd017-d4cd-11ee-8a58-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969164; x=1709573964; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBB2G5OMKwNGN2xc04uv75wIpktlEVDQCB1awKCqGdw=;
        b=KxPibwD2dcRoZjXQrh2NrCmabM/HpeYTICUS9iwKOB4y08pjHu9/nt9/VlLfrTNv4s
         N1jVkPLOQS58fYRcg0sX7M4GqnWmKMaqBln2TLJCXBNTrYg2NTRvNllG5MIPHGWbphj/
         jhDOqXKlWEdBjMmmi/RIF/g9bTDufyWm/xV+avTwTVD/w+nh5dG2sUHrAgBQiNyqoHTp
         2gZJm6Z0fRoY6EI5xSFgAFzex/L4CyxyrxRk+Ch5REOtfnhKn0Rw/Vm4pE14RfuOffk6
         SFIca4mEKGzTbdBlDRy/pBwT/qxG62RyQ+AsC27uLVdd9/RI48E2COBdRlpDSbCS8d7X
         jfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969164; x=1709573964;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBB2G5OMKwNGN2xc04uv75wIpktlEVDQCB1awKCqGdw=;
        b=vFBiFAlRdopVu+q4eeH08543NsNmB/IJ/hj9N2VCeORhuEzlWl7sEI5B7HQJsOmHww
         0SyXZA5RGsduvdzs/ZgADA+qk+L/m+lHWYgWFpmvNcqMDzFR22z905koz9QOpGZGLRH/
         kUyoVHgPtEaNWeZzVsC/reTGlHaH1rvNWu5uxv/8w4E+tby043Gh3+hLPR1bVwxdtxS0
         ue/vBICEU21zkSAOrNoyr3g3uiZNDp+HIy0Eu2TWCjAT79EYuCwBXZwoumIu7TgKT9ef
         yzoA+y/7MWJOCPzC+Iovli9+ZIOrgHH4ut1EHmE+lJwxqNXNnn2BSkyl04h3V1LY5OyV
         8sRA==
X-Gm-Message-State: AOJu0YyDvHHTckgcotKNGMbqvZduBuzfxysU3elAB6UkQQsT0xg/19c7
	ULoTVi2NYJkE8xS3dU2/enBOnhJI1vrMtMrct6hDSP4/deWY4iH/3EA+Rna4
X-Google-Smtp-Source: AGHT+IFyJAoWwLlzN+kV/Q01rxcp40BP1AB0+Ii2OKw476b0K0hDY+zjP1cUaMgvDNkhXRX/cLndWQ==
X-Received: by 2002:a2e:a23c:0:b0:2d2:91ef:51c8 with SMTP id i28-20020a2ea23c000000b002d291ef51c8mr709339ljm.47.1708969164004;
        Mon, 26 Feb 2024 09:39:24 -0800 (PST)
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
Subject: [PATCH v5 11/23] xen/riscv: introduce cmpxchg.h
Date: Mon, 26 Feb 2024 18:38:53 +0100
Message-ID: <ce7604de39b3480553eeaeafc11138494016983f.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
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

Implementation of 4- and 8-byte cases were left as it is done in
Linux kernel as according to the RISC-V spec:
```
Table A.5 ( only part of the table was copied here )

Linux Construct       RVWMO Mapping
atomic <op> relaxed    amo<op>.{w|d}
atomic <op> acquire    amo<op>.{w|d}.aq
atomic <op> release    amo<op>.{w|d}.rl
atomic <op>            amo<op>.{w|d}.aqrl

Linux Construct       RVWMO LR/SC Mapping
atomic <op> relaxed    loop: lr.{w|d}; <op>; sc.{w|d}; bnez loop
atomic <op> acquire    loop: lr.{w|d}.aq; <op>; sc.{w|d}; bnez loop
atomic <op> release    loop: lr.{w|d}; <op>; sc.{w|d}.aqrl∗ ; bnez loop OR
                       fence.tso; loop: lr.{w|d}; <op>; sc.{w|d}∗ ; bnez loop
atomic <op>            loop: lr.{w|d}.aq; <op>; sc.{w|d}.aqrl; bnez loop

The Linux mappings for release operations may seem stronger than necessary,
but these mappings are needed to cover some cases in which Linux requires
stronger orderings than the more intuitive mappings would provide.
In particular, as of the time this text is being written, Linux is actively
debating whether to require load-load, load-store, and store-store orderings
between accesses in one critical section and accesses in a subsequent critical
section in the same hart and protected by the same synchronization object.
Not all combinations of FENCE RW,W/FENCE R,RW mappings with aq/rl mappings
combine to provide such orderings.
There are a few ways around this problem, including:
1. Always use FENCE RW,W/FENCE R,RW, and never use aq/rl. This suffices
   but is undesirable, as it defeats the purpose of the aq/rl modifiers.
2. Always use aq/rl, and never use FENCE RW,W/FENCE R,RW. This does not
   currently work due to the lack of load and store opcodes with aq and rl
   modifiers.
3. Strengthen the mappings of release operations such that they would
   enforce sufficient orderings in the presence of either type of acquire mapping.
   This is the currently-recommended solution, and the one shown in Table A.5.
```

But in Linux kenrel atomics were strengthen with fences:
```
Atomics present the same issue with locking: release and acquire
variants need to be strengthened to meet the constraints defined
by the Linux-kernel memory consistency model [1].

Atomics present a further issue: implementations of atomics such
as atomic_cmpxchg() and atomic_add_unless() rely on LR/SC pairs,
which do not give full-ordering with .aqrl; for example, current
implementations allow the "lr-sc-aqrl-pair-vs-full-barrier" test
below to end up with the state indicated in the "exists" clause.

In order to "synchronize" LKMM and RISC-V's implementation, this
commit strengthens the implementations of the atomics operations
by replacing .rl and .aq with the use of ("lightweigth") fences,
and by replacing .aqrl LR/SC pairs in sequences such as:

0:      lr.w.aqrl  %0, %addr
        bne        %0, %old, 1f
        ...
        sc.w.aqrl  %1, %new, %addr
        bnez       %1, 0b
1:

with sequences of the form:

0:      lr.w       %0, %addr
        bne        %0, %old, 1f
              ...
        sc.w.rl    %1, %new, %addr   /* SC-release   */
        bnez       %1, 0b
        fence      rw, rw            /* "full" fence */
1:

following Daniel's suggestion.

These modifications were validated with simulation of the RISC-V
memory consistency model.

C lr-sc-aqrl-pair-vs-full-barrier

{}

P0(int *x, int *y, atomic_t *u)
{
        int r0;
        int r1;

        WRITE_ONCE(*x, 1);
        r0 = atomic_cmpxchg(u, 0, 1);
        r1 = READ_ONCE(*y);
}

P1(int *x, int *y, atomic_t *v)
{
        int r0;
        int r1;

        WRITE_ONCE(*y, 1);
        r0 = atomic_cmpxchg(v, 0, 1);
        r1 = READ_ONCE(*x);
}

exists (u=1 /\ v=1 /\ 0:r1=0 /\ 1:r1=0)

[1] https://marc.info/?l=linux-kernel&m=151930201102853&w=2
https://groups.google.com/a/groups.riscv.org/forum/#!topic/isa-dev/hKywNHBkAXM
https://marc.info/?l=linux-kernel&m=151633436614259&w=2
```

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
   - drop local ptr__ variable.
   - code style fixes around switch()
   - update prototype.
 - introduce RISCV_FULL_BARRIES.
 - redefine cmpxchg()
 - update emulate_cmpxchg_1_2():
   - update prototype
   - update local variables names and usage of them
   - use name asm operands.
   - add comment above the macros
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
 xen/arch/riscv/include/asm/cmpxchg.h | 258 +++++++++++++++++++++++++++
 1 file changed, 258 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cmpxchg.h

diff --git a/xen/arch/riscv/include/asm/cmpxchg.h b/xen/arch/riscv/include/asm/cmpxchg.h
new file mode 100644
index 0000000000..66cbe26737
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cmpxchg.h
@@ -0,0 +1,258 @@
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
+#define __amoswap_generic(ptr, new, ret, sfx, pre, post) \
+({ \
+    asm volatile( \
+        pre \
+        " amoswap" sfx " %0, %2, %1\n" \
+        post \
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
+ * - for 2-byte xchg ccess the containing word by clearing first bit.
+ * 
+ * If resulting 4-byte access is still misalgined, it will fault just as
+ * non-emulated 4-byte access would.
+ */
+#define emulate_xchg_1_2(ptr, new, sc_sfx, pre, post) \
+({ \
+    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr & ~(0x4 - sizeof(*ptr))); \
+    uint8_t new_val_pos = ((unsigned long)(ptr) & (0x4 - sizeof(*ptr))) * BITS_PER_BYTE; \
+    unsigned long mask = GENMASK(((sizeof(*ptr)) * BITS_PER_BYTE) - 1, 0) << new_val_pos; \
+    unsigned int new_ = new << new_val_pos; \
+    unsigned int old_val; \
+    unsigned int xchged_val; \
+    \
+    asm volatile ( \
+        pre \
+        "0: lr.w %[op_oldval], %[op_aligned_ptr]\n" \
+        "   and  %[op_xchged_val], %[op_oldval], %z[op_nmask]\n" \
+        "   or   %[op_xchged_val], %[op_xchged_val], %z[op_new]\n" \
+        "   sc.w" sc_sfx " %[op_xchged_val], %[op_xchged_val], %[op_aligned_ptr]\n" \
+        "   bnez %[op_xchged_val], 0b\n" \
+        post \
+        : [op_oldval] "=&r" (old_val), [op_xchged_val] "=&r" (xchged_val), [op_aligned_ptr]"+A" (*aligned_ptr) \
+        : [op_new] "rJ" (new_), [op_nmask] "rJ" (~mask) \
+        : "memory" ); \
+    \
+    (__typeof__(*(ptr)))((old_val & mask) >> new_val_pos); \
+})
+
+#define __xchg_generic(ptr, new, size, sfx, pre, post) \
+({ \
+    __typeof__(*(ptr)) new__ = (new); \
+    __typeof__(*(ptr)) ret__; \
+    switch ( size ) \
+    { \
+    case 1: \
+    case 2: \
+        ret__ = emulate_xchg_1_2(ptr, new__, sfx, pre, post); \
+        break; \
+    case 4: \
+        __amoswap_generic(ptr, new__, ret__,\
+                          ".w" sfx,  pre, post); \
+        break; \
+    case 8: \
+        __amoswap_generic(ptr, new__, ret__,\
+                          ".d" sfx,  pre, post); \
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
+#define xchg(ptr, x) __xchg_generic(ptr, (unsigned long)(x), sizeof(*(ptr)), \
+                                    ".aqrl", "", "")
+
+#define __generic_cmpxchg(ptr, old, new, ret, lr_sfx, sc_sfx, pre, post)	\
+ ({ \
+    register unsigned int rc; \
+    asm volatile( \
+        pre \
+        "0: lr" lr_sfx " %0, %2\n" \
+        "   bne  %0, %z3, 1f\n" \
+        "   sc" sc_sfx " %1, %z4, %2\n" \
+        "   bnez %1, 0b\n" \
+        post \
+        "1:\n" \
+        : "=&r" (ret), "=&r" (rc), "+A" (*ptr) \
+        : "rJ" (old), "rJ" (new) \
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
+ * old_val was casted to unsigned long at the end of the define because of
+ * the following issue:
+ * ./arch/riscv/include/asm/cmpxchg.h:166:5: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
+ * 166 |     (__typeof__(*(ptr)))(old_val >> new_val_pos); \
+ *     |     ^
+ * ./arch/riscv/include/asm/cmpxchg.h:184:17: note: in expansion of macro 'emulate_cmpxchg_1_2'
+ * 184 |         ret__ = emulate_cmpxchg_1_2(ptr, old, new, \
+ *     |                 ^~~~~~~~~~~~~~~~~~~
+ * ./arch/riscv/include/asm/cmpxchg.h:227:5: note: in expansion of macro '__cmpxchg_generic'
+ * 227 |     __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
+ *     |     ^~~~~~~~~~~~~~~~~
+ * ./include/xen/lib.h:141:26: note: in expansion of macro '__cmpxchg'
+ * 141 |     ((__typeof__(*(ptr)))__cmpxchg(ptr, (unsigned long)o_,              \
+ *     |                          ^~~~~~~~~
+ * common/event_channel.c:109:13: note: in expansion of macro 'cmpxchgptr'
+ * 109 |             cmpxchgptr(&xen_consumers[i], NULL, fn);
+ */
+#define emulate_cmpxchg_1_2(ptr, old, new, sc_sfx, pre, post) \
+({ \
+    uint32_t *aligned_ptr = (uint32_t *)((unsigned long)ptr & ~(0x4 - sizeof(*ptr))); \
+    uint8_t new_val_pos = ((unsigned long)(ptr) & (0x4 - sizeof(*ptr))) * BITS_PER_BYTE; \
+    unsigned long mask = GENMASK(((sizeof(*ptr)) * BITS_PER_BYTE) - 1, 0) << new_val_pos; \
+    unsigned int old_ = old << new_val_pos; \
+    unsigned int new_ = new << new_val_pos; \
+    unsigned int old_val; \
+    unsigned int xchged_val; \
+    \
+    __asm__ __volatile__ ( \
+        pre \
+        "0: lr.w %[op_xchged_val], %[op_aligned_ptr]\n" \
+        "   and  %[op_oldval], %[op_xchged_val], %z[op_mask]\n" \
+        "   bne  %[op_oldval], %z[op_old], 1f\n" \
+        "   xor  %[op_xchged_val], %[op_oldval], %[op_xchged_val]\n" \
+        "   or   %[op_xchged_val], %[op_xchged_val], %z[op_new]\n" \
+        "   sc.w" sc_sfx " %[op_xchged_val], %[op_xchged_val], %[op_aligned_ptr]\n" \
+        "   bnez %[op_xchged_val], 0b\n" \
+        post \
+        "1:\n" \
+        : [op_oldval] "=&r" (old_val), [op_xchged_val] "=&r" (xchged_val), [op_aligned_ptr] "+A" (*aligned_ptr) \
+        : [op_old] "rJ" (old_), [op_new] "rJ" (new_), \
+          [op_mask] "rJ" (mask) \
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
+#define __cmpxchg_generic(ptr, old, new, size, sc_sfx, pre, post) \
+({ \
+    __typeof__(ptr) ptr__ = (ptr); \
+    __typeof__(*(ptr)) old__ = (__typeof__(*(ptr)))(old); \
+    __typeof__(*(ptr)) new__ = (__typeof__(*(ptr)))(new); \
+    __typeof__(*(ptr)) ret__; \
+    switch ( size ) \
+    { \
+    case 1: \
+    case 2: \
+        ret__ = emulate_cmpxchg_1_2(ptr, old, new, \
+                            sc_sfx, pre, post); \
+        break; \
+    case 4: \
+        __generic_cmpxchg(ptr__, old__, new__, ret__, \
+                          ".w", ".w"sc_sfx, pre, post); \
+        break; \
+    case 8: \
+        __generic_cmpxchg(ptr__, old__, new__, ret__, \
+                          ".d", ".d"sc_sfx, pre, post); \
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
+#define __cmpxchg(ptr, o, n, s) \
+    (__typeof__(*(ptr))) \
+    __cmpxchg_generic(ptr, (unsigned long)(o), (unsigned long)(n), \
+                      s, ".rl", "", RISCV_FULL_BARRIER)
+
+#define cmpxchg(ptr, o, n) __cmpxchg(ptr, o, n, sizeof(*(ptr)))
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

