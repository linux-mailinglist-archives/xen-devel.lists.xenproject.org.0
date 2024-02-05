Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2B8849E44
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676208.1052279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xw-0002EM-Mk; Mon, 05 Feb 2024 15:33:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676208.1052279; Mon, 05 Feb 2024 15:33:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0xw-00025T-1R; Mon, 05 Feb 2024 15:33:00 +0000
Received: by outflank-mailman (input) for mailman id 676208;
 Mon, 05 Feb 2024 15:32:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xs-0007Hv-PD
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:32:56 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d5a2f590-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:32:56 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5114cd44fdbso2336153e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:56 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:54 -0800 (PST)
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
X-Inumbo-ID: d5a2f590-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147175; x=1707751975; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4eMIfLBmdHylf/GKrqfYgIxqeR1GAXR1e29mkuHIvw=;
        b=cQ+NA4PHsJf5bqkwI78v1ycIS5JBE7gHtCZpEErSuB7pKrl1e7xklco5xsnkNvoiQX
         HZP0NDi1Q2PVT8kBEBlzZSmlDVrXPkiWE1hwmkvpUmaj5ylcbvV9RGQ9BcuK979goBNv
         p5PVBY4XOSU8fgnjx0uFQnBGdWpsoFrRfmuBuyYeuuPoAwwsb6aJZ58iGm/TC6z8c3OY
         6zOI85JA7AzVBERHQyEPniZpGiFCtEOdw2Cnzco4Tl+T56iFK1X616hkVhyKCWN9p8d/
         6tkyV0Jjlu6PNXKz5UXqkQINr8KGoSv6sblb8Gkjjqu6lQ7GwYZcvjf4N9T3uthzDFPu
         hutg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147175; x=1707751975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4eMIfLBmdHylf/GKrqfYgIxqeR1GAXR1e29mkuHIvw=;
        b=c4uOBxiGPI7RWLIfqlU2l8AnZi8d5HCf9O6da4y5Mo+2wS9bp3QkSp7XGyuBZAsRMy
         yYV8lOdWJnJNxuqGTHswtwkbpiQ3qKrLsqfB1wmAmcs5eeYo/lzUJ/+oZX9iV62sceL2
         FZceXeUv9rg0ITJj7LaAoBB3CqSz4QgAKPoffHSkb9RZAxcjtNEkOAlU8iopoK4vOjV0
         RslzG+8OiPUM9FxJY+aT7qeJ9GVvze13B5y5t5L1DMjyErtXYWRzxKqosBERYNUhZMD/
         DwLPD9ZGwCktqGVPAJYujqwL/c4BdelPakzzXVjQh7jopN7AisswSA2m8kBUDvzWHeaX
         NjQA==
X-Gm-Message-State: AOJu0Yx+mvGIqryRZVuwSotww7l/KA5hK3AAK+J3zKJsjjXlDNwkPJFL
	/CLTZGvwSH1Gb8XtOKVVvkqYgQkxEGTTFYxeE7dpF+WljBUvc/HGcyMD1Hda
X-Google-Smtp-Source: AGHT+IHKPIhVNBwsZykURNlJGS0BKoSDbw+LWo4E8hC3aDGWQ/scYCbvIN6O3HIhuXb0gQjbpOIhgw==
X-Received: by 2002:ac2:54ac:0:b0:511:4db9:d6c7 with SMTP id w12-20020ac254ac000000b005114db9d6c7mr2300376lfk.67.1707147175099;
        Mon, 05 Feb 2024 07:32:55 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUGBoM+qWiIPUT4iMVMfMFxU84N5INAS2iE0GVSc9JZRRztDCVbMucN6Dc8Zv1lBz5vA1x1rWvtHSN9lJLyvudlTkGQtTnkSvYX1G+USD+8kqyyfFC8ag4l2moRAJ5YTe2EnwlBZystJA0krJJ1G05rhN7ewmAEBq/yXRZ+pvPuI813ILZzGrym7EBeuhYBdAgp5kvZoVIy4lF9LXLF3xITlLkrBmVfvrXg6viw5SvN5dUINKrY1svWO8fROCKg0IMNUNbXk/rk4xDsdgCE/jrASYJ1BwXw865RvG6cvMyOZoaAg39VjOXKmKR1pr6A+vLdukP7
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
Subject: [PATCH v4 13/30] xen/riscv: introduce io.h
Date: Mon,  5 Feb 2024 16:32:20 +0100
Message-ID: <64afc021f680e55d486f8429c02513bc9bf4b9ea.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header taken form Linux 6.4.0-rc1 and is based on
arch/riscv/include/asm/mmio.h.

