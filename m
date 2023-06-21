Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1B738C81
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 19:00:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553034.863391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bp-0006W2-42; Wed, 21 Jun 2023 17:00:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553034.863391; Wed, 21 Jun 2023 17:00:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qC1Bo-0006TO-VP; Wed, 21 Jun 2023 17:00:16 +0000
Received: by outflank-mailman (input) for mailman id 553034;
 Wed, 21 Jun 2023 17:00:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gfgj=CJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qC1Bm-0005SN-SE
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 17:00:15 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15d08b9b-1055-11ee-b236-6b7b168915f2;
 Wed, 21 Jun 2023 19:00:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B81178285395
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 12:00:11 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cJBfu8ssRsyv; Wed, 21 Jun 2023 12:00:07 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id F305C8285C27;
 Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id QNA4ZaNy_oco; Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 4D2FF8285AEB;
 Wed, 21 Jun 2023 12:00:06 -0500 (CDT)
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
X-Inumbo-ID: 15d08b9b-1055-11ee-b236-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com F305C8285C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687366807; bh=vcQ4ZdVKLwNAdCk9zrwXUCbf8DyOucY5UriZJe9DkNY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=bG2P5nGogfImaKPPrxGIn1iciYYwLqE39rjOyC1sBeBlAXnB3VgCeSOofEgPXl6Mt
	 Wr2jf99WQsqUE6L1FfJCUQ29rgNDQSRJNDvEcBWmYhJp7DJUtoKL8XmxpVftIsc/16
	 bDNxHmYPVqeQQP79TOB+6zdhoa1wcl2cO6gTz20w=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Shawn Anastasio <shawnanastasio@raptorengineering.com>
Subject: [PATCH 3/4] xen/ppc: Implement early serial printk on pseries
Date: Wed, 21 Jun 2023 11:59:52 -0500
Message-Id: <259298cdadf7cf1eba08cd35c636e9aca9e2182a.1687366665.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1687366665.git.sanastasio@raptorengineering.com>
References: <cover.1687366665.git.sanastasio@raptorengineering.com>
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

Signed-off-by: Shawn Anastasio <shawnanastasio@raptorengineering.com>
---
 xen/arch/ppc/Kconfig.debug              |   5 +
 xen/arch/ppc/Makefile                   |   3 +
 xen/arch/ppc/boot-of.c                  | 116 +++++++++++++
 xen/arch/ppc/configs/ppc64_defconfig    |   1 +
 xen/arch/ppc/early_printk.c             |  28 +++
 xen/arch/ppc/include/asm/boot.h         |  24 +++
 xen/arch/ppc/include/asm/bug.h          |   6 +
 xen/arch/ppc/include/asm/byteorder.h    |  37 ++++
 xen/arch/ppc/include/asm/cache.h        |   6 +
 xen/arch/ppc/include/asm/early_printk.h |  15 ++
 xen/arch/ppc/include/asm/msr.h          |  67 ++++++++
 xen/arch/ppc/include/asm/processor.h    | 207 ++++++++++++++++++++++
 xen/arch/ppc/include/asm/reg_defs.h     | 218 ++++++++++++++++++++++++
 xen/arch/ppc/include/asm/string.h       |   6 +
 xen/arch/ppc/include/asm/types.h        |  35 ++++
 xen/arch/ppc/ppc64/Makefile             |   1 +
 xen/arch/ppc/ppc64/asm-offsets.c        |  55 ++++++
 xen/arch/ppc/ppc64/head.S               |  48 +++---
 xen/arch/ppc/ppc64/of-call.S            |  85 +++++++++
 xen/arch/ppc/setup.c                    |  31 ++++
 20 files changed, 972 insertions(+), 22 deletions(-)
 create mode 100644 xen/arch/ppc/boot-of.c
 create mode 100644 xen/arch/ppc/early_printk.c
 create mode 100644 xen/arch/ppc/include/asm/boot.h
 create mode 100644 xen/arch/ppc/include/asm/bug.h
 create mode 100644 xen/arch/ppc/include/asm/byteorder.h
 create mode 100644 xen/arch/ppc/include/asm/cache.h
 create mode 100644 xen/arch/ppc/include/asm/early_printk.h
 create mode 100644 xen/arch/ppc/include/asm/msr.h
 create mode 100644 xen/arch/ppc/include/asm/processor.h
 create mode 100644 xen/arch/ppc/include/asm/reg_defs.h
 create mode 100644 xen/arch/ppc/include/asm/string.h
 create mode 100644 xen/arch/ppc/include/asm/types.h
 create mode 100644 xen/arch/ppc/ppc64/of-call.S
 create mode 100644 xen/arch/ppc/setup.c

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
index 98220648af..4c4cdcb60e 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -1,4 +1,7 @@
 obj-$(CONFIG_PPC64) +=3D ppc64/
