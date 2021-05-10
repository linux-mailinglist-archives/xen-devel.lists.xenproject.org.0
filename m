Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FBD377E70
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 10:43:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124998.235356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Ve-0005wf-2r; Mon, 10 May 2021 08:43:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124998.235356; Mon, 10 May 2021 08:43:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lg1Vd-0005uU-Us; Mon, 10 May 2021 08:43:25 +0000
Received: by outflank-mailman (input) for mailman id 124998;
 Mon, 10 May 2021 08:43:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jR2S=KF=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lg1UB-0008L0-Oi
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 08:41:55 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id b2a18b6b-6015-4b41-b561-12498a08a357;
 Mon, 10 May 2021 08:41:28 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6115A11FB;
 Mon, 10 May 2021 01:41:28 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 046D73F719;
 Mon, 10 May 2021 01:41:26 -0700 (PDT)
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
X-Inumbo-ID: b2a18b6b-6015-4b41-b561-12498a08a357
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
Subject: [PATCH v6 9/9] docs/doxygen: doxygen documentation for grant_table.h
Date: Mon, 10 May 2021 09:41:05 +0100
Message-Id: <20210510084105.17108-10-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210510084105.17108-1-luca.fancellu@arm.com>
References: <20210510084105.17108-1-luca.fancellu@arm.com>

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
v6 changes:
- Fix misaligned comment
- Moved comments to make them display in the docs
- Included more documentation in the docs
  (see output here: https://luca.fancellu.gitlab.io/xen-docs/hypercall-interfaces/common/grant_tables.html)
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
 docs/hypercall-interfaces/arm64.rst           |   1 +
 .../common/grant_tables.rst                   |   9 +
 docs/xen-doxygen/doxy_input.list              |   1 +
 xen/include/public/grant_table.h              | 387 +++++++++++-------
 4 files changed, 245 insertions(+), 153 deletions(-)
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
index 0000000000..b8a1ef8759
--- /dev/null
+++ b/docs/hypercall-interfaces/common/grant_tables.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Grant Tables
+============
+
+.. doxygengroup:: grant_table
+   :project: Xen
+   :members:
+   :undoc-members:
diff --git a/docs/xen-doxygen/doxy_input.list b/docs/xen-doxygen/doxy_input.list
index e69de29bb2..233d692fa7 100644
--- a/docs/xen-doxygen/doxy_input.list
+++ b/docs/xen-doxygen/doxy_input.list
@@ -0,0 +1 @@
+xen/include/public/grant_table.h
diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
index 84b1d26b36..dfa5155927 100644
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
@@ -51,13 +55,13 @@
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
+ * A grant table comprises a packed array of grant entries in one or more
+ * page frames shared between Xen and a guest.
+ *
+ * Some rough guidelines on accessing and updating grant-table entries
  * in a concurrency-safe manner. For more information, Linux contains a
  * reference implementation for guest OSes (drivers/xen/grant_table.c, see
  * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/xen/grant-table.c;hb=HEAD
@@ -66,6 +70,7 @@
  *     compiler barrier will still be required.
  *
  * Introducing a valid entry into the grant table:
+ * @keepindent
  *  1. Write ent->domid.
  *  2. Write ent->frame:
  *      GTF_permit_access:   Frame to which access is permitted.
@@ -73,20 +78,25 @@
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
@@ -97,29 +107,32 @@
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
+ * Data structure fields or defines described below have the following tags:
+ * * [XEN]: This field is written by Xen and read by the sharing guest.
+ * * [GST]: This field is written by the guest and read by Xen.
+ *
+ * @addtogroup grant_table Grant Tables
+ * @{
  */
 
-/*
+/**
  * Reference to a grant entry in a specified domain's grant table.
  */
 typedef uint32_t grant_ref_t;
 
-/*
- * A grant table comprises a packed array of grant entries in one or more
- * page frames shared between Xen and a guest.
- * [XEN]: This field is written by Xen and read by the sharing guest.
- * [GST]: This field is written by the guest and read by Xen.
- */
-
 /*
  * Version 1 of the grant table entry structure is maintained purely
  * for backwards compatibility.  New guests should use version 2.
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
@@ -150,60 +165,99 @@ typedef struct grant_entry_v1 grant_entry_v1_t;
 #define GNTTAB_RESERVED_CONSOLE        0
 #define GNTTAB_RESERVED_XENSTORE       1
 
-/*
- * Type of grant entry.
- *  GTF_invalid: This grant entry grants no privileges.
- *  GTF_permit_access: Allow @domid to map/access @frame.
- *  GTF_accept_transfer: Allow @domid to transfer ownership of one page frame
- *                       to this guest. Xen writes the page number to @frame.
- *  GTF_transitive: Allow @domid to transitively access a subrange of
- *                  @trans_grant in @trans_domid.  No mappings are allowed.
- */
+/** This type of grant entry grants no privileges. */
 #define GTF_invalid         (0U<<0)
+
+/** This type of grant entry allow \@domid to map/access \@frame. */
 #define GTF_permit_access   (1U<<0)
+
+/**
+ * This type of grant entry allow \@domid to transfer ownership of one pageframe
+ * to this guest. Xen writes the page number to \@frame.
+ */
 #define GTF_accept_transfer (2U<<0)
+
+/**
+ * This type of grant entry allow \@domid to transitively access a subrange of
+ * \@trans_grant in \@trans_domid.  No mappings are allowed.
+ */
 #define GTF_transitive      (3U<<0)
+
 #define GTF_type_mask       (3U<<0)
 
-/*
- * Subflags for GTF_permit_access and GTF_transitive.
- *  GTF_readonly: Restrict @domid to read-only mappings and accesses. [GST]
- *  GTF_reading: Grant entry is currently mapped for reading by @domid. [XEN]
- *  GTF_writing: Grant entry is currently mapped for writing by @domid. [XEN]
- * Further subflags for GTF_permit_access only.
- *  GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags to be used for
- *                             mappings of the grant [GST]
- *  GTF_sub_page: Grant access to only a subrange of the page.  @domid
- *                will only be allowed to copy from the grant, and not
- *                map it. [GST]
+/**
+ * @def GTF_readonly
+ * Subflag for GTF_permit_access and GTF_transitive: Restrict \@domid to
+ * read-only mappings and accesses. [GST]
  */
 #define _GTF_readonly       (2)
 #define GTF_readonly        (1U<<_GTF_readonly)
+
+/**
+ * @def GTF_reading
+ * Subflag for GTF_permit_access and GTF_transitive: Grant entry is currently
+ * mapped for reading by \@domid. [XEN]
+ */
 #define _GTF_reading        (3)
 #define GTF_reading         (1U<<_GTF_reading)
+
+/**
+ * @def GTF_writing
+ * Subflag for GTF_permit_access and GTF_transitive: Grant entry is currently
+ * mapped for writing by \@domid. [XEN]
+ */
 #define _GTF_writing        (4)
 #define GTF_writing         (1U<<_GTF_writing)
+
+/**
+ * @def GTF_PWT
+ * Subflag for GTF_permit_access only: (x86) cache attribute flags to be used
+ * for mappings of the grant [GST]
+ */
 #define _GTF_PWT            (5)
 #define GTF_PWT             (1U<<_GTF_PWT)
+
+/**
+ * @def GTF_PCD
+ * Subflag for GTF_permit_access only: (x86) cache attribute flags to be used
+ * for mappings of the grant [GST]
+ */
 #define _GTF_PCD            (6)
 #define GTF_PCD             (1U<<_GTF_PCD)
+
+/**
+ * @def GTF_PAT
+ * Subflag for GTF_permit_access only: (x86) cache attribute flags to be used
+ * for mappings of the grant [GST]
+ */
 #define _GTF_PAT            (7)
 #define GTF_PAT             (1U<<_GTF_PAT)
+
+/**
+ * @def GTF_sub_page
+ * Subflag for GTF_permit_access only: Grant access to only a subrange of the
+ * page. \@domid will only be allowed to copy from the grant, and not map it.
+ * [GST]
+ */
 #define _GTF_sub_page       (8)
 #define GTF_sub_page        (1U<<_GTF_sub_page)
 
-/*
- * Subflags for GTF_accept_transfer:
- *  GTF_transfer_committed: Xen sets this flag to indicate that it is committed
- *      to transferring ownership of a page frame. When a guest sees this flag
- *      it must /not/ modify the grant entry until GTF_transfer_completed is
- *      set by Xen.
- *  GTF_transfer_completed: It is safe for the guest to spin-wait on this flag
- *      after reading GTF_transfer_committed. Xen will always write the frame
- *      address, followed by ORing this flag, in a timely manner.
+/**
+ * @def GTF_transfer_committed
+ * Subflag for GTF_accept_transfer: Xen sets this flag to indicate that it is
+ * committed to transferring ownership of a page frame. When a guest sees this
+ * flag it must /not/ modify the grant entry until GTF_transfer_completed is
+ * set by Xen.
  */
 #define _GTF_transfer_committed (2)
 #define GTF_transfer_committed  (1U<<_GTF_transfer_committed)
+
+/**
+ * @def GTF_transfer_completed
+ * Subflag for GTF_accept_transfer: It is safe for the guest to spin-wait on
+ * this flag after reading GTF_transfer_committed. Xen will always write the
+ * frame address, followed by ORing this flag, in a timely manner.
+ */
 #define _GTF_transfer_completed (3)
 #define GTF_transfer_completed  (1U<<_GTF_transfer_completed)
 
@@ -228,17 +282,17 @@ struct grant_entry_header {
 };
 typedef struct grant_entry_header grant_entry_header_t;
 
-/*
+/**
  * Version 2 of the grant entry structure.
  */
 union grant_entry_v2 {
     grant_entry_header_t hdr;
 
-    /*
+    /**
      * This member is used for V1-style full page grants, where either:
      *
-     * -- hdr.type is GTF_accept_transfer, or
-     * -- hdr.type is GTF_permit_access and GTF_sub_page is not set.
+     * * hdr.type is GTF_accept_transfer, or
+     * * hdr.type is GTF_permit_access and GTF_sub_page is not set.
      *
      * In that case, the frame field has the same semantics as the
      * field of the same name in the V1 entry structure.
@@ -249,10 +303,10 @@ union grant_entry_v2 {
         uint64_t frame;
     } full_page;
 
-    /*
+    /**
      * If the grant type is GTF_grant_access and GTF_sub_page is set,
-     * @domid is allowed to access bytes [@page_off,@page_off+@length)
-     * in frame @frame.
+     * \@domid is allowed to access bytes [\@page_off,\@page_off+\@length)
+     * in frame \@frame.
      */
     struct {
         grant_entry_header_t hdr;
@@ -261,9 +315,9 @@ union grant_entry_v2 {
         uint64_t frame;
     } sub_page;
 
-    /*
-     * If the grant is GTF_transitive, @domid is allowed to use the
-     * grant @gref in domain @trans_domid, as if it was the local
+    /**
+     * If the grant is GTF_transitive, \@domid is allowed to use the
+     * grant \@gref in domain \@trans_domid, as if it was the local
      * domain.  Obviously, the transitive access must be compatible
      * with the original grant.
      *
@@ -277,7 +331,7 @@ union grant_entry_v2 {
         grant_ref_t gref;
     } transitive;
 
-    uint32_t __spacer[4]; /* Pad to a power of two */
+    uint32_t __spacer[4]; /**< Pad to a power of two */
 };
 typedef union grant_entry_v2 grant_entry_v2_t;
 
@@ -317,24 +371,25 @@ typedef uint16_t grant_status_t;
 #endif /* __XEN_INTERFACE_VERSION__ */
 /* ` } */
 
-/*
+/**
  * Handle to track a mapping created via a grant reference.
  */
 typedef uint32_t grant_handle_t;
 
-/*
- * GNTTABOP_map_grant_ref: Map the grant entry (<dom>,<ref>) for access
- * by devices and/or host CPUs. If successful, <handle> is a tracking number
- * that must be presented later to destroy the mapping(s). On error, <status>
+/**
+ * GNTTABOP_map_grant_ref: Map the grant entry (\@dom,\@ref) for access
+ * by devices and/or host CPUs. If successful, \@handle is a tracking number
+ * that must be presented later to destroy the mapping(s). On error, \@status
  * is a negative status code.
+ *
  * NOTES:
- *  1. If GNTMAP_device_map is specified then <dev_bus_addr> is the address
+ *  1. If GNTMAP_device_map is specified then \@dev_bus_addr is the address
  *     via which I/O devices may access the granted frame.
  *  2. If GNTMAP_host_map is specified then a mapping will be added at
  *     either a host virtual address in the current address space, or at
  *     a PTE at the specified machine address.  The type of mapping to
  *     perform is selected through the GNTMAP_contains_pte flag, and the
- *     address is specified in <host_addr>.
+ *     address is specified in \@host_addr.
  *  3. Mappings should only be destroyed via GNTTABOP_unmap_grant_ref. If a
  *     host mapping is destroyed by other means then it is *NOT* guaranteed
  *     to be accounted to the correct grant reference!
@@ -342,25 +397,26 @@ typedef uint32_t grant_handle_t;
 struct gnttab_map_grant_ref {
     /* IN parameters. */
     uint64_t host_addr;
-    uint32_t flags;               /* GNTMAP_* */
+    uint32_t flags;               /**< GNTMAP_* */
     grant_ref_t ref;
     domid_t  dom;
     /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    int16_t  status;              /**< GNTST_* status code */
     grant_handle_t handle;
     uint64_t dev_bus_addr;
 };
 typedef struct gnttab_map_grant_ref gnttab_map_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_map_grant_ref_t);
 
-/*
+/**
  * GNTTABOP_unmap_grant_ref: Destroy one or more grant-reference mappings
- * tracked by <handle>. If <host_addr> or <dev_bus_addr> is zero, that
+ * tracked by \@handle. If \@host_addr or \@dev_bus_addr is zero, that
  * field is ignored. If non-zero, they must refer to a device/host mapping
- * that is tracked by <handle>
+ * that is tracked by \@handle
+ *
  * NOTES:
  *  1. The call may fail in an undefined manner if either mapping is not
- *     tracked by <handle>.
+ *     tracked by \@handle.
  *  3. After executing a batch of unmaps, it is guaranteed that no stale
  *     mappings will remain in the device or host TLBs.
  */
@@ -370,18 +426,19 @@ struct gnttab_unmap_grant_ref {
     uint64_t dev_bus_addr;
     grant_handle_t handle;
     /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    int16_t  status;              /**< GNTST_* status code */
 };
 typedef struct gnttab_unmap_grant_ref gnttab_unmap_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
 
-/*
- * GNTTABOP_setup_table: Set up a grant table for <dom> comprising at least
- * <nr_frames> pages. The frame addresses are written to the <frame_list>.
- * Only <nr_frames> addresses are written, even if the table is larger.
+/**
+ * GNTTABOP_setup_table: Set up a grant table for \@dom comprising at least
+ * \@nr_frames pages. The frame addresses are written to the \@frame_list.
+ * Only \@nr_frames addresses are written, even if the table is larger.
+ *
  * NOTES:
- *  1. <dom> may be specified as DOMID_SELF.
- *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
+ *  1. \@dom may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may specify \@dom != DOMID_SELF.
  *  3. Xen may not support more than a single grant-table page per domain.
  */
 struct gnttab_setup_table {
@@ -389,7 +446,7 @@ struct gnttab_setup_table {
     domid_t  dom;
     uint32_t nr_frames;
     /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    int16_t  status;              /**< GNTST_* status code */
 #if __XEN_INTERFACE_VERSION__ < 0x00040300
     XEN_GUEST_HANDLE(ulong) frame_list;
 #else
@@ -399,7 +456,7 @@ struct gnttab_setup_table {
 typedef struct gnttab_setup_table gnttab_setup_table_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_t);
 
-/*
+/**
  * GNTTABOP_dump_table: Dump the contents of the grant table to the
  * xen console. Debugging use only.
  */
@@ -407,14 +464,14 @@ struct gnttab_dump_table {
     /* IN parameters. */
     domid_t dom;
     /* OUT parameters. */
-    int16_t status;               /* => enum grant_status */
+    int16_t status;               /**< GNTST_* status code */
 };
 typedef struct gnttab_dump_table gnttab_dump_table_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_dump_table_t);
 
-/*
- * GNTTABOP_transfer: Transfer <frame> to a foreign domain. The foreign domain
- * has previously registered its interest in the transfer via <domid, ref>.
+/**
+ * GNTTABOP_transfer: Transfer \@frame to a foreign domain. The foreign domain
+ * has previously registered its interest in the transfer via \@domid, \@ref.
  *
  * Note that, even if the transfer fails, the specified page no longer belongs
  * to the calling domain *unless* the error is GNTST_bad_page.
@@ -427,13 +484,13 @@ struct gnttab_transfer {
     domid_t       domid;
     grant_ref_t   ref;
     /* OUT parameters. */
-    int16_t       status;
+    int16_t       status;               /**< GNTST_* status code */
 };
 typedef struct gnttab_transfer gnttab_transfer_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
 
 
-/*
+/**
  * GNTTABOP_copy: Hypervisor based copy
  * source and destinations can be eithers MFNs or, for foreign domains,
  * grant references. the foreign domain has to grant read/write access
@@ -451,11 +508,6 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
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
@@ -467,19 +519,24 @@ struct gnttab_copy {
         uint16_t offset;
     } source, dest;
     uint16_t      len;
-    uint16_t      flags;          /* GNTCOPY_* */
+    uint16_t      flags;          /**< GNTCOPY_* */
+#define _GNTCOPY_source_gref      (0)
+#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
+#define _GNTCOPY_dest_gref        (1)
+#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
     /* OUT parameters. */
     int16_t       status;
 };
 typedef struct gnttab_copy  gnttab_copy_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_copy_t);
 
