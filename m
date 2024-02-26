Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C9B867ED5
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685699.1066902 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewp-0001zJ-2O; Mon, 26 Feb 2024 17:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685699.1066902; Mon, 26 Feb 2024 17:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewo-0001ur-Q4; Mon, 26 Feb 2024 17:39:26 +0000
Received: by outflank-mailman (input) for mailman id 685699;
 Mon, 26 Feb 2024 17:39:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewm-0007o5-Gi
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:24 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa32c1b7-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:22 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2d243797703so42731401fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:22 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:20 -0800 (PST)
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
X-Inumbo-ID: fa32c1b7-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969161; x=1709573961; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rCykoQ35RmlaQov+EPt/Ynaxeb1jOtf3tAtx9aL5IQ=;
        b=U/QvG8zMJLTu70KPdl9e9qFLq527Zdd8s5mYtJvyi/qmj7wS0Nx05mEH/rifPSFkMX
         DMSX9mOwzdZizlIn9u45pMopOZFguEhrytbCfxmlZzIh0XRlgHCGFVA3uWUmF90xRllR
         mK7aeR5sNpmUVEzkZCCFGWjJvzBBwgwP3YEcFeAesMoTjXS9HaqbAF+hisVGVUGxisY5
         txjTN3BOjQVaGvZp/GXHHaQGaTzY4ZDj4J8Ymfoa/EGOzHVcyqshkg+2uAB4sA47EbZM
         RegFgZorAholpHI3Jk/RkVm705eKT2IHLr/oxz2lWfN4MtVTzHnjAFRQTyEy5Ws9zEi/
         FAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969161; x=1709573961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/rCykoQ35RmlaQov+EPt/Ynaxeb1jOtf3tAtx9aL5IQ=;
        b=U99dIuXeIooOfPKAszEnkNk00iIZpnZoZStO7Bawpsq3pcJojgantDcc1rFzMR4Fuw
         aH1Ye2zLS4zC6quDCeCfYltQlD4zUfhU8hysoqgoSSB7QMiBLDD6xAeHoZtxhkEVeVVZ
         g9Jv1cCo1RXkZaPrg1A72E4G7qMKPZdDuB8mXpvly+z3tssW/wzgU67eBKFNJWx0QLb9
         KDteZYW78h3vsUMedgHgK2K+FXTYpq51m8b4Qs9fqQDaPhV6zabURi5PCks65RbUJ90l
         PXRjuPxde9ylPONDv5NjSKj2Z1OCS9L+IEfwa+AAOjnjn4mxMZ2ttNijwQWwPKFL9M/B
         DMhg==
X-Gm-Message-State: AOJu0Yx6FIXDqh4gsenDe+yhjonR7XdHEJ4QfvMUtm3OM9B7Zgp1SxoT
	UN7xk6b7tkJgoNEsE3GNn6YFK79QVjEYk+LgNISPbuD7j5mW8zGrlvw82qhl
X-Google-Smtp-Source: AGHT+IFMwP8JNvbJcnskJ9n/DVf+muacLYkTr75j+QsuDPbLQVjkeynnb54mht0+ZxbixksRGIQ79Q==
X-Received: by 2002:a2e:a9a6:0:b0:2d2:9314:3ac3 with SMTP id x38-20020a2ea9a6000000b002d293143ac3mr592316ljq.4.1708969161359;
        Mon, 26 Feb 2024 09:39:21 -0800 (PST)
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
Subject: [PATCH v5 09/23] xen/riscv: introduce bitops.h
Date: Mon, 26 Feb 2024 18:38:51 +0100
Message-ID: <d06f0d90199e83ed6d1a410dfd3ebb6afc5e391f.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
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
  Patches 04 - 08 of this patch series are prerequisite for this patch.
---
Changes in V5:
 - Code style fixes
 - s/__NOP/NOP/g
 - s/__NOT/NOT/g
 - update the comments above functions: test_and_set_bit, test_and_clear_bit, set_bit, clear_bit as all of them
   are using atomic operation and a memory barrier, so the operation in it cannot be reordered.
 - s/volatile uint32_t/volatile bitops_uint_t in  test_and_set_bit, test_and_clear_bit, set_bit, clear_bit.
 - update the commit message
 - split introduction of asm-generic functions to separate patches:
   Patches 04 - 08 of this patch series are prerequisite for this patch.
---
Changes in V4:
  - updated the commit message: dropped the message about what was taken from linux/include/asm-generic/bitops/find.h
    as related changes now are located in xen/bitops.h. Also these changes were removed from riscv/bitops.h
  - switch tabs to spaces.
  - update return type of __ffs function, format __ffs according to Xen code style. Move the function to
    respective asm-generic header.
  - format ffsl() according to Xen code style, update the type of num: int -> unsigned to be align with
    return type of the function. Move the function to respective asm-generic header.
  - add new line for the files:
      asm-generic/bitops-bits.h
      asm-generic/ffz.h
      asm-generic/find-first-bit-set.h
      asm-generic/fls.h
      asm-generic/flsl.h
      asm-generic/test-bit.h
  - rename asm-generic/find-first-bit-set.h to asm-generic/find-first-set-bit.h to be aligned with the function
    name implemented inside.
  - introduce generic___test_and*() operation for non-atomic bitops.
  - rename current __test_and_*() -> test_and_*() as their implementation are atomic aware.
  - define __test_and_*() to generic___test_and_*().
  - introduce test_and_change_bit().
  - update asm-generic/bitops/bitops-bits.h to give possoibility to change BITOP_*() macros by architecture.
    Also, it was introduced bitops_uint_t type to make generic___test_and_*() generic.
  - "include asm-generic/bitops/bitops-bits.h" to files which use its definitions.
  - add comment why generic ffz is defined as __ffs().
  - update the commit message.
  - swtich ffsl() to generic_ffsl().
---
Changes in V3:
 - update the commit message
 - Introduce the following asm-generic bitops headers:
	create mode 100644 xen/arch/riscv/include/asm/bitops.h
	create mode 100644 xen/include/asm-generic/bitops/bitops-bits.h
	create mode 100644 xen/include/asm-generic/bitops/ffs.h
	create mode 100644 xen/include/asm-generic/bitops/ffz.h
	create mode 100644 xen/include/asm-generic/bitops/find-first-bit-set.h
	create mode 100644 xen/include/asm-generic/bitops/fls.h
	create mode 100644 xen/include/asm-generic/bitops/flsl.h
	create mode 100644 xen/include/asm-generic/bitops/hweight.h
	create mode 100644 xen/include/asm-generic/bitops/test-bit.h
 - switch some bitops functions to asm-generic's versions.
 - re-sync some macros with Linux kernel version mentioned in the commit message.
 - Xen code style fixes.
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/bitops.h | 152 ++++++++++++++++++++++++++++
 xen/arch/riscv/include/asm/config.h |   2 +
 2 files changed, 154 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..17b3cf5be5
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,152 @@
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
+#include <asm-generic/bitops/fls.h>
+#include <asm-generic/bitops/flsl.h>
+#include <asm-generic/bitops/__ffs.h>
+#include <asm-generic/bitops/ffs.h>
+#include <asm-generic/bitops/ffsl.h>
+#include <asm-generic/bitops/ffz.h>
+#include <asm-generic/bitops/find-first-set-bit.h>
+#include <asm-generic/bitops/hweight.h>
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
index 2c7f2b1ff9..479da15782 100644
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


