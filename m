Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A2789E60F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Apr 2024 01:27:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702876.1098511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruKrB-0001Hr-ED; Tue, 09 Apr 2024 23:26:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702876.1098511; Tue, 09 Apr 2024 23:26:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ruKrB-0001FN-Av; Tue, 09 Apr 2024 23:26:25 +0000
Received: by outflank-mailman (input) for mailman id 702876;
 Tue, 09 Apr 2024 23:26:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0ECT=LO=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ruKrA-0001FD-7S
 for xen-devel@lists.xenproject.org; Tue, 09 Apr 2024 23:26:24 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9155a8cf-f6c8-11ee-94a3-07e782e9044d;
 Wed, 10 Apr 2024 01:26:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0E7D5612AE;
 Tue,  9 Apr 2024 23:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 846D3C433C7;
 Tue,  9 Apr 2024 23:26:16 +0000 (UTC)
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
X-Inumbo-ID: 9155a8cf-f6c8-11ee-94a3-07e782e9044d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712705177;
	bh=FXFImw6hVZA59zy9LM1OBN47ZZKg6swmiXrPdR4UCrM=;
	h=Date:From:To:cc:Subject:From;
	b=grPtCGY+emicLIT8yTAOULiBr3VFlSvq40kW0s8Fsqni5evlXuXD2FHhjRWjpLNop
	 fUsyw/Rpqv0w5lZlPZaXZWWojC/r4jdziuDtkC7wgfNN8/h1NPPLqNMS0MegdKWaYm
	 1CrchjIc4Mz6R5fRdWiAgSfNzJT2D/SMEu0wRAUEGfrRZNBkwVdjSKM2q6MseUYXf0
	 I5pYagNwUh0pZ9JEYzvYsJEkKHvorOVVfzLclhfSpnZlYxI4L1puyGl4Lt2ammyzTn
	 aDiEGsjM1GV//wnyvKWYLNTDP79GEoBUe1WstzstPweHxwUNf6GKXwEcYviyjH1G/h
	 bP4EI//FIV/7A==
Date: Tue, 9 Apr 2024 16:26:15 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: xen-devel@lists.xenproject.org
cc: sstabellini@kernel.org, andrew.cooper3@citrix.com, 
    bertrand.marquis@arm.com, george.dunlap@citrix.com, jbeulich@suse.com, 
    julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com
Subject: [PATCH] xen/public: s/int/int32_t
Message-ID: <alpine.DEB.2.22.394.2404091625170.711344@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


>From 28f83c4ec0c0b5c1e7eb2bd8bc5dc3190314a5b7 Mon Sep 17 00:00:00 2001
From: Stefano Stabellini <stefano.stabellini@amd.com>
Date: Tue, 9 Apr 2024 16:19:21 -0700
Subject: [PATCH] public: s/int/int32_t

