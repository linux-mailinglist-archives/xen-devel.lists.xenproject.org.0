Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 119008A8050
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 12:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707307.1105138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AI-0000ps-2R; Wed, 17 Apr 2024 10:05:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707307.1105138; Wed, 17 Apr 2024 10:05:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx2AH-0000iD-O7; Wed, 17 Apr 2024 10:05:17 +0000
Received: by outflank-mailman (input) for mailman id 707307;
 Wed, 17 Apr 2024 10:05:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6A/l=LW=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rx2AF-0007lO-Qm
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 10:05:15 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb851875-fca1-11ee-94a3-07e782e9044d;
 Wed, 17 Apr 2024 12:05:13 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5194a4da476so520178e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Apr 2024 03:05:14 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 p2-20020a056512328200b00516cd83e497sm1893187lfe.210.2024.04.17.03.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 03:05:12 -0700 (PDT)
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
X-Inumbo-ID: fb851875-fca1-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713348313; x=1713953113; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fWDZsyZne5YGeThQFd3jP/j4wvEA0gZdlneLKcMfcRs=;
        b=YVa9QPkY+rDwruABzZqlqPtQJ8xbL+r+W9zZbGFVm81Qa1pb7sgKcBIwTJzjwpVmiz
         RdrgB80UNfrOgunZT9SzL/z+Gy7A+BahiXj1JqdlnBfm2hpr7SoGdRv3KvNaD91RsM1K
         CD5z+LXsOWlUrDzJnyOrAau4h1GL7FRGkVc6e3V/5DJewLNQj/38kfILFyBxgCNseq5/
         Hxsz7beM8CjoOtsSomsnhWCskXm8zIEwkwUZ+vQdPWBlHMxFt8qvRx3XvalJwU+toztc
         ZkAAzdr+LVjtzzvvja9OWhwseQv5ayD7K6rmLSMhzIIwNXOlcDsUqhnBCZXKAcS1emy5
         eS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713348313; x=1713953113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fWDZsyZne5YGeThQFd3jP/j4wvEA0gZdlneLKcMfcRs=;
        b=CwXUXjred44+xQMIfYyeKFCPWcyeN9zJATDRGkf2DX3QjYqV4YaB282oBRGZrBdPX7
         N2zAYGzHdpihDAjCgACRjCBxpw0G3i3S3C13DooZLIkjBNWdjvk4VnlwlHqJDO+o7MLh
         UtbKKNxtmI/jWWNk5MiWlqase8LOxtFc68TT/mZBoC3Ut8pnFMET/9yE9QI6aT4DfUNE
         +iaIGjHuFcf2uXCLHSSs7UOemrzcP3MlEMTv3rx9GCNFy96Lzp0vF3oj8UTploHhod2c
         JSurYlqKXfJoWnQlMmB7OMxDUZeBmyXAUnta9C/1Zh8hX9+lZifH2vSyrTKwtrISYXmS
         6mkg==
X-Gm-Message-State: AOJu0YxKLzO9PPGN/BzJxIXym7x9R8aRZUqrmfsYKJdzU4Is6M//MQ4u
	osqAfStg8qiBgXK1LvjmcfyvKqpZhSuCK95rCMiIcYNXIxUxLNas9kKLhg==
X-Google-Smtp-Source: AGHT+IE+/TNufPjXchQ1zDG/JMqVhQ2GMe38joHXTWTnUf7X4Aztcu2+v5xHhz/M3essvOIpttKv3Q==
X-Received: by 2002:a19:640e:0:b0:516:cf23:588 with SMTP id y14-20020a19640e000000b00516cf230588mr11757217lfb.27.1713348313232;
        Wed, 17 Apr 2024 03:05:13 -0700 (PDT)
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
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v8 07/17] xen/riscv: introduce io.h
Date: Wed, 17 Apr 2024 12:04:50 +0200
Message-ID: <7f76236845970a011b4fd3e2c93e8f01d811041b.1713347222.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1713347222.git.oleksii.kurochko@gmail.com>
References: <cover.1713347222.git.oleksii.kurochko@gmail.com>
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
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V8:
 - Add Acked-by: Jan Beulich <jbeulich@suse.com>.
