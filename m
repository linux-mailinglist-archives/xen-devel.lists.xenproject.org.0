Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBEE4E3A0D
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 09:03:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293308.498237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWZTn-00015o-6n; Tue, 22 Mar 2022 08:02:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293308.498237; Tue, 22 Mar 2022 08:02:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWZTn-00013w-3R; Tue, 22 Mar 2022 08:02:59 +0000
Received: by outflank-mailman (input) for mailman id 293308;
 Tue, 22 Mar 2022 08:02:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GKWw=UB=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nWZTl-0000XI-E3
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 08:02:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 7b245567-a9b6-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 09:02:55 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 32248106F;
 Tue, 22 Mar 2022 01:02:55 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.5.122])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A00E03F73D;
 Tue, 22 Mar 2022 01:02:52 -0700 (PDT)
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
X-Inumbo-ID: 7b245567-a9b6-11ec-8fbc-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/2] xen: Populate xen.lds.h and make use of its macros
Date: Tue, 22 Mar 2022 09:02:33 +0100
Message-Id: <20220322080233.53134-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322080233.53134-1-michal.orzel@arm.com>
References: <20220322080233.53134-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Populate header file xen.lds.h with the first portion of macros storing
constructs common to x86 and arm linker scripts. Replace the original
constructs with these helpers.

No functional improvements to x86 linker script.

Making use of common macros improves arm linker script with:
-explicit list of debug sections that otherwise are seen as "orphans"
by the linker. This will allow to fix issues after enabling linker
option --orphan-handling one day
-extended list of discarded section to include: .discard, desctructors
related sections, .fini_array which can reference .text.exit
-sections not related to debugging that are placed by ld.lld.
Even though Xen on arm compilation with LLVM support is not ready yet,
these sections do not cause problem to GNU ld.

Please note that this patch does not aim to perform the full sync up
between the linker scripts. It creates a base for further work.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Changes since v1:
-merge x86 and arm changes into single patch
-do not propagate issues by generalizing CTORS
-extract sections not related to debugging into separate macro
-get rid of _SECTION suffix in favor of using more meaningful suffixes
---
 xen/arch/arm/xen.lds.S    |  37 +++++---------
 xen/arch/x86/xen.lds.S    |  78 +++--------------------------
 xen/include/xen/xen.lds.h | 100 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 119 insertions(+), 96 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index c666fc3e69..e8ce7ad5f1 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -69,10 +69,7 @@ SECTIONS
        __proc_info_end = .;
 
 #ifdef CONFIG_HAS_VPCI
-       . = ALIGN(POINTER_ALIGN);
-       __start_vpci_array = .;
-       *(SORT(.data.vpci.*))
-       __end_vpci_array = .;
+       VPCI_ARRAY
 #endif
   } :text
 
@@ -110,10 +107,7 @@ SECTIONS
        __end_schedulers_array = .;
 
 #ifdef CONFIG_HYPFS
-       . = ALIGN(8);
-       __paramhypfs_start = .;
-       *(.data.paramhypfs)
-       __paramhypfs_end = .;
+       HYPFS_PARAM
 #endif
 
        *(.data .data.*)
@@ -179,10 +173,7 @@ SECTIONS
        __alt_instructions_end = .;
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
-       . = ALIGN(POINTER_ALIGN);
-       __lock_profile_start = .;
-       *(.lockprofile.data)
-       __lock_profile_end = .;
+       LOCK_PROFILE_DATA
 #endif
 
        *(.init.data)
@@ -222,22 +213,18 @@ SECTIONS
   /* Section for the device tree blob (if any). */
   .dtb : { *(.dtb) } :text
 
+  /*
+   * Explicitly list debug sections, to avoid these sections being viewed as
+   * "orphan" by the linker.
+   */
+  DWARF_DEBUG_SECTIONS
+
   /* Sections to be discarded */
-  /DISCARD/ : {
-       *(.exit.text)
-       *(.exit.data)
-       *(.exitcall.exit)
-       *(.eh_frame)
-  }
+  DISCARD_SECTIONS
 
   /* Stabs debugging sections.  */
-  .stab 0 : { *(.stab) }
-  .stabstr 0 : { *(.stabstr) }
-  .stab.excl 0 : { *(.stab.excl) }
-  .stab.exclstr 0 : { *(.stab.exclstr) }
-  .stab.index 0 : { *(.stab.index) }
-  .stab.indexstr 0 : { *(.stab.indexstr) }
-  .comment 0 : { *(.comment) }
+  STABS_DEBUG_SECTIONS
+  ELF_DETAILS_SECTIONS
 }
 
 /*
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 4e3a9a2789..65efbf9d0c 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -13,13 +13,6 @@
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
 
@@ -27,8 +20,6 @@ ENTRY(efi_start)
 
 #define FORMAT "elf64-x86-64"
 #define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
-#define DECL_DEBUG(x, a) #x 0 : { *(x) }
-#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
 
 ENTRY(start_pa)
 
@@ -160,10 +151,7 @@ SECTIONS
        __note_gnu_build_id_end = .;
 #endif
 #ifdef CONFIG_HAS_VPCI
-       . = ALIGN(POINTER_ALIGN);
-       __start_vpci_array = .;
-       *(SORT(.data.vpci.*))
-       __end_vpci_array = .;
+       VPCI_ARRAY
 #endif
   } PHDR(text)
 
@@ -279,10 +267,7 @@ SECTIONS
         __alt_instructions_end = .;
 
 #ifdef CONFIG_DEBUG_LOCK_PROFILE
-       . = ALIGN(POINTER_ALIGN);
-       __lock_profile_start = .;
-       *(.lockprofile.data)
-       __lock_profile_end = .;
+       LOCK_PROFILE_DATA
 #endif
 
        . = ALIGN(8);
@@ -336,10 +321,7 @@ SECTIONS
        __end_schedulers_array = .;
 
 #ifdef CONFIG_HYPFS
-       . = ALIGN(8);
-       __paramhypfs_start = .;
-       *(.data.paramhypfs)
-       __paramhypfs_end = .;
+       HYPFS_PARAM
 #endif
   } PHDR(text)
 
@@ -396,24 +378,7 @@ SECTIONS
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
@@ -428,41 +393,12 @@ SECTIONS
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
+  ELF_DETAILS_SECTIONS
 #endif
 }
 
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index dd292fa7dc..ad1d199021 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -5,4 +5,104 @@
  * Common macros to be used in architecture specific linker scripts.
  */
 
