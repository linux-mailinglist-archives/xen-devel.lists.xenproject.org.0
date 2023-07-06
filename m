Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE37B74A41F
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 21:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560048.875648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUI8-0006Qi-M5; Thu, 06 Jul 2023 19:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560048.875648; Thu, 06 Jul 2023 19:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUI8-0006Ne-Fy; Thu, 06 Jul 2023 19:05:24 +0000
Received: by outflank-mailman (input) for mailman id 560048;
 Thu, 06 Jul 2023 19:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuuY=CY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qHUI7-0005ct-1e
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 19:05:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d38f780-1c30-11ee-8611-37d641c3527e;
 Thu, 06 Jul 2023 21:05:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id BD48D8285730;
 Thu,  6 Jul 2023 14:05:19 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id niZpaZRW4zAv; Thu,  6 Jul 2023 14:05:15 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E314D828573A;
 Thu,  6 Jul 2023 14:05:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qqjirBYSRP74; Thu,  6 Jul 2023 14:05:14 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 65DDC8285741;
 Thu,  6 Jul 2023 14:05:14 -0500 (CDT)
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
X-Inumbo-ID: 0d38f780-1c30-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E314D828573A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1688670314; bh=iT/kxfPyFb1GfSxJiSkrtxjbxMpPwhwpcrYOxHz76Wc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=Bs1RLXVVWuU4jH96DMnSX6lQBDhikl/M/vAAPgqgF5JyR2ppvQ+89ys93grOotyfe
	 c3E3rz+4ZCXTUfeVA60c5fLcSz64kCM/lmEmwiMdUnNyBBkI12ZznEi5lFyer87Ey3
	 OAYRQFquPOWBAcAkKMQ7CJGpTK/VF2A29qGNMz7I=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 2/3] xen/ppc: Implement early serial printk on pseries
