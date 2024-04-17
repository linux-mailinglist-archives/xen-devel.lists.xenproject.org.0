Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7D38A804E
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707305.1105122 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AF-0000PW-Af; Wed, 17 Apr 2024 10:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707305.1105122; Wed, 17 Apr 2024 10:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AF-0000Nh-5p; Wed, 17 Apr 2024 10:05:15 +0000
Received: by outflank-mailman (input) for mailman id 707305;
 Wed, 17 Apr 2024 10:05:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AD-0007lO-Dm
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:13 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa21e76b-fca1-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 12:05:11 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-518c9ff3e29so4069935e87.0
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:11 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:10 -0700 (PDT)
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
X-Inumbo-ID: fa21e76b-fca1-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348311; x=1713953111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psmf6PBWRAu81Z4s9T9s93YdCljauaFHYjxf9CcpyFM=;
        b=bXgK2fjzxrn5abQEjAQgrRTnqB+sq7oWiEuF3bnzvM1RuON6jG9XZSwkRS48saG9h8
         RCZxKFd5XANyFgoDnUIF/c4QNMJFsEzuh5qxkVTp6707vWdJDUj8hE58wvAx059J7oA/
         9/P8xcIBi6UC1byRqbDgqEC1GmzKghXHttoqYXq2JGATndn1D07nyftmJLH48s0v1P8X
         BqC8/XPOWhEFFPSbGRpAP7h9Na+bj3mP21HkETsvFac3gwM2b2KkDy5WfXnd/15RdJ1z
         ytVkqXoKFJfPrPBjvUfis5F19nF8AWlZK/TXMu/AvqbADxaDRoq1kGfgyIs3EjizwcBo
         FSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348311; x=1713953111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psmf6PBWRAu81Z4s9T9s93YdCljauaFHYjxf9CcpyFM=;
        b=OMm12nIsC+5/LZNU3pL5MgyQqkRoLGZU+E3C4xKl6AKj1rUnEy84wD6vVtaaTp4hn7
         buzcXUSAYkvGaQi4vYDzlzu6LebUnGMdGnhubL3ieGhrhuWARgXX3x18mYK0cad53/q1
         qDpC28LHWaepnJ24KeKZmdG3RArv2yCEXXRT6QMsBXgu23IUK7Qpiv0Zh3B0IMh2VaDG
         FBXt5irAqVddYLB6ABf79bcBt9xVNMpFvS5Cu4UZ+8NDaYySQ3Qt+eS/Ed3/oI7jIqQ+
         DVAbvG3EOirovranyxbtdmgE0bkJmvIYbr3XPN89Q4VeEA52MHYt9g81m538iFLjphx0
         JKWA==
X-Gm-Message-State: AOJu0YyM9XFM3PqWT90PtUhN3lpjjVddEAeJs7GYXKfKUBR7eqV9hDA1
	B8l5S6K9liiGPxgvp9lvKOlyrlj9hmEIfJl+pwB/zQHfapYlwkYDVe1IXg==
X-Google-Smtp-Source: AGHT+IGplCM0JA0niL+lYDMeEG6P0zYMeNTuHv4n4j7QLhXnRVxCqgVT0Z1VTU9C1bHd/p0oWmNUmA==
X-Received: by 2002:ac2:4c25:0:b0:515:c102:c825 with SMTP id u5-20020ac24c25000000b00515c102c825mr8956250lfq.19.1713348310935;
        Wed, 17 Apr 2024 03:05:10 -0700 (PDT)
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
Subject: [PATCH v8 05/17] xen/riscv: introduce bitops.h
Date: Wed, 17 Apr 2024 12:04:48 +0200
Message-ID: <c3a9dfadbc6465eb9362c7823d7d2800e98218eb.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/types.h  |   4 +
 2 files changed, 141 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..21db8d1600
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
+#if BITS_PER_LONG == 64
+#define __AMO(op)   "amo" #op ".d"
+#elif BITS_PER_LONG == 32
+#define __AMO(op)   "amo" #op ".w"
+#else
+#error "Unexpected BITS_PER_LONG"
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
diff --git a/xen/arch/riscv/include/asm/types.h b/xen/arch/riscv/include/asm/types.h
index 59358fd698..e8ab50ec18 100644
--- a/xen/arch/riscv/include/asm/types.h
+++ b/xen/arch/riscv/include/asm/types.h
@@ -25,6 +25,10 @@ typedef u64 register_t;
 
 #endif
 
+#define BITOP_TYPE
+#define BITOP_BITS_PER_WORD BITS_PER_LONG
+typedef unsigned long bitop_uint_t;
+
 #endif /* __RISCV_TYPES_H__ */
 /*
  * Local variables:
-- 
2.44.0


