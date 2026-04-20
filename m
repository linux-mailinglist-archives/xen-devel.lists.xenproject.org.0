Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NiHJDY/45WlHpwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 11:57:35 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D334291DD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Apr 2026 11:57:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1285559.1566562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5P-0001Sy-To; Mon, 20 Apr 2026 09:38:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1285559.1566562; Mon, 20 Apr 2026 09:38:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wEl5P-0001Qr-QH; Mon, 20 Apr 2026 09:38:35 +0000
Received: by outflank-mailman (input) for mailman id 1285559;
 Mon, 20 Apr 2026 09:38:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <bounce-md_30504962.69e5f417.v1-52cc267a23d34b12b2a72cd81a0c3c36@bounce.vates.tech>)
 id 1wEl5O-0001Lg-7E
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 09:38:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wEl5M-007TdJ-2M
 for xen-devel@lists.xenproject.org; Mon, 20 Apr 2026 11:38:33 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <bounce-md_30504962.69e5f417.v1-52cc267a23d34b12b2a72cd81a0c3c36@bounce.vates.tech>)
 id 69e5f419-2eae-0a2a0a5409dd-0a2a4505e70c-0
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:33 +0200
Received: from [198.2.137.11] (helo=mail137-11.atl71.mandrillapp.com)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <bounce-md_30504962.69e5f417.v1-52cc267a23d34b12b2a72cd81a0c3c36@bounce.vates.tech>)
 id 69e5f417-aaa8-0a2a45050019-c602890bad21-3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 11:38:33 +0200
Received: from mta004-md-usw2.delv.a.intuit.com (localhost [127.0.0.1])
 by mail137-11.atl71.mandrillapp.com (Mailchimp) with ESMTP id
 4fzgQv3Wr5zDRT7yQ
 for <xen-devel@lists.xenproject.org>; Mon, 20 Apr 2026 09:38:31 +0000 (UTC)
Received: from [37.26.189.201] by mandrillapp.com id
 52cc267a23d34b12b2a72cd81a0c3c36; Mon, 20 Apr 2026 09:38:31 +0000
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
	s=mte1; t=1776677911; x=1776947911;
	bh=gSN+dG6DEEzuWv6g//ewPcup5z/eGaDyrl5RwIr2Dy4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=BQ+eryZrCpEcJoM3E9l+lkBeQzs8Xp8zfqBe/TEfywfJFmnMU95BYvr44mIIb4ajO
	 YR3ONlllI3vTjxGUmCB5lHiVUyaG68fQvZKEOtAam//COjgAZcm8btxHVapng8Iktq
	 pWhT/IxNGiFMLuBNNP7eKPZBRp9HuacLGiCLAKCYsFY0MtNFeH0Q2wFy+I5j1B4ZuL
	 2gGIp18EG+HeQ9BY3yVzaoXVIZbDEB1IuMc+ZOcJp54qW6Dk6MOsqVI2/E9aVqzBUn
	 UKh2kvA9CINu/PvyTLsqcLExVECbDj4E3vcIOszjs6OSgxm0/iRb7qGe34Wx/ZC5aS
	 rsLct+WyO3TWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1776677911; x=1776938411; i=julian.vetter@vates.tech;
	bh=gSN+dG6DEEzuWv6g//ewPcup5z/eGaDyrl5RwIr2Dy4=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Pd8dOW1Xn9C5vBAXW2NBwKw9bIiJU3AMDc80V2pFkPxST9r+Bwh4Kzdv/oeWPgGx6
	 8te7ePDA0cD7EQpk8zg5/J+fVvkje9l5KiGqoUQNwFI+zv4Tgiu9sXyqdSoR8QVdar
	 MMeZMrvUhXe4dHsWicCuNZvPOlhkwu1kUOKO0P2di4qUJuJYFfIBq7eMeGfJ+3C+y9
	 inJRBV2TwURIbm7tRfK9UV2K1E+NBl8GjJ+IAiDFSjobxjQGGJVuT15yq7bX+dnlcx
	 jEOMmJhiCDGybPk/VYSDb4jghGJeIgggiKDFTUBtaB2bcvp77QC77oOhONbsh5MErG
	 jkA8MHCLIM4MA==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v6=201/3]=20ioreq:=20switch=20ioreq=20page=20allocation=20to=20vmap?=
X-Mailer: git-send-email 2.53.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1776677910519
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260420093820.825969-2-julian.vetter@vates.tech>
In-Reply-To: <20260420093820.825969-1-julian.vetter@vates.tech>
References: <20260420093820.825969-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.52cc267a23d34b12b2a72cd81a0c3c36?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260420:md
Date: Mon, 20 Apr 2026 09:38:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-purgate-ID: tlsNG-c201ff/1776677913-E1FDA443-9C96E951/0/0
X-purgate-type: clean
X-purgate-size: 8541
X-Spamd-Result: default: False [4.51 / 15.00];
	URIBL_GREY(2.50)[mandrillapp.com:dkim];
	SUBJ_EXCESS_QP(1.20)[];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.18)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_ALLOW(0.00)[mandrillapp.com:s=mte1,vates.tech:s=mte1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:email,vates.tech:dkim,vates.tech:url,mandrillapp.com:dkim];
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
	NEURAL_SPAM(0.00)[0.635];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 86D334291DD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Switch the Xen-side ioreq page mapping from prepare_ring_for_helper() /
map_domain_page_global() to explicit vmap(), to ensure vmap_to_page()
can recover the struct page_info * uniformly during teardown.

This is a prerequisite for multi-page ioreq support: the non-buf ioreq
region will need to span multiple pages for domains with more vCPUs than
fit in a single page, and vmap() is the natural interface for contiguous
multi-page Xen VA mappings.

