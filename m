Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LoYOaAkk2kX1wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:07:28 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F3144703
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:07:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234160.1537480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytP-0007kB-0J; Mon, 16 Feb 2026 13:44:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234160.1537480; Mon, 16 Feb 2026 13:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytO-0007hr-TT; Mon, 16 Feb 2026 13:44:02 +0000
Received: by outflank-mailman (input) for mailman id 1234160;
 Mon, 16 Feb 2026 13:44:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wTUb=AU=bounce.vates.tech=bounce-md_30504962.69931f1d.v1-dca80abff0c64da19efeaa21a1c9b379@srs-se1.protection.inumbo.net>)
 id 1vrytN-0007hf-69
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 13:44:01 +0000
Received: from mail187-15.suw11.mandrillapp.com
 (mail187-15.suw11.mandrillapp.com [198.2.187.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b388506-0b3d-11f1-b163-2bf370ae4941;
 Mon, 16 Feb 2026 14:43:59 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-15.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4fF3s931BnzPm0PXq
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 13:43:57 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 dca80abff0c64da19efeaa21a1c9b379; Mon, 16 Feb 2026 13:43:57 +0000
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
X-Inumbo-ID: 8b388506-0b3d-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771249437; x=1771519437;
	bh=prpBvrYoPfoemUVfs3/BMcBIrBUZ71dlGXNF25SbH5I=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=gycgvRLNqHG4dN5CpiEl4iAKMBqJsvs2GpOzKjUyG+YkCVGvplhpLUJTsmTR+HWp8
	 A7nk4UYOfiAx2wTYfOfTAaVJAlARxBBmou5LKREDV4VymT/ldpVcoYtpCKci5ZNEc5
	 KSEFskuVsjdpqqPzVNhXKUuAjKaV4BmPZgci4yE0rEvqS2QbWNiniVTNzWpYUakR6A
	 GypHn7MWGD5Mcjj/mHWy10XZXZ0wUkM+yPG/mLXdPxFRNc1309w8cSY89o5dlq75vx
	 0dq7sOgnXpvXMveCvNolyRmnzTgtXzEbv4skvy1x4hO3jsXuym3JTV6d6bhoF2slB1
	 Jyd2QNb4fZK2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771249437; x=1771509937; i=julian.vetter@vates.tech;
	bh=prpBvrYoPfoemUVfs3/BMcBIrBUZ71dlGXNF25SbH5I=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=lonCE8CtF0qoJnimvdGDV6amCnx65em5YnPoPbkg2+ud60LyMiIKZYBW6GZl/Fk0V
	 xoeZ8Tn92tGnx9/fDdw4hbYDxKTV97xnY/kRaD6Zr5HK7gF1zw3YxAoqy25L9Xmtpe
	 0YVKv2hoICsIFOzDfimbtTb0KzLnA2wwXMVKaHnP7EzGwAvgCqtlu+iFVX/QgcUx4k
	 H3Nq3Y59BGxS/qiIQsslGnw6uTQmNFgrIEj+v4V/cv7IBSeos+Flw/0Nf0WKhUlPks
	 EEGpDo+9SinOtjrMgYzDSKQhZVWX5IUP0w52Zd6NlpZI9P8OP5E8hX3ILo1uS/G7j7
	 F9THbbL65o+Eg==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=201/3]=20x86/ioreq:=20Add=20missing=20put=5Fpage=5Falloc=5Fref(page)?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771249436235
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260216134334.3510048-2-julian.vetter@vates.tech>
In-Reply-To: <20260216134334.3510048-1-julian.vetter@vates.tech>
References: <20260216134334.3510048-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.dca80abff0c64da19efeaa21a1c9b379?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 13:43:57 +0000
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim];
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
X-Rspamd-Queue-Id: A70F3144703
X-Rspamd-Action: no action

The page was allocated with MEMF_no_refcount. The MEMF_no_refcount flag
means the page is allocated without a regular reference, but it still
has the allocation reference. If get_page_and_type() fails, we still
need to release the allocation reference. Otherwise the page would leak.
domain_crash() doesn't free individual pages; it just marks the domain
for destruction. The domain teardown will eventually free domain heap
pages, but only those it can find. A page with a dangling alloc ref
would prevent the page from being fully freed during domain cleanup.

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
---
Changes in v2:
- New patch
---
 xen/common/ioreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/ioreq.c b/xen/common/ioreq.c
index f5fd30ce12..5d722c8d4e 100644
--- a/xen/common/ioreq.c
+++ b/xen/common/ioreq.c
@@ -287,6 +287,7 @@ static int ioreq_server_alloc_mfn(struct ioreq_server *s, bool buf)
          * The domain can't possibly know about this page yet, so failure
          * here is a clear indication of something fishy going on.
          */
+        put_page_alloc_ref(page);
         domain_crash(s->emulator);
         return -ENODATA;
     }
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


