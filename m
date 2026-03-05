Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LqaDM2EqWkd9gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:27:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE31121295A
	for <lists+xen-devel@lfdr.de>; Thu, 05 Mar 2026 14:27:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1246592.1545718 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy8Np-0007vx-1r; Thu, 05 Mar 2026 13:04:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1246592.1545718; Thu, 05 Mar 2026 13:04:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vy8No-0007uY-V0; Thu, 05 Mar 2026 13:04:52 +0000
Received: by outflank-mailman (input) for mailman id 1246592;
 Thu, 05 Mar 2026 13:04:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p/64=BF=bounce.vates.tech=bounce-md_30504962.69a97f6b.v1-0d585d8382c04640a12e640d66f54b56@srs-se1.protection.inumbo.net>)
 id 1vy8Nm-0007uB-S4
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2026 13:04:50 +0000
Received: from mail177-30.suw61.mandrillapp.com
 (mail177-30.suw61.mandrillapp.com [198.2.177.30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e11a26bd-1893-11f1-9ccf-f158ae23cfc8;
 Thu, 05 Mar 2026 14:04:44 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-30.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4fRVB33T3RzP0K0df
 for <xen-devel@lists.xenproject.org>; Thu,  5 Mar 2026 13:04:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 0d585d8382c04640a12e640d66f54b56; Thu, 05 Mar 2026 13:04:43 +0000
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
X-Inumbo-ID: e11a26bd-1893-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1772715883; x=1772985883;
	bh=IXlDfmTfGN+c9jtpxObZGu4U9n4TAcmm6nuDw2iup0I=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=sE/UypS4ZvLj32q1KgN6IBCl0wUTzmRCErAD631xwGm4u8t/L4bEhFl+c6YMSGFjd
	 ZTPFv7j8PTbkg+88dnjkwZEGcl0m9c3XwFw3US8CheP9D032F4T485n0hwOUNiOMsU
	 31upG5UPYuyxU7wF921okC+yx+ABjQ9ojojCGPY/SJplWlTz/q+vWo7+izmYDaZcVb
	 WS1bU6dw55VJLWkDC4d9gFcgEdlKb2IGJo9ea1TD7QTZrXlP1IIceK11MAvZ+DTKqT
	 oUuBEHALTOVdpB0cpHAY2gkd//8xGtrcHXt11L1s8DlR/URCy+ehDjvI6bmLwy9R1D
	 f8ZZAOnitmK9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1772715883; x=1772976383; i=julian.vetter@vates.tech;
	bh=IXlDfmTfGN+c9jtpxObZGu4U9n4TAcmm6nuDw2iup0I=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=GDpNyJVM0XSqh7QcDOzZFZxIAG4G/BvTQuDUiHEySjChLAGA+P7QohBXdb0OMyAB5
	 jaae4rwTBEQ3U722yufpNB28Qln3UEwoTViO1bwBySbDODCgfo4qopZXKq0A4H/W8P
	 d8uA76ThPWff4M6wAmXEb+opvzFA/DBmF+ert7CU0dVAgnU45+6M3eW2YyakpyH2Fi
	 frvdU4iBV/GZT2nAopQIURYyqgCTqJjw013/OuW6dJlr4bqzfNmHysSkC0q8BD9/k3
	 Vr76scOhHRjEga/RvkWay8bHzUkXLsp0tJKZuXSz1ciY57UcJ9mn3uqlBDCB7xCmXw
	 8iIJsjDEHTMUQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v4=202/2]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1772715882225
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260305130434.635276-2-julian.vetter@vates.tech>
In-Reply-To: <20260305130434.635276-1-julian.vetter@vates.tech>
References: <20260305130434.635276-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.0d585d8382c04640a12e640d66f54b56?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260305:md
Date: Thu, 05 Mar 2026 13:04:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BE31121295A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,vates.tech:dkim,vates.tech:email,vates.tech:url,vates.tech:mid];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	NEURAL_HAM(-0.00)[-0.812];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