Date: Thu,  6 Jul 2023 14:04:40 -0500
Message-Id: <85172d385a730e196999b366207e2b2e8a261906.1688670018.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1688670018.git.sanastasio@raptorengineering.com>
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On typical Power VMs (e.g. QEMU's -M pseries), a variety of services
including an early serial console are provided by Open Firmware.
Implement the required interfaces to call into Open Firmware and write
to the serial console.

Since Open Firmware runs in 32-bit Big Endian mode and Xen runs in
64-bit Little Endian mode, a thunk is required to save/restore
any potentially-clobbered registers as well as to perform the
required endianness switch. Thankfully, linux already has such
a routine, which was imported into ppc64/of-call.S.

Support for bare metal (PowerNV) will be implemented in a future
patch.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Kconfig.debug              |   5 +
 xen/arch/ppc/Makefile                   |   2 +
 xen/arch/ppc/boot-of.c                  | 100 +++++++++++++++++
 xen/arch/ppc/configs/ppc64_defconfig    |   1 +
 xen/arch/ppc/early_printk.c             |  28 +++++
 xen/arch/ppc/include/asm/asm-defns.h    |  17 +++
 xen/arch/ppc/include/asm/boot.h         |  23 ++++
 xen/arch/ppc/include/asm/byteorder.h    |  12 ++
 xen/arch/ppc/include/asm/config.h       |   3 +
 xen/arch/ppc/include/asm/early_printk.h |  15 +++
 xen/arch/ppc/include/asm/msr.h          |  51 +++++++++
 xen/arch/ppc/include/asm/processor.h    | 139 ++++++++++++++++++++++++
 xen/arch/ppc/include/asm/types.h        |  21 ++++
 xen/arch/ppc/ppc64/Makefile             |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c        |  59 ++++++++++
 xen/arch/ppc/ppc64/head.S               |   9 ++
 xen/arch/ppc/ppc64/of-call.S            |  83 ++++++++++++++
 xen/arch/ppc/setup.c                    |  19 +++-
 18 files changed, 585 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/ppc/boot-of.c
 create mode 100644 xen/arch/ppc/early_printk.c
 create mode 100644 xen/arch/ppc/include/asm/boot.h
 create mode 100644 xen/arch/ppc/include/asm/byteorder.h
 create mode 100644 xen/arch/ppc/include/asm/early_printk.h
 create mode 100644 xen/arch/ppc/include/asm/msr.h
 create mode 100644 xen/arch/ppc/include/asm/processor.h
 create mode 100644 xen/arch/ppc/include/asm/types.h
 create mode 100644 xen/arch/ppc/ppc64/of-call.S

diff --git a/xen/arch/ppc/Kconfig.debug b/xen/arch/ppc/Kconfig.debug
index e69de29bb2..608c9ff832 100644
--- a/xen/arch/ppc/Kconfig.debug
+++ b/xen/arch/ppc/Kconfig.debug
@@ -0,0 +1,5 @@
+config EARLY_PRINTK
+    bool "Enable early printk"
+    default DEBUG
+    help
+      Enables early printk debug messages
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 530fba2121..e1d4590d67 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -1,5 +1,7 @@
 obj-$(CONFIG_PPC64) +=3D ppc64/
=20
+obj-y +=3D boot-of.init.o
+obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
 obj-y +=3D setup.o
=20
 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/ppc/boot-of.c b/xen/arch/ppc/boot-of.c
new file mode 100644
index 0000000000..6c69ca94ba
--- /dev/null
+++ b/xen/arch/ppc/boot-of.c
@@ -0,0 +1,100 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright IBM Corp. 2005, 2006, 2007
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Hollis Blanchard <hollisb@us.ibm.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#include <xen/init.h>
+#include <xen/stdarg.h>
+#include <xen/types.h>
+#include <asm/boot.h>
+#include <asm/byteorder.h>
+#include <asm/early_printk.h>
+
+#define ADDR(x) (uint32_t)(unsigned long)(x)
+
+/* OF entrypoint*/
+static unsigned long __initdata of_vec;
+
+/* OF device handles*/
+static int __initdata bof_chosen;
+static int __initdata of_out;
+
+static int __init of_call(const char *service, uint32_t nargs, uint32_t =
nrets,
+                   int32_t rets[], ...)
+{
+    int rc;
+    va_list args;
+    int i;
+    struct of_service s =3D { 0 };
+
+    s.ofs_service =3D cpu_to_be32(ADDR(service));
+    s.ofs_nargs =3D cpu_to_be32(nargs);
+    s.ofs_nrets =3D cpu_to_be32(nrets);
+
+    /* copy all the params into the args array */
+    va_start(args, rets);
+
+    for ( i =3D 0; i < nargs; i++ )
+        s.ofs_args[i] =3D cpu_to_be32(va_arg(args, uint32_t));
+
+    va_end(args);
+
+    rc =3D enter_of(&s, of_vec);
+
+    /* copy all return values to the output rets array */
+    for ( i =3D 0; i < nrets; i++ )
+        rets[i] =3D be32_to_cpu(s.ofs_args[i + nargs]);
+
+    return rc;
+}
+
+static int __init of_finddevice(const char *devspec)
+{
+    int rets[1] =3D { OF_FAILURE };
+
+    of_call("finddevice", 1, 1, rets, devspec);
+    return rets[0];
+}
+
+static int __init of_getprop(int ph, const char *name, void *buf, uint32=
_t buflen)
+{
+    int rets[1] =3D { OF_FAILURE };
+
+    of_call("getprop", 4, 1, rets, ph, ADDR(name), buf, buflen);
+    return rets[0];
+}
+
+int __init of_write(int ih, const char *addr, uint32_t len)
+{
+    int rets[1] =3D { OF_FAILURE };
+
+    of_call("write", 3, 1, rets, ih, addr, len);
+    return rets[0];
+}
+
+static void __init of_putchar(char c)
+{
+    if ( c =3D=3D '\n' )
+    {
+        char buf =3D '\r';
+        of_write(of_out, &buf, 1);
+    }
+    of_write(of_out, &c, 1);
+}
+
+void __init boot_of_init(unsigned long vec)
+{
+    of_vec =3D vec;
+
+    /* Get a handle to the default console */
+    bof_chosen =3D of_finddevice("/chosen");
+    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
+    of_out =3D be32_to_cpu(of_out);
+
+    early_printk_init(of_putchar);
+}
diff --git a/xen/arch/ppc/configs/ppc64_defconfig b/xen/arch/ppc/configs/=
ppc64_defconfig
index 8783eb3488..f7cc075e45 100644
--- a/xen/arch/ppc/configs/ppc64_defconfig
+++ b/xen/arch/ppc/configs/ppc64_defconfig
@@ -10,4 +10,5 @@
 CONFIG_PPC64=3Dy
 CONFIG_DEBUG=3Dy
 CONFIG_DEBUG_INFO=3Dy
+CONFIG_EARLY_PRINTK=3Dy
 CONFIG_EXPERT=3Dy
diff --git a/xen/arch/ppc/early_printk.c b/xen/arch/ppc/early_printk.c
new file mode 100644
index 0000000000..c5014945ef
--- /dev/null
+++ b/xen/arch/ppc/early_printk.c
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/init.h>
+#include <asm/boot.h>
+
+static void (*putchar_func)(char);
+
+void __init early_printk_init(void (*putchar)(char))
+{
+    putchar_func =3D putchar;
+}
+
+void __init early_puts(const char *s, size_t nr)
+{
+    if ( !putchar_func )
+        return;
+
+    while ( nr-- > 0 )
+        putchar_func(*s++);
+}
+
+void __init early_printk(const char *s)
+{
+    if ( !putchar_func )
+        return;
+
+    while ( *s )
+        putchar_func(*s++);
+}
diff --git a/xen/arch/ppc/include/asm/asm-defns.h b/xen/arch/ppc/include/=
asm/asm-defns.h
index 6ea35f6edb..9d7328f4a2 100644
--- a/xen/arch/ppc/include/asm/asm-defns.h
+++ b/xen/arch/ppc/include/asm/asm-defns.h
@@ -37,4 +37,21 @@
     .long 0xa6037b7d; /* mtsrr1 r11                         */          =
       \
     .long 0x2400004c  /* rfid                               */
=20
+
+/* Taken from Linux kernel source (arch/powerpc/boot/crt0.S) */
+.macro OP_REGS op, width, start, end, base, offset
+	.Lreg=3D\start
+	.rept (\end - \start + 1)
+	\op	.Lreg,\offset+\width*.Lreg(\base)
+	.Lreg=3D.Lreg+1
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
 #endif /* _ASM_PPC_ASM_DEFNS_H */
diff --git a/xen/arch/ppc/include/asm/boot.h b/xen/arch/ppc/include/asm/b=
oot.h
new file mode 100644
index 0000000000..9b8a7c43c2
--- /dev/null
+++ b/xen/arch/ppc/include/asm/boot.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_PPC_BOOT_H
+#define _ASM_PPC_BOOT_H
+
+#include <xen/types.h>
+
+/* a collection of interfaces used during boot. */
+enum {
+    OF_FAILURE =3D -1,
+    OF_SUCCESS =3D 0,
+};
+
+struct of_service {
+    __be32 ofs_service;
+    __be32 ofs_nargs;
+    __be32 ofs_nrets;
+    __be32 ofs_args[10];
+};
+
+int enter_of(struct of_service *args, unsigned long entry);
+void boot_of_init(unsigned long vec);
+
+#endif /* _ASM_PPC_BOOT_H */
diff --git a/xen/arch/ppc/include/asm/byteorder.h b/xen/arch/ppc/include/=
asm/byteorder.h
new file mode 100644
index 0000000000..2b5f6b9f63
--- /dev/null
+++ b/xen/arch/ppc/include/asm/byteorder.h
@@ -0,0 +1,12 @@
+#ifndef _ASM_PPC_BYTEORDER_H
+#define _ASM_PPC_BYTEORDER_H
+
+#define __arch__swab16 __builtin_bswap16
+#define __arch__swab32 __builtin_bswap32
+#define __arch__swab64 __builtin_bswap64
+
+#define __BYTEORDER_HAS_U64__
+
+#include <xen/byteorder/little_endian.h>
+
+#endif /* _ASM_PPC_BYTEORDER_H */
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm=
/config.h
index 01ca5d0803..cb27d2781e 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -52,6 +52,9 @@
 /* size of minimum stack frame; C code can write into the caller's stack=
 */
 #define STACK_FRAME_OVERHEAD 32
=20
+/* ELFv2 ABI mandates 16 byte alignment */
+#define STACK_ALIGN 16
+
 #endif /* __PPC_CONFIG_H__ */
 /*
  * Local variables:
diff --git a/xen/arch/ppc/include/asm/early_printk.h b/xen/arch/ppc/inclu=
de/asm/early_printk.h
new file mode 100644
index 0000000000..d1d8b416f4
--- /dev/null
+++ b/xen/arch/ppc/include/asm/early_printk.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_PPC_EARLY_PRINTK_H
+#define _ASM_PPC_EARLY_PRINTK_H
+
+#include <xen/early_printk.h>
+
+#ifdef CONFIG_EARLY_PRINTK
+void early_printk_init(void (*putchar)(char));
+void early_printk(const char *s);
+#else
+static inline void early_printk_init(void (*putchar)(char)) {}
+static inline void early_printk(const char *s) {}
+#endif
+
+#endif /* _ASM_PPC_EARLY_PRINTK_H */
diff --git a/xen/arch/ppc/include/asm/msr.h b/xen/arch/ppc/include/asm/ms=
r.h
new file mode 100644
index 0000000000..144511e5c3
--- /dev/null
+++ b/xen/arch/ppc/include/asm/msr.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) IBM Corp. 2005
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#ifndef _ASM_PPC_MSR_H
+#define _ASM_PPC_MSR_H
+
+#include <xen/const.h>
+
+/* Flags in MSR: */
+#define MSR_SF      _AC(0x8000000000000000, ULL)
+#define MSR_TA      _AC(0x4000000000000000, ULL)
+#define MSR_ISF     _AC(0x2000000000000000, ULL)
+#define MSR_HV      _AC(0x1000000000000000, ULL)
+#define MSR_VMX     _AC(0x0000000002000000, ULL)
+#define MSR_MER     _AC(0x0000000000200000, ULL)
+#define MSR_POW     _AC(0x0000000000040000, ULL)
+#define MSR_ILE     _AC(0x0000000000010000, ULL)
+#define MSR_EE      _AC(0x0000000000008000, ULL)
+#define MSR_PR      _AC(0x0000000000004000, ULL)
+#define MSR_FP      _AC(0x0000000000002000, ULL)
+#define MSR_ME      _AC(0x0000000000001000, ULL)
+#define MSR_FE0     _AC(0x0000000000000800, ULL)
+#define MSR_SE      _AC(0x0000000000000400, ULL)
+#define MSR_BE      _AC(0x0000000000000200, ULL)
+#define MSR_FE1     _AC(0x0000000000000100, ULL)
+#define MSR_IP      _AC(0x0000000000000040, ULL)
+#define MSR_IR      _AC(0x0000000000000020, ULL)
+#define MSR_DR      _AC(0x0000000000000010, ULL)
+#define MSR_PMM     _AC(0x0000000000000004, ULL)
+#define MSR_RI      _AC(0x0000000000000002, ULL)
+#define MSR_LE      _AC(0x0000000000000001, ULL)
+
+/* MSR bits set on the systemsim simulator */
+#define MSR_SIM       _AC(0x0000000020000000, ULL)
+#define MSR_SYSTEMSIM _AC(0x0000000010000000, ULL)
+
+/* On a trap, srr1's copy of msr defines some bits as follows: */
+#define MSR_TRAP_FE     _AC(0x0000000000100000, ULL) /* Floating Point E=
xception */
+#define MSR_TRAP_IOP    _AC(0x0000000000080000, ULL) /* Illegal Instruct=
ion */
+#define MSR_TRAP_PRIV   _AC(0x0000000000040000, ULL) /* Privileged Instr=
uction */
+#define MSR_TRAP        _AC(0x0000000000020000, ULL) /* Trap Instruction=
 */
