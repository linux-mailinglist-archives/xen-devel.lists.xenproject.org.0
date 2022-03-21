Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0074E2219
	for <lists+xen-devel@lfdr.de>; Mon, 21 Mar 2022 09:22:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292788.497191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDIH-0002GT-O9; Mon, 21 Mar 2022 08:21:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292788.497191; Mon, 21 Mar 2022 08:21:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWDIH-0002CQ-KX; Mon, 21 Mar 2022 08:21:37 +0000
Received: by outflank-mailman (input) for mailman id 292788;
 Mon, 21 Mar 2022 08:21:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0xq=UA=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1nWDIG-0002AF-Ja
 for xen-devel@lists.xenproject.org; Mon, 21 Mar 2022 08:21:36 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id eb7c7ba3-a8ef-11ec-8fbc-03012f2f19d4;
 Mon, 21 Mar 2022 09:21:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C467C106F;
 Mon, 21 Mar 2022 01:21:33 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.72.68])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ED7A63F73B;
 Mon, 21 Mar 2022 01:21:31 -0700 (PDT)
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
X-Inumbo-ID: eb7c7ba3-a8ef-11ec-8fbc-03012f2f19d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/3] xen: Introduce a header to store common linker scripts content
Date: Mon, 21 Mar 2022 09:21:12 +0100
Message-Id: <20220321082114.49953-2-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321082114.49953-1-michal.orzel@arm.com>
References: <20220321082114.49953-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both x86 and arm linker scripts share quite a lot of common content.
It is difficult to keep syncing them up, thus introduce a new header
in include/xen called xen_lds.h to store the internals mutual to all
the linker scripts.

Populate xen_lds.h with the first portion of the common sections.
Some of them are not yet added/completed in arm linker script but they
definitely should be. Please note that this patch does not aim to
perform the full sync up between the linker scripts. It creates a base
for further work.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
 xen/include/xen/xen_lds.h | 114 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 xen/include/xen/xen_lds.h

diff --git a/xen/include/xen/xen_lds.h b/xen/include/xen/xen_lds.h
new file mode 100644
index 0000000000..f1ca67ecfd
--- /dev/null
+++ b/xen/include/xen/xen_lds.h
@@ -0,0 +1,114 @@
+#ifndef __XEN_LDS_H__
+#define __XEN_LDS_H__
+
+/*
+ * Common macros to be used in architecture specific linker scripts.
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
+/*
+ * Stabs debug sections.
+ *
+ * LLVM ld also wants .symtab, .strtab, and .shstrtab placed. These look to
+ * be benign to GNU ld, so we can have them here unconditionally.
+ */
+#define STABS_DEBUG_SECTIONS                 \
+  .stab 0 : { *(.stab) }                     \
+  .stabstr 0 : { *(.stabstr) }               \
+  .stab.excl 0 : { *(.stab.excl) }           \
+  .stab.exclstr 0 : { *(.stab.exclstr) }     \
+  .stab.index 0 : { *(.stab.index) }         \
+  .stab.indexstr 0 : { *(.stab.indexstr) }   \
+  .comment 0 : { *(.comment) }               \
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
+#define CTORS_SECTION                           \
+       . = ALIGN(8);                            \
+       __ctors_start = .;                       \
+       *(SORT_BY_INIT_PRIORITY(.init_array.*))  \
+       *(SORT_BY_INIT_PRIORITY(.ctors.*))       \
+       *(.init_array)                           \
+       *(.ctors)                                \
+       __ctors_end = .;
+
+#define VPCI_SECTION             \
+       . = ALIGN(POINTER_ALIGN); \
+       __start_vpci_array = .;   \
+       *(SORT(.data.vpci.*))     \
+       __end_vpci_array = .;
+
+#define HYPFS_SECTION            \
+       . = ALIGN(8);             \
+       __paramhypfs_start = .;   \
+       *(.data.paramhypfs)       \
+       __paramhypfs_end = .;
+
+#define LOCK_PROFILE_SECTION     \
+       . = ALIGN(POINTER_ALIGN); \
+       __lock_profile_start = .; \
+       *(.lockprofile.data)      \
+       __lock_profile_end = .;
+
+#endif /* __XEN_LDS_H__ */
-- 
2.25.1