A single shared ioreq page provides PAGE_SIZE/sizeof(ioreq_t) = 128
slots, limiting HVM guests to 128 vCPUs. To support more vCPUs, the
single struct ioreq_page in the ioreq_server is replaced with an ioreq_t
pointer backed by a dynamically sized allocation.
For the resource mapping path (XENMEM_acquire_resource), the common
ioreq_server_alloc_mfn() allocates nr_ioreq_pages(d) domain heap pages
with MEMF_no_refcount and writable type references, then maps them as a
single contiguous VA via vmap(). Teardown recovers the pages from the
vmap address via vmap_size() and vmap_to_page().
The legacy GFN-mapped path continues to support only a single ioreq
page. For domains whose vCPU count exceeds PAGE_SIZE/sizeof(ioreq_t),
hvm_map_ioreq_gfn() returns -EOPNOTSUPP. Those domains need to use the
resource mapping interface. This also avoids fragmentation when
allocating multiple slots from the GFN pool. The GFN path uses vmap()
for the Xen-side mapping, consistent with ioreq_server_alloc_mfn(),
allowing vmap_to_page() to recover the page during teardown.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v4:
- Dropped the multi-page support for the legacy GFN-mapped path
  - When 'nr_ioreq_pages(d) > 1' -> -EOPNOTSUPP
  - But now also use vmap(), same as in resource mapping path, so new
    s->ioreq pointer is used in either case
  - Mirror exactly what prepare_ring_for_helper/destroy_ring_for_helper
    is doing except the __map_domain_page_global (replaced by
    vmap/vunmap)
- Replaced xvzalloc_array() by xvmalloc_array() -> No need to have mfns
  array zero'ed
- Inverted logic in ioreq_server_alloc_mfn() and ioreq_server_free_mfn()
  to check for 'if (buf)' (same as in the GFN-mapped path)
- Fixed ioreq_server_alloc_mfn -> Correctly call alloc_domheap_page +
  get_page_and_type
- Fixed error handling and teardown path to correctly call
  put_page_alloc_ref + put_page_and_type just like for the bufioreq
- Kept shared_iopage_t so QEMU, varstored, etc. can just reference into
  it via p->ioreq[cpu_id] -> No modification needed
---
 xen/arch/x86/hvm/ioreq.c | 153 ++++++++++++++++++++++++++++++++----
 xen/common/ioreq.c       | 166 ++++++++++++++++++++++++++++++++-------
 xen/include/xen/ioreq.h  |  10 ++-
 3 files changed, 286 insertions(+), 43 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 355b2ba12c..ec4f210768 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -15,6 +15,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/trace.h>
+#include <xen/vmap.h>
 #include <xen/vpci.h>
 
 #include <asm/hvm/emulate.h>
@@ -123,9 +124,10 @@ static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
 
 static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
             return;
 
@@ -134,16 +136,33 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 
         hvm_free_ioreq_gfn(s, iorp->gfn);
         iorp->gfn = INVALID_GFN;
+        return;
     }
+
+    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+        return;
+
+    put_page_and_type(vmap_to_page((void *)s->ioreq));
+    vunmap(s->ioreq);
+    s->ioreq = NULL;
+
+    hvm_free_ioreq_gfn(s, s->ioreq_gfn);
+    s->ioreq_gfn = INVALID_GFN;
 }
 
 static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    gfn_t base_gfn;
+    struct page_info *pg;
+    p2m_type_t p2mt;
+    mfn_t mfn;
     int rc;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( iorp->page )
         {
             /*
@@ -173,35 +192,141 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 
         return rc;
     }
+
+    if ( s->ioreq )
+    {
+        /*
+         * If pages have already been allocated (which will happen on
+         * demand if ioreq_server_get_frame() is called), then
+         * mapping a guest frame is not permitted.
+         */
+        if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+            return -EPERM;
+        return 0;
+    }
+
+    /*
+     * The legacy GFN path supports only a single ioreq page. Guests requiring
+     * more ioreq slots must use the resource mapping interface
+     * (XENMEM_acquire_resource).
+     */
+    if ( nr_ioreq_pages(d) > 1 )
+        return -EOPNOTSUPP;
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    base_gfn = hvm_alloc_ioreq_gfn(s);
+
+    if ( gfn_eq(base_gfn, INVALID_GFN) )
+        return -ENOMEM;
+
+    /*
+     * The page management is the same as prepare_ring_for_helper(), but vmap()
+     * is used instead of __map_domain_page_global() to be consistent with
+     * ioreq_server_alloc_mfn(), which uses vmap() to map potentially multiple
+     * pages. This also allows vmap_to_page() to recover the struct page_info *
+     * from s->ioreq during teardown.
+     */
+    rc = check_get_page_from_gfn(d, base_gfn, false, &p2mt, &pg);
+    if ( rc )
+    {
+        if ( rc == -EAGAIN )
+            rc = -ENOENT;
+        goto fail;
+    }
+
+    if ( !get_page_type(pg, PGT_writable_page) )
+    {
+        put_page(pg);
+        rc = -EINVAL;
+        goto fail;
+    }
+
+    mfn = page_to_mfn(pg);
+    s->ioreq = vmap(&mfn, 1);
+    if ( !s->ioreq )
+    {
+        put_page_and_type(pg);
+        rc = -ENOMEM;
+        goto fail;
+    }
+
+    s->ioreq_gfn = base_gfn;
+    return 0;
+
+ fail:
+    hvm_free_ioreq_gfn(s, base_gfn);
+    return rc;
 }
 
 static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct page_info *pg;
