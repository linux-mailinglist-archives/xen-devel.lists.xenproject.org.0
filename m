Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837BD4FB45A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Apr 2022 09:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302694.516418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndo50-0006dt-Mv; Mon, 11 Apr 2022 07:03:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302694.516418; Mon, 11 Apr 2022 07:03:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ndo50-0006bH-JX; Mon, 11 Apr 2022 07:03:18 +0000
Received: by outflank-mailman (input) for mailman id 302694;
 Mon, 11 Apr 2022 07:03:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3hqm=UV=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ndo4y-00063x-JF
 for xen-devel@lists.xenproject.org; Mon, 11 Apr 2022 07:03:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 752c16ab-b965-11ec-8fbc-03012f2f19d4;
 Mon, 11 Apr 2022 09:03:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8D9921FB;
 Mon, 11 Apr 2022 00:03:14 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.8.177])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EC2A63F73B;
 Mon, 11 Apr 2022 00:03:11 -0700 (PDT)
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
X-Inumbo-ID: 752c16ab-b965-11ec-8fbc-03012f2f19d4
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
Subject: [PATCH v5 2/2] xen: Populate xen.lds.h and make use of its macros
Date: Mon, 11 Apr 2022 09:03:00 +0200
Message-Id: <20220411070300.77380-3-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220411070300.77380-1-michal.orzel@arm.com>
References: <20220411070300.77380-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Populate header file xen.lds.h with the first portion of macros storing
constructs common to x86 and arm linker scripts. Replace the original
constructs with these helpers.

No functional improvements to x86 linker script.

Making use of common macros improves arm linker script with:
- explicit list of debug sections that otherwise are seen as "orphans"
  by the linker. This will allow to fix issues after enabling linker
  option --orphan-handling one day,
- extended list of discarded section to include: .discard, destructors
  related sections, .fini_array which can reference .text.exit,
- sections not related to debugging that are placed by ld.lld. Even
  though we do not support linking with LLD on Arm, these sections do
  not cause problem to GNU ld,

As we are replacing hardcoded boundary specified as an argument to ALIGN
function with POINTER_ALIGN, this changes the alignment in HYPFS_PARAM
construct for arm32 from 8 to 4. It is fine as there are no 64bit values
used in struct param_hypfs.

Please note that this patch does not aim to perform the full sync up
between the linker scripts. It creates a base for further work.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v4:
-update commit msg with a note about changed alignment for HYPFS_PARAM on arm32
Changes since v3:
-use POINTER_ALIGN in debug sections when needed
-modify comment about ELF_DETAILS_SECTIONS
Changes since v2:
-refactor commit msg
-move constructs together with surrounding ifdefery
-list constructs other than *_SECTIONS in alphabetical order
-add comment about EFI vs EFI support
Changes since v1:
-merge x86 and arm changes into single patch
-do not propagate issues by generalizing CTORS
-extract sections not related to debugging into separate macro
-get rid of _SECTION suffix in favor of using more meaningful suffixes
---
 xen/arch/arm/xen.lds.S    |  44 +++----------
 xen/arch/x86/xen.lds.S    |  96 +++-------------------------
 xen/include/xen/xen.lds.h | 129 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 147 insertions(+), 122 deletions(-)

diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index d20e5e94e4..1e986e211f 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -69,12 +69,7 @@ SECTIONS
        *(.proc.info)
        __proc_info_end = .;
 
-#ifdef CONFIG_HAS_VPCI
-       . = ALIGN(POINTER_ALIGN);
-       __start_vpci_array = .;
-       *(SORT(.data.vpci.*))
-       __end_vpci_array = .;
-#endif
+       VPCI_ARRAY
   } :text
 
 #if defined(BUILD_ID)
@@ -110,12 +105,7 @@ SECTIONS
        *(.data.schedulers)
        __end_schedulers_array = .;
 
