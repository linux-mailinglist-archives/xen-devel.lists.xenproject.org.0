Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 918DC87D33F
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 19:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693995.1082777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwv-0008JL-Ur; Fri, 15 Mar 2024 18:06:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693995.1082777; Fri, 15 Mar 2024 18:06:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rlBwv-0008CH-JY; Fri, 15 Mar 2024 18:06:33 +0000
Received: by outflank-mailman (input) for mailman id 693995;
 Fri, 15 Mar 2024 18:06:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mDue=KV=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rlBwt-0005yW-So
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 18:06:31 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04e270b-e2f6-11ee-afdd-a90da7624cb6;
 Fri, 15 Mar 2024 19:06:31 +0100 (CET)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d4515ec3aaso20751931fa.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 11:06:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g29-20020a05651c079d00b002d0acb57c89sm568939lje.64.2024.03.15.11.06.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 11:06:29 -0700 (PDT)
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
X-Inumbo-ID: c04e270b-e2f6-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710525990; x=1711130790; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1pPG7wBEk5xnYRPInM0oJeLCyj54iS75LgxSjQvpZk=;
        b=Stvo39G3Y51Mnu84J5qztv7uNEfYOJS3EZWkUBqzdsxR/xK83l7jgDKl6yW9bjKRlb
         nnRSin/S8mD7ygG30NnZzVVCKXm/Qmj2NhYQbJMkHsco5Ik7Lethi3aUX0Q84zpmqE8N
         /bgikPMEuMfmr8U3M0JUYVu9UWQ3fUPAwOr5tDQtR8aSrg0yq3k73y646qM4gUA7FBkZ
         l7QJFhFdfxCd2hdTgXbGhaKvkSLfEvXEJvybgNy9ezazcGDgIfKbds69lKIVVZZN1l96
         nIedV4Kwujri52AKUuUBHHl7wQPrNMmFPs0fQInWbpTTWjIg7p7wG63s7oLW5dfDpoTb
         D51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710525990; x=1711130790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1pPG7wBEk5xnYRPInM0oJeLCyj54iS75LgxSjQvpZk=;
        b=Rf3uLmoqMv9VRHi01xtQqydN0rLw0/l2zJlCl8psSVASbuem4WCkyEwZkKWuU8Szhn
         pcyZSCeGPNleOEni88i0nyHYvcnyNLxon18A/jzzbVfOYlxJf3XRiZf+V0wZihBaJeKU
         MUGaNeYmWkw+nQZZ5oFw7lMJJ9I9laVuDcZrH/aBIAtrDpvFrIlEH9+RONlgMqMQbFEL
         Pl1YIGpZV9E/LInWHsRX89e/UaL+6jOLhjFs9vSujWh9UQgQsozRFGVAwrrz0fRF8NeF
         7ZNn50h1o7NsYKtkxPItxr3WhomJi37jOphYmklNH0P9CKuqux1JBXzPLRLjrAeFzieo
         A2+g==
X-Gm-Message-State: AOJu0Ywr3FTZWp7XBOrogPfFhB6FOlo2aRO1e2dK7s1He5Lz3ZVPJw4f
	pM1I/eXhvNvfDJBw7HlBDsYsRfP7RtaLGzWeyfif+E3jHn2nDQGxDIxfEtVZdNc=
X-Google-Smtp-Source: AGHT+IE+caOtR0warXJa+P68PN1HGZpudSfVVM+FB1k34qtRoWTmtVf74V9WS6+OdU8ZUhAoWZ8/Zw==
X-Received: by 2002:a05:651c:2d0:b0:2d4:8ff8:6435 with SMTP id f16-20020a05651c02d000b002d48ff86435mr432459ljo.19.1710525989982;
        Fri, 15 Mar 2024 11:06:29 -0700 (PDT)
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
Subject: [PATCH v6 09/20] xen/riscv: introduce io.h
Date: Fri, 15 Mar 2024 19:06:05 +0100
Message-ID: <dae9f595e5afd1e6a46149919e6689afe263e1ce.1710517542.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1710517542.git.oleksii.kurochko@gmail.com>
References: <cover.1710517542.git.oleksii.kurochko@gmail.com>
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
  as they are unnecessary.
- Adopt the Xen code style for this header, considering that significant changes
  are not anticipated in the future.
  In the event of any issues, adapting them to Xen style should be easily
  manageable.
- drop unnecessary  __r variables in macros read*_cpu()
- update inline assembler constraints for addr argument for
  __raw_read{b,w,l,q} and __raw_write{b,w,l,q} to tell a compiler that
 *addr will be accessed.
