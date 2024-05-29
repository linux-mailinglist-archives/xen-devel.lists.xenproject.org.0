Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2840D8D3F2D
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 21:55:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732323.1138283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOJ-00042G-Tv; Wed, 29 May 2024 19:55:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732323.1138283; Wed, 29 May 2024 19:55:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCPOJ-0003yY-LT; Wed, 29 May 2024 19:55:19 +0000
Received: by outflank-mailman (input) for mailman id 732323;
 Wed, 29 May 2024 19:55:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DI5e=NA=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sCPOH-0003Q0-PQ
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 19:55:17 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e624e07-1df5-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 21:55:16 +0200 (CEST)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-52ac99930c6so270039e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 12:55:16 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5297066b249sm1344203e87.178.2024.05.29.12.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 May 2024 12:55:15 -0700 (PDT)
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
X-Inumbo-ID: 5e624e07-1df5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717012515; x=1717617315; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j/RmSAlhCXJU1vUCQMT/ujGfnXfs53M7nbtzjes1TI=;
        b=fEUhk5AA8ukCLPi7XQ2/NiqZL+ep3PgY6SLKzfRFoN1Ujeyophk2ftajYp5oyr/FUB
         KaUQsk6i2vEWk2Q1CJ2J6jx/V/ESUXfVEAav7eSpNFaNKKVgvpfNrVKZGwMRzh6OPWE3
         VRFUQasY09XWkdfdq0iC78BTWlZDNAGdNf5m2Oy+WQryFb5IosO/xkHu6M2LoDRvycQY
         FfJ2CQQOM1UM/v1iDd54C1/dRBeq87X0Jqz02yLF+xTwCC7DWsZYSwZ5D2mQGGH6MCLV
         YSxNjBAH9Zq4IZrIt+Ctlo98jUiAMRvoCu/VtPO6KfaQCzDOHS/yejHr9xoNe1boBpqp
         Ljtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717012515; x=1717617315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5j/RmSAlhCXJU1vUCQMT/ujGfnXfs53M7nbtzjes1TI=;
        b=kBQxKH8TZKI8yuefj7eIHjF4MpnOqi6tCj1X8TNLZx/jSDoAEXpT0BZm2JYrVC35gL
         ZtXG9SNSovJHjgDT0TsLRVX+0HlTo5CNm3rwPfnsmLGtbsD/9ZAVCF3eu4vzvtz0TW5m
         F85LMKBHvGjgWo0YVvyXL59+2mhdcwX5PrDSuRWel105srLzPBBfQiEDUFbQpAGPYd/l
         03b8YbK8Edb0xyHXoufed4oQnzZ319fePGDep50clSiZV/ZDQ64W+dg/bp+M5/0SI+2z
         kbn1AG9wGEqcXp4KO46IN8vN3g1BpXpiMqVXSsUBDRy3Vt0VYXhOoTrSA8wkNs5LER75
         WFEg==
X-Gm-Message-State: AOJu0Yz7gmJnk4ougoN37KtlgI7JV9B9v7Do2vKKUVcBxree66niXr0V
	fYPRJt0MM2JMGZYUBg69Mfjpdn1BWZfrGQN0ALiA1yJgZxX3c+CRbiJNqJNh
X-Google-Smtp-Source: AGHT+IHsKzwdLJDunzsII+Oo8Y+RSm0pjg/FSCmVV8H2Jruqwk6TXnOHVvqxpsKkabpyMwtmcSKuRg==
X-Received: by 2002:a19:ca06:0:b0:518:dae6:d0ec with SMTP id 2adb3069b0e04-52b7d418d7amr115370e87.4.1717012515204;
        Wed, 29 May 2024 12:55:15 -0700 (PDT)
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
Subject: [PATCH v12 3/8] xen/riscv: introduce bitops.h
Date: Wed, 29 May 2024 21:55:04 +0200
Message-ID: <b70eda27ec40fff2fdd1225f8b4f17c036b550b7.1717008161.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1717008161.git.oleksii.kurochko@gmail.com>
References: <cover.1717008161.git.oleksii.kurochko@gmail.com>
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
Changes in V11-V12:
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
2.45.0


