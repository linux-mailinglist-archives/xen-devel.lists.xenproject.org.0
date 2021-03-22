Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A678343EA3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 11:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100145.190638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOIGp-0002zR-Gv; Mon, 22 Mar 2021 10:58:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100145.190638; Mon, 22 Mar 2021 10:58:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lOIGp-0002yo-BF; Mon, 22 Mar 2021 10:58:51 +0000
Received: by outflank-mailman (input) for mailman id 100145;
 Mon, 22 Mar 2021 10:58:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx7y=IU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lOIGo-0002uF-1D
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 10:58:50 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2d8f94fb-3b04-4247-a4e5-e9ccfe4f623c;
 Mon, 22 Mar 2021 10:58:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 52529ADAA;
 Mon, 22 Mar 2021 10:58:43 +0000 (UTC)
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
X-Inumbo-ID: 2d8f94fb-3b04-4247-a4e5-e9ccfe4f623c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616410723; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsU1Tia/8TAchqKhiuRA5Y2svprMqymbiqcqRl8SGa0=;
	b=Xa3SH5Jm9gvR826bDKnDRnIOARNUe4kStg8hl41mD5GQ862r2UKEzmZcQA3UpYGRfRbs7z
	F/EJ7IwZOl22S0M5lcI89ZgbWafNrPp5q5axS64Hlve7Q/xzugJa/TT0lhhdvA+KfPniCG
	9Ml1Yg27h/mrXr6l7mkPzFO+zg+2ZrU=
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 2/6] tools/libs/ctrl: fix xc_core_arch_map_p2m() to support linear p2m table
Date: Mon, 22 Mar 2021 11:58:36 +0100
Message-Id: <20210322105840.11224-3-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322105840.11224-1-jgross@suse.com>
References: <20210322105840.11224-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The core of a pv linux guest produced via "xl dump-core" is nor usable
as since kernel 4.14 only the linear p2m table is kept if Xen indicates
it is supporting that. Unfortunately xc_core_arch_map_p2m() is still
supporting the 3-level p2m tree only.

Fix that by copying the functionality of map_p2m() from libxenguest to
libxenctrl.

Additionally the mapped p2m isn't of a fixed length now, so the
interface to the mapping functions needs to be adapted. In order not to
add even more parameters, expand struct domain_info_context and use a
pointer to that as a parameter.

Fixes: dc6d60937121 ("libxc: set flag for support of linear p2m list in domain builder")
Signed-off-by: Juergen Gross <jgross@suse.com>
---
This is a backport candidate.
---
 tools/include/xenguest.h      |   1 +
 tools/libs/ctrl/xc_core.c     |   5 +-
 tools/libs/ctrl/xc_core.h     |   8 +-
 tools/libs/ctrl/xc_core_arm.c |  23 +--
 tools/libs/ctrl/xc_core_x86.c | 256 ++++++++++++++++++++++++++++------
 tools/libs/ctrl/xc_private.h  |   1 +
 tools/libs/guest/xg_domain.c  |  17 +--
 7 files changed, 233 insertions(+), 78 deletions(-)

diff --git a/tools/include/xenguest.h b/tools/include/xenguest.h
index 217022b6e7..781d40c119 100644
--- a/tools/include/xenguest.h
+++ b/tools/include/xenguest.h
@@ -700,6 +700,7 @@ struct xc_domain_meminfo {
     xen_pfn_t *pfn_type;
     xen_pfn_t *p2m_table;
     unsigned long p2m_size;
+    unsigned int p2m_frames;
 };
 
 int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
diff --git a/tools/libs/ctrl/xc_core.c b/tools/libs/ctrl/xc_core.c
index b47ab2f6d8..9576bec5a3 100644
--- a/tools/libs/ctrl/xc_core.c
+++ b/tools/libs/ctrl/xc_core.c
@@ -574,8 +574,7 @@ xc_domain_dumpcore_via_callback(xc_interface *xch,
             goto out;
         }
 
-        sts = xc_core_arch_map_p2m(xch, dinfo->guest_width, &info, live_shinfo,
-                                   &p2m, &dinfo->p2m_size);
+        sts = xc_core_arch_map_p2m(xch, dinfo, &info, live_shinfo, &p2m);
         if ( sts != 0 )
             goto out;
 
@@ -945,7 +944,7 @@ out:
     if ( memory_map != NULL )
         free(memory_map);
     if ( p2m != NULL )
-        munmap(p2m, PAGE_SIZE * P2M_FL_ENTRIES);
+        munmap(p2m, PAGE_SIZE * dinfo->p2m_frames);
     if ( p2m_array != NULL )
         free(p2m_array);
     if ( pfn_array != NULL )
