Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F857F71AC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:40:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640438.998687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbG-0006pj-6i; Fri, 24 Nov 2023 10:39:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640438.998687; Fri, 24 Nov 2023 10:39:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TbG-0006iP-2a; Fri, 24 Nov 2023 10:39:54 +0000
Received: by outflank-mailman (input) for mailman id 640438;
 Fri, 24 Nov 2023 10:39:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTB-0006hy-80
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:33 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2b94eba-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:32 +0100 (CET)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a00c200782dso254455666b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:32 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:31 -0800 (PST)
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
X-Inumbo-ID: a2b94eba-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821891; x=1701426691; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0V+5S8U4gOZUoEwGD71e+WEGaWmpek3DzntqBhyokA=;
        b=ax5M9HFOrr1+ebpURsHh3hX7bCKHrB6bYI0EYJYEdI7l/EEpY/i0FuwmvbthTysINt
         XEWFtty6RKKkFhPpkKGV4hqLkIxHTTRuc3h96mdHEuKii793dA0zeMFVJlU/5FBDcflv
         uRV0NPnIai48UHt1l9weqsnNIwuTB3NL//1MxVCOfifIHTzZfkaEVYGiG8HCi1RT2AJl
         dBW4Xk1Kb5K/yA7YDga9yT2EaOnGSpjQENNilikAWLWAGCYI8xcUASQDkjnkdT8iHzBx
         rdZx34Memz+olA8tW8dtyquAd3NmaSd6MTWDs6/gnUWho0wcotJUcgnIZbEzok+vTRcj
         k13Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821891; x=1701426691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0V+5S8U4gOZUoEwGD71e+WEGaWmpek3DzntqBhyokA=;
        b=bHbBoLT9pZ7AKmSgIAA8SpQi1nvQ2V0YapPm/8xzU7y9cQorV7/eILSeBC0HvjryYF
         mr95ODhViXv2d5F5wLNNIdqeFSorCYmEWex5notVo6xZWWgXZRNBNgE0xlTkyiGRfeUr
         gKdxBD4uvjo909M8B91aiL8r+11DQKtYiCNpAqvijZWfUiiqsW3Lt+PHoXhyiqBOFmG5
         U4C8Hc+6AtdapEqbZBgQD0NPdpkwXhL/KElUcrX/x2l0k5Qep+4edCDc/l4JSlEHtFgC
         MHR7gqsFJvl+F3G76RiU7PbZn0YADQHG0QACFPRw4ce+BFsBv6f8Nwjmo4f+meOTVG0K
         fLmw==
X-Gm-Message-State: AOJu0YzwhubqHsC+SzNjaraM2a5c2kiS5obqtqjV6J8fPU1gTQWXrbMe
	LJU+jPeHrtbi9fNylzNaaRwDh5eZxnReRg==
X-Google-Smtp-Source: AGHT+IH/GAOh8Kpk2bWC0miN/+Y2n1wlkrcA/6D90k406fXKp10il+UnUUrRo4C+fZsNj9gor8lTHw==
X-Received: by 2002:a17:906:118:b0:9e4:6ff2:131a with SMTP id 24-20020a170906011800b009e46ff2131amr1712667eje.48.1700821891564;
        Fri, 24 Nov 2023 02:31:31 -0800 (PST)
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
Subject: [PATCH v2 21/39] xen/riscv: introduce bit operations
Date: Fri, 24 Nov 2023 12:30:41 +0200
Message-ID: <20732007fb103115c0e01cefea7d113b8a7ad8e9.1700761381.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/Makefile            |   1 +
 xen/arch/riscv/lib/Makefile        |   1 +
 xen/arch/riscv/lib/find_next_bit.c | 278 +++++++++++++++++++++++++++++
 3 files changed, 280 insertions(+)
 create mode 100644 xen/arch/riscv/lib/Makefile
 create mode 100644 xen/arch/riscv/lib/find_next_bit.c

diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
index 2fefe14e7c..b08048948f 100644
--- a/xen/arch/riscv/Makefile
+++ b/xen/arch/riscv/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += entry.o
+obj-y += lib/
 obj-y += mm.o
 obj-$(CONFIG_RISCV_64) += riscv64/
 obj-y += sbi.o
