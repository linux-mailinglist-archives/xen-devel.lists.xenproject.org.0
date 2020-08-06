Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB9E23E4CC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:49:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pdp-0004Ix-NW; Thu, 06 Aug 2020 23:49:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pdn-0004FE-MY
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:43 +0000
X-Inumbo-ID: c9ced62e-f05d-4d98-8091-18072f6dbee6
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9ced62e-f05d-4d98-8091-18072f6dbee6;
 Thu, 06 Aug 2020 23:49:40 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 88F0B221E4;
 Thu,  6 Aug 2020 23:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757780;
 bh=KF+NaTTtpfYKF6P4n5wsUKlOBm1SEFIE1xgAr22kRHk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rdpgL/a4tE+Lt7VhIMXKv9y3N2e2bTVq3IPq4PPYaUzy7fHsd8KuzceRDYvbkd8I0
 O+EbWVsWb6F/eAT1PXP9YKvMBG545AB7MHqg0j9mLNlaZ5tkElb//7MDVve8H7/x1/
 +kWjEmrt52zZ7cB24gxQNgTAcNwDQ7V/SrRn6RIE=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 06/14] kernel-doc: public/grant_table.h
Date: Thu,  6 Aug 2020 16:49:25 -0700
Message-Id: <20200806234933.16448-6-sstabellini@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2008061605410.16004@sstabellini-ThinkPad-T480s>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: sstabellini@kernel.org, julien@xen.org, wl@xen.org,
 andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, george.dunlap@citrix.com,
 jbeulich@suse.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Convert in-code comments to kernel-doc format wherever possible.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/include/public/grant_table.h | 443 ++++++++++++++++++-------------
 1 file changed, 257 insertions(+), 186 deletions(-)

diff --git a/xen/include/public/grant_table.h b/xen/include/public/grant_table.h
index 3b7bf93d74..e461458225 100644
--- a/xen/include/public/grant_table.h
+++ b/xen/include/public/grant_table.h
@@ -30,8 +30,8 @@
 
 #include "xen.h"
 
-/*
- * `incontents 150 gnttab Grant Tables
+/**
+ * DOC: Grant Tables
  *
  * Xen's grant tables provide a generic mechanism to memory sharing
  * between domains. This shared memory interface underpins the split
@@ -53,11 +53,10 @@
  * fully virtualised memory.
  */
 
-/***********************************
- * GRANT TABLE REPRESENTATION
- */
-
-/* Some rough guidelines on accessing and updating grant-table entries
+/**
+ * DOC: GRANT TABLE REPRESENTATION
+ *
+ * Some rough guidelines on accessing and updating grant-table entries
  * in a concurrency-safe manner. For more information, Linux contains a
  * reference implementation for guest OSes (drivers/xen/grant_table.c, see
  * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/xen/grant-table.c;hb=HEAD
@@ -108,56 +107,66 @@
  *  Use SMP-safe bit-setting instruction.
  */
 
-/*
+/**
+ * typedef
  * Reference to a grant entry in a specified domain's grant table.
  */
 typedef uint32_t grant_ref_t;
 
-/*
+/**
+ * DOC: grant table
+ *
  * A grant table comprises a packed array of grant entries in one or more
  * page frames shared between Xen and a guest.
  * [XEN]: This field is written by Xen and read by the sharing guest.
  * [GST]: This field is written by the guest and read by Xen.
  */
 
-/*
- * Version 1 of the grant table entry structure is maintained purely
- * for backwards compatibility.  New guests should use version 2.
- */
 #if __XEN_INTERFACE_VERSION__ < 0x0003020a
 #define grant_entry_v1 grant_entry
 #define grant_entry_v1_t grant_entry_t
 #endif
+/**
+ * struct grant_entry_v1
+ *
+ * Version 1 of the grant table entry structure is maintained purely
+ * for backwards compatibility.  New guests should use version 2.
+ */
 struct grant_entry_v1 {
-    /* GTF_xxx: various type and flag information.  [XEN,GST] */
+    /** @flags: GTF_xxx, various type and flag information.  [XEN,GST] */
     uint16_t flags;
-    /* The domain being granted foreign privileges. [GST] */
+    /** @domid: The domain being granted foreign privileges. [GST] */
     domid_t  domid;
-    /*
-     * GTF_permit_access: GFN that @domid is allowed to map and access. [GST]
-     * GTF_accept_transfer: GFN that @domid is allowed to transfer into. [GST]
-     * GTF_transfer_completed: MFN whose ownership transferred by @domid
-     *                         (non-translated guests only). [XEN]
+    /**
+     * @frame:
+     * - GTF_permit_access: GFN that @domid is allowed to map and access. [GST]
+     * - GTF_accept_transfer: GFN that @domid is allowed to transfer into. [GST]
+     * - GTF_transfer_completed: MFN whose ownership transferred by @domid
+     *                           (non-translated guests only). [XEN]
      */
     uint32_t frame;
 };
 typedef struct grant_entry_v1 grant_entry_v1_t;
 
