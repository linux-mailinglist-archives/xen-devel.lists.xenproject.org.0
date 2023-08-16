Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A091D77DEA7
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:30:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584380.915074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDn0-0006mP-0L; Wed, 16 Aug 2023 10:30:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584380.915074; Wed, 16 Aug 2023 10:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDmz-0006fv-Qa; Wed, 16 Aug 2023 10:30:09 +0000
Received: by outflank-mailman (input) for mailman id 584380;
 Wed, 16 Aug 2023 10:30:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdj-0003RA-8a
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:35 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 888825d3-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:33 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso57886275e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:33 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:32 -0700 (PDT)
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
X-Inumbo-ID: 888825d3-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181232; x=1692786032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BodjPyF7hN8jFqrTn+1wj+bOMAjusyYyrqc8QFB1jzg=;
        b=HkCDgi9n6tQ9C5lhIXzCr0+DfllFxPGuvYsvQtmqnI5WsochgUvv3ml9sG2Q4NhcB0
         E85NOg9VJXG/Q7QD6HbvOuQeQOF3cTjyf2PDhr8f7ZM/7fbYLBSU8ORLuS45UKdiOsiB
         6oBW8OM9Hkt8B+Cthj88IQhzheMT3LB2XbLj7CViWYSXRPtCq8ziLqD0lixKnLqxzxk5
         VHIFH+8tf+HYaXJQpZFV7Mj7Tm5I0M+XGV58pHm2ytNqSsODnjUCim+mdbhBDS79jdhD
         OtUWZDUaAxawoA5BAsMPAY/V7F70s29p0O7ebvJ6zucso2EMPJKOKNhRMT/PAoMYcRF7
         rnaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181232; x=1692786032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BodjPyF7hN8jFqrTn+1wj+bOMAjusyYyrqc8QFB1jzg=;
        b=Nj/+zmTtXlURKwrcjfev2GXu8jODuTTSboIriY6rAfqP4g4ykhPD1HBdSNOoOh1UJG
         Df5ZVillNt7U2HS+XGXDZCI4YB+vqImJloWLPFd1i5BE5BDm3kaUFrQeeRWx4A6BIOrI
         tDkhYirK1nC87Cxbj9anLDojxfbGn7nRiALswF1YJwndWLSKKGVdqNbgCk02RDWCEITb
         L7qEKrFszWasA7gA46zWWWj+l9KBAVer5TBQE0Y1/VpSxPm2Et26ugfyiO5mycEl1WmN
         wzEZv+3DlXh9CeuYowlKwefFLyRhrvUW/+Rbzq/cANVgc/bHTf4BGMdgi7H/IdiMISuP
         LXKA==
X-Gm-Message-State: AOJu0YzthjUEDahYSX/sp6Uraj6Iy6d0GA6tWV9V6qVrMuonkmCYKgaT
	vj7GflDhTuglyOXJGLfiyUZBiyRbs2nbZyin
X-Google-Smtp-Source: AGHT+IEOP8bGGJYZcq2WSde23c5qTD6mqb270EoUzb1fPrG7QDm8CUAKy998B8RfVbu6mEInkSyz3g==
X-Received: by 2002:a05:600c:204e:b0:3fe:21c2:7d81 with SMTP id p14-20020a05600c204e00b003fe21c27d81mr1114591wmg.35.1692181232458;
        Wed, 16 Aug 2023 03:20:32 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 22/57] xen/riscv: introduce bitops.h
Date: Wed, 16 Aug 2023 13:19:33 +0300
Message-ID: <dd73d5d8ff46c1037845b0535349aa835abff495.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/bitops.h | 288 ++++++++++++++++++++++++++++
 1 file changed, 288 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/bitops.h

