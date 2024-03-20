Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AC08816FB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 19:01:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.696084.1086698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn0Ew-0004wz-A4; Wed, 20 Mar 2024 18:00:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 696084.1086698; Wed, 20 Mar 2024 18:00:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rn0Ew-0004us-7R; Wed, 20 Mar 2024 18:00:38 +0000
Received: by outflank-mailman (input) for mailman id 696084;
 Wed, 20 Mar 2024 18:00:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Jnl=K2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rn0Ev-0004um-DL
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 18:00:37 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bee769d1-e6e3-11ee-a1ee-f123f15fe8a2;
 Wed, 20 Mar 2024 19:00:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 9221D82854B3;
 Wed, 20 Mar 2024 13:00:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 4wCm0tXK1P70; Wed, 20 Mar 2024 13:00:31 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id D634F82856C4;
 Wed, 20 Mar 2024 13:00:31 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id DHjujYy71IOm; Wed, 20 Mar 2024 13:00:31 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 7ECD582854B3;
 Wed, 20 Mar 2024 13:00:31 -0500 (CDT)
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
X-Inumbo-ID: bee769d1-e6e3-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com D634F82856C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710957631; bh=94W0o+FADbFYEfpLUI+OVM+ilIyFdZSfdMiHNwBLaZY=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=nF4TxXy1/+qW8VvQoesw9HogKLglhs5jlxE8jI/DlPllrWKwZw3mGJyjAY6hoGZ0c
	 LN9snEOrlTJBrYyFo2rW9JQHD8c8NYeRlgXhxWZc8I6TFnKGAGjxVHsimm+ChP8Uu+
	 HpxGbnuO5ONwFiqMdA47SOFDKb8X+qbmlw1vdycQ=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH] xen/ppc: Ensure ELF sections' physical load addresses start at 0x0
Date: Wed, 20 Mar 2024 13:00:21 -0500
Message-Id: <20240320180021.70373-1-sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Some boot mechanisms, including the new linux file_load kexec systemcall
used by system firmware v2.10 on RaptorCS systems will try to honor the
physical address field of the ELF LOAD section header, which will fail
when the address is based off of XEN_VIRT_START (0xc000000000000000).

To ensure that the physical address of the LOAD section header starts at
0x0, import the DECL_SECTION macro from x86's xen.lds.S.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/xen.lds.S | 30 ++++++++++++++++++------------
 1 file changed, 18 insertions(+), 12 deletions(-)

diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 05b6db2728..0ed285f0a7 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -4,6 +4,12 @@
 OUTPUT_ARCH(powerpc:common64)
 ENTRY(start)
 
+#ifdef CONFIG_LD_IS_GNU
+# define DECL_SECTION(x) x : AT(ADDR(#x) - XEN_VIRT_START)
+#else
+# define DECL_SECTION(x) x : AT(ADDR(x) - XEN_VIRT_START)
+#endif
+
 PHDRS
 {
     text PT_LOAD ;
@@ -17,7 +23,7 @@ SECTIONS
     . = XEN_VIRT_START;
     _start = .;
 
-    .text : {
+    DECL_SECTION(.text) {
         _stext = .;            /* Text section */
         *(.text.header)
 
@@ -40,7 +46,7 @@ SECTIONS
     } :text
 
     . = ALIGN(PAGE_SIZE);
-    .rodata : {
+    DECL_SECTION(.rodata) {
         _srodata = .;          /* Read-only data */
         /* Bug frames table */
         __start_bug_frames = .;
@@ -64,7 +70,7 @@ SECTIONS
 
     #if defined(BUILD_ID)
     . = ALIGN(4);
-    .note.gnu.build-id : {
+    DECL_SECTION(.note.gnu.build-id) {
         __note_gnu_build_id_start = .;
         *(.note.gnu.build-id)
         __note_gnu_build_id_end = .;
@@ -73,19 +79,19 @@ SECTIONS
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
@@ -100,7 +106,7 @@ SECTIONS
 
     . = ALIGN(PAGE_SIZE);             /* Init code and data */
     __init_begin = .;
-    .init.text : {
+    DECL_SECTION(.init.text) {
         _sinittext = .;
         *(.init.text)
         _einittext = .;
@@ -108,7 +114,7 @@ SECTIONS
     } :text
 
     . = ALIGN(PAGE_SIZE);
-    .init.data : {
+    DECL_SECTION(init.data) {
         *(.init.rodata)
         *(.init.rodata.*)
 
@@ -137,18 +143,18 @@ SECTIONS
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
@@ -168,7 +174,7 @@ SECTIONS
     _end = . ;
 
     /* Section for the device tree blob (if any). */
-    .dtb : { *(.dtb) } :text
+    DECL_SECTION(.dtb) { *(.dtb) } :text
 
     DWARF2_DEBUG_SECTIONS
 
-- 
2.30.2


