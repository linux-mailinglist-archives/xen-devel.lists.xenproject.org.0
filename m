Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0630B52DB08
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 19:17:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333183.556970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrjlp-00039s-Kw; Thu, 19 May 2022 17:17:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333183.556970; Thu, 19 May 2022 17:17:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrjlp-00036X-HL; Thu, 19 May 2022 17:17:05 +0000
Received: by outflank-mailman (input) for mailman id 333183;
 Thu, 19 May 2022 17:17:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q20b=V3=intel.com=tamas.lengyel@srs-se1.protection.inumbo.net>)
 id 1nrjlo-0002Zq-58
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 17:17:04 +0000
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c146c52-d797-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 19:16:59 +0200 (CEST)
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 10:16:55 -0700
Received: from hcommiss-mobl2.amr.corp.intel.com (HELO ubuntu.localdomain)
 ([10.212.62.193])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2022 10:16:54 -0700
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
X-Inumbo-ID: 7c146c52-d797-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652980619; x=1684516619;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=jFHiIJiSbGbUIR6G4WjofS5RXbmz0hE6Nvokb7TyQhk=;
  b=See85NEcegUIpfPkjYq1LXrwANbgyqB2iLkAKyOEwkcI0e719YnOm4Zs
   V6awh80Cac4tXQzFOtGSALZK+Xd3+fEZgX0U4uQTQZ1zvVXWMW097maTd
   qDi2azfZ7hJiJ2L9KbYntyClHCs01Lna0sdrSu6duMzKlHACD7cXDSoIU
   34ZZUh0UlH70FGkFKsUycM6uhisYl+HPJVCmcgNd52WOle1y5lBwyiIXv
   N5OFr8U6TupJOBwS1Q2m2FIPFdqVP/YlXJLfYmXiaQhDX+VSvM+V8jr9d
   O66g3mhB4acAaMvF5skptTkYgpe8Z+g0ewrHQ7tMF2z7e/jCNYgcx/f6k
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10352"; a="332910133"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="332910133"
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; 
   d="scan'208";a="546209103"