diff --git a/xen/arch/riscv/include/asm/bitops.h b/xen/arch/riscv/include/asm/bitops.h
new file mode 100644
index 0000000000..24a49c499b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/bitops.h
@@ -0,0 +1,288 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2012 Regents of the University of California */
+
+#ifndef _ASM_RISCV_BITOPS_H
+#define _ASM_RISCV_BITOPS_H
+
+#include <asm/system.h>
+
+#define BITOP_BITS_PER_WORD     32
+#define BITOP_MASK(nr)	        (1UL << ((nr) % BITOP_BITS_PER_WORD))
+#define BITOP_WORD(nr)	        ((nr) / BITOP_BITS_PER_WORD)
+#define BITS_PER_BYTE	        8
+
+#define __set_bit(n,p)          set_bit(n,p)
+#define __clear_bit(n,p)        clear_bit(n,p)
+
+#define __AMO(op)	"amo" #op ".w"
+
+#define __test_and_op_bit_ord(op, mod, nr, addr, ord)		\
+({								\
+	unsigned long __res, __mask;				\
+	__mask = BITOP_MASK(nr);					\
+	__asm__ __volatile__ (					\
+		__AMO(op) #ord " %0, %2, %1"			\
+		: "=r" (__res), "+A" (addr[BITOP_WORD(nr)])	\
+		: "r" (mod(__mask))				\
+		: "memory");					\
+	((__res & __mask) != 0);				\
+})
+
+#define __op_bit_ord(op, mod, nr, addr, ord)			\
+	__asm__ __volatile__ (					\
+		__AMO(op) #ord " zero, %1, %0"			\
+		: "+A" (addr[BITOP_WORD(nr)])			\
+		: "r" (mod(BITOP_MASK(nr)))			\
+		: "memory");
+
+#define __test_and_op_bit(op, mod, nr, addr) 			\
+	__test_and_op_bit_ord(op, mod, nr, addr, .aqrl)
+
+#define __op_bit(op, mod, nr, addr)				\
+	__op_bit_ord(op, mod, nr, addr, )
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
+	volatile uint32_t *addr = p;
+
+	return __test_and_op_bit(or, __NOP, nr, addr);
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
+	volatile uint32_t *addr = p;
+
+	return __test_and_op_bit(and, __NOT, nr, addr);
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
+	volatile uint32_t *addr = p;
+
+	__op_bit(or, __NOP, nr, addr);
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
+	volatile uint32_t *addr = p;
+
+	__op_bit(and, __NOT, nr, addr);
+}
+
+static inline int test_bit(int nr, const volatile void *p)
+{
+	const volatile uint32_t *addr = (const volatile uint32_t *)p;
+
+	return 1UL & (addr[BITOP_WORD(nr)] >> (nr & (BITOP_BITS_PER_WORD-1)));
+}
+
+#undef __test_and_op_bit
+#undef __op_bit
+#undef __NOP
+#undef __NOT
+#undef __AMO
+
+static inline int fls(unsigned int x)
+{
+    return generic_fls(x);
+}
+
+static inline int flsl(unsigned long x)
+{
+    return generic_flsl(x);
+}
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
+		size, unsigned long offset);
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
+		long size, unsigned long offset);
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
+				    unsigned long size);
+
+/**
+ * find_first_zero_bit - find the first cleared bit in a memory region
+ * @addr: The address to start the search at
+ * @size: The maximum size to search
+ *
+ * Returns the bit number of the first cleared bit.
+ */
+extern unsigned long find_first_zero_bit(const unsigned long *addr,
+					 unsigned long size);
+
+#define ffs(x) ({ unsigned int __t = (x); fls(__t & -__t); })
+
+/**
+ * ffs - find first bit in word.
+ * @word: The word to search
+ *
+ * Returns 0 if no bit exists, otherwise returns 1-indexed bit location.
+ */
+static inline unsigned long __ffs(unsigned long word)
+{
+	int num = 0;
+
+#if BITS_PER_LONG == 64
+	if ((word & 0xffffffff) == 0) {
+		num += 32;
+		word >>= 32;
+	}
+#endif
+	if ((word & 0xffff) == 0) {
+		num += 16;
+		word >>= 16;
+	}
+	if ((word & 0xff) == 0) {
+		num += 8;
+		word >>= 8;
+	}
+	if ((word & 0xf) == 0) {
+		num += 4;
+		word >>= 4;
+	}
+	if ((word & 0x3) == 0) {
+		num += 2;
+		word >>= 2;
+	}
+	if ((word & 0x1) == 0)
+		num += 1;
+	return num;
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
+/*
+ * ffz - find first zero in word.
+ * @word: The word to search
+ *
+ * Undefined if no zero exists, so code should check against ~0UL first.
+ */
+#define ffz(x)  __ffs(~(x))
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
+/**
+ * hweightN - returns the hamming weight of a N-bit word
+ * @x: the word to weigh
+ *
+ * The Hamming Weight of a number is the total number of bits set in it.
+ */
+#define hweight64(x) generic_hweight64(x)
+
+#endif /* _ASM_RISCV_BITOPS_H */
-- 
2.41.0


