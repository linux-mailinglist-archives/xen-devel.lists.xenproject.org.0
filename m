Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 430C2867EE1
	for <lists+xen-devel@lfdr.de>; Mon, 26 Feb 2024 18:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.685702.1066931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewt-0002yK-Qg; Mon, 26 Feb 2024 17:39:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 685702.1066931; Mon, 26 Feb 2024 17:39:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1reewt-0002nU-6U; Mon, 26 Feb 2024 17:39:31 +0000
Received: by outflank-mailman (input) for mailman id 685702;
 Mon, 26 Feb 2024 17:39:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OiHA=KD=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1reewq-0007o5-Bj
 for xen-devel@lists.xenproject.org; Mon, 26 Feb 2024 17:39:28 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc939793-d4cd-11ee-98f5-efadbce2ee36;
 Mon, 26 Feb 2024 18:39:26 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2d29111272eso8909541fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 26 Feb 2024 09:39:26 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 z8-20020a2e8e88000000b002d0ae22ff6fsm920883ljk.60.2024.02.26.09.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 09:39:24 -0800 (PST)
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
X-Inumbo-ID: fc939793-d4cd-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708969165; x=1709573965; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKStfHZFEkzLaa1NeaeyMF3odmESAg9+t6rwdA0aLto=;
        b=K477ykmKO5tphm1r2rRytAMIQh6WCRrerI/iaZgKgDoi5cX7X6xXe0Zuu9fDxT5E/E
         0bVeDnhmjdtCbJYT5q0cV0BdNgOEDmihxDWmJje2zIRIp+LVKtOToflB0VEpJUecdmyu
         NCCKkYcRahQ8ItWNFj1unaC3M77ykvk5j7GJNTp5jInpFnlfW3Tz4aApoGyNMkhKhDaJ
         c7M3ngGHtRugUcavAzb/bDQ6NwnShMD3kT4TCciLasP/2OOli3Nfai/nrll6Y3bn5hjq
         4ZqMcW5y//iNmuRQla6pzpzXahK1PrENW47nFrSHYAlkQHL3QFCXlur3vvhbWzgNAMJ3
         CqIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708969165; x=1709573965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKStfHZFEkzLaa1NeaeyMF3odmESAg9+t6rwdA0aLto=;
        b=ADgV0ELmLDklMDcNaPk+raPnoe+D3Tb4GJZze8jPwQvcFKbOIzgzYRlx6Me1yAUS1w
         Uwy3WPJEBHeDd58Ay8cFphAtt50Lln1NkBY3EPjh9+k3HDgtqLG4yXQhs/12a/ITRnQv
         EXNXvVdJXvFBv/WUTe+pk0CxJGuhhm9YyboHPZrp8yoyV/fBeKdRvYbRe56fkfKMNYkt
         SciPKOocuTtluQNnQgdYSQ8uZImFeT7VcHNYL/eLrHFhEb2FSeviXerlQnO+D3AsEuDz
         9owe1gaR10b1FtsGn9bYZPZ31LU74Bg/eC52Mw8/Xc3+WURKDjHCc7wC/WbB7VdrhGyf
         N+fA==
X-Gm-Message-State: AOJu0YxcSNVw37fQIkgpk9ZcxVcav60XD9rrOfBbCv6Z73SwlwX0QFPG
	rskZJVtXGnVHxFRaXrp4mxmtVIwFAegvkIcTdkWBzFatQYE/arZ7wxIwZ7vv
