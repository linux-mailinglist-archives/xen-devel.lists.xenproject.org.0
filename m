Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHMDN5T45WlHpwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 11:57:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F24291E4
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 11:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285561.1566580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5S-0001u2-Dc; Mon, 20 Apr 2026 09:38:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285561.1566580; Mon, 20 Apr 2026 09:38:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5S-0001rU-9a; Mon, 20 Apr 2026 09:38:38 +0000
Received: by outflank-mailman (input) for mailman id 1285561;
 Mon, 20 Apr 2026 09:38:36 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e5f418.v1-638eba881eec477b9b9f3a94f3b2a7b1@bounce.vates.tech>)
 id 1wEl5Q-0001iT-OQ
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:38:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEl5O-007TdJ-JO
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 11:38:36 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e5f418.v1-638eba881eec477b9b9f3a94f3b2a7b1@bounce.vates.tech>)
 id 69e5f419-2eae-0a2a0a5409dd-0a2a4505e70c-30
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:36 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e5f418.v1-638eba881eec477b9b9f3a94f3b2a7b1@bounce.vates.tech>)
 id 69e5f419-aaa8-0a2a45050019-c602890be989-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:35 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fzgQw0tbyzDRT7yr
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:38:32 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 638eba881eec477b9b9f3a94f3b2a7b1; Mon, 20 Apr 2026 09:38:32 +0000
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=mte1 header.d=mandrillapp.com header.i="@mandrillapp.com" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"; dkim=pass header.s=mte1 header.d=vates.tech header.i="julian.vetter@vates.tech" header.h="From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:Date:MIME-Version:Content-Type:Content-Transfer-Encoding"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1776677912; x=1776947912;
	bh=DH2Rgk3UV3w32Q7m6Ik6auoISiJxaMmJr2fSdyVJpEU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Ed2ftxkXhN64xYbsJd+PwScEOEw2zeuk/dOLhV7fe1ZNmwIVnT9EF+R4dcdGAXDX7
	 fzeogMH7hxYSJGYyOs8H6U4QeGTtdDw9F22j4Dk3XegB/i1tFi9BOCfewy7EwTix9i
	 qATeicBQTUhvsYyQBU5QbmJ9GcaWlByeDk2Be2bsIKvSAMFo84bkfoqZFETvKf9N4n
	 bxcwhXNb287bNQUCUDg/BCCNDiCqgZPPTR3YeJfHcMjwCfqsw/3Fd493TheEJ24FID
	 PiLHDWJHX4m19knP6WlyOioLbYWLibRVajQP3tICxyZ3qbB7Hex7L9w87SbZPS8iMZ
	 cJ6MoQMPk0kDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776677912; x=1776938412; i=julian.vetter@vates.tech;
	bh=DH2Rgk3UV3w32Q7m6Ik6auoISiJxaMmJr2fSdyVJpEU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=VpAhtjFnsEXe2d0hFm7nzdC098AexlXl2cXGfDV9piBTNpb+Ybb9ZE7wITOkILo4x
	 qfrGsd6jpVbF8U8HwJ8a58xM6nHSdFHyyilCtL5VRmvQHQ+w7zTSnDDYtbEtoCLfMT
	 Lf6o0cWN1iezd5M7PckORfhl1WS2zAwq/kB2QNY9asKQDbw2yQvcbmxilzu63HualS
	 juy9nRU0q6sUcy60/Y2DmnvXguKEg7rg34P7ndYH7BkTscYbCrr2RoXIGMtzdo7QxC
	 cOuf5aY0+zvrjHTdgg9uoHixcUgplnKmRpjhvpdH4N2ztgPr+wXPn3ftDI00wpEKtK
	 cgxXsrS+Zdgxg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v6=203/3]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776677911153
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260420093820.825969-4-julian.vetter@vates.tech>
In-Reply-To: <20260420093820.825969-1-julian.vetter@vates.tech>
References: <20260420093820.825969-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.638eba881eec477b9b9f3a94f3b2a7b1?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260420:md
Date: Mon, 20 Apr 2026 09:38:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776677915-E97A6443-096F3498/0/0
X-purgate-type: clean
X-purgate-size: 8014
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url,mandrillapp.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
	NEURAL_SPAM(0.00)[0.687];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8A6F24291E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As the number of vCPUs grows, a single ioreq page of 128 slots may not
be sufficient. Add support for allocating and mapping multiple ioreq
pages so that the ioreq region can scale with d->max_vcpus.

Introduce nr_ioreq_pages() to compute the number of pages required for
a given domain, and IOREQ_NR_PAGES_MAX as a compile-time upper bound
(based on HVM_MAX_VCPUS).

ioreq_server_alloc_mfn() is updated to allocate nr_ioreq_pages() pages
and map them contiguously via vmap().

is_ioreq_server_page() iterates over all ioreq pages when checking
page ownership. ioreq_server_get_frame() allows callers to retrieve any
ioreq page by index via the XENMEM_acquire_resource interface.

On x86, the legacy GFN mapping path (hvm_map_ioreq_gfn) is limited to
a single ioreq page; device models requiring more ioreq slots must use
the resource mapping interface (XENMEM_acquire_resource).

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v6:
- Adapted the comment to not mention the guest, but the device model
- Replaced the dynamic allocation for the mfns array by a static array
- Fixed error handling in ioreq_server_alloc_mfn, using an extra
  nr_alloc variable to track the already allocated pages