+#define MSR_TRAP_NEXT   _AC(0x0000000000010000, ULL) /* PC is next instr=
uction */
+#define MSR_TRAP_BITS  (MSR_TRAP_FE|MSR_TRAP_IOP|MSR_TRAP_PRIV|MSR_TRAP)
+
+#endif /* _ASM_PPC_MSR_H */
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/=
asm/processor.h
new file mode 100644
index 0000000000..2d2e582f08
--- /dev/null
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright IBM Corp. 2005, 2006, 2007
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Hollis Blanchard <hollisb@us.ibm.com>
+ *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
+ *          Timothy Pearson <tpearson@raptorengineering.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#ifndef _ASM_PPC_PROCESSOR_H
+#define _ASM_PPC_PROCESSOR_H
+
+#include <xen/config.h>
+#include <xen/types.h>
+
+#define IOBMP_BYTES          8192
+#define IOBMP_INVALID_OFFSET 0x8000
+
+/* Processor Version Register (PVR) field extraction */
+
+#define PVR_VER(pvr) (((pvr) >> 16) & 0xFFFF) /* Version field */
+#define PVR_REV(pvr) (((pvr) >> 0) & 0xFFFF)  /* Revison field */
+
+#define __is_processor(pv) (PVR_VER(mfspr(SPRN_PVR)) =3D=3D (pv))
+
+/*
+ * IBM has further subdivided the standard PowerPC 16-bit version and
+ * revision subfields of the PVR for the PowerPC 403s into the following=
:
+ */
+
+#define PVR_FAM(pvr)  (((pvr) >> 20) & 0xFFF) /* Family field */
+#define PVR_MEM(pvr)  (((pvr) >> 16) & 0xF)   /* Member field */
+#define PVR_CORE(pvr) (((pvr) >> 12) & 0xF)   /* Core field */
+#define PVR_CFG(pvr)  (((pvr) >> 8) & 0xF)    /* Configuration field */
+#define PVR_MAJ(pvr)  (((pvr) >> 4) & 0xF)    /* Major revision field */
+#define PVR_MIN(pvr)  (((pvr) >> 0) & 0xF)    /* Minor revision field */
+
+/* Processor Version Numbers */
+
+#define PVR_403GA    0x00200000
+#define PVR_403GB    0x00200100
+#define PVR_403GC    0x00200200
+#define PVR_403GCX   0x00201400
+#define PVR_405GP    0x40110000
+#define PVR_STB03XXX 0x40310000
+#define PVR_NP405H   0x41410000
+#define PVR_NP405L   0x41610000
+#define PVR_601      0x00010000
+#define PVR_602      0x00050000
+#define PVR_603      0x00030000
+#define PVR_603e     0x00060000
+#define PVR_603ev    0x00070000
+#define PVR_603r     0x00071000
+#define PVR_604      0x00040000
+#define PVR_604e     0x00090000
+#define PVR_604r     0x000A0000
+#define PVR_620      0x00140000
+#define PVR_740      0x00080000
+#define PVR_750      PVR_740
+#define PVR_740P     0x10080000
+#define PVR_750P     PVR_740P
+#define PVR_7400     0x000C0000
+#define PVR_7410     0x800C0000
+#define PVR_7450     0x80000000
+#define PVR_8540     0x80200000
+#define PVR_8560     0x80200000
+/*
+ * For the 8xx processors, all of them report the same PVR family for
+ * the PowerPC core. The various versions of these processors must be
+ * differentiated by the version number in the Communication Processor
+ * Module (CPM).
+ */
+#define PVR_821  0x00500000
+#define PVR_823  PVR_821
+#define PVR_850  PVR_821
+#define PVR_860  PVR_821
+#define PVR_8240 0x00810100
+#define PVR_8245 0x80811014
+#define PVR_8260 PVR_8240
+
+/* 64-bit processors */
+#define PVR_NORTHSTAR 0x0033
+#define PVR_PULSAR    0x0034
+#define PVR_POWER4    0x0035
+#define PVR_ICESTAR   0x0036
+#define PVR_SSTAR     0x0037
+#define PVR_POWER4p   0x0038
+#define PVR_970       0x0039
+#define PVR_POWER5    0x003A
+#define PVR_POWER5p   0x003B
+#define PVR_970FX     0x003C
+#define PVR_POWER6    0x003E
+#define PVR_POWER7    0x003F
+#define PVR_630       0x0040
+#define PVR_630p      0x0041
+#define PVR_970MP     0x0044
+#define PVR_970GX     0x0045
+#define PVR_POWER7p   0x004A
+#define PVR_POWER8E   0x004B
+#define PVR_POWER8NVL 0x004C
+#define PVR_POWER8    0x004D
+#define PVR_POWER9    0x004E
+#define PVR_POWER10   0x0080
+#define PVR_BE        0x0070
+#define PVR_PA6T      0x0090
+
+/* Macro to adjust thread priority for hardware multithreading */
+#define HMT_very_low()  asm volatile (" or %r31, %r31, %r31 ")
+
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
+    uint64_t fpscr;
+    uint64_t xer;
+    uint64_t hid4;  /* debug only */
+    uint64_t dar;   /* debug only */
+    uint32_t dsisr; /* debug only */
+    uint32_t cr;
+    uint32_t __pad; /* good spot for another 32bit reg */
+    uint32_t entry_vector;
+};
+
+#endif
+
+#endif /* _ASM_PPC_PROCESSOR_H */
diff --git a/xen/arch/ppc/include/asm/types.h b/xen/arch/ppc/include/asm/=
types.h
new file mode 100644
index 0000000000..cee08e111a
--- /dev/null
+++ b/xen/arch/ppc/include/asm/types.h
@@ -0,0 +1,21 @@
+/* from xen/arch/x86/include/asm/types.h */
+
+#ifndef _ASM_PPC_TYPES_H
+#define _ASM_PPC_TYPES_H
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
+typedef signed long s64;
+typedef unsigned long u64;
+typedef unsigned long paddr_t;
+#define INVALID_PADDR (~0UL)
+#define PRIpaddr "016lx"
+
+#endif /* _ASM_PPC_TYPES_H */
diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
index 3340058c08..f4956daaa9 100644
--- a/xen/arch/ppc/ppc64/Makefile
+++ b/xen/arch/ppc/ppc64/Makefile
@@ -1 +1,2 @@
 obj-y +=3D head.o
