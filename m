Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5mrrDi0YRmrVJgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 09:50:05 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D3F6F460C
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 09:50:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=LnfK1AEh;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1351323.1608533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCAv-0001OR-JX; Thu, 02 Jul 2026 07:49:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351323.1608533; Thu, 02 Jul 2026 07:49:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfCAv-0001M7-Gv; Thu, 02 Jul 2026 07:49:33 +0000
Received: by outflank-mailman (input) for mailman id 1351323;
 Thu, 02 Jul 2026 07:49:32 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8@swg.vates.tech>)
 id 1wfCAt-0001M1-OO
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 07:49:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfCAs-00D4wd-3v
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:49:30 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8@swg.vates.tech>)
 id 6a461807-2eae-0a2a0a5409dd-0a2a45048326-4
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:49:29 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8@swg.vates.tech>)
 id 6a461809-a01d-0a2a45040019-b9ff1c22a145-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:49:29 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f21cddaf000080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 02 Jul 2026 07:49:26 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id 2ADE08078E;
 Thu,  2 Jul 2026 09:49:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=z8acwMs0RoUZwSPsP//PIk2dCVY8ioVGU3CXmoXVDiw=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=LnfK1AEhWJ8lZV22XZOKslPVHAJW+wid1/K9TSYRNy6TJZgjLlBEv9kUuP1XIPLr4EvkFHGq0
 5o33ymhAQZ+9b7nQlpAj3PEXMIB3w/WqPGrt2UtzkgLpIwg0IckNr1S06qgjXpL2XXCLiEaI4JK
 xn1e7k2AJ3hKbodmbIfH0cSM1B+BVvQ/vOSsa9XlsBpPkm+EQ8rxrwP2am8icX/zydNBB0iav3b
 6LiOtCcvqTS7IN/SqZ9mf4jK65zjAl6DfEetfnS8ekwym7cGobCvYV25+FJzw6J7AeBnyy8x5OV
 ckKnuq3f8ItRjq/CPt1tbrJuB1Eib5Ko76Qn57A7N+DA==
X-Zone-Loop: 060998b047c4324b69275eab5ebbc0ed7f7e3edfa9f9
x-campaign-type: default
x-transaction-id: b86dc9e0-945d-4035-9d95-d72967eb17c3
x-swg-uid: 01-ee351179-8bfa-4446-a477-5ecbe552e781
X-Mailer: Sweego
Message-ID:
 <1782978566.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8@vates.tech>
x-swg-bid: 1782978566.8631fc262581453bbf619ec5b2062170.19f21cddaf000080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Thu, 2 Jul 2026 09:49:25 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v2 1/2] libxc: drop size parameter from
 xc_flask_context_to_sid()
References: <ba863889-b389-4264-824e-121a5daeba61@suse.com>
 <d3b03ebb-7923-4033-8bcb-cf0cdbb4e771@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d3b03ebb-7923-4033-8bcb-cf0cdbb4e771@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.e.292e58765e21126.19f21cdd88f.7002498917770ad1=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782978566294
X-purgate-ID: tlsNG-ebf023/1782978569-2E3A41CC-2699A41C/0/0
X-purgate-type: clean
X-purgate-size: 807
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[invisiblethingslab.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email,vates.tech:url,vates.tech:from_mime,vates.tech:dkim,vates.tech:email,vates.tech:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	HAS_XOIP(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3D3F6F460C

---=Part.e.292e58765e21126.19f21cdd88f.7002498917770ad1=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 04:47:52PM +0200, Jan Beulich wrote:
> Nul-terminated strings are passed in all cases, so the strlen() can very
> well be invoked by the function itself=2E In preparation for a hyperviso=
r
> change also include the nul terminator in the size calculation=2E
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
> Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>

Reviewed-by: Anthony PERARD <anthony=2Eperard@vates=2Etech>

Thanks,


-- 
 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vate=
s=2Etech
---=Part.e.292e58765e21126.19f21cdd88f.7002498917770ad1=---

