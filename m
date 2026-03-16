Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NMyF4brt2mzWwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 12:37:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 556C3298CA5
	for <lists+xen-devel@lfdr.de>; Mon, 16 Mar 2026 12:37:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1255501.1550439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w25wj-00082Y-8R; Mon, 16 Mar 2026 11:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1255501.1550439; Mon, 16 Mar 2026 11:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1w25wj-00080U-5T; Mon, 16 Mar 2026 11:17:17 +0000
Received: by outflank-mailman (input) for mailman id 1255501;
 Mon, 16 Mar 2026 11:17:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cZEx=BQ=bounce.vates.tech=bounce-md_30504962.69b7e6ac.v1-f9e7604dea514ce6a47de6ca2a96bfec@srs-se1.protection.inumbo.net>)
 id 1w25wg-00080D-TQ
 for xen-devel@lists.xenproject.org; Mon, 16 Mar 2026 11:17:15 +0000
Received: from mail134-15.atl141.mandrillapp.com
 (mail134-15.atl141.mandrillapp.com [198.2.134.15])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a75eee81-2129-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Mar 2026 12:17:01 +0100 (CET)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-15.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4fZCGh4H9jzPm0YZj
 for <xen-devel@lists.xenproject.org>; Mon, 16 Mar 2026 11:17:00 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 f9e7604dea514ce6a47de6ca2a96bfec; Mon, 16 Mar 2026 11:17:00 +0000
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
X-Inumbo-ID: a75eee81-2129-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1773659820; x=1773929820;
	bh=+jyFTwFYuserZEOMpVEgWJSZYL1w2mjTqGK6jzypT0I=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=b/rioPjRFM71JvbNPuslFzKgTlmrGWg2V8o4bkdM6WxuijC+eK6DGxOQn47645q/N
	 czv3nhJ69suuZzBLBWAgD8jLQrfbRGEQiDnN7HAj09jRZMooModCGhtsptThXilng+
	 PCC0WLPbCHm64zQA+MjGa/aYzqP3gb5kMJsWQr0RDf1ux414eO/M3ICXhsl1DhDPRe
	 vsoDz2axejzYZI0yw1InI+SZX7PVlwZ3KzbF2oSKqpucy+qXTMbHB7EXRpEbV/S2si
	 hh1bQhQXAc/63UP+48v17qmAeo+xwQwPaXmsri7MERPf+tSrXRTu3Xujsepmt/KC8l
	 ArFkIhiF3gj7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1773659820; x=1773920320; i=julian.vetter@vates.tech;
	bh=+jyFTwFYuserZEOMpVEgWJSZYL1w2mjTqGK6jzypT0I=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=DOrnxcJNpUJbY4mR1svKfLZ8HBP7FvExNnXxzF7n0rPr65bHWrqaAh4E3URo9aeIj
	 FucUDuZkR/As4TdHB8yf1lC0zqgdzPc6n6w8TG7XkBlU9P4NOxSufBPKodIwZ9w6da
	 tp3GyFkJMh+TSkE1v/f5xnDBnz307aVsH62yVTTNleiw28oTNiHQdEkIXxYpIs8xON
	 Cq9/8+bZhWSy3IhaoYx8QLtUGM1SKcPHDsJ++SSYDa2sGcf3JBuk0CvqVlKec9xR/r
	 n0reaqjZZHL2kJCbjF6g+ip70VH99Nhovmd0HbmJcFwsEnMFXqHh6Z2DO8hTaNUwXi
	 tdD18KwTVITzw==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v5=202/3]=20ioreq:=20Indent=20ioreq=5Fserver=5F{alloc,free}=5Fmfn()=20body=20one=20level=20deeper?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1773659819392
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260316111653.178104-3-julian.vetter@vates.tech>
In-Reply-To: <20260316111653.178104-1-julian.vetter@vates.tech>
References: <20260316111653.178104-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.f9e7604dea514ce6a47de6ca2a96bfec?=
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
	NEURAL_HAM(-0.00)[-0.946];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org:c];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 556C3298CA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

No functional change. It adds a wrapping block to prepare for the loop
that the subsequent patch introduces to handle multiple ioreq pages.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v5
- Added proper commit message and fixed commit title
---
 xen/common/ioreq.c | 40 ++++++++++++++++++++++------------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index 5b026fc1b2..b22f656701 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -277,22 +277,24 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
         return 0;
     }
 
-    page = alloc_domheap_page(s->target, MEMF_no_refcount);
+    {
+        page = alloc_domheap_page(s->target, MEMF_no_refcount);
 
-    if ( !page )
-        return -ENOMEM;
+        if ( !page )
+            return -ENOMEM;
 
-    if ( !get_page_and_type(page, s->target, PGT_writable_page) )
-    {
-        /*
-         * The domain can't possibly know about this page yet, so failure
-         * here is a clear indication of something fishy going on.
-         */
-        domain_crash(s->emulator);
-        return -ENODATA;
-    }
+        if ( !get_page_and_type(page, s->target, PGT_writable_page) )
+        {
+            /*
+             * The domain can't possibly know about this page yet, so failure
+             * here is a clear indication of something fishy going on.
+             */
+            domain_crash(s->emulator);
+            return -ENODATA;
+        }
 
-    mfn = page_to_mfn(page);
+        mfn = page_to_mfn(page);
+    }
     iorp->va = vmap(&mfn, 1);
     if ( !iorp->va )
         goto fail;
@@ -315,12 +317,14 @@ static void ioreq_server_free_mfn(struct ioreq_server *s, bool buf)
     if ( !iorp->va )
         return;
 
-    page = vmap_to_page(iorp->va);
-    vunmap(iorp->va);
-    iorp->va = NULL;
+    {
+        page = vmap_to_page(iorp->va);
+        vunmap(iorp->va);
+        iorp->va = NULL;
 
-    put_page_alloc_ref(page);
-    put_page_and_type(page);
+        put_page_alloc_ref(page);
+        put_page_and_type(page);
+    }
 }
 
 bool is_ioreq_server_page(struct domain *d, const struct page_info *page)
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


