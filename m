Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UG2DMujlDWpz4gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:48:40 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3795927C0
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2026 18:48:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1314198.1584191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPk5p-0002Ky-59; Wed, 20 May 2026 16:48:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1314198.1584191; Wed, 20 May 2026 16:48:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPk5p-0002IV-1B; Wed, 20 May 2026 16:48:25 +0000
Received: by outflank-mailman (input) for mailman id 1314198;
 Wed, 20 May 2026 16:48:23 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@swg.vates.tech>)
 id 1wPk5n-0002IN-Mh
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 16:48:23 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPk5n-004lLT-2q
 for xen-devel@lists.xenproject.org; Wed, 20 May 2026 18:48:23 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@swg.vates.tech>)
 id 6a0de5d1-2eae-0a2a0a5409dd-0a2a45029ea0-26
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:48:23 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@swg.vates.tech>)
 id 6a0de5d6-af86-0a2a45020019-b9ff1c2284e7-3
 for <xen-devel@lists.xenproject.org>; Wed, 20 May 2026 18:48:22 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e4649c100000f373.003 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 20 May 2026 16:48:19 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 861B786869;
 Wed, 20 May 2026 18:48:18 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=0lPD8imD0MTFM6B7ln4P8KJHd1hvhY1HV4F74iKPNw4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=Bcz+BCtjowwE5cciQLYoxgMGjYMBQ5bTlgRlmQKMfvQGsI3P5lcwaEYK6LYE31ZAmZFmnJ98m
 c9ofrxR/5M8h/csh9iSLIhi+Hbu01x48uIPl3zXlLOmkhnF1j72bdH00Sy9Y4eDKZAyTdInZjA8
 mn0uFn9/CfikOMwo0u/siBT2uMm18ZfRy5kqnXTR2qjHFLsK4GHxwhMrzbdNEnOsb9TYO2DL+MI
 aOEXoEFdL3UByuNa1gHIzjG+e/roIBR/y8Y9/5ccCQffIRlZw0xYExEkvybM7jWB5Png2p2Q8Ru
 qll4aiaW7bAn9kKqGsK/gX/s7DsJ+s1WwxyF3tbVctuw==
X-Zone-Loop: 56faee6bf07cb9074ac95b6f37237138c7502bab23b9
x-campaign-type: default
x-transaction-id: a4fb4eb0-81ec-4e7c-82c9-5e477d569969
x-swg-uid: 01-0ca19352-5961-4612-a6fc-931d8211e420
X-Mailer: Sweego
Message-ID:
 <1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373@vates.tech>
x-swg-bid: 1779295699.8631fc262581453bbf619ec5b2062170.19e4649c100000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Wed, 20 May 2026 18:48:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dop8SB7Y1OivNs6eaVJIbuNC"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1779295698639
X-purgate-ID: tlsNG-720697/1779295703-8336C161-2A7F1FC1/0/0
X-purgate-type: clean
X-purgate-size: 8298
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo];
	RCPT_COUNT_THREE(0.00)[4];
	HAS_ATTACHMENT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3E3795927C0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dop8SB7Y1OivNs6eaVJIbuNC
Content-Type: multipart/mixed; boundary="------------v7AnXBKYY1bXDuHiyp050iDT";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
Message-ID: <0ee50b7d-fe74-4b60-ae03-d8214d163153@vates.tech>
Subject: Re: [PATCH] pv32: Fix bogus cr2 on fault in emulation gate
References: <1779292317.8631fc262581453bbf619ec5b2062170.19e46162869000f373@vates.tech>
 <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>
In-Reply-To: <0e23078f-30e0-4077-be1e-365a265603de@citrix.com>

--------------v7AnXBKYY1bXDuHiyp050iDT
Content-Type: multipart/mixed; boundary="------------YNbAUR7bWMD3CCa835wEg3k3"

