Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNBqO4zrt2mzWwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 12:37:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84548298CAC
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 12:37:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255503.1550452 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w25wj-0008I2-Vm; Mon, 16 Mar 2026 11:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255503.1550452; Mon, 16 Mar 2026 11:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w25wj-0008C7-Rv; Mon, 16 Mar 2026 11:17:17 +0000
Received: by outflank-mailman (input) for mailman id 1255503;
 Mon, 16 Mar 2026 11:17:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yLr=BQ=bounce.vates.tech=bounce-md_30504962.69b7e6ac.v1-384f3c454f2b4e7a96bf99f610f55f96@srs-se1.protection.inumbo.net>)
 id 1w25wi-00080O-HU
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 11:17:16 +0000
Received: from mail136-12.atl41.mandrillapp.com
 (mail136-12.atl41.mandrillapp.com [198.2.136.12])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af652f1c-2129-11f1-b164-2bf370ae4941;
 Mon, 16 Mar 2026 12:17:15 +0100 (CET)
Received: from pmta11.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail136-12.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4fZCGh5gmcz5QkW27
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 11:17:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 384f3c454f2b4e7a96bf99f610f55f96; Mon, 16 Mar 2026 11:17:00 +0000
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
X-Inumbo-ID: af652f1c-2129-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773659820; x=1773929820;
	bh=6RYWc6Fjxgy8OveMTnPi/ksrvu05Heao6RIo3wosYw8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pvkx76ahf78bKM6fYZmuZ+wRuUNX+O6vpujMXp8XfA9jurWPMN6l2p1/r17IYvKt/
	 u5GsiPew3GZWQpMVBUt/HBd6XD9/jZ7o2jY//lpm0YjqMttqY9WjwQ2BOWWhpm+oFv
	 jxpZ/wvRgZighI1wY8TuodkidWbwAtOuQ8ASwuRBCVJwX96XwCBeNEavpBGwLSxBFM
	 ZLfXhJp+r9Yf7FM8DN0xEgOfKqJApD5/g7uyZy3ua9ubptLd9MUzxVjlzFe/RMJ/Kc
	 5Wcw174sM7Xxb7omove/6hHpY5+EX+4soSmWv7mzHmkqyHSRRrIIFy2H7B92jfmfOl
	 4LhJs45priH3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773659820; x=1773920320; i=julian.vetter@vates.tech;
	bh=6RYWc6Fjxgy8OveMTnPi/ksrvu05Heao6RIo3wosYw8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=XzCqO8EqfeFZCh5tfbSRLQGEIxJ8xbxHAnfIL3u3MjHI3fgViqivWyelLgVFivG2x
	 +ROtvIb+dX3jqMa6kfum4LU1TEW+sIt1r0LnnxCIOBzZst8G2m3s4YGwJSAiCX+W7P
	 1E8DSsnxNPsj/NNlgTfkZU10GTkGqjIbJckcRV2YA856duhEjR4XVcPsRH2aoTct5d
	 20ZarZGw/CY8+0T/N1rfr+H6fcHFVlMjmlSfpl7BqUN7SVCY1VUSPFYlWZbSo6fLUV
	 HPPUyEKINZkVbSTa36uzCr2RshR0jIMsXTnFeJMrEu0eikGg6QMNaRgzbSy0+Fajfx
	 IQsSTIyjVZPnw==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v5=203/3]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773659819650
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260316111653.178104-4-julian.vetter@vates.tech>
In-Reply-To: <20260316111653.178104-1-julian.vetter@vates.tech>
References: <20260316111653.178104-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.384f3c454f2b4e7a96bf99f610f55f96?=
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,mandrillapp.com:dkim,vates.tech:dkim,vates.tech:mid,vates.tech:email,vates.tech:url];
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
	NEURAL_HAM(-0.00)[-0.942];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 84548298CAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A domain with more than (PAGE_SIZE / sizeof(ioreq_t)) vCPUs needs more
than one ioreq page to hold all per-vCPU ioreq slots. In order to
support this a number of changes have been made:

1. Add nr_ioreq_pages() to compute the required number of pages, defined
   as DIV_ROUND_UP(d->max_vcpus, PAGE_SIZE / sizeof(ioreq_t))
2. ioreq_server_alloc_mfn() now allocates nr_ioreq_pages() pages for the
   non-buf case, builds an mfn_t array, and calls vmap() to map them
   contiguously. The buf path remains single-page.
3. ioreq_server_free_mfn() uses vmap_size() to determine how many pages
   to release.
4. is_ioreq_server_page() loops over all mapped ioreq pages using
   vmap_size() and vmap_to_page() with per-page offsets
5. ioreq_server_get_frame() now handles idx values in the range
   [XENMEM_resource_ioreq_server_frame_ioreq(0),
   XENMEM_resource_ioreq_server_frame_ioreq(nr_pages - 1)], returning
   the MFN via vmap_to_mfn() with the appropriate page offset.

The legacy GFN path (hvm_map_ioreq_gfn) is restricted to single-page.
Domains with more vCPUs must use XENMEM_acquire_resource!

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v5:
- Reduced complexity a lot because there is no distinction between buf
  and !buf case
- Directly use va and gfn from struct ioreq_page, dropped additional
  members in struct ioreq_server
---
 xen/arch/x86/hvm/ioreq.c |   8 +++
 xen/common/ioreq.c       | 103 +++++++++++++++++++++++++++++----------
 xen/include/xen/ioreq.h  |   6 +++
 3 files changed, 90 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 145dcba5c1..872247e300 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -163,6 +163,14 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( d->is_dying )
         return -EINVAL;
 
