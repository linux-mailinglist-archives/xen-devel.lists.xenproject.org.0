Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1DD1ACB65
	for <lists+xen-devel@lfdr.de>; Thu, 16 Apr 2020 17:48:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jP6kb-0006RP-Fv; Thu, 16 Apr 2020 15:48:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jP6kZ-0006RH-Rv
 for xen-devel@lists.xenproject.org; Thu, 16 Apr 2020 15:48:23 +0000
X-Inumbo-ID: b38d291c-7ff9-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b38d291c-7ff9-11ea-b58d-bc764e2007e4;
 Thu, 16 Apr 2020 15:48:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2E78FAC79;
 Thu, 16 Apr 2020 15:48:21 +0000 (UTC)
Subject: [PATCH 6/6] x86/mem-paging: consistently use gfn_t
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3b7cc69d-709c-570a-716a-c45f6fda181f@suse.com>
Message-ID: <224337b8-98b4-b0f6-a57a-6f508ffa6838@suse.com>
Date: Thu, 16 Apr 2020 17:48:19 +0200
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/hvm/dm.c
+++ b/xen/arch/x86/hvm/dm.c
@@ -278,7 +278,7 @@ static int set_mem_type(struct domain *d
         if ( p2m_is_paging(t) )
         {
             put_gfn(d, pfn);
-            p2m_mem_paging_populate(d, pfn);
+            p2m_mem_paging_populate(d, _gfn(pfn));
             return -EAGAIN;
         }
 
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -1968,7 +1968,7 @@ int hvm_hap_nested_page_fault(paddr_t gp
      * locks in such circumstance.
      */
     if ( paged )
-        p2m_mem_paging_populate(currd, gfn);
+        p2m_mem_paging_populate(currd, _gfn(gfn));
 
     if ( sharing_enomem )
     {
@@ -3199,7 +3199,7 @@ enum hvm_translation_result hvm_translat
     if ( p2m_is_paging(p2mt) )
     {
         put_page(page);
-        p2m_mem_paging_populate(v->domain, gfn_x(gfn));
+        p2m_mem_paging_populate(v->domain, gfn);
         return HVMTRANS_gfn_paged_out;
     }
     if ( p2m_is_shared(p2mt) )
--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -2151,16 +2151,17 @@ static int mod_l1_entry(l1_pgentry_t *pl
              paging_mode_translate(pg_dom) )
         {
             p2m_type_t p2mt;
+            unsigned long gfn = l1e_get_pfn(nl1e);
             p2m_query_t q = l1e_get_flags(nl1e) & _PAGE_RW ?
                             P2M_ALLOC | P2M_UNSHARE : P2M_ALLOC;
 
-            page = get_page_from_gfn(pg_dom, l1e_get_pfn(nl1e), &p2mt, q);
+            page = get_page_from_gfn(pg_dom, gfn, &p2mt, q);
 
             if ( p2m_is_paged(p2mt) )
             {
                 if ( page )
                     put_page(page);
-                p2m_mem_paging_populate(pg_dom, l1e_get_pfn(nl1e));
+                p2m_mem_paging_populate(pg_dom, _gfn(gfn));
                 return -ENOENT;
             }
 
@@ -3982,7 +3983,7 @@ long do_mmu_update(
                     put_page(page);
                 if ( p2m_is_paged(p2mt) )
                 {
-                    p2m_mem_paging_populate(pt_owner, gmfn);
+                    p2m_mem_paging_populate(pt_owner, _gfn(gmfn));
                     rc = -ENOENT;
                 }
                 else
--- a/xen/arch/x86/mm/hap/guest_walk.c
+++ b/xen/arch/x86/mm/hap/guest_walk.c
@@ -68,7 +68,7 @@ unsigned long hap_p2m_ga_to_gfn(GUEST_PA
         *pfec = PFEC_page_paged;
         if ( top_page )
             put_page(top_page);
-        p2m_mem_paging_populate(p2m->domain, cr3 >> PAGE_SHIFT);
+        p2m_mem_paging_populate(p2m->domain, _gfn(PFN_DOWN(cr3)));
         return gfn_x(INVALID_GFN);
     }
     if ( p2m_is_shared(p2mt) )
@@ -109,7 +109,7 @@ unsigned long hap_p2m_ga_to_gfn(GUEST_PA
         {
             ASSERT(p2m_is_hostp2m(p2m));
             *pfec = PFEC_page_paged;
-            p2m_mem_paging_populate(p2m->domain, gfn_x(gfn));
+            p2m_mem_paging_populate(p2m->domain, gfn);
             return gfn_x(INVALID_GFN);
         }
         if ( p2m_is_shared(p2mt) )
--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -36,12 +36,11 @@
  * released by the guest. The pager is supposed to drop its reference of the
  * gfn.
  */
-void p2m_mem_paging_drop_page(struct domain *d, unsigned long gfn,
-                              p2m_type_t p2mt)
+void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn, p2m_type_t p2mt)
 {
     vm_event_request_t req = {
         .reason = VM_EVENT_REASON_MEM_PAGING,
-        .u.mem_paging.gfn = gfn
+        .u.mem_paging.gfn = gfn_x(gfn)
     };
 
     /*
@@ -89,16 +88,15 @@ void p2m_mem_paging_drop_page(struct dom
  * already sent to the pager. In this case the caller has to try again until the
  * gfn is fully paged in again.
  */
-void p2m_mem_paging_populate(struct domain *d, unsigned long gfn_l)
+void p2m_mem_paging_populate(struct domain *d, gfn_t gfn)
 {
     struct vcpu *v = current;
     vm_event_request_t req = {
         .reason = VM_EVENT_REASON_MEM_PAGING,
-        .u.mem_paging.gfn = gfn_l
+        .u.mem_paging.gfn = gfn_x(gfn)
     };
     p2m_type_t p2mt;
     p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
     mfn_t mfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int rc = vm_event_claim_slot(d, d->vm_event_paging);
@@ -107,7 +105,7 @@ void p2m_mem_paging_populate(struct doma
     if ( rc == -EOPNOTSUPP )
     {
         gdprintk(XENLOG_ERR, "Dom%d paging gfn %lx yet no ring in place\n",
-                 d->domain_id, gfn_l);
+                 d->domain_id, gfn_x(gfn));
         /* Prevent the vcpu from faulting repeatedly on the same gfn */
         if ( v->domain == d )
             vcpu_pause_nosync(v);
@@ -218,13 +216,12 @@ void p2m_mem_paging_resume(struct domain
  * Once the p2mt is changed the page is readonly for the guest.  On success the
  * pager can write the page contents to disk and later evict the page.
  */
-static int nominate(struct domain *d, unsigned long gfn_l)
+static int nominate(struct domain *d, gfn_t gfn)
 {
     struct page_info *page;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     p2m_type_t p2mt;
     p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
     mfn_t mfn;
     int ret = -EBUSY;
 
@@ -279,12 +276,11 @@ static int nominate(struct domain *d, un
  * could evict it, eviction can not be done either. In this case the gfn is
  * still backed by a mfn.
  */
-static int evict(struct domain *d, unsigned long gfn_l)
+static int evict(struct domain *d, gfn_t gfn)
 {
     struct page_info *page;
     p2m_type_t p2mt;
     p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
     mfn_t mfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int ret = -EBUSY;
@@ -346,13 +342,12 @@ static int evict(struct domain *d, unsig
  * mfn if populate was called for  gfn which was nominated but not evicted. In
  * this case only the p2mt needs to be forwarded.
  */
-static int prepare(struct domain *d, unsigned long gfn_l,
+static int prepare(struct domain *d, gfn_t gfn,
                    XEN_GUEST_HANDLE_PARAM(const_uint8) buffer)
 {
     struct page_info *page = NULL;
     p2m_type_t p2mt;
     p2m_access_t a;
-    gfn_t gfn = _gfn(gfn_l);
     mfn_t mfn;
     struct p2m_domain *p2m = p2m_get_hostp2m(d);
     int ret, page_extant = 1;
@@ -405,7 +400,7 @@ static int prepare(struct domain *d, uns
         {
             gdprintk(XENLOG_ERR,
                      "Failed to load paging-in gfn %lx Dom%d bytes left %d\n",
-                     gfn_l, d->domain_id, ret);
+                     gfn_x(gfn), d->domain_id, ret);
             ret = -EFAULT;
             goto out;
         }
@@ -421,7 +416,7 @@ static int prepare(struct domain *d, uns
                                                  : p2m_ram_rw, a);
     if ( !ret )
     {
-        set_gpfn_from_mfn(mfn_x(mfn), gfn_l);
+        set_gpfn_from_mfn(mfn_x(mfn), gfn_x(gfn));
 
         if ( !page_extant )
             atomic_dec(&d->paged_pages);
@@ -465,15 +460,15 @@ int mem_paging_memop(XEN_GUEST_HANDLE_PA
     switch( mpo.op )
     {
     case XENMEM_paging_op_nominate:
-        rc = nominate(d, mpo.gfn);
+        rc = nominate(d, _gfn(mpo.gfn));
         break;
 
     case XENMEM_paging_op_evict:
-        rc = evict(d, mpo.gfn);
+        rc = evict(d, _gfn(mpo.gfn));
         break;
 
     case XENMEM_paging_op_prep:
-        rc = prepare(d, mpo.gfn, mpo.buffer);
+        rc = prepare(d, _gfn(mpo.gfn), mpo.buffer);
         if ( !rc )
             copyback = 1;
         break;
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -1835,7 +1835,7 @@ void *map_domain_gfn(struct p2m_domain *
         ASSERT(p2m_is_hostp2m(p2m));
         if ( page )
             put_page(page);
-        p2m_mem_paging_populate(p2m->domain, gfn_x(gfn));
+        p2m_mem_paging_populate(p2m->domain, gfn);
         *pfec = PFEC_page_paged;
         return NULL;
     }
--- a/xen/arch/x86/traps.c
+++ b/xen/arch/x86/traps.c
@@ -848,7 +848,7 @@ int guest_wrmsr_xen(struct vcpu *v, uint
 
             if ( p2m_is_paging(t) )
             {
-                p2m_mem_paging_populate(d, gmfn);
+                p2m_mem_paging_populate(d, _gfn(gmfn));
                 return X86EMUL_RETRY;
             }
 
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -322,7 +322,7 @@ int guest_remove_page(struct domain *d,
 
         put_gfn(d, gmfn);
 
-        p2m_mem_paging_drop_page(d, gmfn, p2mt);
+        p2m_mem_paging_drop_page(d, _gfn(gmfn), p2mt);
 
         return 0;
     }
@@ -1667,7 +1667,7 @@ int check_get_page_from_gfn(struct domai
         if ( page )
             put_page(page);
 
-        p2m_mem_paging_populate(d, gfn_x(gfn));
+        p2m_mem_paging_populate(d, gfn);
         return -EAGAIN;
     }
 #endif
--- a/xen/include/asm-x86/p2m.h
+++ b/xen/include/asm-x86/p2m.h
@@ -732,10 +732,9 @@ static inline void p2m_pod_init(struct p
 int set_shared_p2m_entry(struct domain *d, unsigned long gfn, mfn_t mfn);
 
 /* Tell xenpaging to drop a paged out frame */
-void p2m_mem_paging_drop_page(struct domain *d, unsigned long gfn, 
-                                p2m_type_t p2mt);
+void p2m_mem_paging_drop_page(struct domain *d, gfn_t gfn, p2m_type_t p2mt);
 /* Start populating a paged out frame */
-void p2m_mem_paging_populate(struct domain *d, unsigned long gfn);
+void p2m_mem_paging_populate(struct domain *d, gfn_t gfn);
 /* Resume normal operation (in case a domain was paused) */
 struct vm_event_st;
 void p2m_mem_paging_resume(struct domain *d, struct vm_event_st *rsp);


