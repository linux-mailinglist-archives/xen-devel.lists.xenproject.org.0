Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMi4JTQlk2kX1wEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:09:56 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 498BE144741
	for <lists+xen-devel@lfdr.de>; Mon, 16 Feb 2026 15:09:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1234161.1537490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytQ-0007x6-Ay; Mon, 16 Feb 2026 13:44:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1234161.1537490; Mon, 16 Feb 2026 13:44:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vrytQ-0007vL-7X; Mon, 16 Feb 2026 13:44:04 +0000
Received: by outflank-mailman (input) for mailman id 1234161;
 Mon, 16 Feb 2026 13:44:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=as6u=AU=bounce.vates.tech=bounce-md_30504962.69931f1b.v1-b6fad569632d4d49ad8f8959426998ba@srs-se1.protection.inumbo.net>)
 id 1vrytO-0007hl-F7
 for xen-devel@lists.xenproject.org; Mon, 16 Feb 2026 13:44:02 +0000
Received: from mail145-20.atl61.mandrillapp.com
 (mail145-20.atl61.mandrillapp.com [198.2.145.20])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a1f8164-0b3d-11f1-9ccf-f158ae23cfc8;
 Mon, 16 Feb 2026 14:43:57 +0100 (CET)
Received: from pmta06.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail145-20.atl61.mandrillapp.com (Mailchimp) with ESMTP id
 4fF3s74p6hzCf9SxH
 for <xen-devel@lists.xenproject.org>; Mon, 16 Feb 2026 13:43:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 b6fad569632d4d49ad8f8959426998ba; Mon, 16 Feb 2026 13:43:55 +0000
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
X-Inumbo-ID: 8a1f8164-0b3d-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1771249435; x=1771519435;
	bh=kTVjGfrv6Xmqvd9yfPCiNF0IYg1KaYNAhpTPd+u+gog=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ZlnybVNTJwUNHvQ2EgUNWPMr39REg24E5+HQFKZYPS6c5U2YTACSTuStkBr7IL2RW
	 pa7p6QHaqYnj5mrrhgmQbfcgDXyXk/uopdIoNY0w3HrtQqGm+qnyNuaZRr/wXtMJb6
	 V7wJKnPeVic6X3w0TrtM6IyEM5dredGkGAnrtbTY1n/TlR9aXDjBzPKmsBpg1gMuH/
	 BvPAWschP3Z2Fjhi/ftG7y9hd0msFyTqYMvHrmopi29x7wpmDWJcntIwvY6QThgo4c
	 OvaYYyTOqqWunlY4UjWI+y1cPiRH0QkzcgktE3zfkykeVmrubHCRepfZyrI6IIYwhs
	 xFVvDKjqvUggw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1771249435; x=1771509935; i=julian.vetter@vates.tech;
	bh=kTVjGfrv6Xmqvd9yfPCiNF0IYg1KaYNAhpTPd+u+gog=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=VIa2YJyXUxJAnugwHeaHpRFQmJ2MH9OxHMirz6V93osz7VAbB3HH+W9sWwmRcK0Wh
	 U15Y9n4YnWvGqOXPvDGljishzYypNZ9R0RtLLz/+5pNYbsoQQ40rU3C5u6uTtbVEHr
	 8H3LtFEfXRVPbkheU+V2DO7+yypK1Fuh3iYkgJxMBBYAllYnhjOKrvOSgPgORtlxdD
	 V9CT+AjwDI5HGZ/NMLhvE3VxfEBEHBzDO0HVOOn2QIeAgl9gQoIUf8dDlx7whGRi+D
	 TRWtSVuOMvmSoMkqtoGmTZObioXBP+s2htOK8pzUUyTHVzcqJVVbqIcu7TWxqyvXUX
	 SoQ/OfzdvrbxQ==
From: "Julian Vetter" <julian.vetter@vates.tech>
Subject: =?utf-8?Q?[PATCH=20v2=200/3]=20x86/ioreq:=20Extend=20ioreq=20server=20to=20support=20multiple=20ioreq=20pages?=
X-Mailer: git-send-email 2.51.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1771249434436
To: xen-devel@lists.xenproject.org
Cc: "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "Julian Vetter" <julian.vetter@vates.tech>
Message-Id: <20260216134334.3510048-1-julian.vetter@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.b6fad569632d4d49ad8f8959426998ba?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20260216:md
Date: Mon, 16 Feb 2026 13:43:55 +0000
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
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mandrillapp.com:dkim,vates.tech:mid,vates.tech:dkim,vates.tech:url,vates.tech:email];
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
X-Rspamd-Queue-Id: 498BE144741
X-Rspamd-Action: no action

Hello Jan and Andrew,
I have adressed your feedback and replaced the for loop with
xvzalloc_array() in ioreq_server_alloc_mfn. This indeed simplifies the
code in that function. I have also addressed the other points
(indentation patch, blank lines, etc.). I just couldn't come up with a
better solution for the struct ioreq_server. We now have a new member
ioreq_gfn, to track the guest frame number. Any thoughts on this?

Julian Vetter (3):
  x86/ioreq: Add missing put_page_alloc_ref(page)
  x86/ioreq: Prepare spacing for upcoming patch
  x86/ioreq: Extend ioreq server to support multiple ioreq pages

 xen/arch/x86/hvm/ioreq.c       | 264 ++++++++++++++++++++++++++++-----
 xen/common/ioreq.c             |  96 +++++++++---
 xen/include/public/hvm/ioreq.h |   5 +
 xen/include/xen/ioreq.h        |  13 +-
 4 files changed, 323 insertions(+), 55 deletions(-)

Signed-off-by: Julian Vetter <julian.vetter@vates.tech>
-- 
2.51.0



--
Julian Vetter | Vates Hypervisor & Kernel Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


