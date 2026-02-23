Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO7bGjwgnGkZ/wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:39:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C591740B1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:39:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238593.1540206 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSOp-0002xw-6h; Mon, 23 Feb 2026 09:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238593.1540206; Mon, 23 Feb 2026 09:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSOp-0002vJ-2H; Mon, 23 Feb 2026 09:38:43 +0000
Received: by outflank-mailman (input) for mailman id 1238593;
 Mon, 23 Feb 2026 09:38:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SUs7=A3=bounce.vates.tech=bounce-md_30504962.699c201e.v1-103dbd66c198486fa7c8d91351ced15a@srs-se1.protection.inumbo.net>)
 id 1vuSOn-0002v7-J8
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 09:38:41 +0000
Received: from mail186-12.suw21.mandrillapp.com
 (mail186-12.suw21.mandrillapp.com [198.2.186.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ecedb2c-109b-11f1-b164-2bf370ae4941;
 Mon, 23 Feb 2026 10:38:39 +0100 (CET)
Received: from pmta10.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail186-12.suw21.mandrillapp.com (Mailchimp) with ESMTP id
 4fKG4t369Wz705b1G
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 09:38:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 103dbd66c198486fa7c8d91351ced15a; Mon, 23 Feb 2026 09:38:38 +0000
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
X-Inumbo-ID: 6ecedb2c-109b-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771839518; x=1772109518;
	bh=M3N/w8dgY0K6W/T6qtHBo2kxcGtEBlKcTIwufvqXy/k=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=jBxVgrJLgfRUuTDhPqPhXH0SGqHO63xegArSj108W0jZO8dA3Wz5v/3R2jhLq91Q+
	 sgkQgy3CuvnR79r6hKpKVzQpoNFqOgUI2Rjpasp9OyTRfdQPd4ofK+x8uv1hYD5wwO
	 KsdDxgBoCtR5TyfVL+cRLK1zW8OTMYVtd110DLodHPWYwlkYWoNTPBcHtceTWvR5dm
	 VyWnz2G0skBq8ewsJsCg7xCP5NEeDM3lobB3JSDb5lh8W2Vt7A7ZTD4Qbkzi97zdfD
	 aXXZ6Zh05HFdz2fBi3zdTrQvoGn1i5/BkAFf537zAO2mkKSWc1nRWuNiunuj1Kogus
	 TshklKBcxmLZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771839518; x=1772100018; i=julian.vetter@vates.tech;
	bh=M3N/w8dgY0K6W/T6qtHBo2kxcGtEBlKcTIwufvqXy/k=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=13FToqzOG04yIxmYoD/0kBw83382TZJKvTI811h2Rn9CDdU1q8zc6TJvgdY4vJl+M
	 uw1e8BC4/Ei4AEm1A/RgrDzq7cTha/FKPRuzu0+BBpq4OTXqK6iWvm8lT9BpZkcJPu
	 xDw9a98QaiydL6PFaryCzH45UCII2U+fmuIy5SuXMbz0QWSFtVNtjieY1Vcnf2QaBt
	 jhODg5LtbnAnqalSEmjuJS9y9kn4ZL9P1GCdxYpQHkc+wOxXTIwUXjUq6PJyfqqmHf
	 1XkCNVtdBBhT/HzEvdRtTosmM4UhhqWt1Rd6bZrgp8fQ/kzQObO6wJA0lGsF7Ydfei
	 ge0LDehmvRrnw==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=202/2]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771839517165
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260223093831.475769-2-julian.vetter@vates.tech>
In-Reply-To: <20260223093831.475769-1-julian.vetter@vates.tech>
References: <20260223093831.475769-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.103dbd66c198486fa7c8d91351ced15a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260223:md
Date: Mon, 23 Feb 2026 09:38:38 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
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
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	NEURAL_SPAM(0.00)[0.488];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 04C591740B1
X-Rspamd-Action: no action

A single shared ioreq page provides PAGE_SIZE/sizeof(ioreq_t) = 128
slots, limiting HVM guests to 128 vCPUs. To support more vCPUs, extend
the ioreq server to use xvzalloc_array() for allocating a contiguous
virtual array of ioreq_t slots sized to d->max_vcpus, backed by
potentially non-contiguous physical pages.

For the GFN-mapped path (x86), page and writable type references are
obtained directly via check_get_page_from_gfn() and get_page_type() for
each GFN. The pages are then combined into a single contiguous VA using
vmap(). The number of ioreq pages is computed at runtime via
nr_ioreq_pages(d) = DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE), so
small VMs only allocate one page. All existing single-page paths
(bufioreq, legacy clients) remain unchanged.

