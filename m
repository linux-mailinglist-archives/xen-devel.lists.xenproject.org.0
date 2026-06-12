Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AMtTB03LK2qCFAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:03:09 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A95C678078
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2026 11:03:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=vates.tech header.s=selector1 header.b=Ok8xfVmH;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=vates.tech
Received: from list by lists.xenproject.org with outflank-mailman.1336426.1598183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXxmd-0006bQ-QZ; Fri, 12 Jun 2026 09:02:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1336426.1598183; Fri, 12 Jun 2026 09:02:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXxmd-0006a0-N4; Fri, 12 Jun 2026 09:02:35 +0000
Received: by outflank-mailman (input) for mailman id 1336426;
 Fri, 12 Jun 2026 09:02:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb118330000701b@swg.vates.tech>)
 id 1wXxmb-0006Zu-Jx
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 09:02:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXxmb-00FP6A-0W
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2026 11:02:33 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb118330000701b@swg.vates.tech>)
 id 6a2bcb26-bab6-0a2a0a5309dd-0a2a4502d114-18
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:02:32 +0200
Received: from [185.255.28.18] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19ebb118330000701b@swg.vates.tech>)
 id 6a2bcb28-af86-0a2a45020019-b9ff1c12802d-3
 for <xen-devel@lists.xenproject.org>; Fri, 12 Jun 2026 11:02:32 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19ebb118330000701b.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 12 Jun 2026 09:02:27 +0000
Received: from [192.168.1.18] (unknown [88.188.240.210])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id F0D668647F;
 Fri, 12 Jun 2026 11:02:26 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=LmXVHT+g0GkUpqc/rP0UVxSCKlXOQ3kDbNcBXmb1bNM=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Ok8xfVmH3PEcLDEkupVDvcdpXRDAqIISl4fnbqS4OeB79Z79uQCjYLAZjlEVuwBkUmgRT/ByA
 C5/KM0RrAWbbJ6o1HuGB0iyLR/iKW6xCMJYsCoA3Ww/37xgl9D+C0pK+nQGXuDalazqkjAct5nQ
 /WcxAnL3/NL5JkAprPssjBxHENM7TL8ZHbmnWKSzn5KtLW6GT6niNYbOuVG7+1NMrRQ1twnQPOw
 IunYyagVnRLXFipg/0ihblbO4+Jcp7rPm2sItQEB0e8mRu8WoXy6T2v54QcJUFjyY2DQO7Yhb/U
 kkFmaSJ5zGelQMy0wf93hoxaY8GAQWzR069crdBVlxkQ==
X-Zone-Loop: f580fba6374721e853dd7ba285b49592ce725efa160c
x-campaign-type: default
x-transaction-id: 795dd132-bb69-46c0-92e9-29f00bba589f
x-swg-uid: 01-ba408b1c-d92c-4e6d-bd11-8ad6a7c87782
X-Mailer: Sweego
Message-ID:
 <1781254947.8631fc262581453bbf619ec5b2062170.19ebb118330000701b@vates.tech>
x-swg-bid: 1781254947.8631fc262581453bbf619ec5b2062170.19ebb118330000701b
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 12 Jun 2026 11:02:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during
 PV spinlock initialization
To: Thomas Gleixner <tglx@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
 <87ldcp3w16.ffs@fw13>
 <1780997262.8631fc262581453bbf619ec5b2062170.19eabb58e51000701b@vates.tech>
 <87y0gn3fve.ffs@fw13>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <87y0gn3fve.ffs@fw13>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ShdTQzGuWqhtGKUcJNjo7X03"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1781254947120