+    /*
+     * The legacy GFN path supports only a single ioreq page. Guests requiring
+     * more ioreq slots must use the resource mapping interface
+     * (XENMEM_acquire_resource).
+     */
+    if ( !buf && nr_ioreq_pages(d) > 1 )
+        return -EOPNOTSUPP;
+
     base_gfn = hvm_alloc_ioreq_gfn(s);
 
     if ( gfn_eq(base_gfn, INVALID_GFN) )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index b22f656701..71fac2bc7b 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -261,8 +261,9 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
 static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page;
-    mfn_t mfn;
+    unsigned int i, nr_pages = buf ? 1 : nr_ioreq_pages(s->target);
+    mfn_t *mfns;
+    int rc;
 
     if ( iorp->va )
     {
@@ -277,11 +278,20 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
         return 0;
     }
 
+    mfns = xmalloc_array(mfn_t, nr_pages);
+    if ( !mfns )
+        return -ENOMEM;
+
+    for ( i = 0; i < nr_pages; i++ )
     {
-        page = alloc_domheap_page(s->target, MEMF_no_refcount);
+        struct page_info *page = alloc_domheap_page(s->target,
+                                                    MEMF_no_refcount);
 
         if ( !page )
-            return -ENOMEM;
+        {
+            rc = -ENOMEM;
+            goto fail;
+        }
 
         if ( !get_page_and_type(page, s->target, PGT_writable_page) )
         {
@@ -290,41 +300,60 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
              * here is a clear indication of something fishy going on.
              */
             domain_crash(s->emulator);
-            return -ENODATA;
+            rc = -ENODATA;
+            goto fail;
         }
 
-        mfn = page_to_mfn(page);
+        mfns[i] = page_to_mfn(page);
     }
-    iorp->va = vmap(&mfn, 1);
+
+    iorp->va = vmap(mfns, nr_pages);
     if ( !iorp->va )
+    {
+        rc = -ENOMEM;
         goto fail;
+    }
+
+    xfree(mfns);
+
+    for ( i = 0; i < nr_pages; i++ )
+        clear_page((char *)iorp->va + i * PAGE_SIZE);
 
-    clear_page(iorp->va);
     return 0;
 
  fail:
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
+    while ( i-- )
+    {
+        struct page_info *page = mfn_to_page(mfns[i]);
+
+        put_page_alloc_ref(page);
+        put_page_and_type(page);
+    }
+    xfree(mfns);
 
-    return -ENOMEM;
+    return rc;
 }
 
 static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page;
+    unsigned int i, nr_pages;
 
     if ( !iorp->va )
         return;
 
+    nr_pages = vmap_size(iorp->va);
+
+    for ( i = 0; i < nr_pages; i++ )
     {
-        page = vmap_to_page(iorp->va);
-        vunmap(iorp->va);
-        iorp->va = NULL;
+        struct page_info *page = vmap_to_page(iorp->va + i * PAGE_SIZE);
 
         put_page_alloc_ref(page);
         put_page_and_type(page);
     }
+
+    vunmap(iorp->va);
+    iorp->va = NULL;
 }
 
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
@@ -337,12 +366,28 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) == page) ||
-             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page) )
+        if ( s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page )
         {
             found = true;
             break;
         }
+
+        if ( s->ioreq.va )
+        {
+            unsigned int i;
+
+            for ( i = 0; i < vmap_size(s->ioreq.va); i++ )
+            {
+                if ( vmap_to_page(s->ioreq.va + i * PAGE_SIZE) == page )
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
@@ -818,26 +863,30 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
     if ( rc )
         goto out;
 
-    switch ( idx )
+    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq )
     {
-    case XENMEM_resource_ioreq_server_frame_bufioreq:
         rc = -ENOENT;
         if ( !HANDLE_BUFIOREQ(s) )
             goto out;
 
         *mfn = page_to_mfn(vmap_to_page(s->bufioreq.va));
         rc = 0;
-        break;
+    }
+    else if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&
+              idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) )
+    {
+        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
+        if ( page_idx >= vmap_size(s->ioreq.va) )
+        {
+            rc = -EINVAL;
+            goto out;
+        }
 
-    case XENMEM_resource_ioreq_server_frame_ioreq(0):
-        *mfn = page_to_mfn(vmap_to_page(s->ioreq.va));
+        *mfn = vmap_to_mfn(s->ioreq.va + page_idx * PAGE_SIZE);
         rc = 0;
-        break;
-
-    default:
-        rc = -EINVAL;
-        break;
     }
+    else
+        rc = -EINVAL;
 
  out:
     rspin_unlock(&d->ioreq_server.lock);
diff --git a/xen/include/xen/ioreq.h b/xen/include/xen/ioreq.h
index d63fa4729e..c12480472d 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -19,6 +19,7 @@
 #ifndef __XEN_IOREQ_H__
 #define __XEN_IOREQ_H__
 
+#include <xen/macros.h>
 #include <xen/sched.h>
 
 #include <public/hvm/dm_op.h>
@@ -82,6 +83,11 @@ static inline bool ioreq_needs_completion(const ioreq_t *ioreq)
 #define HANDLE_BUFIOREQ(s) \
     ((s)->bufioreq_handling != HVM_IOREQSRV_BUFIOREQ_OFF)
 
+static inline unsigned int nr_ioreq_pages(const struct domain *d)
+{
+    return DIV_ROUND_UP(d->max_vcpus, PAGE_SIZE / sizeof(ioreq_t));
+}
+
 bool domain_has_ioreq_server(const struct domain *d);
 
 bool vcpu_ioreq_pending(struct vcpu *v);
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