+obj-y +=3D setup.o
+obj-y +=3D boot-of.o
+obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.o
=20
 $(TARGET): $(TARGET)-syms
 	cp -f $< $@
diff --git a/xen/arch/ppc/boot-of.c b/xen/arch/ppc/boot-of.c
new file mode 100644
index 0000000000..1ceeaf1250
--- /dev/null
+++ b/xen/arch/ppc/boot-of.c
@@ -0,0 +1,116 @@
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
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, =
USA.
+ *
+ * Copyright IBM Corp. 2005, 2006, 2007
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Hollis Blanchard <hollisb@us.ibm.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#include <xen/lib.h>
+#include <asm/boot.h>
+#include <asm/byteorder.h>
+#include <asm/early_printk.h>
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
+    {
+        s.ofs_args[i] =3D cpu_to_be32(va_arg(args, uint32_t));
+    }
+
+    va_end(args);
+
+    rc =3D enter_of(&s, of_vec);
+
+    /* copy all return values to the output rets array */
+    for ( i =3D 0; i < nrets; i++ )
+    {
+        rets[i] =3D be32_to_cpu(s.ofs_args[i + nargs]);
+    }
+
+    return rc;
+}
+
+static int of_finddevice(const char *devspec)
+{
+    int rets[1] =3D { OF_FAILURE };
+
+    of_call("finddevice", 1, 1, rets, devspec);
+    return rets[0];
+}
+
+static int of_getprop(int ph, const char *name, void *buf, uint32_t bufl=
en)
+{
+    int rets[1] =3D { OF_FAILURE };
+
+    of_call("getprop", 4, 1, rets, ph, ADDR(name), buf, buflen);
+    return rets[0];
+}
+
+int of_write(int ih, const char *addr, uint32_t len)
+{
+    int rets[1] =3D { OF_FAILURE };
+
+    of_call("write", 3, 1, rets, ih, addr, len);
+    return rets[0];
+}
+
+static void of_putchar(char c)
+{
+    if ( c =3D=3D '\n' )
+    {
+        char buf =3D '\r';
+        of_write(of_out, &buf, 1);
+    }
+    of_write(of_out, &c, 1);
+}
+
+void boot_of_init(unsigned long vec)
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
index 0000000000..309a1a7fd9
--- /dev/null
+++ b/xen/arch/ppc/early_printk.c
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#include <xen/lib.h>
+#include <asm/boot.h>
+
+static void (*putchar_func)(char);
+
+void early_printk_init(void (*putchar)(char))
+{
+    putchar_func =3D putchar;
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
diff --git a/xen/arch/ppc/include/asm/boot.h b/xen/arch/ppc/include/asm/b=
oot.h
new file mode 100644
index 0000000000..ea4a945bb4
--- /dev/null
+++ b/xen/arch/ppc/include/asm/boot.h
@@ -0,0 +1,24 @@
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
+extern int enter_of(struct of_service *args, unsigned long entry);
+
+void boot_of_init(unsigned long);
+
+#endif /* _ASM_PPC_BOOT_H */
diff --git a/xen/arch/ppc/include/asm/bug.h b/xen/arch/ppc/include/asm/bu=
g.h
new file mode 100644
index 0000000000..a23ab1fa74
--- /dev/null
+++ b/xen/arch/ppc/include/asm/bug.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_PPC_BUG_H
+#define _ASM_PPC_BUG_H
+
+#endif /* _ASM_PPC_BUG_H */
diff --git a/xen/arch/ppc/include/asm/byteorder.h b/xen/arch/ppc/include/=
asm/byteorder.h
new file mode 100644
index 0000000000..cc4d55b355
--- /dev/null
+++ b/xen/arch/ppc/include/asm/byteorder.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_POWERPC_BYTEORDER_H
+#define _ASM_POWERPC_BYTEORDER_H
+
+#include <asm/types.h>
+#include <xen/compiler.h>
+
+static inline __attribute_const__ __u16 ___arch__swab16(__u16 value)
+{
+    __u16 result;
+
+    asm("rlwimi %0,%1,8,16,23"
+        : "=3Dr" (result)
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
+        : "=3Dr" (result)
+        : "r" (value), "0" (value >> 24));
+    return result;
+}
+
+#define __arch__swab16(x) ___arch__swab16(x)
+#define __arch__swab32(x) ___arch__swab32(x)
+
+#define __BYTEORDER_HAS_U64__
+
+#include <xen/byteorder/little_endian.h>
+
+#endif /* _ASM_POWERPC_BYTEORDER_H */
diff --git a/xen/arch/ppc/include/asm/cache.h b/xen/arch/ppc/include/asm/=
cache.h
new file mode 100644
index 0000000000..8a0a6b7b17
--- /dev/null
+++ b/xen/arch/ppc/include/asm/cache.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_PPC_CACHE_H
+#define _ASM_PPC_CACHE_H
+
+#endif /* _ASM_PPC_CACHE_H */
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
index 0000000000..7ef0b5e3ad
--- /dev/null
+++ b/xen/arch/ppc/include/asm/msr.h
@@ -0,0 +1,67 @@
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
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, =
USA.
+ *
+ * Copyright (C) IBM Corp. 2005
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ */
+
+#ifndef _POWERPC_MSR_H
+#define _POWERPC_MSR_H
+
+#ifdef __ASSEMBLY__
+#define ULL(x) x
+#else
+#define ULL(x) x ## ULL
+#endif
+
+/* Flags in MSR: */
+#define MSR_SF      ULL(0x8000000000000000)
+#define MSR_TA      ULL(0x4000000000000000)
+#define MSR_ISF     ULL(0x2000000000000000)
+#define MSR_HV      ULL(0x1000000000000000)
+#define MSR_VMX     ULL(0x0000000002000000)
+#define MSR_MER     ULL(0x0000000000200000)
+#define MSR_POW     ULL(0x0000000000040000)
+#define MSR_ILE     ULL(0x0000000000010000)
+#define MSR_EE      ULL(0x0000000000008000)
+#define MSR_PR      ULL(0x0000000000004000)
+#define MSR_FP      ULL(0x0000000000002000)
+#define MSR_ME      ULL(0x0000000000001000)
+#define MSR_FE0     ULL(0x0000000000000800)
+#define MSR_SE      ULL(0x0000000000000400)
+#define MSR_BE      ULL(0x0000000000000200)
+#define MSR_FE1     ULL(0x0000000000000100)
+#define MSR_IP      ULL(0x0000000000000040)
+#define MSR_IR      ULL(0x0000000000000020)
+#define MSR_DR      ULL(0x0000000000000010)
+#define MSR_PMM     ULL(0x0000000000000004)
+#define MSR_RI      ULL(0x0000000000000002)
+#define MSR_LE      ULL(0x0000000000000001)
+
+/* MSR bits set on the systemsim simulator */
+#define MSR_SIM       ULL(0x0000000020000000)
+#define MSR_SYSTEMSIM ULL(0x0000000010000000)
+
+/* On a trap, srr1's copy of msr defines some bits as follows: */
+#define MSR_TRAP_FE     ULL(0x0000000000100000) /* Floating Point Except=
ion */
+#define MSR_TRAP_IOP    ULL(0x0000000000080000) /* Illegal Instruction *=
/
+#define MSR_TRAP_PRIV   ULL(0x0000000000040000) /* Privileged Instructio=
n */
+#define MSR_TRAP        ULL(0x0000000000020000) /* Trap Instruction */
+#define MSR_TRAP_NEXT   ULL(0x0000000000010000) /* PC is next instructio=
n */
+#define MSR_TRAP_BITS  (MSR_TRAP_FE|MSR_TRAP_IOP|MSR_TRAP_PRIV|MSR_TRAP)
+
+#endif /* _POWERPC_MSR_H */
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/=
asm/processor.h
new file mode 100644
index 0000000000..6deba051a8
--- /dev/null
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -0,0 +1,207 @@
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
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, =
USA.
+ *
+ * Copyright IBM Corp. 2005, 2006, 2007
+ * Copyright Raptor Engineering, LLC
+ *
+ * Authors: Hollis Blanchard <hollisb@us.ibm.com>
+ *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
+ *          Timothy Pearson <tpearson@raptorengineering.com>
+ *          Shawn Anastasio <sanastasio@raptorengineering.com>
+ */
+
+#ifndef _ASM_PROCESSOR_H_
+#define _ASM_PROCESSOR_H_
+
+#include <xen/config.h>
+#include <asm/msr.h>
+#include <asm/reg_defs.h>
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
+#define PVR_NORTHSTAR	0x0033
+#define PVR_PULSAR      0x0034
+#define PVR_POWER4	0x0035
+#define PVR_ICESTAR	0x0036
+#define PVR_SSTAR	0x0037
+#define PVR_POWER4p	0x0038
+#define PVR_970		0x0039
+#define PVR_POWER5	0x003A
+#define PVR_POWER5p	0x003B
+#define PVR_970FX	0x003C
+#define PVR_POWER6	0x003E
+#define PVR_POWER7	0x003F
+#define PVR_630		0x0040
+#define PVR_630p	0x0041
+#define PVR_970MP	0x0044
+#define PVR_970GX	0x0045
+#define PVR_POWER7p	0x004A
+#define PVR_POWER8E	0x004B
+#define PVR_POWER8NVL	0x004C
+#define PVR_POWER8	0x004D
+#define PVR_POWER9	0x004E
+#define PVR_POWER10	0x0080
+#define PVR_BE		0x0070
+#define PVR_PA6T	0x0090
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
+
+#define LOAD_IMM64(reg, label)                                          =
       \
+    lis reg, (label) @highest;                                          =
       \
+    ori reg, reg, (label) @higher;                                      =
       \
+    rldicr reg, reg, 32, 31;                                            =
       \
+    oris reg, reg, (label) @h;                                          =
       \
+    ori reg, reg, (label) @l;
+
+/*
+ * Depending on how we were booted, the CPU could be running in either
+ * Little Endian or Big Endian mode. The following trampoline from Linux
+ * cleverly uses an instruction that encodes to a NOP if the CPU's
+ * endianness matches the assumption of the assembler (LE, in our case)
+ * or a branch to code that performs the endian switch in the other case=
.
+ */
+#define FIXUP_ENDIAN                                                    =
       \
+    tdi 0, 0, 0x48;   /* Reverse endian of b . + 8          */          =
       \
+    b . + 44;         /* Skip trampoline if endian is good  */          =
       \
+    .long 0xa600607d; /* mfmsr r11                          */          =
       \
+    .long 0x01006b69; /* xori r11,r11,1                     */          =
       \
+    .long 0x00004039; /* li r10,0                           */          =
       \
+    .long 0x6401417d; /* mtmsrd r10,1                       */          =
       \
+    .long 0x05009f42; /* bcl 20,31,$+4                      */          =
       \
+    .long 0xa602487d; /* mflr r10                           */          =
       \
+    .long 0x14004a39; /* addi r10,r10,20                    */          =
       \
+    .long 0xa6035a7d; /* mtsrr0 r10                         */          =
       \
+    .long 0xa6037b7d; /* mtsrr1 r11                         */          =
       \
+    .long 0x2400004c  /* rfid                               */
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
+#endif /* __ASSEMBLY__ */
+
+#endif
diff --git a/xen/arch/ppc/include/asm/reg_defs.h b/xen/arch/ppc/include/a=
sm/reg_defs.h
new file mode 100644
index 0000000000..ac435517cc
--- /dev/null
+++ b/xen/arch/ppc/include/asm/reg_defs.h
@@ -0,0 +1,218 @@
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
+ * Foundation, 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, =
USA.
+ *
+ * Copyright IBM Corp. 2005, 2007
+ *
+ * Authors: Jimi Xenidis <jimix@watson.ibm.com>
+ *          Christian Ehrhardt <ehrhardt@linux.vnet.ibm.com>
+ */
+
+#ifndef _ASM_REG_DEFS_H_
+#define _ASM_REG_DEFS_H_
+
+#ifdef __ASSEMBLY__
+
+#define UL(x) x
+
+/* Condition Register Bit Fields */
+
+#define cr0 0
+#define cr1 1
+#define cr2 2
+#define cr3 3
+#define cr4 4
+#define cr5 5
+#define cr6 6
+#define cr7 7
+
+
+/* General Purpose Registers (GPRs) */
+
+#define r0  0
+#define r1  1
+#define r2  2
+#define r3  3
+#define r4  4
+#define r5  5
+#define r6  6
+#define r7  7
+#define r8  8
+#define r9  9
+#define r10 10
+#define r11 11
+#define r12 12
+#define r13 13
+#define r14 14
+#define r15 15
+#define r16 16
+#define r17 17
+#define r18 18
+#define r19 19
+#define r20 20
+#define r21 21
+#define r22 22
+#define r23 23
+#define r24 24
+#define r25 25
+#define r26 26
+#define r27 27
+#define r28 28
+#define r29 29
+#define r30 30
+#define r31 31
+
+/* Floating Point Registers (FPRs) */
+#define fr0     0
+#define fr1     1
+#define fr2     2
+#define fr3     3
+#define fr4     4
+#define fr5     5
+#define fr6     6
+#define fr7     7
+#define fr8     8
+#define fr9     9
+#define fr10    10
+#define fr11    11
+#define fr12    12
+#define fr13    13
+#define fr14    14
+#define fr15    15
+#define fr16    16
+#define fr17    17
+#define fr18    18
+#define fr19    19
+#define fr20    20
+#define fr21    21
+#define fr22    22
+#define fr23    23
+#define fr24    24
+#define fr25    25
+#define fr26    26
+#define fr27    27
+#define fr28    28
+#define fr29    29
+#define fr30    30
+#define fr31    31
+
+/* Vector Registers (FPRs) */
+#define vr0     0
+#define vr1     1
+#define vr2     2
+#define vr3     3
+#define vr4     4
+#define vr5     5
+#define vr6     6
+#define vr7     7
+#define vr8     8
+#define vr9     9
+#define vr10    10
+#define vr11    11
+#define vr12    12
+#define vr13    13
+#define vr14    14
+#define vr15    15
+#define vr16    16
+#define vr17    17
+#define vr18    18
+#define vr19    19
+#define vr20    20
+#define vr21    21
+#define vr22    22
+#define vr23    23
+#define vr24    24
+#define vr25    25
+#define vr26    26
+#define vr27    27
+#define vr28    28
+#define vr29    29
+#define vr30    30
+#define vr31    31
+
+#else /* defined(__ASSEMBLY__) */
+
+#define UL(x) x ## UL
+
+#endif
+
+/* Special Purpose Registers */
+#define SPRN_VRSAVE 256
+#define SPRN_DSISR  18
+#define SPRN_DAR    19
+#define SPRN_DEC    22
+#define SPRN_SRR0   26
+#define SPRN_SRR1   27
+#define SPRN_TBRL   268
+#define SPRN_TBRU   269
+#define SPRN_SPRG0  272
+#define SPRN_SPRG1  273
+#define SPRN_SPRG2  274
+#define SPRN_SPRG3  275
+#define SPRN_TBWL   284
+#define SPRN_TBWU   285
+
+#define SPRN_HSPRG0 304
+#define SPRN_HSPRG1 305
+#define SPRN_HDEC   310
+#define SPRN_HIOR   311
+#define SPRN_RMOR   312
+#define SPRN_HRMOR  313
+#define SPRN_HSRR0  314
+#define SPRN_HSRR1  315
+#define SPRN_LPCR   318
+#define SPRN_LPIDR  319
+
+/* Performance monitor spr encodings */
+#define SPRN_MMCRA  786
+#define   MMCRA_SAMPHV    UL(0x10000000) /* state of MSR HV when SIAR se=
t */
+#define   MMCRA_SAMPPR    UL(0x08000000) /* state of MSR PR when SIAR se=
t */
+#define   MMCRA_SAMPLE_ENABLE UL(0x00000001) /* enable sampling */
+#define NUM_PMCS 8
+#define SPRN_PMC1   787
+#define SPRN_PMC2   788
+#define SPRN_PMC3   789
+#define SPRN_PMC4   790
+#define SPRN_PMC5   791
+#define SPRN_PMC6   792
+#define SPRN_PMC7   793
+#define SPRN_PMC8   794
+#define SPRN_MMCR0  795
+#define   MMCR0_FC      UL(0x80000000) /* freeze counters */
+#define   MMCR0_FCS     UL(0x40000000) /* freeze in supervisor state */
+#define   MMCR0_FCP     UL(0x20000000) /* freeze in problem state */
+#define   MMCR0_FCM1    UL(0x10000000) /* freeze counters while MSR mark=
 =3D 1 */
+#define   MMCR0_FCM0    UL(0x08000000) /* freeze counters while MSR mark=
 =3D 0 */
+#define   MMCR0_PMAE    UL(0x04000000) /* performance monitor alert enab=
led */
+#define   MMCR0_PMAO    UL(0x00000080) /* performance monitor alert occu=
rred */
+#define   MMCR0_FCH     UL(0x00000001) /* freeze conditions in hyperviso=
r */
+#define SPRN_SIAR   796
+#define SPRN_SDAR   797
+#define SPRN_MMCR1  798
+
+/* As defined for PU G4 */
+#define SPRN_HID0   1008
+#define SPRN_HID1   1009
+#define SPRN_HID4   1012
+
+#define SPRN_DABR   1013
+#define SPRN_HID5   1014
+#define SPRN_DABRX  1015
+#define SPRN_HID6   1017
+#define SPRN_HID7   1018
+#define SPRN_HID8   1019
+#define SPRN_PIR    1023
+
+#endif /* _ASM_REG_DEFS_H_ */
diff --git a/xen/arch/ppc/include/asm/string.h b/xen/arch/ppc/include/asm=
/string.h
new file mode 100644
index 0000000000..7a420e05e4
--- /dev/null
+++ b/xen/arch/ppc/include/asm/string.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_PPC_STRING_H
+#define _ASM_PPC_STRING_H
+
+#endif /* _ASM_PPC_STRING_H */
diff --git a/xen/arch/ppc/include/asm/types.h b/xen/arch/ppc/include/asm/=
types.h
new file mode 100644
index 0000000000..05c42280d4
--- /dev/null
+++ b/xen/arch/ppc/include/asm/types.h
@@ -0,0 +1,35 @@
+/* from xen/arch/x86/include/asm/types.h */
+
+#ifndef _ASM_PPC_TYPES_H
+#define _ASM_PPC_TYPES_H
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
+typedef __signed__ long __s64;
+typedef unsigned long __u64;
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
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index 2fcefb40d8..589c72e382 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -1,30 +1,34 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
=20
+#include <asm/processor.h>
+
     .section .text.header, "ax", %progbits
=20
 ENTRY(start)
-    /*
-     * Depending on how we were booted, the CPU could be running in eith=
er
-     * Little Endian or Big Endian mode. The following trampoline from L=
inux
-     * cleverly uses an instruction that encodes to a NOP if the CPU's
-     * endianness matches the assumption of the assembler (LE, in our ca=
se)
-     * or a branch to code that performs the endian switch in the other =
case.
-     */
-    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
-    b . + 44          /* Skip trampoline if endian is good  */
-    .long 0xa600607d  /* mfmsr r11                          */
-    .long 0x01006b69  /* xori r11,r11,1                     */
-    .long 0x00004039  /* li r10,0                           */
-    .long 0x6401417d  /* mtmsrd r10,1                       */
-    .long 0x05009f42  /* bcl 20,31,$+4                      */
-    .long 0xa602487d  /* mflr r10                           */
-    .long 0x14004a39  /* addi r10,r10,20                    */
-    .long 0xa6035a7d  /* mtsrr0 r10                         */
-    .long 0xa6037b7d  /* mtsrr1 r11                         */
-    .long 0x2400004c  /* rfid                               */
-
-    /* Now that the endianness is confirmed, continue */
-1:  b 1b
+    /* NOTE: argument registers (r3-r9) must be preserved until the C en=
trypoint */
+    FIXUP_ENDIAN
+
+    /* set up the initial stack */
+    LOAD_IMM64(r1, cpu0_boot_stack)
+    li r8, 0
+    std r8, 0(r1)
+
+    /* call the C entrypoint */
+    LOAD_IMM64(r12, start_xen)
+    mtctr r12
+    bctrl
+
+    /* should never return */
+    trap
=20
     .size start, . - start
     .type start, %function
+
+    .section .init.data, "aw", @progbits
+
+    /* Early init stack */
+    .p2align 4
+cpu0_boot_stack_bottom:
+    .space STACK_SIZE
+cpu0_boot_stack:
+    .space STACK_FRAME_OVERHEAD
diff --git a/xen/arch/ppc/ppc64/of-call.S b/xen/arch/ppc/ppc64/of-call.S
new file mode 100644
index 0000000000..588f6195c4
--- /dev/null
+++ b/xen/arch/ppc/ppc64/of-call.S
@@ -0,0 +1,85 @@
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
+ *
+ *  This file contains the system call entry code, context switch
+ *  code, and exception/interrupt return code for PowerPC.
+ */
+
+#include <asm/asm-offsets.h>
+#include <asm/processor.h>
+
+/* size of minimum stack frame that can hold an entire cpu_user_regs str=
uct */
+#define STACK_SWITCH_FRAME_SIZE (UREGS_sizeof + STACK_FRAME_OVERHEAD)
+
+ENTRY(enter_of)
+    mflr r0
+    std r0, 16(r1)
+    stdu r1,-STACK_SWITCH_FRAME_SIZE(r1) /* Save SP and create stack spa=
ce */
+
+    /* Because PROM is running in 32b mode, it clobbers the high order h=
alf
+     * of all registers that it saves.  We therefore save those register=
s
+     * PROM might touch to the stack.  (r0, r3-r13 are caller saved)
+     */
+    SAVE_GPR(2, r1)
+    SAVE_GPR(13, r1)
+    SAVE_NVGPRS(r1)
+    mfcr r10
+    mfmsr r11
+    std r10, UREGS_cr(r1)
+    std r11, UREGS_msr(r1)
+
+    /* Put PROM address in SRR0 */
+    mtsrr0 r4
+
+    /* Setup our trampoline return addr in LR */
+    bcl 20, 31,.+4
+0:  mflr r4
+    addi r4, r4,(1f - 0b)
+    mtlr r4
+
+    /* Prepare a 32-bit mode big endian MSR
+     */
+    LOAD_IMM64(r12, MSR_SF | MSR_LE)
+    andc r11, r11, r12
+    mtsrr1 r11
+    rfid
+
+1:  /* Return from OF */
+    FIXUP_ENDIAN
+
+    /* Just make sure that r1 top 32 bits didn't get
+     * corrupt by OF
+     */
+    rldicl r1, r1, 0, 32
+
+    /* Restore the MSR (back to 64 bits) */
+    ld r0, UREGS_msr(r1)
+    mtmsrd r0
+    isync
+
+    /* Restore other registers */
+    REST_GPR(2, r1)
+    REST_GPR(13, r1)
+    REST_NVGPRS(r1)
+    ld r4, UREGS_cr(r1)
+    mtcr r4
+
+    addi r1, r1, STACK_SWITCH_FRAME_SIZE
+    ld r0, 16(r1)
+    mtlr r0
+    blr
+
+    .size enter_of, . - enter_of
+    .type enter_of, %function
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
new file mode 100644
index 0000000000..a312c12e6a
--- /dev/null
+++ b/xen/arch/ppc/setup.c
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/compile.h>
+#include <xen/init.h>
+#include <asm/boot.h>
+#include <asm/early_printk.h>
+
+void __init noreturn start_xen(unsigned long r3, unsigned long r4,
+                               unsigned long r5, unsigned long r6,
+                               unsigned long r7)
+{
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
+    for ( ;; )
+    {
+        // Set current hardware thread to very low priority
+        asm volatile("or 31,31,31");
+    }
+
+    unreachable();
+}
--=20
2.30.2