-#ifdef CONFIG_HYPFS
-       . = ALIGN(8);
-       __paramhypfs_start = .;
-       *(.data.paramhypfs)
-       __paramhypfs_end = .;
-#endif
+       HYPFS_PARAM
 
        *(.data .data.*)
        CONSTRUCTORS
@@ -179,12 +169,7 @@ SECTIONS
        *(.altinstructions)
        __alt_instructions_end = .;
 
-#ifdef CONFIG_DEBUG_LOCK_PROFILE
-       . = ALIGN(POINTER_ALIGN);
-       __lock_profile_start = .;
-       *(.lockprofile.data)
-       __lock_profile_end = .;
-#endif
+       LOCK_PROFILE_DATA
 
        *(.init.data)
        *(.init.data.rel)
@@ -223,22 +208,13 @@ SECTIONS
   /* Section for the device tree blob (if any). */
   .dtb : { *(.dtb) } :text
 
-  /* Sections to be discarded */
-  /DISCARD/ : {
-       *(.exit.text)
-       *(.exit.data)
-       *(.exitcall.exit)
-       *(.eh_frame)
-  }
-
-  /* Stabs debugging sections.  */
-  .stab 0 : { *(.stab) }
-  .stabstr 0 : { *(.stabstr) }
-  .stab.excl 0 : { *(.stab.excl) }
-  .stab.exclstr 0 : { *(.stab.exclstr) }
-  .stab.index 0 : { *(.stab.index) }
-  .stab.indexstr 0 : { *(.stab.indexstr) }
-  .comment 0 : { *(.comment) }
+  DWARF2_DEBUG_SECTIONS
+
+  DISCARD_SECTIONS
+
+  STABS_DEBUG_SECTIONS
+
+  ELF_DETAILS_SECTIONS
 }
 
 /*
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index 1fcd8ab7c5..68501c7186 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -14,13 +14,6 @@
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
 
@@ -28,8 +21,6 @@ ENTRY(efi_start)
 
 #define FORMAT "elf64-x86-64"
 #define DECL_SECTION(x) #x : AT(ADDR(#x) - __XEN_VIRT_START)
-#define DECL_DEBUG(x, a) #x 0 : { *(x) }
-#define DECL_DEBUG2(x, y, a) #x 0 : { *(x) *(y) }
 
 ENTRY(start_pa)
 
@@ -160,12 +151,7 @@ SECTIONS
        *(.note.gnu.build-id)
        __note_gnu_build_id_end = .;
 #endif
-#ifdef CONFIG_HAS_VPCI
-       . = ALIGN(POINTER_ALIGN);
-       __start_vpci_array = .;
-       *(SORT(.data.vpci.*))
-       __end_vpci_array = .;
-#endif
+       VPCI_ARRAY
   } PHDR(text)
 
 #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
@@ -279,12 +265,7 @@ SECTIONS
         *(.altinstructions)
         __alt_instructions_end = .;
 
-#ifdef CONFIG_DEBUG_LOCK_PROFILE
-       . = ALIGN(POINTER_ALIGN);
-       __lock_profile_start = .;
-       *(.lockprofile.data)
-       __lock_profile_end = .;
-#endif
+       LOCK_PROFILE_DATA
 
        . = ALIGN(8);
        __ctors_start = .;
@@ -336,12 +317,7 @@ SECTIONS
        *(.data.schedulers)
        __end_schedulers_array = .;
 
-#ifdef CONFIG_HYPFS
-       . = ALIGN(8);
-       __paramhypfs_start = .;
-       *(.data.paramhypfs)
-       __paramhypfs_end = .;
-#endif
+       HYPFS_PARAM
   } PHDR(text)
 
   DECL_SECTION(.data) {
@@ -388,33 +364,7 @@ SECTIONS
   efi = .;
 #endif
 
-  /*
-   * Explicitly list debug sections, first of all to avoid these sections being
-   * viewed as "orphan" by the linker.
-   *
-   * For the PE output this is further necessary so that they don't end up at
-   * VA 0, which is below image base and thus invalid.  Note that we're past
-   * _end here, so if these sections get loaded they'll be discarded at runtime
-   * anyway.
-   */
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
+  DWARF2_DEBUG_SECTIONS
 
 #ifdef EFI
   /* Trick the linker into setting the image size to no less than 16Mb. */