Mark the now-unused shared_iopage_t in the public header as deprecated.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v3:
- Replaced prepare_ring_for_helper + unmap_domain_page_global by
  check_get_page_from_gfn + get_page_type
---

 xen/arch/x86/hvm/ioreq.c       | 208 ++++++++++++++++++++++++++++++++-
 xen/common/ioreq.c             |  95 +++++++++++----
 xen/include/public/hvm/ioreq.h |   5 +
 xen/include/xen/ioreq.h        |  13 ++-
 4 files changed, 295 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 5ebc48dbd4..a042866967 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -11,10 +11,12 @@
 #include <xen/ioreq.h>
 #include <xen/irq.h>
 #include <xen/lib.h>
+#include <xen/p2m-common.h>
 #include <xen/paging.h>
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/trace.h>
+#include <xen/vmap.h>
 #include <xen/vpci.h>
 
 #include <asm/hvm/emulate.h>
@@ -89,6 +91,39 @@ static gfn_t hvm_alloc_ioreq_gfn(struct ioreq_server *s)
     return hvm_alloc_legacy_ioreq_gfn(s);
 }
 
+static gfn_t hvm_alloc_ioreq_gfns(struct ioreq_server *s,
+                                  unsigned int nr_pages)
+{
+    struct domain *d = s->target;
+    unsigned long mask;
+    unsigned int i, run;
+
+    if ( nr_pages == 1 )
+        return hvm_alloc_ioreq_gfn(s);
+
+    /* Find nr_pages consecutive set bits */
+    mask = d->arch.hvm.ioreq_gfn.mask;
+
+    for ( i = 0, run = 0; i < BITS_PER_LONG; i++ )
+    {
+        if ( !test_bit(i, &mask) )
+            run = 0;
+        else if ( ++run == nr_pages )
+        {
+            /* Found a run - clear all bits and return base GFN */
+            unsigned int start = i - nr_pages + 1;
+            unsigned int j;
+
+            for ( j = start; j <= i; j++ )
+                clear_bit(j, &d->arch.hvm.ioreq_gfn.mask);
+
+            return _gfn(d->arch.hvm.ioreq_gfn.base + start);
+        }
+    }
+
+    return INVALID_GFN;
+}
+
 static bool hvm_free_legacy_ioreq_gfn(struct ioreq_server *s,
                                       gfn_t gfn)
 {
@@ -121,11 +156,23 @@ static void hvm_free_ioreq_gfn(struct ioreq_server *s, gfn_t gfn)
     }
 }
 
+static void hvm_free_ioreq_gfns(struct ioreq_server *s, gfn_t gfn,
+                                unsigned int nr_pages)
+{
+    unsigned int i;
+
+    for ( i = 0; i < nr_pages; i++ )
+        hvm_free_ioreq_gfn(s, gfn_add(gfn, i));
+}
+
 static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
             return;
 
@@ -134,16 +181,41 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 
         hvm_free_ioreq_gfn(s, iorp->gfn);
         iorp->gfn = INVALID_GFN;
+        return;
     }
+
+    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+        return;
+
+    nr_pages = nr_ioreq_pages(s->target);
+
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct page_info *pg = vmap_to_page((char *)s->ioreq +
+                                            i * PAGE_SIZE);
+
+        put_page_and_type(pg);
+        put_page(pg);
+    }
+    vunmap(s->ioreq);
+    s->ioreq = NULL;
+
+    hvm_free_ioreq_gfns(s, s->ioreq_gfn, nr_pages);
+    s->ioreq_gfn = INVALID_GFN;
 }
 
 static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages;
