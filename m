Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6209376C164
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:11:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574612.900059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzSk-0003bz-SH; Wed, 02 Aug 2023 00:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574612.900059; Wed, 02 Aug 2023 00:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzSk-0003YO-LL; Wed, 02 Aug 2023 00:11:38 +0000
Received: by outflank-mailman (input) for mailman id 574612;
 Wed, 02 Aug 2023 00:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQzSj-0003Fo-4K
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:11:37 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 23bf799c-30c9-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 02:11:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E16608285393;
 Tue,  1 Aug 2023 19:11:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id jmLuI6QSiIjo; Tue,  1 Aug 2023 19:11:32 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AE9DD82865A8;
 Tue,  1 Aug 2023 19:11:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ksnYdg15_S0P; Tue,  1 Aug 2023 19:11:32 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 074B282860C6;
 Tue,  1 Aug 2023 19:11:31 -0500 (CDT)
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
X-Inumbo-ID: 23bf799c-30c9-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com AE9DD82865A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690935092; bh=O7tKNlbYGTBKU34+OS6G3eEZ3bNtT5+tgy+g2otdYhY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=V/3EqYNrKKtMm/16ssB2zqoK89/dcxqBADN4KXTDJAOOLV73GByo4nUzisq/nL/ym
	 kb1QDaOsd6x972vpY6m4Zb9QwcyMKV5hTFpwdzGgDnLZHJQUAHMVON1DXPuIlQnjBZ
	 1G8boDVthyNjJDi5p3dcMydwTS27PAu5xnnuEq4M=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 3/4] xen/ppc: Parse device tree for OPAL node on PowerNV
Date: Tue,  1 Aug 2023 19:11:05 -0500
Message-Id: <7026e54897e360d935d065c7ec904dc3f6082857.1690934409.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1690934409.git.sanastasio@raptorengineering.com>
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
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
Changed in v2:
  - Remove ALL_LIBS-y override

 xen/arch/ppc/Kconfig                 |  1 +
 xen/arch/ppc/Makefile                |  1 +
 xen/arch/ppc/arch.mk                 |  3 +-
 xen/arch/ppc/include/asm/boot.h      | 16 +++++++++-
 xen/arch/ppc/include/asm/bug.h       | 18 +++++++++++
 xen/arch/ppc/include/asm/cache.h     |  6 ++++
 xen/arch/ppc/include/asm/processor.h | 13 +++++++-
 xen/arch/ppc/include/asm/string.h    |  6 ++++
 xen/arch/ppc/include/asm/system.h    |  6 ++++
 xen/arch/ppc/opal.c                  | 48 ++++++++++++++++++++++++++++
 xen/arch/ppc/setup.c                 |  9 ++++--
 11 files changed, 121 insertions(+), 6 deletions(-)
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

 config PPC64
 	def_bool y
diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 098a4dd0a9..0c0a7884a1 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -2,6 +2,7 @@ obj-$(CONFIG_PPC64) +=3D ppc64/

 obj-y +=3D boot-of.init.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D early_printk.init.o
+obj-y +=3D opal.o
 obj-y +=3D setup.o

 $(TARGET): $(TARGET)-syms
diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index 0183b9ac6a..3bf79bac37 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -10,5 +10,4 @@ CFLAGS +=3D -mstrict-align -mcmodel=3Dmedium -mabi=3Del=
fv2 -fPIC -mno-altivec -mno-vsx
 LDFLAGS +=3D -m elf64lppc

 # TODO: Drop override when more of the build is working
-override ALL_OBJS-y =3D arch/$(SRCARCH)/built_in.o
-override ALL_LIBS-y =3D
+override ALL_OBJS-y =3D arch/$(SRCARCH)/built_in.o common/libfdt/built_i=
n.o lib/built_in.o
diff --git a/xen/arch/ppc/include/asm/boot.h b/xen/arch/ppc/include/asm/b=
oot.h
index 9b8a7c43c2..296539cd9e 100644
--- a/xen/arch/ppc/include/asm/boot.h
+++ b/xen/arch/ppc/include/asm/boot.h
@@ -4,7 +4,10 @@

 #include <xen/types.h>

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

     early_printk("Hello, ppc64le!\n");
--
2.30.2


