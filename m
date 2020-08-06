Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2237C23E4CD
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 01:50:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3pdu-0004NB-JR; Thu, 06 Aug 2020 23:49:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=flvv=BQ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k3pds-0004FE-Ml
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 23:49:48 +0000
X-Inumbo-ID: 64cc51bb-e701-4fd5-b585-337cf1a47716
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 64cc51bb-e701-4fd5-b585-337cf1a47716;
 Thu, 06 Aug 2020 23:49:41 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s.hsd1.ca.comcast.net
 (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9854122D0A;
 Thu,  6 Aug 2020 23:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596757781;
 bh=1i0A/yLeRs9Euo2cflhW8+2Che9bifUajcXNkMOKeGQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tfhsB1inKyz8eryNqcRz+jhO914SuQXY2t1YjsML6HAVwBm+YUw2HCSOBgutT1gV5
 rDZnrJHVBJIErHF1AG1cSHH5PFwf4ohzT5XVt8lhjrpvYm6XPO2rdIEtXYm4rhownV
 HkAZV1Z31KMZbjiD7nVlo70eU1idlPlcly/PupqA=
From: Stefano Stabellini <sstabellini@kernel.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 08/14] kernel-doc: public/memory.h
Date: Thu,  6 Aug 2020 16:49:27 -0700
Message-Id: <20200806234933.16448-8-sstabellini@kernel.org>
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
 xen/include/public/memory.h | 232 ++++++++++++++++++++++++------------
 1 file changed, 155 insertions(+), 77 deletions(-)

diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 21057ed78e..4c57ed213c 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -30,7 +30,9 @@
 #include "xen.h"
 #include "physdev.h"
 
-/*
+/**
+ * DOC: XENMEM_increase_reservation and XENMEM_decrease_reservation
+ *
  * Increase or decrease the specified domain's memory reservation. Returns the
  * number of extents successfully allocated or freed.
  * arg == addr of struct xen_memory_reservation.
@@ -40,29 +42,37 @@
 #define XENMEM_populate_physmap     6
 
 #if __XEN_INTERFACE_VERSION__ >= 0x00030209
-/*
- * Maximum # bits addressable by the user of the allocated region (e.g., I/O
- * devices often have a 32-bit limitation even in 64-bit systems). If zero
- * then the user has no addressing restriction. This field is not used by
- * XENMEM_decrease_reservation.
+/**
+ * DOC: XENMEMF_*
+ *
+ * - XENMEMF_address_bits, XENMEMF_get_address_bits:
+ *       Maximum # bits addressable by the user of the allocated region
+ *       (e.g., I/O devices often have a 32-bit limitation even in 64-bit
+ *       systems). If zero then the user has no addressing restriction. This
+ *       field is not used by XENMEM_decrease_reservation.
+ * - XENMEMF_node, XENMEMF_get_node: NUMA node to allocate from
+ * - XENMEMF_populate_on_demand: Flag to populate physmap with populate-on-demand entries
+ * - XENMEMF_exact_node_request, XENMEMF_exact_node: Flag to request allocation only from the node specified
+ * - XENMEMF_vnode: Flag to indicate the node specified is virtual node
  */
 #define XENMEMF_address_bits(x)     (x)
 #define XENMEMF_get_address_bits(x) ((x) & 0xffu)
-/* NUMA node to allocate from. */
 #define XENMEMF_node(x)     (((x) + 1) << 8)
 #define XENMEMF_get_node(x) ((((x) >> 8) - 1) & 0xffu)
-/* Flag to populate physmap with populate-on-demand entries */
 #define XENMEMF_populate_on_demand (1<<16)
-/* Flag to request allocation only from the node specified */
 #define XENMEMF_exact_node_request  (1<<17)
 #define XENMEMF_exact_node(n) (XENMEMF_node(n) | XENMEMF_exact_node_request)
-/* Flag to indicate the node specified is virtual node */
 #define XENMEMF_vnode  (1<<18)
 #endif
 
