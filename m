Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DNcQK9azR2oFdwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 15:06:30 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2B6702A91
	for <lists+xen-devel@lfdr.de>; Fri, 03 Jul 2026 15:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Jb1AIBzq;
	dmarc=pass (policy=none) header.from=vates.tech;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1353320.1609292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfda7-0002KI-5a; Fri, 03 Jul 2026 13:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1353320.1609292; Fri, 03 Jul 2026 13:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfda7-0002Hn-2n; Fri, 03 Jul 2026 13:05:23 +0000
Received: by outflank-mailman (input) for mailman id 1353320;
 Fri, 03 Jul 2026 13:05:21 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f281556cf00080a8@swg.vates.tech>)
 id 1wfda4-0002Hf-OC
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 13:05:21 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfda3-000KTy-SG
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2026 15:05:19 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f281556cf00080a8@swg.vates.tech>)
 id 6a47b38e-2eae-0a2a0a5409dd-0a2a4503ce4e-4
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:05:19 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f281556cf00080a8@swg.vates.tech>)
 id 6a47b38e-ec1a-0a2a45030019-b9ff1c22816d-3
 for <xen-devel@lists.xenproject.org>; Fri, 03 Jul 2026 15:05:19 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f281556cf00080a8.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 03 Jul 2026 13:05:14 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 28BA781C0A;
 Fri,  3 Jul 2026 15:05:14 +0200 (CEST)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=XKcNaM/91Jjk6ZkU0ufuyTcVGSv3GFLvBuIsiSJ873k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Jb1AIBzqGw9LTas0JQj685LG4YzpIivXZ1uVy1vxOoEcU0QmXZvzdYzZ9qyPaeiCk5MSBF6wj
 /wQCljNUwKR6S6STt5nUuJVrpY4htUlYr3Bg/P1GjcN/AXd0Pd7PZHWkTUJiwgU2ur63RsouxsS
 OLPoLJCO1BUxQuYtsnX/oCXo8ISdy8InYZyXr+rLUfVw36q6IQj95jqutWYTq3teilOFeZuaBKr
 oqmWtciLus6VeO5RUTjFNWLQ1+wjTgEdJFzotlYqUm+peZk70Y699EK+Ysl6CLoVHVwNT0WcIOU
 w8VucvBQITZdoKM+ukaNeVS8K7JX0AIMLWP0qI4gBkkQ==
X-Zone-Loop: e43875fd35f7250afce1517219b42109ddd4216cf2e9
x-campaign-type: default
x-transaction-id: ee1b7a28-95f5-4953-84d4-8c86cbb2812e
x-swg-uid: 01-fa80b72d-2938-47d8-9a39-a70a45392133
X-Mailer: Sweego
Message-ID:
 <1783083915.8631fc262581453bbf619ec5b2062170.19f281556cf00080a8@vates.tech>
x-swg-bid: 1783083915.8631fc262581453bbf619ec5b2062170.19f281556cf00080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 3 Jul 2026 15:05:13 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Frediano Ziglio <freddy77@gmail.com>
Cc: xen-devel@lists.xenproject.org,
	Frediano Ziglio <frediano.ziglio@cloud.com>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Subject: Re: [PATCH] tools: Use posix_memalign instead of valloc for NetBSD
References: <20260430095521.8399-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260430095521.8399-1-frediano.ziglio@cloud.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.c6.2ee9de91ac841128.19f28155423.ab549c87a61d0f6d=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1783083914279
X-purgate-ID: tlsNG-33051d/1783083919-B47875D1-F28A5EF1/0/0
X-purgate-type: clean
X-purgate-size: 675
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	MIME_MA_MISSING_HTML(1.00)[];
	URI_COUNT_ODD(1.00)[1];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:freddy77@gmail.com,m:xen-devel@lists.xenproject.org,m:frediano.ziglio@cloud.com,m:jgross@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid,vates.tech:from_mime,vates.tech:url,vates.tech:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3E2B6702A91

---=Part.c6.2ee9de91ac841128.19f28155423.ab549c87a61d0f6d=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 10:55:21AM +0100, Frediano Ziglio wrote:
> More similar to other implementation=2E
> posix_memalign was adde in NetBSD 8=2E0, released on July 17, 2018
> and went out of support on May 4, 2024=2E
>=20
> Signed-off-by: Frediano Ziglio <frediano=2Eziglio@cloud=2Ecom>

Acked-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.c6.2ee9de91ac841128.19f28155423.ab549c87a61d0f6d=---