--------------YNbAUR7bWMD3CCa835wEg3k3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMjAvMDUvMjAyNiDDoCAxODozNCwgQW5kcmV3IENvb3BlciBhIMOpY3JpdMKgOg0KPiBP
biAyMC8wNS8yMDI2IDQ6NTEgcG0sIFRlZGR5IEFzdGllIHdyb3RlOg0KPj4gX197cHV0LGdl
dH1fZ3Vlc3QgcmV0dXJucyAtRUZBVUxUIG9uIGFjY2VzcyBmYXVsdHMgd2hpY2ggY2F1c2Vz
DQo+PiB0aGUgaW5qZWN0ZWQgY3IyIHRvIGJlIG9mZiBieSAxNCBieXRlcyAoYXMgRUZBVUxU
IGlzIDE0KSB3aGljaCBpcw0KPj4gaW5jb3JyZWN0Lg0KPj4NCj4+IEZpeCB0aGUgY29tcHV0
YXRpb24gYnkgcmVseWluZyBvbiBjb3B5X3tmcm9tLHRvfV9ndWVzdF9wdiB3aGljaA0KPj4g
cmVwb3J0cyB0aGUgbnVtYmVyIG9mIHJlbWFpbmluZyBieXRlcyBpbnN0ZWFkIG9mIGEgbmVn
YXRpdmUgZXJybm8sDQo+PiBzdWNoIHRoYXQgd2UgY2FuIGNvbXB1dGUgdGhlIG9mZnNldCBw
cm9wZXJseS4NCj4+DQo+PiBGaXhlczogNzBhZDU3MGIyNzk5ICgieDg2LzY0OiBwYXJhdmly
dCAzMi1vbi02NCBjYWxsIGdhdGUgc3VwcG9ydCIpDQo+PiBTaWduZWQtb2ZmLWJ5OiBUZWRk
eSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4NCj4+IC0tLQ0KPj4gICB4ZW4vYXJj
aC94ODYvcHYvZW11bC1nYXRlLW9wLmMgfCA1ICsrKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L3hlbi9hcmNoL3g4Ni9wdi9lbXVsLWdhdGUtb3AuYyBiL3hlbi9hcmNoL3g4Ni9wdi9lbXVs
LWdhdGUtb3AuYw0KPj4gaW5kZXggYzJjNjk5ZmJmZi4uY2FjYzE3MTExNSAxMDA2NDQNCj4+
IC0tLSBhL3hlbi9hcmNoL3g4Ni9wdi9lbXVsLWdhdGUtb3AuYw0KPj4gKysrIGIveGVuL2Fy
Y2gveDg2L3B2L2VtdWwtZ2F0ZS1vcC5jDQo+PiBAQCAtMjg5LDkgKzI4OSwxMCBAQCB2b2lk
IHB2X2VtdWxhdGVfZ2F0ZV9vcChzdHJ1Y3QgY3B1X3VzZXJfcmVncyAqcmVncykNCj4+ICAg
ICAgICAgICBpbnQgcmM7DQo+PiAgICNkZWZpbmUgcHVzaChpdGVtKSBkbyBcDQo+PiAgICAg
ICAgICAgeyBcDQo+PiArICAgICAgICAgICAgdW5zaWduZWQgaW50IF9fdmFsdWUgPSBpdGVt
OyBcDQo+PiAgICAgICAgICAgICAgIC0tc3RrcDsgXA0KPj4gICAgICAgICAgICAgICBlc3Ag
LT0gNDsgXA0KPj4gLSAgICAgICAgICAgIHJjID0gX19wdXRfZ3Vlc3QoaXRlbSwgc3RrcCk7
IFwNCj4+ICsgICAgICAgICAgICByYyA9IGNvcHlfdG9fZ3Vlc3RfcHYoc3RrcCwgJl9fdmFs
dWUsIHNpemVvZihfX3ZhbHVlKSk7IFwNCj4gDQo+IE9oLCB0aGlzIHByb2JhYmx5IHZpb2xh
dGVzIE1JU1JBLCBidXQgeW91IGRvbid0IG5lZWQgdG8gdXNlIGEgc2VwYXJhdGUNCj4gdmFy
aWFibGUgYmVjYXVzZSBzaXplb2YoKSBoYXMgbm8gc2lkZSBlZmZlY3RzLg0KPiANCj4gR2l2
ZW4gdGhhdCB0aGUgZXhwcmVzc2lvbiBpcyBub3cgJml0ZW0sIEkgdGhpbmsgaXQgbmVlZHMg
dG8gYmUgJihpdGVtKS4NCj4gDQoNCkkgdHJpZWQgc29tZXRoaW5nIGxpa2UgdGhhdCwgYnV0
IGl0IGxvb2tlZCBhIGJpdCB3ZWlyZCBhbmQgY2xhbmcgd2Fzbid0IA0KaGFwcHkgKGF0IGxl
YXN0IGluIGxhbmd1YWdlIHNlcnZlcikgYmVjYXVzZSBvZiB0aGUgJih4ICsgeSkuDQoNCldl
IGFsc28gbmVlZCB0byBlbnN1cmUgdGhhdCB3ZSdyZSBhY3R1YWxseSBjb3B5aW5nIDMyLWJp
dHMgc2NhbGFycyAoYW5kIA0Kbm90IDE2LWJpdHMgb3IgNjQtYml0cyBvbmVzKSBsaWtlIHRo
ZSBwcmV2aW91cyBiZWhhdmlvci4NCg0KVGhhdCBkaWZmIHNlZW1zIHRvIHdvcmsgdGhvdWdo
DQoNCmRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvcHYvZW11bC1nYXRlLW9wLmMgYi94ZW4v
YXJjaC94ODYvcHYvZW11bC1nYXRlLW9wLmMNCmluZGV4IGNhY2MxNzExMTUuLmI3MmEzMDU4
ZGQgMTAwNjQ0DQotLS0gYS94ZW4vYXJjaC94ODYvcHYvZW11bC1nYXRlLW9wLmMNCisrKyBi
L3hlbi9hcmNoL3g4Ni9wdi9lbXVsLWdhdGUtb3AuYw0KQEAgLTI4OSwxMCArMjg5LDkgQEAg
dm9pZCBwdl9lbXVsYXRlX2dhdGVfb3Aoc3RydWN0IGNwdV91c2VyX3JlZ3MgKnJlZ3MpDQog
ICAgICAgICAgaW50IHJjOw0KICAjZGVmaW5lIHB1c2goaXRlbSkgZG8gXA0KICAgICAgICAg
IHsgXA0KLSAgICAgICAgICAgIHVuc2lnbmVkIGludCBfX3ZhbHVlID0gaXRlbTsgXA0KICAg
ICAgICAgICAgICAtLXN0a3A7IFwNCiAgICAgICAgICAgICAgZXNwIC09IDQ7IFwNCi0gICAg
ICAgICAgICByYyA9IGNvcHlfdG9fZ3Vlc3RfcHYoc3RrcCwgJl9fdmFsdWUsIHNpemVvZihf
X3ZhbHVlKSk7IFwNCisgICAgICAgICAgICByYyA9IGNvcHlfdG9fZ3Vlc3RfcHYoc3RrcCwg
Jih1aW50MzJfdCkoaXRlbSksIA0Kc2l6ZW9mKHVpbnQzMl90KSk7IFwNCiAgICAgICAgICAg
ICAgaWYgKCByYyApIFwNCiAgICAgICAgICAgICAgeyBcDQogICAgICAgICAgICAgICAgICBw
dl9pbmplY3RfcGFnZV9mYXVsdChQRkVDX3dyaXRlX2FjY2VzcywgXA0KDQoNCj4gQ2FuIGFs
c28gYmUgZml4ZWQgb24gY29tbWl0Lg0KPiANCj4gfkFuZHJldw0KDQpUZWRkeQ0K
--------------YNbAUR7bWMD3CCa835wEg3k3
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------YNbAUR7bWMD3CCa835wEg3k3--

