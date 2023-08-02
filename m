Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4498E76C161
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574613.900068 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzSl-0003r6-E4; Wed, 02 Aug 2023 00:11:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574613.900068; Wed, 02 Aug 2023 00:11:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzSl-0003iW-8P; Wed, 02 Aug 2023 00:11:39 +0000
Received: by outflank-mailman (input) for mailman id 574613;
 Wed, 02 Aug 2023 00:11:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQzSj-0003Fo-P8
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:11:37 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24068f59-30c9-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 02:11:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 54EA182860C6;
 Tue,  1 Aug 2023 19:11:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id GKvhWNa3NfSJ; Tue,  1 Aug 2023 19:11:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 3B72F8285BEB;
 Tue,  1 Aug 2023 19:11:33 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id BCZX--nrtIun; Tue,  1 Aug 2023 19:11:33 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 97F828285393;
 Tue,  1 Aug 2023 19:11:32 -0500 (CDT)
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
X-Inumbo-ID: 24068f59-30c9-11ee-8613-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 3B72F8285BEB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690935093; bh=p+DRgSuWZDmGJuetNvOOlJpomr6S/4OpH3mhhUD04Oc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=hLhwH/nuDNpwfiyDhZcTAm0Rx0PElf7t3DcFyDabxTjHA/oDjkia+tbjrJt+zcC77
	 vsd6dLUJX2PxCYZFFWIHCSgxGtCFAHhw0P86vBOHkfO+vsYEHeo2rxdzFhNwYaKgPi
	 tB3cWgcs/ZPtmNHgDrBiBo+1AU7XaxNH7ollBkaA=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 4/4] xen/ppc: Implement early serial console on PowerNV
Date: Tue,  1 Aug 2023 19:11:06 -0500
Message-Id: <3176762c2eb09d01d65a348e296a94cf0356ff46.1690934409.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1690934409.git.sanastasio@raptorengineering.com>
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Implement the OPAL firmware calls required to write to the serial
console on PowerNV systems. Unlike pseries/Open Firmware, the OPAL
firmware interface can be used past early boot and as such the relevant
functions are not marked as __init.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changed in v2:
  - Include asm-offsets in asm-defns.h
  - Clean up assembly formatting in asm-defns.h
  - Clean up formatting of opal.c
  - Clean up stray semicolon in OPAL_CALL macro in opal-calls.S

 xen/arch/ppc/include/asm/asm-defns.h | 18 ++++++-
 xen/arch/ppc/opal.c                  | 28 +++++++++-
 xen/arch/ppc/ppc64/Makefile          |  1 +
 xen/arch/ppc/ppc64/asm-offsets.c     |  4 ++
 xen/arch/ppc/ppc64/opal-calls.S      | 81 ++++++++++++++++++++++++++++
 5 files changed, 129 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/ppc/ppc64/opal-calls.S

diff --git a/xen/arch/ppc/include/asm/asm-defns.h b/xen/arch/ppc/include/=
asm/asm-defns.h
index 5821f9024d..f1c49808bd 100644
--- a/xen/arch/ppc/include/asm/asm-defns.h
+++ b/xen/arch/ppc/include/asm/asm-defns.h
@@ -2,6 +2,8 @@
 #ifndef _ASM_PPC_ASM_DEFNS_H
 #define _ASM_PPC_ASM_DEFNS_H

+#include <asm/asm-offsets.h>
+
 /*
  * Load a 64-bit immediate value into the specified GPR.
  */
@@ -20,8 +22,20 @@
  * Load the address of a symbol from the TOC into the specified GPR.
  */
 #define LOAD_REG_ADDR(reg,name)                                         =
     \
-    addis reg,%r2,name@toc@ha;                                          =
     \
-    addi  reg,reg,name@toc@l
+    addis reg, %r2, name@toc@ha;                                        =
     \
+    addi  reg, reg, name@toc@l
+
+/*
+ * Declare a global assembly function with a proper TOC setup prologue
+ */
+#define _GLOBAL_TOC(name)                                               =
    \
+    .balign 4;                                                          =
    \
+    .type name, @function;                                              =
    \
+    .globl name;                                                        =
    \
+name:                                                                   =
    \
+0:  addis %r2, %r12, (.TOC.-0b)@ha;                                     =
    \
+    addi  %r2, %r2, (.TOC.-0b)@l;                                       =
    \
+    .localentry name, .-name

 /*
  * Depending on how we were booted, the CPU could be running in either
diff --git a/xen/arch/ppc/opal.c b/xen/arch/ppc/opal.c
index 251de8ac23..1183b7d5ef 100644
--- a/xen/arch/ppc/opal.c
+++ b/xen/arch/ppc/opal.c
@@ -8,9 +8,29 @@
 #include <xen/init.h>
 #include <xen/lib.h>

-/* Global OPAL struct containing entrypoint and base */
+/* Global OPAL struct containing entrypoint and base used by opal-calls.=
S */
 struct opal opal;