+/**
+ * struct xen_memory_reservation
+ */
 struct xen_memory_reservation {
 
-    /*
+    /**
+     * @extent_start:
+     *
      * XENMEM_increase_reservation:
      *   OUT: MFN (*not* GMFN) bases of extents that were allocated
      * XENMEM_decrease_reservation:
@@ -76,18 +86,20 @@ struct xen_memory_reservation {
      */
     XEN_GUEST_HANDLE(xen_pfn_t) extent_start;
 
-    /* Number of extents, and size/alignment of each (2^extent_order pages). */
+    /** @nr_extents: Number of extents, and size/alignment of each (2^extent_order pages). */
     xen_ulong_t    nr_extents;
     unsigned int   extent_order;
 
 #if __XEN_INTERFACE_VERSION__ >= 0x00030209
-    /* XENMEMF flags. */
+    /** @mem_flags: XENMEMF flags. */
     unsigned int   mem_flags;
 #else
     unsigned int   address_bits;
 #endif
 
-    /*
+    /**
+     * @domid:
+     *
      * Domain whose reservation is being changed.
      * Unprivileged domains can specify only DOMID_SELF.
      */
@@ -96,7 +108,10 @@ struct xen_memory_reservation {
 typedef struct xen_memory_reservation xen_memory_reservation_t;
 DEFINE_XEN_GUEST_HANDLE(xen_memory_reservation_t);
 
-/*
+#define XENMEM_exchange             11
+/**
+ * struct xen_memory_exchange - XENMEM_exchange
+ *
  * An atomic exchange of memory pages. If return code is zero then
  * @out.extent_list provides GMFNs of the newly-allocated memory.
  * Returns zero on complete success, otherwise a negative error code.
@@ -105,15 +120,18 @@ DEFINE_XEN_GUEST_HANDLE(xen_memory_reservation_t);
  *
  * Note that only PV guests can use this operation.
  */
-#define XENMEM_exchange             11
 struct xen_memory_exchange {
-    /*
+    /**
+     * @in:
+     *
      * [IN] Details of memory extents to be exchanged (GMFN bases).
      * Note that @in.address_bits is ignored and unused.
      */
     struct xen_memory_reservation in;
 
-    /*
+    /**
+     * @out:
+     *
      * [IN/OUT] Details of new memory extents.
      * We require that:
      *  1. @in.domid == @out.domid
@@ -125,7 +143,9 @@ struct xen_memory_exchange {
      */
     struct xen_memory_reservation out;
 
-    /*
+    /**
+     * @nr_exchanged:
+     *
      * [OUT] Number of input extents that were successfully exchanged:
      *  1. The first @nr_exchanged input extents were successfully
      *     deallocated.
@@ -141,14 +161,18 @@ struct xen_memory_exchange {
 typedef struct xen_memory_exchange xen_memory_exchange_t;
 DEFINE_XEN_GUEST_HANDLE(xen_memory_exchange_t);
 
-/*
+/**
+ * DOC: XENMEM_maximum_ram_page
+ *
  * Returns the maximum machine frame number of mapped RAM in this system.
  * This command always succeeds (it never returns an error code).
  * arg == NULL.
  */
 #define XENMEM_maximum_ram_page     2
 
-/*
+/**
+ * DOC: XENMEM_current_reservation and XENMEM_maximum_reservation
+ *
  * Returns the current or maximum memory reservation, in pages, of the
  * specified domain (may be DOMID_SELF). Returns -ve errcode on failure.
  * arg == addr of domid_t.
@@ -156,33 +180,43 @@ DEFINE_XEN_GUEST_HANDLE(xen_memory_exchange_t);
 #define XENMEM_current_reservation  3
 #define XENMEM_maximum_reservation  4
 
-/*
+/**
+ * DOC: XENMEM_maximum_gpfn
+ *
  * Returns the maximum GPFN in use by the guest, or -ve errcode on failure.
  */
 #define XENMEM_maximum_gpfn         14
 
-/*
+#define XENMEM_machphys_mfn_list    5
+/**
+ * struct xen_machphys_mfn_list - XENMEM_machphys_mfn_list
+ *
  * Returns a list of MFN bases of 2MB extents comprising the machine_to_phys
  * mapping table. Architectures which do not have a m2p table do not implement
  * this command.
  * arg == addr of xen_machphys_mfn_list_t.
  */
-#define XENMEM_machphys_mfn_list    5
 struct xen_machphys_mfn_list {
-    /*
+    /**
+     * @max_extents:
+     *
      * Size of the 'extent_start' array. Fewer entries will be filled if the
      * machphys table is smaller than max_extents * 2MB.
      */
     unsigned int max_extents;
 
-    /*
+    /**
+     * @extent_start:
+     *
      * Pointer to buffer to fill with list of extent starts. If there are
      * any large discontiguities in the machine address space, 2MB gaps in
      * the machphys table will be represented by an MFN base of zero.
      */
     XEN_GUEST_HANDLE(xen_pfn_t) extent_start;
 
-    /*
+    /**
+     * @nr_extents:
+     *
      * Number of extents written to the above array. This will be smaller
      * than 'max_extents' if the machphys table is smaller than max_e * 2MB.
      */
@@ -191,7 +225,9 @@ struct xen_machphys_mfn_list {
 typedef struct xen_machphys_mfn_list xen_machphys_mfn_list_t;
 DEFINE_XEN_GUEST_HANDLE(xen_machphys_mfn_list_t);
 
-/*
+/**
+ * DOC: XENMEM_machphys_compat_mfn_list
+ *
  * For a compat caller, this is identical to XENMEM_machphys_mfn_list.
  *
  * For a non compat caller, this functions similarly to
@@ -200,90 +236,115 @@ DEFINE_XEN_GUEST_HANDLE(xen_machphys_mfn_list_t);
  */
 #define XENMEM_machphys_compat_mfn_list     25
 
-/*
+#define XENMEM_machphys_mapping     12
+/**
+ * struct xen_machphys_mapping - XENMEM_machphys_mapping
+ *
  * Returns the location in virtual address space of the machine_to_phys
  * mapping table. Architectures which do not have a m2p table, or which do not
  * map it by default into guest address space, do not implement this command.
  * arg == addr of xen_machphys_mapping_t.
  */
-#define XENMEM_machphys_mapping     12
 struct xen_machphys_mapping {
+    /** @v_start: Start virtual address */
     xen_ulong_t v_start, v_end; /* Start and end virtual addresses.   */
-    xen_ulong_t max_mfn;        /* Maximum MFN that can be looked up. */
+    /** @v_end: End virtual addresses */
+    xen_ulong_t v_end;
+    /** @max_mfn: Maximum MFN that can be looked up */
+    xen_ulong_t max_mfn;
 };
 typedef struct xen_machphys_mapping xen_machphys_mapping_t;
 DEFINE_XEN_GUEST_HANDLE(xen_machphys_mapping_t);
 
-/* Source mapping space. */
+/**
+ * DOC: Source mapping space.
+ *
+ * - XENMAPSPACE_shared_info:  shared info page
+ * - XENMAPSPACE_grant_table:  grant table page
+ * - XENMAPSPACE_gmfn:         GMFN
+ * - XENMAPSPACE_gmfn_range:   GMFN range, XENMEM_add_to_physmap only.
+ * - XENMAPSPACE_gmfn_foreign: GMFN from another dom,
+ *                             XENMEM_add_to_physmap_batch only.
+ * - XENMAPSPACE_dev_mmio:     device mmio region ARM only; the region is mapped
+ *                             in Stage-2 using the Normal MemoryInner/Outer
+ *                             Write-Back Cacheable memory attribute.
+ */
 /* ` enum phys_map_space { */
-#define XENMAPSPACE_shared_info  0 /* shared info page */
-#define XENMAPSPACE_grant_table  1 /* grant table page */
-#define XENMAPSPACE_gmfn         2 /* GMFN */
-#define XENMAPSPACE_gmfn_range   3 /* GMFN range, XENMEM_add_to_physmap only. */
-#define XENMAPSPACE_gmfn_foreign 4 /* GMFN from another dom,
-                                    * XENMEM_add_to_physmap_batch only. */
-#define XENMAPSPACE_dev_mmio     5 /* device mmio region
-                                      ARM only; the region is mapped in
-                                      Stage-2 using the Normal Memory
-                                      Inner/Outer Write-Back Cacheable
-                                      memory attribute. */
+#define XENMAPSPACE_shared_info  0
+#define XENMAPSPACE_grant_table  1
+#define XENMAPSPACE_gmfn         2
+#define XENMAPSPACE_gmfn_range   3
+#define XENMAPSPACE_gmfn_foreign 4
+#define XENMAPSPACE_dev_mmio     5
 /* ` } */
 
-/*
+#define XENMEM_add_to_physmap      7
+/**
+ * struct xen_add_to_physmap - XENMEM_add_to_physmap
+ *
  * Sets the GPFN at which a particular page appears in the specified guest's
  * physical address space (translated guests only).
  * arg == addr of xen_add_to_physmap_t.
  */
-#define XENMEM_add_to_physmap      7
 struct xen_add_to_physmap {
-    /* Which domain to change the mapping for. */
+    /** @domid: Which domain to change the mapping for. */
     domid_t domid;
 
-    /* Number of pages to go through for gmfn_range */
+    /** @size: Number of pages to go through for gmfn_range */
     uint16_t    size;
 
-    unsigned int space; /* => enum phys_map_space */
+    /** @space: enum phys_map_space */
+    unsigned int space;
 
 #define XENMAPIDX_grant_table_status 0x80000000
 
-    /* Index into space being mapped. */
+    /** @idx: Index into space being mapped. */
     xen_ulong_t idx;
 
-    /* GPFN in domid where the source mapping page should appear. */
+    /** @gpfn: GPFN in domid where the source mapping page should appear. */
     xen_pfn_t     gpfn;
 };
 typedef struct xen_add_to_physmap xen_add_to_physmap_t;
 DEFINE_XEN_GUEST_HANDLE(xen_add_to_physmap_t);
 
-/* A batched version of add_to_physmap. */
 #define XENMEM_add_to_physmap_batch 23
+/**
+ * struct xen_add_to_physmap_batch - XENMEM_add_to_physmap_batch
+ *
+ * A batched version of add_to_physmap.
+ */
 struct xen_add_to_physmap_batch {
-    /* IN */
-    /* Which domain to change the mapping for. */
+    /** @domid: IN, which domain to change the mapping for */
     domid_t domid;
-    uint16_t space; /* => enum phys_map_space */
+    /** @space: IN, enum phys_map_space */
+    uint16_t space;
 
-    /* Number of pages to go through */
+    /** @size: IN, Number of pages to go through */
     uint16_t size;
 
 #if __XEN_INTERFACE_VERSION__ < 0x00040700
-    domid_t foreign_domid; /* IFF gmfn_foreign. Should be 0 for other spaces. */
+    /** @foreign_domid: IN, iff gmfn_foreign. Should be 0 for other spaces. */
+    domid_t foreign_domid;
 #else
+    /**
+     * @u: IN
+     *
+     * - u.foreign_domid: gmfn_foreign
+     * - u.res0: All the other spaces. Should be 0
+     */
     union xen_add_to_physmap_batch_extra {
-        domid_t foreign_domid; /* gmfn_foreign */
-        uint16_t res0;  /* All the other spaces. Should be 0 */
+        domid_t foreign_domid;
+        uint16_t res0;
     } u;
 #endif
 
-    /* Indexes into space being mapped. */
+    /** @idxs: IN, Indexes into space being mapped. */
     XEN_GUEST_HANDLE(xen_ulong_t) idxs;
 
-    /* GPFN in domid where the source mapping page should appear. */
+    /** @gpfns: IN, GPFN in domid where the source mapping page should appear. */
     XEN_GUEST_HANDLE(xen_pfn_t) gpfns;
 
-    /* OUT */
-
-    /* Per index error code. */
+    /** @errs: OUT, Per index error code. */
     XEN_GUEST_HANDLE(int) errs;
 };
 typedef struct xen_add_to_physmap_batch xen_add_to_physmap_batch_t;
@@ -296,17 +357,19 @@ typedef struct xen_add_to_physmap_batch xen_add_to_physmap_range_t;
 DEFINE_XEN_GUEST_HANDLE(xen_add_to_physmap_range_t);
 #endif
 
-/*
+#define XENMEM_remove_from_physmap      15
+/**
+ * struct xen_remove_from_physmap - XENMEM_remove_from_physmap
+ *
  * Unmaps the page appearing at a particular GPFN from the specified guest's
  * physical address space (translated guests only).
  * arg == addr of xen_remove_from_physmap_t.
  */
-#define XENMEM_remove_from_physmap      15
 struct xen_remove_from_physmap {
-    /* Which domain to change the mapping for. */
+    /** @domid: Which domain to change the mapping for. */
     domid_t domid;
 
-    /* GPFN of the current mapping of the page. */
+    /** @gpfn: GPFN of the current mapping of the page. */
     xen_pfn_t     gpfn;
 };
 typedef struct xen_remove_from_physmap xen_remove_from_physmap_t;
@@ -315,21 +378,27 @@ DEFINE_XEN_GUEST_HANDLE(xen_remove_from_physmap_t);
 /*** REMOVED ***/
 /*#define XENMEM_translate_gpfn_list  8*/
 
-/*
+#define XENMEM_memory_map           9
+/**
+ * struct xen_memory_map - XENMEM_memory_map
+ *
  * Returns the pseudo-physical memory map as it was when the domain
  * was started (specified by XENMEM_set_memory_map).
  * arg == addr of xen_memory_map_t.
  */
-#define XENMEM_memory_map           9
 struct xen_memory_map {
-    /*
+    /**
+     * @nr_entries:
+     *
      * On call the number of entries which can be stored in buffer. On
      * return the number of entries which have been stored in
      * buffer.
      */
     unsigned int nr_entries;
 
-    /*
+    /**
+     * @buffer:
+     *
      * Entries in the buffer are in the same format as returned by the
      * BIOS INT 0x15 EAX=0xE820 call.
      */
@@ -338,7 +407,9 @@ struct xen_memory_map {
 typedef struct xen_memory_map xen_memory_map_t;
 DEFINE_XEN_GUEST_HANDLE(xen_memory_map_t);
 
-/*
+/**
+ * DOC: XENMEM_machine_memory_map
+ *
  * Returns the real physical memory map. Passes the same structure as
  * XENMEM_memory_map.
  * Specifying buffer as NULL will return the number of entries required
@@ -347,12 +418,14 @@ DEFINE_XEN_GUEST_HANDLE(xen_memory_map_t);
  */
 #define XENMEM_machine_memory_map   10
 
-/*
+#define XENMEM_set_memory_map       13
+/**
+ * struct xen_foreign_memory_map - XENMEM_set_memory_map
+ *
  * Set the pseudo-physical memory map of a domain, as returned by
  * XENMEM_memory_map.
  * arg == addr of xen_foreign_memory_map_t.
  */
-#define XENMEM_set_memory_map       13
 struct xen_foreign_memory_map {
     domid_t domid;
     struct xen_memory_map map;
@@ -362,14 +435,19 @@ DEFINE_XEN_GUEST_HANDLE(xen_foreign_memory_map_t);
 
 #define XENMEM_set_pod_target       16
 #define XENMEM_get_pod_target       17
+/**
+ * struct xen_pod_target - XENMEM_set_pod_target and XENMEM_get_pod_target
+ */
 struct xen_pod_target {
-    /* IN */
+    /** @target_pages: IN */
     uint64_t target_pages;
-    /* OUT */
+    /** @tot_pages: OUT */
     uint64_t tot_pages;
+    /** @pod_cache_pages: OUT */
     uint64_t pod_cache_pages;
+    /** @pod_entries: OUT */
     uint64_t pod_entries;
-    /* IN */
+    /** @domid: IN */
     domid_t domid;
 };
 typedef struct xen_pod_target xen_pod_target_t;
-- 
2.17.1


