Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF909372B12
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 15:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122396.230874 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldv9w-0003uN-0E; Tue, 04 May 2021 13:32:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122396.230874; Tue, 04 May 2021 13:32:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldv9v-0003tl-Sz; Tue, 04 May 2021 13:32:19 +0000
Received: by outflank-mailman (input) for mailman id 122396;
 Tue, 04 May 2021 13:32:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8884=J7=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1ldv9u-0003nw-9T
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 13:32:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 76b41ce4-87e6-4da3-8842-677e06b878b5;
 Tue, 04 May 2021 13:31:59 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FF7B139F;
 Tue,  4 May 2021 06:31:59 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9CA3F73B;
 Tue,  4 May 2021 06:31:57 -0700 (PDT)
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
X-Inumbo-ID: 76b41ce4-87e6-4da3-8842-677e06b878b5
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	wei.chen@arm.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 3/3] docs/doxygen: doxygen documentation for grant_table.h
Date: Tue,  4 May 2021 14:31:45 +0100
Message-Id: <20210504133145.767-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504133145.767-1-luca.fancellu@arm.com>
References: <20210504133145.767-1-luca.fancellu@arm.com>

Modification to include/public/grant_table.h:

1) Add doxygen tags to:
 - Create Grant tables section
 - include variables in the generated documentation
 - Used @keepindent/@endkeepindent to enclose comment
   section that are indented using spaces, to keep
   the indentation.
2) Add .rst file for grant table for Arm64

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v5 changes:
- Move GNTCOPY_* define next to the flags field
v4 changes:
- Used @keepindent/@endkeepindent doxygen commands
  to keep text with spaces indentation.
- drop changes to grant_entry_v1 comment, it will
  be changed and included in the docs in a future patch
- Move docs .rst to "common" folder
v3 changes:
- removed tags to skip anonymous union/struct
- moved back comment pointed out by Jan
- moved down defines related to struct gnttab_copy
  as pointed out by Jan
v2 changes:
- Revert back to anonymous union/struct
- add doxygen tags to skip anonymous union/struct
---
 docs/hypercall-interfaces/arm64.rst           |  1 +
 .../common/grant_tables.rst                   |  8 +++
 docs/xen-doxygen/doxy_input.list              |  1 +
 xen/include/public/grant_table.h              | 66 ++++++++++++-------
 4 files changed, 52 insertions(+), 24 deletions(-)
 create mode 100644 docs/hypercall-interfaces/common/grant_tables.rst

diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interfaces/arm64.rst
index 5e701a2adc..cb4c0d13de 100644
--- a/docs/hypercall-interfaces/arm64.rst
+++ b/docs/hypercall-interfaces/arm64.rst
@@ -8,6 +8,7 @@ Starting points
 .. toctree::
    :maxdepth: 2
 
+   common/grant_tables
 
 
 Functions
diff --git a/docs/hypercall-interfaces/common/grant_tables.rst b/docs/hypercall-interfaces/common/grant_tables.rst
new file mode 100644
index 0000000000..8955ec5812
--- /dev/null
+++ b/docs/hypercall-interfaces/common/grant_tables.rst
@@ -0,0 +1,8 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Grant Tables
+============
+
+.. doxygengroup:: grant_table
+   :project: Xen
+   :members:
diff --git a/docs/xen-doxygen/doxy_input.list b/docs/xen-doxygen/doxy_input.list
index e69de29bb2..233d692fa7 100644
--- a/docs/xen-doxygen/doxy_input.list
+++ b/docs/xen-doxygen/doxy_input.list
@@ -0,0 +1 @@
+xen/include/public/grant_table.h
diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
index 84b1d26b36..e1fb91dfc6 100644
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -25,15 +25,19 @@
  * Copyright (c) 2004, K A Fraser
  */
 
+/**
+ * @file
+ * @brief Interface for granting foreign access to page frames, and receiving
+ * page-ownership transfers.
+ */
+
 #ifndef __XEN_PUBLIC_GRANT_TABLE_H__
 #define __XEN_PUBLIC_GRANT_TABLE_H__
 
 #include "xen.h"
 
