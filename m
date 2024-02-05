Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DF9849E3B
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676205.1052255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xt-0001Xv-96; Mon, 05 Feb 2024 15:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676205.1052255; Mon, 05 Feb 2024 15:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xs-0001TJ-Tk; Mon, 05 Feb 2024 15:32:56 +0000
Received: by outflank-mailman (input) for mailman id 676205;
 Mon, 05 Feb 2024 15:32:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xq-0007I6-V0
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:55 +0000
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [2a00:1450:4864:20::133])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d336bf53-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:52 +0100 (CET)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-5111c7d40deso7533965e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:52 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:49 -0800 (PST)
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
X-Inumbo-ID: d336bf53-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147171; x=1707751971; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x10WJ61xCAu2SaWC9hWesUNvYqTdqZDZmiUpwgQkjrI=;
        b=IcYWkWQlRBeefnIFAhvyF+KU2qDZIESYZdRgRMi8Jd6RiAxGakI6K4ambeif9b7WAQ
         VaPMn0KyJPZY5U13e6k7cFj2ldA5k0Rn7dyqyZDpQxJ1EZAmQaMBJIrHyeevbU40X+XS
         gLI84KirE3W5b9/+W8PwWRI1Huc3WhhNGlwWXDhM4YlNbkxBPRkfVxzvW+SPowzjjc1G
         1xKU8iqUUrh7JNiko5wvvw1AHUKykaL+Mquiy3LcHpnhYUo+CVBdKeRGuJNOaBfCl+mN
         CS1Dixywbw/O1WZFitDXYFbujdEVSsPesOW0TAGq7b65DqT4ATqSQgSiwOqjzk9Owrs3
         Z8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147171; x=1707751971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x10WJ61xCAu2SaWC9hWesUNvYqTdqZDZmiUpwgQkjrI=;
        b=iB5VVAaikaxsv6LmMzDeatkEKDaepuz/AqpuC/mImX5AZAZRwv3Co9yp6EYUSsk8OC
         d5IWpgqo0pxuO5/yKct/bsLwJrwZKhdYP38v1yGdN5YXmQpmDZz3uH8YDu5YlqPsN1xk
         XaXjU2V7K67s/x8wcesR37ftL3wE0Mls9CtumtSDCTyHx40qyYaoXdIV/kQe+LNe0DWF
         4mOM8Ve1FmhPAbiup5FK87FTOMF63+qH6oMZoMFKBj4Yrcs+dj8+Dwb8qlNej2NnV7QF
         Sf4PvLCFV8rcQEurVgqy/CfKSonni1+cemRX4MSePTqMfx8TD+jIv7JzSLjXMpde476B
         bXgg==
X-Gm-Message-State: AOJu0Yw/LfeDdRo0BPkFgc9rrsnGvYP35zAzNUg0MLr/qD9CSatNgqDN
	RB9QtrZyRsj21d+7tm7o9iWatwGsrSrgAzAE0cHypkb+pgr5aC7vU0rdxU6G
X-Google-Smtp-Source: AGHT+IHauYIzyY/SreFYiH+TO2/dV5e2WfFB9n/UzR1q4AS1BvCvidzDxNuLmu9yk9dFL7oF1+9FvQ==
X-Received: by 2002:a05:6512:67:b0:511:56c0:695 with SMTP id i7-20020a056512006700b0051156c00695mr396831lfo.51.1707147170525;
        Mon, 05 Feb 2024 07:32:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWuf/VbPOVxho42QWsXirVtyn+9P1tq1GL9spedb6hvSRzDSJpKHJiubL/qp1bQtilTIicwPkoCli3DPy2F7bd0lGCWRrDAB3zveAxc5DDB/bbD6y+cylM/KC34M18OoTmkLDjzxr81/dlCYPO0zvo+EEUdKtkX6N073HNBEQNBZhAp9XWWo+Z7RSTVWU8mC1fynoDzINmSH1NRsrccbFdZGMWiEzE4x17/uXGQucEi9xESWIgYFwSPwHA26pBd5XDPiF5zLqvYX4AI4ECX//1YLykP+DkYBojdiE0GsocOuX5HT1grVujqdmlhLSoKPJIevP+F
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
Subject: [PATCH v4 09/30] xen/riscv: introduce bitops.h
Date: Mon,  5 Feb 2024 16:32:16 +0100
Message-ID: <f76bd85f4b64a47c59c0b306ce425036819fa380.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
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
* linux/arch/include/linux/bits.h ( taken only definitions for BIT_MASK,
  BIT_WORD, BITS_PER_BYTE )
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

