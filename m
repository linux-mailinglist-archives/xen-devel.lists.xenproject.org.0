Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eHMILxfViWklCAAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1111B10ECF6
	for <lists+xen-devel@lfdr.de>; Mon, 09 Feb 2026 13:37:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1225300.1531771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpQPW-0000Hg-Fp; Mon, 09 Feb 2026 12:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1225300.1531771; Mon, 09 Feb 2026 12:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vpQPW-0000FQ-Cc; Mon, 09 Feb 2026 12:30:38 +0000
Received: by outflank-mailman (input) for mailman id 1225300;
 Mon, 09 Feb 2026 12:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MoWW=AN=bounce.vates.tech=bounce-md_30504962.6989d369.v1-83dfc58c492b4955aa7410bdef83aa34@srs-se1.protection.inumbo.net>)
 id 1vpQPV-0000FK-16
 for xen-devel@lists.xenproject.org; Mon, 09 Feb 2026 12:30:37 +0000
Received: from mail177-22.suw61.mandrillapp.com
 (mail177-22.suw61.mandrillapp.com [198.2.177.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2142db85-05b3-11f1-b162-2bf370ae4941;
 Mon, 09 Feb 2026 13:30:34 +0100 (CET)
Received: from pmta14.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail177-22.suw61.mandrillapp.com (Mailchimp) with ESMTP id
 4f8kYj3m7NzGlspS5
 for <xen-devel@lists.xenproject.org>; Mon,  9 Feb 2026 12:30:33 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 83dfc58c492b4955aa7410bdef83aa34; Mon, 09 Feb 2026 12:30:33 +0000
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
X-Inumbo-ID: 2142db85-05b3-11f1-b162-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1770640233; x=1770910233;
	bh=TfENv7311CbqQTHZdmTk5osd0PeqUAge6A03sADL0to=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=jnNTh1wQUB0i+0aCdmjW+TEhpJC3RBmA/UHU3pZ312mixmiH6IYIyxlqYf3/itEvW
	 ZAg7MNQ1m2I4x2hjWoKmRnB0mx0kwkhDI+SgA15f675VZOmY0OkQ9qWHeuLR5rRLlH
	 X32opi53i+lIF48pNIu3CZjgNnIFbZz2zrrKYPFla1+au6uSZsYliKyIgasm595kn4
	 ThjXiJq1dcg4GJvLQVeD5uDtqMlVCj6ixDbO8pLWmRta+Me1fJc0RXRT4yK8stsed/
	 lH3OR6mJY7rB9HWx1HvhDQFK19HBP7JDnWqVQLQgBVkWJzpZYpmt8axsvkmO8bR7En
	 3AET6lBvDS0qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1770640233; x=1770900733; i=julian.vetter@vates.tech;
	bh=TfENv7311CbqQTHZdmTk5osd0PeqUAge6A03sADL0to=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=vYaceytzXnH1/JB/7kZpZj3Hm2fNaW3/zb/ZyqjcJytATRWDC4XSphZVin267oI6I
	 gCOkIxr0wfMtn/l/htNzX5o7z8UB4kxkop1hWuInTBvAeZKYECdB4CL5QZE+j65kEF
	 i7HV8PUAI8ppStJsWADuZX2UjkOkvdf1VU95Iv0IfwckglSSPkUYSYUtd2Ot8So2fS
	 ha1jt7vwyNSiDmKT0VfThLOidhXRNLBsy0UbCIuaSD5lVxnqGdmZZT+m04hAJuhOsO
	 nVTzKZc1x0aIlPdhADT9HsAyYUkdhfWT1cgMWq1OTD7Ec1ALUA25wJs9qdH/iVBmOI
	 4oLSPApkFyKNA==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1770640232140
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260209123025.2628513-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.83dfc58c492b4955aa7410bdef83aa34?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260209:md
Date: Mon, 09 Feb 2026 12:30:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:julian.vetter@vates.tech,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[mandrillapp.com:+,vates.tech:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[julian.vetter@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[vates.tech,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1111B10ECF6
X-Rspamd-Action: no action

A single shared ioreq page provides PAGE_SIZE/sizeof(struct ioreq) = 128
slots, limiting HVM guests to 128 vCPUs. To support more vCPUs, extend
the ioreq server to allocate multiple contiguous ioreq pages based on
the max number of vCPUs. This patch replaces the single ioreq_page with
an array of pages (ioreq_pages). It also extends the GFN allocation to
find contiguous free GFNs for multi-page mappings. All existing
single-page paths (bufioreq, legacy clients) remain unchanged.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
 xen/arch/x86/hvm/ioreq.c | 160 ++++++++++++++++++++++++++++++---------
 xen/common/ioreq.c       | 145 +++++++++++++++++++++++------------
 xen/include/xen/ioreq.h  |  13 +++-
 3 files changed, 230 insertions(+), 88 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..a5c2a4baca 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -71,6 +71,38 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct ioreq_server *s)
     return INVALID_GFN;
 }
 
+static gfn_t hvm_alloc_ioreq_gfns(struct ioreq_server *s,
+                                  unsigned int nr_pages)
+{
+    struct domain *d = s->target;
+    unsigned long mask = d->arch.hvm.ioreq_gfn.mask;
+    unsigned int i, run;
+
+    /* Find nr_pages consecutive set bits */
+    for ( i = 0, run = 0; i < BITS_PER_LONG; i++ )
+    {
+        if ( test_bit(i, &mask) )
+        {
+            if ( ++run == nr_pages )
+            {
+                /* Found a run - clear all bits and return base GFN */
+                unsigned int start = i - nr_pages + 1;
+                for ( unsigned int j = start; j <= i; j++ )
+                    clear_bit(j, &d->arch.hvm.ioreq_gfn.mask);
+                return _gfn(d->arch.hvm.ioreq_gfn.base + start);
+            }
+        }
+        else
+            run = 0;
+    }
+
+    /* Fall back to legacy for single page only */
+    if ( nr_pages == 1 )
+        return hvm_alloc_legacy_ioreq_gfn(s);
+
+    return INVALID_GFN;
+}
+
 static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
 {
     struct domain *d = s->target;
@@ -121,52 +153,95 @@ static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
     }
 }
 
+static void hvm_free_ioreq_gfns(struct ioreq_server *s, gfn_t gfn,
+                                unsigned int nr_pages)
+{
+    unsigned int i;
+
+    for ( i = 0; i < nr_pages; i++ )
+        hvm_free_ioreq_gfn(s, _gfn(gfn_x(gfn) + i));
+}
+
 static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
+
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            continue;
 
-    destroy_ring_for_helper(&iorp->va, iorp->page);
-    iorp->page = NULL;
+        destroy_ring_for_helper(&iorp->va, iorp->page);
+        iorp->page = NULL;
 
-    hvm_free_ioreq_gfn(s, iorp->gfn);
-    iorp->gfn = INVALID_GFN;
+        hvm_free_ioreq_gfn(s, iorp->gfn);
+        iorp->gfn = INVALID_GFN;
+    }
 }
 
 static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