-/*
+/**
  * GNTTABOP_query_size: Query the current and maximum sizes of the shared
  * grant table.
+ *
  * NOTES:
- *  1. <dom> may be specified as DOMID_SELF.
- *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
+ *  1. \@dom may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may specify \@dom != DOMID_SELF.
  */
 struct gnttab_query_size {
     /* IN parameters. */
@@ -487,19 +544,20 @@ struct gnttab_query_size {
     /* OUT parameters. */
     uint32_t nr_frames;
     uint32_t max_nr_frames;
-    int16_t  status;              /* => enum grant_status */
+    int16_t  status;              /**< GNTST_* status code */
 };
 typedef struct gnttab_query_size gnttab_query_size_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_t);
 
-/*
+/**
  * GNTTABOP_unmap_and_replace: Destroy one or more grant-reference mappings
- * tracked by <handle> but atomically replace the page table entry with one
- * pointing to the machine address under <new_addr>.  <new_addr> will be
+ * tracked by \@handle but atomically replace the page table entry with one
+ * pointing to the machine address under \@new_addr. \@new_addr will be
  * redirected to the null entry.
+ *
  * NOTES:
  *  1. The call may fail in an undefined manner if either mapping is not
- *     tracked by <handle>.
+ *     tracked by \@handle.
  *  2. After executing a batch of unmaps, it is guaranteed that no stale
  *     mappings will remain in the device or host TLBs.
  */
