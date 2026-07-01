Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GXWxIYrdRGpZ2QoAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:27:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7B86EB981
	for <lists+xen-devel@lfdr.de>; Wed, 01 Jul 2026 11:27:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=GjF3DCLl;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1349655.1607341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werE9-0005K0-LK; Wed, 01 Jul 2026 09:27:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1349655.1607341; Wed, 01 Jul 2026 09:27:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1werE9-0005IK-HM; Wed, 01 Jul 2026 09:27:29 +0000
Received: by outflank-mailman (input) for mailman id 1349655;
 Wed, 01 Jul 2026 09:27:27 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8@swg.vates.tech>)
 id 1werE7-0005IB-HJ
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 09:27:27 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1werE6-0029pA-U0
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2026 11:27:26 +0200
Received: from [10.42.69.8] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8@swg.vates.tech>)
 id 6a44dd7e-2eae-0a2a0a5409dd-0a2a4508cdf8-0
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:27:26 +0200
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-c1860d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8@swg.vates.tech>)
 id 6a44dd7e-edec-0a2a45080019-b9ff1c239a1d-3
 for <xen-devel@lists.xenproject.org>; Wed, 01 Jul 2026 11:27:26 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19f1d012af000080a8.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 01 Jul 2026 09:27:23 +0000
Received: from l14 (lfbn-gre-1-197-6.w90-112.abo.wanadoo.fr [90.112.16.6])
 (Authenticated sender: anthony.perard)
 by mail2.vates.fr (Postfix) with ESMTPSA id EFC1E86596;
 Wed,  1 Jul 2026 11:27:22 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=v0Oq/0medtw3sWIFv4AgOKqcwlN1SFd1sf3+cKdknjY=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=GjF3DCLlULwNymzJpERSpOOgla89r2GwhwyxthuCdbtU643ZLgESThjgkInB2jKBliR1k1/CU
 1Qsia0oxdx/kBSQof11vZ28FMva/zfCF08mVc7AxSli7jOTrEIE2AnF6+FON3b096PTzX/zpGTI
 Upmu3S05gDV9PaicCEd7hv+tBW+OMm4kxOUZhVrV3Aw85xu8gxYRAr0CKOZmtjIjeqbQMpMnQb7
 B0O2I0o5FB6p+lP9xNpKulLySOBetZRsYmLibLUwnCa9IV0hsFPtX/LMBq0Y3PE4W/QtItJJoCX
 Hs+0ToARv4dGUaKkxvMP0pgyv0Uox1S5zYXvg27dhNqQ==
X-Zone-Loop: 001b24ec1a56cdabcbb35d61b228e048446220dfc4e7
x-campaign-type: default
x-transaction-id: 88ad89b4-7bce-43fb-9c7e-74acc0c48aab
x-swg-uid: 01-a0298d41-4b52-4b98-93a6-fccb53e33bf5
X-Mailer: Sweego
Message-ID:
 <1782898043.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8@vates.tech>
x-swg-bid: 1782898043.8631fc262581453bbf619ec5b2062170.19f1d012af000080a8
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 1 Jul 2026 11:27:22 +0200
From: Anthony PERARD <anthony.perard@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	Daniel Smith <dpsmith@apertussolutions.com>,
	Marek Marczykowski <marmarek@invisiblethingslab.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/4] libxc: drop size parameter from
 xc_flask_context_to_sid()
References: <5d242cad-d907-4321-8ac1-363c0f9b623d@suse.com>
 <e2d95536-655d-4ce4-8170-e5be8f5baa99@suse.com>
 <33cc1e9d-38c5-44b4-b25b-0f38b625d279@suse.com>
 <2cc83d7a-1e22-4c2f-85ff-7e9daa0876ab@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2cc83d7a-1e22-4c2f-85ff-7e9daa0876ab@suse.com>
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.9ce.c7b59d80fda33320.19f1d0128c0.cdb4581bb1eb246f=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1782898043073
X-purgate-ID: tlsNG-c1860d/1782898046-40D2B3FC-9334E5B5/0/0
X-purgate-type: clean
X-purgate-size: 1212
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.82 / 15.00];
	URI_COUNT_ODD(1.00)[1];
	MIME_MA_MISSING_HTML(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:jgross@suse.com,m:dpsmith@apertussolutions.com,m:marmarek@invisiblethingslab.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[anthony.perard@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vates.tech:dkim,vates.tech:mid,vates.tech:url,vates.tech:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,suse.com:email];
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
X-Rspamd-Queue-Id: 1D7B86EB981

---=Part.9ce.c7b59d80fda33320.19f1d0128c0.cdb4581bb1eb246f=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 12:00:29PM +0200, Jan Beulich wrote:
> On 16=2E06=2E2026 11:19, J=C3=BCrgen Gro=C3=9F wrote:
> > On 16=2E06=2E26 11:01, Jan Beulich wrote:
> >> Nul-terminated strings are passed in all cases, so the strlen() can v=
ery
> >> well be invoked by the function itself=2E In preparation for a hyperv=
isor
> >> change also include the nul terminator in the size calculation=2E
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse=2Ecom>
> >> ---
> >> Ideally libxl_flask_context_to_sid() would follow suit, but aiui doin=
g so
> >> would break its (stable) ABI=2E
> >=20
> > You could use LIBXL_API_VERSION in libxl=2Eh to modify the interface f=
or new
> > libxl versions=2E See how it is done e=2Eg=2E for libxl_domain_create_=
restore()=2E
>=20
> Question being - is this worth the effort?

I don't feel like it is=2E

Cheers,


-- 
Anthony Perard | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vate=
s solutions

web: https://vates=2Etech
---=Part.9ce.c7b59d80fda33320.19f1d0128c0.cdb4581bb1eb246f=---

