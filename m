Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IH9ZFjsgnGkZ/wMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:39:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BFC1740A3
	for <lists+xen-devel@lfdr.de>; Mon, 23 Feb 2026 10:39:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1238594.1540212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSOp-000341-FO; Mon, 23 Feb 2026 09:38:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1238594.1540212; Mon, 23 Feb 2026 09:38:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuSOp-0002xa-Bj; Mon, 23 Feb 2026 09:38:43 +0000
Received: by outflank-mailman (input) for mailman id 1238594;
 Mon, 23 Feb 2026 09:38:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+Xtg=A3=bounce.vates.tech=bounce-md_30504962.699c201e.v1-dde5a2ce1b074551b450dbac9523d23a@srs-se1.protection.inumbo.net>)
 id 1vuSOo-0002vD-ET
 for xen-devel@lists.xenproject.org; Mon, 23 Feb 2026 09:38:42 +0000
Received: from mail187-10.suw11.mandrillapp.com
 (mail187-10.suw11.mandrillapp.com [198.2.187.10])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eabb233-109b-11f1-9ccf-f158ae23cfc8;
 Mon, 23 Feb 2026 10:38:39 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-10.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fKG4t1KWrz5QkLdk
 for <xen-devel@lists.xenproject.org>; Mon, 23 Feb 2026 09:38:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dde5a2ce1b074551b450dbac9523d23a; Mon, 23 Feb 2026 09:38:38 +0000
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
X-Inumbo-ID: 6eabb233-109b-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771839518; x=1772109518;
	bh=/R/ehowVjGJDfMqCUH806hPdMzW6V7gcOMrwhVu20g4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=KjOBA5yuKAoNMsc/O8Vl9X09BOAi4SaBU6RNOuTj3qFJWqmimKYLE1paJYMcakRXc
	 Vk/zk7XOb8mHKXtHC3F6uq+iK69u1UXmOHdd9rYHgGXpRLe51eXoDzS+s0+Fw5hYTp
	 6y3TNtajuL1lUY8FSXNA5pZkxs8BFazvI7ZgaGRphIULSwlmmFEnegRkYoJTSXMzxQ
	 LnOeeQLp01b9CMJphLPicu+ZDQetnUFpUdboBCUKZywngUnlTQh4k8jporTFHJ4sO4
	 ZXHLenWLrPNFMbegXMY1PMv0tVpobNbDyu0BIPueEu+7Pxa9C6pcpuA26bBWVw/DJC
	 2c0v4f3sshL+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771839518; x=1772100018; i=julian.vetter@vates.tech;
	bh=/R/ehowVjGJDfMqCUH806hPdMzW6V7gcOMrwhVu20g4=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Bmi0xsuNZA4+bQieNBuOtsXUcGFD4GMo3PE3pNFLSuSxeuKyRPmlgBmbxf7SkaGaw
	 ljbgYxlqnKVmOvKzVFjatj3p4/Py4Q0We8CVgwplBvISqblzkSW7Arb8+qMM6ijeEi
	 bSWKU1H6y6tVOBq592d9R/YcvFV86R2X0MwtIoQrv79BMydFEssLFNosN4240/7gl6
	 7H8CKatikf8SFj5V0o+9OHK53xmAkzbjmkZzfXiAB69caL0gpWFPmUSbLf+BsHPVDY
	 GDN33bivMl9wac8pf1par2Zgch0AQsAWd5uzkjDZc7DULrbacSzTOqP3EKX1HomiF+
	 SEBAXfsOPFa8A==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v3=201/2]=20x86/ioreq:=20Prepare=20spacing=20for=20upcoming=20patch?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771839516797
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260223093831.475769-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dde5a2ce1b074551b450dbac9523d23a?=
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
	NEURAL_SPAM(0.00)[0.479];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	R_SPF_ALLOW(0.00)[+a:lists.xenproject.org];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A9BFC1740A3
X-Rspamd-Action: no action

This patch just changes indentation, to make the next patch easier to
review.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v3:
- No changes to this patch
- Dropped patch "1/3 x86/ioreq: Add missing put_page_alloc_ref(page)"
---
 xen/arch/x86/hvm/ioreq.c | 86 ++++++++++++++++++++++------------------
 1 file changed, 47 insertions(+), 39 deletions(-)

diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index a5fa97e149..5ebc48dbd4 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -125,14 +125,16 @@ static void hvm_unmap_ioreq_gfn(struct ioreq_server *s, bool buf)
 {
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return;
 
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
@@ -141,34 +143,36 @@ static int hvm_map_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     int rc;
 
-    if ( iorp->page )
     {
-        /*
-         * If a page has already been allocated (which will happen on
-         * demand if ioreq_server_get_frame() is called), then
-         * mapping a guest frame is not permitted.
-         */
-        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-            return -EPERM;
-
-        return 0;
-    }
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
 
-    if ( d->is_dying )
-        return -EINVAL;
+        if ( d->is_dying )
+            return -EINVAL;
 
-    iorp->gfn = hvm_alloc_ioreq_gfn(s);
+        iorp->gfn = hvm_alloc_ioreq_gfn(s);
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return -ENOMEM;
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return -ENOMEM;
 
-    rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
-                                 &iorp->va);
+        rc = prepare_ring_for_helper(d, gfn_x(iorp->gfn), &iorp->page,
+                                     &iorp->va);
 
-    if ( rc )
-        hvm_unmap_ioreq_gfn(s, buf);
+        if ( rc )
+            hvm_unmap_ioreq_gfn(s, buf);
 
-    return rc;
+        return rc;
+    }
 }
 
 static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
@@ -176,12 +180,14 @@ static void hvm_remove_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct domain *d = s->target;
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return;
 
-    if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
-        domain_crash(d);
-    clear_page(iorp->va);
+        if ( p2m_remove_page(d, iorp->gfn, page_to_mfn(iorp->page), 0) )
+            domain_crash(d);
+        clear_page(iorp->va);
+    }
 }
 
 static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
@@ -190,16 +196,18 @@ static int hvm_add_ioreq_gfn(struct ioreq_server *s, bool buf)
     struct ioreq_page *iorp = buf ? &s->bufioreq : &s->ioreq;
     int rc;
 
-    if ( gfn_eq(iorp->gfn, INVALID_GFN) )
-        return 0;
+    {
+        if ( gfn_eq(iorp->gfn, INVALID_GFN) )
+            return 0;
 
-    clear_page(iorp->va);
+        clear_page(iorp->va);
 
-    rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
-    if ( rc == 0 )
-        paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
+        rc = p2m_add_page(d, iorp->gfn, page_to_mfn(iorp->page), 0, p2m_ram_rw);
+        if ( rc == 0 )
+            paging_mark_pfn_dirty(d, _pfn(gfn_x(iorp->gfn)));
 
-    return rc;
+        return rc;
+    }
 }
 
 int arch_ioreq_server_map_pages(struct ioreq_server *s)
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