+/* Macros to declare debug sections. */
+#ifdef EFI
+/*
+ * Use the NOLOAD directive, despite currently ignored by (at least) GNU ld
+ * for PE output, in order to record that we'd prefer these sections to not
+ * be loaded into memory.
+ */
+#define DECL_DEBUG(x, a) #x ALIGN(a) (NOLOAD) : { *(x) }
+#define DECL_DEBUG2(x, y, a) #x ALIGN(a) (NOLOAD) : { *(x) *(y) }
+#else
+#define DECL_DEBUG(x, a) #x 0 : { *(x) }
+#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
+#endif
+
+/* DWARF debug sections. */
+#define DWARF_DEBUG_SECTIONS                      \
+  DECL_DEBUG(.debug_abbrev, 1)                    \
+  DECL_DEBUG2(.debug_info, .gnu.linkonce.wi.*, 1) \
+  DECL_DEBUG(.debug_types, 1)                     \
+  DECL_DEBUG(.debug_str, 1)                       \
+  DECL_DEBUG2(.debug_line, .debug_line.*, 1)      \
+  DECL_DEBUG(.debug_line_str, 1)                  \
+  DECL_DEBUG(.debug_names, 4)                     \
+  DECL_DEBUG(.debug_frame, 4)                     \
+  DECL_DEBUG(.debug_loc, 1)                       \
+  DECL_DEBUG(.debug_loclists, 4)                  \
+  DECL_DEBUG(.debug_macinfo, 1)                   \
+  DECL_DEBUG(.debug_macro, 1)                     \
+  DECL_DEBUG(.debug_ranges, 8)                    \
+  DECL_DEBUG(.debug_rnglists, 4)                  \
+  DECL_DEBUG(.debug_addr, 8)                      \
+  DECL_DEBUG(.debug_aranges, 1)                   \
+  DECL_DEBUG(.debug_pubnames, 1)                  \
+  DECL_DEBUG(.debug_pubtypes, 1)
+
+/* Stabs debug sections. */
+#define STABS_DEBUG_SECTIONS                 \
+  .stab 0 : { *(.stab) }                     \
+  .stabstr 0 : { *(.stabstr) }               \
+  .stab.excl 0 : { *(.stab.excl) }           \
+  .stab.exclstr 0 : { *(.stab.exclstr) }     \
+  .stab.index 0 : { *(.stab.index) }         \
+  .stab.indexstr 0 : { *(.stab.indexstr) }
+
+/*
+ * Required sections not related to debugging.
+ *
+ * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
+ * be benign to GNU ld, so we can have them here unconditionally.
+ */
+#define ELF_DETAILS_SECTIONS     \
+  .comment 0 : { *(.comment) }   \
+  .symtab 0 : { *(.symtab) }     \
+  .strtab 0 : { *(.strtab) }     \
+  .shstrtab 0 : { *(.shstrtab) }
+
+#ifdef EFI
+#define DISCARD_EFI_SECTIONS \
+       *(.comment)   \
+       *(.comment.*) \
+       *(.note.*)
+#else
+#define DISCARD_EFI_SECTIONS
+#endif
+
+/* Sections to be discarded. */
+#define DISCARD_SECTIONS     \
+  /DISCARD/ : {              \
+       *(.text.exit)         \
+       *(.exit.text)         \
+       *(.exit.data)         \
+       *(.exitcall.exit)     \
+       *(.discard)           \
+       *(.discard.*)         \
+       *(.eh_frame)          \
+       *(.dtors)             \
+       *(.dtors.*)           \
+       *(.fini_array)        \
+       *(.fini_array.*)      \
+       DISCARD_EFI_SECTIONS  \
+  }
+
+#define VPCI_ARRAY               \
+       . = ALIGN(POINTER_ALIGN); \
+       __start_vpci_array = .;   \
+       *(SORT(.data.vpci.*))     \
+       __end_vpci_array = .;
+
+#define HYPFS_PARAM              \
+       . = ALIGN(8);             \
+       __paramhypfs_start = .;   \
+       *(.data.paramhypfs)       \
+       __paramhypfs_end = .;
+
+#define LOCK_PROFILE_DATA        \
+       . = ALIGN(POINTER_ALIGN); \
+       __lock_profile_start = .; \
+       *(.lockprofile.data)      \
+       __lock_profile_end = .;
+
 #endif /* __XEN_LDS_H__ */
-- 
2.25.1


