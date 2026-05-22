Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCLCNJ1TEGodWQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:01:17 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5945E5B4B04
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2026 15:01:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1316777.1586118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQPUa-000600-AH; Fri, 22 May 2026 13:00:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1316777.1586118; Fri, 22 May 2026 13:00:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wQPUa-0005xD-7B; Fri, 22 May 2026 13:00:44 +0000
Received: by outflank-mailman (input) for mailman id 1316777;
 Fri, 22 May 2026 13:00:43 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fc6126a000f373@swg.vates.tech>)
 id 1wQPUZ-0005x7-AW
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 13:00:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wQPUY-007Ty3-Md
 for xen-devel@lists.xenproject.org; Fri, 22 May 2026 15:00:42 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fc6126a000f373@swg.vates.tech>)
 id 6a105376-5cb7-0a2a0a5109dd-0a2a4507e654-22
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:00:42 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4fc6126a000f373@swg.vates.tech>)
 id 6a10537a-229c-0a2a45070019-b9ff1c22ae4d-3
 for <xen-devel@lists.xenproject.org>; Fri, 22 May 2026 15:00:42 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4fc6126a000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Fri, 22 May 2026 13:00:41 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id D1CF686A08;
 Fri, 22 May 2026 15:00:40 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=87QL4FZaLfz4wf2T0grGJPFm8THq6s8LxFQQ36xT6QQ=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=UjBw4iipCrHVAJJsb7qD49sAoUx3eDIEBQ4dwqoLcv3wK3ibW2oo8X5evpBUiRwTWeZpiKZCw
 cWmDdY/z1fWNrYYdT1t2uIQ/8mt5qW0rcv/STkSx9r5hrjta/ESNo+ot+csqnAezvFVRkKfSnO5
 uGsiusUDbXqNsh5dWJSDsrmfCWv1Fb5pRgZwmnUBTFfqD2UAGinkr5C00kVN5tNUBaKFHlCBA2S
 3OMPiHFKeNcK09EvCTeXM6kFAjDB5P98HW9k/O1ZvmcBefZ3JX0ozA8roWOELiYCEk60xtZphTQ
 oATVnD0ICaycW2HBAFfPeBvqspCpHPCmTJlldZ+w98xQ==
X-Zone-Loop: 3bcdeaa3b456c54dc4b6e5b08d31e97731f300e388f0
x-campaign-type: default
x-transaction-id: 8327d650-e539-48ef-b21a-47af6f812241
x-swg-uid: 01-152409f4-b3ca-46a0-8671-7cd47b1c410d
X-Mailer: Sweego
Message-ID:
 <1779454841.8631fc262581453bbf619ec5b2062170.19e4fc6126a000f373@vates.tech>
x-swg-bid: 1779454841.8631fc262581453bbf619ec5b2062170.19e4fc6126a000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Fri, 22 May 2026 15:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] pv32: Fix bogus cr2 on fault in emulation gate
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1779453231.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373@vates.tech>
 <0c9a577c-07bb-459a-96b2-e9693ef89cca@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <0c9a577c-07bb-459a-96b2-e9693ef89cca@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DbCf3weHpcKDv1y1x8mNEZZE"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779454840948