Straightforward int -> int32_t and unsigned int -> uint32_t replacements
in public headers. No ABI or semantic changes intended.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/include/public/kexec.h   |  8 ++++----
 xen/include/public/memory.h  | 24 ++++++++++++------------
 xen/include/public/physdev.h | 18 +++++++++---------
 xen/include/public/sched.h   |  6 +++---
 xen/include/public/vcpu.h    |  2 +-
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index 40d79e936b..8d2a0ef697 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -105,7 +105,7 @@ typedef struct xen_kexec_image {
  */
 #define KEXEC_CMD_kexec                 0
 typedef struct xen_kexec_exec {
-    int type;
+    int32_t type;
 } xen_kexec_exec_t;
 
 /*
@@ -116,7 +116,7 @@ typedef struct xen_kexec_exec {
 #define KEXEC_CMD_kexec_load_v1         1 /* obsolete since 0x00040400 */
 #define KEXEC_CMD_kexec_unload_v1       2 /* obsolete since 0x00040400 */
 typedef struct xen_kexec_load_v1 {
-    int type;
+    int32_t type;
     xen_kexec_image_t image;
 } xen_kexec_load_v1_t;
 
@@ -143,8 +143,8 @@ typedef struct xen_kexec_load_v1 {
  */
 #define KEXEC_CMD_kexec_get_range       3
 typedef struct xen_kexec_range {
-    int range;
-    int nr;
+    int32_t range;
+    int32_t nr;
     unsigned long size;
     unsigned long start;
 } xen_kexec_range_t;
diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
index 5e545ae9a4..9eb67d231d 100644
--- a/xen/include/public/memory.h
+++ b/xen/include/public/memory.h
@@ -61,13 +61,13 @@ struct xen_memory_reservation {
 
     /* Number of extents, and size/alignment of each (2^extent_order pages). */
     xen_ulong_t    nr_extents;
-    unsigned int   extent_order;
+    uint32_t       extent_order;
 
 #if __XEN_INTERFACE_VERSION__ >= 0x00030209
     /* XENMEMF flags. */
-    unsigned int   mem_flags;
+    uint32_t       mem_flags;
 #else
-    unsigned int   address_bits;
+    uint32_t       address_bits;
 #endif
 
     /*
@@ -163,7 +163,7 @@ struct xen_machphys_mfn_list {
      * Size of the 'extent_start' array. Fewer entries will be filled if the
      * machphys table is smaller than max_extents * 2MB.
      */
-    unsigned int max_extents;
+    uint32_t max_extents;
 
     /*
      * Pointer to buffer to fill with list of extent starts. If there are
@@ -176,7 +176,7 @@ struct xen_machphys_mfn_list {
      * Number of extents written to the above array. This will be smaller
      * than 'max_extents' if the machphys table is smaller than max_e * 2MB.
      */
-    unsigned int nr_extents;
+    uint32_t nr_extents;
 };
 typedef struct xen_machphys_mfn_list xen_machphys_mfn_list_t;
 DEFINE_XEN_GUEST_HANDLE(xen_machphys_mfn_list_t);
@@ -232,7 +232,7 @@ struct xen_add_to_physmap {
     /* Number of pages to go through for gmfn_range */
     uint16_t    size;
 
-    unsigned int space; /* => enum phys_map_space */
+    uint32_t    space; /* => enum phys_map_space */
 
 #define XENMAPIDX_grant_table_status 0x80000000U
 
@@ -274,7 +274,7 @@ struct xen_add_to_physmap_batch {
     /* OUT */
 
     /* Per index error code. */
-    XEN_GUEST_HANDLE(int) errs;
+    XEN_GUEST_HANDLE(int32_t) errs;
 };
 typedef struct xen_add_to_physmap_batch xen_add_to_physmap_batch_t;
 DEFINE_XEN_GUEST_HANDLE(xen_add_to_physmap_batch_t);
@@ -317,7 +317,7 @@ struct xen_memory_map {
      * return the number of entries which have been stored in
      * buffer.
      */
-    unsigned int nr_entries;
+    uint32_t nr_entries;
 
     /*
      * Entries in the buffer are in the same format as returned by the
@@ -591,7 +591,7 @@ struct xen_reserved_device_memory_map {
      * Gets set to the required number of entries when too low,
      * signaled by error code -ERANGE.
      */
-    unsigned int nr_entries;
+    uint32_t nr_entries;
     /* OUT */
     XEN_GUEST_HANDLE(xen_reserved_device_memory_t) buffer;
     /* IN */
@@ -711,9 +711,9 @@ struct xen_vnuma_topology_info {
     domid_t domid;
     uint16_t pad;
     /* IN/OUT */
-    unsigned int nr_vnodes;
-    unsigned int nr_vcpus;
-    unsigned int nr_vmemranges;
+    uint32_t nr_vnodes;
+    uint32_t nr_vcpus;
+    uint32_t nr_vmemranges;
     /* OUT */
     union {
         XEN_GUEST_HANDLE(uint) h;
diff --git a/xen/include/public/physdev.h b/xen/include/public/physdev.h
index f0c0d4727c..03ccf86618 100644
--- a/xen/include/public/physdev.h
+++ b/xen/include/public/physdev.h
@@ -142,17 +142,17 @@ DEFINE_XEN_GUEST_HANDLE(physdev_irq_t);
 struct physdev_map_pirq {
     domid_t domid;
     /* IN */
-    int type;
+    int32_t type;
     /* IN (ignored for ..._MULTI_MSI) */
-    int index;
+    int32_t index;
     /* IN or OUT */
-    int pirq;
+    int32_t pirq;
     /* IN - high 16 bits hold segment for ..._MSI_SEG and ..._MULTI_MSI */
-    int bus;
+    int32_t bus;
     /* IN */
-    int devfn;
+    int32_t devfn;
     /* IN (also OUT for ..._MULTI_MSI) */
-    int entry_nr;
+    int32_t entry_nr;
     /* IN */
     uint64_t table_base;
 };
@@ -163,7 +163,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_map_pirq_t);
 struct physdev_unmap_pirq {
     domid_t domid;
     /* IN */
-    int pirq;
+    int32_t pirq;
 };
 
 typedef struct physdev_unmap_pirq physdev_unmap_pirq_t;
@@ -224,7 +224,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_op_t);
 
 #define PHYSDEVOP_setup_gsi    21
 struct physdev_setup_gsi {
-    int gsi;
+    int32_t gsi;
     /* IN */
     uint8_t triggering;
     /* IN */
@@ -242,7 +242,7 @@ DEFINE_XEN_GUEST_HANDLE(physdev_setup_gsi_t);
 #define PHYSDEVOP_get_free_pirq    23
 struct physdev_get_free_pirq {
     /* IN */
-    int type;
+    int32_t type;
     /* OUT */
     uint32_t pirq;
 };
diff --git a/xen/include/public/sched.h b/xen/include/public/sched.h
index b4362c6a1d..57ac3df47b 100644
--- a/xen/include/public/sched.h
+++ b/xen/include/public/sched.h
@@ -116,14 +116,14 @@
 /* ` } */
 
 struct sched_shutdown {
-    unsigned int reason; /* SHUTDOWN_* => enum sched_shutdown_reason */
+    uint32_t reason; /* SHUTDOWN_* => enum sched_shutdown_reason */
 };
 typedef struct sched_shutdown sched_shutdown_t;
 DEFINE_XEN_GUEST_HANDLE(sched_shutdown_t);
 
 struct sched_poll {
     XEN_GUEST_HANDLE(evtchn_port_t) ports;
-    unsigned int nr_ports;
+    uint32_t nr_ports;
     uint64_t timeout;
 };
 typedef struct sched_poll sched_poll_t;
@@ -131,7 +131,7 @@ DEFINE_XEN_GUEST_HANDLE(sched_poll_t);
 
 struct sched_remote_shutdown {
     domid_t domain_id;         /* Remote domain ID */
-    unsigned int reason;       /* SHUTDOWN_* => enum sched_shutdown_reason */
+    uint32_t reason;           /* SHUTDOWN_* => enum sched_shutdown_reason */
 };
 typedef struct sched_remote_shutdown sched_remote_shutdown_t;
 DEFINE_XEN_GUEST_HANDLE(sched_remote_shutdown_t);
diff --git a/xen/include/public/vcpu.h b/xen/include/public/vcpu.h
index f7445ac0b0..2b8df2b0da 100644
--- a/xen/include/public/vcpu.h
+++ b/xen/include/public/vcpu.h
@@ -63,7 +63,7 @@
 #define VCPUOP_get_runstate_info     4
 struct vcpu_runstate_info {
     /* VCPU's current state (RUNSTATE_*). */
-    int      state;
+    int32_t  state;
     /* When was current state entered (system time, ns)? */
     uint64_t state_entry_time;
     /*
-- 
2.25.1