diff --git a/tools/libs/ctrl/xc_core.h b/tools/libs/ctrl/xc_core.h
index 36fb755da2..8ea1f93a10 100644
--- a/tools/libs/ctrl/xc_core.h
+++ b/tools/libs/ctrl/xc_core.h
@@ -138,14 +138,14 @@ int xc_core_arch_memory_map_get(xc_interface *xch,
                                 xc_dominfo_t *info, shared_info_any_t *live_shinfo,
                                 xc_core_memory_map_t **mapp,
                                 unsigned int *nr_entries);
-int xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width,
+int xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *dinfo,
                          xc_dominfo_t *info, shared_info_any_t *live_shinfo,
-                         xen_pfn_t **live_p2m, unsigned long *pfnp);
+                         xen_pfn_t **live_p2m);
 
-int xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int guest_width,
+int xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo,
                                   xc_dominfo_t *info,
                                   shared_info_any_t *live_shinfo,
-                                  xen_pfn_t **live_p2m, unsigned long *pfnp);
+                                  xen_pfn_t **live_p2m);
 
 int xc_core_arch_get_scratch_gpfn(xc_interface *xch, uint32_t domid,
                                   xen_pfn_t *gpfn);
diff --git a/tools/libs/ctrl/xc_core_arm.c b/tools/libs/ctrl/xc_core_arm.c
index 7b587b4cc5..93765a565f 100644
--- a/tools/libs/ctrl/xc_core_arm.c
+++ b/tools/libs/ctrl/xc_core_arm.c
@@ -66,33 +66,24 @@ xc_core_arch_memory_map_get(xc_interface *xch, struct xc_core_arch_context *unus
 
 static int
 xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
-                        shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m,
-                        unsigned long *pfnp, int rw)
+                        shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m, int rw)
 {
     errno = ENOSYS;
     return -1;
 }
 
 int
-xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width, xc_dominfo_t *info,
-                        shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m,
-                        unsigned long *pfnp)
+xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+                        shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m)
 {
-    struct domain_info_context _dinfo = { .guest_width = guest_width };
-    struct domain_info_context *dinfo = &_dinfo;
-    return xc_core_arch_map_p2m_rw(xch, dinfo, info,
-                                   live_shinfo, live_p2m, pfnp, 0);
+    return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 0);
 }
 
 int
-xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int guest_width, xc_dominfo_t *info,
-                              shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m,
-                              unsigned long *pfnp)
+xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+                              shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m)
 {
-    struct domain_info_context _dinfo = { .guest_width = guest_width };
-    struct domain_info_context *dinfo = &_dinfo;
-    return xc_core_arch_map_p2m_rw(xch, dinfo, info,
-                                   live_shinfo, live_p2m, pfnp, 1);
+    return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 1);
 }
 
 int
diff --git a/tools/libs/ctrl/xc_core_x86.c b/tools/libs/ctrl/xc_core_x86.c
index cb76e6207b..c8f71d4b75 100644
--- a/tools/libs/ctrl/xc_core_x86.c
+++ b/tools/libs/ctrl/xc_core_x86.c
@@ -17,6 +17,7 @@
  *
  */
 
+#include <inttypes.h>
 #include "xc_private.h"
 #include "xc_core.h"
 #include <xen/hvm/e820.h>
@@ -65,34 +66,169 @@ xc_core_arch_memory_map_get(xc_interface *xch, struct xc_core_arch_context *unus
     return 0;
 }
 
-static int
-xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
-                        shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m,
-                        unsigned long *pfnp, int rw)
+static inline bool is_canonical_address(uint64_t vaddr)
 {
-    /* Double and single indirect references to the live P2M table */
-    xen_pfn_t *live_p2m_frame_list_list = NULL;
-    xen_pfn_t *live_p2m_frame_list = NULL;
-    /* Copies of the above. */
-    xen_pfn_t *p2m_frame_list_list = NULL;
-    xen_pfn_t *p2m_frame_list = NULL;
+    return ((int64_t)vaddr >> 47) == ((int64_t)vaddr >> 63);
+}
 
-    uint32_t dom = info->domid;
-    int ret = -1;
-    int err;
-    int i;
+/* Virtual address ranges reserved for hypervisor. */
+#define HYPERVISOR_VIRT_START_X86_64 0xFFFF800000000000ULL
+#define HYPERVISOR_VIRT_END_X86_64   0xFFFF87FFFFFFFFFFULL
 
