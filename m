Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0479923BF3
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752282.1160471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGd-0000ok-8u; Tue, 02 Jul 2024 11:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752282.1160471; Tue, 02 Jul 2024 11:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObGd-0000ig-5j; Tue, 02 Jul 2024 11:01:47 +0000
Received: by outflank-mailman (input) for mailman id 752282;
 Tue, 02 Jul 2024 11:01:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObGc-0000Yf-80
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:01:46 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 780f8084-3862-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 13:01:44 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a724958f118so488316966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:01:44 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7516310768sm269306866b.218.2024.07.02.04.01.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:01:42 -0700 (PDT)
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
X-Inumbo-ID: 780f8084-3862-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719918103; x=1720522903; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=it/Xvn+hqYGMFo5+OSvi4mDaWEXL+/Hw4Puvwh6HQxs=;
        b=J80Cth1BQKohWZL2hBVxC7uPXf/1XdKNoLGz/W2tDTTZBzzlBzUyCcnaONqwa2sS3r
         QcHHVAqolPUhhn/Q4j2xdbh5Hufmd2yDpyTUylPn4xfnp7qd6fg+PiSFD4Rvmbb+LkE7
         bqOU3oag8cLkvotUAmsAhe3Q8RRDzHA+Kpf3ctDQAeUMD6RCnjgtUyOn0W2R3dkw2dit
         d8u18+TpjWpCcQQI50XTRgrE8Mep3EQW6/8V650NG5muuPJ/ONRx5+YGrAu62a3FNCiq
         2OdtQUhLcYyOAOziGj4vItbETgF2ZFEE3aoO9RGRpwOEITVlvzU6so2njAW3guSBwQSg
         Q2Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719918103; x=1720522903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=it/Xvn+hqYGMFo5+OSvi4mDaWEXL+/Hw4Puvwh6HQxs=;
        b=FeHhaTJZxuPfiPVSYthYcUMmXbt8Gaap6naVokrV9f9ZXdJ2Mnu3tSE4KI1DfXSoPL
         lpjoy9qpN3c1U7LPIx1IdZVMR+9L+rp2tBElDs/Ho59G8+9oy0s9+89xvySIeoO0hck6
         ZkuRJrh5MKuuL7HIq4py/fOP2HyNp201C/P+kPZqXVPcd6/zdwA78KdUHkutMvxfM1bl
         jqRc6VYgWh6Y7AcU59WD2RjEiBKFZukRDnjcfG9NuzpqlGo8lBBzh+77o9ywof0genJJ
         XzrZOFqByhLFmsuLktgCDueGE2vb0vxaTJxhyhh/bcvl2iah41/BDLqu3dyLPBP0iVC2
         +7xw==
X-Gm-Message-State: AOJu0Yw96tRHJt4ttNpfsi+x/ZRuD+BVQLSRXc3nfBfEdFcNaMUFq2Af
	iYNF4zEHr1oypTrO+dSBM+CnpSVb4VjoHqJ3wdr9IbnK7qkNUbqyaRRtfiov
X-Google-Smtp-Source: AGHT+IHWCRiSHIPvPndQQbtJ/ceB5BbrBB0wp9NOPR/6NFV3LWM5oXIt2CXY3Zg6cSYFQO6b3Lepuw==
X-Received: by 2002:a17:906:da85:b0:a6f:33d6:2d49 with SMTP id a640c23a62f3a-a75144bade6mr599775566b.52.1719918102696;
        Tue, 02 Jul 2024 04:01:42 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v14 2/9] xen/riscv: introduce bitops.h
Date: Tue,  2 Jul 2024 13:01:29 +0200
Message-ID: <fa98e36d85b5e7408c74310e0896c88fb5652e0f.1719917348.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719917348.git.oleksii.kurochko@gmail.com>
References: <cover.1719917348.git.oleksii.kurochko@gmail.com>
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
Changes in V11-V14:
 - Nothing changed. Only rebase was done.
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
2.45.2


