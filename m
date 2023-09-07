Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2947B797CED
	for <lists+xen-devel@lfdr.de>; Thu,  7 Sep 2023 21:42:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.597595.931830 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeKsJ-0000fS-5T; Thu, 07 Sep 2023 19:41:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 597595.931830; Thu, 07 Sep 2023 19:41:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qeKsI-0000ZD-WB; Thu, 07 Sep 2023 19:41:11 +0000
Received: by outflank-mailman (input) for mailman id 597595;
 Thu, 07 Sep 2023 19:41:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=myun=EX=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qeKsH-0000X5-4F
 for xen-devel@lists.xenproject.org; Thu, 07 Sep 2023 19:41:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79efca6a-4db6-11ee-8783-cb3800f73035;
 Thu, 07 Sep 2023 21:41:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C4F9082859ED;
 Thu,  7 Sep 2023 14:41:01 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id QNGLP11fAkNX; Thu,  7 Sep 2023 14:41:00 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6689382857F8;
 Thu,  7 Sep 2023 14:41:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id GFKUhbma4seh; Thu,  7 Sep 2023 14:41:00 -0500 (CDT)
Received: from raptor-ewks-026.rptsys.com (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 14F4E828596F;
 Thu,  7 Sep 2023 14:41:00 -0500 (CDT)
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
X-Inumbo-ID: 79efca6a-4db6-11ee-8783-cb3800f73035
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6689382857F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1694115660; bh=ZddRoCQy9wva99e7szlKRNGTsxCR4BnXNupCx5YetZI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=SeJJOkQxrEkGPX5tTzmdi+g5dcXmbTkBM69tfp4SljfrS1CII2T1Lq6CEpxhpW8Yt
	 k1o0GNUz07zacDIf0TcvjwTJqH28RQZVOj83lH/pKJAwhJu1HpNVRvJrnC9MGC+VWo
	 dfounjEboE5lo4p9y7SoGx74whoZB7IM+hqWYI4E=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 2/2] xen/ppc: Drop support for pseries/OpenFirmware
Date: Thu,  7 Sep 2023 14:40:48 -0500
Message-Id: <c190537196f0d1143c7e9af710489201b500f9b9.1694114837.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1694114837.git.sanastasio@raptorengineering.com>
References: <cover.1694114837.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Since QEMU's PowerNV support has matured to the point where it is
now suitable for development, drop support for booting on the
paravirtualized pseries machine type and its associated interfaces.

Support for booting on pseries was broken by 74b725a64d80 ('xen/ppc:
Implement initial Radix MMU support'), and since there is little
practical value in continuing to support pseries as a target, just drop
support for it entirely.

Fixes: 74b725a64d80 ('xen/ppc: Implement initial Radix MMU support')
Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/ppc/Makefile           |   1 -
 xen/arch/ppc/boot-of.c          | 113 --------------------------------
 xen/arch/ppc/include/asm/boot.h |  19 ------
 xen/arch/ppc/ppc64/Makefile     |   1 -
 xen/arch/ppc/ppc64/of-call.S    |  83 -----------------------
 xen/arch/ppc/setup.c            |  11 +---
 6 files changed, 3 insertions(+), 225 deletions(-)
 delete mode 100644 xen/arch/ppc/boot-of.c
 delete mode 100644 xen/arch/ppc/ppc64/of-call.S

diff --git a/xen/arch/ppc/Makefile b/xen/arch/ppc/Makefile
index a059ac4c0a..b3205b8f7a 100644
--- a/xen/arch/ppc/Makefile
+++ b/xen/arch/ppc/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_PPC64) += ppc64/

-obj-y += boot-of.init.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.init.o
 obj-y += mm-radix.o
 obj-y += opal.o