+obj-y +=3D of-call.o
diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-of=
fsets.c
index e69de29bb2..7fc29d5db1 100644
--- a/xen/arch/ppc/ppc64/asm-offsets.c
+++ b/xen/arch/ppc/ppc64/asm-offsets.c
@@ -0,0 +1,59 @@
+/*
+ * Generate definitions needed by assembly language modules.
+ * This code generates raw asm output which is post-processed
+ * to extract and format the required data.
+ */
+
+#include <asm/processor.h>
+
+#define DEFINE(_sym, _val)                                              =
   \
+    asm volatile ("\n.ascii\"=3D=3D>#define " #_sym " %0 /* " #_val " */=
<=3D=3D\"" \
+                  : : "i" (_val) )
+#define BLANK()                                                         =
   \
+    asm volatile ( "\n.ascii\"=3D=3D><=3D=3D\"" : : )
+#define OFFSET(_sym, _str, _mem)                                        =
   \
+    DEFINE(_sym, offsetof(_str, _mem));
+
+/* base-2 logarithm */
+#define __L2(_x)  (((_x) & 0x00000002) ?   1 : 0)
+#define __L4(_x)  (((_x) & 0x0000000c) ? ( 2 + __L2( (_x)>> 2)) : __L2( =
_x))
+#define __L8(_x)  (((_x) & 0x000000f0) ? ( 4 + __L4( (_x)>> 4)) : __L4( =
_x))
+#define __L16(_x) (((_x) & 0x0000ff00) ? ( 8 + __L8( (_x)>> 8)) : __L8( =
_x))
+#define LOG_2(_x) (((_x) & 0xffff0000) ? (16 + __L16((_x)>>16)) : __L16(=
_x))
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
+/* TODO: Replace with BUILD_BUG_ON + IS_ALIGNED once we can use <xen/lib=
.h> */
+_Static_assert(sizeof(struct cpu_user_regs) % STACK_ALIGN =3D=3D 0,
+               "struct cpu_user_regs not stack aligned!");
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
index 7d848611cc..8497d8f37e 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -18,6 +18,15 @@ ENTRY(start)
     li %r11, 0
     stdu %r11, -STACK_FRAME_OVERHEAD(%r1)