- add stubs for __raw_readq() and __raw_writeq() for RISCV_32

Addionally, to the header was added definions of ioremap_*().

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V6:
 - drop unnecessary spaces and fix typos in the file comment.
 - s/CONFIG_64BIT/CONFIG_RISCV_32 as .d suffix for instruction doesn't exist for RV32.
 - add stubs for __raw_readq() and __raw_writeq() for RISCV_32
 - update inline assembler constraints for addr argument for __raw_read{b,w,l,q} and
   __raw_write{b,w,l,q} to tell compiler that *addr will be accessed.
 - s/u8/uint8_t
 - update the commit message
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
 xen/arch/riscv/include/asm/io.h | 167 ++++++++++++++++++++++++++++++++
 1 file changed, 167 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/io.h

diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
new file mode 100644
index 0000000000..4eb4cd4b49
--- /dev/null
+++ b/xen/arch/riscv/include/asm/io.h
@@ -0,0 +1,167 @@
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
+ *      and will bitrot.  It also won't be any significant help to a future
+ *       developer down the road doing a hypothetical BE RISC-V Linux port.
+ *   - drop unused argument of __io_ar() macros.
+ *   - drop "#define _raw_{read,write}{b,w,l,d,q} _raw_{read,write}{b,w,l,d,q}"
+ *     as they are unnecessary.
+ *   - Adopt the Xen code style for this header, considering that significant
+ *     changes are not anticipated in the future.
+ *     In the event of any issues, adapting them to Xen style should be easily
+ *     manageable.
+ *   - drop unnecessary __r variables in macros read*_cpu()
+ *   - update inline assembler constraints for addr argument for
+ *     __raw_read{b,w,l,q} and __raw_write{b,w,l,q} to tell a compiler that
+ *     *addr will be accessed.
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
+    asm volatile ( "sb %1, %0" : "=m" (*(volatile uint8_t __force *)addr) : "r" (val) );
+}
+
+static inline void __raw_writew(uint16_t val, volatile void __iomem *addr)
+{
+    asm volatile ( "sh %1, %0" : "=m" (*(volatile uint16_t __force *)addr) : "r" (val) );
+}
+
+static inline void __raw_writel(uint32_t val, volatile void __iomem *addr)
+{
+    asm volatile ( "sw %1, %0" : "=m" (*(volatile uint32_t __force *)addr) : "r" (val) );
+}
+
+#ifdef CONFIG_RISCV_32
+static inline void __raw_writeq(uint64_t val, volatile void __iomem *addr)
+{
+    BUILD_BUG_ON("unimplemented\n");
+}
+#else
+static inline void __raw_writeq(uint64_t val, volatile void __iomem *addr)
+{
+    asm volatile ( "sd %1, %0" : "=m" (*(volatile uint64_t __force *)addr) : "r" (val) );
+}
+#endif
+
+static inline uint8_t __raw_readb(const volatile void __iomem *addr)
+{
+    uint8_t val;
+
+    asm volatile ( "lb %0, %1" : "=r" (val) : "m" (*(volatile uint8_t __force *)addr) );
+    return val;
+}
+
+static inline uint16_t __raw_readw(const volatile void __iomem *addr)
+{
+    uint16_t val;
+
+    asm volatile ( "lh %0, %1" : "=r" (val) : "m" (*(volatile uint16_t __force *)addr) );
+    return val;
+}
+
+static inline uint32_t __raw_readl(const volatile void __iomem *addr)
+{
+    uint32_t val;
+
+    asm volatile ( "lw %0, %1" : "=r" (val) : "m" (*(volatile uint32_t __force *)addr) );
+    return val;
+}
+
+#ifdef CONFIG_RISCV_32
+static inline uint64_t __raw_readq(const volatile void __iomem *addr)
+{
+    BUILD_BUG_ON("unimplemented\n");
+    return 0;
+}
+#else
+static inline uint64_t __raw_readq(const volatile void __iomem *addr)
+{
+    uint64_t val;
+
+    asm volatile ( "ld %0, %1" : "=r" (val) : "m" (*(volatile uint64_t __force *)addr) );
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
+#define readq_cpu(c)        __raw_readq(c)
+#define writeq_cpu(v, c)    __raw_writeq(v, c)
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
+#define readq(c)        ({ uint64_t v; __io_br(); v = readq_cpu(c); __io_ar(); v; })
+#define writeq(v, c)    ({ __io_bw(); writeq_cpu(v, c); __io_aw(); })
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