- Dropped unnecessary void casts
---
 xen/arch/x86/hvm/ioreq.c |  8 ++++
 xen/common/ioreq.c       | 93 ++++++++++++++++++++++++++++------------
 xen/include/xen/ioreq.h  | 12 ++++++
 3 files changed, 86 insertions(+), 27 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index 3cabec141c..ee679bdf5a 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -166,6 +166,14 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( d->is_dying )
         return -EINVAL;
 
+    /*
+     * The legacy GFN path supports only a single ioreq page. Device models
+     * requiring more ioreq slots must use the resource mapping interface
+     * (XENMEM_acquire_resource).
+     */
+    if ( !buf && nr_ioreq_pages(d) > 1 )
+        return -EOPNOTSUPP;
+
     iorp->gfn = hvm_alloc_ioreq_gfn(s);
 
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index bae9b99c99..3a08e77597 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -261,8 +261,11 @@ bool vcpu_ioreq_handle_completion(struct vcpu *v)
 static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page;
-    mfn_t mfn;
+    unsigned int i, nr_alloc = 0, nr_pages = buf ? 1 : nr_ioreq_pages(s->target);
+    mfn_t mfns[IOREQ_NR_PAGES_MAX] = {};
+    int rc;
+
+    ASSERT(nr_pages <= IOREQ_NR_PAGES_MAX);
 
     if ( iorp->va )
     {
@@ -277,11 +280,16 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
         return 0;
     }
 
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
@@ -290,41 +298,59 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
              * here is a clear indication of something fishy going on.
              */
             domain_crash(s->emulator);
-            return -ENODATA;
+            rc = -ENODATA;
+            goto fail;
         }
 
-        mfn = page_to_mfn(page);
+        mfns[nr_alloc++] = page_to_mfn(page);
     }
-    iorp->va = vmap(&mfn, 1);
+
+    iorp->va = vmap(mfns, nr_pages);
     if ( !iorp->va )
+    {
+        rc = -ENOMEM;
         goto fail;
+    }
 
-    clear_page(iorp->va);
+    memset(iorp->va, 0, nr_pages * PAGE_SIZE);
     return 0;
 
  fail:
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
+    while ( nr_alloc-- )
+    {
+        struct page_info *page = mfn_to_page(mfns[nr_alloc]);
+
+        put_page_alloc_ref(page);
+        put_page_and_type(page);
+    }
 
-    return -ENOMEM;
+    return rc;
 }
 
 static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page;
+    unsigned int i, nr_pages = buf ? 1 : nr_ioreq_pages(s->target);
+    struct page_info *pages[IOREQ_NR_PAGES_MAX];
     void *va;
 
     if ( !iorp->va )
         return;
 
+    ASSERT(nr_pages <= IOREQ_NR_PAGES_MAX);
+
+    for ( i = 0; i < nr_pages; i++ )
+        pages[i] = vmap_to_page(iorp->va + i * PAGE_SIZE);
+
     va = iorp->va;
-    page = vmap_to_page(va);
     iorp->va = NULL;
     vunmap(va);
 
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
+    for ( i = 0; i < nr_pages; i++ )
+    {
+        put_page_alloc_ref(pages[i]);
+        put_page_and_type(pages[i]);
+    }
 }
 
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
@@ -337,12 +363,25 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) == page) ||
-             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page) )
+        unsigned int i;
+
+        if ( s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page )
         {
             found = true;
             break;
         }
+
+        for ( i = 0; i < nr_ioreq_pages(d) && s->ioreq.va; i++ )
+        {
+            if ( vmap_to_page(s->ioreq.va + i * PAGE_SIZE) == page )
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
@@ -816,26 +855,26 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
     if ( rc )
         goto out;
 
-    switch ( idx )
+    if ( idx == XENMEM_resource_ioreq_server_frame_bufioreq )
     {
-    case XENMEM_resource_ioreq_server_frame_bufioreq:
         rc = -ENOENT;
         if ( !HANDLE_BUFIOREQ(s) )
             goto out;
 
         *mfn = vmap_to_mfn(s->bufioreq.va);
         rc = 0;
-        break;
+    }
+    else if ( idx >= XENMEM_resource_ioreq_server_frame_ioreq(0) &&
+              idx < XENMEM_resource_ioreq_server_frame_ioreq(nr_ioreq_pages(d)) )
+    {
+        unsigned int page_idx = idx - XENMEM_resource_ioreq_server_frame_ioreq(0);
 
-    case XENMEM_resource_ioreq_server_frame_ioreq(0):
-        *mfn = vmap_to_mfn(s->ioreq.va);
+        ASSERT(page_idx < nr_ioreq_pages(d));
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
index d63fa4729e..d2a08c2371 100644
--- a/xen/include/xen/ioreq.h
+++ b/xen/include/xen/ioreq.h
@@ -35,6 +35,18 @@ struct ioreq_vcpu {
     bool             pending;
 };
 
+/*
+ * Maximum number of ioreq pages, based on the maximum number
+ * of vCPUs and the number of ioreq slots per page.
+ */
+#define IOREQ_NR_PAGES_MAX \
+    DIV_ROUND_UP(HVM_MAX_VCPUS, PAGE_SIZE / sizeof(ioreq_t))
+
+static inline unsigned int nr_ioreq_pages(const struct domain *d)
+{
+    return DIV_ROUND_UP(d->max_vcpus, PAGE_SIZE / sizeof(ioreq_t));
+}
+
 #define NR_IO_RANGE_TYPES (XEN_DMOP_IO_RANGE_PCI + 1)
 #define MAX_NR_IO_RANGES  256
 
-- 
2.53.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