@@ -509,13 +567,13 @@ struct gnttab_unmap_and_replace {
     uint64_t new_addr;
     grant_handle_t handle;
     /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    int16_t  status;              /**< GNTST_* status code */
 };
 typedef struct gnttab_unmap_and_replace gnttab_unmap_and_replace_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_and_replace_t);
 
 #if __XEN_INTERFACE_VERSION__ >= 0x0003020a
-/*
+/**
  * GNTTABOP_set_version: Request a particular version of the grant
  * table shared table structure.  This operation may be used to toggle
  * between different versions, but must be performed while no grants
@@ -529,32 +587,33 @@ typedef struct gnttab_set_version gnttab_set_version_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_set_version_t);
 
 
-/*
+/**
  * GNTTABOP_get_status_frames: Get the list of frames used to store grant
- * status for <dom>. In grant format version 2, the status is separated
+ * status for \@dom. In grant format version 2, the status is separated
  * from the other shared grant fields to allow more efficient synchronization
  * using barriers instead of atomic cmpexch operations.
- * <nr_frames> specify the size of vector <frame_list>.
- * The frame addresses are returned in the <frame_list>.
- * Only <nr_frames> addresses are returned, even if the table is larger.
+ * \@nr_frames specify the size of vector \@frame_list.
+ * The frame addresses are returned in the \@frame_list.
+ * Only \@nr_frames addresses are returned, even if the table is larger.
+ *
  * NOTES:
- *  1. <dom> may be specified as DOMID_SELF.
- *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
+ *  1. \@dom may be specified as DOMID_SELF.
+ *  2. Only a sufficiently-privileged domain may specify \@dom != DOMID_SELF.
  */
 struct gnttab_get_status_frames {
     /* IN parameters. */
     uint32_t nr_frames;
     domid_t  dom;
     /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    int16_t  status;              /**< GNTST_* status code */
     XEN_GUEST_HANDLE(uint64_t) frame_list;
 };
 typedef struct gnttab_get_status_frames gnttab_get_status_frames_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_get_status_frames_t);
 
