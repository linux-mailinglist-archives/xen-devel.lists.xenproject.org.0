Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869B47F717B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640383.998567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TTG-0003pX-GX; Fri, 24 Nov 2023 10:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640383.998567; Fri, 24 Nov 2023 10:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TTF-0003SZ-TU; Fri, 24 Nov 2023 10:31:37 +0000
Received: by outflank-mailman (input) for mailman id 640383;
 Fri, 24 Nov 2023 10:31:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTA-0006hx-A3
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:32 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1a6cbda-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:30 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9ff26d7c0a6so245690766b.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:30 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:28 -0800 (PST)
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
X-Inumbo-ID: a1a6cbda-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821889; x=1701426689; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C1jvDsawJ31XovOPo0nLihxqmUBfwMrjgsOrZCb823c=;
        b=dwYt15DWg9P8nkaJFu4NiRpgSHbaVd6jIWt7yGEo7Q6U++XR0acjqMUr/bVKWe8n07
         mhPE6iyIQhNzfVY1e3RyzmJGXtpHSGyiNAoyooXXnLbqNo4OJm8jdsePltlJupSrXseo
         M2A1idJTAZ4E/uW6NJOwNR8wfQglJtmN5rfGNKAPq7DGdUkQejeoK3hP6TkRwdKiajPp
         Sgbh92cDFfjcovPskCuFToUaklR1AxBRzJYK6ewv8H4TtuethpRW1pvECthPEY+qxtQL
         LfM5uAcCv7bxz8r4po+cgI06/aAGagLRKmFMeesBwormthe7gy0d/wfWGNSzReOS5m05
         lSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821889; x=1701426689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C1jvDsawJ31XovOPo0nLihxqmUBfwMrjgsOrZCb823c=;
        b=Ds6L3CbdR28CLxnC4jCuCgBqEKfB6enUPZzpXqP87OX3ewuqHOqu2CKtW2yAb+DHkh
         5Q3Hi9pbZ8LH2jVpo0zuWr/LUVxGgs1Dxj100NsxlHvUdw9MPYfbS6ZD0jCf7hM/GvHL
         /s3Nlk4VJH2gr1pgogtGzNzdidD2JkTPFtn0TU0GN3oJtIfrcy7c8GTed3Ot9o5ZFQQ6
         5QuJiU769bflWw68zck00k6KK/2yo5DFNUtD+c+zcH/7mJqMG2821cT96tlZZEJRu2KX
         WiSUjZpmADWe1cisIRo8VdnvAHxiq896atfkprUJY/nvfrdAtsm69iNZAZyrLyi9u6yO
         qDcw==
X-Gm-Message-State: AOJu0Yx//8iPSf3MBSkjElV3bd70naj6Xd7raATJitZ68lsaN903PPaI
	3YbDifcZ8cIlxLQs4gGPAEP9G5+AZ7HZ4w==
X-Google-Smtp-Source: AGHT+IH1BjL6fZIUCzu3aiDD79RyC6q7nlBs9yd2qn1CwU21TpTlZBja/OKgtBaSgAMTM6e1le79nA==
X-Received: by 2002:a17:906:7158:b0:a03:9dfb:5298 with SMTP id z24-20020a170906715800b00a039dfb5298mr1782312ejj.57.1700821889234;
        Fri, 24 Nov 2023 02:31:29 -0800 (PST)
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
Subject: [PATCH v2 19/39] xen/riscv: introduce asm/io.h
Date: Fri, 24 Nov 2023 12:30:39 +0200
Message-ID: <5fdef2f1039c4c7c9d213e77f4d3dec3ada9c1d6.1700761381.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/io.h | 134 ++++++++++++++++++++++++++++++++
 1 file changed, 134 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/io.h

diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
new file mode 100644
index 0000000000..987fddf902
--- /dev/null
+++ b/xen/arch/riscv/include/asm/io.h
@@ -0,0 +1,134 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Taken and modified from Linux.
+ *
+ * {read,write}{b,w,l,q} based on arch/arm64/include/asm/io.h
+ *   which was based on arch/arm/include/io.h
+ *
+ * Copyright (C) 1996-2000 Russell King
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2014 Regents of the University of California
+ */
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
+#define ioremap_nocache(addr, size) ioremap((addr), (size))
+#define ioremap_wc(addr, size) ioremap((addr), (size))
+#define ioremap_wt(addr, size) ioremap((addr), (size))
+
+/* Generic IO read/write.  These perform native-endian accesses. */
+#define __raw_writeb __raw_writeb
+static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
+{
+	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#define __raw_writew __raw_writew
+static inline void __raw_writew(u16 val, volatile void __iomem *addr)
+{
+	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+#define __raw_writel __raw_writel
+static inline void __raw_writel(u32 val, volatile void __iomem *addr)
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
+static inline u8 __raw_readb(const volatile void __iomem *addr)
+{
+	u8 val;
+
+	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readw __raw_readw
+static inline u16 __raw_readw(const volatile void __iomem *addr)
+{
+	u16 val;
+
+	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+#define __raw_readl __raw_readl
+static inline u32 __raw_readl(const volatile void __iomem *addr)
+{
+	u32 val;
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
+#define readb_cpu(c)		({ u8  __r = __raw_readb(c); __r; })
+#define readw_cpu(c)		({ u16 __r = le16_to_cpu((__force __le16)__raw_readw(c)); __r; })
+#define readl_cpu(c)		({ u32 __r = le32_to_cpu((__force __le32)__raw_readl(c)); __r; })
+
+#define writeb_cpu(v,c)		((void)__raw_writeb((v),(c)))
+#define writew_cpu(v,c)		((void)__raw_writew((__force u16)cpu_to_le16(v),(c)))
+#define writel_cpu(v,c)		((void)__raw_writel((__force u32)cpu_to_le32(v),(c)))
+
+#ifdef CONFIG_64BIT
+#define readq_cpu(c)		({ u64 __r = le64_to_cpu((__force __le64)__raw_readq(c)); __r; })
+#define writeq_cpu(v,c)		((void)__raw_writeq((__force u64)cpu_to_le64(v),(c)))
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
+#define readb(c)	({ u8  __v; __io_br(); __v = readb_cpu(c); __io_ar(__v); __v; })
+#define readw(c)	({ u16 __v; __io_br(); __v = readw_cpu(c); __io_ar(__v); __v; })
+#define readl(c)	({ u32 __v; __io_br(); __v = readl_cpu(c); __io_ar(__v); __v; })
+
+#define writeb(v,c)	({ __io_bw(); writeb_cpu((v),(c)); __io_aw(); })
+#define writew(v,c)	({ __io_bw(); writew_cpu((v),(c)); __io_aw(); })
+#define writel(v,c)	({ __io_bw(); writel_cpu((v),(c)); __io_aw(); })
+
+#ifdef CONFIG_64BIT
+#define readq(c)	({ u64 __v; __io_br(); __v = readq_cpu(c); __io_ar(__v); __v; })
+#define writeq(v,c)	({ __io_bw(); writeq_cpu((v),(c)); __io_aw(); })
+#endif
+
+#endif /* _ASM_RISCV_IO_H */
-- 
2.42.0