diff --git a/xen/arch/riscv/lib/Makefile b/xen/arch/riscv/lib/Makefile
new file mode 100644
index 0000000000..6fae6a1f10
--- /dev/null
+++ b/xen/arch/riscv/lib/Makefile
@@ -0,0 +1 @@
+obj-y += find_next_bit.o
diff --git a/xen/arch/riscv/lib/find_next_bit.c b/xen/arch/riscv/lib/find_next_bit.c
new file mode 100644
index 0000000000..ac5a4687e3
--- /dev/null
+++ b/xen/arch/riscv/lib/find_next_bit.c
@@ -0,0 +1,278 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * find_next_bit.c: fallback find next bit implementation
+ *
+ * Copyright (C) 2004 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ */
+#include <xen/bitops.h>
+#include <asm/types.h>
+#include <asm/byteorder.h>
+
+#ifndef find_next_bit
+/*
+ * Find the next set bit in a memory region.
+ */
+unsigned long find_next_bit(const unsigned long *addr, unsigned long size,
+			    unsigned long offset)
+{
+	const unsigned long *p = addr + BIT_WORD(offset);
+	unsigned long result = offset & ~(BITS_PER_LONG-1);
+	unsigned long tmp;
+
+	if (offset >= size)
+		return size;
+	size -= result;
+	offset %= BITS_PER_LONG;
+	if (offset) {
+		tmp = *(p++);
+		tmp &= (~0UL << offset);
+		if (size < BITS_PER_LONG)
+			goto found_first;
+		if (tmp)
+			goto found_middle;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
+	}
+	while (size & ~(BITS_PER_LONG-1)) {
+		if ((tmp = *(p++)))
+			goto found_middle;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+	tmp = *p;
+
+found_first:
+	tmp &= (~0UL >> (BITS_PER_LONG - size));
+	if (tmp == 0UL)		/* Are any bits set? */
+		return result + size;	/* Nope. */
+found_middle:
+	return result + __ffs(tmp);
+}
+EXPORT_SYMBOL(find_next_bit);
+#endif
+
+#ifndef find_next_zero_bit
+/*
+ * This implementation of find_{first,next}_zero_bit was stolen from
+ * Linus' asm-alpha/bitops.h.
+ */
+unsigned long find_next_zero_bit(const unsigned long *addr, unsigned long size,
+				 unsigned long offset)
+{
+	const unsigned long *p = addr + BIT_WORD(offset);
+	unsigned long result = offset & ~(BITS_PER_LONG-1);
+	unsigned long tmp;
+
+	if (offset >= size)
+		return size;
+	size -= result;
+	offset %= BITS_PER_LONG;
+	if (offset) {
+		tmp = *(p++);
+		tmp |= ~0UL >> (BITS_PER_LONG - offset);
+		if (size < BITS_PER_LONG)
+			goto found_first;
+		if (~tmp)
+			goto found_middle;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
+	}
+	while (size & ~(BITS_PER_LONG-1)) {
+		if (~(tmp = *(p++)))
+			goto found_middle;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+	tmp = *p;
+
+found_first:
+	tmp |= ~0UL << size;
+	if (tmp == ~0UL)	/* Are any bits zero? */
+		return result + size;	/* Nope. */
+found_middle:
+	return result + ffz(tmp);
+}
+EXPORT_SYMBOL(find_next_zero_bit);
+#endif
+
+#ifndef find_first_bit
+/*
+ * Find the first set bit in a memory region.
+ */
+unsigned long find_first_bit(const unsigned long *addr, unsigned long size)
+{
+	const unsigned long *p = addr;
+	unsigned long result = 0;
+	unsigned long tmp;
+
+	while (size & ~(BITS_PER_LONG-1)) {
+		if ((tmp = *(p++)))
+			goto found;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+
+	tmp = (*p) & (~0UL >> (BITS_PER_LONG - size));
+	if (tmp == 0UL)		/* Are any bits set? */
+		return result + size;	/* Nope. */
+found:
+	return result + __ffs(tmp);
+}
+EXPORT_SYMBOL(find_first_bit);
+#endif
+
+#ifndef find_first_zero_bit
+/*
+ * Find the first cleared bit in a memory region.
+ */
+unsigned long find_first_zero_bit(const unsigned long *addr, unsigned long size)
+{
+	const unsigned long *p = addr;
+	unsigned long result = 0;
+	unsigned long tmp;
+
+	while (size & ~(BITS_PER_LONG-1)) {
+		if (~(tmp = *(p++)))
+			goto found;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+
+	tmp = (*p) | (~0UL << size);
+	if (tmp == ~0UL)	/* Are any bits zero? */
+		return result + size;	/* Nope. */
+found:
+	return result + ffz(tmp);
+}
+EXPORT_SYMBOL(find_first_zero_bit);
+#endif
+
+#ifdef __BIG_ENDIAN
+
+/* include/linux/byteorder does not support "unsigned long" type */
+static inline unsigned long ext2_swabp(const unsigned long * x)
+{
+#if BITS_PER_LONG == 64
+	return (unsigned long) __swab64p((u64 *) x);
+#elif BITS_PER_LONG == 32
+	return (unsigned long) __swab32p((u32 *) x);
+#else
+#error BITS_PER_LONG not defined
+#endif
+}
+
+/* include/linux/byteorder doesn't support "unsigned long" type */
+static inline unsigned long ext2_swab(const unsigned long y)
+{
+#if BITS_PER_LONG == 64
+	return (unsigned long) __swab64((u64) y);
+#elif BITS_PER_LONG == 32
+	return (unsigned long) __swab32((u32) y);
+#else
+#error BITS_PER_LONG not defined
+#endif
+}
+
+#ifndef find_next_zero_bit_le
+unsigned long find_next_zero_bit_le(const void *addr, unsigned
+		long size, unsigned long offset)
+{
+	const unsigned long *p = addr;
+	unsigned long result = offset & ~(BITS_PER_LONG - 1);
+	unsigned long tmp;
+
+	if (offset >= size)
+		return size;
+	p += BIT_WORD(offset);
+	size -= result;
+	offset &= (BITS_PER_LONG - 1UL);
+	if (offset) {
+		tmp = ext2_swabp(p++);
+		tmp |= (~0UL >> (BITS_PER_LONG - offset));
+		if (size < BITS_PER_LONG)
+			goto found_first;
+		if (~tmp)
+			goto found_middle;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
+	}
+
+	while (size & ~(BITS_PER_LONG - 1)) {
+		if (~(tmp = *(p++)))
+			goto found_middle_swap;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+	tmp = ext2_swabp(p);
+found_first:
+	tmp |= ~0UL << size;
+	if (tmp == ~0UL)	/* Are any bits zero? */
+		return result + size; /* Nope. Skip ffz */
+found_middle:
+	return result + ffz(tmp);
+
+found_middle_swap:
+	return result + ffz(ext2_swab(tmp));
+}
+EXPORT_SYMBOL(find_next_zero_bit_le);
+#endif
+
+#ifndef find_next_bit_le
+unsigned long find_next_bit_le(const void *addr, unsigned
+		long size, unsigned long offset)
+{
+	const unsigned long *p = addr;
+	unsigned long result = offset & ~(BITS_PER_LONG - 1);
+	unsigned long tmp;
+
+	if (offset >= size)
+		return size;
+	p += BIT_WORD(offset);
+	size -= result;
+	offset &= (BITS_PER_LONG - 1UL);
+	if (offset) {
+		tmp = ext2_swabp(p++);
+		tmp &= (~0UL << offset);
+		if (size < BITS_PER_LONG)
+			goto found_first;
+		if (tmp)
+			goto found_middle;
+		size -= BITS_PER_LONG;
+		result += BITS_PER_LONG;
+	}
+
+	while (size & ~(BITS_PER_LONG - 1)) {
+		tmp = *(p++);
+		if (tmp)
+			goto found_middle_swap;
+		result += BITS_PER_LONG;
+		size -= BITS_PER_LONG;
+	}
+	if (!size)
+		return result;
+	tmp = ext2_swabp(p);
+found_first:
+	tmp &= (~0UL >> (BITS_PER_LONG - size));
+	if (tmp == 0UL)		/* Are any bits set? */
+		return result + size; /* Nope. */
+found_middle:
+	return result + __ffs(tmp);
+
+found_middle_swap:
+	return result + __ffs(ext2_swab(tmp));
+}
+EXPORT_SYMBOL(find_next_bit_le);
+#endif
+
+#endif /* __BIG_ENDIAN */
-- 
2.42.0