-/* The first few grant table entries will be preserved across grant table
+/**
+ * DOC: GNTTAB_NR_RESERVED_ENTRIES
+ *
+ * The first few grant table entries will be preserved across grant table
  * version changes and may be pre-populated at domain creation by tools.
  */
 #define GNTTAB_NR_RESERVED_ENTRIES     8
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
+/**
+ * DOC: Type of grant entry.
+ *
+ * - GTF_invalid: This grant entry grants no privileges.
+ * - GTF_permit_access: Allow @domid to map/access @frame.
+ * - GTF_accept_transfer: Allow @domid to transfer ownership of one page frame
+ *                        to this guest. Xen writes the page number to @frame.
+ * - GTF_transitive: Allow @domid to transitively access a subrange of
+ *                   @trans_grant in @trans_domid.  No mappings are allowed.
  */
 #define GTF_invalid         (0U<<0)
 #define GTF_permit_access   (1U<<0)
@@ -165,15 +174,16 @@ typedef struct grant_entry_v1 grant_entry_v1_t;
 #define GTF_transitive      (3U<<0)
 #define GTF_type_mask       (3U<<0)
 
-/*
- * Subflags for GTF_permit_access.
- *  GTF_readonly: Restrict @domid to read-only mappings and accesses. [GST]
- *  GTF_reading: Grant entry is currently mapped for reading by @domid. [XEN]
- *  GTF_writing: Grant entry is currently mapped for writing by @domid. [XEN]
- *  GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags for the grant [GST]
- *  GTF_sub_page: Grant access to only a subrange of the page.  @domid
- *                will only be allowed to copy from the grant, and not
- *                map it. [GST]
+/**
+ * DOC: Subflags for GTF_permit_access.
+ *
+ * - GTF_readonly: Restrict @domid to read-only mappings and accesses. [GST]
+ * - GTF_reading: Grant entry is currently mapped for reading by @domid. [XEN]
+ * - GTF_writing: Grant entry is currently mapped for writing by @domid. [XEN]
+ * - GTF_PAT, GTF_PWT, GTF_PCD: (x86) cache attribute flags for the grant [GST]
+ * - GTF_sub_page: Grant access to only a subrange of the page.  @domid
+ *                 will only be allowed to copy from the grant, and not
+ *                 map it. [GST]
  */
 #define _GTF_readonly       (2)
 #define GTF_readonly        (1U<<_GTF_readonly)
@@ -190,8 +200,9 @@ typedef struct grant_entry_v1 grant_entry_v1_t;
 #define _GTF_sub_page       (8)
 #define GTF_sub_page        (1U<<_GTF_sub_page)
 
-/*
- * Subflags for GTF_accept_transfer:
+/**
+ * DOC: Subflags for GTF_accept_transfer:
+ *
  *  GTF_transfer_committed: Xen sets this flag to indicate that it is committed
  *      to transferring ownership of a page frame. When a guest sees this flag
  *      it must /not/ modify the grant entry until GTF_transfer_completed is
@@ -205,38 +216,43 @@ typedef struct grant_entry_v1 grant_entry_v1_t;
 #define _GTF_transfer_completed (3)
 #define GTF_transfer_completed  (1U<<_GTF_transfer_completed)
 
-/*
- * Version 2 grant table entries.  These fulfil the same role as
- * version 1 entries, but can represent more complicated operations.
- * Any given domain will have either a version 1 or a version 2 table,
- * and every entry in the table will be the same version.
+#if __XEN_INTERFACE_VERSION__ >= 0x0003020a
+/**
+ * DOC: Version 2 grant table entries
+ *
+ * These fulfil the same role as version 1 entries, but can represent
+ * more complicated operations.  Any given domain will have either a
+ * version 1 or a version 2 table, and every entry in the table will be
+ * the same version.
  *
  * The interface by which domains use grant references does not depend
  * on the grant table version in use by the other domain.
- */
-#if __XEN_INTERFACE_VERSION__ >= 0x0003020a
-/*
+ *
  * Version 1 and version 2 grant entries share a common prefix.  The
  * fields of the prefix are documented as part of struct
  * grant_entry_v1.
  */