+    gfn_t base_gfn;
     int rc;
 
-    if ( iorp->page )
+    /* Check if already mapped */
+    for ( i = 0; i < nr_pages; i++ )
     {
-        /*
-         * If a page has already been allocated (which will happen on
-         * demand if ioreq_server_get_frame() is called), then
-         * mapping a guest frame is not permitted.
-         */
-        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-            return -EPERM;
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
 
-        return 0;
+        if ( iorp->page )
+        {
+            /*
+             * If a page has already been allocated (which will happen on
+             * demand if ioreq_server_get_frame() is called), then
+             * mapping a guest frame is not permitted.
+             */
+            if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+                return -EPERM;
+
+            return 0;
+        }
     }
 
     if ( d->is_dying )
         return -EINVAL;
 
-    iorp->gfn = hvm_alloc_ioreq_gfn(s);
+    /* Allocate contiguous GFNs for all pages */
+    base_gfn = buf ? hvm_alloc_ioreq_gfn(s) : hvm_alloc_ioreq_gfns(s, nr_pages);
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+    if ( gfn_eq(base_gfn, INVALID_GFN) )
         return -ENOMEM;
 
-    rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
-                                 &iorp->va);
+    /* Map each page */
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
+
+        iorp->gfn = _gfn(gfn_x(base_gfn) + i);
 
-    if ( rc )
-        hvm_unmap_ioreq_gfn(s, buf);
+        rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
+                                     &iorp->va);
+        if ( rc )
+            goto fail;
+    }
+
+    return 0;
+
+fail:
+    /* Unmap any pages we successfully mapped */
+    while ( i-- > 0 )
+    {
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
+
+        destroy_ring_for_helper(&iorp->va, iorp->page);
+        iorp->page = NULL;
+        iorp->gfn = INVALID_GFN;
+    }
+    hvm_free_ioreq_gfns(s, base_gfn, nr_pages);
 
     return rc;
 }
