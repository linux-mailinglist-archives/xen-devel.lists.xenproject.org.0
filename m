Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E424E2217
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 09:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292789.497207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDIL-0002i5-0T; Mon, 21 Mar 2022 08:21:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292789.497207; Mon, 21 Mar 2022 08:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDIK-0002g8-Sw; Mon, 21 Mar 2022 08:21:40 +0000
Received: by outflank-mailman (input) for mailman id 292789;
 Mon, 21 Mar 2022 08:21:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xq=UA=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nWDIJ-0002eF-AJ
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 08:21:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ec946ea9-a8ef-11ec-a405-831a346695d4;
 Mon, 21 Mar 2022 09:21:36 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9E917113E;
 Mon, 21 Mar 2022 01:21:35 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.72.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 36B1C3F73B;
 Mon, 21 Mar 2022 01:21:34 -0700 (PDT)
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
X-Inumbo-ID: ec946ea9-a8ef-11ec-a405-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/3] xen/x86: Make use of helpers defined in xen_lds.h
Date: Mon, 21 Mar 2022 09:21:13 +0100
Message-Id: <20220321082114.49953-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321082114.49953-1-michal.orzel@arm.com>
References: <20220321082114.49953-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Header file xen_lds.h defines common macros to be used in arch specific
linker scripts. Include this header and make use of its helpers.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/arch/x86/xen.lds.S | 86 ++++--------------------------------------
 1 file changed, 8 insertions(+), 78 deletions(-)

diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index d33e295320..e82a148e08 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -2,6 +2,7 @@
 /* Modified for i386/x86-64 Xen by Keir Fraser */
 
 #include <xen/cache.h>
+#include <xen/xen_lds.h>
 #include <asm/page.h>
 #undef ENTRY
 #undef ALIGN
@@ -12,13 +13,6 @@
 #undef __XEN_VIRT_START
 #define __XEN_VIRT_START __image_base__
 #define DECL_SECTION(x) x :
-/*
- * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
- * for PE output, in order to record that we'd prefer these sections to not
- * be loaded into memory.
- */
-#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
-#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
 
 ENTRY(efi_start)
 
@@ -26,8 +20,6 @@ ENTRY(efi_start)
 
 #define FORMAT "elf64-x86-64"
 #define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
-#define DECL_DEBUG(x, a) #x 0 : { *(x) }
-#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
 
 ENTRY(start_pa)
 
@@ -159,10 +151,7 @@ SECTIONS
        __note_gnu_build_id_end = .;
 #endif
 #ifdef CONFIG_HAS_VPCI
-       . = ALIGN(POINTER_ALIGN);
-       __start_vpci_array = .;
-       *(SORT(.data.vpci.*))
-       __end_vpci_array = .;
+       VPCI_SECTION
 #endif
   } PHDR(text)
 
@@ -278,19 +267,10 @@ SECTIONS
         __alt_instructions_end = .;
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
-       . = ALIGN(POINTER_ALIGN);
-       __lock_profile_start = .;
-       *(.lockprofile.data)
-       __lock_profile_end = .;
+       LOCK_PROFILE_SECTION
 #endif
 
-       . = ALIGN(8);
-       __ctors_start = .;
-       *(SORT_BY_INIT_PRIORITY(.init_array.*))
-       *(SORT_BY_INIT_PRIORITY(.ctors.*))
-       *(.init_array)
-       *(.ctors)
-       __ctors_end = .;
+       CTORS_SECTION
   } PHDR(text)
 
 #ifndef EFI
@@ -335,10 +315,7 @@ SECTIONS
        __end_schedulers_array = .;
 
 #ifdef CONFIG_HYPFS
-       . = ALIGN(8);
-       __paramhypfs_start = .;
-       *(.data.paramhypfs)
-       __paramhypfs_end = .;
+       HYPFS_SECTION
 #endif
   } PHDR(text)
 
@@ -395,24 +372,7 @@ SECTIONS
    * _end here, so if these sections get loaded they'll be discarded at runtime
    * anyway.
    */
-  DECL_DEBUG(.debug_abbrev, 1)
-  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1)
-  DECL_DEBUG(.debug_types, 1)
-  DECL_DEBUG(.debug_str, 1)
-  DECL_DEBUG2(.debug_line, .debug_line.*, 1)
-  DECL_DEBUG(.debug_line_str, 1)
-  DECL_DEBUG(.debug_names, 4)
-  DECL_DEBUG(.debug_frame, 4)
-  DECL_DEBUG(.debug_loc, 1)
-  DECL_DEBUG(.debug_loclists, 4)
-  DECL_DEBUG(.debug_macinfo, 1)
-  DECL_DEBUG(.debug_macro, 1)
-  DECL_DEBUG(.debug_ranges, 8)
-  DECL_DEBUG(.debug_rnglists, 4)
-  DECL_DEBUG(.debug_addr, 8)
-  DECL_DEBUG(.debug_aranges, 1)
-  DECL_DEBUG(.debug_pubnames, 1)
-  DECL_DEBUG(.debug_pubtypes, 1)
+  DWARF_DEBUG_SECTIONS
 
 #ifdef EFI
   /* Trick the linker into setting the image size to no less than 16Mb. */
@@ -427,41 +387,11 @@ SECTIONS
 #endif
 
   /* Sections to be discarded */
-  /DISCARD/ : {
-       *(.text.exit)
-       *(.exit.text)
-       *(.exit.data)
-       *(.exitcall.exit)
-       *(.discard)
-       *(.discard.*)
-       *(.eh_frame)
-       *(.dtors)
-       *(.dtors.*)
-       *(.fini_array)
-       *(.fini_array.*)
-#ifdef EFI
-       *(.comment)
-       *(.comment.*)
-       *(.note.*)
-#endif
-  }
+  DISCARD_SECTIONS
 
 #ifndef EFI
   /* Stabs debugging sections.  */
-  .stab 0 : { *(.stab) }
-  .stabstr 0 : { *(.stabstr) }
-  .stab.excl 0 : { *(.stab.excl) }
-  .stab.exclstr 0 : { *(.stab.exclstr) }
-  .stab.index 0 : { *(.stab.index) }
-  .stab.indexstr 0 : { *(.stab.indexstr) }
-  .comment 0 : { *(.comment) }
-  /*
-   * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
-   * be benign to GNU ld, so we can have them here unconditionally.
-   */
-  .symtab 0 : { *(.symtab) }
-  .strtab 0 : { *(.strtab) }
-  .shstrtab 0 : { *(.shstrtab) }
+  STABS_DEBUG_SECTIONS
 #endif
 }
 
-- 
2.25.1


