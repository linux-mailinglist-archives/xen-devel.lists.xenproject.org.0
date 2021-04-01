Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6D53512A2
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 11:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104236.199126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRttV-0004kC-Ev; Thu, 01 Apr 2021 09:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104236.199126; Thu, 01 Apr 2021 09:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRttV-0004jn-BH; Thu, 01 Apr 2021 09:45:41 +0000
Received: by outflank-mailman (input) for mailman id 104236;
 Thu, 01 Apr 2021 09:45:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=evtz=I6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lRttU-0004je-7R
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 09:45:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36a9c5e2-07e6-440f-9656-22fac216e603;
 Thu, 01 Apr 2021 09:45:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 888FEAEF5;
 Thu,  1 Apr 2021 09:45:38 +0000 (UTC)
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
X-Inumbo-ID: 36a9c5e2-07e6-440f-9656-22fac216e603
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617270338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKBqIqEP4Yay9/oLsxxVgXNUOGzjbOD2XiVhg/zRm+8=;
	b=OMjhq7Xrj0Yd6y7h4Txz18Q+XpBGF/zE1K7PXE6yQA8Dnb68sum0FQamoFRoYm+rhaf9Mp
	9DPcAVdioNm+lB6A6aoQEkGQZW/m8ihhqdi6JCJ7kxAz0FBFAxX2dHElsiH/qotTclg+lu
	yri3lBTmdwAEgOrFbmvbDdk17nOY8Dw=
Subject: [PATCH 4/8] x86/EFI: redo .reloc section bounds determination
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Message-ID: <b886eb2c-cabc-f195-4996-aae1fc3c61d9@suse.com>
Date: Thu, 1 Apr 2021 11:45:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

There's no need to link relocs-dummy.o into the ELF binary. The two
symbols needed can as well be provided by the linker script. Then our
mkreloc tool also doesn't need to put them in the generated assembler
source.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -133,7 +133,6 @@ XEN_NO_PE_FIXUPS := $(if $(XEN_BUILD_EFI
 endif
 
 ALL_OBJS := $(BASEDIR)/arch/x86/boot/built_in.o $(BASEDIR)/arch/x86/efi/built_in.o $(ALL_OBJS)
-EFI_OBJS-$(XEN_BUILD_EFI) := efi/relocs-dummy.o
 
 ifeq ($(CONFIG_LTO),y)
 # Gather all LTO objects together
@@ -141,13 +140,13 @@ prelink_lto.o: $(ALL_OBJS) $(ALL_LIBS)
 	$(LD_LTO) -r -o $@ $(filter-out %.a,$^) --start-group $(filter %.a,$^) --end-group
 
 # Link it with all the binary objects
-prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o $(EFI_OBJS-y) FORCE
+prelink.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
 	$(call if_changed,ld)
 
 prelink-efi.o: $(patsubst %/built_in.o,%/built_in_bin.o,$(ALL_OBJS)) prelink_lto.o FORCE
 	$(call if_changed,ld)
 else
-prelink.o: $(ALL_OBJS) $(ALL_LIBS) $(EFI_OBJS-y) FORCE
+prelink.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
 	$(call if_changed,ld)
 
 prelink-efi.o: $(ALL_OBJS) $(ALL_LIBS) FORCE
--- a/xen/arch/x86/efi/mkreloc.c
+++ b/xen/arch/x86/efi/mkreloc.c
@@ -320,9 +320,7 @@ int main(int argc, char *argv[])
     }
 
     puts("\t.section .reloc, \"a\", @progbits\n"
-         "\t.balign 4\n"
-         "\t.globl __base_relocs_start, __base_relocs_end\n"
-         "__base_relocs_start:");
+         "\t.balign 4");
 
     for ( i = 0; i < nsec; ++i )
     {
@@ -373,8 +371,6 @@ int main(int argc, char *argv[])
 
     diff_sections(NULL, NULL, NULL, 0, 0, 0, 0);
 
-    puts("__base_relocs_end:");
-
     close(in1);
     close(in2);
 
--- a/xen/arch/x86/efi/relocs-dummy.S
+++ b/xen/arch/x86/efi/relocs-dummy.S
@@ -1,10 +1,8 @@
 
 	.section .reloc, "a", @progbits
 	.balign 4
-GLOBAL(__base_relocs_start)
 	.long 0
 	.long 8
-GLOBAL(__base_relocs_end)
 
 	.globl VIRT_START, ALT_START
 	.equ VIRT_START, XEN_VIRT_START
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -170,18 +170,6 @@ SECTIONS
 #endif
 #endif
 
-/*
- * ELF builds are linked to a fixed virtual address, and in principle
- * shouldn't have a .reloc section.  However, due to the way EFI support is
- * currently implemented, retaining the .reloc section is necessary.
- */
-#if defined(XEN_BUILD_EFI) && !defined(EFI)
-  . = ALIGN(4);
-  DECL_SECTION(.reloc) {
-    *(.reloc)
-  } :text
-#endif
-
   _erodata = .;
 
   . = ALIGN(SECTION_ALIGN);
@@ -319,18 +307,27 @@ SECTIONS
   __2M_rwdata_end = .;
 
 #ifdef EFI
-  . = ALIGN(4);
-  DECL_SECTION(.reloc) {
+  .reloc ALIGN(4) : {
+    __base_relocs_start = .;
     *(.reloc)
+    __base_relocs_end = .;
   }
   /* Trick the linker into setting the image size to exactly 16Mb. */
   . = ALIGN(__section_alignment__);
   DECL_SECTION(.pad) {
     . = ALIGN(MB(16));
   }
-#endif
-
-#ifndef XEN_BUILD_EFI
+#elif defined(XEN_BUILD_EFI)
+  /*
+   * Due to the way EFI support is currently implemented, these two symbols
+   * need to be defined.  Their precise values shouldn't matter (the consuming
+   * function doesn't get called), but to be on the safe side both values would
+   * better match.  Of course the need to be reachable by the relocations
+   * referencing them.
+   */
+  PROVIDE(__base_relocs_start = .);
+  PROVIDE(__base_relocs_end = .);
+#else
   efi = .;
 #endif
 