-    if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
+#define HYPERVISOR_VIRT_START_X86_32 0x00000000F5800000ULL
+#define HYPERVISOR_VIRT_END_X86_32   0x00000000FFFFFFFFULL
+
+static xen_pfn_t *
+xc_core_arch_map_p2m_list_rw(xc_interface *xch, struct domain_info_context *dinfo,
+                             uint32_t dom, shared_info_any_t *live_shinfo,
+                             uint64_t p2m_cr3)
+{
+    uint64_t p2m_vaddr, p2m_end, mask, off;
+    xen_pfn_t p2m_mfn, mfn, saved_mfn, max_pfn;
+    uint64_t *ptes = NULL;
+    xen_pfn_t *mfns = NULL;
+    unsigned int fpp, n_pages, level, n_levels, shift,
+                 idx_start, idx_end, idx, saved_idx;
+
+    p2m_vaddr = GET_FIELD(live_shinfo, arch.p2m_vaddr, dinfo->guest_width);
+    fpp = PAGE_SIZE / dinfo->guest_width;
+    dinfo->p2m_frames = (dinfo->p2m_size - 1) / fpp + 1;
+    p2m_end = p2m_vaddr + dinfo->p2m_frames * PAGE_SIZE - 1;
+
+    if ( dinfo->guest_width == 8 )
     {
-        ERROR("Could not get maximum GPFN!");
-        goto out;
+        mask = 0x0000ffffffffffffULL;
+        n_levels = 4;
+        p2m_mfn = p2m_cr3 >> 12;
+        if ( !is_canonical_address(p2m_vaddr) ||
+             !is_canonical_address(p2m_end) ||
+             p2m_end < p2m_vaddr ||
+             (p2m_vaddr <= HYPERVISOR_VIRT_END_X86_64 &&
+              p2m_end > HYPERVISOR_VIRT_START_X86_64) )
+        {
+            ERROR("Bad virtual p2m address range %#" PRIx64 "-%#" PRIx64,
+                  p2m_vaddr, p2m_end);
+            errno = ERANGE;
+            goto out;
+        }
+    }
+    else
+    {
+        mask = 0x00000000ffffffffULL;
+        n_levels = 3;
+        if ( p2m_cr3 & ~mask )
+            p2m_mfn = ~0UL;
+        else
+            p2m_mfn = (uint32_t)((p2m_cr3 >> 12) | (p2m_cr3 << 20));
+        if ( p2m_vaddr > mask || p2m_end > mask || p2m_end < p2m_vaddr ||
+             (p2m_vaddr <= HYPERVISOR_VIRT_END_X86_32 &&
+              p2m_end > HYPERVISOR_VIRT_START_X86_32) )
+        {
+            ERROR("Bad virtual p2m address range %#" PRIx64 "-%#" PRIx64,
+                  p2m_vaddr, p2m_end);
+            errno = ERANGE;
+            goto out;
+        }
     }
 
-    if ( dinfo->p2m_size < info->nr_pages  )
+    mfns = malloc(sizeof(*mfns));
+    if ( !mfns )
     {
-        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, info->nr_pages - 1);
+        ERROR("Cannot allocate memory for array of %u mfns", 1);
         goto out;
     }
