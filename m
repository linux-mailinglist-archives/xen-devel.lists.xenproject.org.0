Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B0E8C8790
	for <lists+xen-devel@lfdr.de>; Fri, 17 May 2024 15:55:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.724182.1129392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3H-0002co-Js; Fri, 17 May 2024 13:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 724182.1129392; Fri, 17 May 2024 13:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7y3H-0002W6-Cn; Fri, 17 May 2024 13:55:15 +0000
Received: by outflank-mailman (input) for mailman id 724182;
 Fri, 17 May 2024 13:55:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3Ubw=MU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s7y3F-0001sq-I5
 for xen-devel@lists.xenproject.org; Fri, 17 May 2024 13:55:13 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1446885c-1455-11ef-b4bb-af5377834399;
 Fri, 17 May 2024 15:55:11 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a5a7d28555bso515547366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 May 2024 06:55:11 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c81b4sm1117456466b.113.2024.05.17.06.55.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 May 2024 06:55:10 -0700 (PDT)
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
X-Inumbo-ID: 1446885c-1455-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715954111; x=1716558911; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rh5FFSQR5hpsEecLRvPLMcmIow3q1eeW4spmciqITUA=;
        b=WuH1E1AVcmpm4+HGJdGSdthduKLfXQaLF8vD9WS5KOivUz+vrykhe10hzVQqjUj+mI
         7PJFIQt52JWr0knOhzuhKBF6iXHSnsRP46X2tJxd+e+M4EHaQAw3L30cB+xjE+867qkB
         3gESwMBqmNEwcZmOdeDG3e3m1Mzz1tPuifzG29uP0hEub9O1/QX626coZ+fX1ObK1iRs
         0j+RA1wxE6FlEs5c1vx9FEg0/0f9f1iedarDxzLSl236Fz/fTdJBnxqEpSO2vkw2L0CI
         kkUFFsrKvvXXhDSz5KuhFDrRjc2POah/MHRCjf2R/557lD742tGS6N/Xlc3Fs5BJ72nV
         V+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715954111; x=1716558911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rh5FFSQR5hpsEecLRvPLMcmIow3q1eeW4spmciqITUA=;
        b=dQAoMmE57PZPgpvf3Hmv6Ba5bfb3EmGvOhoTmum8EyJGNx1ifXu6haVuCuvWAvfQD6
         +I64uA6+7zNbWzzqPCeHCr195exJcVATqTqkRnImxymy7oumrs6KaOHfj6vsZYCZ0hml
         7xn4XxTSSkoMO2OkAFh7ALiJ4DZaLsSs53I2R8rkS/Zbm01MHdtAdv7KZCXcv4ushpLe
         tmF0zmMWuWAm/5EDJXSIpfxtx5YML+r7mCCbh1wPhC/xZkb9xjZgOiNCs4/ZHsaTYlUx
         EU7/Jl0VhTqlb5eeWXxndQeoqF6vd8Leg3jha7oW3U+ycwl3SaZSEBhowPWezgUg2R2j
         VJpA==
X-Gm-Message-State: AOJu0YxIImeu8ZpZ1E2ix+Lim1vSjtYY9RdWe9v6yO2UCSqyccCsnuyG
	JhzUwCMjy2uIYNslkcJSWTQxSlwQWfz72NFG0GsP0+KQdf2niLtljw5o58Ag
X-Google-Smtp-Source: AGHT+IHNjIsZ33hbP/mwv+OD1FCavU7oLCFaO/9euqPJVY8ZS5AUcTgBa4Fspvr4AA9k9Tle0yAsUA==
X-Received: by 2002:a17:906:17c5:b0:a5a:1b57:426f with SMTP id a640c23a62f3a-a5a2d54c10fmr1418274466b.13.1715954111026;
        Fri, 17 May 2024 06:55:11 -0700 (PDT)
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
Subject: [PATCH v10 04/14] xen/riscv: introduce bitops.h
Date: Fri, 17 May 2024 15:54:53 +0200
Message-ID: <91a359cb03c150ca01b52bfcab696612a847d283.1715952103.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1715952103.git.oleksii.kurochko@gmail.com>
References: <cover.1715952103.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Taken from Linux-6.4.0-rc1

Xen's bitops.h consists of several Linux's headers:
* linux/arch/include/asm/bitops.h:
  * The following function were removed as they aren't used in Xen:
        * test_and_set_bit_lock
        * clear_bit_unlock
        * __clear_bit_unlock
  * The following functions were renamed in the way how they are
    used by common code:
        * __test_and_set_bit
        * __test_and_clear_bit
  * The declaration and implementation of the following functios
    were updated to make Xen build happy:
        * clear_bit
        * set_bit
        * __test_and_clear_bit
        * __test_and_set_bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V10:
 - update the error message BITS_PER_LONG -> BITOP_BITS_PER_WORD
---
Changes in V9:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - drop redefinition of bitop_uint_t in asm/types.h as some operation in Xen common code expects
   to work with 32-bit quantities.
 - s/BITS_PER_LONG/BITOP_BITS_PER_WORD in asm/bitops.h around __AMO() macros.
