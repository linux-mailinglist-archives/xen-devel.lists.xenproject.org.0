Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C20F355103
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 12:37:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.105771.202324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTj57-00015u-Gy; Tue, 06 Apr 2021 10:37:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 105771.202324; Tue, 06 Apr 2021 10:37:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTj57-000159-D5; Tue, 06 Apr 2021 10:37:13 +0000
Received: by outflank-mailman (input) for mailman id 105771;
 Tue, 06 Apr 2021 10:37:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZnD=JD=arm.com=luca.fancellu@srs-us1.protection.inumbo.net>)
 id 1lTj56-00014T-14
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 10:37:12 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 4a834dd7-fed1-4812-baa5-2a2f380abfc6;
 Tue, 06 Apr 2021 10:37:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0CC2ED1;
 Tue,  6 Apr 2021 03:37:09 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.cambridge.arm.com
 [10.1.197.16])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A022A3F73D;
 Tue,  6 Apr 2021 03:37:08 -0700 (PDT)
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
X-Inumbo-ID: 4a834dd7-fed1-4812-baa5-2a2f380abfc6
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
Subject: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
Date: Tue,  6 Apr 2021 11:36:03 +0100
Message-Id: <20210406103603.8530-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210406103603.8530-1-luca.fancellu@arm.com>
References: <20210406103603.8530-1-luca.fancellu@arm.com>

Modification to include/public/grant_table.h:

1) Change anonymous structure to be named structure,
   because doxygen can't deal with them.
2) Add doxygen tags to:
 - Create Grant tables section
 - include variables in the generated documentation
3) Add .rst file for grant table for Arm64

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 docs/hypercall-interfaces/arm64.rst           |  1 +
 .../arm64/grant_tables.rst                    |  8 ++
 docs/xen-doxygen/doxy_input.list              |  1 +
 xen/include/public/grant_table.h              | 79 ++++++++++++-------
 4 files changed, 59 insertions(+), 30 deletions(-)
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
index 84b1d26b36..b506e09ed3 100644
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
@@ -243,7 +258,7 @@ union grant_entry_v2 {
      * In that case, the frame field has the same semantics as the
      * field of the same name in the V1 entry structure.
      */
-    struct {
+    struct full_page {
         grant_entry_header_t hdr;
         uint32_t pad0;
         uint64_t frame;
@@ -254,7 +269,7 @@ union grant_entry_v2 {
      * @domid is allowed to access bytes [@page_off,@page_off+@length)
      * in frame @frame.
      */
-    struct {
+    struct sub_page {
         grant_entry_header_t hdr;
         uint16_t page_off;
         uint16_t length;
@@ -270,7 +285,7 @@ union grant_entry_v2 {
      * The current version of Xen does not allow transitive grants
      * to be mapped.
      */
-    struct {
+    struct transitive {
         grant_entry_header_t hdr;
         domid_t trans_domid;
         uint16_t pad0;
@@ -459,7 +474,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
 struct gnttab_copy {
     /* IN parameters. */
     struct gnttab_copy_ptr {
-        union {
+        union gnttab_copy_ptr_u {
             grant_ref_t ref;
             xen_pfn_t   gmfn;
         } u;
@@ -584,7 +599,7 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
  * page granted to the calling domain by a foreign domain.
  */
 struct gnttab_cache_flush {
-    union {
+    union a {
         uint64_t dev_bus_addr;
         grant_ref_t ref;
     } a;
@@ -673,6 +688,10 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
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


