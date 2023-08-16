Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDBA77DED4
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:33:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584540.915467 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDph-0003ai-3d; Wed, 16 Aug 2023 10:32:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584540.915467; Wed, 16 Aug 2023 10:32:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDpg-0003Wu-Vo; Wed, 16 Aug 2023 10:32:56 +0000
Received: by outflank-mailman (input) for mailman id 584540;
 Wed, 16 Aug 2023 10:32:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdw-0003RA-11
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:48 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8dbaca2d-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:42 +0200 (CEST)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3197b461bb5so2203182f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:42 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:40 -0700 (PDT)
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
X-Inumbo-ID: 8dbaca2d-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181241; x=1692786041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeCsLtvDCyT32A3FOXuYg+gr5XNtFdVisCuwj+PGRb4=;
        b=du5yjxIoyISeBHtmLt0EgW8TPB1X3CQ3eb4cs6NheiY/8Y/h4LUusXSat2XsjZ7XRY
         uXtyQk7Bl7CXMRZWV9wSSprIstx35W79L1OG7evvc5GOWhvsR91o0jfyJbSUr5VlK9uT
         5VCCZ5KRBmg7FwjLMBmDuG6dAJExrKNeev/23dbcASTqFXQR2zsgdderg9y4UJi9Ubqv
         c//ZCOh74XWZXR9cdjEqDEBzUM4xfRMGcnFHEn16ybTvukuYdbi5ERfkGlJjzScUVU9+
         zlQztkgtf2DH58f0N7hmHIwMopk+upUiCFxDrmj7Vj4//AVegoMD4r9LHrxIunQxjyIC
         9bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181241; x=1692786041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeCsLtvDCyT32A3FOXuYg+gr5XNtFdVisCuwj+PGRb4=;
        b=ekZWoWWaybqPCeMnCOD4DJ9Wv9Cl4iRuC1+2bXZqWZG+s9yNL9+Aqr6Dc0qZ//ZwO/
         8y7JEvGLNzHYmpUspiNiPtrv5nOZyXGmQHT7jvh6S+jBujxdczb4Ddy8PsfLx4bXghwT
         8ca4igRwqr55fV6eVbI0r5TGuFMfcfHg4lin1A4YTQcPGI6X+gZsIFD5/cssAlyIFjeB
         zT7D+7MUzJNotgy7syP7GdcgzB3wvyV0VPUGddKeuOrx+vF5nMgUJpu+xX05TQtizARv
         AMmGjOWJeTvkCzG3z9RdJfjYlYXfAXCXhVTqhBAFMW2pkEu8/gXeO9KgT0J4kJPMoptH
         gb5g==
X-Gm-Message-State: AOJu0YxtVP7D5u8ecwqNMjf0aJGZbEM7Zd3R+1XVw58u7klwGKleofzr
	fGxcHfFOf7FtJz4g1Ud8SpxPRb0XNDL9ia6U
X-Google-Smtp-Source: AGHT+IHXcO4BYXI9ietutHR0LKi2b7BvNdJrsbnNiH25wXy6NACl4RHwkmJbgTrsWoFjH1mzR+O7nA==
X-Received: by 2002:a5d:6386:0:b0:318:70:a4ac with SMTP id p6-20020a5d6386000000b003180070a4acmr1081479wru.17.1692181241215;
        Wed, 16 Aug 2023 03:20:41 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 32/57] xen/riscv: introduce bit operations
Date: Wed, 16 Aug 2023 13:19:44 +0300
Message-ID: <ccdab77ac44b2697ea26ff0789c636ce8362abea.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
2.41.0