+    void *va;
+    gfn_t gfn;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    if ( buf )
+    {
+        struct ioreq_page *iorp = &s->bufioreq;
+
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return;
+
+        gfn = iorp->gfn;
+        pg = iorp->page;
+        va = iorp->va;
+    }
+    else
+    {
+        if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+            return;
 
-    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
+        gfn = s->ioreq_gfn;
+        pg = vmap_to_page(s->ioreq);
+        va = s->ioreq;
+    }
+
+    if ( p2m_remove_page(d, gfn, page_to_mfn(pg), 0) )
         domain_crash(d);
-    clear_page(iorp->va);
+    clear_page(va);
 }
 
 static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct page_info *pg;
+    void *va;
+    gfn_t gfn;
     int rc;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return 0;
+    if ( buf )
+    {
+        struct ioreq_page *iorp = &s->bufioreq;
+
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return 0;
+
+        gfn = iorp->gfn;
+        pg = iorp->page;
+        va = iorp->va;
+    }
+    else
+    {
+        if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+            return 0;
+
+        gfn = s->ioreq_gfn;
+        pg = vmap_to_page(s->ioreq);
+        va = s->ioreq;
+    }
 
-    clear_page(iorp->va);
+    clear_page(va);
 
-    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
+    rc = p2m_add_page(d, gfn, page_to_mfn(pg), 0, p2m_ram_rw);
     if ( rc == 0 )
-        paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
+        paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn)));
 
     return rc;
 }
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 2e284ad26c..5a09e2ba36 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -26,6 +26,8 @@
 #include <xen/paging.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
+#include <xen/vmap.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/guest_atomics.h>
 #include <asm/ioreq.h>
@@ -95,12 +97,10 @@ static struct ioreq_server *get_ioreq_server(const struct domain *d,
 
 static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
 {
-    shared_iopage_t *p = s->ioreq.va;
-
     ASSERT((v == current) || !vcpu_runnable(v));
-    ASSERT(p != NULL);
+    ASSERT(s->ioreq != NULL);
 
-    return &p->vcpu_ioreq[v->vcpu_id];
+    return &s->ioreq[v->vcpu_id];
 }
 
 /*
@@ -260,10 +260,16 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
 
 static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page;
+    unsigned int i, nr_pages;
+    mfn_t *mfns;
+    int rc;
 
+    /* bufioreq: single page allocation */
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+        struct page_info *page;
+
         if ( iorp->page )
         {
             /*
@@ -294,26 +300,92 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 
         iorp->va = __map_domain_page_global(page);
         if ( !iorp->va )
-            goto fail;
+        {
+            put_page_alloc_ref(page);
+            put_page_and_type(page);
+            return -ENOMEM;
+        }
 
         iorp->page = page;
         clear_page(iorp->va);
         return 0;
     }
 
- fail:
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
+    /* ioreq: multi-page allocation */
+    if ( s->ioreq )
+    {
+        /*
+         * If a guest frame has already been mapped (which may happen
+         * on demand if ioreq_server_get_info() is called), then
+         * allocating a page is not permitted.
+         */
+        if ( !gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+            return -EPERM;
+
+        return 0;
+    }
+
+    nr_pages = nr_ioreq_pages(s->target);
+    mfns = xvmalloc_array(mfn_t, nr_pages);
+
+    if ( !mfns )
+        return -ENOMEM;
+
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct page_info *pg = alloc_domheap_page(s->target,
+                                                  MEMF_no_refcount);
+
+        rc = -ENOMEM;
+        if ( !pg )
+            goto fail_pages;
+
+        if ( !get_page_and_type(pg, s->target, PGT_writable_page) )
+        {
+            /*
+             * The domain can't possibly know about this page yet, so
+             * failure here is a clear indication of something fishy
+             * going on.
+             */
+            domain_crash(s->emulator);
+            rc = -ENODATA;
+            goto fail_pages;
+        }
+
+        mfns[i] = page_to_mfn(pg);
+    }
+
+    s->ioreq = vmap(mfns, nr_pages);
+    if ( !s->ioreq )
+    {
+        rc = -ENOMEM;
+        i = nr_pages;
+        goto fail_pages;
+    }
+
+    memset(s->ioreq, 0, nr_pages * PAGE_SIZE);
+    xvfree(mfns);
+    return 0;
 
-    return -ENOMEM;
+ fail_pages:
+    while ( i-- > 0 )
+    {
+        struct page_info *pg = mfn_to_page(mfns[i]);
+
+        put_page_alloc_ref(pg);
+        put_page_and_type(pg);
+    }
+    xvfree(mfns);
+    return rc;
 }
 
 static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page = iorp->page;
-
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+        struct page_info *page = iorp->page;
+
         if ( !page )
             return;
 
@@ -324,6 +396,23 @@ static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 
         put_page_alloc_ref(page);
         put_page_and_type(page);
+        return;
+    }
+
+    if ( s->ioreq )
+    {
+        unsigned int i, nr_pages = vmap_size(s->ioreq);
+
+        for ( i = 0; i < nr_pages; i++ )
+        {
+            struct page_info *pg = vmap_to_page((void *)s->ioreq +
+                                                i * PAGE_SIZE);
+
+            put_page_alloc_ref(pg);
+            put_page_and_type(pg);
+        }
+        vunmap(s->ioreq);
+        s->ioreq = NULL;
     }
 }
 