-/*
+/**
  * GNTTABOP_get_version: Get the grant table version which is in
- * effect for domain <dom>.
+ * effect for domain \@dom.
  */
 struct gnttab_get_version {
     /* IN parameters */
@@ -566,7 +625,7 @@ struct gnttab_get_version {
 typedef struct gnttab_get_version gnttab_get_version_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_get_version_t);
 
-/*
+/**
  * GNTTABOP_swap_grant_ref: Swap the contents of two grant entries.
  */
 struct gnttab_swap_grant_ref {
@@ -574,12 +633,12 @@ struct gnttab_swap_grant_ref {
     grant_ref_t ref_a;
     grant_ref_t ref_b;
     /* OUT parameters */
-    int16_t status;             /* => enum grant_status */
+    int16_t status;             /**< GNTST_* status code */
 };
 typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
 
-/*
+/**
  * Issue one or more cache maintenance operations on a portion of a
  * page granted to the calling domain by a foreign domain.
  */
@@ -588,8 +647,8 @@ struct gnttab_cache_flush {
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
@@ -600,40 +659,60 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
 
 #endif /* __XEN_INTERFACE_VERSION__ */
 
-/*
- * Bitfield values for gnttab_map_grant_ref.flags.
+/**
+ * @def GNTMAP_device_map
+ * Bitfield value for gnttab_map_grant_ref.flags: Map the grant entry for
+ * access by I/O devices.
  */
- /* Map the grant entry for access by I/O devices. */
 #define _GNTMAP_device_map      (0)
 #define GNTMAP_device_map       (1<<_GNTMAP_device_map)
- /* Map the grant entry for access by host CPUs. */
+
+/**
+ * @def GNTMAP_host_map
+ * Bitfield value for gnttab_map_grant_ref.flags: Map the grant entry for
+ * access by host CPUs.
+ */
 #define _GNTMAP_host_map        (1)
 #define GNTMAP_host_map         (1<<_GNTMAP_host_map)
- /* Accesses to the granted frame will be restricted to read-only access. */
+
+/**
+ * @def GNTMAP_readonly
+ * Bitfield value for gnttab_map_grant_ref.flags: Accesses to the granted frame
+ * will be restricted to read-only access.
+ */
 #define _GNTMAP_readonly        (2)
 #define GNTMAP_readonly         (1<<_GNTMAP_readonly)
- /*
-  * GNTMAP_host_map subflag:
-  *  0 => The host mapping is usable only by the guest OS.
-  *  1 => The host mapping is usable by guest OS + current application.
-  */
+
+/**
+ * @def GNTMAP_application_map
+ * Bitfield value for gnttab_map_grant_ref.flags.
+ *
+ * GNTMAP_host_map subflag:
+ * * 0 => The host mapping is usable only by the guest OS.
+ * * 1 => The host mapping is usable by guest OS + current application.
+ */
 #define _GNTMAP_application_map (3)
 #define GNTMAP_application_map  (1<<_GNTMAP_application_map)
 
- /*
-  * GNTMAP_contains_pte subflag:
-  *  0 => This map request contains a host virtual address.
-  *  1 => This map request contains the machine addess of the PTE to update.
-  */
+/**
+ * @def GNTMAP_contains_pte
+ * Bitfield value for gnttab_map_grant_ref.flags.
+ *
+ * GNTMAP_contains_pte subflag:
+ * * 0 => This map request contains a host virtual address.
+ * * 1 => This map request contains the machine addess of the PTE to update.
+ */
 #define _GNTMAP_contains_pte    (4)
 #define GNTMAP_contains_pte     (1<<_GNTMAP_contains_pte)
 
 #define _GNTMAP_can_fail        (5)
 #define GNTMAP_can_fail         (1<<_GNTMAP_can_fail)
 
-/*
- * Bits to be placed in guest kernel available PTE bits (architecture
- * dependent; only supported when XENFEAT_gnttab_map_avail_bits is set).
+/**
+ * @def GNTMAP_guest_avail_mask
+ * Bitfield value for gnttab_map_grant_ref.flags: Bits to be placed in guest
+ * kernel available PTE bits (architecture dependent; only supported when
+ * XENFEAT_gnttab_map_avail_bits is set).
  */
 #define _GNTMAP_guest_avail0    (16)
 #define GNTMAP_guest_avail_mask ((uint32_t)~0 << _GNTMAP_guest_avail0)
@@ -641,21 +720,19 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
 /*
  * Values for error status returns. All errors are -ve.
  */
-/* ` enum grant_status { */
-#define GNTST_okay             (0)  /* Normal return.                        */
-#define GNTST_general_error    (-1) /* General undefined error.              */
-#define GNTST_bad_domain       (-2) /* Unrecognsed domain id.                */
-#define GNTST_bad_gntref       (-3) /* Unrecognised or inappropriate gntref. */
-#define GNTST_bad_handle       (-4) /* Unrecognised or inappropriate handle. */
-#define GNTST_bad_virt_addr    (-5) /* Inappropriate virtual address to map. */
-#define GNTST_bad_dev_addr     (-6) /* Inappropriate device address to unmap.*/
-#define GNTST_no_device_space  (-7) /* Out of space in I/O MMU.              */
-#define GNTST_permission_denied (-8) /* Not enough privilege for operation.  */
-#define GNTST_bad_page         (-9) /* Specified page was invalid for op.    */
-#define GNTST_bad_copy_arg    (-10) /* copy arguments cross page boundary.   */
-#define GNTST_address_too_big (-11) /* transfer page address too large.      */
-#define GNTST_eagain          (-12) /* Operation not done; try again.        */
-/* ` } */
+#define GNTST_okay             (0)  /**< Normal return.                        */
+#define GNTST_general_error    (-1) /**< General undefined error.              */
+#define GNTST_bad_domain       (-2) /**< Unrecognsed domain id.                */
+#define GNTST_bad_gntref       (-3) /**< Unrecognised or inappropriate gntref. */
+#define GNTST_bad_handle       (-4) /**< Unrecognised or inappropriate handle. */
+#define GNTST_bad_virt_addr    (-5) /**< Inappropriate virtual address to map. */
+#define GNTST_bad_dev_addr     (-6) /**< Inappropriate device address to unmap.*/
+#define GNTST_no_device_space  (-7) /**< Out of space in I/O MMU.              */
+#define GNTST_permission_denied (-8) /**< Not enough privilege for operation.  */
+#define GNTST_bad_page         (-9) /**< Specified page was invalid for op.    */
+#define GNTST_bad_copy_arg    (-10) /**< copy arguments cross page boundary.   */
+#define GNTST_address_too_big (-11) /**< transfer page address too large.      */
+#define GNTST_eagain          (-12) /**< Operation not done; try again.        */
 
 #define GNTTABOP_error_msgs {                   \
     "okay",                                     \
@@ -673,6 +750,10 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
     "operation not done; try again"             \
 }
 
+/**
+ * @}
+ */
+
 #endif /* __XEN_PUBLIC_GRANT_TABLE_H__ */
 
 /*
-- 
2.17.1


