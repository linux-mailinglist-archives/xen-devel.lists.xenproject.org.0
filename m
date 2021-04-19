Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989B5363E47
	for <lists+xen-devel@lfdr.de>; Mon, 19 Apr 2021 11:13:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112732.215025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYPxi-0003Ll-VV; Mon, 19 Apr 2021 09:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112732.215025; Mon, 19 Apr 2021 09:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYPxi-0003LG-RR; Mon, 19 Apr 2021 09:12:58 +0000
Received: by outflank-mailman (input) for mailman id 112732;
 Mon, 19 Apr 2021 09:12:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=euet=JQ=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lYPxh-0003D5-Dk
 for xen-devel@lists.xenproject.org; Mon, 19 Apr 2021 09:12:57 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id d8286f12-9daf-4062-8e85-fe3e40dcc95d;
 Mon, 19 Apr 2021 09:12:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4467DED1;
 Mon, 19 Apr 2021 02:12:48 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E6F2A3F85F;
 Mon, 19 Apr 2021 02:12:46 -0700 (PDT)
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
X-Inumbo-ID: d8286f12-9daf-4062-8e85-fe3e40dcc95d
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
Subject: [PATCH v2 3/3] docs/doxygen: doxygen documentation for grant_table.h
Date: Mon, 19 Apr 2021 10:12:31 +0100
Message-Id: <20210419091231.55684-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419091231.55684-1-luca.fancellu@arm.com>
References: <20210419091231.55684-1-luca.fancellu@arm.com>

Modification to include/public/grant_table.h:

1) Add doxygen tags to:
 - Create Grant tables section
 - include variables in the generated documentation
2) Add .rst file for grant table for Arm64

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
v2 changes:
- Revert back to anonymous union/struct
- add doxygen tags to skip anonymous union/struct
---
 docs/hypercall-interfaces/arm64.rst           |  1 +
 .../arm64/grant_tables.rst                    |  8 ++
 docs/xen-doxygen/doxy_input.list              |  1 +
 xen/include/public/grant_table.h              | 97 ++++++++++++-------
 4 files changed, 73 insertions(+), 34 deletions(-)
 create mode 100644 docs/hypercall-interfaces/arm64/grant_tables.rst

diff --git a/docs/hypercall-interfaces/arm64.rst b/docs/hypercall-interfaces/arm64.rst
index 5e701a2adc..c30a7142b1 100644
--- a/docs/hypercall-interfaces/arm64.rst
+++ b/docs/hypercall-interfaces/arm64.rst
@@ -8,6 +8,7 @@ Starting points
 .. toctree::
    :maxdepth: 2
 
+   arm64/grant_tables
 
 
 Functions
diff --git a/docs/hypercall-interfaces/arm64/grant_tables.rst b/docs/hypercall-interfaces/arm64/grant_tables.rst
new file mode 100644
index 0000000000..8955ec5812
--- /dev/null
+++ b/docs/hypercall-interfaces/arm64/grant_tables.rst
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
index 84b1d26b36..51c8d85822 100644
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -25,15 +25,19 @@
  * Copyright (c) 2004, K A Fraser
  */
 
-#ifndef __XEN_PUBLIC_GRANT_TABLE_H__
+/**
+ * @file
+ * @brief Interface for granting foreign access to page frames, and receiving
+ * page-ownership transfers.
+ */
+
+#if !defined(__XEN_PUBLIC_GRANT_TABLE_H__) || defined(DOXYGEN)
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
+ * @code
  *  1. Write ent->domid.
  *  2. Write ent->frame:
  *      GTF_permit_access:   Frame to which access is permitted.
@@ -73,20 +75,25 @@
  *                           frame, or zero if none.
  *  3. Write memory barrier (WMB).
  *  4. Write ent->flags, inc. valid type.
+ * @endcode
  *
  * Invalidating an unused GTF_permit_access entry:
+ * @code
  *  1. flags = ent->flags.
  *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
  *  NB. No need for WMB as reuse of entry is control-dependent on success of
  *      step 3, and all architectures guarantee ordering of ctrl-dep writes.
+ * @endcode
  *
  * Invalidating an in-use GTF_permit_access entry:
+ *
  *  This cannot be done directly. Request assistance from the domain controller
  *  which can set a timeout on the use of a grant entry and take necessary
  *  action. (NB. This is not yet implemented!).
  *
  * Invalidating an unused GTF_accept_transfer entry:
+ * @code
  *  1. flags = ent->flags.
  *  2. Observe that !(flags & GTF_transfer_committed). [*]
  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
@@ -97,47 +104,55 @@
  *      transferred frame is written. It is safe for the guest to spin waiting
  *      for this to occur (detect by observing GTF_transfer_completed in
  *      ent->flags).
