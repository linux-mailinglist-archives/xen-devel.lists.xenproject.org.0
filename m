Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C103C74A41C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 21:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560046.875628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUI6-0005tx-2b; Thu, 06 Jul 2023 19:05:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560046.875628; Thu, 06 Jul 2023 19:05:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHUI5-0005rz-Ud; Thu, 06 Jul 2023 19:05:21 +0000
Received: by outflank-mailman (input) for mailman id 560046;
 Thu, 06 Jul 2023 19:05:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OuuY=CY=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qHUI4-0005cz-0L
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 19:05:20 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0afa9013-1c30-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 21:05:17 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 183CD8285730;
 Thu,  6 Jul 2023 14:05:16 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id vfnQ-v9rtfVS; Thu,  6 Jul 2023 14:05:14 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5D7A68285345;
 Thu,  6 Jul 2023 14:05:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id K-pbp7Q3LbEK; Thu,  6 Jul 2023 14:05:14 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 03F6A828573A;
 Thu,  6 Jul 2023 14:05:13 -0500 (CDT)
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
X-Inumbo-ID: 0afa9013-1c30-11ee-b237-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 5D7A68285345
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1688670314; bh=jxqgMUbaPR0uONSpM8cEw6PmxgXYo6TJVoLtsVO1/jQ=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pAEEdILrzxKWlEMgSdqPXqMXKLNuSZq2krpuhMQSs1goRuUsALWPgQfjP5KsAeR0a
	 vY4hvBWqr90obgUj/m+Kx5Qy9A0u1jkMqC0t8Q+qpZ5l+k8JEwkCO8tKeeiSptM9dr
	 7zPk74tMCM6C3ILcXB/YfYNS9yqNJiSK+L0mDoBA=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 1/3] xen/ppc: Set up a basic C environment
Date: Thu,  6 Jul 2023 14:04:39 -0500
Message-Id: <8c79f498ffcb0837ff18640dbaf5b66f79186574.1688670018.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1688670018.git.sanastasio@raptorengineering.com>
References: <cover.1688670018.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Update ppc64/head.S to set up an initial boot stack, zero the .bss
section, and jump to C.

Also refactor the endian fixup trampoline into its own macro, since it
will need to be used in multiple places, including every time we make a
call into firmware (see next commit).

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Makefile                |  2 ++
 xen/arch/ppc/include/asm/asm-defns.h | 40 ++++++++++++++++++++++++++++
 xen/arch/ppc/include/asm/config.h    |  2 +-
 xen/arch/ppc/ppc64/head.S            | 40 ++++++++++++++--------------
 xen/arch/ppc/setup.c                 | 19 +++++++++++++
 5 files changed, 82 insertions(+), 21 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/asm-defns.h
 create mode 100644 xen/arch/ppc/setup.c

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 98220648af..530fba2121 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -1,5 +1,7 @@
 obj-$(CONFIG_PPC64) +=3D ppc64/
=20
+obj-y +=3D setup.o
+
 $(TARGET): $(TARGET)-syms
 	cp -f $< $@
=20
diff --git a/xen/arch/ppc/include/asm/asm-defns.h b/xen/arch/ppc/include/=
asm/asm-defns.h
new file mode 100644
index 0000000000..6ea35f6edb
--- /dev/null
+++ b/xen/arch/ppc/include/asm/asm-defns.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _ASM_PPC_ASM_DEFNS_H
+#define _ASM_PPC_ASM_DEFNS_H
+
+/*
+ * Load a 64-bit immediate value into the specified GPR.
+ */
+#define LOAD_IMM64(reg, val)                                            =
     \
+    lis reg, (val) @highest;                                            =
     \
+    ori reg, reg, (val) @higher;                                        =
     \
+    rldicr reg, reg, 32, 31;                                            =
     \
+    oris reg, reg, (val) @h;                                            =
     \
+    ori reg, reg, (val) @l;
+
+#define LOAD_IMM32(reg, val)                                            =
     \
+    lis reg, (val) @h;                                                  =
     \
+    ori reg, reg, (val) @l;                                             =
     \
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
+#endif /* _ASM_PPC_ASM_DEFNS_H */
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm=
/config.h
index b9a6814f00..01ca5d0803 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -43,7 +43,7 @@
=20
 #define SMP_CACHE_BYTES (1 << 6)
=20
-#define STACK_ORDER 2
+#define STACK_ORDER 0
 #define STACK_SIZE  (PAGE_SIZE << STACK_ORDER)
=20
 /* 288 bytes below the stack pointer must be preserved by interrupt hand=
lers */
diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index 2fcefb40d8..7d848611cc 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -1,30 +1,30 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
=20
+#include <asm/asm-defns.h>
+
     .section .text.header, "ax", %progbits
=20
 ENTRY(start)
     /*
-     * Depending on how we were booted, the CPU could be running in eith=
er
-     * Little Endian or Big Endian mode. The following trampoline from L=
inux
-     * cleverly uses an instruction that encodes to a NOP if the CPU's
-     * endianness matches the assumption of the assembler (LE, in our ca=
se)
-     * or a branch to code that performs the endian switch in the other =
case.
+     * NOTE: argument registers (r3-r9) must be preserved until the C en=
trypoint
      */
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
+    FIXUP_ENDIAN
+
+    /* set up the TOC pointer */
+    LOAD_IMM32(%r2, .TOC.)
+
+    /* set up the initial stack */
+    LOAD_IMM32(%r1, cpu0_boot_stack)
+    li %r11, 0
+    stdu %r11, -STACK_FRAME_OVERHEAD(%r1)
+
+    /* call the C entrypoint */
+    bl start_xen
+
+    /* should never return */
+    trap
=20
     .size start, . - start
     .type start, %function
+
+    .section .init.data, "aw", @progbits
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
new file mode 100644
index 0000000000..73106474b2
--- /dev/null
+++ b/xen/arch/ppc/setup.c
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/init.h>
+
+/* Xen stack for bringing up the first CPU. */
+unsigned char __initdata cpu0_boot_stack[STACK_SIZE] __aligned(STACK_SIZ=
E);
+
+/* Macro to adjust thread priority for hardware multithreading */
+#define HMT_very_low()  asm volatile (" or %r31, %r31, %r31 ")
+
+void __init noreturn start_xen(unsigned long r3, unsigned long r4,
+                               unsigned long r5, unsigned long r6,
+                               unsigned long r7)
+{
+    for ( ; ; )
+        /* Set current hardware thread to very low priority */
+        HMT_very_low();
+
+    unreachable();
+}
--=20
2.30.2