X-purgate-ID: tlsNG-720697/1781254952-8137C161-A9F23976/0/0
X-purgate-type: clean
X-purgate-size: 7157
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:linux-kernel@vger.kernel.org,m:regressions@lists.linux.dev,m:xen-devel@lists.xenproject.org,m:olivier.lambert@vates.tech,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6A95C678078

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ShdTQzGuWqhtGKUcJNjo7X03
Content-Type: multipart/mixed; boundary="------------s6bllfsCkEUnRoiY7fXZwnjm";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Thomas Gleixner <tglx@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Olivier Lambert <olivier.lambert@vates.tech>
Message-ID: <9d7c4329-3a7f-42d0-90cf-1495fb6ad4ab@vates.tech>
Subject: Re: [REGRESSION][BISECTED] Long boot time with Xen HVM guests during
 PV spinlock initialization
References: <1780914594.8631fc262581453bbf619ec5b2062170.19ea6c8227b000701b@vates.tech>
 <87ldcp3w16.ffs@fw13>
 <1780997262.8631fc262581453bbf619ec5b2062170.19eabb58e51000701b@vates.tech>
 <87y0gn3fve.ffs@fw13>
In-Reply-To: <87y0gn3fve.ffs@fw13>

--------------s6bllfsCkEUnRoiY7fXZwnjm
Content-Type: multipart/mixed; boundary="------------0YBRmI0yvOYbFqFFG3ZOPezt"

--------------0YBRmI0yvOYbFqFFG3ZOPezt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDkvMDYvMjAyNiDDoCAxNzoxNywgVGhvbWFzIEdsZWl4bmVyIGEgw6ljcml0wqA6DQo+
IE9uIFR1ZSwgSnVuIDA5IDIwMjYgYXQgMTE6MjcsIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4g
TGUgMDgvMDYvMjAyNiDDoCAxNzoxNSwgVGhvbWFzIEdsZWl4bmVyIGEgw6ljcml0wqA6DQo+
Pj4gICAgc3RydWN0IGNsb2Nrc291cmNlICogX19pbml0IF9fd2VhayBjbG9ja3NvdXJjZV9k
ZWZhdWx0X2Nsb2NrKHZvaWQpDQo+Pj4gICAgew0KPj4+ICsJY2xvY2tzb3VyY2VfcmVnaXN0
ZXIoJmNsb2Nrc291cmNlX2ppZmZpZXMpOw0KPj4+ICAgIAlyZXR1cm4gJmNsb2Nrc291cmNl
X2ppZmZpZXM7DQo+Pj4gICAgfQ0KPj4+ICAgIA0KPj4+DQo+Pj4NCj4+DQo+PiBIbW0sIHRo
ZXJlJ3MgYSBjYXNlIHdoZXJlIGNsb2Nrc291cmNlX211dGV4IGdldHMgdGFrZW4gdHdpY2Ug
KGJvdGggaW4NCj4+IF9fY2xvY2tzb3VyY2VfcmVnaXN0ZXJfc2NhbGUoKSAodGhyb3VnaCBj
bG9ja3NvdXJjZV9yZWdpc3RlcigpKSBhbmQNCj4+IGNsb2Nrc291cmNlX2RvbmVfYm9vdGlu
ZygpKS4NCj4gDQo+IEJhaC4NCj4gDQo+PiBXaGF0IGFib3V0IG1ha2luZyBjbG9ja3NvdXJj
ZV9qaWZmaWVzIGdhaW4gLT5lbmFibGUoKSB0byBzZXR1cCB3aGF0IGV2ZXINCj4+IG5lZWRz
IHRvIGJlIChsaWtlIGNhbGxpbmcgX19jbG9ja3NvdXJjZV91cGRhdGVfZnJlcV9zY2FsZSgp
KSA/DQo+IA0KPiBEb2Vzbid0IHdvcmsgZWl0aGVyLg0KPiANCj4gVXBkYXRlZCB2ZXJzaW9u
IGJlbG93LiBJdCdzIG5vdCBwcmV0dHksIGJ1dCBpdCBzaG91bGQgY3VyZSB5b3VyDQo+IHBy
b2JsZW0uIElmIHRoYXQncyBjb25maXJtZWQgSSB0aGluayBhYm91dCBhIGxlc3MgdWdseSBz
b2x1dGlvbi4NCj4gDQo+IFRoYW5rcywNCj4gDQo+ICAgICAgICAgIHRnbHgNCj4gLS0tDQo+
IC0tLSBhL2tlcm5lbC90aW1lL2ppZmZpZXMuYw0KPiArKysgYi9rZXJuZWwvdGltZS9qaWZm
aWVzLmMNCj4gQEAgLTYwLDE1ICs2MCwxNCBAQCBFWFBPUlRfU1lNQk9MKGdldF9qaWZmaWVz
XzY0KTsNCj4gICANCj4gICBFWFBPUlRfU1lNQk9MKGppZmZpZXMpOw0KPiAgIA0KPiAtc3Rh
dGljIGludCBfX2luaXQgaW5pdF9qaWZmaWVzX2Nsb2Nrc291cmNlKHZvaWQpDQo+IC17DQo+
IC0JcmV0dXJuIF9fY2xvY2tzb3VyY2VfcmVnaXN0ZXIoJmNsb2Nrc291cmNlX2ppZmZpZXMp
Ow0KPiAtfQ0KPiAtDQo+IC1jb3JlX2luaXRjYWxsKGluaXRfamlmZmllc19jbG9ja3NvdXJj
ZSk7DQo+ICtzdGF0aWMgYm9vbCBjc19qaWZmaWVzX3JlZ2lzdGVyZWQgX19pbml0ZGF0YTsN
Cj4gICANCj4gICBzdHJ1Y3QgY2xvY2tzb3VyY2UgKiBfX2luaXQgX193ZWFrIGNsb2Nrc291
cmNlX2RlZmF1bHRfY2xvY2sodm9pZCkNCj4gICB7DQo+ICsJaWYgKCFjc19qaWZmaWVzX3Jl
Z2lzdGVyZWQpIHsNCj4gKwkJX19jbG9ja3NvdXJjZV9yZWdpc3RlcigmY2xvY2tzb3VyY2Vf
amlmZmllcyk7DQo+ICsJCWNzX2ppZmZpZXNfcmVnaXN0ZXJlZCA9IHRydWU7DQo+ICsJfQ0K
PiAgIAlyZXR1cm4gJmNsb2Nrc291cmNlX2ppZmZpZXM7DQo+ICAgfQ0KPiAgIA0KPiANCg0K
WWVzLCB0aGF0IGZpeGVzIGl0Lg0KDQpUZWRkeQ0K
--------------0YBRmI0yvOYbFqFFG3ZOPezt
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------0YBRmI0yvOYbFqFFG3ZOPezt--

