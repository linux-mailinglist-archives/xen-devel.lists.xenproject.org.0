Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 854457263EC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 17:16:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544853.850929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ut2-0005Db-EL; Wed, 07 Jun 2023 15:15:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544853.850929; Wed, 07 Jun 2023 15:15:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6ut2-00054D-9b; Wed, 07 Jun 2023 15:15:48 +0000
Received: by outflank-mailman (input) for mailman id 544853;
 Wed, 07 Jun 2023 15:06:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/iFR=B3=anastas.io=shawn@srs-se1.protection.inumbo.net>)
 id 1q6ukO-0003y0-OE
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 15:06:52 +0000
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed5d198b-0544-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 17:06:50 +0200 (CEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id ABDCD3F083;
 Wed,  7 Jun 2023 08:06:47 -0700 (PDT)
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
X-Inumbo-ID: ed5d198b-0544-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=anastas.io; s=mail;
	t=1686150408; bh=jdDMw3/DDAuOH0kHDqrmKQF6OjPTpwJqojrrVzdGhEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VevSMB2SyIaEVB5lNVMtC2td0VLDL9IH2mMrEMQVz+8jhEnTvfMBD0L3maQCeFNHW
	 n4hRnWIjrkLgUT66XBxEvQh2Q50CLjS+HNr95PqKy6uzDQ1Y/MjG19KjYYxz9gqNkV
	 epc9tBssfqIxr9o57I2+Vpozb827ambEZAhZIgRBuB3Xui3ddfafEeuUPFYx1h9qym
	 +JtEecEXjk1TK0e9NzNANrg3SX9tK3UsxB+prm/FxWf0dBV3Y3VjWi73TkCyYGtuGn
	 /phc+fsmhktB5WMJnOmVYvq2t+lwgvS0Ej0dRcUsgtKDrZWRPMs9lA9eq6CHJ4+JYT
	 jvOwo2jm3zxBg==
From: Shawn Anastasio <shawn@anastas.io>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <shawn@anastas.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Shawn Anastasio <shawnanastasio@raptorengineering.com>
Subject: [PATCH 2/3] xen/ppc: Implement early serial printk on PaPR/pseries
Date: Wed,  7 Jun 2023 10:06:33 -0500
Message-Id: <e9a4878544d264688578d7899867df7e8207aba5.1686148363.git.shawn@anastas.io>
In-Reply-To: <cover.1686148363.git.shawn@anastas.io>
References: <cover.1686148363.git.shawn@anastas.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
are provided by OpenFirmware, including an early serial console.
Implement the required interfaces to call into OpenFirmware and write
to the serial console.

Since OpenFirmware runs in 32-bit Big Endian mode and Xen runs in
64-bit Little Endian mode, a thunk is required to save/restore
any potentially-clobbered registers as well as to perform the
required endianness switch. Thankfully, linux already has such
a routine, which was imported into head.S.

Support for bare metal (PowerNV) will be implemented in a future
patch.

Signed-off-by: Shawn Anastasio <shawnanastasio@raptorengineering.com>
---
 xen/arch/ppc/Kconfig.debug               |   5 +
 xen/arch/ppc/Makefile                    |   3 +-
 xen/arch/ppc/boot_of.c                   | 122 +++++++++++++++++++++++
 xen/arch/ppc/configs/openpower_defconfig |   1 +
 xen/arch/ppc/early_printk.c              |  36 +++++++
 xen/arch/ppc/include/asm/boot.h          |  31 ++++++
 xen/arch/ppc/include/asm/bug.h           |   6 ++
 xen/arch/ppc/include/asm/byteorder.h     |  74 ++++++++++++++
 xen/arch/ppc/include/asm/cache.h         |   6 ++
 xen/arch/ppc/include/asm/config.h        |   3 +
 xen/arch/ppc/include/asm/early_printk.h  |  14 +++
 xen/arch/ppc/include/asm/processor.h     |  54 +++++++++-
 xen/arch/ppc/include/asm/string.h        |   6 ++
 xen/arch/ppc/include/asm/types.h         |  64 ++++++++++++
 xen/arch/ppc/ppc64/asm-offsets.c         |  55 ++++++++++
 xen/arch/ppc/ppc64/head.S                |  59 +++++++++++
 xen/arch/ppc/setup.c                     |  20 +++-
 17 files changed, 555 insertions(+), 4 deletions(-)
 create mode 100644 xen/arch/ppc/boot_of.c
 create mode 100644 xen/arch/ppc/early_printk.c
 create mode 100644 xen/arch/ppc/include/asm/boot.h
 create mode 100644 xen/arch/ppc/include/asm/bug.h
 create mode 100644 xen/arch/ppc/include/asm/byteorder.h
 create mode 100644 xen/arch/ppc/include/asm/cache.h
 create mode 100644 xen/arch/ppc/include/asm/early_printk.h
 create mode 100644 xen/arch/ppc/include/asm/string.h
 create mode 100644 xen/arch/ppc/include/asm/types.h

diff --git a/xen/arch/ppc/Kconfig.debug b/xen/arch/ppc/Kconfig.debug
index e69de29bb2..3c25a446e8 100644
--- a/xen/arch/ppc/Kconfig.debug
+++ b/xen/arch/ppc/Kconfig.debug
@@ -0,0 +1,5 @@
+config EARLY_PRINTK
+    bool "Enable early printk"
+    default DEBUG
+    help
+      Enables early printk debug messages
\ No newline at end of file
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index b3ad837d4b..00b3b7baf3 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -1,5 +1,6 @@
 obj-$(CONFIG_PPC64) += ppc64/
-obj-y += setup.o
+obj-y += setup.o boot_of.o
+obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 
 $(TARGET): $(TARGET)-syms
 	cp -f $< $@
diff --git a/xen/arch/ppc/boot_of.c b/xen/arch/ppc/boot_of.c
new file mode 100644
index 0000000000..9447d92661
--- /dev/null
+++ b/xen/arch/ppc/boot_of.c
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
+ *
+ * Copyright IBM Corp. 2005, 2006, 2007
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Hollis Blanchard <hollisb@us.ibm.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#include <xen/kernel.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+#include <asm/byteorder.h>
+#include <asm/boot.h>
+
+#define ADDR(x) (uint32_t)(unsigned long)(x)
+
+/* OF entrypoint*/
+static unsigned long of_vec;
+
+/* OF device handles*/
+static int bof_chosen;
+static int of_out;
+
+static int of_call(const char *service, uint32_t nargs, uint32_t nrets,
+                   int32_t rets[], ...)
+{
+    int rc;
+    va_list args;
+    int i;
+    struct of_service s = { 0 };
+
+    s.ofs_service = cpu_to_be32(ADDR(service));
+    s.ofs_nargs = cpu_to_be32(nargs);
+    s.ofs_nrets = cpu_to_be32(nrets);
+
+    /* copy all the params into the args array */
+    va_start(args, rets);
+
+    for ( i = 0; i < nargs; i++ )
+    {
+        s.ofs_args[i] = cpu_to_be32(va_arg(args, uint32_t));
+    }
+
+    va_end(args);
+
+    rc = enter_prom(&s, of_vec);
+
+    /* yes always to the copy, just in case */
+    for ( i = 0; i < nrets; i++ )
+    {
+        rets[i] = be32_to_cpu(s.ofs_args[i + nargs]);
+    }
+
+    return rc;
+}
+
+static int of_finddevice(const char *devspec)
+{
+    int rets[1] = { OF_FAILURE };
+
+    of_call("finddevice", 1, 1, rets, devspec);
+    if ( rets[0] == OF_FAILURE )
+        return OF_FAILURE;
+
+    return rets[0];
+}
+
+static int of_getprop(int ph, const char *name, void *buf, uint32_t buflen)
+{
+    int rets[1] = { OF_FAILURE };
+
+    of_call("getprop", 4, 1, rets, ph, ADDR(name), buf, buflen);
+
+    if ( rets[0] == OF_FAILURE )
+        return OF_FAILURE;
+
+    return rets[0];
+}
+
+int of_write(int ih, const char *addr, uint32_t len)
+{
+    int rets[1] = { OF_FAILURE };
+
+    if ( of_call("write", 3, 1, rets, ih, addr, len) == OF_FAILURE )
+        return OF_FAILURE;
+
+    return rets[0];
+}
+
+void of_putchar(char c)
+{
+    if ( c == '\n' )
+    {
+        char buf = '\r';
+        (void) of_write(of_out, &buf, 1);
+    }
+    (void) of_write(of_out, &c, 1);
+}
+
+void boot_of_init(unsigned long vec)
+{
+    of_vec = vec;
+    bof_chosen = of_finddevice("/chosen");
+    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
+    of_out = be32_to_cpu(of_out);
+}
\ No newline at end of file
diff --git a/xen/arch/ppc/configs/openpower_defconfig b/xen/arch/ppc/configs/openpower_defconfig
index 8783eb3488..f7cc075e45 100644
--- a/xen/arch/ppc/configs/openpower_defconfig
+++ b/xen/arch/ppc/configs/openpower_defconfig
@@ -10,4 +10,5 @@
 CONFIG_PPC64=y
 CONFIG_DEBUG=y
 CONFIG_DEBUG_INFO=y
+CONFIG_EARLY_PRINTK=y
 CONFIG_EXPERT=y
diff --git a/xen/arch/ppc/early_printk.c b/xen/arch/ppc/early_printk.c
new file mode 100644
index 0000000000..ab9213d801
--- /dev/null
+++ b/xen/arch/ppc/early_printk.c
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Power early printk using OpenFirmware or OPAL
+ *
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#include <xen/lib.h>
+#include <asm/boot.h>
+
+static void (*putchar_func)(char);
+
+void early_printk_init(bool is_of)
+{
+    putchar_func = is_of ? of_putchar : NULL;
+}
+
+void early_puts(const char *s, size_t nr)
+{
+    if ( !putchar_func )
+        return;
+
+    while ( nr-- > 0 )
+        putchar_func(*s++);
+}
+
+void early_printk(const char *s)
+{
+    if ( !putchar_func )
+        return;
+
+    while ( *s )
+        putchar_func(*s++);
+}
\ No newline at end of file
diff --git a/xen/arch/ppc/include/asm/boot.h b/xen/arch/ppc/include/asm/boot.h
new file mode 100644
index 0000000000..96d56f9650
--- /dev/null
+++ b/xen/arch/ppc/include/asm/boot.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Shawn Anastasio <@raptorengineering.com>
+ */
+
+#ifndef _ASM_PPC_BOOT_H
+#define _ASM_PPC_BOOT_H
+
+#include <xen/types.h>
+
+/* a collection of interfaces used during boot. */
+enum {
+    OF_FAILURE = -1,
+    OF_SUCCESS = 0,
+};
+
+struct of_service {
+    __be32 ofs_service;
+    __be32 ofs_nargs;
+    __be32 ofs_nrets;
+    __be32 ofs_args[10];
+};
+
+extern int enter_prom(struct of_service *args, unsigned long entry);
+
+void boot_of_init(unsigned long);
+void of_putchar(char c);
+
+#endif /* _ASM_PPC_BOOT_H */
\ No newline at end of file
diff --git a/xen/arch/ppc/include/asm/bug.h b/xen/arch/ppc/include/asm/bug.h
new file mode 100644
index 0000000000..40022a757b
--- /dev/null
+++ b/xen/arch/ppc/include/asm/bug.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_PPC_BUG_H
+#define _ASM_PPC_BUG_H
+
+#endif /* _ASM_PPC_BUG_H */
\ No newline at end of file
diff --git a/xen/arch/ppc/include/asm/byteorder.h b/xen/arch/ppc/include/asm/byteorder.h
new file mode 100644
index 0000000000..ac840f9b1c
--- /dev/null
+++ b/xen/arch/ppc/include/asm/byteorder.h
@@ -0,0 +1,74 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_POWERPC_BYTEORDER_H
+#define _ASM_POWERPC_BYTEORDER_H
+
+#include <asm/types.h>
+#include <xen/compiler.h>
+
+static inline __u16 ld_le16(const volatile __u16 *addr)
+{
+    __u16 val;
+
+    asm volatile ("lhbrx %0,0,%1" : "=r" (val) : "r" (addr), "m" (*addr));
+    return val;
+}
+
+static inline void st_le16(volatile __u16 *addr, const __u16 val)
+{
+    asm volatile ("sthbrx %1,0,%2" : "=m" (*addr) : "r" (val), "r" (addr));
+}
+
+static inline __u32 ld_le32(const volatile __u32 *addr)
+{
+    __u32 val;
+
+    asm volatile ("lwbrx %0,0,%1" : "=r" (val) : "r" (addr), "m" (*addr));
+    return val;
+}
+
+static inline void st_le32(volatile __u32 *addr, const __u32 val)
+{
+    asm volatile ("stwbrx %1,0,%2" : "=m" (*addr) : "r" (val), "r" (addr));
+}
+
+static inline __attribute_const__ __u16 ___arch__swab16(__u16 value)
+{
+    __u16 result;
+
+    asm("rlwimi %0,%1,8,16,23"
+        : "=r" (result)
+        : "r" (value), "0" (value >> 8));
+    return result;
+}
+
+static inline __attribute_const__ __u32 ___arch__swab32(__u32 value)
+{
+    __u32 result;
+
+    asm("rlwimi %0,%1,24,16,23\n\t"
+        "rlwimi %0,%1,8,8,15\n\t"
+        "rlwimi %0,%1,24,0,7"
+        : "=r" (result)
+        : "r" (value), "0" (value >> 24));
+    return result;
+}
+
+#define __arch__swab16(x) ___arch__swab16(x)
+#define __arch__swab32(x) ___arch__swab32(x)
+
+/* The same, but returns converted value from the location pointer by addr. */
+#define __arch__swab16p(addr) ld_le16(addr)
+#define __arch__swab32p(addr) ld_le32(addr)
+
+/* The same, but do the conversion in situ, ie. put the value back to addr. */
+#define __arch__swab16s(addr) st_le16(addr,*addr)
+#define __arch__swab32s(addr) st_le32(addr,*addr)
+
+#define __BYTEORDER_HAS_U64__
+#ifndef __powerpc64__
+#define __SWAB_64_THRU_32__
+#endif /* __powerpc64__ */
+
+#include <xen/byteorder/little_endian.h>
+
+#endif /* _ASM_POWERPC_BYTEORDER_H */
diff --git a/xen/arch/ppc/include/asm/cache.h b/xen/arch/ppc/include/asm/cache.h
new file mode 100644
index 0000000000..677a2b3915
--- /dev/null
+++ b/xen/arch/ppc/include/asm/cache.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_PPC_CACHE_H
+#define _ASM_PPC_CACHE_H
+
+#endif /* _ASM_PPC_CACHE_H */
\ No newline at end of file
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm/config.h
index 7a2862ef7a..a3438de92b 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -52,6 +52,9 @@
 /* size of minimum stack frame; C code can write into the caller's stack */
 #define STACK_FRAME_OVERHEAD 32
 
+/* size of minimum stack frame that can hold an entire cpu_user_regs struct */
+#define STACK_SWITCH_FRAME_SIZE (UREGS_sizeof + STACK_FRAME_OVERHEAD)
+
 #endif /* __PPC_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/ppc/include/asm/early_printk.h b/xen/arch/ppc/include/asm/early_printk.h
new file mode 100644
index 0000000000..a9566a1240
--- /dev/null
+++ b/xen/arch/ppc/include/asm/early_printk.h
@@ -0,0 +1,14 @@
+#ifndef __EARLY_PRINTK_H__
+#define __EARLY_PRINTK_H__
+
+#include <xen/early_printk.h>
+
+#ifdef CONFIG_EARLY_PRINTK
+void early_printk_init(bool is_of);
+void early_printk(const char *str);
+#else
+static inline void early_printk_init(bool is_of) {}
+static inline void early_printk(const char *s) {}
+#endif
+
+#endif /* __EARLY_PRINTK_H__ */
\ No newline at end of file
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/asm/processor.h
index 0ab7bfc9df..63409f003a 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -114,7 +114,42 @@
 #define PVR_970MP     0x0044
 #define PVR_BE        0x0070
 
-#ifdef __ASSEMBLY__
+#ifndef __ASSEMBLY__
+
+#include <xen/types.h>
+
+/* User-accessible registers: nost of these need to be saved/restored
+ * for every nested Xen invocation. */
+struct cpu_user_regs
+{
+    uint64_t gprs[32];
+    uint64_t lr;
+    uint64_t ctr;
+    uint64_t srr0;
+    uint64_t srr1;
+    uint64_t pc;
+    uint64_t msr;
+    uint64_t fpscr; /* XXX Is this necessary */
+    uint64_t xer;
+    uint64_t hid4;  /* debug only */
+    uint64_t dar;   /* debug only */
+    uint32_t dsisr; /* debug only */
+    uint32_t cr;
+    uint32_t __pad; /* good spot for another 32bit reg */
+    uint32_t entry_vector;
+};
+
+static __inline__ void sync(void)
+{
+    __asm__ __volatile__("sync");
+}
+
+static __inline__ void isync(void)
+{
+    __asm__ __volatile__("isync");
+}
+
+#else
 
 #define LOADADDR(rn, name)                                                     \
     lis rn, name##@highest;                                                    \
@@ -152,6 +187,22 @@
     .long 0xa6037b7d; /* mtsrr1 r11                         */                 \
     .long 0x2400004c  /* rfid                               */
 
+/* Taken from Linux kernel source (arch/powerpc/boot/crt0.S) */
+.macro OP_REGS op, width, start, end, base, offset
+	.Lreg=\start
+	.rept (\end - \start + 1)
+	\op	.Lreg,\offset+\width*.Lreg(\base)
+	.Lreg=.Lreg+1
+	.endr
+.endm
+
+#define SAVE_GPRS(start, end, base) OP_REGS std, 8, start, end, base, 0
+#define REST_GPRS(start, end, base) OP_REGS ld, 8, start, end, base, 0
+#define SAVE_GPR(n, base)           SAVE_GPRS(n, n, base)
+#define REST_GPR(n, base)           REST_GPRS(n, n, base)
+#define SAVE_NVGPRS(base)           SAVE_GPRS(14, 31, base)
+#define REST_NVGPRS(base)           REST_GPRS(14, 31, base)
+
 #define _GLOBAL(name)                                                          \
     .section ".text";                                                          \
     .align 2;                                                                  \
@@ -167,7 +218,6 @@
 
 #define _ENTRY(name) name
 
-#else  /* __ASSEMBLY__ */
 #endif /* __ASSEMBLY__ */
 
 #endif
diff --git a/xen/arch/ppc/include/asm/string.h b/xen/arch/ppc/include/asm/string.h
new file mode 100644
index 0000000000..aed83b0d47
--- /dev/null
+++ b/xen/arch/ppc/include/asm/string.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _ASM_PPC_STRING_H
+#define _ASM_PPC_STRING_H
+
+#endif /* _ASM_PPC_STRING_H */
\ No newline at end of file
diff --git a/xen/arch/ppc/include/asm/types.h b/xen/arch/ppc/include/asm/types.h
new file mode 100644
index 0000000000..44b5df49f2
--- /dev/null
+++ b/xen/arch/ppc/include/asm/types.h
@@ -0,0 +1,64 @@
+/* from xen/include/asm-x86/types.h */
+
+#ifndef _PPC_TYPES_H
+#define _PPC_TYPES_H
+
+#ifndef __ASSEMBLY__
+typedef unsigned short umode_t;
+
+/*
+ * __xx is ok: it doesn't pollute the POSIX namespace. Use these in the
+ * header files exported to user space
+ */
+
+typedef __signed__ char __s8;
+typedef unsigned char __u8;
+
+typedef __signed__ short __s16;
+typedef unsigned short __u16;
+
+typedef __signed__ int __s32;
+typedef unsigned int __u32;
+
+#if defined(__GNUC__) && !defined(__STRICT_ANSI__)
+#if defined(__ppc__)
+typedef __signed__ long long __s64;
+typedef unsigned long long __u64;
+
+#elif defined(__PPC64__)
+typedef __signed__ long __s64;
+typedef unsigned long __u64;
+#endif
+#endif
+
+typedef signed char s8;
+typedef unsigned char u8;
+
+typedef signed short s16;
+typedef unsigned short u16;
+
+typedef signed int s32;
+typedef unsigned int u32;
+
+#if defined(__ppc__)
+typedef signed long long s64;
+typedef unsigned long long u64;
+typedef unsigned int size_t;
+#elif defined(__PPC64__)
+typedef signed long s64;
+typedef unsigned long u64;
+typedef unsigned long size_t;
+#endif
+
+typedef unsigned long paddr_t;
+#define PRIpaddr "08lx"
+
+/* DMA addresses come in generic and 64-bit flavours.  */
+
+typedef unsigned long dma_addr_t;
+typedef u64 dma64_addr_t;
+
+typedef unsigned short xmem_bufctl_t;
+
+#endif  /* __ASSEMBLY__ */
+#endif
diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
index e69de29bb2..a6de2b2768 100644
--- a/xen/arch/ppc/ppc64/asm-offsets.c
+++ b/xen/arch/ppc/ppc64/asm-offsets.c
@@ -0,0 +1,55 @@
+/*
+ * Generate definitions needed by assembly language modules.
+ * This code generates raw asm output which is post-processed
+ * to extract and format the required data.
+ */
+
+#include <asm/processor.h>
+
+#define DEFINE(_sym, _val)                                                 \
+    asm volatile ("\n.ascii\"==>#define " #_sym " %0 /* " #_val " */<==\"" \
+                  : : "i" (_val) )
+#define BLANK()                                                            \
+    asm volatile ( "\n.ascii\"==><==\"" : : )
+#define OFFSET(_sym, _str, _mem)                                           \
+    DEFINE(_sym, offsetof(_str, _mem));
+
+/* base-2 logarithm */
+#define __L2(_x)  (((_x) & 0x00000002) ?   1 : 0)
+#define __L4(_x)  (((_x) & 0x0000000c) ? ( 2 + __L2( (_x)>> 2)) : __L2( _x))
+#define __L8(_x)  (((_x) & 0x000000f0) ? ( 4 + __L4( (_x)>> 4)) : __L4( _x))
+#define __L16(_x) (((_x) & 0x0000ff00) ? ( 8 + __L8( (_x)>> 8)) : __L8( _x))
+#define LOG_2(_x) (((_x) & 0xffff0000) ? (16 + __L16((_x)>>16)) : __L16(_x))
+
+void __dummy__(void)
+{
+    DEFINE(GPR_WIDTH, sizeof(unsigned long));
+    DEFINE(FPR_WIDTH, sizeof(double));
+
+    OFFSET(UREGS_gprs, struct cpu_user_regs, gprs);
+    OFFSET(UREGS_r0, struct cpu_user_regs, gprs[0]);
+    OFFSET(UREGS_r1, struct cpu_user_regs, gprs[1]);
+    OFFSET(UREGS_r13, struct cpu_user_regs, gprs[13]);
+    OFFSET(UREGS_srr0, struct cpu_user_regs, srr0);
+    OFFSET(UREGS_srr1, struct cpu_user_regs, srr1);
+    OFFSET(UREGS_pc, struct cpu_user_regs, pc);
+    OFFSET(UREGS_msr, struct cpu_user_regs, msr);
+    OFFSET(UREGS_lr, struct cpu_user_regs, lr);
+    OFFSET(UREGS_ctr, struct cpu_user_regs, ctr);
+    OFFSET(UREGS_xer, struct cpu_user_regs, xer);
+    OFFSET(UREGS_hid4, struct cpu_user_regs, hid4);
+    OFFSET(UREGS_dar, struct cpu_user_regs, dar);
+    OFFSET(UREGS_dsisr, struct cpu_user_regs, dsisr);
+    OFFSET(UREGS_cr, struct cpu_user_regs, cr);
+    OFFSET(UREGS_fpscr, struct cpu_user_regs, fpscr);
+    DEFINE(UREGS_sizeof, sizeof(struct cpu_user_regs));
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index d91b0972ae..d5ca1c08ad 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -65,3 +65,62 @@ cpu0_boot_stack_bottom:
     .space STACK_SIZE
 cpu0_boot_stack:
     .space STACK_FRAME_OVERHEAD
+
+/* Adapted from Linux kernel source (arch/powerpc/boot/crt0.S) */
+_GLOBAL(enter_prom)
+    mflr r0
+    std r0,16(r1)
+    stdu r1,-STACK_SWITCH_FRAME_SIZE(r1) /* Save SP and create stack space */
+
+    /* Because PROM is running in 32b mode, it clobbers the high order half
+     * of all registers that it saves.  We therefore save those registers
+     * PROM might touch to the stack.  (r0, r3-r13 are caller saved)
+     */
+    SAVE_GPR(2, r1)
+    SAVE_GPR(13, r1)
+    SAVE_NVGPRS(r1)
+    mfcr r10
+    mfmsr r11
+    std r10,UREGS_cr(r1)
+    std r11,UREGS_msr(r1)
+
+    /* Put PROM address in SRR0 */
+    mtsrr0 r4
+
+    /* Setup our trampoline return addr in LR */
+    bcl 20,31,$+4
+0:  mflr r4
+    addi r4,r4,(1f - 0b)
+    mtlr r4
+
+    /* Prepare a 32-bit mode big endian MSR
+     */
+    SET_REG_TO_CONST(r12, MSR_SF | MSR_LE)
+    andc r11,r11,r12
+    mtsrr1 r11
+    rfid
+
+1:  /* Return from OF */
+    FIXUP_ENDIAN
+
+    /* Just make sure that r1 top 32 bits didn't get
+     * corrupt by OF
+     */
+    rldicl    r1,r1,0,32
+
+    /* Restore the MSR (back to 64 bits) */
+    ld    r0,UREGS_msr(r1)
+    mtmsrd r0
+    isync
+
+    /* Restore other registers */
+    REST_GPR(2, r1)
+    REST_GPR(13, r1)
+    REST_NVGPRS(r1)
+    ld r4,UREGS_cr(r1)
+    mtcr r4
+
+    addi r1,r1,STACK_SWITCH_FRAME_SIZE
+    ld r0,16(r1)
+    mtlr r0
+    blr
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index c9509fb6a6..fb12d4df34 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,9 +1,27 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/compile.h>
 #include <xen/init.h>
+#include <asm/boot.h>
+#include <asm/early_printk.h>
 
-void __init noreturn start_xen(void)
+void __init noreturn start_xen(unsigned long r3, unsigned long r4,
+                               unsigned long r5, unsigned long r6,
+                               unsigned long r7)
 {
+    if ( r5 )
+    {
+        /* OF boot protocol */
+        boot_of_init(r5);
+        early_printk_init(true);
+    }
+    else
+    {
+        /* kexec boot: Unimplemented */
+        __builtin_trap();
+    }
+
+    early_printk("Hello, ppc64le!\n");
+
     for ( ;; )
     {
         // Set current hardware thread to very low priority
-- 
2.30.2