--------------v7AnXBKYY1bXDuHiyp050iDT--

--------------dop8SB7Y1OivNs6eaVJIbuNC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoN5dIFAwAAAAAACgkQZg+p0QLLz9CS
sAv/SDsTuwOts6kHLnde2LcTx9WqsJeKPh2bJ+W0hYHe5Jq9qSv8U/q6AqALkDKYlusuXZECK5yX
i88ER/g2/KBQkvXX/HD9xp9VjIXBBu5KZP7PhVbcLoupld865vCOXJls+kXCL/GqYAXqDm1+u1Qi
zWewpKv532W/rT55P6oSzAB/tvq41Sa6bsnlQlOYc2qwRD19QkiNCYodnGhLBDNN9PrJrkkorKk+
FKyXBfgXg2iWMjEjMqVQ1A+C6TDwHKr9QhkGCUbgnB4yaLRTc0CUJAp+tJGCK4o/r81Yi4pF9i9A
fk2XVa1CXFx2M8eSfg1c8KhvKujHvjCZxfMNq04Tt+rXifJX2oyrW9v+KVdN6I2yO8MRH4zcnIFI
ZhQrWA/OeY85uODV6+wCjXZJxgZiLdr9PXr82ZBDHQ1zImUSCi2Oiy18OpxFoQtBc878y3/YzHwm
ww+/Y7nmUlQ19z5jR7kGSEdGuUdevTTkWkWnrDVB5/d4yPI8/AJZkU6iL1vM
=0Y4A
-----END PGP SIGNATURE-----

--------------dop8SB7Y1OivNs6eaVJIbuNC--