=20
+    /* clear .bss */
+    LOAD_IMM32(%r14, __bss_start)
+    LOAD_IMM32(%r15, __bss_end)
+1:
+    std %r11, 0(%r14)
+    addi %r14, %r14, 8
+    cmpld %r14, %r15
+    blt 1b
+
     /* call the C entrypoint */
     bl start_xen
=20
diff --git a/xen/arch/ppc/ppc64/of-call.S b/xen/arch/ppc/ppc64/of-call.S
new file mode 100644
index 0000000000..5f13e3b327
--- /dev/null
+++ b/xen/arch/ppc/ppc64/of-call.S
@@ -0,0 +1,83 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Adapted from Linux's arch/powerpc/kernel/entry_64.S, with the
+ * following copyright notice:
+ *
+ *  PowerPC version
+ *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
+ *  Rewritten by Cort Dougan (cort@cs.nmt.edu) for PReP
+ *    Copyright (C) 1996 Cort Dougan <cort@cs.nmt.edu>
+ *  Adapted for Power Macintosh by Paul Mackerras.
+ *  Low-level exception handlers and MMU support
+ *  rewritten by Paul Mackerras.
+ *    Copyright (C) 1996 Paul Mackerras.
+ *  MPC8xx modifications Copyright (C) 1997 Dan Malek (dmalek@jlc.net).
+ */
+
+#include <asm/asm-offsets.h>
+#include <asm/asm-defns.h>
+#include <asm/msr.h>
+
+/* size of minimum stack frame that can hold an entire cpu_user_regs str=
uct */
+#define STACK_SWITCH_FRAME_SIZE UREGS_sizeof
+
+    .section .init.text, "ax", @progbits
+
+ENTRY(enter_of)
+    mflr %r0
+    std %r0, 16(%r1)
+    stdu %r1,-STACK_SWITCH_FRAME_SIZE(%r1) /* Save SP and create stack s=
pace */
+
+    /*
+     * Because PROM is running in 32b mode, it clobbers the high order h=
alf
+     * of all registers that it saves.  We therefore save those register=
s
+     * PROM might touch to the stack.  (%r0, %r3-%r13 are caller saved)
+     */
+    SAVE_GPR(2, %r1)
+    SAVE_GPR(13, %r1)
+    SAVE_NVGPRS(%r1)
+    mfcr %r10
+    mfmsr %r11
+    std %r10, UREGS_cr(%r1)
+    std %r11, UREGS_msr(%r1)
+
+    /* Put PROM address in SRR0 */
+    mtsrr0 %r4
+
+    /* Setup our trampoline return addr in LR */
+    bcl 20, 31,.+4
+0:  mflr %r4
+    addi %r4, %r4,(1f - 0b)
+    mtlr %r4
+
+    /* Prepare a 32-bit mode big endian MSR */
+    LOAD_IMM64(%r12, MSR_SF | MSR_LE)
+    andc %r11, %r11, %r12
+    mtsrr1 %r11
+    rfid
+
+1:  /* Return from OF */
+    FIXUP_ENDIAN
+
+    /* Just make sure that %r1 top 32 bits didn't get corrupt by OF */
+    rldicl %r1, %r1, 0, 32
+
+    /* Restore the MSR (back to 64 bits) */
+    ld %r0, UREGS_msr(%r1)
+    mtmsrd %r0
+    isync
+
+    /* Restore other registers */
+    REST_GPR(2, %r1)
+    REST_GPR(13, %r1)
+    REST_NVGPRS(%r1)
+    ld %r4, UREGS_cr(%r1)
+    mtcr %r4
+
+    addi %r1, %r1, STACK_SWITCH_FRAME_SIZE
+    ld %r0, 16(%r1)
+    mtlr %r0
+    blr
+
+    .size enter_of, . - enter_of
+    .type enter_of, %function
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 73106474b2..7c623a49f5 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -1,16 +1,29 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 #include <xen/init.h>
+#include <asm/boot.h>
+#include <asm/early_printk.h>
+#include <asm/processor.h>
=20
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZ=
E);
=20
-/* Macro to adjust thread priority for hardware multithreading */
-#define HMT_very_low()  asm volatile (" or %r31, %r31, %r31 ")
-
 void __init noreturn start_xen(unsigned long r3, unsigned long r4,
                                unsigned long r5, unsigned long r6,
                                unsigned long r7)
 {
+    if ( r5 )
+    {
+        /* OpenFirmware boot protocol */
+        boot_of_init(r5);
+    }
+    else
+    {
+        /* kexec boot: Unimplemented */
+        __builtin_trap();
+    }
+
+    early_printk("Hello, ppc64le!\n");
+
     for ( ; ; )
         /* Set current hardware thread to very low priority */
         HMT_very_low();
--=20
2.30.2