+    mfns[0] = p2m_mfn;
+    off = 0;
+    saved_mfn = 0;
+    idx_start = idx_end = saved_idx = 0;
+
+    for ( level = n_levels; level > 0; level-- )
+    {
+        n_pages = idx_end - idx_start + 1;
+        ptes = xc_map_foreign_pages(xch, dom, PROT_READ, mfns, n_pages);
+        if ( !ptes )
+        {
+            PERROR("Failed to map %u page table pages for p2m list", n_pages);
+            goto out;
+        }
+        free(mfns);
+
+        shift = level * 9 + 3;
+        idx_start = ((p2m_vaddr - off) & mask) >> shift;
+        idx_end = ((p2m_end - off) & mask) >> shift;
+        idx = idx_end - idx_start + 1;
+        mfns = malloc(sizeof(*mfns) * idx);
+        if ( !mfns )
+        {
+            ERROR("Cannot allocate memory for array of %u mfns", idx);
+            goto out;
+        }
+
+        for ( idx = idx_start; idx <= idx_end; idx++ )
+        {
+            mfn = (ptes[idx] & 0x000ffffffffff000ULL) >> PAGE_SHIFT;
+            if ( mfn == 0 )
+            {
+                ERROR("Bad mfn %#lx during page table walk for vaddr %#" PRIx64 " at level %d of p2m list",
+                      mfn, off + ((uint64_t)idx << shift), level);
+                errno = ERANGE;
+                goto out;
+            }
+            mfns[idx - idx_start] = mfn;
+
+            /* Maximum pfn check at level 2. Same reasoning as for p2m tree. */
+            if ( level == 2 )
+            {
+                if ( mfn != saved_mfn )
+                {
+                    saved_mfn = mfn;
+                    saved_idx = idx - idx_start;
+                }
+            }
+        }
+
+        if ( level == 2 )
+        {
+            if ( saved_idx == idx_end )
+                saved_idx++;
+            max_pfn = ((xen_pfn_t)saved_idx << 9) * fpp;
+            if ( max_pfn < dinfo->p2m_size )
+            {
+                dinfo->p2m_size = max_pfn;
+                dinfo->p2m_frames = (dinfo->p2m_size + fpp - 1) / fpp;
+                p2m_end = p2m_vaddr + dinfo->p2m_frames * PAGE_SIZE - 1;
+                idx_end = idx_start + saved_idx;
+            }
+        }
+
+        munmap(ptes, n_pages * PAGE_SIZE);
+        ptes = NULL;
+        off = p2m_vaddr & ((mask >> shift) << shift);
+    }
+
+    return mfns;
+
+ out:
+    free(mfns);
+    if ( ptes )
+        munmap(ptes, n_pages * PAGE_SIZE);
+
+    return NULL;
+}
+
+static xen_pfn_t *
+xc_core_arch_map_p2m_tree_rw(xc_interface *xch, struct domain_info_context *dinfo,
+                             uint32_t dom, shared_info_any_t *live_shinfo)
+{
+    /* Double and single indirect references to the live P2M table */
+    xen_pfn_t *live_p2m_frame_list_list;
+    xen_pfn_t *live_p2m_frame_list = NULL;
+    /* Copies of the above. */
+    xen_pfn_t *p2m_frame_list_list = NULL;
+    xen_pfn_t *p2m_frame_list;
+
+    int err;
+    int i;
 
     live_p2m_frame_list_list =
         xc_map_foreign_range(xch, dom, PAGE_SIZE, PROT_READ,
@@ -151,10 +287,60 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc
         for ( i = P2M_FL_ENTRIES - 1; i >= 0; i-- )
             p2m_frame_list[i] = ((uint32_t *)p2m_frame_list)[i];
 
+    dinfo->p2m_frames = P2M_FL_ENTRIES;
+
+    return p2m_frame_list;
+
+ out:
+    err = errno;
+
+    if ( live_p2m_frame_list_list )
+        munmap(live_p2m_frame_list_list, PAGE_SIZE);
+
+    if ( live_p2m_frame_list )
+        munmap(live_p2m_frame_list, P2M_FLL_ENTRIES * PAGE_SIZE);
+
+    free(p2m_frame_list_list);
+
+    errno = err;
+
+    return NULL;
+}
+
+static int
+xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+                        shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m, int rw)
+{
+    xen_pfn_t *p2m_frame_list = NULL;
+    uint64_t p2m_cr3;
+    uint32_t dom = info->domid;
+    int ret = -1;
+    int err;
+
+    if ( xc_domain_nr_gpfns(xch, info->domid, &dinfo->p2m_size) < 0 )
+    {
+        ERROR("Could not get maximum GPFN!");
+        goto out;
+    }
+
+    if ( dinfo->p2m_size < info->nr_pages  )
+    {
+        ERROR("p2m_size < nr_pages -1 (%lx < %lx", dinfo->p2m_size, info->nr_pages - 1);
+        goto out;
+    }
+
+    p2m_cr3 = GET_FIELD(live_shinfo, arch.p2m_cr3, dinfo->guest_width);
+
+    p2m_frame_list = p2m_cr3 ? xc_core_arch_map_p2m_list_rw(xch, dinfo, dom, live_shinfo, p2m_cr3)
+                             : xc_core_arch_map_p2m_tree_rw(xch, dinfo, dom, live_shinfo);
+
+    if ( !p2m_frame_list )
+        goto out;
+
     *live_p2m = xc_map_foreign_pages(xch, dom,
                                     rw ? (PROT_READ | PROT_WRITE) : PROT_READ,
                                     p2m_frame_list,
-                                    P2M_FL_ENTRIES);
+                                    dinfo->p2m_frames);
 
     if ( !*live_p2m )
     {
@@ -162,21 +348,11 @@ xc_core_arch_map_p2m_rw(xc_interface *xch, struct domain_info_context *dinfo, xc
         goto out;
     }
 
-    *pfnp = dinfo->p2m_size;
-
     ret = 0;
 
 out:
     err = errno;
 
-    if ( live_p2m_frame_list_list )
-        munmap(live_p2m_frame_list_list, PAGE_SIZE);
-
-    if ( live_p2m_frame_list )
-        munmap(live_p2m_frame_list, P2M_FLL_ENTRIES * PAGE_SIZE);
-
-    free(p2m_frame_list_list);
-
     free(p2m_frame_list);
 
     errno = err;
@@ -184,25 +360,17 @@ out:
 }
 
 int