---
Changes in V7:
 - update the comment message in riscv/io.h at the top.
 - code style fixes.
 - back const in places where it should be.
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
 xen/arch/riscv/include/asm/io.h | 168 ++++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/io.h

diff --git a/xen/arch/riscv/include/asm/io.h b/xen/arch/riscv/include/asm/io.h
new file mode 100644
index 0000000000..8d9535e973
--- /dev/null
+++ b/xen/arch/riscv/include/asm/io.h
@@ -0,0 +1,168 @@
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
+ *   - drop "#define _raw_{read,write}{b,w,l,q} _raw_{read,write}{b,w,l,q}"
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
+    asm volatile ( "sb %1, %0"
+                   : "=m" (*(volatile uint8_t __force *)addr) : "r" (val) );
+}
+
+static inline void __raw_writew(uint16_t val, volatile void __iomem *addr)
+{
+    asm volatile ( "sh %1, %0"
+                   : "=m" (*(volatile uint16_t __force *)addr) : "r" (val) );
+}
+
+static inline void __raw_writel(uint32_t val, volatile void __iomem *addr)
+{
+    asm volatile ( "sw %1, %0"
+                   : "=m" (*(volatile uint32_t __force *)addr) : "r" (val) );
+}
+
+static inline void __raw_writeq(uint64_t val, volatile void __iomem *addr)
+{
+#ifdef CONFIG_RISCV_32
+    BUILD_BUG_ON("unimplemented");
+#else
+    asm volatile ( "sd %1, %0"
+                   : "=m" (*(volatile uint64_t __force *)addr) : "r" (val) );
+#endif
+}
+
+static inline uint8_t __raw_readb(const volatile void __iomem *addr)
+{
+    uint8_t val;
+
+    asm volatile ( "lb %0, %1" : "=r" (val)
+                   : "m" (*(const volatile uint8_t __force *)addr) );
+    return val;
+}
+
+static inline uint16_t __raw_readw(const volatile void __iomem *addr)
+{
+    uint16_t val;
+
+    asm volatile ( "lh %0, %1" : "=r" (val)
+                   : "m" (*(const volatile uint16_t __force *)addr) );
+    return val;
+}
+
+static inline uint32_t __raw_readl(const volatile void __iomem *addr)
+{
+    uint32_t val;
+
+    asm volatile ( "lw %0, %1" : "=r" (val)
+                   : "m" (*(const volatile uint32_t __force *)addr) );
+    return val;
+}
+
+static inline uint64_t __raw_readq(const volatile void __iomem *addr)
+{
+    uint64_t val;
+
+#ifdef CONFIG_RISCV_32
+    BUILD_BUG_ON("unimplemented");
+#else
+    asm volatile ( "ld %0, %1" : "=r" (val)
+                   : "m" (*(const volatile uint64_t __force *)addr) );
+#endif
+
+    return val;
+}
+
+
+/*
+ * Unordered I/O memory access primitives.  These are even more relaxed than
+ * the relaxed versions, as they don't even order accesses between successive
+ * operations to the I/O regions.
+ */
+#define readb_cpu(c)        __raw_readb(c)
+#define readw_cpu(c)        __raw_readw(c)
+#define readl_cpu(c)        __raw_readl(c)
+#define readq_cpu(c)        __raw_readq(c)
+
+#define writeb_cpu(v, c)    __raw_writeb(v, c)
+#define writew_cpu(v, c)    __raw_writew(v, c)
+#define writel_cpu(v, c)    __raw_writel(v, c)
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
+#define readb(c) ({ uint8_t  v_; __io_br(); v_ = readb_cpu(c); __io_ar(); v_; })
+#define readw(c) ({ uint16_t v_; __io_br(); v_ = readw_cpu(c); __io_ar(); v_; })
+#define readl(c) ({ uint32_t v_; __io_br(); v_ = readl_cpu(c); __io_ar(); v_; })
+#define readq(c) ({ uint64_t v_; __io_br(); v_ = readq_cpu(c); __io_ar(); v_; })
+
+#define writeb(v, c)    ({ __io_bw(); writeb_cpu(v, c); __io_aw(); })
+#define writew(v, c)    ({ __io_bw(); writew_cpu(v, c); __io_aw(); })
+#define writel(v, c)    ({ __io_bw(); writel_cpu(v, c); __io_aw(); })
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
2.44.0


