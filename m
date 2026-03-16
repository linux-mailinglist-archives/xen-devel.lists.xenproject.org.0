Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oLCCE4Xrt2mzWwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 12:37:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5ED298C9E
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 12:37:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255502.1550445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w25wj-00089P-Jm; Mon, 16 Mar 2026 11:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255502.1550445; Mon, 16 Mar 2026 11:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w25wj-00082j-EJ; Mon, 16 Mar 2026 11:17:17 +0000
Received: by outflank-mailman (input) for mailman id 1255502;
 Mon, 16 Mar 2026 11:17:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di6d=BQ=bounce.vates.tech=bounce-md_30504962.69b7e6ac.v1-096817dc48ee470daf05cea08c53910a@srs-se1.protection.inumbo.net>)
 id 1w25wh-00080D-Fc
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 11:17:15 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7533da5-2129-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 12:17:01 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZCGh2Mgfz5QkT4q
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 11:17:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 096817dc48ee470daf05cea08c53910a; Mon, 16 Mar 2026 11:17:00 +0000
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
X-Inumbo-ID: a7533da5-2129-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773659820; x=1773929820;
	bh=1rdsgYGrdZ+Aj6vu34GfiCU8HteOHeBAK+Ods8sd53g=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=KsoMc2o9rnN1cBHUFtsRMm0buK7ivoy7p+CFHHXmhGwQrtDGvzuYw2clTd47xw562
	 z7hsc38a+9+l9K9orfmcOFch5uxY1qZPqZuAX9n0jhPyP87YKL3aycAJZfxJfa9L6R
	 zPJuC/dKhlGZMlZS3KlRADuAmzCAHpOVeAEYcm1MnVDfm7MQROBQOR6XtNN78UctnX
	 Ci+CNVzEneh6prBdX1YN1KQGsk0VPJ5FPZdLR+7zMWFQgzHkFKSrIK8lIM9xvm+W7r
	 RnPxH8b1LK4XXRqwmwIWfqkj6BdAZKealS7vMdGs7f8hk+I8TgUHX8DuUDqHaqlusd
	 oBDMfK19xUoDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773659820; x=1773920320; i=julian.vetter@vates.tech;
	bh=1rdsgYGrdZ+Aj6vu34GfiCU8HteOHeBAK+Ods8sd53g=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Bxl3/X9AGtgxVEiWpx+oJf9jqOyGEY6Im/amXa19x+ahVssXvRvIqto+OwgcCrVVy
	 olQ7R7Z3oraWvce6WEOvsEK73wo+5Wn4NHlIIo+5qEz6+NssA2rNhNGsKNlUdXa30d
	 umq6uIgRSrqCN4pZRuW//ir54uHyaY7FKS9yhIz9Z9nqW51k9KQSsCuhiWfNUe3rkW
	 CnFYbHqYzEG7KoJGhp9X4RklHR7aBNa4jIo1FQh49SIaohvoqkGIjgytT47mimnB8g
	 VqJq9JrvX8rnvnb9vd8qKUMbmMSAnJ8aLQBGZdMzsp9Bmf2oVKXcy0YUHVh/ka8ZDQ
	 6xsX7tKZ/+GVA==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v5=201/3]=20ioreq:=20Unify=20buf=20and=20non-buf=20ioreq=20page=20management?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773659819095
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260316111653.178104-2-julian.vetter@vates.tech>
In-Reply-To: <20260316111653.178104-1-julian.vetter@vates.tech>
References: <20260316111653.178104-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.096817dc48ee470daf05cea08c53910a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260316:md
Date: Mon, 16 Mar 2026 11:17:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	GREYLIST(0.00)[pass,body];
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
	NEURAL_HAM(-0.00)[-0.939];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: DB5ED298C9E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch the ioreq page mapping in hvm_map_ioreq_gfn() from
prepare_ring_for_helper() / __map_domain_page_global() to explicit
vmap(), aligning it with ioreq_server_alloc_mfn() which already
allocates domain-heap pages and will now also map them via vmap().

With both paths using vmap(), vmap_to_page() can recover the struct
page_info * uniformly during teardown, removing the need to cache the
page pointer in struct ioreq_page. So, drop the 'page' field from struct
ioreq_page and update all callers accordingly.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v5:
- New patch that unforms the buf and non-buf code path
---
 xen/arch/x86/hvm/ioreq.c | 57 ++++++++++++++++++++++++++++++++--------
 xen/common/ioreq.c       | 36 +++++++++++++------------
 xen/include/xen/ioreq.h  |  1 -
 3 files changed, 65 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..145dcba5c1 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -15,6 +15,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/trace.h>
+#include <xen/vmap.h>
 #include <xen/vpci.h>
 
 #include <asm/hvm/emulate.h>
@@ -128,8 +129,9 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
 
-    destroy_ring_for_helper(&iorp->va, iorp->page);
-    iorp->page = NULL;
+    put_page_and_type(vmap_to_page(iorp->va));
+    vunmap(iorp->va);
+    iorp->va = NULL;
 
     hvm_free_ioreq_gfn(s, iorp->gfn);
     iorp->gfn = INVALID_GFN;
@@ -139,9 +141,13 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct page_info *page;
+    p2m_type_t p2mt;
+    gfn_t base_gfn;
+    mfn_t mfn;
     int rc;
 
