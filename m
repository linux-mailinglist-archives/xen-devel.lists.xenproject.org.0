Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 481811ACB63
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 17:48:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP6k3-0006Kq-0y; Thu, 16 Apr 2020 15:47:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP6k2-0006Ki-7g
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 15:47:50 +0000
X-Inumbo-ID: 9eace8df-7ff9-11ea-8bb9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9eace8df-7ff9-11ea-8bb9-12813bfff9fa;
 Thu, 16 Apr 2020 15:47:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9613DAC50;
 Thu, 16 Apr 2020 15:47:46 +0000 (UTC)
Subject: [PATCH 5/6] x86/mem-paging: move code to its dedicated source file
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Message-ID: <8a4378ee-c086-b847-ba0f-a84d257f5c54@suse.com>
Date: Thu, 16 Apr 2020 17:47:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Do a little bit of style adjustment along the way, and drop the
"p2m_mem_paging_" prefixes from the now static functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -25,6 +25,421 @@
 #include <xen/vm_event.h>
 #include <xsm/xsm.h>
 
+#include "mm-locks.h"
+
+/*
+ * p2m_mem_paging_drop_page - Tell pager to drop its reference to a paged page
+ * @d: guest domain
+ * @gfn: guest page to drop
+ *
+ * p2m_mem_paging_drop_page() will notify the pager that a paged-out gfn was
+ * released by the guest. The pager is supposed to drop its reference of the
+ * gfn.
+ */
+void p2m_mem_paging_drop_page(struct domain *d, unsigned long gfn,
+                              p2m_type_t p2mt)
+{
+    vm_event_request_t req = {
+        .reason = VM_EVENT_REASON_MEM_PAGING,
+        .u.mem_paging.gfn = gfn
+    };
+
+    /*
+     * We allow no ring in this unique case, because it won't affect
+     * correctness of the guest execution at this point.  If this is the only
+     * page that happens to be paged-out, we'll be okay..  but it's likely the
+     * guest will crash shortly anyways.
+     */
+    int rc = vm_event_claim_slot(d, d->vm_event_paging);
+
+    if ( rc < 0 )
+        return;
+
+    /* Send release notification to pager */
+    req.u.mem_paging.flags = MEM_PAGING_DROP_PAGE;
+
+    /* Update stats unless the page hasn't yet been evicted */
+    if ( p2mt != p2m_ram_paging_out )
+        atomic_dec(&d->paged_pages);
+    else
+        /* Evict will fail now, tag this request for pager */
+        req.u.mem_paging.flags |= MEM_PAGING_EVICT_FAIL;
+
+    vm_event_put_request(d, d->vm_event_paging, &req);
+}
+
+/*
+ * p2m_mem_paging_populate - Tell pager to populate a paged page
+ * @d: guest domain
+ * @gfn: guest page in paging state
+ *
+ * p2m_mem_paging_populate() will notify the pager that a page in any of the
+ * paging states needs to be written back into the guest.
+ * This function needs to be called whenever gfn_to_mfn() returns any of the p2m
+ * paging types because the gfn may not be backed by a mfn.
+ *
+ * The gfn can be in any of the paging states, but the pager needs only be
+ * notified when the gfn is in the paging-out path (paging_out or paged).  This
+ * function may be called more than once from several vcpus. If the vcpu belongs
+ * to the guest, the vcpu must be stopped and the pager notified that the vcpu
+ * was stopped. The pager needs to handle several requests for the same gfn.
+ *
+ * If the gfn is not in the paging-out path and the vcpu does not belong to the
+ * guest, nothing needs to be done and the function assumes that a request was
+ * already sent to the pager. In this case the caller has to try again until the
+ * gfn is fully paged in again.
+ */
+void p2m_mem_paging_populate(struct domain *d, unsigned long gfn_l)
+{
+    struct vcpu *v = current;
+    vm_event_request_t req = {
+        .reason = VM_EVENT_REASON_MEM_PAGING,
+        .u.mem_paging.gfn = gfn_l
+    };
+    p2m_type_t p2mt;
+    p2m_access_t a;
+    gfn_t gfn = _gfn(gfn_l);
+    mfn_t mfn;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int rc = vm_event_claim_slot(d, d->vm_event_paging);
+
+    /* We're paging. There should be a ring. */
+    if ( rc == -EOPNOTSUPP )
+    {
+        gdprintk(XENLOG_ERR, "Dom%d paging gfn %lx yet no ring in place\n",
+                 d->domain_id, gfn_l);
+        /* Prevent the vcpu from faulting repeatedly on the same gfn */
+        if ( v->domain == d )
+            vcpu_pause_nosync(v);
+        domain_crash(d);
+        return;
+    }
+    else if ( rc < 0 )
+        return;
+
+    /* Fix p2m mapping */
+    gfn_lock(p2m, gfn, 0);
+    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
+    /* Allow only nominated or evicted pages to enter page-in path */
+    if ( p2mt == p2m_ram_paging_out || p2mt == p2m_ram_paged )
+    {
+        /* Evict will fail now, tag this request for pager */
+        if ( p2mt == p2m_ram_paging_out )
+            req.u.mem_paging.flags |= MEM_PAGING_EVICT_FAIL;
+
+        rc = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K, p2m_ram_paging_in, a);
+    }
+    gfn_unlock(p2m, gfn, 0);
+    if ( rc < 0 )
+        goto out_cancel;
+
+    /* Pause domain if request came from guest and gfn has paging type */
+    if ( p2m_is_paging(p2mt) && v->domain == d )
+    {
+        vm_event_vcpu_pause(v);
+        req.flags |= VM_EVENT_FLAG_VCPU_PAUSED;
+    }
+    /* No need to inform pager if the gfn is not in the page-out path */
+    else if ( p2mt != p2m_ram_paging_out && p2mt != p2m_ram_paged )
+    {
+        /* gfn is already on its way back and vcpu is not paused */
+    out_cancel:
+        vm_event_cancel_slot(d, d->vm_event_paging);
+        return;
+    }
+
+    /* Send request to pager */
+    req.u.mem_paging.p2mt = p2mt;
+    req.vcpu_id = v->vcpu_id;
+
+    vm_event_put_request(d, d->vm_event_paging, &req);
+}
+
+/*
+ * p2m_mem_paging_resume - Resume guest gfn
+ * @d: guest domain
+ * @rsp: vm_event response received
+ *
+ * p2m_mem_paging_resume() will forward the p2mt of a gfn to ram_rw. It is
+ * called by the pager.
+ *
+ * The gfn was previously either evicted and populated, or nominated and
+ * populated. If the page was evicted the p2mt will be p2m_ram_paging_in. If
+ * the page was just nominated the p2mt will be p2m_ram_paging_in_start because
+ * the pager did not call prepare().
+ *
+ * If the gfn was dropped the vcpu needs to be unpaused.
+ */
+void p2m_mem_paging_resume(struct domain *d, vm_event_response_t *rsp)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    p2m_type_t p2mt;
+    p2m_access_t a;
+    mfn_t mfn;
+
+    /* Fix p2m entry if the page was not dropped */
+    if ( !(rsp->u.mem_paging.flags & MEM_PAGING_DROP_PAGE) )
+    {
+        gfn_t gfn = _gfn(rsp->u.mem_access.gfn);
+
+        gfn_lock(p2m, gfn, 0);
+        mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
+        /*
+         * Allow only pages which were prepared properly, or pages which
+         * were nominated but not evicted.
+         */
+        if ( mfn_valid(mfn) && (p2mt == p2m_ram_paging_in) )
+        {
+            int rc = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
+                                   paging_mode_log_dirty(d) ? p2m_ram_logdirty
+                                                            : p2m_ram_rw, a);
+
+            if ( !rc )
+                set_gpfn_from_mfn(mfn_x(mfn), gfn_x(gfn));
+        }
+        gfn_unlock(p2m, gfn, 0);
+    }
+}
+
+/*
+ * nominate - Mark a guest page as to-be-paged-out
+ * @d: guest domain
+ * @gfn: guest page to nominate
+ *
+ * Returns 0 for success or negative errno values if gfn is not pageable.
+ *
+ * nominate() is called by the pager and checks if a guest page can be paged
+ * out. If the following conditions are met the p2mt will be changed:
+ * - the gfn is backed by a mfn
+ * - the p2mt of the gfn is pageable
+ * - the mfn is not used for IO
+ * - the mfn has exactly one user and has no special meaning
+ *
+ * Once the p2mt is changed the page is readonly for the guest.  On success the
+ * pager can write the page contents to disk and later evict the page.
+ */
+static int nominate(struct domain *d, unsigned long gfn_l)
+{
+    struct page_info *page;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    p2m_type_t p2mt;
+    p2m_access_t a;
+    gfn_t gfn = _gfn(gfn_l);
+    mfn_t mfn;
+    int ret = -EBUSY;
+
+    gfn_lock(p2m, gfn, 0);
+
+    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
+
+    /* Check if mfn is valid */
+    if ( !mfn_valid(mfn) )
+        goto out;
+
+    /* Check p2m type */
+    if ( !p2m_is_pageable(p2mt) )
+        goto out;
+
+    /* Check for io memory page */
+    if ( is_iomem_page(mfn) )
+        goto out;
+
+    /* Check page count and type */
+    page = mfn_to_page(mfn);
+    if ( (page->count_info & (PGC_count_mask | PGC_allocated)) !=
+         (1 | PGC_allocated) )
+        goto out;
+
+    if ( (page->u.inuse.type_info & PGT_count_mask) != 0 )
+        goto out;
+
+    /* Fix p2m entry */
+    ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K, p2m_ram_paging_out, a);
+
+ out:
+    gfn_unlock(p2m, gfn, 0);
+    return ret;
+}
+
+/*
+ * evict - Mark a guest page as paged-out
+ * @d: guest domain
+ * @gfn: guest page to evict
+ *
+ * Returns 0 for success or negative errno values if eviction is not possible.
+ *
+ * evict() is called by the pager and will free a guest page and release it
+ * back to Xen. If the following conditions are met the page can be freed:
+ * - the gfn is backed by a mfn
+ * - the gfn was nominated
+ * - the mfn has still exactly one user and has no special meaning
+ *
+ * After successful nomination some other process could have mapped the page. In
+ * this case eviction can not be done. If the gfn was populated before the pager
+ * could evict it, eviction can not be done either. In this case the gfn is
+ * still backed by a mfn.
+ */
+static int evict(struct domain *d, unsigned long gfn_l)
+{
+    struct page_info *page;
+    p2m_type_t p2mt;
+    p2m_access_t a;
+    gfn_t gfn = _gfn(gfn_l);
+    mfn_t mfn;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int ret = -EBUSY;
+
+    gfn_lock(p2m, gfn, 0);
+
+    /* Get mfn */
+    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
+    if ( unlikely(!mfn_valid(mfn)) )
+        goto out;
+
+    /* Allow only nominated pages */
+    if ( p2mt != p2m_ram_paging_out )
+        goto out;
+
+    /* Get the page so it doesn't get modified under Xen's feet */
+    page = mfn_to_page(mfn);
+    if ( unlikely(!get_page(page, d)) )
+        goto out;
+
+    /* Check page count and type once more */
+    if ( (page->count_info & (PGC_count_mask | PGC_allocated)) !=
+         (2 | PGC_allocated) )
+        goto out_put;
+
+    if ( (page->u.inuse.type_info & PGT_count_mask) != 0 )
+        goto out_put;
+
+    /* Decrement guest domain's ref count of the page */
+    put_page_alloc_ref(page);
+
+    /* Remove mapping from p2m table */
+    ret = p2m_set_entry(p2m, gfn, INVALID_MFN, PAGE_ORDER_4K,
+                        p2m_ram_paged, a);
+
+    /* Clear content before returning the page to Xen */
+    scrub_one_page(page);
+
+    /* Track number of paged gfns */
+    atomic_inc(&d->paged_pages);
+
+ out_put:
+    /* Put the page back so it gets freed */
+    put_page(page);
+
+ out:
+    gfn_unlock(p2m, gfn, 0);
+    return ret;
+}
+
+/*
+ * prepare - Allocate a new page for the guest
+ * @d: guest domain
+ * @gfn: guest page in paging state
+ *
+ * prepare() will allocate a new page for the guest if the gfn is not backed
+ * by a mfn. It is called by the pager.
+ * It is required that the gfn was already populated. The gfn may already have a
+ * mfn if populate was called for  gfn which was nominated but not evicted. In
+ * this case only the p2mt needs to be forwarded.
+ */
+static int prepare(struct domain *d, unsigned long gfn_l,
+                   XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)
+{
+    struct page_info *page = NULL;
+    p2m_type_t p2mt;
+    p2m_access_t a;
+    gfn_t gfn = _gfn(gfn_l);
+    mfn_t mfn;
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int ret, page_extant = 1;
+
+    if ( !guest_handle_okay(buffer, PAGE_SIZE) )
+        return -EINVAL;
+
+    gfn_lock(p2m, gfn, 0);
+
+    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
+
+    ret = -ENOENT;
+    /* Allow missing pages */
+    if ( (p2mt != p2m_ram_paging_in) && (p2mt != p2m_ram_paged) )
+        goto out;
+
+    /* Allocate a page if the gfn does not have one yet */
+    if ( !mfn_valid(mfn) )
+    {
+        void *guest_map;
+
+        /* If the user did not provide a buffer, we disallow */
+        ret = -EINVAL;
+        if ( unlikely(guest_handle_is_null(buffer)) )
+            goto out;
+        /* Get a free page */
+        ret = -ENOMEM;
+        page_alloc_mm_pre_lock(d);
+        page = alloc_domheap_page(d, 0);
+        if ( unlikely(page == NULL) )
+            goto out;
+        if ( unlikely(!get_page(page, d)) )
+        {
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            domain_crash(d);
+            page = NULL;
+            goto out;
+        }
+        mfn = page_to_mfn(page);
+        page_extant = 0;
+
+        ASSERT( mfn_valid(mfn) );
+        guest_map = map_domain_page(mfn);
+        ret = copy_from_guest(guest_map, buffer, PAGE_SIZE);
+        unmap_domain_page(guest_map);
+        if ( ret )
+        {
+            gdprintk(XENLOG_ERR,
+                     "Failed to load paging-in gfn %lx Dom%d bytes left %d\n",
+                     gfn_l, d->domain_id, ret);
+            ret = -EFAULT;
+            goto out;
+        }
+    }
+
+    /*
+     * Make the page already guest-accessible. If the pager still has a
+     * pending resume operation, it will be idempotent p2m entry-wise, but
+     * will unpause the vcpu.
+     */
+    ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
+                        paging_mode_log_dirty(d) ? p2m_ram_logdirty
+                                                 : p2m_ram_rw, a);
+    if ( !ret )
+    {
+        set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
+
+        if ( !page_extant )
+            atomic_dec(&d->paged_pages);
+    }
+
+ out:
+    gfn_unlock(p2m, gfn, 0);
+
+    if ( page )
+    {
+        if ( ret )
+            put_page_alloc_ref(page);
+        put_page(page);
+    }
+
+    return ret;
+}
+
 int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg)
 {
     int rc;
@@ -50,15 +465,15 @@ int mem_paging_memop(XEN_GUEST_HANDLE_PA
     switch( mpo.op )
     {
     case XENMEM_paging_op_nominate:
-        rc = p2m_mem_paging_nominate(d, mpo.gfn);
+        rc = nominate(d, mpo.gfn);
         break;
 
     case XENMEM_paging_op_evict:
-        rc = p2m_mem_paging_evict(d, mpo.gfn);
+        rc = evict(d, mpo.gfn);
         break;
 
     case XENMEM_paging_op_prep:
-        rc = p2m_mem_paging_prep(d, mpo.gfn, mpo.buffer);
+        rc = prepare(d, mpo.gfn, mpo.buffer);
         if ( !rc )
             copyback = 1;
         break;
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -23,7 +23,6 @@
  * along with this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <xen/guest_access.h> /* copy_from_guest() */
 #include <xen/iommu.h>
 #include <xen/mem_access.h>
 #include <xen/vm_event.h>
@@ -1506,418 +1505,6 @@ int set_shared_p2m_entry(struct domain *
     return rc;
 }
 
-/**
- * p2m_mem_paging_nominate - Mark a guest page as to-be-paged-out
- * @d: guest domain
- * @gfn: guest page to nominate
- *
- * Returns 0 for success or negative errno values if gfn is not pageable.
- *
- * p2m_mem_paging_nominate() is called by the pager and checks if a guest page
- * can be paged out. If the following conditions are met the p2mt will be
- * changed:
- * - the gfn is backed by a mfn
- * - the p2mt of the gfn is pageable
- * - the mfn is not used for IO
- * - the mfn has exactly one user and has no special meaning
- *
- * Once the p2mt is changed the page is readonly for the guest.  On success the
- * pager can write the page contents to disk and later evict the page.
- */
-int p2m_mem_paging_nominate(struct domain *d, unsigned long gfn_l)
-{
-    struct page_info *page;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
-    mfn_t mfn;
-    int ret = -EBUSY;
-
-    gfn_lock(p2m, gfn, 0);
-
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-
-    /* Check if mfn is valid */
-    if ( !mfn_valid(mfn) )
-        goto out;
-
-    /* Check p2m type */
-    if ( !p2m_is_pageable(p2mt) )
-        goto out;
-
-    /* Check for io memory page */
-    if ( is_iomem_page(mfn) )
-        goto out;
-
-    /* Check page count and type */
-    page = mfn_to_page(mfn);
-    if ( (page->count_info & (PGC_count_mask | PGC_allocated)) !=
-         (1 | PGC_allocated) )
-        goto out;
-
-    if ( (page->u.inuse.type_info & PGT_count_mask) != 0 )
-        goto out;
-
-    /* Fix p2m entry */
-    ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K, p2m_ram_paging_out, a);
-
- out:
-    gfn_unlock(p2m, gfn, 0);
-    return ret;
-}
-
-/**
- * p2m_mem_paging_evict - Mark a guest page as paged-out
- * @d: guest domain
- * @gfn: guest page to evict
- *
- * Returns 0 for success or negative errno values if eviction is not possible.
- *
- * p2m_mem_paging_evict() is called by the pager and will free a guest page and
- * release it back to Xen. If the following conditions are met the page can be
- * freed:
- * - the gfn is backed by a mfn
- * - the gfn was nominated
- * - the mfn has still exactly one user and has no special meaning
- *
- * After successful nomination some other process could have mapped the page. In
- * this case eviction can not be done. If the gfn was populated before the pager
- * could evict it, eviction can not be done either. In this case the gfn is
- * still backed by a mfn.
- */
-int p2m_mem_paging_evict(struct domain *d, unsigned long gfn_l)
-{
-    struct page_info *page;
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
-    mfn_t mfn;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int ret = -EBUSY;
-
-    gfn_lock(p2m, gfn, 0);
-
-    /* Get mfn */
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-    if ( unlikely(!mfn_valid(mfn)) )
-        goto out;
-
-    /* Allow only nominated pages */
-    if ( p2mt != p2m_ram_paging_out )
-        goto out;
-
-    /* Get the page so it doesn't get modified under Xen's feet */
-    page = mfn_to_page(mfn);
-    if ( unlikely(!get_page(page, d)) )
-        goto out;
-
-    /* Check page count and type once more */
-    if ( (page->count_info & (PGC_count_mask | PGC_allocated)) !=
-         (2 | PGC_allocated) )
-        goto out_put;
-
-    if ( (page->u.inuse.type_info & PGT_count_mask) != 0 )
-        goto out_put;
-
-    /* Decrement guest domain's ref count of the page */
-    put_page_alloc_ref(page);
-
-    /* Remove mapping from p2m table */
-    ret = p2m_set_entry(p2m, gfn, INVALID_MFN, PAGE_ORDER_4K,
-                        p2m_ram_paged, a);
-
-    /* Clear content before returning the page to Xen */
-    scrub_one_page(page);
-
-    /* Track number of paged gfns */
-    atomic_inc(&d->paged_pages);
-
- out_put:
-    /* Put the page back so it gets freed */
-    put_page(page);
-
- out:
-    gfn_unlock(p2m, gfn, 0);
-    return ret;
-}
-
-/**
- * p2m_mem_paging_drop_page - Tell pager to drop its reference to a paged page
- * @d: guest domain
- * @gfn: guest page to drop
- *
- * p2m_mem_paging_drop_page() will notify the pager that a paged-out gfn was
- * released by the guest. The pager is supposed to drop its reference of the
- * gfn.
- */
-void p2m_mem_paging_drop_page(struct domain *d, unsigned long gfn,
-                                p2m_type_t p2mt)
-{
-    vm_event_request_t req = {
-        .reason = VM_EVENT_REASON_MEM_PAGING,
-        .u.mem_paging.gfn = gfn
-    };
-
-    /* We allow no ring in this unique case, because it won't affect
-     * correctness of the guest execution at this point.  If this is the only
-     * page that happens to be paged-out, we'll be okay..  but it's likely the
-     * guest will crash shortly anyways. */
-    int rc = vm_event_claim_slot(d, d->vm_event_paging);
-    if ( rc < 0 )
-        return;
-
-    /* Send release notification to pager */
-    req.u.mem_paging.flags = MEM_PAGING_DROP_PAGE;
-
-    /* Update stats unless the page hasn't yet been evicted */
-    if ( p2mt != p2m_ram_paging_out )
-        atomic_dec(&d->paged_pages);
-    else
-        /* Evict will fail now, tag this request for pager */
-        req.u.mem_paging.flags |= MEM_PAGING_EVICT_FAIL;
-
-    vm_event_put_request(d, d->vm_event_paging, &req);
-}
-
-/**
- * p2m_mem_paging_populate - Tell pager to populate a paged page
- * @d: guest domain
- * @gfn: guest page in paging state
- *
- * p2m_mem_paging_populate() will notify the pager that a page in any of the
- * paging states needs to be written back into the guest.
- * This function needs to be called whenever gfn_to_mfn() returns any of the p2m
- * paging types because the gfn may not be backed by a mfn.
- *
- * The gfn can be in any of the paging states, but the pager needs only be
- * notified when the gfn is in the paging-out path (paging_out or paged).  This
- * function may be called more than once from several vcpus. If the vcpu belongs
- * to the guest, the vcpu must be stopped and the pager notified that the vcpu
- * was stopped. The pager needs to handle several requests for the same gfn.
- *
- * If the gfn is not in the paging-out path and the vcpu does not belong to the
- * guest, nothing needs to be done and the function assumes that a request was
- * already sent to the pager. In this case the caller has to try again until the
- * gfn is fully paged in again.
- */
-void p2m_mem_paging_populate(struct domain *d, unsigned long gfn_l)
-{
-    struct vcpu *v = current;
-    vm_event_request_t req = {
-        .reason = VM_EVENT_REASON_MEM_PAGING,
-        .u.mem_paging.gfn = gfn_l
-    };
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
-    mfn_t mfn;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-
-    /* We're paging. There should be a ring */
-    int rc = vm_event_claim_slot(d, d->vm_event_paging);
-
-    if ( rc == -EOPNOTSUPP )
-    {
-        gdprintk(XENLOG_ERR, "Domain %hu paging gfn %lx yet no ring "
-                             "in place\n", d->domain_id, gfn_l);
-        /* Prevent the vcpu from faulting repeatedly on the same gfn */
-        if ( v->domain == d )
-            vcpu_pause_nosync(v);
-        domain_crash(d);
-        return;
-    }
-    else if ( rc < 0 )
-        return;
-
-    /* Fix p2m mapping */
-    gfn_lock(p2m, gfn, 0);
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-    /* Allow only nominated or evicted pages to enter page-in path */
-    if ( p2mt == p2m_ram_paging_out || p2mt == p2m_ram_paged )
-    {
-        /* Evict will fail now, tag this request for pager */
-        if ( p2mt == p2m_ram_paging_out )
-            req.u.mem_paging.flags |= MEM_PAGING_EVICT_FAIL;
-
-        rc = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K, p2m_ram_paging_in, a);
-    }
-    gfn_unlock(p2m, gfn, 0);
-    if ( rc < 0 )
-        goto out_cancel;
-
-    /* Pause domain if request came from guest and gfn has paging type */
-    if ( p2m_is_paging(p2mt) && v->domain == d )
-    {
-        vm_event_vcpu_pause(v);
-        req.flags |= VM_EVENT_FLAG_VCPU_PAUSED;
-    }
-    /* No need to inform pager if the gfn is not in the page-out path */
-    else if ( p2mt != p2m_ram_paging_out && p2mt != p2m_ram_paged )
-    {
-        /* gfn is already on its way back and vcpu is not paused */
-    out_cancel:
-        vm_event_cancel_slot(d, d->vm_event_paging);
-        return;
-    }
-
-    /* Send request to pager */
-    req.u.mem_paging.p2mt = p2mt;
-    req.vcpu_id = v->vcpu_id;
-
-    vm_event_put_request(d, d->vm_event_paging, &req);
-}
-
-/**
- * p2m_mem_paging_prep - Allocate a new page for the guest
- * @d: guest domain
- * @gfn: guest page in paging state
- *
- * p2m_mem_paging_prep() will allocate a new page for the guest if the gfn is
- * not backed by a mfn. It is called by the pager.
- * It is required that the gfn was already populated. The gfn may already have a
- * mfn if populate was called for  gfn which was nominated but not evicted. In
- * this case only the p2mt needs to be forwarded.
- */
-int p2m_mem_paging_prep(struct domain *d, unsigned long gfn_l,
-                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)
-{
-    struct page_info *page = NULL;
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
-    mfn_t mfn;
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int ret, page_extant = 1;
-
-    if ( !guest_handle_okay(buffer, PAGE_SIZE) )
-        return -EINVAL;
-
-    gfn_lock(p2m, gfn, 0);
-
-    mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-
-    ret = -ENOENT;
-    /* Allow missing pages */
-    if ( (p2mt != p2m_ram_paging_in) && (p2mt != p2m_ram_paged) )
-        goto out;
-
-    /* Allocate a page if the gfn does not have one yet */
-    if ( !mfn_valid(mfn) )
-    {
-        void *guest_map;
-
-        /* If the user did not provide a buffer, we disallow */
-        ret = -EINVAL;
-        if ( unlikely(guest_handle_is_null(buffer)) )
-            goto out;
-        /* Get a free page */
-        ret = -ENOMEM;
-        page_alloc_mm_pre_lock(d);
-        page = alloc_domheap_page(d, 0);
-        if ( unlikely(page == NULL) )
-            goto out;
-        if ( unlikely(!get_page(page, d)) )
-        {
-            /*
-             * The domain can't possibly know about this page yet, so failure
-             * here is a clear indication of something fishy going on.
-             */
-            domain_crash(d);
-            page = NULL;
-            goto out;
-        }
-        mfn = page_to_mfn(page);
-        page_extant = 0;
-
-        ASSERT( mfn_valid(mfn) );
-        guest_map = map_domain_page(mfn);
-        ret = copy_from_guest(guest_map, buffer, PAGE_SIZE);
-        unmap_domain_page(guest_map);
-        if ( ret )
-        {
-            gdprintk(XENLOG_ERR,
-                     "Failed to load paging-in gfn %lx Dom%d bytes left %d\n",
-                     gfn_l, d->domain_id, ret);
-            ret = -EFAULT;
-            goto out;            
-        }
-    }
-
-    /* Make the page already guest-accessible. If the pager still has a
-     * pending resume operation, it will be idempotent p2m entry-wise,
-     * but will unpause the vcpu */
-    ret = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
-                        paging_mode_log_dirty(d) ? p2m_ram_logdirty
-                                                 : p2m_ram_rw, a);
-    if ( !ret )
-    {
-        set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
-
-        if ( !page_extant )
-            atomic_dec(&d->paged_pages);
-    }
-
- out:
-    gfn_unlock(p2m, gfn, 0);
-
-    if ( page )
-    {
-        if ( ret )
-            put_page_alloc_ref(page);
-        put_page(page);
-    }
-
-    return ret;
-}
-
-/**
- * p2m_mem_paging_resume - Resume guest gfn
- * @d: guest domain
- * @rsp: vm_event response received
- *
- * p2m_mem_paging_resume() will forward the p2mt of a gfn to ram_rw. It is
- * called by the pager.
- *
- * The gfn was previously either evicted and populated, or nominated and
- * populated. If the page was evicted the p2mt will be p2m_ram_paging_in. If
- * the page was just nominated the p2mt will be p2m_ram_paging_in_start because
- * the pager did not call p2m_mem_paging_prep().
- *
- * If the gfn was dropped the vcpu needs to be unpaused.
- */
-
-void p2m_mem_paging_resume(struct domain *d, vm_event_response_t *rsp)
-{
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    p2m_type_t p2mt;
-    p2m_access_t a;
-    mfn_t mfn;
-
-    /* Fix p2m entry if the page was not dropped */
-    if ( !(rsp->u.mem_paging.flags & MEM_PAGING_DROP_PAGE) )
-    {
-        gfn_t gfn = _gfn(rsp->u.mem_access.gfn);
-
-        gfn_lock(p2m, gfn, 0);
-        mfn = p2m->get_entry(p2m, gfn, &p2mt, &a, 0, NULL, NULL);
-        /*
-         * Allow only pages which were prepared properly, or pages which
-         * were nominated but not evicted.
-         */
-        if ( mfn_valid(mfn) && (p2mt == p2m_ram_paging_in) )
-        {
-            int rc = p2m_set_entry(p2m, gfn, mfn, PAGE_ORDER_4K,
-                                   paging_mode_log_dirty(d) ? p2m_ram_logdirty :
-                                   p2m_ram_rw, a);
-
-            if ( !rc )
-                set_gpfn_from_mfn(mfn_x(mfn), gfn_x(gfn));
-        }
-        gfn_unlock(p2m, gfn, 0);
-    }
-}
-
 #ifdef CONFIG_HVM
 static struct p2m_domain *
 p2m_getlru_nestedp2m(struct domain *d, struct p2m_domain *p2m)
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -731,18 +731,11 @@ static inline void p2m_pod_init(struct p
 /* Modify p2m table for shared gfn */
 int set_shared_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
 
-/* Check if a nominated gfn is valid to be paged out */
-int p2m_mem_paging_nominate(struct domain *d, unsigned long gfn);
-/* Evict a frame */
-int p2m_mem_paging_evict(struct domain *d, unsigned long gfn);
 /* Tell xenpaging to drop a paged out frame */
 void p2m_mem_paging_drop_page(struct domain *d, unsigned long gfn, 
                                 p2m_type_t p2mt);
 /* Start populating a paged out frame */
 void p2m_mem_paging_populate(struct domain *d, unsigned long gfn);
-/* Prepare the p2m for paging a frame in */
-int p2m_mem_paging_prep(struct domain *d, unsigned long gfn,
-                        XEN_GUEST_HANDLE_PARAM(const_uint8) buffer);
 /* Resume normal operation (in case a domain was paused) */
 struct vm_event_st;
 void p2m_mem_paging_resume(struct domain *d, struct vm_event_st *rsp);