+int64_t opal_console_write(int64_t term_number, uint64_t *length,
+                           const void *buffer);
+int64_t opal_console_flush(int64_t term_number);
+int64_t opal_reinit_cpus(uint64_t flags);
+
+static void opal_putchar(char c)
+{
+    uint64_t len;
+
+    if ( c =3D=3D '\n' )
+    {
+        char buf =3D '\r';
+        len =3D cpu_to_be64(1);
+        opal_console_write(0, &len, &buf);
+    }
+    len =3D cpu_to_be64(1);
+    opal_console_write(0, &len, &c);
+    opal_console_flush(0);
+}
+
 void __init boot_opal_init(const void *fdt)
 {
     int opal_node;
@@ -45,4 +65,10 @@ void __init boot_opal_init(const void *fdt)

     opal.base =3D be64_to_cpu(*opal_base);
     opal.entry =3D be64_to_cpu(*opal_entry);
+
+    early_printk_init(opal_putchar);
+
+    /* Ask OPAL to set HID0 for Little Endian interrupts + Radix TLB sup=
port */
+    opal_reinit_cpus(OPAL_REINIT_CPUS_HILE_LE | OPAL_REINIT_CPUS_MMU_RAD=
IX |
+                     OPAL_REINIT_CPUS_MMU_HASH);
 }
diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
index f4956daaa9..b9a91dc15f 100644
--- a/xen/arch/ppc/ppc64/Makefile
+++ b/xen/arch/ppc/ppc64/Makefile
@@ -1,2 +1,3 @@
 obj-y +=3D head.o
 obj-y +=3D of-call.o
+obj-y +=3D opal-calls.o
diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-of=
fsets.c
index e1129cb0f4..c15c1bf136 100644
--- a/xen/arch/ppc/ppc64/asm-offsets.c
+++ b/xen/arch/ppc/ppc64/asm-offsets.c
@@ -6,6 +6,7 @@

 #include <xen/macros.h>
 #include <asm/processor.h>
+#include <asm/boot.h>

 #define DEFINE(_sym, _val)                                              =
    \
     asm volatile ( "\n.ascii\"=3D=3D>#define " #_sym " %0 /* " #_val " *=
/<=3D=3D\"" \
@@ -46,6 +47,9 @@ void __dummy__(void)
     OFFSET(UREGS_cr, struct cpu_user_regs, cr);
     OFFSET(UREGS_fpscr, struct cpu_user_regs, fpscr);
     DEFINE(UREGS_sizeof, sizeof(struct cpu_user_regs));
+
+    OFFSET(OPAL_base, struct opal, base);
+    OFFSET(OPAL_entry, struct opal, entry);
 }

 /*
diff --git a/xen/arch/ppc/ppc64/opal-calls.S b/xen/arch/ppc/ppc64/opal-ca=
lls.S
new file mode 100644
index 0000000000..cc5de75c8a
--- /dev/null
+++ b/xen/arch/ppc/ppc64/opal-calls.S
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Adapted from Linux's arch/powerpc/boot/opal-calls.S
+ *
+ * Copyright (c) 2016 IBM Corporation.
+ * Copyright Raptor Engineering, LLC
+ */
+
+#include <asm/asm-defns.h>
+#include <asm/opal-api.h>
+#include <asm/msr.h>
+
+    .text
+
+#define OPAL_CALL(name, token)  \
+    .globl name;                \
+name:                           \
+    li      %r0, token;         \
+    b       opal_call
+
+ _GLOBAL_TOC(opal_call)
+    /* Back up LR, CR, r2 in caller's stack frame */
+    mflr    %r11
+    mfcr    %r12
+    std     %r2, 24(%r1)
+    std     %r11, 16(%r1)
+    stw     %r12, 8(%r1)
+
+    /* Use r14 (non-volatile) to store the virtual address of opal_retur=
n_mmu */
+    std     %r14, -8(%r1)
+    stdu    %r1, -48(%r1)
+    LOAD_REG_ADDR(%r14, opal_return_mmu)
+
+    /*
+     * Setup new MSR without LE or MMU. Original MSR will be preserved a=
cross
+     * opal call in r13
+     */
+    mfmsr   %r13
+    li      %r11, MSR_LE | MSR_IR | MSR_DR
+    andc    %r12, %r13, %r11
+    mthsrr1 %r12
+
+    LOAD_REG_ADDR(%r11, opal_return_real)
+    mtlr     %r11
+
+    /* Load the opal call entry point and base */
+    LOAD_REG_ADDR(%r11, opal)
+    ld      %r12, OPAL_entry(%r11)
+    ld      %r2, OPAL_base(%r11)
+    mthsrr0 %r12
+    hrfid
+
+opal_return_real:
+    /*
+     * OPAL will always return to us in Big Endian mode. Since we are go=
ing
+     * to restore the old MSR with the correct endianness and MMU status=
 set, we
+     * can avoid an unnecessary FIXUP_ENDIAN trampoline by just encoding=
 the
+     * required Big Endian instructions to restore the old MSR direclty.
+     */
+    .long 0xa64bbb7d /* mthsrr1 %r13 (Old MSR) */
+    .long 0xa64bda7d /* mthsrr0 %r14 (Virtual address of opal_return_mmu=
) */
+    .long 0x2402004c /* hrfid */
+
+opal_return_mmu:
+    /*
+     * We're back in the correct endianness and MMU mode, restore regist=
ers
+     * and return
+     */
+    addi    %r1, %r1, 48
+    ld      %r14, -8(%r1)
+    lwz     %r11, 8(%r1)
+    ld      %r12, 16(%r1)
+    ld      %r2, 24(%r1)
+    mtcr    %r11
+    mtlr    %r12
+
+    blr
+
+OPAL_CALL(opal_console_write, OPAL_CONSOLE_WRITE)
+OPAL_CALL(opal_console_flush, OPAL_CONSOLE_FLUSH)
+OPAL_CALL(opal_reinit_cpus, OPAL_REINIT_CPUS)
--
2.30.2


