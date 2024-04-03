Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE67896C04
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 12:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700401.1093534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjL-0001Jx-8D; Wed, 03 Apr 2024 10:20:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700401.1093534; Wed, 03 Apr 2024 10:20:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rrxjL-0001Bd-0k; Wed, 03 Apr 2024 10:20:31 +0000
Received: by outflank-mailman (input) for mailman id 700401;
 Wed, 03 Apr 2024 10:20:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YDNC=LI=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rrxjJ-0007Ob-Ii
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 10:20:29 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ca9951b8-f1a3-11ee-a1ef-f123f15fe8a2;
 Wed, 03 Apr 2024 12:20:27 +0200 (CEST)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-516bfcc775bso518245e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 03:20:27 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 k33-20020a0565123da100b00516a18f9080sm1161237lfv.257.2024.04.03.03.20.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 03:20:25 -0700 (PDT)
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
X-Inumbo-ID: ca9951b8-f1a3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712139626; x=1712744426; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+HDh8IV77FXQGXaRZndSlP4yD6TWiB0Ale2ssCyU1w=;
        b=AVlDLYO0nkkVQW0D7VJw+I8YwjOY4e5J5EQ115kkm/FBCt+BE18NKMItaceZ5u6sSF
         BYB/5oFKRdu8dV2yIhFnhcy6MUlvvcUs3qrVYyPdBTmpG4XwIp8dQAiEjVOtW0c7hj0Q
         BvRp8wR+AmBP1CdynY7qIVRH909hr5JowNzhGNAqRT6whPYVyd5IYR6mnOG5HQ734jpm
         Zneg6bwJkfN8nR/ZMamRDdOSCqgUuXSVba8SfJh5Bd+zf+ejqwc5AayHUrxGyzCdsDqL
         Jt8Qay/lJzG/TlxZ9cT/cNKnxuJpL6He+GUPziu4n5nZHtKbMhBROzJi8qwZu4HlOwrv
         7Fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712139626; x=1712744426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w+HDh8IV77FXQGXaRZndSlP4yD6TWiB0Ale2ssCyU1w=;
        b=PSA+3nuAkzxm3EY7HBANMyW0U5UoZCbSt6l+hT+67ddrGaVKx20F8eJfnajw67iafv
         OJHueMznMUEpYrl1wl1Z21o8HTyaeJU9AB+2CvBXLqVG9ll+vwn8gChQDmHDcb4StHaK
         ZC9AupHOuiSHRuYk3zYFmqc6WK8SxYT9Tr6Yrcl2bA1LypVRIUGK2TkvT60rx4ViU+qw
         HpunonsZh6/lhVxcLMF/45zSR0hwekOu3AtuvVwsfB90MeDDSvaEO0A3UjvbUFFnE1ec
         SGHAHhNxsZJQJM+5zWQAd38wnOtqF56K8ZZJsJsVWvuq6XjJIcXbdeIgrqDHD5uanjc/
         G6Dw==
X-Gm-Message-State: AOJu0Yx701x0mwlwYJWxZH3AVTy4l/f8axRRnvgb3pP38Q/5Sw3zvT8M
	TDvNx34fCjBlLMy0rj4uANxYoE0lslSJ/GYauEM8dtcK1TO2AeBdUgIYWIng
X-Google-Smtp-Source: AGHT+IHMVhi3TlunI/s+BnyX8enNVGgrETbDRm0rCS3aPVZdIH5NQFeyYQUThvcJr6y6asTR7/B6WQ==
X-Received: by 2002:ac2:5e91:0:b0:515:8c9e:d164 with SMTP id b17-20020ac25e91000000b005158c9ed164mr12866101lfq.1.1712139626426;
        Wed, 03 Apr 2024 03:20:26 -0700 (PDT)
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
Subject: [PATCH v7 09/19] xen/riscv: introduce io.h
Date: Wed,  3 Apr 2024 12:20:02 +0200
Message-ID: <347fe73b80601aec26e2dba5beefe7b3036943e3.1712137031.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1712137031.git.oleksii.kurochko@gmail.com>
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
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
2.43.0