@@ -174,32 +249,43 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
+
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            continue;
 
-    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
-        domain_crash(d);
-    clear_page(iorp->va);
+        if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
+            domain_crash(d);
+        clear_page(iorp->va);
+    }
 }
 
 static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
     int rc;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return 0;
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
 
-    clear_page(iorp->va);
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            continue;
 
-    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
-    if ( rc == 0 )
-        paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
+        clear_page(iorp->va);
 
-    return rc;
+        rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
+        if ( rc )
+            return rc;
+
+        paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
+    }
+    return 0;
 }
 
 int arch_ioreq_server_map_pages(struct ioreq_server *s)
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..13c638db53 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -95,12 +95,15 @@ static struct ioreq_server *get_ioreq_server(const struct domain *d,
 
 static ioreq_t *get_ioreq(struct ioreq_server *s, struct vcpu *v)
 {
-    shared_iopage_t *p = s->ioreq.va;
+    unsigned int vcpu_id = v->vcpu_id;
+    unsigned int page_idx = vcpu_id / IOREQS_PER_PAGE;
+    unsigned int slot_idx = vcpu_id % IOREQS_PER_PAGE;
+    shared_iopage_t *p = s->ioreqs.page[page_idx].va;
 
     ASSERT((v == current) || !vcpu_runnable(v));
     ASSERT(p != NULL);
 
-    return &p->vcpu_ioreq[v->vcpu_id];
+    return &p->vcpu_ioreq[slot_idx];
 }
 
 /*
@@ -260,84 +263,120 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
 
 static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page;
+    unsigned int i, j, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
 
-    if ( iorp->page )
+    for ( i = 0; i < nr_pages; i++ )
     {
-        /*
-         * If a guest frame has already been mapped (which may happen
-         * on demand if ioreq_server_get_info() is called), then
-         * allocating a page is not permitted.
-         */
-        if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
-            return -EPERM;
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
 
-        return 0;
-    }
+        if ( iorp->page )
+        {
+            /*
+             * If a guest frame has already been mapped (which may happen
+             * on demand if ioreq_server_get_info() is called), then
+             * allocating a page is not permitted.
+             */
+            if ( !gfn_eq(iorp->gfn, INVALID_GFN) )
+                return -EPERM;
+            continue;  /* Already allocated */
+        }
 
-    page = alloc_domheap_page(s->target, MEMF_no_refcount);
+        page = alloc_domheap_page(s->target, MEMF_no_refcount);
+        if ( !page )
+            goto fail;
 
-    if ( !page )
-        return -ENOMEM;
+        if ( !get_page_and_type(page, s->target, PGT_writable_page) )
+        {
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            put_page_alloc_ref(page);
+            domain_crash(s->emulator);
+            return -ENODATA;
+        }
 
-    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(s->emulator);
-        return -ENODATA;
-    }
+        /* Assign early so cleanup can find it */
+        iorp->page = page;
 
-    iorp->va = __map_domain_page_global(page);
-    if ( !iorp->va )
-        goto fail;
+        iorp->va = __map_domain_page_global(page);
+        if ( !iorp->va )
+            goto fail;
+
+        clear_page(iorp->va);
+    }
 
-    iorp->page = page;
-    clear_page(iorp->va);
     return 0;
 
- fail:
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
+fail:
+    /* Free all previously allocated pages */
+    for ( j = 0; j <= i; j++ )
+    {
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[j];
+        if ( iorp->page )
+        {
+            if ( iorp->va )
+                  unmap_domain_page_global(iorp->va);
+            iorp->va = NULL;
+            put_page_alloc_ref(iorp->page);
+            put_page_and_type(iorp->page);
+            iorp->page = NULL;
+        }
+    }
 
     return -ENOMEM;
 }
 
 static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page = iorp->page;
+    unsigned int i, nr_pages = buf ? 1 : NR_IOREQ_PAGES;
 
-    if ( !page )
-        return;
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreqs.page[i];
+        struct page_info *page = iorp->page;
 
-    iorp->page = NULL;
+        if ( !page )
+            continue;
+
+        iorp->page = NULL;
 