+    gfn_t base_gfn;
+    mfn_t *mfns;
     int rc;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( iorp->page )
         {
             /*
@@ -173,30 +245,132 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 
         return rc;
     }
+
+    /* ioreq: multi-page with contiguous VA */
+    if ( s->ioreq )
+    {
+        if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+            return -EPERM;
+        return 0;
+    }
+
+    if ( d->is_dying )
+        return -EINVAL;
+
+    nr_pages = nr_ioreq_pages(d);
+    base_gfn = hvm_alloc_ioreq_gfns(s, nr_pages);
+
+    if ( gfn_eq(base_gfn, INVALID_GFN) )
+        return -ENOMEM;
+
+    mfns = xmalloc_array(mfn_t, nr_pages);
+    if ( !mfns )
+    {
+        hvm_free_ioreq_gfns(s, base_gfn, nr_pages);
+        return -ENOMEM;
+    }
+
+    /*
+     * Obtain a page reference and writable type reference for each GFN.
+     * No per-page VA is needed; all pages are mapped as a single contiguous
+     * VA via vmap() below.
+     */
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        struct page_info *pg;
+        p2m_type_t p2mt;
+
+        rc = check_get_page_from_gfn(d, _gfn(gfn_x(base_gfn) + i),
+                                     false, &p2mt, &pg);
+        if ( rc )
+        {
+            if ( rc == -EAGAIN )
+                rc = -ENOENT;
+            goto fail;
+        }
+
+        if ( !get_page_type(pg, PGT_writable_page) )
+        {
+            put_page(pg);
+            rc = -EINVAL;
+            goto fail;
+        }
+
+        mfns[i] = page_to_mfn(pg);
+    }
+
+    /* Map all mfns as single contiguous VA */
+    s->ioreq = vmap(mfns, nr_pages);
+    if ( !s->ioreq )
+    {
+        rc = -ENOMEM;
+        goto fail;
+    }
+
+    s->ioreq_gfn = base_gfn;
+    xfree(mfns);
+
+    return 0;
+
+ fail:
+    while ( i-- > 0 )
+    {
+        struct page_info *pg = mfn_to_page(mfns[i]);
+
+        put_page_and_type(pg);
+        put_page(pg);
+    }
+    hvm_free_ioreq_gfns(s, base_gfn, nr_pages);
+    xfree(mfns);
+
+    return rc;
 }
 
 static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
             return;
 
         if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
             domain_crash(d);
         clear_page(iorp->va);
+        return;
+    }
+
+    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+        return;
+
+    nr_pages = nr_ioreq_pages(d);
+
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        gfn_t gfn = gfn_add(s->ioreq_gfn, i);
+        struct page_info *pg = vmap_to_page((char *)s->ioreq +
+                                            i * PAGE_SIZE);
+
+        if ( p2m_remove_page(d, gfn, page_to_mfn(pg), 0) )
+            domain_crash(d);
     }
+    memset(s->ioreq, 0, nr_pages * PAGE_SIZE);
 }
 
 static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    unsigned int i, nr_pages;
     int rc;
 
+    if ( buf )
     {
+        struct ioreq_page *iorp = &s->bufioreq;
+
         if ( gfn_eq(iorp->gfn, INVALID_GFN) )
             return 0;
 
@@ -208,6 +382,32 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 
         return rc;
     }
+
+    if ( gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+        return 0;
+
+    nr_pages = nr_ioreq_pages(d);
+    memset(s->ioreq, 0, nr_pages * PAGE_SIZE);
+
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        gfn_t gfn = gfn_add(s->ioreq_gfn, i);
+        struct page_info *pg = vmap_to_page((char *)s->ioreq +
+                                            i * PAGE_SIZE);
+
+        rc = p2m_add_page(d, gfn, page_to_mfn(pg), 0, p2m_ram_rw);
+        if ( rc )
+            /*
+             * No rollback of previously added pages: The caller
+             * (arch_ioreq_server_disable) has no error handling path,
+             * and partial failure here will be cleaned up when the
+             * ioreq server is eventually destroyed.
+             */
+            return rc;
+
+        paging_mark_pfn_dirty(d, _pfn(gfn_x(gfn)));
+    }
+    return 0;
 }
 
 int arch_ioreq_server_map_pages(struct ioreq_server *s)
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..3800c8c62a 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -26,6 +26,7 @@
 #include <xen/paging.h>
 #include <xen/sched.h>
 #include <xen/trace.h>
+#include <xen/xvmalloc.h>
 
 #include <asm/guest_atomics.h>
 #include <asm/ioreq.h>
