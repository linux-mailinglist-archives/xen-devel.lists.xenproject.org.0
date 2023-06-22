Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EC773A9BD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jun 2023 22:58:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553943.864824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNS-0006lJ-1f; Thu, 22 Jun 2023 20:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553943.864824; Thu, 22 Jun 2023 20:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qCRNR-0006ZR-QO; Thu, 22 Jun 2023 20:58:01 +0000
Received: by outflank-mailman (input) for mailman id 553943;
 Thu, 22 Jun 2023 20:58:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yL9z=CK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qCRNQ-0006Mr-An
 for xen-devel@lists.xenproject.org; Thu, 22 Jun 2023 20:58:00 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 765e6b2f-113f-11ee-8611-37d641c3527e;
 Thu, 22 Jun 2023 22:57:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 4229B8285AE5;
 Thu, 22 Jun 2023 15:57:56 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id AcOxRjrIFqQg; Thu, 22 Jun 2023 15:57:55 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 345A68285ABF;
 Thu, 22 Jun 2023 15:57:55 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cL7pMypPLvdP; Thu, 22 Jun 2023 15:57:55 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C83A48285AE2;
 Thu, 22 Jun 2023 15:57:54 -0500 (CDT)
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
X-Inumbo-ID: 765e6b2f-113f-11ee-8611-37d641c3527e
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 345A68285ABF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687467475; bh=AUs73XhBtToNcPNxUdpMc26W/Nu7OJgxz6dLp/feyYg=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=A00HjTWsh0nsZIcw/WkxwN3uBPbGJLQVaxTFY5Gt+UGDriGIAMW1+taGmwmQC6wBq
	 cBeobNRjfQTEDzwU1ayfDOwjfW/c4TUucktGEx0bJwZbJ0Lvp7sZk12UnAbGH5exBC
	 nGT5okG+zn0yZRT7scXtNCzsVUzAlCQ0Zw09HHnA=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 1/3] xen/ppc: Set up a basic C environment
Date: Thu, 22 Jun 2023 15:57:48 -0500
Message-Id: <1afe27097c5e1b55dcffa9464dc0cd0c1038a23e.1687466822.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1687466822.git.sanastasio@raptorengineering.com>
References: <cover.1687466822.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Update ppc64/head.S to set up an initial boot stack, zero the .bss
section, and jump to C.

Also refactor the endian fixup trampoline into its own macro, since it
will need to be used in multiple places, including every time we make a
call into firmware (see next commit).

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/Makefile                |  1 +
 xen/arch/ppc/include/asm/asm-defns.h | 36 ++++++++++++++++++
 xen/arch/ppc/ppc64/head.S            | 55 ++++++++++++++++++----------
 xen/arch/ppc/setup.c                 | 13 +++++++
 4 files changed, 85 insertions(+), 20 deletions(-)
 create mode 100644 xen/arch/ppc/include/asm/asm-defns.h
 create mode 100644 xen/arch/ppc/setup.c

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index 98220648af..fdbcd730d0 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -1,4 +1,5 @@
 obj-$(CONFIG_PPC64) +=3D ppc64/
+obj-y +=3D setup.o
=20
 $(TARGET): $(TARGET)-syms
 	cp -f $< $@
diff --git a/xen/arch/ppc/include/asm/asm-defns.h b/xen/arch/ppc/include/=
asm/asm-defns.h
new file mode 100644
index 0000000000..3db2063a39
--- /dev/null
+++ b/xen/arch/ppc/include/asm/asm-defns.h
@@ -0,0 +1,36 @@
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
diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index 2fcefb40d8..a7db5b7de2 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -1,30 +1,45 @@
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
+    /* set up the initial stack */
+    LOAD_IMM64(%r1, cpu0_boot_stack)
+    li %r11, 0
+    std %r11, 0(%r1)
+
+    /* clear .bss */
+    LOAD_IMM64(%r14, __bss_start)
+    LOAD_IMM64(%r15, __bss_end)
+1:
+    std %r11, 0(%r14)
+    addi %r14, %r14, 8
+    cmpld %r14, %r15
+    blt 1b
+
+    /* call the C entrypoint */
+    LOAD_IMM64(%r12, start_xen)
+    mtctr %r12
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
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
new file mode 100644
index 0000000000..4d1b72fa23
--- /dev/null
+++ b/xen/arch/ppc/setup.c
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/init.h>
+
+void __init noreturn start_xen(unsigned long r3, unsigned long r4,
+                               unsigned long r5, unsigned long r6,
+                               unsigned long r7)
+{
+    for ( ;; )
+        /* Set current hardware thread to very low priority */
+        asm volatile("or %r31, %r31, %r31");
+
+    unreachable();
+}
--=20
2.30.2


