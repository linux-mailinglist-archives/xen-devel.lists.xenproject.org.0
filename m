Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AC076C160
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 02:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574611.900054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzSk-0003YQ-I0; Wed, 02 Aug 2023 00:11:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574611.900054; Wed, 02 Aug 2023 00:11:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQzSk-0003Ul-B3; Wed, 02 Aug 2023 00:11:38 +0000
Received: by outflank-mailman (input) for mailman id 574611;
 Wed, 02 Aug 2023 00:11:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SOIS=DT=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qQzSi-0003Fc-79
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 00:11:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23034186-30c9-11ee-b25c-6b7b168915f2;
 Wed, 02 Aug 2023 02:11:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A538B828574A;
 Tue,  1 Aug 2023 19:11:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id DUQIxQ5pEZEn; Tue,  1 Aug 2023 19:11:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 6DE398284EB7;
 Tue,  1 Aug 2023 19:11:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id sEqQJTs6SKw6; Tue,  1 Aug 2023 19:11:31 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 171CE8285491;
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
X-Inumbo-ID: 23034186-30c9-11ee-b25c-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 6DE398284EB7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690935091; bh=evTmLh29uUc24NiflnIA1Cij5ypJhBmERpFc9O8S3xI=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=caEcdTwlQbhKy8QLdyCBbZLRGtqRv7YaDeFXDJlJ/YnRhdU+LjpFDhvYX39D2fITo
	 +/+2mJi8jWHC/e2o3lbo1oBy4Gvo/xgTPWZEXEMWRxGiyJu/Z+njG+jhxuzBzZ4kQD
	 IqG8pvweAKvZ1FBcDIwqUScYaiZdHMPcaaYYiXiM=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH 1/4] xen/ppc: Switch to medium PIC code model
Date: Tue,  1 Aug 2023 19:11:03 -0500
Message-Id: <c72c242988295b665a8bd235a351806dc112ad01.1690934409.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1690934409.git.sanastasio@raptorengineering.com>
References: <cover.1690934409.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Switch Xen to the medium PIC code model on Power. Among other things,
this allows us to be load address agnostic and will open the door to
booting on bare metal PowerNV systems that don't use OpenFirmware.

Also update XEN_VIRT_START to 0xc000000000000000, which is equivalent to
address 0x0 when the MMU is off. This prevents Open Firmware from
loading Xen at an offset from its base load address, so the DECL_SECTION
hack in xen.lds.S is no longer required.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changed in v2:
  - Remove stray newline
  - Use label instead of .+4 in TOC setup branch

 xen/arch/ppc/arch.mk                 |  2 +-
 xen/arch/ppc/include/asm/asm-defns.h |  7 +++++
 xen/arch/ppc/include/asm/config.h    |  2 +-
 xen/arch/ppc/ppc64/head.S            | 12 +++++---
 xen/arch/ppc/xen.lds.S               | 44 ++++++++++------------------
 5 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/xen/arch/ppc/arch.mk b/xen/arch/ppc/arch.mk
index 7eec22c283..0183b9ac6a 100644
--- a/xen/arch/ppc/arch.mk
+++ b/xen/arch/ppc/arch.mk
@@ -5,7 +5,7 @@ ppc-march-$(CONFIG_POWER_ISA_2_07B) :=3D power8
 ppc-march-$(CONFIG_POWER_ISA_3_00) :=3D power9

 CFLAGS +=3D -m64 -mlittle-endian -mcpu=3D$(ppc-march-y)
-CFLAGS +=3D -mstrict-align -mcmodel=3Dlarge -mabi=3Delfv2 -mno-altivec -=
mno-vsx
+CFLAGS +=3D -mstrict-align -mcmodel=3Dmedium -mabi=3Delfv2 -fPIC -mno-al=
tivec -mno-vsx -msoft-float

 LDFLAGS +=3D -m elf64lppc

diff --git a/xen/arch/ppc/include/asm/asm-defns.h b/xen/arch/ppc/include/=
asm/asm-defns.h
index 35b1c89d4e..5821f9024d 100644
--- a/xen/arch/ppc/include/asm/asm-defns.h
+++ b/xen/arch/ppc/include/asm/asm-defns.h
@@ -16,6 +16,13 @@
     lis reg, (val) @h;                                                  =
     \
     ori reg, reg, (val) @l;                                             =
     \

+/*
+ * Load the address of a symbol from the TOC into the specified GPR.
+ */
+#define LOAD_REG_ADDR(reg,name)                                         =
     \
+    addis reg,%r2,name@toc@ha;                                          =
     \
+    addi  reg,reg,name@toc@l
+
 /*
  * Depending on how we were booted, the CPU could be running in either
  * Little Endian or Big Endian mode. The following trampoline from Linux
diff --git a/xen/arch/ppc/include/asm/config.h b/xen/arch/ppc/include/asm=
/config.h
index cb27d2781e..d060f0dca7 100644
--- a/xen/arch/ppc/include/asm/config.h
+++ b/xen/arch/ppc/include/asm/config.h
@@ -39,7 +39,7 @@
     name:
 #endif

-#define XEN_VIRT_START _AT(UL, 0x400000)
+#define XEN_VIRT_START _AT(UL, 0xc000000000000000)

 #define SMP_CACHE_BYTES (1 << 6)

diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
index 02ff520458..4172f1b8ec 100644
--- a/xen/arch/ppc/ppc64/head.S
+++ b/xen/arch/ppc/ppc64/head.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */

 #include <asm/asm-defns.h>