+/**
+ * struct grant_entry_header
+ */
 struct grant_entry_header {
     uint16_t flags;
     domid_t  domid;
 };
 typedef struct grant_entry_header grant_entry_header_t;
 
-/*
- * Version 2 of the grant entry structure.
+/**
+ * union grant_entry_v2 - Version 2 of the grant entry structure.
  */
 union grant_entry_v2 {
     grant_entry_header_t hdr;
 
-    /*
+    /**
+     * @full_page:
      * This member is used for V1-style full page grants, where either:
      *
-     * -- hdr.type is GTF_accept_transfer, or
-     * -- hdr.type is GTF_permit_access and GTF_sub_page is not set.
+     * - hdr.type is GTF_accept_transfer, or
+     * - hdr.type is GTF_permit_access and GTF_sub_page is not set.
      *
      * In that case, the frame field has the same semantics as the
      * field of the same name in the V1 entry structure.
@@ -247,7 +263,9 @@ union grant_entry_v2 {
         uint64_t frame;
     } full_page;
 
-    /*
+    /**
+     * @sub_page:
+     *
      * If the grant type is GTF_grant_access and GTF_sub_page is set,
      * @domid is allowed to access bytes [@page_off,@page_off+@length)
      * in frame @frame.
@@ -259,7 +277,9 @@ union grant_entry_v2 {
         uint64_t frame;
     } sub_page;
 
-    /*
+    /**
+     * @transitive:
+     *
      * If the grant is GTF_transitive, @domid is allowed to use the
      * grant @gref in domain @trans_domid, as if it was the local
      * domain.  Obviously, the transitive access must be compatible
@@ -275,7 +295,8 @@ union grant_entry_v2 {
         grant_ref_t gref;
     } transitive;
 
-    uint32_t __spacer[4]; /* Pad to a power of two */
+    /** @__spacer: Pad to a power of two */
+    uint32_t __spacer[4];
 };
 typedef union grant_entry_v2 grant_entry_v2_t;
 
@@ -283,16 +304,14 @@ typedef uint16_t grant_status_t;
 
 #endif /* __XEN_INTERFACE_VERSION__ */
 
-/***********************************
- * GRANT TABLE QUERIES AND USES
- */
-
-/* ` enum neg_errnoval
- * ` HYPERVISOR_grant_table_op(enum grant_table_op cmd,
- * `                           void *args,
- * `                           unsigned int count)
- * `
+/**
+ * DOC: GRANT TABLE QUERIES AND USES
  *
+ * enum neg_errnoval
+ * HYPERVISOR_grant_table_op(enum grant_table_op cmd,
+ *                           void *args,
+ *                           unsigned int count)
+ *  
  * @args points to an array of a per-command data structure. The array
  * has @count members
  */
@@ -315,16 +334,19 @@ typedef uint16_t grant_status_t;
 #endif /* __XEN_INTERFACE_VERSION__ */
 /* ` } */
 
-/*
+/**
+ * typedef
  * Handle to track a mapping created via a grant reference.
  */
 typedef uint32_t grant_handle_t;
 
-/*
- * GNTTABOP_map_grant_ref: Map the grant entry (<dom>,<ref>) for access
- * by devices and/or host CPUs. If successful, <handle> is a tracking number
- * that must be presented later to destroy the mapping(s). On error, <status>
- * is a negative status code.
+/**
+ * struct gnttab_map_grant_ref - GNTTABOP_map_grant_ref
+ *
+ * Map the grant entry (<dom>,<ref>) for access by devices and/or host
+ * CPUs. If successful, <handle> is a tracking number that must be
+ * presented later to destroy the mapping(s). On error, <status> is a
+ * negative status code.
  * NOTES:
  *  1. If GNTMAP_device_map is specified then <dev_bus_addr> is the address
  *     via which I/O devices may access the granted frame.
@@ -338,24 +360,31 @@ typedef uint32_t grant_handle_t;
  *     to be accounted to the correct grant reference!
  */
 struct gnttab_map_grant_ref {
-    /* IN parameters. */
+    /** @host_addr: IN parameter */
     uint64_t host_addr;
-    uint32_t flags;               /* GNTMAP_* */
+    /** @flags: IN parameter, GNTMAP_* */
+    uint32_t flags;
+    /** @ref: IN parameter */
     grant_ref_t ref;
+    /** @dom: IN parameter */
     domid_t  dom;
-    /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    /** @status: OUT parameter, enum grant_status */
+    int16_t  status;
+    /** @handle: OUT parameter */
     grant_handle_t handle;
+    /** @dev_bus_addr: OUT parameter */
     uint64_t dev_bus_addr;
 };
 typedef struct gnttab_map_grant_ref gnttab_map_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_map_grant_ref_t);
 