Additionaly, the following bit ops are introduced:
* __ffs
* ffsl
* fls
* flsl
* ffs
* ffz
* find_first_bit_set
* hweight64
* test_bit

Some of the introduced bit operations are included in asm-generic,
as they exhibit similarity across multiple architectures.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/bitops.h           | 164 ++++++++++++++++++
 xen/arch/riscv/include/asm/config.h           |   2 +
 xen/include/asm-generic/bitops/__ffs.h        |  47 +++++
 xen/include/asm-generic/bitops/bitops-bits.h  |  21 +++
 xen/include/asm-generic/bitops/ffs.h          |   9 +
 xen/include/asm-generic/bitops/ffsl.h         |  16 ++
 xen/include/asm-generic/bitops/ffz.h          |  18 ++
 .../asm-generic/bitops/find-first-set-bit.h   |  17 ++
 xen/include/asm-generic/bitops/fls.h          |  18 ++
 xen/include/asm-generic/bitops/flsl.h         |  10 ++
 .../asm-generic/bitops/generic-non-atomic.h   |  89 ++++++++++
 xen/include/asm-generic/bitops/hweight.h      |  13 ++
 xen/include/asm-generic/bitops/test-bit.h     |  18 ++
 13 files changed, 442 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/include/asm-generic/bitops/__ffs.h
 create mode 100644 xen/include/asm-generic/bitops/bitops-bits.h
 create mode 100644 xen/include/asm-generic/bitops/ffs.h
 create mode 100644 xen/include/asm-generic/bitops/ffsl.h
 create mode 100644 xen/include/asm-generic/bitops/ffz.h
 create mode 100644 xen/include/asm-generic/bitops/find-first-set-bit.h
 create mode 100644 xen/include/asm-generic/bitops/fls.h
 create mode 100644 xen/include/asm-generic/bitops/flsl.h
 create mode 100644 xen/include/asm-generic/bitops/generic-non-atomic.h
 create mode 100644 xen/include/asm-generic/bitops/hweight.h
 create mode 100644 xen/include/asm-generic/bitops/test-bit.h

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..1225298d35
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,164 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2012 Regents of the University of California */
+
+#ifndef _ASM_RISCV_BITOPS_H
+#define _ASM_RISCV_BITOPS_H
+
+#include <asm/system.h>
+
+#include <asm-generic/bitops/bitops-bits.h>
+
+/* Based on linux/arch/include/linux/bits.h */
+
+#define BIT_MASK(nr)        (1UL << ((nr) % BITS_PER_LONG))
+#define BIT_WORD(nr)        ((nr) / BITS_PER_LONG)
+
+#define __set_bit(n,p)      set_bit(n,p)
+#define __clear_bit(n,p)    clear_bit(n,p)
+
+/* Based on linux/arch/include/asm/bitops.h */
+
+#if ( BITS_PER_LONG == 64 )
+#define __AMO(op)   "amo" #op ".d"
+#elif ( BITS_PER_LONG == 32 )
+#define __AMO(op)   "amo" #op ".w"
+#else
+#error "Unexpected BITS_PER_LONG"
+#endif
+
+#define __test_and_op_bit_ord(op, mod, nr, addr, ord)   \
+({                                                      \
+    unsigned long __res, __mask;                        \
+    __mask = BIT_MASK(nr);                              \
+    __asm__ __volatile__ (                              \
+        __AMO(op) #ord " %0, %2, %1"                    \
+        : "=r" (__res), "+A" (addr[BIT_WORD(nr)])       \
+        : "r" (mod(__mask))                             \
+        : "memory");                                    \
+    ((__res & __mask) != 0);                            \
+})
+
+#define __op_bit_ord(op, mod, nr, addr, ord)    \
+    __asm__ __volatile__ (                      \
+        __AMO(op) #ord " zero, %1, %0"          \
+        : "+A" (addr[BIT_WORD(nr)])             \
+        : "r" (mod(BIT_MASK(nr)))               \
+        : "memory");
+
+#define __test_and_op_bit(op, mod, nr, addr)    \
+    __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
+#define __op_bit(op, mod, nr, addr) \
+    __op_bit_ord(op, mod, nr, addr, )
+
+/* Bitmask modifiers */
+#define __NOP(x)    (x)
+#define __NOT(x)    (~(x))
+
+/**
+ * __test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation may be reordered on other architectures than x86.
+ */
+static inline int test_and_set_bit(int nr, volatile void *p)
+{
+    volatile uint32_t *addr = p;
+
+    return __test_and_op_bit(or, __NOP, nr, addr);
+}
+
+/**
+ * __test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation can be reordered on other architectures other than x86.
+ */
+static inline int test_and_clear_bit(int nr, volatile void *p)
+{
+    volatile uint32_t *addr = p;
+
+    return __test_and_op_bit(and, __NOT, nr, addr);
+}
+
+/**
+ * set_bit - Atomically set a bit in memory
+ * @nr: the bit to set
+ * @addr: the address to start counting from
+ *
+ * Note: there are no guarantees that this function will not be reordered
+ * on non x86 architectures, so if you are writing portable code,
+ * make sure not to rely on its reordering guarantees.
+ *
+ * Note that @nr may be almost arbitrarily large; this function is not
+ * restricted to acting on a single-word quantity.
+ */
+static inline void set_bit(int nr, volatile void *p)
+{
+    volatile uint32_t *addr = p;
+
+    __op_bit(or, __NOP, nr, addr);
+}
+
+/**
+ * clear_bit - Clears a bit in memory
+ * @nr: Bit to clear
+ * @addr: Address to start counting from
+ *
+ * Note: there are no guarantees that this function will not be reordered
+ * on non x86 architectures, so if you are writing portable code,
+ * make sure not to rely on its reordering guarantees.
+ */
+static inline void clear_bit(int nr, volatile void *p)
+{
+    volatile uint32_t *addr = p;
+
+    __op_bit(and, __NOT, nr, addr);
+}
+
+/**
+ * test_and_change_bit - Change a bit and return its old value
+ * @nr: Bit to change
+ * @addr: Address to count from
+ *
+ * This operation is atomic and cannot be reordered.
+ * It also implies a memory barrier.
+ */
+static inline int test_and_change_bit(int nr, volatile unsigned long *addr)
+{
+	return __test_and_op_bit(xor, __NOP, nr, addr);
+}
+
+#undef __test_and_op_bit
+#undef __op_bit
+#undef __NOP
+#undef __NOT
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
index a80cdd4f85..56387ac159 100644
--- a/xen/arch/riscv/include/asm/config.h
+++ b/xen/arch/riscv/include/asm/config.h
@@ -50,6 +50,8 @@
 # error "Unsupported RISCV variant"
 #endif
 