diff --git a/xen/arch/ppc/boot-of.c b/xen/arch/ppc/boot-of.c
deleted file mode 100644
index d6755ccc8e..0000000000
--- a/xen/arch/ppc/boot-of.c
+++ /dev/null
@@ -1,113 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * This file was derived from Xen 3.2's xen/arch/powerpc/boot_of.c,
- * originally licensed under GPL version 2 or later.
- *
- * Copyright IBM Corp. 2005, 2006, 2007
- * Copyright Raptor Engineering, LLC
- *
- * Authors: Jimi Xenidis <jimix@watson.ibm.com>
- *          Hollis Blanchard <hollisb@us.ibm.com>
- *          Shawn Anastasio <sanastasio@raptorengineering.com>
- */
-
-#include <xen/init.h>
-#include <xen/macros.h>
-#include <xen/stdarg.h>
-#include <xen/types.h>
-#include <asm/boot.h>
-#include <asm/byteorder.h>
-#include <asm/early_printk.h>
-
-/*
- * The Open Firmware client interface is called in 32-bit mode with the MMU off,
- * so any addresses passed to it must be physical addresses under 4GB.
- *
- * Since the client interface is only used during early boot before the MMU is on
- * and Xen itself was loaded by Open Firmware (and therefore resides below 4GB),
- * we can achieve the desired result with a simple cast to uint32_t.
- */
-#define ADDR(x) ((uint32_t)(unsigned long)(x))
-
-/* OF entrypoint*/
-static unsigned long __initdata of_vec;
-
-static int __initdata of_out;
-
-static int __init of_call(const char *service, uint32_t nargs, uint32_t nrets,
-                          int32_t rets[], ...)
-{
-    int rc;
-    va_list args;
-    unsigned int i;
-    struct of_service s;
-
-    s.ofs_service = cpu_to_be32(ADDR(service));
-    s.ofs_nargs = cpu_to_be32(nargs);
-    s.ofs_nrets = cpu_to_be32(nrets);
-
-    /* Copy all the params into the args array */
-    va_start(args, rets);
-
-    for ( i = 0; i < nargs; i++ )
-        s.ofs_args[i] = cpu_to_be32(va_arg(args, uint32_t));
-
-    va_end(args);
-
-    rc = enter_of(&s, of_vec);
-
-    /* Copy all return values to the output rets array */
-    for ( i = 0; i < nrets; i++ )
-        rets[i] = be32_to_cpu(s.ofs_args[i + nargs]);
-
-    return rc;
-}
-
-static int __init of_finddevice(const char *devspec)
-{
-    int32_t rets[1] = { OF_FAILURE };
-
-    of_call("finddevice", 1, ARRAY_SIZE(rets), rets, ADDR(devspec));
-    return rets[0];
-}
-
-static int __init of_getprop(int ph, const char *name, void *buf, uint32_t buflen)
-{
-    int32_t rets[1] = { OF_FAILURE };
-
-    of_call("getprop", 4, ARRAY_SIZE(rets), rets, ph, ADDR(name), ADDR(buf),
-            buflen);
-    return rets[0];
-}
-
-int __init of_write(int ih, const char *addr, uint32_t len)
-{
-    int32_t rets[1] = { OF_FAILURE };
-
-    of_call("write", 3, ARRAY_SIZE(rets), rets, ih, ADDR(addr), len);
-    return rets[0];
-}
-
-static void __init of_putchar(char c)
-{
-    if ( c == '\n' )
-    {
-        char buf = '\r';
-        of_write(of_out, &buf, 1);
-    }
-    of_write(of_out, &c, 1);
-}
-
-void __init boot_of_init(unsigned long vec)
-{
-    int bof_chosen;
-
-    of_vec = vec;
-
-    /* Get a handle to the default console */
-    bof_chosen = of_finddevice("/chosen");
-    of_getprop(bof_chosen, "stdout", &of_out, sizeof(of_out));
-    of_out = be32_to_cpu(of_out);
-
-    early_printk_init(of_putchar);
-}
diff --git a/xen/arch/ppc/include/asm/boot.h b/xen/arch/ppc/include/asm/boot.h
index 296539cd9e..d62c3ff6e0 100644
--- a/xen/arch/ppc/include/asm/boot.h
+++ b/xen/arch/ppc/include/asm/boot.h
@@ -4,25 +4,6 @@

 #include <xen/types.h>

-/*
- * OpenFirmware boot interfaces
- */
-
-enum {
-    OF_FAILURE = -1,
-    OF_SUCCESS = 0,
-};
-
-struct of_service {
-    __be32 ofs_service;
-    __be32 ofs_nargs;
-    __be32 ofs_nrets;
-    __be32 ofs_args[10];
-};
-
-int enter_of(struct of_service *args, unsigned long entry);
-void boot_of_init(unsigned long vec);
-
 /*
  * OPAL boot interfaces
  */
diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
index b9a91dc15f..5b88355bb2 100644
--- a/xen/arch/ppc/ppc64/Makefile
+++ b/xen/arch/ppc/ppc64/Makefile
@@ -1,3 +1,2 @@
 obj-y += head.o