-/*
- * GNTTABOP_unmap_grant_ref: Destroy one or more grant-reference mappings
- * tracked by <handle>. If <host_addr> or <dev_bus_addr> is zero, that
- * field is ignored. If non-zero, they must refer to a device/host mapping
- * that is tracked by <handle>
+/**
+ * struct gnttab_unmap_grant_ref - GNTTABOP_unmap_grant_ref
+ *
+ * Destroy one or more grant-reference mappings tracked by <handle>. If
+ * <host_addr> or <dev_bus_addr> is zero, that field is ignored. If
+ * non-zero, they must refer to a device/host mapping that is tracked by
+ * <handle>
  * NOTES:
  *  1. The call may fail in an undefined manner if either mapping is not
  *     tracked by <handle>.
@@ -363,31 +392,37 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_map_grant_ref_t);
  *     mappings will remain in the device or host TLBs.
  */
 struct gnttab_unmap_grant_ref {
-    /* IN parameters. */
+    /** @host_addr: IN parameter */
     uint64_t host_addr;
+    /** @dev_bus_addr: IN parameter */
     uint64_t dev_bus_addr;
+    /** @handle: IN parameter */
     grant_handle_t handle;
-    /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    /** @status: OUT parameter, enum grant_status */
+    int16_t  status;
 };
 typedef struct gnttab_unmap_grant_ref gnttab_unmap_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_grant_ref_t);
 
-/*
- * GNTTABOP_setup_table: Set up a grant table for <dom> comprising at least
- * <nr_frames> pages. The frame addresses are written to the <frame_list>.
- * Only <nr_frames> addresses are written, even if the table is larger.
+/**
+ * struct gnttab_setup_table - GNTTABOP_setup_table
+ *
+ * Set up a grant table for <dom> comprising at least <nr_frames> pages.
+ * The frame addresses are written to the <frame_list>.  Only
+ * <nr_frames> addresses are written, even if the table is larger.
  * NOTES:
  *  1. <dom> may be specified as DOMID_SELF.
  *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
  *  3. Xen may not support more than a single grant-table page per domain.
  */
 struct gnttab_setup_table {
-    /* IN parameters. */
+    /** @dom: IN parameter */
     domid_t  dom;
+    /** @nr_frames: IN parameter */
     uint32_t nr_frames;
-    /* OUT parameters. */
+    /** @status: OUT parameter */
     int16_t  status;              /* => enum grant_status */
+    /** @frame_list: OUT parameter */
 #if __XEN_INTERFACE_VERSION__ < 0x00040300
     XEN_GUEST_HANDLE(ulong) frame_list;
 #else
@@ -397,21 +432,25 @@ struct gnttab_setup_table {
 typedef struct gnttab_setup_table gnttab_setup_table_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_setup_table_t);
 
-/*
- * GNTTABOP_dump_table: Dump the contents of the grant table to the
- * xen console. Debugging use only.
+/**
+ * struct gnttab_dump_table - GNTTABOP_dump_table
+ * 
+ * Dump the contents of the grant table to the xen console. Debugging
+ * use only.
  */
 struct gnttab_dump_table {
-    /* IN parameters. */
+    /** @dom: IN parameter */
     domid_t dom;
-    /* OUT parameters. */
-    int16_t status;               /* => enum grant_status */
+    /** @status: OUT parameter, enum grant_status */
+    int16_t status;
 };
 typedef struct gnttab_dump_table gnttab_dump_table_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_dump_table_t);
 
