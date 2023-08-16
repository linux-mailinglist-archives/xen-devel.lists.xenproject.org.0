Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 731D377DEBD
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 12:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584466.915266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoM-0008O3-0t; Wed, 16 Aug 2023 10:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584466.915266; Wed, 16 Aug 2023 10:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWDoL-0008Kn-T5; Wed, 16 Aug 2023 10:31:33 +0000
Received: by outflank-mailman (input) for mailman id 584466;
 Wed, 16 Aug 2023 10:31:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aIlC=EB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qWDdq-0003RA-08
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 10:20:42 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b50dd70-3c1e-11ee-9b0c-b553b5be7939;
 Wed, 16 Aug 2023 12:20:38 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe5c0e587eso63771625e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 16 Aug 2023 03:20:38 -0700 (PDT)
Received: from 192.168.1.26 ([151.25.98.127]) by smtp.gmail.com with ESMTPSA id
 g5-20020adfe405000000b0031773a8e5c4sm20877843wrm.37.2023.08.16.03.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 03:20:37 -0700 (PDT)
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
X-Inumbo-ID: 8b50dd70-3c1e-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692181237; x=1692786037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wh757Bp44sfrNcfrLbyxADwAwn7y+najRiXAOGZcVhk=;
        b=E0JdCagmCAtQZsRv1SIF8uqgZu1E10B3ztSkQLZfT3qenSq0p84Bj98uMOOD/R7js1
         nb+yD8G3VGkZXZMD+1Rx9jLYMA6wP6vIWID+LMGHncNoIKkhhRylT8xNEl4SD7YR9cuc
         hKLkBLYvR/KffwlEMrBfRpd1FwLc1dWZ6Qm2/0NY0/DR/qvplc4L563Nu7G2sIvWR0mn
         q72wVmE86KSbUuPfnH7I+1dQwGztN8VSCa3NpPpbi4T08upVe0pW4LdlT+NzocLb8rMS
         P2AgcqEEptq9inuxeJwC+bjn2dofLIiZIBSrKMCR+MD51qyG9ihF3A1m6Ee/AQFENByx
         hCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692181237; x=1692786037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wh757Bp44sfrNcfrLbyxADwAwn7y+najRiXAOGZcVhk=;
        b=HW0D+pXrI8r86kuAHwwvb5GnraEduxpXrqYs0xoX0ULx3altKJs1fW0q0cxvIZ8DeL
         h7xx2gLPODbZB/XOOszbRdl68vsdu0s9vNu7BiDNtFlVkM211QmVqGzq7JNPhOlLQSxt
         HTtVuFitIZ8aURMuXbobChoWxSHZGVBZELRPRFJQj+wkTVBK2uUA6h8aBFKBToYmwpSp
         XuMXVexLQPEXUZQjKy/SmYJ8VowNpTU2dO9ZlErQTvoncOC5bilOMajBf2yIVgnPehvC
         qtrM5BxQQ9MQ3g92TF75G9sXHvoqNzqM4Che2LHs76GTsqfBFQkku7KE/shxLxGVeuEy
         4yCw==
X-Gm-Message-State: AOJu0YyDnDiDzCD4z5uGR11lZo4qkqXGJooW35eN1PZQuAsA/xzro8jh
	JzcVA7DIS11dPC/ZrDBUruGTJ1Gx2bmvsZbQ
X-Google-Smtp-Source: AGHT+IEfE1Wyew6TS8yIH3QmKwqoydTD1c/jtUdupCbPZPJUQa3nJP8hztoo3wMcGrqW/ZN+IQvASA==
X-Received: by 2002:a7b:c7c7:0:b0:3fc:3e1:7105 with SMTP id z7-20020a7bc7c7000000b003fc03e17105mr1036851wmk.24.1692181237262;
        Wed, 16 Aug 2023 03:20:37 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 28/57] xen/riscv: introduce asm/io.h
Date: Wed, 16 Aug 2023 13:19:39 +0300
Message-ID: <39827b08ffe34621e572daabb1830b51e566fc5b.1692181079.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1692181079.git.oleksii.kurochko@gmail.com>
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/include/asm/io.h | 132 ++++++++++++++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/io.h

diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
new file mode 100644
index 0000000000..8c83c9689b
--- /dev/null
+++ b/xen/arch/riscv/include/asm/io.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
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
2.41.0