+ * @endcode
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
- */
-
-/*
- * Reference to a grant entry in a specified domain's grant table.
- */
-typedef uint32_t grant_ref_t;
-
-/*
+ *
  * A grant table comprises a packed array of grant entries in one or more
  * page frames shared between Xen and a guest.
+ *
  * [XEN]: This field is written by Xen and read by the sharing guest.
+ *
  * [GST]: This field is written by the guest and read by Xen.
+ *
+ * @addtogroup grant_table Grant Tables
+ * @{
  */
 
-/*
- * Version 1 of the grant table entry structure is maintained purely
- * for backwards compatibility.  New guests should use version 2.
+/**
+ * Reference to a grant entry in a specified domain's grant table.
  */
+typedef uint32_t grant_ref_t;
+
 #if __XEN_INTERFACE_VERSION__ < 0x0003020a
 #define grant_entry_v1 grant_entry
 #define grant_entry_v1_t grant_entry_t
 #endif
+/**
+ * Version 1 of the grant table entry structure is maintained purely
+ * for backwards compatibility.  New guests should use version 2.
+ */
 struct grant_entry_v1 {
-    /* GTF_xxx: various type and flag information.  [XEN,GST] */
+    /** GTF_xxx: various type and flag information.  [XEN,GST] */
     uint16_t flags;
-    /* The domain being granted foreign privileges. [GST] */
+    /** The domain being granted foreign privileges. [GST] */
     domid_t  domid;
-    /*
+    /**
+     * @code
      * GTF_permit_access: GFN that @domid is allowed to map and access. [GST]
      * GTF_accept_transfer: GFN that @domid is allowed to transfer into. [GST]
      * GTF_transfer_completed: MFN whose ownership transferred by @domid
      *                         (non-translated guests only). [XEN]
+     * @endcode
      */
     uint32_t frame;
 };
@@ -243,23 +258,27 @@ union grant_entry_v2 {
      * In that case, the frame field has the same semantics as the
      * field of the same name in the V1 entry structure.
      */
+    /** @cond skip anonymous struct/union for doxygen */
     struct {
         grant_entry_header_t hdr;
         uint32_t pad0;
         uint64_t frame;
     } full_page;
+    /** @endcond */
 
     /*
      * If the grant type is GTF_grant_access and GTF_sub_page is set,
      * @domid is allowed to access bytes [@page_off,@page_off+@length)
      * in frame @frame.
      */
+    /** @cond skip anonymous struct/union for doxygen */
     struct {
         grant_entry_header_t hdr;
         uint16_t page_off;
         uint16_t length;
         uint64_t frame;
     } sub_page;
+    /** @endcond */
 
     /*
      * If the grant is GTF_transitive, @domid is allowed to use the
@@ -270,12 +289,14 @@ union grant_entry_v2 {
      * The current version of Xen does not allow transitive grants
      * to be mapped.
      */
+    /** @cond skip anonymous struct/union for doxygen */
     struct {
         grant_entry_header_t hdr;
         domid_t trans_domid;
         uint16_t pad0;
         grant_ref_t gref;
     } transitive;
+    /** @endcond */
 
     uint32_t __spacer[4]; /* Pad to a power of two */
 };
@@ -433,7 +454,12 @@ typedef struct gnttab_transfer gnttab_transfer_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
 
 
-/*
+#define _GNTCOPY_source_gref      (0)
+#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
+#define _GNTCOPY_dest_gref        (1)
+#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
+
+/**
  * GNTTABOP_copy: Hypervisor based copy
  * source and destinations can be eithers MFNs or, for foreign domains,
  * grant references. the foreign domain has to grant read/write access
@@ -451,18 +477,15 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
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
+        /** @cond skip anonymous struct/union for doxygen */
         union {
             grant_ref_t ref;
             xen_pfn_t   gmfn;
         } u;
+        /** @endcond */
         domid_t  domid;
         uint16_t offset;
     } source, dest;
@@ -579,17 +602,19 @@ struct gnttab_swap_grant_ref {
 typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
 
-/*
+/**
  * Issue one or more cache maintenance operations on a portion of a
  * page granted to the calling domain by a foreign domain.
  */
 struct gnttab_cache_flush {
+    /** @cond skip anonymous struct/union for doxygen */
     union {
         uint64_t dev_bus_addr;
         grant_ref_t ref;
     } a;
-    uint16_t offset; /* offset from start of grant */
-    uint16_t length; /* size within the grant */
+    /** @endcond */
+    uint16_t offset; /**< offset from start of grant */
+    uint16_t length; /**< size within the grant */
 #define GNTTAB_CACHE_CLEAN          (1u<<0)
 #define GNTTAB_CACHE_INVAL          (1u<<1)
 #define GNTTAB_CACHE_SOURCE_GREF    (1u<<31)
@@ -673,6 +698,10 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
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