-/*
- * `incontents 150 gnttab Grant Tables
- *
- * Xen's grant tables provide a generic mechanism to memory sharing
+/**
+ * @brief Xen's grant tables provide a generic mechanism to memory sharing
  * between domains. This shared memory interface underpins the split
  * device drivers for block and network IO.
  *
@@ -51,13 +55,10 @@
  * know the real machine address of a page it is sharing. This makes
  * it possible to share memory correctly with domains running in
  * fully virtualised memory.
- */
-
-/***********************************
+ *
  * GRANT TABLE REPRESENTATION
- */
-
-/* Some rough guidelines on accessing and updating grant-table entries
+ *
+ * Some rough guidelines on accessing and updating grant-table entries
  * in a concurrency-safe manner. For more information, Linux contains a
  * reference implementation for guest OSes (drivers/xen/grant_table.c, see
  * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/xen/grant-table.c;hb=HEAD
@@ -66,6 +67,7 @@
  *     compiler barrier will still be required.
  *
  * Introducing a valid entry into the grant table:
+ * @keepindent
  *  1. Write ent->domid.
  *  2. Write ent->frame:
  *      GTF_permit_access:   Frame to which access is permitted.
@@ -73,20 +75,25 @@
  *                           frame, or zero if none.
  *  3. Write memory barrier (WMB).
  *  4. Write ent->flags, inc. valid type.
+ * @endkeepindent
  *
  * Invalidating an unused GTF_permit_access entry:
+ * @keepindent
  *  1. flags = ent->flags.
  *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
  *  NB. No need for WMB as reuse of entry is control-dependent on success of
  *      step 3, and all architectures guarantee ordering of ctrl-dep writes.
+ * @endkeepindent
  *
  * Invalidating an in-use GTF_permit_access entry:
+ *
  *  This cannot be done directly. Request assistance from the domain controller
  *  which can set a timeout on the use of a grant entry and take necessary
  *  action. (NB. This is not yet implemented!).
  *
  * Invalidating an unused GTF_accept_transfer entry:
+ * @keepindent
  *  1. flags = ent->flags.
  *  2. Observe that !(flags & GTF_transfer_committed). [*]
  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
@@ -97,18 +104,24 @@
  *      transferred frame is written. It is safe for the guest to spin waiting
  *      for this to occur (detect by observing GTF_transfer_completed in
  *      ent->flags).
+ * @endkeepindent
  *
  * Invalidating a committed GTF_accept_transfer entry:
  *  1. Wait for (ent->flags & GTF_transfer_completed).
  *
  * Changing a GTF_permit_access from writable to read-only:
+ *
  *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
  *
  * Changing a GTF_permit_access from read-only to writable:
+ *
  *  Use SMP-safe bit-setting instruction.
+ *
+ * @addtogroup grant_table Grant Tables
+ * @{
  */
 
-/*
+/**
  * Reference to a grant entry in a specified domain's grant table.
  */
 typedef uint32_t grant_ref_t;
@@ -129,15 +142,17 @@ typedef uint32_t grant_ref_t;
 #define grant_entry_v1_t grant_entry_t
 #endif
 struct grant_entry_v1 {
-    /* GTF_xxx: various type and flag information.  [XEN,GST] */
+    /** GTF_xxx: various type and flag information.  [XEN,GST] */
     uint16_t flags;
-    /* The domain being granted foreign privileges. [GST] */
+    /** The domain being granted foreign privileges. [GST] */
     domid_t  domid;
-    /*
+    /**
+     * @keepindent
      * GTF_permit_access: GFN that @domid is allowed to map and access. [GST]
      * GTF_accept_transfer: GFN that @domid is allowed to transfer into. [GST]
      * GTF_transfer_completed: MFN whose ownership transferred by @domid
      *                         (non-translated guests only). [XEN]
+     * @endkeepindent
      */
     uint32_t frame;
 };
@@ -228,7 +243,7 @@ struct grant_entry_header {
 };
 typedef struct grant_entry_header grant_entry_header_t;
 
-/*
+/**
  * Version 2 of the grant entry structure.
  */
 union grant_entry_v2 {
@@ -433,7 +448,7 @@ typedef struct gnttab_transfer gnttab_transfer_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
 
 
-/*
+/**
  * GNTTABOP_copy: Hypervisor based copy
  * source and destinations can be eithers MFNs or, for foreign domains,
  * grant references. the foreign domain has to grant read/write access
@@ -451,11 +466,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
  * bytes to be copied.
  */
 
-#define _GNTCOPY_source_gref      (0)
-#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
-#define _GNTCOPY_dest_gref        (1)
-#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
-
 struct gnttab_copy {
     /* IN parameters. */
     struct gnttab_copy_ptr {
@@ -468,6 +478,10 @@ struct gnttab_copy {
     } source, dest;
     uint16_t      len;
     uint16_t      flags;          /* GNTCOPY_* */
+#define _GNTCOPY_source_gref      (0)
+#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
+#define _GNTCOPY_dest_gref        (1)
+#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
     /* OUT parameters. */
     int16_t       status;
 };
@@ -579,7 +593,7 @@ struct gnttab_swap_grant_ref {
 typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
 
-/*
+/**
  * Issue one or more cache maintenance operations on a portion of a
  * page granted to the calling domain by a foreign domain.
  */
@@ -588,8 +602,8 @@ struct gnttab_cache_flush {
         uint64_t dev_bus_addr;
         grant_ref_t ref;
     } a;
-    uint16_t offset; /* offset from start of grant */
-    uint16_t length; /* size within the grant */
+    uint16_t offset; /**< offset from start of grant */
+    uint16_t length; /**< size within the grant */
 #define GNTTAB_CACHE_CLEAN          (1u<<0)
 #define GNTTAB_CACHE_INVAL          (1u<<1)
 #define GNTTAB_CACHE_SOURCE_GREF    (1u<<31)
@@ -673,6 +687,10 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
     "operation not done; try again"             \
 }
 
+/**
+ * @}
+*/
+
 #endif /* __XEN_PUBLIC_GRANT_TABLE_H__ */
 
 /*
-- 
2.17.1