@@ -428,42 +378,12 @@ SECTIONS
   hv_hcall_page = ABSOLUTE(HV_HCALL_PAGE - XEN_VIRT_START + __XEN_VIRT_START);
 #endif
 
-  /* Sections to be discarded */
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
-  /* Stabs debugging sections.  */
-  .stab 0 : { *(.stab) }
-  .stabstr 0 : { *(.stabstr) }
-  .stab.excl 0 : { *(.stab.excl) }
-  .stab.exclstr 0 : { *(.stab.exclstr) }
-  .stab.index 0 : { *(.stab.index) }
-  .stab.indexstr 0 : { *(.stab.indexstr) }
-  .comment 0 : { *(.comment) *(.comment.*) }
-  /*
-   * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
-   * be benign to GNU ld, so we can have them here unconditionally.
-   */
-  .symtab 0 : { *(.symtab) }
-  .strtab 0 : { *(.strtab) }
-  .shstrtab 0 : { *(.shstrtab) }
+  STABS_DEBUG_SECTIONS
+
+  ELF_DETAILS_SECTIONS
 #endif
 }
 
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index dd292fa7dc..fc47bb1ccc 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -5,4 +5,133 @@
  * Common macros to be used in architecture specific linker scripts.
  */
 
+/*
+ * To avoid any confusion, please note that the EFI macro does not correspond
+ * to EFI support and is used when linking a native EFI (i.e. PE/COFF) binary,
+ * hence its usage in this header.
+ */
+
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
+/*
+ * DWARF2+ debug sections.
+ * Explicitly list debug sections, first of all to avoid these sections being
+ * viewed as "orphan" by the linker.
+ *
+ * For the PE output this is further necessary so that they don't end up at
+ * VA 0, which is below image base and thus invalid. Note that this macro is
+ * to be used after _end, so if these sections get loaded they'll be discarded
+ * at runtime anyway.
+ */
+#define DWARF2_DEBUG_SECTIONS                     \
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
+  DECL_DEBUG(.debug_ranges, POINTER_ALIGN)        \
+  DECL_DEBUG(.debug_rnglists, 4)                  \
+  DECL_DEBUG(.debug_addr, POINTER_ALIGN)          \
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
+ * ELF sections.
+ *
+ * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
+ * be benign to GNU ld, so we can have them here unconditionally.
+ */
+#define ELF_DETAILS_SECTIONS                 \
+  .comment 0 : { *(.comment) *(.comment.*) } \
+  .symtab 0 : { *(.symtab) }                 \
+  .strtab 0 : { *(.strtab) }                 \
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
+/* List of constructs other than *_SECTIONS in alphabetical order. */
+
+#ifdef CONFIG_HYPFS
+#define HYPFS_PARAM              \
+       . = ALIGN(POINTER_ALIGN); \
+       __paramhypfs_start = .;   \
+       *(.data.paramhypfs)       \
+       __paramhypfs_end = .;
+#else
+#define HYPFS_PARAM
+#endif
+
+#ifdef CONFIG_DEBUG_LOCK_PROFILE
+#define LOCK_PROFILE_DATA        \
+       . = ALIGN(POINTER_ALIGN); \
+       __lock_profile_start = .; \
+       *(.lockprofile.data)      \
+       __lock_profile_end = .;
+#else
+#define LOCK_PROFILE_DATA
+#endif
+
+#ifdef CONFIG_HAS_VPCI
+#define VPCI_ARRAY               \
+       . = ALIGN(POINTER_ALIGN); \
+       __start_vpci_array = .;   \
+       *(SORT(.data.vpci.*))     \
+       __end_vpci_array = .;
+#else
+#define VPCI_ARRAY
+#endif
+
 #endif /* __XEN_LDS_H__ */
-- 
2.25.1