-/*
- * GNTTABOP_transfer: Transfer <frame> to a foreign domain. The foreign domain
+/**
+ * struct gnttab_transfer - GNTTABOP_transfer
+ *
+ * Transfer <frame> to a foreign domain. The foreign domain
  * has previously registered its interest in the transfer via <domid, ref>.
  *
  * Note that, even if the transfer fails, the specified page no longer belongs
@@ -420,19 +459,26 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_dump_table_t);
  * Note further that only PV guests can use this operation.
  */
 struct gnttab_transfer {
-    /* IN parameters. */
+    /** @mfn: IN parameter */
     xen_pfn_t     mfn;
+    /** @domid: IN parameter */
     domid_t       domid;
+    /** @ref: IN parameter */
     grant_ref_t   ref;
-    /* OUT parameters. */
+    /** @status: OUT parameter */
     int16_t       status;
 };
 typedef struct gnttab_transfer gnttab_transfer_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
 
 
-/*
- * GNTTABOP_copy: Hypervisor based copy
+#define _GNTCOPY_source_gref      (0)
+#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
+#define _GNTCOPY_dest_gref        (1)
+#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
+/**
+ * struct gnttab_copy - GNTTABOP_copy, Hypervisor based copy
+ *
  * source and destinations can be eithers MFNs or, for foreign domains,
  * grant references. the foreign domain has to grant read/write access
  * in its grant table.
@@ -448,14 +494,9 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
  * the offset in the target frame and  len specifies the number of
  * bytes to be copied.
  */
-
-#define _GNTCOPY_source_gref      (0)
-#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
-#define _GNTCOPY_dest_gref        (1)
-#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
-
 struct gnttab_copy {
-    /* IN parameters. */
+    /** @source: IN parameter */
+    /** @dest: IN parameter */
     struct gnttab_copy_ptr {
         union {
             grant_ref_t ref;
@@ -464,37 +505,44 @@ struct gnttab_copy {
         domid_t  domid;
         uint16_t offset;
     } source, dest;
+    /** @len: IN parameter */
     uint16_t      len;
-    uint16_t      flags;          /* GNTCOPY_* */
-    /* OUT parameters. */
+    /** @flags: IN parameter, GNTCOPY_* */
+    uint16_t      flags;
+    /** @status: OUT parameters. */
     int16_t       status;
 };
 typedef struct gnttab_copy  gnttab_copy_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_copy_t);
 
-/*
- * GNTTABOP_query_size: Query the current and maximum sizes of the shared
- * grant table.
+/**
+ * struct gnttab_query_size - GNTTABOP_query_size
+ *
+ * Query the current and maximum sizes of the shared grant table.
  * NOTES:
  *  1. <dom> may be specified as DOMID_SELF.
  *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
  */
 struct gnttab_query_size {
-    /* IN parameters. */
+    /** @dom: IN parameter */
     domid_t  dom;
-    /* OUT parameters. */
+    /** @nr_frames: OUT parameter */
     uint32_t nr_frames;
+    /** @max_nr_frames: OUT parameter */
     uint32_t max_nr_frames;
-    int16_t  status;              /* => enum grant_status */
+    /** @status: OUT parameter, enum grant_status */
+    int16_t  status;
 };
 typedef struct gnttab_query_size gnttab_query_size_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_t);
 
-/*
- * GNTTABOP_unmap_and_replace: Destroy one or more grant-reference mappings
- * tracked by <handle> but atomically replace the page table entry with one
- * pointing to the machine address under <new_addr>.  <new_addr> will be
- * redirected to the null entry.
+/**
+ * struct gnttab_unmap_and_replace - GNTTABOP_unmap_and_replace
+ *
+ * Destroy one or more grant-reference mappings tracked by <handle> but
+ * atomically replace the page table entry with one pointing to the
+ * machine address under <new_addr>.  <new_addr> will be redirected to
+ * the null entry.
  * NOTES:
  *  1. The call may fail in an undefined manner if either mapping is not
  *     tracked by <handle>.
@@ -502,36 +550,42 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_query_size_t);
  *     mappings will remain in the device or host TLBs.
  */
 struct gnttab_unmap_and_replace {
-    /* IN parameters. */
+    /** @host_addr: IN parameter */
     uint64_t host_addr;
+    /** @new_addr: IN parameter */
     uint64_t new_addr;
+    /** @handle: IN parameter */
     grant_handle_t handle;
-    /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    /** @status: OUT parameter, enum grant_status */
+    int16_t  status;
 };
 typedef struct gnttab_unmap_and_replace gnttab_unmap_and_replace_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_unmap_and_replace_t);
 
 #if __XEN_INTERFACE_VERSION__ >= 0x0003020a