-    if ( iorp->page )
+    if ( iorp->va )
     {
         /*
          * If a page has already been allocated (which will happen on
@@ -157,17 +163,45 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( d->is_dying )
         return -EINVAL;
 
-    iorp->gfn = hvm_alloc_ioreq_gfn(s);
+    base_gfn = hvm_alloc_ioreq_gfn(s);
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+    if ( gfn_eq(base_gfn, INVALID_GFN) )
         return -ENOMEM;
 
-    rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
-                                 &iorp->va);
-
+    /*
+     * vmap() is used for the Xen-side mapping so that vmap_to_page() can
+     * recover the struct page_info * during teardown, consistent with
+     * ioreq_server_alloc_mfn().
+     */
+    rc = check_get_page_from_gfn(d, base_gfn, false, &p2mt, &page);
     if ( rc )
-        hvm_unmap_ioreq_gfn(s, buf);
+    {
+        if ( rc == -EAGAIN )
+            rc = -ENOENT;
+        goto fail;
+    }
+
+    if ( !get_page_type(page, PGT_writable_page) )
+    {
+        put_page(page);
+        rc = -EINVAL;
+        goto fail;
+    }
+
+    mfn = page_to_mfn(page);
+    iorp->va = vmap(&mfn, 1);
+    if ( !iorp->va )
+    {
+        put_page_and_type(page);
+        rc = -ENOMEM;
+        goto fail;
+    }
+
+    iorp->gfn = base_gfn;
+    return 0;
 
+ fail:
+    hvm_free_ioreq_gfn(s, base_gfn);
     return rc;
 }
 
@@ -179,7 +213,7 @@ static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
 
-    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
+    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(vmap_to_page(iorp->va)), 0) )
         domain_crash(d);
     clear_page(iorp->va);
 }
@@ -195,7 +229,8 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 
     clear_page(iorp->va);
 
-    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
+    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(vmap_to_page(iorp->va)), 0,
+                      p2m_ram_rw);
     if ( rc == 0 )
         paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..5b026fc1b2 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -17,11 +17,11 @@
  */
 
 #include <xen/domain.h>
-#include <xen/domain_page.h>
 #include <xen/event.h>
 #include <xen/init.h>
 #include <xen/ioreq.h>
 #include <xen/irq.h>
+#include <xen/vmap.h>
 #include <xen/lib.h>
 #include <xen/paging.h>
 #include <xen/sched.h>
@@ -262,8 +262,9 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     struct page_info *page;
+    mfn_t mfn;
 
-    if ( iorp->page )
+    if ( iorp->va )
     {
         /*
          * If a guest frame has already been mapped (which may happen
@@ -291,11 +292,11 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
         return -ENODATA;
     }
 
-    iorp->va = __map_domain_page_global(page);
+    mfn = page_to_mfn(page);
+    iorp->va = vmap(&mfn, 1);
     if ( !iorp->va )
         goto fail;
 
-    iorp->page = page;
     clear_page(iorp->va);
     return 0;
 
@@ -309,14 +310,13 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page = iorp->page;
+    struct page_info *page;
 
-    if ( !page )
+    if ( !iorp->va )
         return;
 
-    iorp->page = NULL;
-
-    unmap_domain_page_global(iorp->va);
+    page = vmap_to_page(iorp->va);
+    vunmap(iorp->va);
     iorp->va = NULL;
 
     put_page_alloc_ref(page);
@@ -333,7 +333,8 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
+        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) == page) ||
+             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page) )
         {
             found = true;
             break;
@@ -626,11 +627,12 @@ static void ioreq_server_deinit(struct ioreq_server *s)
     /*
      * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
      *       ioreq_server_free_pages() in that order.
-     *       This is because the former will do nothing if the pages
-     *       are not mapped, leaving the page to be freed by the latter.
-     *       However if the pages are mapped then the former will set
-     *       the page_info pointer to NULL, meaning the latter will do
-     *       nothing.
+     *       arch_ioreq_server_unmap_pages() handles the GFN-mapped path
+     *       (iorp->gfn != INVALID_GFN) and clears iorp->va on completion,
+     *       so ioreq_server_free_pages() will find iorp->va == NULL and
+     *       do nothing. Conversely, pages allocated via the resource path
+     *       have iorp->gfn == INVALID_GFN, so arch_ioreq_server_unmap_pages()
+     *       is a no-op and ioreq_server_free_pages() handles the teardown.
      */
     arch_ioreq_server_unmap_pages(s);
     ioreq_server_free_pages(s);
@@ -819,12 +821,12 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
         if ( !HANDLE_BUFIOREQ(s) )
             goto out;
 
-        *mfn = page_to_mfn(s->bufioreq.page);
+        *mfn = page_to_mfn(vmap_to_page(s->bufioreq.va));
         rc = 0;
         break;
 
     case XENMEM_resource_ioreq_server_frame_ioreq(0):
-        *mfn = page_to_mfn(s->ioreq.page);
+        *mfn = page_to_mfn(vmap_to_page(s->ioreq.va));
         rc = 0;
         break;
 
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index e86f0869fa..d63fa4729e 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -25,7 +25,6 @@
 
 struct ioreq_page {
     gfn_t gfn;
-    struct page_info *page;
     void *va;
 };
 
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


