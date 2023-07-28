Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C4F7677C5
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 23:35:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571585.895807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPV7S-0000Qr-9o; Fri, 28 Jul 2023 21:35:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571585.895807; Fri, 28 Jul 2023 21:35:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPV7S-0000L5-3b; Fri, 28 Jul 2023 21:35:30 +0000
Received: by outflank-mailman (input) for mailman id 571585;
 Fri, 28 Jul 2023 21:35:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/sdN=DO=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qPV7Q-0000AZ-N0
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 21:35:28 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a9f4dafd-2d8e-11ee-8613-37d641c3527e;
 Fri, 28 Jul 2023 23:35:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4F1188285971;
 Fri, 28 Jul 2023 16:35:25 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id Cqo4JByJ009P; Fri, 28 Jul 2023 16:35:24 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4BA508285ABC;
 Fri, 28 Jul 2023 16:35:24 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PytXXoT69_jJ; Fri, 28 Jul 2023 16:35:24 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id D6654828593C;
 Fri, 28 Jul 2023 16:35:23 -0500 (CDT)
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
X-Inumbo-ID: a9f4dafd-2d8e-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4BA508285ABC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690580124; bh=UWQTPyF4UWlpKIe0TYSOcn8onLmEFvDdX4LeU0YnQqo=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=DwBMFLKBvGWbth6zu4E+8Y1+TV1O/OpDkuavFqc6YnZwrfGAqvEGSPAFrdP5o/66L
	 SGYg5Cy08tN1ItgEP2DCFKkwD6i7B7wtzBgRLV9+6HtcgIZ+N2DIMnm5xTjpGXlSqE
	 zIAZ6AYr4r/EPSDaro2646XFSinvGMvW7rtVjaXI=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 4/5] xen/ppc: Parse device tree for OPAL node on PowerNV
Date: Fri, 28 Jul 2023 16:35:09 -0500
Message-Id: <fc4011f42ea017ec9ae12c4f1a0c1a09b7bbcfc8.1690579561.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1690579561.git.sanastasio@raptorengineering.com>
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Communication with firmware boot services on PowerNV requires parsing
the fdt blob passed by the bootloader in order to obtain the firmware
entrypoint. Use Xen's libfdt to do this and store the information
required for firmware calls, to be implemented in a future patch.

The full xen/common build doesn't yet work, but libfdt and its xen/lib
dependency can be made to build by defining a few stub headers.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Kconfig                 |  1 +
 xen/arch/ppc/Makefile                |  1 +
 xen/arch/ppc/arch.mk                 |  4 +--
 xen/arch/ppc/include/asm/boot.h      | 16 +++++++++-
 xen/arch/ppc/include/asm/bug.h       | 18 +++++++++++
 xen/arch/ppc/include/asm/cache.h     |  6 ++++
 xen/arch/ppc/include/asm/processor.h | 13 +++++++-
 xen/arch/ppc/include/asm/string.h    |  6 ++++
 xen/arch/ppc/include/asm/system.h    |  6 ++++
 xen/arch/ppc/opal.c                  | 48 ++++++++++++++++++++++++++++
 xen/arch/ppc/setup.c                 |  9 ++++--
 11 files changed, 122 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/bug.h
 create mode 100644 xen/arch/ppc/include/asm/cache.h
 create mode 100644 xen/arch/ppc/include/asm/string.h
 create mode 100644 xen/arch/ppc/include/asm/system.h
 create mode 100644 xen/arch/ppc/opal.c

diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
index a2ade2ecf4..b32dce39b8 100644
--- a/xen/arch/ppc/Kconfig
+++ b/xen/arch/ppc/Kconfig
@@ -1,5 +1,6 @@
 config PPC
 	def_bool y
+	select HAS_DEVICE_TREE
=20
 config PPC64
 	def_bool y
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 098a4dd0a9..0c0a7884a1 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_PPC64) +=3D ppc64/
=20
 obj-y +=3D boot-of.init.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.init.o
+obj-y +=3D opal.o
 obj-y +=3D setup.o
=20
 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index 0183b9ac6a..9f66f7a57b 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -10,5 +10,5 @@ CFLAGS +=3D -mstrict-align -mcmodel=3Dmedium -mabi=3Del=
fv2 -fPIC -mno-altivec -mno-vsx
 LDFLAGS +=3D -m elf64lppc
=20
 # TODO: Drop override when more of the build is working
-override ALL_OBJS-y =3D arch/$(SRCARCH)/built_in.o
-override ALL_LIBS-y =3D
+override ALL_OBJS-y =3D arch/$(SRCARCH)/built_in.o common/libfdt/built_i=
n.o lib/built_in.o
+override ALL_LIBS-y =3D lib/lib.a
diff --git a/xen/arch/ppc/include/asm/boot.h b/xen/arch/ppc/include/asm/b=
oot.h
index 9b8a7c43c2..296539cd9e 100644
--- a/xen/arch/ppc/include/asm/boot.h
+++ b/xen/arch/ppc/include/asm/boot.h
@@ -4,7 +4,10 @@
=20
 #include <xen/types.h>