-obj-y += of-call.o
 obj-y += opal-calls.o
diff --git a/xen/arch/ppc/ppc64/of-call.S b/xen/arch/ppc/ppc64/of-call.S
deleted file mode 100644
index 2a2e308f6b..0000000000
--- a/xen/arch/ppc/ppc64/of-call.S
+++ /dev/null
@@ -1,83 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Adapted from Linux's arch/powerpc/kernel/entry_64.S, with the
- * following copyright notice:
- *
- *  PowerPC version
- *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
- *  Rewritten by Cort Dougan (cort@cs.nmt.edu) for PReP
- *    Copyright (C) 1996 Cort Dougan <cort@cs.nmt.edu>
- *  Adapted for Power Macintosh by Paul Mackerras.
- *  Low-level exception handlers and MMU support
- *  rewritten by Paul Mackerras.
- *    Copyright (C) 1996 Paul Mackerras.
- *  MPC8xx modifications Copyright (C) 1997 Dan Malek (dmalek@jlc.net).
- */
-
-#include <asm/asm-offsets.h>
-#include <asm/asm-defns.h>
-#include <asm/msr.h>
-
-/* size of minimum stack frame that can hold an entire cpu_user_regs struct */
-#define STACK_SWITCH_FRAME_SIZE UREGS_sizeof
-
-    .section .init.text, "ax", @progbits
-
-ENTRY(enter_of)
-    mflr    %r0
-    std     %r0, 16(%r1)
-    stdu    %r1, -STACK_SWITCH_FRAME_SIZE(%r1) /* Save SP and create stack space */
-
-    /*
-     * Because PROM is running in 32b mode, it clobbers the high order half
-     * of all registers that it saves.  We therefore save those registers
-     * PROM might touch to the stack.  (%r0, %r3-%r13 are caller saved)
-     */
-    SAVE_GPR(2, %r1)
-    SAVE_GPR(13, %r1)
-    SAVE_NVGPRS(%r1)
-    mfcr    %r10
-    mfmsr   %r11
-    std     %r10, UREGS_cr(%r1)
-    std     %r11, UREGS_msr(%r1)
-
-    /* Put PROM address in SRR0 */
-    mtsrr0  %r4
-
-    /* Setup our trampoline return addr in LR */
-    bcl     20, 31, .+4
-0:  mflr    %r4
-    addi    %r4, %r4, 1f - 0b
-    mtlr    %r4
-
-    /* Prepare a 32-bit mode big endian MSR */
-    LOAD_IMM64(%r12, MSR_SF | MSR_LE)
-    andc    %r11, %r11, %r12
-    mtsrr1  %r11
-    rfid
-
-1:  /* Return from OF */
-    FIXUP_ENDIAN
-
-    /* Just make sure that %r1 top 32 bits didn't get corrupt by OF */
-    rldicl  %r1, %r1, 0, 32
-
-    /* Restore the MSR (back to 64 bits) */
-    ld      %r0, UREGS_msr(%r1)
-    mtmsrd  %r0
-    isync
-
-    /* Restore other registers */
-    REST_GPR(2, %r1)
-    REST_GPR(13, %r1)
-    REST_NVGPRS(%r1)
-    ld      %r4, UREGS_cr(%r1)
-    mtcr    %r4
-
-    addi    %r1, %r1, STACK_SWITCH_FRAME_SIZE
-    ld      %r0, 16(%r1)
-    mtlr    %r0
-    blr
-
-    .size enter_of, . - enter_of
-    .type enter_of, %function
diff --git a/xen/arch/ppc/setup.c b/xen/arch/ppc/setup.c
index 0106e9c9da..3fc7705d9b 100644
--- a/xen/arch/ppc/setup.c
+++ b/xen/arch/ppc/setup.c
@@ -14,17 +14,12 @@ void __init noreturn start_xen(unsigned long r3, unsigned long r4,
 {
     if ( r5 )
     {
-        /* OpenFirmware boot protocol */
-        boot_of_init(r5);
+        /* Unsupported OpenFirmware boot protocol */
+        __builtin_trap();
     }
     else
     {
-        /*
-         * kexec boot protocol
-         *
-         * TODO: This currently assumes an OPAL/PowerNV system, but it's also
-         * possible to be kexec'd on an OF system.
-         */
+        /* kexec boot protocol */
         boot_opal_init((void *)r3);
     }

--
2.30.2