X-Google-Smtp-Source: AGHT+IF8j64m05lU0O7eEs9CTJOqRPca6Py6Y/cfMXmv+mN7jFGosdpTMOiLH6kiqBIixDV6f3aLsA==
X-Received: by 2002:a2e:b8c7:0:b0:2d2:4ee4:c8a5 with SMTP id s7-20020a2eb8c7000000b002d24ee4c8a5mr5110208ljp.50.1708969165395;
        Mon, 26 Feb 2024 09:39:25 -0800 (PST)
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
Subject: [PATCH v5 12/23] xen/riscv: introduce io.h
Date: Mon, 26 Feb 2024 18:38:54 +0100
Message-ID: <dd7c95b5197dfd0cca0edf9c0ada631336eb60d7.1708962629.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1708962629.git.oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header taken form Linux 6.4.0-rc1 and is based on
arch/riscv/include/asm/mmio.h with the following changes:
- drop forcing of endianess for read*(), write*() functions as
  no matter what CPU endianness, what endianness a particular device
  (and hence its MMIO region(s)) is using is entirely independent.
  Hence conversion, where necessary, needs to occur at a layer up.
  Another one reason to drop endianess conversion here is:
  https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5749-3-hch@lst.de/
  One of the answers of the author of the commit:
    And we don't know if Linux will be around if that ever changes.
    The point is:
     a) the current RISC-V spec is LE only
     b) the current linux port is LE only except for this little bit
    There is no point in leaving just this bitrotting code around.  It
    just confuses developers, (very very slightly) slows down compiles
    and will bitrot.  It also won't be any significant help to a future
    developer down the road doing a hypothetical BE RISC-V Linux port.
- drop unused argument of __io_ar() macros.
- drop "#define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}"
  as they are unnessary.
- Adopt the Xen code style for this header, considering that significant changes
  are not anticipated in the future.
  In the event of any issues, adapting them to Xen style should be easily
  manageable.
- drop unnessary __r variables in macros read*_cpu()

Addionally, to the header was added definions of ioremap_*().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 - Xen code style related fixes
 - drop #define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}
 - drop cpu_to_le16()
 - remove unuused argument in _io_ar()
 - update the commit message 
 - drop unnessary __r variables in macros read*_cpu()
 - update the comments at the top of the header.
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
 xen/arch/riscv/include/asm/io.h | 157 ++++++++++++++++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/io.h

diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
new file mode 100644
index 0000000000..95a459432c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/io.h
@@ -0,0 +1,157 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ *  The header taken form Linux 6.4.0-rc1 and is based on
+ *  arch/riscv/include/asm/mmio.h with the following changes:
+ *   - drop forcing of endianess for read*(), write*() functions as
+ *     no matter what CPU endianness, what endianness a particular device
+ *     (and hence its MMIO region(s)) is using is entirely independent.
+ *     Hence conversion, where necessary, needs to occur at a layer up.
+ *     Another one reason to drop endianess conversion is:
+ *     https://patchwork.kernel.org/project/linux-riscv/patch/20190411115623.5749-3-hch@lst.de/
+ *     One of the answers of the author of the commit:
+ *       And we don't know if Linux will be around if that ever changes.
+ *       The point is:
+ *        a) the current RISC-V spec is LE only
+ *        b) the current linux port is LE only except for this little bit
+ *       There is no point in leaving just this bitrotting code around.  It
+ *       just confuses developers, (very very slightly) slows down compiles
+  *      and will bitrot.  It also won't be any significant help to a future
+ *       developer down the road doing a hypothetical BE RISC-V Linux port.
+ *   - drop unused argument of __io_ar() macros.
+ *   - drop "#define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}"
+ *     as they are unnessary.
+ *   - Adopt the Xen code style for this header, considering that significant changes
+ *     are not anticipated in the future.
+ *     In the event of any issues, adapting them to Xen style should be easily
+ *     manageable.
+ *   - drop unnessary __r variables in macros read*_cpu()
+ *
+ * Copyright (C) 1996-2000 Russell King
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2014 Regents of the University of California
+ * Copyright (C) 2024 Vates
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
+#define ioremap_nocache(addr, size) ioremap(addr, size)
+#define ioremap_wc(addr, size) ioremap(addr, size)
+#define ioremap_wt(addr, size) ioremap(addr, size)
+
+/* Generic IO read/write.  These perform native-endian accesses. */
+static inline void __raw_writeb(uint8_t val, volatile void __iomem *addr)
+{
+    asm volatile ( "sb %0, 0(%1)" : : "r" (val), "r" (addr) );
+}
+
+static inline void __raw_writew(uint16_t val, volatile void __iomem *addr)
+{
+    asm volatile ( "sh %0, 0(%1)" : : "r" (val), "r" (addr) );
+}
+
+static inline void __raw_writel(uint32_t val, volatile void __iomem *addr)
+{
+    asm volatile ( "sw %0, 0(%1)" : : "r" (val), "r" (addr) );
+}
+
+#ifdef CONFIG_64BIT
+static inline void __raw_writeq(u64 val, volatile void __iomem *addr)
+{
+    asm volatile ( "sd %0, 0(%1)" : : "r" (val), "r" (addr) );
+}
+#endif
+
+static inline uint8_t __raw_readb(const volatile void __iomem *addr)
+{
+    uint8_t val;
+
+    asm volatile ( "lb %0, 0(%1)" : "=r" (val) : "r" (addr) );
+    return val;
+}
+
+static inline uint16_t __raw_readw(const volatile void __iomem *addr)
+{
+    uint16_t val;
+
+    asm volatile ( "lh %0, 0(%1)" : "=r" (val) : "r" (addr) );
+    return val;
+}
+
+static inline uint32_t __raw_readl(const volatile void __iomem *addr)
+{
+    uint32_t val;
+
+    asm volatile ( "lw %0, 0(%1)" : "=r" (val) : "r" (addr) );
+    return val;
+}
+
+#ifdef CONFIG_64BIT
+static inline u64 __raw_readq(const volatile void __iomem *addr)
+{
+    u64 val;
+
+    asm volatile ( "ld %0, 0(%1)" : "=r" (val) : "r" (addr) );
+    return val;
+}
+#endif
+
+/*
+ * Unordered I/O memory access primitives.  These are even more relaxed than
+ * the relaxed versions, as they don't even order accesses between successive
+ * operations to the I/O regions.
+ */
+#define readb_cpu(c)        __raw_readb(c)
+#define readw_cpu(c)        __raw_readw(c)
+#define readl_cpu(c)        __raw_readl(c)
+
+#define writeb_cpu(v, c)    __raw_writeb(v, c)
+#define writew_cpu(v, c)    __raw_writew(v, c)
+#define writel_cpu(v, c)    __raw_writel(v, c)
+
+#ifdef CONFIG_64BIT
+#define readq_cpu(c)        __raw_readq(c)
+#define writeq_cpu(v, c)    __raw_writeq(v, c)
+#endif
+
+/*
+ * I/O memory access primitives. Reads are ordered relative to any
+ * following Normal memory access. Writes are ordered relative to any prior
+ * Normal memory access.  The memory barriers here are necessary as RISC-V
+ * doesn't define any ordering between the memory space and the I/O space.
+ */
+#define __io_br()   do { } while (0)
+#define __io_ar()   asm volatile ( "fence i,r" : : : "memory" );
+#define __io_bw()   asm volatile ( "fence w,o" : : : "memory" );
+#define __io_aw()   do { } while (0)
+
+#define readb(c)    ({ uint8_t  v; __io_br(); v = readb_cpu(c); __io_ar(); v; })
+#define readw(c)    ({ uint16_t v; __io_br(); v = readw_cpu(c); __io_ar(); v; })
+#define readl(c)    ({ uint32_t v; __io_br(); v = readl_cpu(c); __io_ar(); v; })
+
+#define writeb(v, c)    ({ __io_bw(); writeb_cpu(v, c); __io_aw(); })
+#define writew(v, c)    ({ __io_bw(); writew_cpu(v, c); __io_aw(); })
+#define writel(v, c)    ({ __io_bw(); writel_cpu(v, c); __io_aw(); })
+
+#ifdef CONFIG_64BIT
+#define readq(c)        ({ uint64_t v; __io_br(); v = readq_cpu(c); __io_ar(); v; })
+#define writeq(v, c)    ({ __io_bw(); writeq_cpu(v, c); __io_aw(); })
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


