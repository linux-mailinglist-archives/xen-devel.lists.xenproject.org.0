Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD4E8817B5
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 20:11:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696127.1086778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn1LS-0005JP-Tj; Wed, 20 Mar 2024 19:11:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696127.1086778; Wed, 20 Mar 2024 19:11:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn1LS-0005Hs-R0; Wed, 20 Mar 2024 19:11:26 +0000
Received: by outflank-mailman (input) for mailman id 696127;
 Wed, 20 Mar 2024 19:11:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Jnl=K2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rn1LS-0005Hm-0D
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 19:11:26 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a438cc85-e6ed-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 20:11:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id A959D8286A6D;
 Wed, 20 Mar 2024 14:11:22 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id IJgJPPJVF8gv; Wed, 20 Mar 2024 14:11:21 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id B9DA38286C88;
 Wed, 20 Mar 2024 14:11:21 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FZjd3Ij6uOd1; Wed, 20 Mar 2024 14:11:21 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 54E918286A6D;
 Wed, 20 Mar 2024 14:11:21 -0500 (CDT)
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
X-Inumbo-ID: a438cc85-e6ed-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com B9DA38286C88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710961881; bh=qjDVerNvsyKF24rTniU+fXX2Dku1Mqf9+Trxaksp5R8=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=ad+nnNfgnkhRdJiXGiSIDDTGEHFWwngbo8toN2vDdnzzFZutrrsETST/PKWuycM+g
	 snAuwvvhYj/eMQwOfBGcKYiuxUi/9mtJxmr446AjggrNu3oPULw15jw7Z0kURqdVx8
	 bjCENSEFHDx1nCTXTd8GLEWX36bCCFda24cKRMAs=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2] xen/ppc: Ensure ELF sections' physical load addresses start at 0x0
Date: Wed, 20 Mar 2024 14:11:05 -0500
Message-Id: <20240320191105.84369-1-sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Some boot mechanisms, including the new linux file_load kexec systemcall
used by system firmware v2.10 on RaptorCS systems will try to honor the
physical address field of the ELF LOAD section header, which will fail
when the address is based off of XEN_VIRT_START (0xc000000000000000).

To ensure that the physical address of the LOAD section header starts at
0x0, move x86's DECL_SECTION macro to xen.lds.h and use it to declare
all sections.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
Changes in v2:
  - Move DECL_SECTION to xen.lds.h

 xen/arch/ppc/xen.lds.S    | 27 +++++++++++++++------------
 xen/arch/x86/xen.lds.S    |  6 +-----
 xen/include/xen/xen.lds.h | 10 ++++++++++
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 05b6db2728..3cead1f980 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -4,6 +4,9 @@
 OUTPUT_ARCH(powerpc:common64)
 ENTRY(start)

+/* Used by the DECL_SECTION() macro to calculate physical load addresses */
+#define __XEN_VIRT_START XEN_VIRT_START
+
 PHDRS
 {
     text PT_LOAD ;
@@ -17,7 +20,7 @@ SECTIONS
     . = XEN_VIRT_START;
     _start = .;

-    .text : {
+    DECL_SECTION(.text) {
         _stext = .;            /* Text section */
         *(.text.header)

@@ -40,7 +43,7 @@ SECTIONS
     } :text

     . = ALIGN(PAGE_SIZE);
-    .rodata : {
+    DECL_SECTION(.rodata) {
         _srodata = .;          /* Read-only data */
         /* Bug frames table */
         __start_bug_frames = .;
@@ -64,7 +67,7 @@ SECTIONS

     #if defined(BUILD_ID)
     . = ALIGN(4);
-    .note.gnu.build-id : {
+    DECL_SECTION(.note.gnu.build-id) {
         __note_gnu_build_id_start = .;
         *(.note.gnu.build-id)
         __note_gnu_build_id_end = .;
@@ -73,19 +76,19 @@ SECTIONS
     _erodata = .;                /* End of read-only data */

     . = ALIGN(PAGE_SIZE);
-    .data.ro_after_init : {
+    DECL_SECTION(.data.ro_after_init) {
         __ro_after_init_start = .;
         *(.data.ro_after_init)
         . = ALIGN(PAGE_SIZE);
         __ro_after_init_end = .;
     } :text

-    .data.read_mostly : {
+    DECL_SECTION(.data.read_mostly) {
         *(.data.read_mostly)
     } :text

     . = ALIGN(PAGE_SIZE);
-    .data : {                    /* Data */
+    DECL_SECTION(.data) {                    /* Data */
         *(.data.page_aligned)
         . = ALIGN(8);
         __start_schedulers_array = .;
@@ -100,7 +103,7 @@ SECTIONS

     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
-    .init.text : {
+    DECL_SECTION(.init.text) {
         _sinittext = .;
         *(.init.text)
         _einittext = .;
@@ -108,7 +111,7 @@ SECTIONS
     } :text

     . = ALIGN(PAGE_SIZE);
-    .init.data : {
+    DECL_SECTION(init.data) {
         *(.init.rodata)
         *(.init.rodata.*)

@@ -137,18 +140,18 @@ SECTIONS
         __ctors_end = .;
     } :text

-    .got : {
+    DECL_SECTION(.got) {
         *(.got .toc)
     } :text

-    .got.plt : {
+    DECL_SECTION(.got.plt) {
         *(.got.plt)
     } :text

     . = ALIGN(POINTER_ALIGN);
     __init_end = .;

-    .bss : {                     /* BSS */
+    DECL_SECTION(.bss) {                     /* BSS */
         __bss_start = .;
         *(.bss.stack_aligned)
         *(.bss.page_aligned)
@@ -168,7 +171,7 @@ SECTIONS
     _end = . ;

     /* Section for the device tree blob (if any). */
-    .dtb : { *(.dtb) } :text
+    DECL_SECTION(.dtb) { *(.dtb) } :text

     DWARF2_DEBUG_SECTIONS

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 8930e14fc4..1ef6645128 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -12,6 +12,7 @@

 #define FORMAT "pei-x86-64"
 #undef __XEN_VIRT_START
+#undef DECL_SECTION
 #define __XEN_VIRT_START __image_base__
 #define DECL_SECTION(x) x :

@@ -20,11 +21,6 @@ ENTRY(efi_start)
 #else /* !EFI */

 #define FORMAT "elf64-x86-64"
-#ifdef CONFIG_LD_IS_GNU
-# define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
-#else
-# define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
-#endif

 ENTRY(start_pa)

diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 06b7110837..be90f5ca0f 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -5,6 +5,16 @@
  * Common macros to be used in architecture specific linker scripts.
  */

+/*
+ * Declare a section whose load address is based at PA 0 rather than
+ * Xen's virtual base address.
+ */
+#ifdef CONFIG_LD_IS_GNU
+# define DECL_SECTION(x) x : AT(ADDR(#x) - __XEN_VIRT_START)
+#else
+# define DECL_SECTION(x) x : AT(ADDR(x) - __XEN_VIRT_START)
+#endif
+
 /*
  * To avoid any confusion, please note that the EFI macro does not correspond
  * to EFI support and is used when linking a native EFI (i.e. PE/COFF) binary,
--
2.30.2


