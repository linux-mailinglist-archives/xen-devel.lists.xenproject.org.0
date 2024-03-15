Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF36687D33A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693993.1082757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwt-0007of-Vt; Fri, 15 Mar 2024 18:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693993.1082757; Fri, 15 Mar 2024 18:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwt-0007jy-Qu; Fri, 15 Mar 2024 18:06:31 +0000
Received: by outflank-mailman (input) for mailman id 693993;
 Fri, 15 Mar 2024 18:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBws-0005yV-Ic
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:30 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bef481c1-e2f6-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 19:06:28 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2d288bac3caso30176891fa.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:28 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:27 -0700 (PDT)
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
X-Inumbo-ID: bef481c1-e2f6-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525988; x=1711130788; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7BmmOnotZNjNAla6pnLMXKldhtxVOBY9PyiBiwwiZE=;
        b=TxmN4w7fXvM0fykDbPrjG5dxs6iqmhXA6Bd5jWcOjcUKYBeneR6PEvOOciNeIdJapE
         XlM0O7BrR7MxBYl9ME/jSsvmbwdlF0Qy/Out+6z7QlD26oMCqbzmkVlJFVjfbYVgQZv6
         fcD6gA9bQ1vRIv7hF00U3yKaYCfBNDAH0Ee/3++ik0S4mZMco/TVZ22NBL0RwGwOn5HW
         UxCleCujWqgXKCWlu9HmVcoTuMVOukDeJbBQH/aPB6U0gsM36G0o+WhJwwoG9YHlV9pd
         uWxbbEIsRFScc0neJBdxphjHrwyRvFZEQ1Y+QwwGA5BGa3ccdoFP1xH6r+TFKc9iH05C
         dvJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525988; x=1711130788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7BmmOnotZNjNAla6pnLMXKldhtxVOBY9PyiBiwwiZE=;
        b=vgxLUlNsuXNZekw5sPeUbjIyN7a/Uwg2/yzYic8xp/9kzo0dypDeYCU15GNzov1qjM
         ef2yhX5nIqlB8sCeyB0qXXl9T/afKWkCy57/MQZfrgTCNDG1TTi+34OXPfqxj6Niv1Ss
         Qi5otC7NmzZl7dibayxNJkFrnjaZdIKNeSl6GWnkZa701DsahMF6OG98Xff0ltWDn6vo
         phcarsuIF38zPiRBAZuY+Nu1o4Yt9AY0ZSqGr8KG+J4mMhfGpbiAEEqH3RJ8BuxMvOek
         /Z2Es6ArPKsaQNum6AyLm6TUHucJE9Nz3c1HVFm/sST4j9ujWpSOFk2ZQjf9wiSW9aGj
         ZRAw==
X-Gm-Message-State: AOJu0Yw8OfClbnwcDgszIYBvfB3RkYxx6Jx62Pb/170GMns85GSiivYh
	o+S1TV9ufw3DQMeqTfyWlod7VbBHwZoM5t/pG37d1SyweSfCZX+S/jTg1ovjer0=
X-Google-Smtp-Source: AGHT+IEBaldBFEU/oBGeiV/tYCFh5SAurQzdoH2PTQt4tY9+EjdLq8TELNNYvhRT+/sbaRQG8JoyOA==
X-Received: by 2002:a2e:9295:0:b0:2d4:3860:e80b with SMTP id d21-20020a2e9295000000b002d43860e80bmr3335344ljh.7.1710525988217;
        Fri, 15 Mar 2024 11:06:28 -0700 (PDT)
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
Subject: [PATCH v6 07/20] xen/riscv: introduce bitops.h
Date: Fri, 15 Mar 2024 19:06:03 +0100
Message-ID: <14c91e2ba2aeb6e49f9f7e549232244719fa6959.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
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
     * update function prototypes from
       generic___test_and_*(unsigned long nr nr, volatile unsigned long *addr)
       to
       generic___test_and_*(unsigned long nr, volatile void *addr) to be
       consistent with other related macros/defines.
     * convert identations from tabs to spaces.
     * inside generic__test_and_* use 'bitops_uint_t' instead of 'unsigned long'
        to be generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - rebase clean ups were done: drop unused asm-generic includes
---
 Changes in V5:
   - new patch
---
 xen/arch/riscv/include/asm/bitops.h | 144 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/config.h |   2 +
 2 files changed, 146 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..21c4868355
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,144 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2012 Regents of the University of California */
+
+#ifndef _ASM_RISCV_BITOPS_H
+#define _ASM_RISCV_BITOPS_H
+
+#include <asm/system.h>
+
+#define BITOP_BITS_PER_WORD BITS_PER_LONG
+
+#define BITOP_TYPE
+typedef uint64_t bitops_uint_t;
+
+#include <asm-generic/bitops/bitops-bits.h>
+
+#define __set_bit(n, p)      set_bit(n, p)
+#define __clear_bit(n, p)    clear_bit(n, p)
+
+/* Based on linux/arch/include/asm/bitops.h */
+
+#if BITS_PER_LONG == 64
+#define __AMO(op)   "amo" #op ".d"
+#elif BITS_PER_LONG == 32
+#define __AMO(op)   "amo" #op ".w"
+#else
+#error "Unexpected BITS_PER_LONG"
+#endif
+
+#define test_and_op_bit_ord(op, mod, nr, addr, ord)     \
+({                                                      \
+    unsigned long res, mask;                            \
+    mask = BITOP_MASK(nr);                              \
+    __asm__ __volatile__ (                              \
+        __AMO(op) #ord " %0, %2, %1"                    \
+        : "=r" (res), "+A" (addr[BITOP_WORD(nr)])       \
+        : "r" (mod(mask))                               \
+        : "memory");                                    \
+    ((res & mask) != 0);                                \
+})
+
+#define __op_bit_ord(op, mod, nr, addr, ord)    \
+    __asm__ __volatile__ (                      \
+        __AMO(op) #ord " zero, %1, %0"          \
+        : "+A" (addr[BITOP_WORD(nr)])           \
+        : "r" (mod(BITOP_MASK(nr)))             \
+        : "memory");
+
+#define test_and_op_bit(op, mod, nr, addr)    \
+    test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
+#define __op_bit(op, mod, nr, addr) \
+    __op_bit_ord(op, mod, nr, addr, )
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
+    volatile bitops_uint_t *addr = p;
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
+    volatile bitops_uint_t *addr = p;
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
+    volatile bitops_uint_t *addr = p;
+
+    __op_bit(or, NOP, nr, addr);
+}
+
+/**
+ * clear_bit - Clears a bit in memory
+ * @nr: Bit to clear
+ * @addr: Address to start counting from
+ */
+static inline void clear_bit(int nr, volatile void *p)
+{
+    volatile bitops_uint_t *addr = p;
+
+    __op_bit(and, NOT, nr, addr);
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
+#include <asm-generic/bitops/generic-non-atomic.h>
+
+#define __test_and_set_bit generic___test_and_set_bit
+#define __test_and_clear_bit generic___test_and_clear_bit
+#define __test_and_change_bit generic___test_and_change_bit
+
+#include <asm-generic/bitops/test-bit.h>
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
diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
index c5f93e6a01..a58086e4b2 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -113,6 +113,8 @@
 # error "Unsupported RISCV variant"
 #endif
 
+#define BITS_PER_BYTE 8
+
 #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
 #define BITS_PER_LONG  (BYTES_PER_LONG << 3)
 #define POINTER_ALIGN  BYTES_PER_LONG
-- 
2.43.0