+#define BITS_PER_BYTE 8
+
 #define BYTES_PER_LONG (1 << LONG_BYTEORDER)
 #define BITS_PER_LONG  (BYTES_PER_LONG << 3)
 #define POINTER_ALIGN  BYTES_PER_LONG
diff --git a/xen/include/asm-generic/bitops/__ffs.h b/xen/include/asm-generic/bitops/__ffs.h
new file mode 100644
index 0000000000..fecb4484d9
--- /dev/null
+++ b/xen/include/asm-generic/bitops/__ffs.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS___FFS_H_
+#define _ASM_GENERIC_BITOPS___FFS_H_
+
+/**
+ * ffs - find first bit in word.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned int __ffs(unsigned long word)
+{
+    unsigned int num = 0;
+
+#if BITS_PER_LONG == 64
+    if ( (word & 0xffffffff) == 0 )
+    {
+        num += 32;
+        word >>= 32;
+    }
+#endif
+    if ( (word & 0xffff) == 0 )
+    {
+        num += 16;
+        word >>= 16;
+    }
+    if ( (word & 0xff) == 0 )
+    {
+        num += 8;
+        word >>= 8;
+    }
+    if ( (word & 0xf) == 0 )
+    {
+        num += 4;
+        word >>= 4;
+    }
+    if ( (word & 0x3) == 0 )
+    {
+        num += 2;
+        word >>= 2;
+    }
+    if ( (word & 0x1) == 0 )
+        num += 1;
+    return num;
+}
+
+#endif /* _ASM_GENERIC_BITOPS___FFS_H_ */
diff --git a/xen/include/asm-generic/bitops/bitops-bits.h b/xen/include/asm-generic/bitops/bitops-bits.h
new file mode 100644
index 0000000000..4ece2affd6
--- /dev/null
+++ b/xen/include/asm-generic/bitops/bitops-bits.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_BITS_H_
+#define _ASM_GENERIC_BITOPS_BITS_H_
+
+#ifndef BITOP_BITS_PER_WORD
+#define BITOP_BITS_PER_WORD     32
+#endif
+
+#ifndef BITOP_MASK
+#define BITOP_MASK(nr)          (1U << ((nr) % BITOP_BITS_PER_WORD))
+#endif
+
+#ifndef BITOP_WORD
+#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
+#endif
+
+#ifndef BITOP_TYPE
+typedef uint32_t bitops_uint_t;
+#endif
+
+#endif /* _ASM_GENERIC_BITOPS_BITS_H_ */
diff --git a/xen/include/asm-generic/bitops/ffs.h b/xen/include/asm-generic/bitops/ffs.h
new file mode 100644
index 0000000000..3f75fded14
--- /dev/null
+++ b/xen/include/asm-generic/bitops/ffs.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FFS_H_
+#define _ASM_GENERIC_BITOPS_FFS_H_
+
+#include <xen/macros.h>
+
+#define ffs(x) ({ unsigned int t_ = (x); fls(ISOLATE_LSB(t_)); })
+
+#endif /* _ASM_GENERIC_BITOPS_FFS_H_ */
diff --git a/xen/include/asm-generic/bitops/ffsl.h b/xen/include/asm-generic/bitops/ffsl.h
new file mode 100644
index 0000000000..d0996808f5
--- /dev/null
+++ b/xen/include/asm-generic/bitops/ffsl.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FFSL_H_
+#define _ASM_GENERIC_BITOPS_FFSL_H_
+
+/**
+ * ffsl - find first bit in long.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned int ffsl(unsigned long word)
+{
+    return generic_ffsl(word);
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FFSL_H_ */
diff --git a/xen/include/asm-generic/bitops/ffz.h b/xen/include/asm-generic/bitops/ffz.h
new file mode 100644
index 0000000000..5932fe6695
--- /dev/null
+++ b/xen/include/asm-generic/bitops/ffz.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FFZ_H_
+#define _ASM_GENERIC_BITOPS_FFZ_H_
+
+/*
+ * ffz - find first zero in word.
+ * @word: The word to search
+ *
+ * Undefined if no zero exists, so code should check against ~0UL first.
+ *
+ * ffz() is defined as __ffs() and not as ffs() as it is defined in such
+ * a way in Linux kernel (6.4.0 ) from where this header was taken, so this
+ * header is supposed to be aligned with Linux kernel version.
+ * Also, most architectures are defined in the same way in Xen.
+ */
+#define ffz(x)  __ffs(~(x))
+
+#endif /* _ASM_GENERIC_BITOPS_FFZ_H_ */
diff --git a/xen/include/asm-generic/bitops/find-first-set-bit.h b/xen/include/asm-generic/bitops/find-first-set-bit.h
new file mode 100644
index 0000000000..7d28b8a89b
--- /dev/null
+++ b/xen/include/asm-generic/bitops/find-first-set-bit.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FIND_FIRST_SET_BIT_H_
+#define _ASM_GENERIC_BITOPS_FIND_FIRST_SET_BIT_H_
+
+/**
+ * find_first_set_bit - find the first set bit in @word
+ * @word: the word to search
+ *
+ * Returns the bit-number of the first set bit (first bit being 0).
+ * The input must *not* be zero.
+ */
+static inline unsigned int find_first_set_bit(unsigned long word)
+{
+        return ffsl(word) - 1;
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FIND_FIRST_SET_BIT_H_ */
diff --git a/xen/include/asm-generic/bitops/fls.h b/xen/include/asm-generic/bitops/fls.h
new file mode 100644
index 0000000000..369a4c790c
--- /dev/null
+++ b/xen/include/asm-generic/bitops/fls.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FLS_H_
+#define _ASM_GENERIC_BITOPS_FLS_H_
+
+/**
+ * fls - find last (most-significant) bit set
+ * @x: the word to search
+ *
+ * This is defined the same way as ffs.
+ * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
+ */
+
+static inline int fls(unsigned int x)
+{
+    return generic_fls(x);
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FLS_H_ */
diff --git a/xen/include/asm-generic/bitops/flsl.h b/xen/include/asm-generic/bitops/flsl.h
new file mode 100644
index 0000000000..d0a2e9c729
--- /dev/null
+++ b/xen/include/asm-generic/bitops/flsl.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FLSL_H_
+#define _ASM_GENERIC_BITOPS_FLSL_H_
+
+static inline int flsl(unsigned long x)
+{
+    return generic_flsl(x);
+}
+
+#endif /* _ASM_GENERIC_BITOPS_FLSL_H_ */
diff --git a/xen/include/asm-generic/bitops/generic-non-atomic.h b/xen/include/asm-generic/bitops/generic-non-atomic.h
new file mode 100644
index 0000000000..07efca245e
--- /dev/null
+++ b/xen/include/asm-generic/bitops/generic-non-atomic.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * The file is based on Linux ( 6.4.0 ) header:
+ *   include/asm-generic/bitops/generic-non-atomic.h
+ * 
+ * Only functions that can be reused in Xen were left; others were removed.
+ * 
+ * Also, the following changes were done:
+ *  - it was updated the message inside #ifndef ... #endif.
+ *  - __always_inline -> always_inline to be align with definition in
+ *    xen/compiler.h.
+ *  - update function prototypes from
+ *    generic___test_and_*(unsigned long nr nr, volatile unsigned long *addr) to
+ *    generic___test_and_*(unsigned long nr, volatile void *addr) to be
+ *    consistent with other related macros/defines.
+ *  - convert identations from tabs to spaces.
+ *  - inside generic__test_and_* use 'bitops_uint_t' instead of 'unsigned long'
+ *    to be generic.
+ */
+
+#ifndef __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
+#define __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H
+
+#include <xen/compiler.h>
+
+#include <asm-generic/bitops/bitops-bits.h>
+
+#ifndef _LINUX_BITOPS_H
+#error only <xen/bitops.h> can be included directly
+#endif
+
+/*
+ * Generic definitions for bit operations, should not be used in regular code
+ * directly.
+ */
+
+/**
+ * generic___test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool
+generic___test_and_set_bit(unsigned long nr, volatile void *addr)
+{
+    bitops_uint_t mask = BIT_MASK(nr);
+    bitops_uint_t *p = ((bitops_uint_t *)addr) + BIT_WORD(nr);
+    bitops_uint_t old = *p;
+
+    *p = old | mask;
+    return (old & mask) != 0;
+}
+
+/**
+ * generic___test_and_clear_bit - Clear a bit and return its old value
+ * @nr: Bit to clear
+ * @addr: Address to count from
+ *
+ * This operation is non-atomic and can be reordered.
+ * If two examples of this operation race, one can appear to succeed
+ * but actually fail.  You must protect multiple accesses with a lock.
+ */
+static always_inline bool
+generic___test_and_clear_bit(bitops_uint_t nr, volatile void *addr)
+{
+    bitops_uint_t mask = BIT_MASK(nr);
+    bitops_uint_t *p = ((bitops_uint_t *)addr) + BIT_WORD(nr);
+    bitops_uint_t old = *p;
+
+    *p = old & ~mask;
+    return (old & mask) != 0;
+}
+
+/* WARNING: non atomic and it can be reordered! */
+static always_inline bool
+generic___test_and_change_bit(unsigned long nr, volatile void *addr)
+{
+    bitops_uint_t mask = BIT_MASK(nr);
+    bitops_uint_t *p = ((bitops_uint_t *)addr) + BIT_WORD(nr);
+    bitops_uint_t old = *p;
+
+    *p = old ^ mask;
+    return (old & mask) != 0;
+}
+
+#endif /* __ASM_GENERIC_BITOPS_GENERIC_NON_ATOMIC_H */
diff --git a/xen/include/asm-generic/bitops/hweight.h b/xen/include/asm-generic/bitops/hweight.h
new file mode 100644
index 0000000000..0d7577054e
--- /dev/null
+++ b/xen/include/asm-generic/bitops/hweight.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_HWEIGHT_H_
+#define _ASM_GENERIC_BITOPS_HWEIGHT_H_
+
+/*
+ * hweightN - returns the hamming weight of a N-bit word
+ * @x: the word to weigh
+ *
+ * The Hamming Weight of a number is the total number of bits set in it.
+ */
+#define hweight64(x) generic_hweight64(x)
+
+#endif /* _ASM_GENERIC_BITOPS_HWEIGHT_H_ */
diff --git a/xen/include/asm-generic/bitops/test-bit.h b/xen/include/asm-generic/bitops/test-bit.h
new file mode 100644
index 0000000000..6fb414d808
--- /dev/null
+++ b/xen/include/asm-generic/bitops/test-bit.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
+#define _ASM_GENERIC_BITOPS_TESTBIT_H_
+
+#include <asm-generic/bitops/bitops-bits.h>
+
+/**
+ * test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static inline int test_bit(int nr, const volatile void *addr)
+{
+    const volatile bitops_uint_t *p = addr;
+    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
+}
+
+#endif /* _ASM_GENERIC_BITOPS_TESTBIT_H_ */
-- 
2.43.0