Addionally, to the header was added definions of ioremap_*().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - delete inner parentheses in macros.
 - s/u<N>/uint<N>.
---
Changes in V3:
 - re-sync with linux kernel
 - update the commit message
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/io.h | 142 ++++++++++++++++++++++++++++++++
 1 file changed, 142 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/io.h

diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
new file mode 100644
index 0000000000..1e61a40522
--- /dev/null
+++ b/xen/arch/riscv/include/asm/io.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * {read,write}{b,w,l,q} based on arch/arm64/include/asm/io.h
+ *   which was based on arch/arm/include/io.h
+ *
+ * Copyright (C) 1996-2000 Russell King
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2014 Regents of the University of California
+ */
+
+
+#ifndef _ASM_RISCV_IO_H
+#define _ASM_RISCV_IO_H
+
+#include <asm/byteorder.h>
+
+/*
+ * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
+ * change the properties of memory regions.  This should be fixed by the
+ * upcoming platform spec.
+ */
+#define ioremap_nocache(addr, size) ioremap(addr, size)
+#define ioremap_wc(addr, size) ioremap(addr, size)
+#define ioremap_wt(addr, size) ioremap(addr, size)
+
+/* Generic IO read/write.  These perform native-endian accesses. */
+#define __raw_writeb __raw_writeb
+static inline void __raw_writeb(uint8_t val, volatile void __iomem *addr)
+{
+	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#define __raw_writew __raw_writew
+static inline void __raw_writew(uint16_t val, volatile void __iomem *addr)
+{
+	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#define __raw_writel __raw_writel
+static inline void __raw_writel(uint32_t val, volatile void __iomem *addr)
+{
+	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#ifdef CONFIG_64BIT
+#define __raw_writeq __raw_writeq
+static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
+{
+	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+#endif
+
+#define __raw_readb __raw_readb
+static inline uint8_t __raw_readb(const volatile void __iomem *addr)
+{
+	uint8_t val;
+
+	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readw __raw_readw
+static inline uint16_t __raw_readw(const volatile void __iomem *addr)
+{
+	uint16_t val;
+
+	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readl __raw_readl
+static inline uint32_t __raw_readl(const volatile void __iomem *addr)
+{
+	uint32_t val;
+
+	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#ifdef CONFIG_64BIT
+#define __raw_readq __raw_readq
+static inline u64 __raw_readq(const volatile void __iomem *addr)
+{
+	u64 val;
+
+	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+#endif
+
+/*
+ * Unordered I/O memory access primitives.  These are even more relaxed than
+ * the relaxed versions, as they don't even order accesses between successive
+ * operations to the I/O regions.
+ */
+#define readb_cpu(c)		({ uint8_t  __r = __raw_readb(c); __r; })
+#define readw_cpu(c)		({ uint16_t __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
+#define readl_cpu(c)		({ uint32_t __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
+
+#define writeb_cpu(v,c)		((void)__raw_writeb(v,c))
+#define writew_cpu(v,c)		((void)__raw_writew((__force uint16_t)cpu_to_le16(v),c))
+#define writel_cpu(v,c)		((void)__raw_writel((__force uint32_t)cpu_to_le32(v),c))
+
+#ifdef CONFIG_64BIT
+#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
+#define writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),c))
+#endif
+
+/*
+ * I/O memory access primitives. Reads are ordered relative to any
+ * following Normal memory access. Writes are ordered relative to any prior
+ * Normal memory access.  The memory barriers here are necessary as RISC-V
+ * doesn't define any ordering between the memory space and the I/O space.
+ */
+#define __io_br()	do {} while (0)
+#define __io_ar(v)	__asm__ __volatile__ ("fence i,r" : : : "memory");
+#define __io_bw()	__asm__ __volatile__ ("fence w,o" : : : "memory");
+#define __io_aw()	do { } while (0)
+
+#define readb(c)	({ uint8_t  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
+#define readw(c)	({ uint16_t __v; __io_br(); __v = readw_cpu(c); __io_ar(__v); __v; })
+#define readl(c)	({ uint32_t __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })
+
+#define writeb(v,c)	({ __io_bw(); writeb_cpu(v,c); __io_aw(); })
+#define writew(v,c)	({ __io_bw(); writew_cpu(v,c); __io_aw(); })
+#define writel(v,c)	({ __io_bw(); writel_cpu(v,c); __io_aw(); })
+
+#ifdef CONFIG_64BIT
+#define readq(c)	({ u64 __v; __io_br(); __v = readq_cpu(c); __io_ar(__v); __v; })
+#define writeq(v,c)	({ __io_bw(); writeq_cpu((v),(c)); __io_aw(); })
+#endif
+
+#endif /* _ASM_RISCV_IO_H */
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
2.43.0