From: Tamas K Lengyel <tamas.lengyel@intel.com>
To: xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas.lengyel@intel.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2] tools/libs/ctrl: rename and export do_memory_op as xc_memory_op
Date: Thu, 19 May 2022 13:16:35 -0400
Message-Id: <f6d12fd32b39b8c55865be1aa9de8b46a08ee4c0.1652980173.git.tamas.lengyel@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the do_memory_op function accessible to tools linking with libxc.
Similar functions are already available for both domctl and sysctl. As part
of this patch we also change the input 'cmd' to be unsigned int to accurately
reflect what the hypervisor expects.

Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
---
v2: rename function in-place
---
 tools/include/xenctrl.h                |  1 +
 tools/libs/ctrl/xc_domain.c            | 28 +++++++++++++-------------
 tools/libs/ctrl/xc_mem_access.c        |  6 +++---
 tools/libs/ctrl/xc_mem_paging.c        |  2 +-
 tools/libs/ctrl/xc_memshr.c            |  8 ++++----
 tools/libs/ctrl/xc_private.c           |  6 +++---
 tools/libs/ctrl/xc_private.h           |  2 --
 tools/libs/guest/xg_dom_boot.c         |  6 +++---
 tools/libs/guest/xg_sr_common_x86_pv.c |  2 +-
 9 files changed, 30 insertions(+), 31 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 95bd5eca67..484e354412 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1597,6 +1597,7 @@ int xc_vmtrace_set_option(xc_interface *xch, uint32_t domid,
 
 int xc_domctl(xc_interface *xch, struct xen_domctl *domctl);
 int xc_sysctl(xc_interface *xch, struct xen_sysctl *sysctl);
+long xc_memory_op(xc_interface *xch, unsigned int cmd, void *arg, size_t len);
 
 int xc_version(xc_interface *xch, int cmd, void *arg);
 
diff --git a/tools/libs/ctrl/xc_domain.c b/tools/libs/ctrl/xc_domain.c
index 71608c00e9..14c0420c35 100644
--- a/tools/libs/ctrl/xc_domain.c
+++ b/tools/libs/ctrl/xc_domain.c
@@ -736,7 +736,7 @@ int xc_domain_set_memory_map(xc_interface *xch,
 
     set_xen_guest_handle(fmap.map.buffer, entries);
 
-    rc = do_memory_op(xch, XENMEM_set_memory_map, &fmap, sizeof(fmap));
+    rc = xc_memory_op(xch, XENMEM_set_memory_map, &fmap, sizeof(fmap));
 
     xc_hypercall_bounce_post(xch, entries);
 
@@ -760,7 +760,7 @@ int xc_get_machine_memory_map(xc_interface *xch,
 
     set_xen_guest_handle(memmap.buffer, entries);
 
-    rc = do_memory_op(xch, XENMEM_machine_memory_map, &memmap, sizeof(memmap));
+    rc = xc_memory_op(xch, XENMEM_machine_memory_map, &memmap, sizeof(memmap));
 
     xc_hypercall_bounce_post(xch, entries);
 
@@ -814,7 +814,7 @@ int xc_reserved_device_memory_map(xc_interface *xch,
 
     set_xen_guest_handle(xrdmmap.buffer, entries);
 
-    rc = do_memory_op(xch, XENMEM_reserved_device_memory_map,
+    rc = xc_memory_op(xch, XENMEM_reserved_device_memory_map,
                       &xrdmmap, sizeof(xrdmmap));
 
     xc_hypercall_bounce_post(xch, entries);
@@ -879,7 +879,7 @@ int xc_domain_get_tsc_info(xc_interface *xch,
 int xc_domain_maximum_gpfn(xc_interface *xch, uint32_t domid, xen_pfn_t *gpfns)
 {
     struct xen_memory_domain dom = { .domid = domid };
-    long rc = do_memory_op(xch, XENMEM_maximum_gpfn, &dom, sizeof(dom));
+    long rc = xc_memory_op(xch, XENMEM_maximum_gpfn, &dom, sizeof(dom));
 
     if ( rc >= 0 )
     {
@@ -924,7 +924,7 @@ int xc_domain_increase_reservation(xc_interface *xch,
 
     set_xen_guest_handle(reservation.extent_start, extent_start);
 
-    err = do_memory_op(xch, XENMEM_increase_reservation, &reservation, sizeof(reservation));
+    err = xc_memory_op(xch, XENMEM_increase_reservation, &reservation, sizeof(reservation));
 
     xc_hypercall_bounce_post(xch, extent_start);
 
@@ -987,7 +987,7 @@ int xc_domain_decrease_reservation(xc_interface *xch,
     }
     set_xen_guest_handle(reservation.extent_start, extent_start);
 
-    err = do_memory_op(xch, XENMEM_decrease_reservation, &reservation, sizeof(reservation));
+    err = xc_memory_op(xch, XENMEM_decrease_reservation, &reservation, sizeof(reservation));
 
     xc_hypercall_bounce_post(xch, extent_start);
 
@@ -1031,7 +1031,7 @@ int xc_domain_add_to_physmap(xc_interface *xch,
         .idx = idx,
         .gpfn = gpfn,
     };
-    return do_memory_op(xch, XENMEM_add_to_physmap, &xatp, sizeof(xatp));
+    return xc_memory_op(xch, XENMEM_add_to_physmap, &xatp, sizeof(xatp));
 }
 
 int xc_domain_add_to_physmap_batch(xc_interface *xch,
@@ -1068,7 +1068,7 @@ int xc_domain_add_to_physmap_batch(xc_interface *xch,
     set_xen_guest_handle(xatp_batch.gpfns, gpfns);
     set_xen_guest_handle(xatp_batch.errs, errs);
 
-    rc = do_memory_op(xch, XENMEM_add_to_physmap_batch,
+    rc = xc_memory_op(xch, XENMEM_add_to_physmap_batch,
                       &xatp_batch, sizeof(xatp_batch));
 
 out:
@@ -1087,7 +1087,7 @@ int xc_domain_remove_from_physmap(xc_interface *xch,
         .domid = domid,
         .gpfn = gpfn,
     };
-    return do_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
+    return xc_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
 }
 
 int xc_domain_claim_pages(xc_interface *xch,
@@ -1104,7 +1104,7 @@ int xc_domain_claim_pages(xc_interface *xch,
 
     set_xen_guest_handle(reservation.extent_start, HYPERCALL_BUFFER_NULL);
 
-    err = do_memory_op(xch, XENMEM_claim_pages, &reservation, sizeof(reservation));
+    err = xc_memory_op(xch, XENMEM_claim_pages, &reservation, sizeof(reservation));
     /* Ignore it if the hypervisor does not support the call. */
     if (err == -1 && errno == ENOSYS)
         err = errno = 0;
@@ -1134,7 +1134,7 @@ int xc_domain_populate_physmap(xc_interface *xch,
     }
     set_xen_guest_handle(reservation.extent_start, extent_start);
 
-    err = do_memory_op(xch, XENMEM_populate_physmap, &reservation, sizeof(reservation));
+    err = xc_memory_op(xch, XENMEM_populate_physmap, &reservation, sizeof(reservation));
 
     xc_hypercall_bounce_post(xch, extent_start);
     return err;
@@ -1197,7 +1197,7 @@ int xc_domain_memory_exchange_pages(xc_interface *xch,
     set_xen_guest_handle(exchange.in.extent_start, in_extents);
     set_xen_guest_handle(exchange.out.extent_start, out_extents);
 
-    rc = do_memory_op(xch, XENMEM_exchange, &exchange, sizeof(exchange));
+    rc = xc_memory_op(xch, XENMEM_exchange, &exchange, sizeof(exchange));
 
 out:
     xc_hypercall_bounce_post(xch, in_extents);
@@ -1227,7 +1227,7 @@ static int xc_domain_pod_target(xc_interface *xch,
         .target_pages = target_pages
     };
 
-    err = do_memory_op(xch, op, &pod_target, sizeof(pod_target));
+    err = xc_memory_op(xch, op, &pod_target, sizeof(pod_target));
 
     if ( err < 0 )
         DPRINTF("Failed %s_pod_target dom %d\n",
@@ -2178,7 +2178,7 @@ int xc_domain_getvnuma(xc_interface *xch,
     vnuma_topo.domid = domid;
     vnuma_topo.pad = 0;
 
-    rc = do_memory_op(xch, XENMEM_get_vnumainfo, &vnuma_topo,
+    rc = xc_memory_op(xch, XENMEM_get_vnumainfo, &vnuma_topo,
                       sizeof(vnuma_topo));
 
     *nr_vnodes = vnuma_topo.nr_vnodes;
diff --git a/tools/libs/ctrl/xc_mem_access.c b/tools/libs/ctrl/xc_mem_access.c
index b452460e32..6d613037d0 100644
--- a/tools/libs/ctrl/xc_mem_access.c
+++ b/tools/libs/ctrl/xc_mem_access.c
@@ -38,7 +38,7 @@ int xc_set_mem_access(xc_interface *xch,
         .nr     = nr
     };
 
-    return do_memory_op(xch, XENMEM_access_op, &mao, sizeof(mao));
+    return xc_memory_op(xch, XENMEM_access_op, &mao, sizeof(mao));
 }
 
 int xc_set_mem_access_multi(xc_interface *xch,
@@ -71,7 +71,7 @@ int xc_set_mem_access_multi(xc_interface *xch,
     set_xen_guest_handle(mao.pfn_list, pages);
     set_xen_guest_handle(mao.access_list, access);
 
-    rc = do_memory_op(xch, XENMEM_access_op, &mao, sizeof(mao));
+    rc = xc_memory_op(xch, XENMEM_access_op, &mao, sizeof(mao));
 
     xc_hypercall_bounce_post(xch, access);
     xc_hypercall_bounce_post(xch, pages);
@@ -92,7 +92,7 @@ int xc_get_mem_access(xc_interface *xch,
         .pfn   = pfn
     };
 
-    rc = do_memory_op(xch, XENMEM_access_op, &mao, sizeof(mao));
+    rc = xc_memory_op(xch, XENMEM_access_op, &mao, sizeof(mao));
 
     if ( rc == 0 )
         *access = mao.access;
diff --git a/tools/libs/ctrl/xc_mem_paging.c b/tools/libs/ctrl/xc_mem_paging.c
index 738f63ac20..999a572cef 100644
--- a/tools/libs/ctrl/xc_mem_paging.c
+++ b/tools/libs/ctrl/xc_mem_paging.c
@@ -47,7 +47,7 @@ static int xc_mem_paging_memop(xc_interface *xch, uint32_t domain_id,
         set_xen_guest_handle(mpo.buffer, buffer);
     }
 
-    rc = do_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
+    rc = xc_memory_op(xch, XENMEM_paging_op, &mpo, sizeof(mpo));
 
     if ( buffer )
         xc_hypercall_bounce_post(xch, buffer);
diff --git a/tools/libs/ctrl/xc_memshr.c b/tools/libs/ctrl/xc_memshr.c
index a6cfd7dccf..6c6db8aae8 100644
--- a/tools/libs/ctrl/xc_memshr.c
+++ b/tools/libs/ctrl/xc_memshr.c
@@ -71,7 +71,7 @@ static int xc_memshr_memop(xc_interface *xch, uint32_t domid,
 {
     mso->domain = domid;
 
-    return do_memory_op(xch, XENMEM_sharing_op, mso, sizeof(*mso));
+    return xc_memory_op(xch, XENMEM_sharing_op, mso, sizeof(*mso));
 }
 
 int xc_memshr_nominate_gfn(xc_interface *xch,
@@ -275,15 +275,15 @@ int xc_memshr_audit(xc_interface *xch)
 
     mso.op = XENMEM_sharing_op_audit;
 
-    return do_memory_op(xch, XENMEM_sharing_op, &mso, sizeof(mso));
+    return xc_memory_op(xch, XENMEM_sharing_op, &mso, sizeof(mso));
 }
 
 long xc_sharing_freed_pages(xc_interface *xch)
 {
-    return do_memory_op(xch, XENMEM_get_sharing_freed_pages, NULL, 0);
+    return xc_memory_op(xch, XENMEM_get_sharing_freed_pages, NULL, 0);
 }
 
 long xc_sharing_used_frames(xc_interface *xch)
 {
-    return do_memory_op(xch, XENMEM_get_sharing_shared_pages, NULL, 0);
+    return xc_memory_op(xch, XENMEM_get_sharing_shared_pages, NULL, 0);
 }
diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.c
index c0422662f0..2f99a7d2cf 100644
--- a/tools/libs/ctrl/xc_private.c
+++ b/tools/libs/ctrl/xc_private.c
@@ -326,7 +326,7 @@ int xc_flush_mmu_updates(xc_interface *xch, struct xc_mmu *mmu)
     return flush_mmu_updates(xch, mmu);
 }
 
-long do_memory_op(xc_interface *xch, int cmd, void *arg, size_t len)
+long xc_memory_op(xc_interface *xch, unsigned int cmd, void *arg, size_t len)
 {
     DECLARE_HYPERCALL_BOUNCE(arg, len, XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
     long ret = -1;
@@ -386,7 +386,7 @@ long do_memory_op(xc_interface *xch, int cmd, void *arg, size_t len)
 
 int xc_maximum_ram_page(xc_interface *xch, unsigned long *max_mfn)
 {
-    long rc = do_memory_op(xch, XENMEM_maximum_ram_page, NULL, 0);
+    long rc = xc_memory_op(xch, XENMEM_maximum_ram_page, NULL, 0);
 
     if ( rc >= 0 )
     {
@@ -428,7 +428,7 @@ int xc_machphys_mfn_list(xc_interface *xch,
     }
 
     set_xen_guest_handle(xmml.extent_start, extent_start);
-    rc = do_memory_op(xch, XENMEM_machphys_mfn_list, &xmml, sizeof(xmml));
+    rc = xc_memory_op(xch, XENMEM_machphys_mfn_list, &xmml, sizeof(xmml));
     if (rc || xmml.nr_extents != max_extents)
         rc = -1;
     else
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index ebdf78c2bf..ed960c6f30 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -367,8 +367,6 @@ static inline int do_multicall_op(xc_interface *xch,
     return ret;
 }
 
-long do_memory_op(xc_interface *xch, int cmd, void *arg, size_t len);
-
 void *xc_map_foreign_ranges(xc_interface *xch, uint32_t dom,
                             size_t size, int prot, size_t chunksize,
                             privcmd_mmap_entry_t entries[], int nentries);
diff --git a/tools/libs/guest/xg_dom_boot.c b/tools/libs/guest/xg_dom_boot.c
index f809dcbe97..263a3f4c85 100644
--- a/tools/libs/guest/xg_dom_boot.c
+++ b/tools/libs/guest/xg_dom_boot.c
@@ -348,7 +348,7 @@ static int compat_gnttab_hvm_seed(xc_interface *xch, uint32_t domid,
     xc_dom_printf(xch, "%s: d%d: pfn=0x%"PRI_xen_pfn, __func__,
                   domid, scratch_gfn);
 
-    rc = do_memory_op(xch, XENMEM_add_to_physmap, &xatp, sizeof(xatp));
+    rc = xc_memory_op(xch, XENMEM_add_to_physmap, &xatp, sizeof(xatp));
     if ( rc != 0 )
     {
         xc_dom_panic(xch, XC_INTERNAL_ERROR,
@@ -366,12 +366,12 @@ static int compat_gnttab_hvm_seed(xc_interface *xch, uint32_t domid,
         xc_dom_panic(xch, XC_INTERNAL_ERROR,
                      "%s: failed to seed gnttab entries for d%d\n",
                      __func__, domid);
-        (void) do_memory_op(xch, XENMEM_remove_from_physmap, &xrfp,
+        (void) xc_memory_op(xch, XENMEM_remove_from_physmap, &xrfp,
                             sizeof(xrfp));
         return -1;
     }
 
-    rc = do_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
+    rc = xc_memory_op(xch, XENMEM_remove_from_physmap, &xrfp, sizeof(xrfp));
     if (rc != 0)
     {
         xc_dom_panic(xch, XC_INTERNAL_ERROR,
diff --git a/tools/libs/guest/xg_sr_common_x86_pv.c b/tools/libs/guest/xg_sr_common_x86_pv.c
index c0acf00f90..1fa2821e91 100644
--- a/tools/libs/guest/xg_sr_common_x86_pv.c
+++ b/tools/libs/guest/xg_sr_common_x86_pv.c
@@ -161,7 +161,7 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
             .extent_start = { &ctx->x86.pv.compat_m2p_mfn0 },
         };
 
-        rc = do_memory_op(xch, XENMEM_machphys_compat_mfn_list,
+        rc = xc_memory_op(xch, XENMEM_machphys_compat_mfn_list,
                           &xmml, sizeof(xmml));
         if ( rc || xmml.nr_extents != 1 )
         {
-- 
2.34.1