--------------s6bllfsCkEUnRoiY7fXZwnjm--

--------------ShdTQzGuWqhtGKUcJNjo7X03
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoryyAFAwAAAAAACgkQZg+p0QLLz9Az
lAwAhWpE3K14gvXKmWFoExTZAmOqPMzd8obz2Wc4SQZdFHrZUg2kF9XHnnlTMFBsz7fczz0GOham
l1ECxk39gPNOX1DXhzBar30Dyt3A5YPWmuTOubmNTUBc4i3n20fRn/tc2DWKEIgBiya6VKsd2AgR
BIGP/9hugqlaiO9mrA49y4bfPLD4fq3TTxmaDePkR0b9r4xBeIYzo1eEGyVdu/WcbOS8Vweq3g5n
z4GpWQIvB30OttuZelR2INDcivlup5xX2RGsils8bzNenfW6yVsmOj7Vs8FkialeLP9R2QBK/Pfm
S2drBYbMcsbAOhhxAuh2dvx4o5XqM+4TFpLVg2i6XZ36OQuypEp4/pDG877Q3N1Pjk1uyVdaSTff
bipoae2y7GnLFIWxnxysIISEE5+BEm59KBwhayUgdlDtMdUvClk9MziCpjBGlCo44L7TA7Js82Gh
04ESyUi75KIANYiZUY/sj7jkNZVgorHUas3WvTHn9JMwffCQyFKi/QgeInxh
=kp2q
-----END PGP SIGNATURE-----

--------------ShdTQzGuWqhtGKUcJNjo7X03--