-    unmap_domain_page_global(iorp->va);
-    iorp->va = NULL;
+        unmap_domain_page_global(iorp->va);
+        iorp->va = NULL;
 
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
+        put_page_alloc_ref(page);
+        put_page_and_type(page);
+    }
 }
 
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 {
     const struct ioreq_server *s;
-    unsigned int id;
+    unsigned int id, i;
     bool found = false;
 
     rspin_lock(&d->ioreq_server.lock);
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
+        if ( s->bufioreq.page == page )
         {
             found = true;
             break;
         }
+
+        for ( i = 0; i < NR_IOREQ_PAGES; i++ )
+        {
+            if ( s->ioreqs.page[i].page == page )
+            {
+                found = true;
+                break;
+            }
+        }
+
+        if ( found )
+            break;
     }
 
     rspin_unlock(&d->ioreq_server.lock);
@@ -348,9 +387,11 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 static void ioreq_server_update_evtchn(struct ioreq_server *s,
                                        struct ioreq_vcpu *sv)
 {
+    unsigned int page_idx = sv->vcpu->vcpu_id / IOREQS_PER_PAGE;
+
     ASSERT(spin_is_locked(&s->lock));
 
-    if ( s->ioreq.va != NULL )
+    if ( s->ioreqs.page[page_idx].va != NULL )
     {
         ioreq_t *p = get_ioreq(s, sv->vcpu);
 
@@ -579,6 +620,7 @@ static int ioreq_server_init(struct ioreq_server *s,
 {
     struct domain *currd = current->domain;
     struct vcpu *v;
+    unsigned int i;
     int rc;
 
     s->target = d;
@@ -590,7 +632,8 @@ static int ioreq_server_init(struct ioreq_server *s,
     INIT_LIST_HEAD(&s->ioreq_vcpu_list);
     spin_lock_init(&s->bufioreq_lock);
 
-    s->ioreq.gfn = INVALID_GFN;
+    for ( i = 0; i < NR_IOREQ_PAGES; i++ )
+        s->ioreqs.page[i].gfn = INVALID_GFN;
     s->bufioreq.gfn = INVALID_GFN;
 
     rc = ioreq_server_alloc_rangesets(s, id);
@@ -768,8 +811,9 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
             goto out;
     }
 
+    /* Just return the first ireq page because the region is contigeous */
     if ( ioreq_gfn )
-        *ioreq_gfn = gfn_x(s->ioreq.gfn);
+        *ioreq_gfn = gfn_x(s->ioreqs.page[0].gfn);
 
     if ( HANDLE_BUFIOREQ(s) )
     {
@@ -822,12 +866,13 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
         *mfn = page_to_mfn(s->bufioreq.page);
         rc = 0;
         break;
+    case XENMEM_resource_ioreq_server_frame_ioreq(0) ...
+         XENMEM_resource_ioreq_server_frame_ioreq(NR_IOREQ_PAGES - 1):
+        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
 
-    case XENMEM_resource_ioreq_server_frame_ioreq(0):
-        *mfn = page_to_mfn(s->ioreq.page);
+        *mfn = page_to_mfn(s->ioreqs.page[page_idx].page);
         rc = 0;
         break;
-
     default:
         rc = -EINVAL;
         break;
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index e86f0869fa..8604311cb4 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -19,9 +19,16 @@
 #ifndef __XEN_IOREQ_H__
 #define __XEN_IOREQ_H__
 
+#include <xen/lib.h>
 #include <xen/sched.h>
 
 #include <public/hvm/dm_op.h>
+#include <public/hvm/hvm_info_table.h>
+#include <public/hvm/ioreq.h>
+
+/* 4096 / 32 = 128 ioreq slots per page */
+#define IOREQS_PER_PAGE  (PAGE_SIZE / sizeof(struct ioreq))
+#define NR_IOREQ_PAGES   DIV_ROUND_UP(HVM_MAX_VCPUS, IOREQS_PER_PAGE)
 
 struct ioreq_page {
     gfn_t gfn;
@@ -29,6 +36,10 @@ struct ioreq_page {
     void *va;
 };
 
+struct ioreq_pages {
+    struct ioreq_page page[NR_IOREQ_PAGES];
+};
+
 struct ioreq_vcpu {
     struct list_head list_entry;
     struct vcpu      *vcpu;
@@ -45,7 +56,7 @@ struct ioreq_server {
     /* Lock to serialize toolstack modifications */
     spinlock_t             lock;
 
-    struct ioreq_page      ioreq;
+    struct ioreq_pages     ioreqs;
     struct list_head       ioreq_vcpu_list;
     struct ioreq_page      bufioreq;
 
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