In non-debug builds map_domain_page_global() uses the directmap for low
MFNs rather than vmap(), so this change has a small overhead in the
common case. Debug builds already used vmap() indirectly.

With both paths using vmap(), vmap_to_page() can recover the struct
page_info * uniformly, so drop the 'page' field from struct ioreq_page
and update all callers accordingly.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v6:
- Updated commit message to clearly specify why these changes are made
- Added comment to say that this is {prepare,destroy}_ring_for_helper()
  just using vmap_to_page() + v{map,unmap}()
- Kept proper ordering in ioreq_server_free_mfn(), first clearing the va
  pointer before unmapping
---
 xen/arch/x86/hvm/ioreq.c | 55 +++++++++++++++++++++++++++++++++-------
 xen/common/ioreq.c       | 34 +++++++++++++------------
 xen/include/xen/ioreq.h  |  1 -
 3 files changed, 64 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..3cabec141c 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -15,6 +15,7 @@
 #include <xen/sched.h>
 #include <xen/softirq.h>
 #include <xen/trace.h>
+#include <xen/vmap.h>
 #include <xen/vpci.h>
 
 #include <asm/hvm/emulate.h>
@@ -128,8 +129,13 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
 
-    destroy_ring_for_helper(&iorp->va, iorp->page);
-    iorp->page = NULL;
+    /* Equivalent to destroy_ring_for_helper(), using vmap_to_page(). */
+    if ( iorp->va )
+    {
+        put_page_and_type(vmap_to_page(iorp->va));
+        vunmap(iorp->va);
+        iorp->va = NULL;
+    }
 
     hvm_free_ioreq_gfn(s, iorp->gfn);
     iorp->gfn = INVALID_GFN;
@@ -139,9 +145,12 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct domain *d = s->target;
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
+    struct page_info *page;
+    p2m_type_t p2mt;
+    mfn_t mfn;
     int rc;
 
-    if ( iorp->page )
+    if ( iorp->va )
     {
         /*
          * If a page has already been allocated (which will happen on
@@ -162,12 +171,40 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return -ENOMEM;
 
-    rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
-                                 &iorp->va);
-
+    /*
+     * Equivalent to prepare_ring_for_helper() using vmap(). Using vmap()
+     * rather than map_domain_page_global() ensures vmap_to_page() can
+     * recover the struct page_info * uniformly at teardown, which is
+     * needed to support multi-page ioreq mappings (see nr_ioreq_pages()).
+     */
+    rc = check_get_page_from_gfn(d, iorp->gfn, false, &p2mt, &page);
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
+    return 0;
 
+ fail:
+    hvm_unmap_ioreq_gfn(s, buf);
     return rc;
 }
 
@@ -179,7 +216,7 @@ static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
     if ( gfn_eq(iorp->gfn, INVALID_GFN) )
         return;
 
-    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
+    if ( p2m_remove_page(d, iorp->gfn, vmap_to_mfn(iorp->va), 0) )
         domain_crash(d);
     clear_page(iorp->va);
 }
@@ -195,7 +232,7 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
 
     clear_page(iorp->va);
 
-    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
+    rc = p2m_add_page(d, iorp->gfn, vmap_to_mfn(iorp->va), 0, p2m_ram_rw);
     if ( rc == 0 )
         paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
 
diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..d8d02167b4 100644
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
 
@@ -309,15 +310,16 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
 static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
-    struct page_info *page = iorp->page;
+    struct page_info *page;
+    void *va;
 
-    if ( !page )
+    if ( !iorp->va )
         return;
 
-    iorp->page = NULL;
-
-    unmap_domain_page_global(iorp->va);
+    va = iorp->va;
+    page = vmap_to_page(va);
     iorp->va = NULL;
+    vunmap(va);
 
     put_page_alloc_ref(page);
     put_page_and_type(page);
@@ -333,7 +335,8 @@ bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
 
     FOR_EACH_IOREQ_SERVER(d, id, s)
     {
-        if ( (s->ioreq.page == page) || (s->bufioreq.page == page) )
+        if ( (s->ioreq.va && vmap_to_page(s->ioreq.va) == page) ||
+             (s->bufioreq.va && vmap_to_page(s->bufioreq.va) == page) )
         {
             found = true;
             break;
@@ -627,10 +630,9 @@ static void ioreq_server_deinit(struct ioreq_server *s)
      * NOTE: It is safe to call both arch_ioreq_server_unmap_pages() and
      *       ioreq_server_free_pages() in that order.
      *       This is because the former will do nothing if the pages
-     *       are not mapped, leaving the page to be freed by the latter.
-     *       However if the pages are mapped then the former will set
-     *       the page_info pointer to NULL, meaning the latter will do
-     *       nothing.
+     *       are not mapped, leaving the pages to be freed by the latter.
+     *       However if the pages are mapped then the former will clear
+     *       iorp->va, meaning the latter will do nothing.
      */
     arch_ioreq_server_unmap_pages(s);
     ioreq_server_free_pages(s);
@@ -819,12 +821,12 @@ int ioreq_server_get_frame(struct domain *d, ioservid_t id,
         if ( !HANDLE_BUFIOREQ(s) )
             goto out;
 
-        *mfn = page_to_mfn(s->bufioreq.page);
+        *mfn = vmap_to_mfn(s->bufioreq.va);
         rc = 0;
         break;
 
     case XENMEM_resource_ioreq_server_frame_ioreq(0):
-        *mfn = page_to_mfn(s->ioreq.page);
+        *mfn = vmap_to_mfn(s->ioreq.va);
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
2.53.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