-/*
- * GNTTABOP_set_version: Request a particular version of the grant
- * table shared table structure.  This operation may be used to toggle
- * between different versions, but must be performed while no grants
- * are active.  The only defined versions are 1 and 2.
+/**
+ * struct gnttab_set_version - GNTTABOP_set_version
+ *
+ * Request a particular version of the grant table shared table
+ * structure.  This operation may be used to toggle between different
+ * versions, but must be performed while no grants are active.  The only
+ * defined versions are 1 and 2.
  */
 struct gnttab_set_version {
-    /* IN/OUT parameters */
+    /** @version: IN/OUT parameter */
     uint32_t version;
 };
 typedef struct gnttab_set_version gnttab_set_version_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_set_version_t);
 
 
-/*
- * GNTTABOP_get_status_frames: Get the list of frames used to store grant
- * status for <dom>. In grant format version 2, the status is separated
- * from the other shared grant fields to allow more efficient synchronization
- * using barriers instead of atomic cmpexch operations.
+/**
+ * struct gnttab_get_status_frames - GNTTABOP_get_status_frames
+ *
+ * Get the list of frames used to store grant status for <dom>. In grant
+ * format version 2, the status is separated from the other shared grant
+ * fields to allow more efficient synchronization using barriers instead
+ * of atomic cmpexch operations.
  * <nr_frames> specify the size of vector <frame_list>.
  * The frame addresses are returned in the <frame_list>.
  * Only <nr_frames> addresses are returned, even if the table is larger.
@@ -540,44 +594,53 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_set_version_t);
  *  2. Only a sufficiently-privileged domain may specify <dom> != DOMID_SELF.
  */
 struct gnttab_get_status_frames {
-    /* IN parameters. */
+    /** @nr_frames: IN parameter */
     uint32_t nr_frames;
+    /** @dom: IN parameter */
     domid_t  dom;
-    /* OUT parameters. */
-    int16_t  status;              /* => enum grant_status */
+    /** @status: OUT parameter, enum grant_status */
+    int16_t  status;
+    /** @frame_list: OUT parameter */
     XEN_GUEST_HANDLE(uint64_t) frame_list;
 };
 typedef struct gnttab_get_status_frames gnttab_get_status_frames_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_get_status_frames_t);
 
-/*
- * GNTTABOP_get_version: Get the grant table version which is in
- * effect for domain <dom>.
+/**
+ * struct gnttab_get_version - GNTTABOP_get_version
+ *
+ * Get the grant table version which is in effect for domain <dom>.
  */
 struct gnttab_get_version {
-    /* IN parameters */
+    /** @dom: IN parameters */
     domid_t dom;
+    /** @pad: padding */
     uint16_t pad;
-    /* OUT parameters */
+    /** @version: OUT parameter */
     uint32_t version;
 };
 typedef struct gnttab_get_version gnttab_get_version_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_get_version_t);
 
-/*
- * GNTTABOP_swap_grant_ref: Swap the contents of two grant entries.
+/**
+ * struct gnttab_swap_grant_ref - GNTTABOP_swap_grant_ref
+ *
+ * Swap the contents of two grant entries.
  */
 struct gnttab_swap_grant_ref {
-    /* IN parameters */
+    /** @ref_a: IN parameter */
     grant_ref_t ref_a;
+    /** @ref_b: IN parameter */
     grant_ref_t ref_b;
-    /* OUT parameters */
-    int16_t status;             /* => enum grant_status */
+    /** @status: OUT parameter, enum grant_status */
+    int16_t status;
 };
 typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
 DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
 
-/*
+/**
+ * struct gnttab_cache_flush - GNTTABOP_cache_flush
+ *
  * Issue one or more cache maintenance operations on a portion of a
  * page granted to the calling domain by a foreign domain.
  */
@@ -598,61 +661,69 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_cache_flush_t);
 
 #endif /* __XEN_INTERFACE_VERSION__ */
 
