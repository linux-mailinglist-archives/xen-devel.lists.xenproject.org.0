Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 855368BCBB8
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717435.1119676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNg-0002ey-LM; Mon, 06 May 2024 10:15:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717435.1119676; Mon, 06 May 2024 10:15:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNg-0002Yo-Gm; Mon, 06 May 2024 10:15:36 +0000
Received: by outflank-mailman (input) for mailman id 717435;
 Mon, 06 May 2024 10:15:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNe-0001cU-NW
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:34 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93317354-0b91-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:15:34 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59cdd185b9so106588966b.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:34 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:33 -0700 (PDT)
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
X-Inumbo-ID: 93317354-0b91-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990533; x=1715595333; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c72THRDPJytFxUouq/3yaM0Y1kQGbdnojUTJoNIkwb0=;
        b=LRmb6jIZN9EedVUExHaQwXYSDB9Q+Q1YMyT0G2B6soYBRLQ/Mnymz3hNS/0ytFR2bw
         orv4Qmr06sndHPhkQMT9AHxXuWNI+QfP+AJxc0nT7KYViml239nTRJzzIdHeHURxhT6e
         SMoJyLVBUfOpReIavP4NIvExXy2TrlQyTbJXAeznMKALSb6ULhtte2P2oDteC+eF8o76
         fT7AlmEx+bAFrN0cRPX/K562vB+qtJ42OlDUM7bIyTteP6D1wI3VVPpTbkVBpdhb1oBI
         RuGCJg+uvrjh/bnIObkgEAvyMU5zp+w0IoFyDN+4UmXcxGa9cw8oRm+BGi0zML19RaZe
         /gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990533; x=1715595333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c72THRDPJytFxUouq/3yaM0Y1kQGbdnojUTJoNIkwb0=;
        b=WZa5kpEFzU0teU5qUbbVi2yyHR6k/HOY/BJqsFlLmQpkm76mlqjdux9l0GsMD6uFm/
         R4gTqTRhXguVQ2TK38AJYWocZAqzvuWkDnVNmnEQIGRBzFJvPDutonINh/RkzRDu0STw
         LQ3RtixdoVHCtC9TrGJ0xmJAo8OgbkmT199p8lHFmKNnBnUghKCmz7qTLyWAzfFpcHEs
         uBqeasuLFIrAJgtnx4VYKdWQRq46athYvXAB+al18hjHus2swryQZen/toOFzrTbnjMY
         DKaExuGsW/RxHpYWl8wDfh71MLuTAkNmYmsoo2MHKTw/FAhn4zuauYRN5KWeA3qH36zO
         rYGw==
X-Gm-Message-State: AOJu0Yw94oZNDW4DqdE3aENzLhKqeQL2XP6Wgpj4D774FXwSSopbzMvN
	8YfLehpg3g+7T+CjfWXrtIvSl5YUrh06/rQNvzB9ht0JxPrXuduEjExrdw==
X-Google-Smtp-Source: AGHT+IFempjP+TE6sNlnduMEa1bJE6kAMEUQJ9XE7S1bYbydX4IjJqj2e+Vf/Euk0dAkVpEHX85xNg==
X-Received: by 2002:a17:906:4a4b:b0:a59:908e:42d with SMTP id a11-20020a1709064a4b00b00a59908e042dmr6542249ejv.32.1714990533267;
        Mon, 06 May 2024 03:15:33 -0700 (PDT)
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
Subject: [PATCH v9 05/15] xen/riscv: introduce bitops.h
Date: Mon,  6 May 2024 12:15:14 +0200
Message-ID: <c81251aa51abe383f60a24770a07a9aa6d673a21.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
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
index 0000000000..9f796bf859
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
-- 
2.45.0


