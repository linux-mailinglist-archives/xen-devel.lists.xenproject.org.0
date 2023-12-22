Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3052881CBF3
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659416.1029091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDW-0001cw-4f; Fri, 22 Dec 2023 15:13:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659416.1029091; Fri, 22 Dec 2023 15:13:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDW-0001WW-0U; Fri, 22 Dec 2023 15:13:38 +0000
Received: by outflank-mailman (input) for mailman id 659416;
 Fri, 22 Dec 2023 15:13:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDT-0007Ie-Bo
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:35 +0000
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [2a00:1450:4864:20::129])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac920e5b-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:34 +0100 (CET)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-50e6e7afc6aso248187e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:34 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:32 -0800 (PST)
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
X-Inumbo-ID: ac920e5b-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258014; x=1703862814; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JE4E+ikBT3kCGEtmaswU2jTg1kUfQURiufyZCoF+Bw=;
        b=SpLyBQB0vvB7iwXJddZrKFNigHNDBLqebbJbR5pbZVqzCXYR0YthCVBXlvnO7uJ+0l
         ysqG8EXslSCby8rT0rkO2HeaWc8o9sahqgcVfFtwz8x9g8v3NEhwBKUKlAM+M7rza+Tu
         donQQt/c5cwJNG6gj3SEMkI/lk5m0VZy/9fk8dnl0Q3U5TsLKsylnEWAPGlbo/7m+Pow
         dpFNV2pXVJB3F+IMLTbNlD5uAk7ng9EXb68xG+/19re4EBQvLRa7lB0KnT+YQCZFg0RK
         HhVdyl3kAsflV4B+oJSxB6/tZ0bIzve180cRW4Kn2QhJH7tpdXkt+1QrFWeAmDvCUvii
         prmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258014; x=1703862814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2JE4E+ikBT3kCGEtmaswU2jTg1kUfQURiufyZCoF+Bw=;
        b=SlcJ70GL+42Jwwjudt19lZOYmMk9tcz6JPB5/e+FX5uEx8j92yJ1Ls6xKFcNj1SjXl
         sH226+YdL81/tDSGgbk4Qpzfv/oyg05BLlR2FwKMguPaiTltU+8kebWE4slSSTtiStj1
         ncAGAw2VsH4e2s+AIKcYTud9uKW5b6X/rplgV+oOJlJ7beyrIODPdEkW3tCj+xZO9AL1
         YLKY6DwvVYPPvz5j1Y3qt+XIb9AnZV4yV9tbe51mzPR+WbU3h/pISi9xp8pXRYNOmZ4D
         YEiNlDK5WOU2KH1IHJh/rxi+mSjCTIMZHzmyPBPK/rRbOkrstphWXBuow/GR6+YXRiAB
         vndQ==
X-Gm-Message-State: AOJu0YxNiXfSyLG/FqDoriJ1MHVtXhPZ1hhhAGNKZPs3EASNnTAHGRz9
	KKGyHN5KHWT7IufUKTjGMEgpDpV3CqE=
X-Google-Smtp-Source: AGHT+IGpd/0hiB+zCZilXc4I6ZZfGlmkv6Pk7jLrKmo5auefyzV8pg3QMFMrfPUbTX4YIECUkj/dQg==
X-Received: by 2002:a05:6512:311b:b0:50e:6888:78d5 with SMTP id n27-20020a056512311b00b0050e688878d5mr769196lfb.3.1703258013676;
        Fri, 22 Dec 2023 07:13:33 -0800 (PST)
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
Subject: [PATCH v3 10/34] xen/riscv: introduce bitops.h
Date: Fri, 22 Dec 2023 17:12:54 +0200
Message-ID: <841d59c3950970f4937da200cf8f04aa39132e14.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Taken from Linux-6.4.0-rc1

Xen's bitops.h consists of several Linux's headers:
* linux/arch/include/asm/bitops.h:
  * The following function were removed as they aren't used in Xen:
      	* test_and_change_bit
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
* linux/include/asm-generic/bitops/find.h ( only few function
  declaration were taken, as implementation will be provided by
  Xen ).