X-purgate-ID: tlsNG-ef75cf/1779454842-20961C48-8DBC6C37/0/0
X-purgate-type: clean
X-purgate-size: 6459
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	ARC_NA(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[vates.tech:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	HAS_ATTACHMENT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,suse.com:email,vates.tech:email,vates.tech:mid,vates.tech:dkim]
X-Rspamd-Queue-Id: 5945E5B4B04
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------DbCf3weHpcKDv1y1x8mNEZZE
Content-Type: multipart/mixed; boundary="------------LcgzFWTlC64DC8h7FnbGmsks";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
Message-ID: <c1aabd88-4633-4e1c-85c8-0afdf15bb73c@vates.tech>
Subject: Re: [PATCH v2] pv32: Fix bogus cr2 on fault in emulation gate
References: <1779453231.8631fc262581453bbf619ec5b2062170.19e4fad80e4000f373@vates.tech>
 <0c9a577c-07bb-459a-96b2-e9693ef89cca@suse.com>
In-Reply-To: <0c9a577c-07bb-459a-96b2-e9693ef89cca@suse.com>

--------------LcgzFWTlC64DC8h7FnbGmsks
Content-Type: multipart/mixed; boundary="------------5SBaMWPRM4rLKK3r0W4Y4mMt"

--------------5SBaMWPRM4rLKK3r0W4Y4mMt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjIvMDUvMjAyNiDDoCAxNDo0NCwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MjIuMDUuMjAyNiAxNDozMywgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBfX3twdXQsZ2V0fV9n
dWVzdCByZXR1cm5zIC1FRkFVTFQgb24gYWNjZXNzIGZhdWx0cyB3aGljaCBjYXVzZXMNCj4+
IHRoZSBpbmplY3RlZCBjcjIgdG8gYmUgb2ZmIGJ5IDE0IGJ5dGVzIChhcyBFRkFVTFQgaXMg
MTQpIHdoaWNoIGlzDQo+PiBpbmNvcnJlY3QuDQo+Pg0KPj4gRml4IHRoZSBjb21wdXRhdGlv
biBieSByZWx5aW5nIG9uIGNvcHlfe2Zyb20sdG99X2d1ZXN0X3B2IHdoaWNoDQo+PiByZXBv
cnRzIHRoZSBudW1iZXIgb2YgcmVtYWluaW5nIGJ5dGVzIGluc3RlYWQgb2YgYSBuZWdhdGl2
ZSBlcnJubywNCj4+IHN1Y2ggdGhhdCB3ZSBjYW4gY29tcHV0ZSB0aGUgb2Zmc2V0IHByb3Bl
cmx5Lg0KPj4NCj4+IEZpeGVzOiA3MGFkNTcwYjI3OTkgKCJ4ODYvNjQ6IHBhcmF2aXJ0IDMy
LW9uLTY0IGNhbGwgZ2F0ZSBzdXBwb3J0IikNCj4+IFNpZ25lZC1vZmYtYnk6IFRlZGR5IEFz
dGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPg0KPiANCj4gUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gcHJlZmVyYWJseSB3aXRoIC4uLg0KPiAN
Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLWdhdGUtb3AuYw0KPj4gKysrIGIveGVu
L2FyY2gveDg2L3B2L2VtdWwtZ2F0ZS1vcC5jDQo+PiBAQCAtMjg2LDEyICsyODYsMTQgQEAg
dm9pZCBwdl9lbXVsYXRlX2dhdGVfb3Aoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQo+
PiAgICAgICBpZiAoICFqdW1wICkNCj4+ICAgICAgIHsNCj4+ICAgICAgICAgICB1bnNpZ25l
ZCBpbnQgc3MsIGVzcCwgKnN0a3A7DQo+PiArICAgICAgICB1aW50MzJfdCB2YWx1ZTsNCj4+
ICAgICAgICAgICBpbnQgcmM7DQo+PiAgICNkZWZpbmUgcHVzaChpdGVtKSBkbyBcDQo+PiAg
ICAgICAgICAgeyBcDQo+PiArICAgICAgICAgICAgdmFsdWUgPSBpdGVtOyBcDQo+IA0KPiAu
Li4gKGl0ZW0pIGhlcmUuIEkgdGhpbmsgd2UncmUgb2theSB3aXRob3V0LCBidXQgbGV0J3Mg
cGxheSBzYWZlLg0KPiANCj4gTGlrZWx5IGNhbiBiZSBhZGp1c3RlZCBieSB0aGUgY29tbWl0
dGVyLg0KPiANCg0KTG9va3MgZ29vZCB0byBtZS4NCg0KPiBKYW4NCj4gDQoNClRlZGR5DQo=

--------------5SBaMWPRM4rLKK3r0W4Y4mMt
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------5SBaMWPRM4rLKK3r0W4Y4mMt--

--------------LcgzFWTlC64DC8h7FnbGmsks--

--------------DbCf3weHpcKDv1y1x8mNEZZE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoQU3gFAwAAAAAACgkQZg+p0QLLz9CY
Rwv8CwFCtpeXkL5FBYN8479/QvW5ILRueDc0rCaLSR1Bzh9aU45hXNBGHuaiL1YpZTei5wAM0gbf
/J/qxbThRs81pYERa0vykJktcNlN8Pli8D6St55GAbewmhirAnPHu/AsJCRzfyIWyi5TAIhKaiYn
AndnAcJaJC8a1wnYVh8CRaiVuflPmV9Jeuvh+N/ays+7i9gfEIgequK8TPZoYKES1UWI4/iyCjGG
BuMJbmj23BWcNP7vNNa2Qt82e23U3CpTUoLma+DlNi3FRFOAcES7HCkqbOEYA9chP7NIIeuey2rg
uhDQ7Ug+ckr11bPSju5avnHgHl7HijsXLWoCXUvYNTKBTBF0Dlqt5FU7WM33+pSOYJMQhxqVFtXm
viCDl1mlA9kR34Ah/mZ9k3rbqquEnA90mS3fuOqNtxzlh5tOOhEnOtknxp3/GZ3O4XhL1q/p2Ugs
Ltm7Sc/jY5mhyuTo+Ic/BRho6Ct804Qt2vi9jv4wL9laazyRhPvhwwQ2c2Q5
=i59O
-----END PGP SIGNATURE-----

--------------DbCf3weHpcKDv1y1x8mNEZZE--