+#include <asm/asm-offsets.h>

     .section .text.header, "ax", %progbits

@@ -11,16 +12,19 @@ ENTRY(start)
     FIXUP_ENDIAN

     /* set up the TOC pointer */
-    LOAD_IMM32(%r2, .TOC.)
+    bcl	    20, 31, 1f
+1:  mflr    %r12
+    addis   %r2, %r12, .TOC.-1b@ha
+    addi    %r2, %r2, .TOC.-1b@l

     /* set up the initial stack */
-    LOAD_IMM32(%r1, cpu0_boot_stack)
+    LOAD_REG_ADDR(%r1, cpu0_boot_stack)
     li      %r11, 0
     stdu    %r11, -STACK_FRAME_OVERHEAD(%r1)

     /* clear .bss */
-    LOAD_IMM32(%r14, __bss_start)
-    LOAD_IMM32(%r15, __bss_end)
+    LOAD_REG_ADDR(%r14, __bss_start)
+    LOAD_REG_ADDR(%r15, __bss_end)
 1:
     std     %r11, 0(%r14)
     addi    %r14, %r14, 8
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index c628cc0e5c..2fa81d5a83 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -15,25 +15,12 @@ PHDRS
 #endif
 }

-/**
- * OpenFirmware's base load address is 0x400000 (XEN_VIRT_START).
- * By defining sections this way, we can keep our virtual address base a=
t 0x400000
- * while keeping the physical base at 0x0.
- *
- * Otherwise, OpenFirmware incorrectly loads .text at 0x400000 + 0x40000=
0 =3D 0x800000.
- * Taken from x86/xen.lds.S
- */
-#ifdef CONFIG_LD_IS_GNU
-# define DECL_SECTION(x) x : AT(ADDR(#x) - XEN_VIRT_START)
-#else
-# define DECL_SECTION(x) x : AT(ADDR(x) - XEN_VIRT_START)
-#endif
-
 SECTIONS
 {
     . =3D XEN_VIRT_START;
+    _start =3D .;

-    DECL_SECTION(.text) {
+    .text : {
         _stext =3D .;            /* Text section */
         *(.text.header)

@@ -52,7 +39,7 @@ SECTIONS
     } :text

     . =3D ALIGN(PAGE_SIZE);
-    DECL_SECTION(.rodata) {
+    .rodata : {
         _srodata =3D .;          /* Read-only data */
         *(.rodata)
         *(.rodata.*)
@@ -67,7 +54,7 @@ SECTIONS

     #if defined(BUILD_ID)
     . =3D ALIGN(4);
-    DECL_SECTION(.note.gnu.build-id) {
+    .note.gnu.build-id : {
         __note_gnu_build_id_start =3D .;
         *(.note.gnu.build-id)
         __note_gnu_build_id_end =3D .;
@@ -76,19 +63,19 @@ SECTIONS
     _erodata =3D .;                /* End of read-only data */

     . =3D ALIGN(PAGE_SIZE);
-    DECL_SECTION(.data.ro_after_init) {
+    .data.ro_after_init : {
         __ro_after_init_start =3D .;
         *(.data.ro_after_init)
         . =3D ALIGN(PAGE_SIZE);
         __ro_after_init_end =3D .;
-    } : text
+    } :text

-    DECL_SECTION(.data.read_mostly) {
+    .data.read_mostly : {
         *(.data.read_mostly)
     } :text

     . =3D ALIGN(PAGE_SIZE);
-    DECL_SECTION(.data) {                    /* Data */
+    .data : {                    /* Data */
         *(.data.page_aligned)
         . =3D ALIGN(8);
         __start_schedulers_array =3D .;
@@ -103,7 +90,7 @@ SECTIONS

     . =3D ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin =3D .;
-    DECL_SECTION(.init.text) {
+    .init.text : {
         _sinittext =3D .;
         *(.init.text)
         _einittext =3D .;
@@ -111,7 +98,7 @@ SECTIONS
     } :text

     . =3D ALIGN(PAGE_SIZE);
-    DECL_SECTION(.init.data) {
+    .init.data : {
         *(.init.rodata)
         *(.init.rodata.*)

@@ -140,18 +127,18 @@ SECTIONS
         __ctors_end =3D .;
     } :text

-    DECL_SECTION(.got) {
-        *(.got)
+    .got : {
+        *(.got .toc)
     } :text

-    DECL_SECTION(.got.plt) {
+    .got.plt : {
         *(.got.plt)
     } :text

     . =3D ALIGN(POINTER_ALIGN);
     __init_end =3D .;

-    DECL_SECTION(.bss) {                     /* BSS */
+    .bss : {                     /* BSS */
         __bss_start =3D .;
         *(.bss.stack_aligned)
         *(.bss.page_aligned)
@@ -167,10 +154,11 @@ SECTIONS
         . =3D ALIGN(POINTER_ALIGN);
         __bss_end =3D .;
     } :text
+
     _end =3D . ;

     /* Section for the device tree blob (if any). */
-    DECL_SECTION(.dtb) { *(.dtb) } :text
+    .dtb : { *(.dtb) } :text

     DWARF2_DEBUG_SECTIONS

--
2.30.2