-/*
- * Bitfield values for gnttab_map_grant_ref.flags.
+/**
+ * DOC: Bitfield values for gnttab_map_grant_ref.flags.
+ *
+ * - GNTMAP_device_map: Map the grant entry for access by I/O devices.
+ * - GNTMAP_host_map: Map the grant entry for access by host CPUs.
+ * - GNTMAP_readonly: Accesses to the granted frame will be restricted to read-only access.
+ * - GNTMAP_host_map: 0 => The host mapping is usable only by the guest OS
+ *                    1 => The host mapping is usable by guest OS + current application.
+ * - GNTMAP_contains_pte: 0 => This map request contains a host virtual address.
+ *                        1 => This map request contains the machine addess of the PTE to update.
+ * - GNTMAP_can_fail
+ * - GNTMAP_guest_avail_mask: Bits to be placed in guest kernel available PTE bits
+ *                            (architecture dependent; only supported when
+ *                             XENFEAT_gnttab_map_avail_bits is set).
  */
- /* Map the grant entry for access by I/O devices. */
 #define _GNTMAP_device_map      (0)
 #define GNTMAP_device_map       (1<<_GNTMAP_device_map)
- /* Map the grant entry for access by host CPUs. */
 #define _GNTMAP_host_map        (1)
 #define GNTMAP_host_map         (1<<_GNTMAP_host_map)
- /* Accesses to the granted frame will be restricted to read-only access. */
 #define _GNTMAP_readonly        (2)
 #define GNTMAP_readonly         (1<<_GNTMAP_readonly)
- /*
-  * GNTMAP_host_map subflag:
-  *  0 => The host mapping is usable only by the guest OS.
-  *  1 => The host mapping is usable by guest OS + current application.
-  */
 #define _GNTMAP_application_map (3)
 #define GNTMAP_application_map  (1<<_GNTMAP_application_map)
-
- /*
-  * GNTMAP_contains_pte subflag:
-  *  0 => This map request contains a host virtual address.
-  *  1 => This map request contains the machine addess of the PTE to update.
-  */
 #define _GNTMAP_contains_pte    (4)
 #define GNTMAP_contains_pte     (1<<_GNTMAP_contains_pte)
-
 #define _GNTMAP_can_fail        (5)
 #define GNTMAP_can_fail         (1<<_GNTMAP_can_fail)
-
-/*
- * Bits to be placed in guest kernel available PTE bits (architecture
- * dependent; only supported when XENFEAT_gnttab_map_avail_bits is set).
- */
 #define _GNTMAP_guest_avail0    (16)
 #define GNTMAP_guest_avail_mask ((uint32_t)~0 << _GNTMAP_guest_avail0)
 
-/*
- * Values for error status returns. All errors are -ve.
+/**
+ * DOC: Values for error status returns. All errors are -ve.
+ *
+ *
+ * - GNTST_okay: Normal return.
+ * - GNTST_general_error: General undefined error.
+ * - GNTST_bad_domain: Unrecognsed domain id.
+ * - GNTST_bad_gntref: Unrecognised or inappropriate gntref.
+ * - GNTST_bad_handle: Unrecognised or inappropriate handle.
+ * - GNTST_bad_virt_addr: Inappropriate virtual address to map.
+ * - GNTST_bad_dev_addr: Inappropriate device address to unmap.
+ * - GNTST_no_device_space: Out of space in I/O MMU.
+ * - GNTST_permission_denied: Not enough privilege for operation.
+ * - GNTST_bad_page: Specified page was invalid for op.
+ * - GNTST_bad_copy_arg: copy arguments cross page boundary.
+ * - GNTST_address_too_big: transfer page address too large.
+ * - GNTST_eagain: Operation not done; try again.
+ *
  */
 /* ` enum grant_status { */
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
+#define GNTST_okay             (0)
+#define GNTST_general_error    (-1)
+#define GNTST_bad_domain       (-2)
+#define GNTST_bad_gntref       (-3)
+#define GNTST_bad_handle       (-4)
+#define GNTST_bad_virt_addr    (-5)
+#define GNTST_bad_dev_addr     (-6)
+#define GNTST_no_device_space  (-7)
+#define GNTST_permission_denied (-8)
+#define GNTST_bad_page         (-9)
+#define GNTST_bad_copy_arg    (-10)
+#define GNTST_address_too_big (-11)
+#define GNTST_eagain          (-12)
 /* ` } */
 
 #define GNTTABOP_error_msgs {                   \
-- 
2.17.1


