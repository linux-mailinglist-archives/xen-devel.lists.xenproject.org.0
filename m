Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDBA896C03
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700399.1093518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjJ-0000qS-2l; Wed, 03 Apr 2024 10:20:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700399.1093518; Wed, 03 Apr 2024 10:20:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjI-0000mS-TJ; Wed, 03 Apr 2024 10:20:28 +0000
Received: by outflank-mailman (input) for mailman id 700399;
 Wed, 03 Apr 2024 10:20:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjG-0007Ob-TV
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:26 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c917b113-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:25 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-515b43b39fdso688499e87.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:25 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:23 -0700 (PDT)
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
X-Inumbo-ID: c917b113-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139624; x=1712744424; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hf2lo1oLaP0G7F2E7pKpUjQOuukp+kvUPmq6qeGN1Gs=;
        b=PLykraHvgNJbfbQbpKajlZpfQjVKXUkJezpUBSKagAusRSanSk0GLcqlWbVGJqhr4z
         s6c0onL9oi10y3uk2EICMcQh/E811UGJpMOHV1JcdxJT+NM/axirFYg/UO2a2LdqGBWz
         MtA7dYK7qgSQbXA4hRGdfCUApw/w78G2qmv1dUfoVX3JzAkDfaTtbfxyirP96CfYB+mm
         89uDq1ybz8Z84hiVBxlJRxEru/0WEkocP9xCox//UlGWBBF39vXtXTqANYAjDg1BZjg1
         IczLxdPwXc54ITbfgIhXeRmLeaLR9UGm/YrQvFQSomScFZKiMu6u8aPhQk0v7UXADxna
         982g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139624; x=1712744424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hf2lo1oLaP0G7F2E7pKpUjQOuukp+kvUPmq6qeGN1Gs=;
        b=pu3LMHuE3IfSSV+l5vuUKDVfJ3NYWTQ8SotIpPPtz9KwFhQLiYMTxZWFrdNjGS9C0s
         tCu8Kugtiv19d3tsh9+wIsnfTtBYZWUn1fxx0SbbZyqu43Fi0auZdcWjSzryF0v4BfiF
         jUzHjjJpPgr5pwTTxkiyOhk1yzfVWUwp/JJqXB42NJgMFVUakRaKRXoQkS9UHM038dFN
         8H5JJkacfqs1+I5vBQwByXNaSGnicaXdjQ4z06jhzeDODWmLw5ub/q/+2gwreJNNOw0W
         EXEPo2NnnabKSmxjMI6KAqVO1ec9+uhDl2ONwynkW7F+XPiZbhNJw8wtSxY/ecUdJhJT
         Ehtw==
X-Gm-Message-State: AOJu0YwFxMJLrW7iB4PZ/wm8STJRrwX99wlRPjow8WVyomm2nUwz41pP
	DjF9Ca0XAW18o3csobjQ+TbdFHhL3iMkQFKkzG8nPyeenrXWwBsYzCZ8aIs+
X-Google-Smtp-Source: AGHT+IH4bg1txYQJMVNseVJ2kSMF/ivLg2sB8ZFTK0j2GsWYsuqwJV7Kv4HcGxzX7oiL1czSjqkojA==
X-Received: by 2002:a05:6512:20a:b0:515:89cc:26ab with SMTP id a10-20020a056512020a00b0051589cc26abmr847886lfo.9.1712139624428;
        Wed, 03 Apr 2024 03:20:24 -0700 (PDT)
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
Subject: [PATCH v7 07/19] xen/riscv: introduce bitops.h
Date: Wed,  3 Apr 2024 12:20:00 +0200
Message-ID: <3d8a46946a37ca499e962aa6504fa453326e5ad0.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
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
  * linux/include/asm-generic/bitops/generic-non-atomic.h with the
    following changes:
     * Only functions that can be reused in Xen were left;
       others were removed.
     * it was updated the message inside #ifndef ... #endif.
     * __always_inline -> always_inline to be align with definition in
       xen/compiler.h.
     * convert identations from tabs to spaces.
     * inside generic__test_and_* use 'bitops_uint_t' instead of 'unsigned long'
        to be generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/bitops.h | 146 ++++++++++++++++++++++++++++
 1 file changed, 146 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..6f0212e5ac
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,146 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2012 Regents of the University of California */
+
+#ifndef _ASM_RISCV_BITOPS_H
+#define _ASM_RISCV_BITOPS_H
+
+#include <asm/system.h>
+
+#undef BITOP_BITS_PER_WORD
+#undef bitop_uint_t
+
+#define BITOP_BITS_PER_WORD BITS_PER_LONG
+#define bitop_uint_t unsigned long
+
+#if BITS_PER_LONG == 64
+#define __AMO(op)   "amo" #op ".d"
+#elif BITS_PER_LONG == 32
+#define __AMO(op)   "amo" #op ".w"
+#else
+#error "Unexpected BITS_PER_LONG"
+#endif
+
+#define __set_bit(n, p)      set_bit(n, p)
+#define __clear_bit(n, p)    clear_bit(n, p)
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
+/* Based on linux/arch/include/asm/bitops.h */
+
+#define test_and_op_bit_ord(op, mod, nr, addr, ord)     \
+({                                                      \
+    unsigned long res, mask;                            \
+    mask = BITOP_MASK(nr);                              \
+    asm volatile (                                       \
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
+static inline int test_and_set_bit(int nr, volatile void *p)
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
+static inline int test_and_clear_bit(int nr, volatile void *p)
+{
+    volatile bitop_uint_t *addr = p;
+
+    return test_and_op_bit(and, NOT, nr, addr);
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
+/**
+ * test_and_change_bit - Toggle (change) a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This operation is atomic and cannot be reordered.
+ * It also implies a memory barrier.
+ */
+static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
+{
+	return test_and_op_bit(xor, NOP, nr, addr);
+}
+
+#undef test_and_op_bit
+#undef __op_bit
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
2.43.0