* linux/arch/include/linux/bits.h ( taken only definitions for BIT_MASK,
  BIT_WORD, BITS_PER_BYTE )

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
 xen/arch/riscv/include/asm/bitops.h           | 267 ++++++++++++++++++
 xen/include/asm-generic/bitops/bitops-bits.h  |  10 +
 xen/include/asm-generic/bitops/ffs.h          |   9 +
 xen/include/asm-generic/bitops/ffz.h          |  13 +
 .../asm-generic/bitops/find-first-bit-set.h   |  17 ++
 xen/include/asm-generic/bitops/fls.h          |  18 ++
 xen/include/asm-generic/bitops/flsl.h         |  10 +
 xen/include/asm-generic/bitops/hweight.h      |  13 +
 xen/include/asm-generic/bitops/test-bit.h     |  16 ++
 9 files changed, 373 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h
 create mode 100644 xen/include/asm-generic/bitops/bitops-bits.h
 create mode 100644 xen/include/asm-generic/bitops/ffs.h
 create mode 100644 xen/include/asm-generic/bitops/ffz.h
 create mode 100644 xen/include/asm-generic/bitops/find-first-bit-set.h
 create mode 100644 xen/include/asm-generic/bitops/fls.h
 create mode 100644 xen/include/asm-generic/bitops/flsl.h
 create mode 100644 xen/include/asm-generic/bitops/hweight.h
 create mode 100644 xen/include/asm-generic/bitops/test-bit.h

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..d210f529c8
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,267 @@
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
+#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
+({								\
+    unsigned long __res, __mask;				\
+    __mask = BIT_MASK(nr);					\
+    __asm__ __volatile__ (					\
+        __AMO(op) #ord " %0, %2, %1"			\
+        : "=r" (__res), "+A" (addr[BIT_WORD(nr)])	\
+        : "r" (mod(__mask))				\
+        : "memory");					\
+    ((__res & __mask) != 0);				\
+})
+
+#define __op_bit_ord(op, mod, nr, addr, ord)			\
+    __asm__ __volatile__ (					\
+        __AMO(op) #ord " zero, %1, %0"			\
+        : "+A" (addr[BIT_WORD(nr)])			\
+        : "r" (mod(BIT_MASK(nr)))			\
+        : "memory");
+
+#define __test_and_op_bit(op, mod, nr, addr) 			\
+    __test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
+#define __op_bit(op, mod, nr, addr)				\
+    __op_bit_ord(op, mod, nr, addr, )
+
+/* Bitmask modifiers */
+#define __NOP(x)	(x)
+#define __NOT(x)	(~(x))
+
+/**
+ * __test_and_set_bit - Set a bit and return its old value
+ * @nr: Bit to set
+ * @addr: Address to count from
+ *
+ * This operation may be reordered on other architectures than x86.
+ */
+static inline int __test_and_set_bit(int nr, volatile void *p)
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
+static inline int __test_and_clear_bit(int nr, volatile void *p)
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
+#undef __test_and_op_bit
+#undef __op_bit
+#undef __NOP
+#undef __NOT
+#undef __AMO
+
+#define test_and_set_bit   __test_and_set_bit
+#define test_and_clear_bit __test_and_clear_bit
+
+/* Based on linux/include/asm-generic/bitops/find.h */
+
+#ifndef find_next_bit
+/**
+ * find_next_bit - find the next set bit in a memory region
+ * @addr: The address to base the search on
+ * @offset: The bitnumber to start searching at
+ * @size: The bitmap size in bits
+ */
+extern unsigned long find_next_bit(const unsigned long *addr, unsigned long
+        size, unsigned long offset);
+#endif
+
+#ifndef find_next_zero_bit
+/**
+ * find_next_zero_bit - find the next cleared bit in a memory region
+ * @addr: The address to base the search on
+ * @offset: The bitnumber to start searching at
+ * @size: The bitmap size in bits
+ */
+extern unsigned long find_next_zero_bit(const unsigned long *addr, unsigned
+        long size, unsigned long offset);
+#endif
+
+/**
+ * find_first_bit - find the first set bit in a memory region
+ * @addr: The address to start the search at
+ * @size: The maximum size to search
+ *
+ * Returns the bit number of the first set bit.
+ */
+extern unsigned long find_first_bit(const unsigned long *addr,
+                    unsigned long size);
+
+/**
+ * find_first_zero_bit - find the first cleared bit in a memory region
+ * @addr: The address to start the search at
+ * @size: The maximum size to search
+ *
+ * Returns the bit number of the first cleared bit.
+ */
+extern unsigned long find_first_zero_bit(const unsigned long *addr,
+                     unsigned long size);
+
+/**
+ * ffs - find first bit in word.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned long __ffs(unsigned long word)
+{
+    int num = 0;
+
+#if BITS_PER_LONG == 64
+    if ((word & 0xffffffff) == 0) {
+        num += 32;
+        word >>= 32;
+    }
+#endif
+    if ((word & 0xffff) == 0) {
+        num += 16;
+        word >>= 16;
+    }
+    if ((word & 0xff) == 0) {
+        num += 8;
+        word >>= 8;
+    }
+    if ((word & 0xf) == 0) {
+        num += 4;
+        word >>= 4;
+    }
+    if ((word & 0x3) == 0) {
+        num += 2;
+        word >>= 2;
+    }
+    if ((word & 0x1) == 0)
+        num += 1;
+    return num;
+}
+
+/**
+ * ffsl - find first bit in long.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned int ffsl(unsigned long word)
+{
+    int num = 1;
+
+    if (!word)
+        return 0;
+
+#if BITS_PER_LONG == 64
+    if ((word & 0xffffffff) == 0) {
+        num += 32;
+        word >>= 32;
+    }
+#endif
+    if ((word & 0xffff) == 0) {
+        num += 16;
+        word >>= 16;
+    }
+    if ((word & 0xff) == 0) {
+        num += 8;
+        word >>= 8;
+    }
+    if ((word & 0xf) == 0) {
+        num += 4;
+        word >>= 4;
+    }
+    if ((word & 0x3) == 0) {
+        num += 2;
+        word >>= 2;
+    }
+    if ((word & 0x1) == 0)
+        num += 1;
+    return num;
+}
+
+#include <asm-generic/bitops/fls.h>
+#include <asm-generic/bitops/flsl.h>
+#include <asm-generic/bitops/ffs.h>
+#include <asm-generic/bitops/ffz.h>
+#include <asm-generic/bitops/find-first-bit-set.h>
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
diff --git a/xen/include/asm-generic/bitops/bitops-bits.h b/xen/include/asm-generic/bitops/bitops-bits.h
new file mode 100644
index 0000000000..8a57e47c63
--- /dev/null
+++ b/xen/include/asm-generic/bitops/bitops-bits.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_BITS_H_
+#define _ASM_GENERIC_BITOPS_BITS_H_
+
+#define BITOP_BITS_PER_WORD     32
+#define BITOP_MASK(nr)          (1UL << ((nr) % BITOP_BITS_PER_WORD))
+#define BITOP_WORD(nr)          ((nr) / BITOP_BITS_PER_WORD)
+#define BITS_PER_BYTE           8
+
+#endif /* _ASM_GENERIC_BITOPS_BITS_H_ */
\ No newline at end of file
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
diff --git a/xen/include/asm-generic/bitops/ffz.h b/xen/include/asm-generic/bitops/ffz.h
new file mode 100644
index 0000000000..92c35455d5
--- /dev/null
+++ b/xen/include/asm-generic/bitops/ffz.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FFZ_H_
+#define _ASM_GENERIC_BITOPS_FFZ_H_
+
+/*
+ * ffz - find first zero in word.
+ * @word: The word to search
+ *
+ * Undefined if no zero exists, so code should check against ~0UL first.
+ */
+#define ffz(x)  __ffs(~(x))
+
+#endif /* _ASM_GENERIC_BITOPS_FFZ_H_ */
\ No newline at end of file
diff --git a/xen/include/asm-generic/bitops/find-first-bit-set.h b/xen/include/asm-generic/bitops/find-first-bit-set.h
new file mode 100644
index 0000000000..8ae9751b11
--- /dev/null
+++ b/xen/include/asm-generic/bitops/find-first-bit-set.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_FIND_FIRST_BIT_SET_H_
+#define _ASM_GENERIC_BITOPS_FIND_FIRST_BIT_SET_H_
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
+#endif /* _ASM_GENERIC_BITOPS_FIND_FIRST_BIT_SET_H_ */
\ No newline at end of file
diff --git a/xen/include/asm-generic/bitops/fls.h b/xen/include/asm-generic/bitops/fls.h
new file mode 100644
index 0000000000..f232925080
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
\ No newline at end of file
diff --git a/xen/include/asm-generic/bitops/flsl.h b/xen/include/asm-generic/bitops/flsl.h
new file mode 100644
index 0000000000..127221056e
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
\ No newline at end of file
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
index 0000000000..9fa36652e3
--- /dev/null
+++ b/xen/include/asm-generic/bitops/test-bit.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_GENERIC_BITOPS_TESTBIT_H_
+#define _ASM_GENERIC_BITOPS_TESTBIT_H_
+
+/**
+ * test_bit - Determine whether a bit is set
+ * @nr: bit number to test
+ * @addr: Address to start counting from
+ */
+static inline int test_bit(int nr, const volatile void *addr)
+{
+    const volatile unsigned int *p = addr;
+    return 1 & (p[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD - 1)));
+}
+
+#endif /* _ASM_GENERIC_BITOPS_TESTBIT_H_ */
\ No newline at end of file
-- 
2.43.0