---
Changes in V8:
 - define bitop_uint_t in <asm/types.h> after the changes in patch related to introduction of
   "introduce generic non-atomic test_*bit()".
 - drop duplicated __set_bit() and __clear_bit().
 - drop duplicated comment: /* Based on linux/arch/include/asm/bitops.h */.
 - update type of res and mask in test_and_op_bit_ord(): unsigned long -> bitop_uint_t.
 - drop 1 padding blank in test_and_op_bit_ord().
 - update definition of test_and_set_bit(),test_and_clear_bit(),test_and_change_bit:
   change return type to bool.
 - change addr argument type of test_and_change_bit(): unsigned long * -> void *.
 - move test_and_change_bit() closer to other test_and-s function.
 - Code style fixes: tabs -> space.
 - s/#undef __op_bit/#undef op_bit.
 - update the commit message: delete information about generic-non-atomic.h changes as now
   it is a separate patch.
---
Changes in V7:
 - Update the commit message.
 - Drop "__" for __op_bit and __op_bit_ord as they are atomic.
 - add comment above __set_bit and __clear_bit about why they are defined as atomic.
 - align bitops_uint_t with __AMO().
 - make changes after  generic non-atomic test_*bit() were changed.
 - s/__asm__ __volatile__/asm volatile
---
Changes in V6:
 - rebase clean ups were done: drop unused asm-generic includes
---
 Changes in V5:
   - new patch
---
 xen/arch/riscv/include/asm/bitops.h | 137 ++++++++++++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..7f7af3fda1
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2012 Regents of the University of California */
+
+#ifndef _ASM_RISCV_BITOPS_H
+#define _ASM_RISCV_BITOPS_H
+
+#include <asm/system.h>
+
+#if BITOP_BITS_PER_WORD == 64
+#define __AMO(op)   "amo" #op ".d"
+#elif BITOP_BITS_PER_WORD == 32
+#define __AMO(op)   "amo" #op ".w"
+#else
+#error "Unexpected BITOP_BITS_PER_WORD"
+#endif
+
+/* Based on linux/arch/include/asm/bitops.h */
+
+/*
+ * Non-atomic bit manipulation.
+ *
+ * Implemented using atomics to be interrupt safe. Could alternatively
+ * implement with local interrupt masking.
+ */
+#define __set_bit(n, p)      set_bit(n, p)
+#define __clear_bit(n, p)    clear_bit(n, p)
+
+#define test_and_op_bit_ord(op, mod, nr, addr, ord)     \
+({                                                      \
+    bitop_uint_t res, mask;                             \
+    mask = BITOP_MASK(nr);                              \
+    asm volatile (                                      \
+        __AMO(op) #ord " %0, %2, %1"                    \
+        : "=r" (res), "+A" (addr[BITOP_WORD(nr)])       \
+        : "r" (mod(mask))                               \
+        : "memory");                                    \
+    ((res & mask) != 0);                                \
+})
+
+#define op_bit_ord(op, mod, nr, addr, ord)      \
+    asm volatile (                              \
+        __AMO(op) #ord " zero, %1, %0"          \
+        : "+A" (addr[BITOP_WORD(nr)])           \
+        : "r" (mod(BITOP_MASK(nr)))             \
+        : "memory");
+
+#define test_and_op_bit(op, mod, nr, addr)    \
+    test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
+#define op_bit(op, mod, nr, addr) \
+    op_bit_ord(op, mod, nr, addr, )
+
+/* Bitmask modifiers */
+#define NOP(x)    (x)
+#define NOT(x)    (~(x))
+
+/**
+ * test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ */
+static inline bool test_and_set_bit(int nr, volatile void *p)
+{
+    volatile bitop_uint_t *addr = p;
+
+    return test_and_op_bit(or, NOP, nr, addr);
+}
+
+/**
+ * test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ */
+static inline bool test_and_clear_bit(int nr, volatile void *p)
+{
+    volatile bitop_uint_t *addr = p;
+
+    return test_and_op_bit(and, NOT, nr, addr);
+}
+
+/**
+ * test_and_change_bit - Toggle (change) a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This operation is atomic and cannot be reordered.
+ * It also implies a memory barrier.
+ */
+static inline bool test_and_change_bit(int nr, volatile void *p)
+{
+    volatile bitop_uint_t *addr = p;
+
+    return test_and_op_bit(xor, NOP, nr, addr);
+}
+
+/**
+ * set_bit - Atomically set a bit in memory
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * Note that @nr may be almost arbitrarily large; this function is not
+ * restricted to acting on a single-word quantity.
+ */
+static inline void set_bit(int nr, volatile void *p)
+{
+    volatile bitop_uint_t *addr = p;
+
+    op_bit(or, NOP, nr, addr);
+}
+
+/**
+ * clear_bit - Clears a bit in memory
+ * @nr: Bit to clear
+ * @addr: Address to start counting from
+ */
+static inline void clear_bit(int nr, volatile void *p)
+{
+    volatile bitop_uint_t *addr = p;
+
+    op_bit(and, NOT, nr, addr);
+}
+
+#undef test_and_op_bit
+#undef op_bit
+#undef NOP
+#undef NOT
+#undef __AMO
+
+#endif /* _ASM_RISCV_BITOPS_H */
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
2.45.0