@@ -337,11 +426,29 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
+        if ( s->bufioreq.page == page )
         {
             found = true;
             break;
         }
+
+        if ( s->ioreq )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < nr_ioreq_pages(d); i++ )
+            {
+                if ( vmap_to_page((char *)s->ioreq +
+                                  i * PAGE_SIZE) == page )
+                {
+                    found = true;
+                    break;
+                }
+            }
+
+            if ( found )
+                break;
+        }
     }
 
     rspin_unlock(&d->ioreq_server.lock);
@@ -354,7 +461,7 @@ static void ioreq_server_update_evtchn(struct ioreq_server *s,
 {
     ASSERT(spin_is_locked(&s->lock));
 
-    if ( s->ioreq.va != NULL )
+    if ( s->ioreq != NULL )
     {
         ioreq_t *p = get_ioreq(s, sv->vcpu);
 
@@ -594,7 +701,7 @@ static int ioreq_server_init(struct ioreq_server *s,
     INIT_LIST_HEAD(&s->ioreq_vcpu_list);
     spin_lock_init(&s->bufioreq_lock);
 
-    s->ioreq.gfn = INVALID_GFN;
+    s->ioreq_gfn = INVALID_GFN;
     s->bufioreq.gfn = INVALID_GFN;
 
     rc = ioreq_server_alloc_rangesets(s, id);
@@ -773,7 +880,7 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
     }
 
     if ( ioreq_gfn )
-        *ioreq_gfn = gfn_x(s->ioreq.gfn);
+        *ioreq_gfn = gfn_x(s->ioreq_gfn);
 
     if ( HANDLE_BUFIOREQ(s) )
     {
@@ -816,26 +923,29 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
     if ( rc )
         goto out;
 
-    switch ( idx )
+    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq )
     {
-    case XENMEM_resource_ioreq_server_frame_bufioreq:
         rc = -ENOENT;
         if ( !HANDLE_BUFIOREQ(s) )
             goto out;
 
         *mfn = page_to_mfn(s->bufioreq.page);
         rc = 0;
-        break;
-
-    case XENMEM_resource_ioreq_server_frame_ioreq(0):
-        *mfn = page_to_mfn(s->ioreq.page);
-        rc = 0;
-        break;
+    }
+    else if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&
+              idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) )
+    {
+        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
 
-    default:
         rc = -EINVAL;
-        break;
+        if ( s->ioreq )
+        {
+            *mfn = vmap_to_mfn((void *)s->ioreq + page_idx * PAGE_SIZE);
+            rc = 0;
+        }
     }
+    else
+        rc = -EINVAL;
 
  out:
     rspin_unlock(&d->ioreq_server.lock);
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index e86f0869fa..41650a59ca 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -19,9 +19,16 @@
 #ifndef __XEN_IOREQ_H__
 #define __XEN_IOREQ_H__
 
+#include <xen/macros.h>
 #include <xen/sched.h>
 
 #include <public/hvm/dm_op.h>
+#include <public/hvm/ioreq.h>
+
+static inline unsigned int nr_ioreq_pages(const struct domain *d)
+{
+    return DIV_ROUND_UP(d->max_vcpus, PAGE_SIZE / sizeof(ioreq_t));
+}
 
 struct ioreq_page {
     gfn_t gfn;
@@ -45,7 +52,8 @@ struct ioreq_server {
     /* Lock to serialize toolstack modifications */
     spinlock_t             lock;
 
-    struct ioreq_page      ioreq;
+    ioreq_t                *ioreq;
+    gfn_t                  ioreq_gfn;
     struct list_head       ioreq_vcpu_list;
     struct ioreq_page      bufioreq;
 
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


