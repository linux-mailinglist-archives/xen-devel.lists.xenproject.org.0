Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 335BC7F71A7
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640425.998636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tap-0004f1-9c; Fri, 24 Nov 2023 10:39:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640425.998636; Fri, 24 Nov 2023 10:39:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Tap-0004cW-6N; Fri, 24 Nov 2023 10:39:27 +0000
Received: by outflank-mailman (input) for mailman id 640425;
 Fri, 24 Nov 2023 10:39:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TT4-0006hy-0X
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:26 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e3929cc-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:24 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a0064353af8so547461766b.0
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:24 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:23 -0800 (PST)
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
X-Inumbo-ID: 9e3929cc-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821884; x=1701426684; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFiYo47Y6neKV/659IAnBCy68zaLkdoQh7hTdkj2HW4=;
        b=U86bwtG2XyFPrSIJtdcxX1Z8MoFNT0T8Op9jGXFO1qR7e9Fs/Zkg7y9rWN08GqR8Yx
         HuZF7HkzTd5+RUrQ1Ctb2zu7Wdoe2ChVdsJs38uBp2RgygrCFcfVvo7s0hULqUdwoxcn
         UE66eo8A5xKaeXYm3X663GR1+QR7HCXNGohh4Qn4RBTjSyjDZyB4J9DJCVflbxjnqRhG
         Xhj8YKGVmutSDJYjP82mp/vlpaiqFhgHsAVGYdX5Su4nqYdpI3ZjSfkS408l8m3WjJU8
         McL7w7I6MMShLCewjgpG61P+pvlF3WVKMiVoMNDrYXYI4ftKr2eAyRh2euoJeMJgyrPu
         cCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821884; x=1701426684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TFiYo47Y6neKV/659IAnBCy68zaLkdoQh7hTdkj2HW4=;
        b=dLfL6tBv014UIwe6aqLQUfbC0osDPsHOaqil8g/tBayL8pkMcshAtgmVbG6Vt4nBCF
         D9i3nxgWN1LXWHbTXF6OUX7Z9muxA0eRMOUkjwRmE26tmh0xpdtCK1h7l9XT2yWhwFDp
         SUCeA68SxUss+dYB+9179JqZfO9go32o1Qxs5DlkW/CmHj9Mdgr8LSBCs5vhkFSjCB5w
         yJNeANr1/wMUcjOSCidcupck1lXzNgAlLFE7eVI3rUt8tcCeci6GcBOOO4vfs6Y/lufo
         4AtXwu529ShZzGAoSnWhHdAYmFze7+INZTWaLBFD3JzIpaxxi3g5r0A9W8HCaJ+Nxhbt
         hz6A==
X-Gm-Message-State: AOJu0Yw1hGUHSRe0DQmYjHCpxCBCKXIfd/bU8YjyfRNNWnsPCzcd7/ZT
	ybisu/7Yta2O34BPIG4wh16MwROaLgv41Q==
X-Google-Smtp-Source: AGHT+IFNByZwBF9ROP5nmS5akxwitHaYUUyJjesb1JJXQW8zGkCDI8+PSeS/4s2MUQuUSPrJWQd+tA==
X-Received: by 2002:a17:906:10cf:b0:9ee:295:5693 with SMTP id v15-20020a17090610cf00b009ee02955693mr1735649ejv.7.1700821884099;
        Fri, 24 Nov 2023 02:31:24 -0800 (PST)
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
Subject: [PATCH v2 14/39] xen/riscv: introduce bitops.h
Date: Fri, 24 Nov 2023 12:30:34 +0200
Message-ID: <a9c69e17fe073551e7007242d00b74b6333ce98d.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
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
2.42.0


