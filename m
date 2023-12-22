Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D166881CC2A
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:26:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659560.1029282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhPl-0000F6-LU; Fri, 22 Dec 2023 15:26:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659560.1029282; Fri, 22 Dec 2023 15:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhPl-0000DS-Hl; Fri, 22 Dec 2023 15:26:17 +0000
Received: by outflank-mailman (input) for mailman id 659560;
 Fri, 22 Dec 2023 15:26:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDa-0007Ie-BV
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:42 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0ec1849-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:41 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-50e23a4df33so2371542e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:41 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:40 -0800 (PST)
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
X-Inumbo-ID: b0ec1849-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258020; x=1703862820; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ubbb7iTPWSo6Dj4Ma1J20RtqPqN8IdD2bRUwRTRCUg0=;
        b=dJUT51C0i5IgDtjzSS0/uZXA8nBntOX2upPpYSTxnUfPsGAdqRvA5gpUHjd90CCTcP
         JvsY2TXdAopVwKDoX7VvETIfHGYDhGcxZKac144r/2TUKXjcfEvhwa8I5pDs7t2NBmk5
         DrApF/U50pFnxdCgLyaPAa8axd50c9hHsYsa8GF+J+YVriBn1CQMlfid6W4fyyMo0oQV
         XOebEWUaBIqf19EMuqLrqaSsXbNFVwk80NpqkZHpo77Aa0x8jJUM7rnx1vfZZEHHvxxW
         QNuPja+1ZNtOmGxvK7YcjU2WZwOsLu+quVLOUZkf9ZbZPB69pwZn/24kW13rEWK4gTqZ
         oB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258020; x=1703862820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ubbb7iTPWSo6Dj4Ma1J20RtqPqN8IdD2bRUwRTRCUg0=;
        b=iS1OZwIbhS1+b0+GqczQxw2QF4QDhWxwYSdFLIlZVwX30Fu94pdmHqI3oPyuvi8P/y
         tXnRJxsuN5LuDvprqx0+bqHEqmxjTgp4OiUM3KC5lTBl8SHMud1hDchWdxW1wpZfK9NT
         noJVpoE5RsHpTmQYfXvBPxovnXpDzVK9++5ufAFbwj4Yi8xaNKIg/CjF3NcObwZXpqFm
         VkqHhQIoMbc1rh5xcRpIeEX6MQjxMEqt9IhzATceVCMElgrX/c19aJ69XLx8q1oXq33W
         Yn6gYxcBSSf6sbN2Cuhmfo/ixYsMZCIHaRRNcQP2arPym3a5+MXYm4GeqrN46CNq2QVZ
         +5pw==
X-Gm-Message-State: AOJu0Yxpcvx/4rK633MPW5PhiKjxYUBS6OYFAPca2YTwmVqDMK7kMQ6n
	JY2B8WS2oW/xVQ5SYBhoMOC+55WKvjo=
X-Google-Smtp-Source: AGHT+IGY3GyQy2Ibb+/4UAZL0RE2ahWmtCDcBUnJadHuyGE/QgcxcEitD9kdxextHfoMCRuBYMIqRA==
X-Received: by 2002:ac2:51a7:0:b0:50e:4bf6:8848 with SMTP id f7-20020ac251a7000000b0050e4bf68848mr772961lfk.38.1703258020410;
        Fri, 22 Dec 2023 07:13:40 -0800 (PST)
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
Subject: [PATCH v3 16/34] xen/lib: introduce generic find next bit operations
Date: Fri, 22 Dec 2023 17:13:00 +0200
Message-ID: <bb47caf6c275d8aea307b96e79828831eab4a703.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

find-next-bit.c is common for Arm64 and RISC-V64 so it is moved
to xen/lib.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/include/asm/fence.h |  11 +-
 xen/common/Kconfig                 |   3 +
 xen/lib/Makefile                   |   1 +
 xen/lib/find-next-bit.c            | 281 +++++++++++++++++++++++++++++
 4 files changed, 295 insertions(+), 1 deletion(-)
 create mode 100644 xen/lib/find-next-bit.c

diff --git a/xen/arch/riscv/include/asm/fence.h b/xen/arch/riscv/include/asm/fence.h
index b3f6b1c20a..5d9a851ae8 100644
--- a/xen/arch/riscv/include/asm/fence.h
+++ b/xen/arch/riscv/include/asm/fence.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _ASM_RISCV_FENCE_H
 #define _ASM_RISCV_FENCE_H
 
@@ -11,3 +11,12 @@
 #endif
 
 #endif	/* _ASM_RISCV_FENCE_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 310ad4229c..56ce34ffd4 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -47,6 +47,9 @@ config ARCH_MAP_DOMAIN_PAGE
 config GENERIC_BUG_FRAME
 	bool
 
+config GENERIC_FIND_NEXT_BIT
+	bool
+
 config HAS_ALTERNATIVE
 	bool
 
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index 2d9ebb945f..66237a45c5 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -3,6 +3,7 @@ obj-$(CONFIG_X86) += x86/
 lib-y += bsearch.o
 lib-y += ctors.o
 lib-y += ctype.o
+lib-$(CONFIG_GENERIC_FIND_NEXT_BIT) += find-next-bit.o
 lib-y += list-sort.o
 lib-y += memchr.o
 lib-y += memchr_inv.o
diff --git a/xen/lib/find-next-bit.c b/xen/lib/find-next-bit.c
new file mode 100644
index 0000000000..ca6f82277e
--- /dev/null
+++ b/xen/lib/find-next-bit.c
@@ -0,0 +1,281 @@
+/* find_next_bit.c: fallback find next bit implementation
+ *
+ * Copyright (C) 2004 Red Hat, Inc. All Rights Reserved.
+ * Written by David Howells (dhowells@redhat.com)
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+#include <xen/bitops.h>
+
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
2.43.0