@@ -95,12 +96,10 @@ static struct ioreq_server *get_ioreq_server(const struct domain *d,
 
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
@@ -260,9 +259,32 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
 
 static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct ioreq_page *iorp;
     struct page_info *page;
 
+    if ( !buf )
+    {
+        if ( s->ioreq )
+        {
+            /*
+             * If a guest frame has already been mapped (which may happen
+             * on demand if ioreq_server_get_info() is called), then
+             * allocating a page is not permitted.
+             */
+            if ( !gfn_eq(s->ioreq_gfn, INVALID_GFN) )
+                return -EPERM;
+
+            return 0;
+        }
+
+        s->ioreq = xvzalloc_array(ioreq_t, s->target->max_vcpus);
+
+        return s->ioreq ? 0 : -ENOMEM;
+    }
+
+    /* bufioreq: single page allocation */
+    iorp = &s->bufioreq;
+
     if ( iorp->page )
     {
         /*
@@ -308,8 +330,17 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 
 static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
-    struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page = iorp->page;
+    struct ioreq_page *iorp;
+    struct page_info *page;
+
+    if ( !buf )
+    {
+        XVFREE(s->ioreq);
+        return;
+    }
+
+    iorp = &s->bufioreq;
+    page = iorp->page;
 
     if ( !page )
         return;
@@ -333,11 +364,29 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 
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
@@ -350,7 +399,7 @@ static void ioreq_server_update_evtchn(struct ioreq_server *s,
 {
     ASSERT(spin_is_locked(&s->lock));
 
-    if ( s->ioreq.va != NULL )
+    if ( s->ioreq != NULL )
     {
         ioreq_t *p = get_ioreq(s, sv->vcpu);
 
@@ -590,7 +639,7 @@ static int ioreq_server_init(struct ioreq_server *s,
     INIT_LIST_HEAD(&s->ioreq_vcpu_list);
     spin_lock_init(&s->bufioreq_lock);
 
-    s->ioreq.gfn = INVALID_GFN;
+    s->ioreq_gfn = INVALID_GFN;
     s->bufioreq.gfn = INVALID_GFN;
 
     rc = ioreq_server_alloc_rangesets(s, id);
@@ -769,7 +818,7 @@ static int ioreq_server_get_info(struct domain *d, ioservid_t id,
     }
 
     if ( ioreq_gfn )
-        *ioreq_gfn = gfn_x(s->ioreq.gfn);
+        *ioreq_gfn = gfn_x(s->ioreq_gfn);
 
     if ( HANDLE_BUFIOREQ(s) )
     {
@@ -812,26 +861,30 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
     if ( rc )
         goto out;
 
-    switch ( idx )
+    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq)
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
+    else if (( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) ) &&
+             ( idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) ))
+    {
+        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
 
-    default:
         rc = -EINVAL;
-        break;
+        if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&
+             page_idx < nr_ioreq_pages(d) && s->ioreq )
+        {
+            *mfn = vmap_to_mfn((char *)s->ioreq + page_idx * PAGE_SIZE);
+            rc = 0;
+        }
     }
+    else
+        rc = -EINVAL;
 
  out:
     rspin_unlock(&d->ioreq_server.lock);
diff --git a/xen/include/public/hvm/ioreq.h b/xen/include/public/hvm/ioreq.h
index 7a6bc760d0..1c1a9e61ae 100644
--- a/xen/include/public/hvm/ioreq.h
+++ b/xen/include/public/hvm/ioreq.h
@@ -49,6 +49,11 @@ struct ioreq {
 };
 typedef struct ioreq ioreq_t;
 
+/*
+ * Deprecated: shared_iopage is no longer used by Xen internally.
+ * The ioreq server now uses a dynamically sized ioreq_t array
+ * to support more than 128 vCPUs.
+ */
 struct shared_iopage {
     struct ioreq vcpu_ioreq[1];
 };
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index e86f0869fa..a4c7621f3f 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -19,9 +19,19 @@
 #ifndef __XEN_IOREQ_H__
 #define __XEN_IOREQ_H__
 
+#include <xen/macros.h>
 #include <xen/sched.h>
 
 #include <public/hvm/dm_op.h>
+#include <public/hvm/ioreq.h>
+
+/* 4096 / 32 = 128 ioreq slots per page */
+#define IOREQS_PER_PAGE  (PAGE_SIZE / sizeof(ioreq_t))
+
+static inline unsigned int nr_ioreq_pages(const struct domain *d)
+{
+    return DIV_ROUND_UP(d->max_vcpus, IOREQS_PER_PAGE);
+}
 
 struct ioreq_page {
     gfn_t gfn;
@@ -45,7 +55,8 @@ struct ioreq_server {
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