-xc_core_arch_map_p2m(xc_interface *xch, unsigned int guest_width, xc_dominfo_t *info,
-                        shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m,
-                        unsigned long *pfnp)
+xc_core_arch_map_p2m(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+                        shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m)
 {
-    struct domain_info_context _dinfo = { .guest_width = guest_width };
-    struct domain_info_context *dinfo = &_dinfo;
-    return xc_core_arch_map_p2m_rw(xch, dinfo, info,
-                                   live_shinfo, live_p2m, pfnp, 0);
+    return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 0);
 }
 
 int
-xc_core_arch_map_p2m_writable(xc_interface *xch, unsigned int guest_width, xc_dominfo_t *info,
-                              shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m,
-                              unsigned long *pfnp)
+xc_core_arch_map_p2m_writable(xc_interface *xch, struct domain_info_context *dinfo, xc_dominfo_t *info,
+                              shared_info_any_t *live_shinfo, xen_pfn_t **live_p2m)
 {
-    struct domain_info_context _dinfo = { .guest_width = guest_width };
-    struct domain_info_context *dinfo = &_dinfo;
-    return xc_core_arch_map_p2m_rw(xch, dinfo, info,
-                                   live_shinfo, live_p2m, pfnp, 1);
+    return xc_core_arch_map_p2m_rw(xch, dinfo, info, live_shinfo, live_p2m, 1);
 }
 
 int
diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.h
index f0b5f83ac8..8ebc0b59da 100644
--- a/tools/libs/ctrl/xc_private.h
+++ b/tools/libs/ctrl/xc_private.h
@@ -79,6 +79,7 @@ struct iovec {
 
 struct domain_info_context {
     unsigned int guest_width;
+    unsigned int p2m_frames;
     unsigned long p2m_size;
 };
 
diff --git a/tools/libs/guest/xg_domain.c b/tools/libs/guest/xg_domain.c
index 5019c84e0e..dd7db2cbd8 100644
--- a/tools/libs/guest/xg_domain.c
+++ b/tools/libs/guest/xg_domain.c
@@ -24,13 +24,9 @@
 
 int xc_unmap_domain_meminfo(xc_interface *xch, struct xc_domain_meminfo *minfo)
 {
-    struct domain_info_context _di = { .guest_width = minfo->guest_width,
-                                       .p2m_size = minfo->p2m_size};
-    struct domain_info_context *dinfo = &_di;
-
     free(minfo->pfn_type);
     if ( minfo->p2m_table )
-        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
+        munmap(minfo->p2m_table, minfo->p2m_frames * PAGE_SIZE);
     minfo->p2m_table = NULL;
 
     return 0;
@@ -40,7 +36,6 @@ int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
                           struct xc_domain_meminfo *minfo)
 {
     struct domain_info_context _di;
-    struct domain_info_context *dinfo = &_di;
 
     xc_dominfo_t info;
     shared_info_any_t *live_shinfo;
@@ -96,16 +91,16 @@ int xc_map_domain_meminfo(xc_interface *xch, uint32_t domid,
         return -1;
     }
 
-    if ( xc_core_arch_map_p2m_writable(xch, minfo->guest_width, &info,
-                                       live_shinfo, &minfo->p2m_table,
-                                       &minfo->p2m_size) )
+    if ( xc_core_arch_map_p2m_writable(xch, &_di, &info,
+                                       live_shinfo, &minfo->p2m_table) )
     {
         PERROR("Could not map the P2M table");
         munmap(live_shinfo, PAGE_SIZE);
         return -1;
     }
     munmap(live_shinfo, PAGE_SIZE);
-    _di.p2m_size = minfo->p2m_size;
+    minfo->p2m_size = _di.p2m_size;
+    minfo->p2m_frames = _di.p2m_frames;
 
     /* Make space and prepare for getting the PFN types */
     minfo->pfn_type = calloc(sizeof(*minfo->pfn_type), minfo->p2m_size);
@@ -141,7 +136,7 @@ failed:
     }
     if ( minfo->p2m_table )
     {
-        munmap(minfo->p2m_table, P2M_FL_ENTRIES * PAGE_SIZE);
+        munmap(minfo->p2m_table, minfo->p2m_frames * PAGE_SIZE);
         minfo->p2m_table = NULL;
     }
 
-- 
2.26.2