=20
-/* a collection of interfaces used during boot. */
+/*
+ * OpenFirmware boot interfaces
+ */
+
 enum {
     OF_FAILURE =3D -1,
     OF_SUCCESS =3D 0,
@@ -20,4 +23,15 @@ struct of_service {
 int enter_of(struct of_service *args, unsigned long entry);
 void boot_of_init(unsigned long vec);
=20
+/*
+ * OPAL boot interfaces
+ */
+
+struct opal {
+    uint64_t base;
+    uint64_t entry;
+};
+
+void boot_opal_init(const void *fdt);
+
 #endif /* _ASM_PPC_BOOT_H */
diff --git a/xen/arch/ppc/include/asm/bug.h b/xen/arch/ppc/include/asm/bu=
g.h
new file mode 100644
index 0000000000..e5e874b31c
--- /dev/null
+++ b/xen/arch/ppc/include/asm/bug.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _ASM_PPC_BUG_H
+#define _ASM_PPC_BUG_H
+
+#include <xen/stringify.h>
+
+/*
+ * Power ISA guarantees that an instruction consisting of all zeroes is
+ * illegal.
+ */
+#define BUG_OPCODE  0x00000000
+
+#define BUG_INSTR ".long " __stringify(BUG_OPCODE)
+
+#define BUG_FN_REG r0
+
+#endif /* _ASM_PPC_BUG_H */
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
diff --git a/xen/arch/ppc/include/asm/processor.h b/xen/arch/ppc/include/=
asm/processor.h
index 838d279508..2300640787 100644
--- a/xen/arch/ppc/include/asm/processor.h
+++ b/xen/arch/ppc/include/asm/processor.h
@@ -133,6 +133,17 @@ struct cpu_user_regs
     uint32_t entry_vector;
 };
=20
-#endif
+/*
+ * panic() isn't available at the moment so an infinite loop will be
+ * used temporarily.
+ * TODO: change it to panic()
+ */
+static inline void noreturn die(void)
+{
+    for ( ; ; )
+        HMT_very_low();
+}
+
+#endif /* __ASSEMBLY__ */
=20
 #endif /* _ASM_PPC_PROCESSOR_H */
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
diff --git a/xen/arch/ppc/include/asm/system.h b/xen/arch/ppc/include/asm=
/system.h
new file mode 100644
index 0000000000..94091df644
--- /dev/null
+++ b/xen/arch/ppc/include/asm/system.h
@@ -0,0 +1,6 @@
+#ifndef _ASM_SYSTEM_H_
+#define _ASM_SYSTEM_H_
+
+#define smp_wmb() __asm__ __volatile__ ( "lwsync" : : : "memory" )
+
+#endif /* _ASM_SYSTEM_H */
diff --git a/xen/arch/ppc/opal.c b/xen/arch/ppc/opal.c
new file mode 100644
index 0000000000..251de8ac23
--- /dev/null
+++ b/xen/arch/ppc/opal.c
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <asm/boot.h>
+#include <asm/early_printk.h>
+#include <asm/opal-api.h>
+#include <asm/processor.h>
+#include <xen/types.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/init.h>
+#include <xen/lib.h>
+
+/* Global OPAL struct containing entrypoint and base */
+struct opal opal;
+
+void __init boot_opal_init(const void *fdt)
+{
+    int opal_node;
+    const __be64 *opal_base;
+    const __be64 *opal_entry;
+
+    if ( fdt_check_header(fdt) < 0 )
+    {
+        /*
+         * NOTE: This won't actually print since the early serial
+         * console isn't set up yet.
+         */
+        early_printk("Booted without valid FDT pointer in r3!\n");
+        die();
+    }
+
+    opal_node =3D fdt_path_offset(fdt, "/ibm,opal");
+    if ( opal_node < 0 )
+    {
+        early_printk("Unable to find ibm,opal node!\n");
+        die();
+    }
+
+    opal_base =3D fdt_getprop(fdt, opal_node, "opal-base-address", NULL)=
;
+    opal_entry =3D fdt_getprop(fdt, opal_node, "opal-entry-address", NUL=
L);
+    if ( !opal_base || !opal_entry )
+    {
+        early_printk("Failed to get opal-base-address/opal-entry-address=
 "
+                     "property from DT!\n");
+        die();
+    }
+
+    opal.base =3D be64_to_cpu(*opal_base);
+    opal.entry =3D be64_to_cpu(*opal_entry);
+}
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 7c623a49f5..bacd6d1acd 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -18,8 +18,13 @@ void __init noreturn start_xen(unsigned long r3, unsig=
ned long r4,
     }
     else
     {
-        /* kexec boot: Unimplemented */
-        __builtin_trap();
+        /*
+         * kexec boot protocol
+         *
+         * TODO: This currently assumes an OPAL/PowerNV system, but it's=
 also
+         * possible to be kexec'd on an OF system.
+         */
+        boot_opal_init((void *) r3);
     }
=20
     early_printk("Hello, ppc64le!\n");
--=20
2.30.2


