Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BkQJLbD+WmxDQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:17:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B504CAD66
	for <lists+xen-devel@lfdr.de>; Tue, 05 May 2026 12:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1300463.1574992 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCq5-0005XA-J0; Tue, 05 May 2026 10:17:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1300463.1574992; Tue, 05 May 2026 10:17:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKCq5-0005Uk-G2; Tue, 05 May 2026 10:17:17 +0000
Received: by outflank-mailman (input) for mailman id 1300463;
 Tue, 05 May 2026 10:17:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@swg.vates.tech>)
 id 1wKCq3-0005Ts-Q0
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 10:17:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKCq3-00BzXX-5Z
 for xen-devel@lists.xenproject.org; Tue, 05 May 2026 12:17:15 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@swg.vates.tech>)
 id 69f9c3ab-5cb7-0a2a0a5109dd-0a2a4505a020-0
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:17:15 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@swg.vates.tech>)
 id 69f9c3aa-aaa8-0a2a45050019-b9ff1c22b10d-3
 for <xen-devel@lists.xenproject.org>; Tue, 05 May 2026 12:17:15 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19df7a441f3000f373.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 05 May 2026 10:17:10 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id AF63B866DA;
 Tue,  5 May 2026 12:17:09 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=ejqwXSH3YUQDdzwSSU7aB20J1TIUlv3p9Uh+iMSGDr4=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=VOF4LUpz8QcfZWjgIpmDEv1JR0RXJ1m7qi/K/IRJWjSCueBMNyTEU7JEYv97Dn+4S2yzBLT9/
 uK6Ta8oJWHnD+AkbRlgIIUKL1AwpP6mGyM2z4ub55J9MBpYKHXKDgUTf1Ha/cfufrY21A0eCCTe
 fTWA0ntjiIS7FVYgAZ5uvZDAAA3rcsDMfTPbOV5+GcWI5gTe3r/RsHTOlyYqWeQ4yDH9B+xrswI
 MYmRBIVrAULMuC3btH1xgu9XkFd6J2wKApQMXHtisXH51VLm5NjewjZ2tN/ASraYKMKZW5wjwZn
 Bq5AnhdeuqZC/zbNmX1luSUtqwtN3hT3GpUTavpvolfg==
X-Zone-Loop: 5d3c9fe6be2a8669ea89f7a289f314c1bafbb27f00fe
x-campaign-type: default
x-transaction-id: 0f0ab0bc-f694-439c-9d6f-08ee1f61d033
x-swg-uid: 01-6d97bc24-c86b-43df-b189-46cc9aeac1ba
X-Mailer: Sweego
Message-ID:
 <1777976230.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373@vates.tech>
x-swg-bid: 1777976230.8631fc262581453bbf619ec5b2062170.19df7a441f3000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Tue, 5 May 2026 12:17:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/7] common: Track latest pCPU that ran the vCPU
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
 <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WxsKrHIy2P2sQMdeKd48j1Af"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1777976229876
X-purgate-ID: tlsNG-c201ff/1777976235-E81A9443-39341F1D/0/0
X-purgate-type: clean
X-purgate-size: 8052
X-Rspamd-Queue-Id: 02B504CAD66
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:dkim,vates.tech:mid];
	NEURAL_HAM(-0.00)[-0.969];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WxsKrHIy2P2sQMdeKd48j1Af
Content-Type: multipart/mixed; boundary="------------nm7svcn9d4CJ82sy0tb5BVHD";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <f372ae23-0c03-4cea-bea4-b76edb77aa31@vates.tech>
Subject: Re: [RFC PATCH 2/7] common: Track latest pCPU that ran the vCPU
References: <cover.1776259594.git.teddy.astie@vates.tech>
 <f127344e083d224d2203b83c701375ca15e6368b.1776259594.git.teddy.astie@vates.tech>
 <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>
In-Reply-To: <a191bebd-aa7a-46e4-b3f2-a7a93c389480@suse.com>

--------------nm7svcn9d4CJ82sy0tb5BVHD
Content-Type: multipart/mixed; boundary="------------aAoJrQUmbXy0LM6Dvf0W0hOB"

--------------aAoJrQUmbXy0LM6Dvf0W0hOB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDQvMDUvMjAyNiDDoCAxNzo1MSwgSmFuIEJldWxpY2ggYSDDqWNyaXTCoDoNCj4gT24g
MTUuMDQuMjAyNiAxNTozMiwgVGVkZHkgQXN0aWUgd3JvdGU6DQo+PiBUcmFjayBvbiB3aGlj
aCBwQ1BVIGVhY2ggdkNQVSBvZiBhIGRvbWFpbiByYW4uIFRoaXMgd2lsbA0KPj4gYmUgdXNl
ZCB0byBrbm93IHdoZXRoZXIgYSBUTEIgZmx1c2ggaXMgcmVxdWlyZWQgb3Igbm90DQo+PiB3
aGVuIHRoZSB2Q1BVIGlzIG1pZ3JhdGVkIG9uIGFub3RoZXIgcENQVS4NCj4gDQo+IFNvbWV3
aGF0IHJlbGF0ZWQgdHJhY2tpbmcgYWxyZWFkeSBleGlzdHMgLSBzZWUgdGhlIGRpcnR5X2Nw
dW1hc2sgZmllbGQuDQoNCkkndmUgc2VlbiBpdCwgYnV0IEknbSBub3Qgc3VyZSBob3cgaXQg
Y2FuIGJlIGxldmVyYWdlZCBoZXJlLg0KDQpJIHdpbGwgdHJ5IHRvIHRha2UgYSBjbG9zZXIg
bG9vayBpZiB0aGF0IGNvdWxkIGJlIHVzZWQgaW5zdGVhZC4NCg0KPiBCdXQgd2hhdCB0aXRs
ZSBhbmQgZGVzY3JpcHRpb24gc2F5IGRvZXNuJ3QgbWF0Y2ggLi4uDQo+IA0KPj4gQEAgLTk3
Nyw2ICs5NzgsOCBAQCB2b2lkIGFzbWxpbmthZ2Ugc3ZtX3ZtZW50ZXJfaGVscGVyKHZvaWQp
DQo+PiAgIA0KPj4gICAgICAgc3ZtX3N5bmNfdm1jYihjdXJyLCB2bWNiX25lZWRzX3Ztc2F2
ZSk7DQo+PiAgIA0KPj4gKyAgICBjdXJyLT5kb21haW4tPmxhdGVzdF92Y3B1W2NwdV0gPSBj
dXJyLT52Y3B1X2lkOw0KPiANCj4gLi4uIHRoZSBpbXBsZW1lbnRhdGlvbiBhbnl3YXk6IFlv
dSB0cmFjayB3aGljaCB2Q1BVIGxhc3QgcmFuIG9uIGEgZ2l2ZW4NCj4gcENQVS4gU2luY2Ug
dGhlIHNhbWUgcENQVSBtYXkgaGF2ZSBydW4gbXVsdGlwbGUgdkNQVS1zIHdoaWNoIHRoZW4g
d2VyZW4ndA0KPiBzY2hlZHVsZWQgYWdhaW4sIHlvdSBsb3NlIGRhdGEgYWZhaWN0Lg0KPiAN
Cg0KSSBtaXhlZCB1cCB0aGUgd29yZGluZy4gQnV0IHRoZSBpbXBsZW1lbnRhdGlvbiBpcyB0
aGUgcHJvcGVyIGludGVudC4NCg0KSXQncyBtb3JlDQoNCiAgIFRyYWNrIHdoaWNoIHZDUFUg
b2YgdGhlIGRvbWFpbiBlYWNoIHBDUFUgcmFuLg0KDQo+PiBAQCAtOTkyLDYgKzk5MywxMyBA
QCBzdHJ1Y3QgZG9tYWluICpkb21haW5fY3JlYXRlKGRvbWlkX3QgZG9taWQsDQo+PiAgICAg
ICBpZiAoICF6YWxsb2NfY3B1bWFza192YXIoJmQtPmRpcnR5X2NwdW1hc2spICkNCj4+ICAg
ICAgICAgICBnb3RvIGZhaWw7DQo+PiAgIA0KPj4gKyAgICBlcnIgPSAtRU5PTUVNOw0KPj4g
KyAgICBkLT5sYXRlc3RfdmNwdSA9IHhtYWxsb2NfYXJyYXkoaW50LCBucl9jcHVfaWRzKTsN
Cj4gDQo+IHh2bWFsbG9jX2FycmF5KCkgcGxlYXNlLCBhcyB0aGlzIGNhbiBiZSBodWdlLiBJ
dCBwb3NzaWJseSBiZWluZyBodWdlIGlzDQo+IGFsc28gb2YgY29uY2Vybi4NCj4gDQo+PiAt
LS0gYS94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUveGVu
L3NjaGVkLmgNCj4+IEBAIC01NjcsNiArNTY3LDEwIEBAIHN0cnVjdCBkb21haW4NCj4+ICAg
ICAgIC8qIEJpdG1hc2sgb2YgQ1BVcyB3aGljaCBhcmUgaG9sZGluZyBvbnRvIHRoaXMgZG9t
YWluJ3Mgc3RhdGUuICovDQo+PiAgICAgICBjcHVtYXNrX3Zhcl90ICAgIGRpcnR5X2NwdW1h
c2s7DQo+PiAgIA0KPj4gKyAgICAvKiBNYXBwaW5nIG9mIHRoZSBsYXRlc3QgdkNQVSB0aGF0
IHJhbiBvbiBhIHNwZWNpZmljIENQVQ0KPj4gKyAgICAgKiAoLTEgaWYgdGhlIHZDUFUgaGFz
bid0IHJhbiB5ZXQpICovDQo+PiArICAgIGludCAqbGF0ZXN0X3ZjcHU7DQo+IA0KPiBXaHkg
cGxhaW4gaW50PyBZb3UgZG9uJ3QgcmVhbGx5IGxldmVyYWdlIC0xIGFzIGEgc2VudGluZWws
IGFuZCBhbnkNCj4gdW5zaWduZWQgdmFsdWUgPj0gbnJfY3B1X2lkcyB3b3VsZCBkbyBpbiBp
dHMgc3RlYWQuDQo+IA0KDQppbnQgaXMgbm90IHJlYWxseSByZXF1aXJlZCBoZXJlIGluIHBy
YWN0aWNlLiBJdCdzIG1vcmUgaGVyZSB0byBleHByZXNzIGEgDQppbnZhbGlkIHN0YXRlIGlu
c3RlYWQgb2YgbGVhdmluZyAwICh3aGljaCB3b3VsZCBiZSBmaXJzdCBwQ1BVKSBldmVuIGlm
IA0KaXQgd291bGQgbm90IGNoYW5nZSB0aGUgb3ZlcmFsbCBiZWhhdmlvci4gVXNpbmcgfjAg
Y291bGQgYWxzbyB3b3JrIA0KYWx0ZXJuYXRpdmVseS4NCg0KPiBKYW4NCj4gDQoNClRlZGR5
DQo=
--------------aAoJrQUmbXy0LM6Dvf0W0hOB
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------aAoJrQUmbXy0LM6Dvf0W0hOB--

--------------nm7svcn9d4CJ82sy0tb5BVHD--

--------------WxsKrHIy2P2sQMdeKd48j1Af
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD4BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmn5w6UFAwAAAAAACgkQZg+p0QLLz9B1
wwv3UfjQJgAX0OlB7EtcmUGHeKztJQPy8ah5dhGUFJkQlUIBrTO1P6bHo6PdcXyGbsNt7HNAO5tx
ZQIns0gVV0g3H5M5ICFr1nw86/DKGm+eSbeEQGG8FL2x69A7hLtm2yFtbtyEFUiYUsvzRk3OdF+m
YMVPaf4M74vJCUlRobh7BKToOsas+u4UlEJMgmKT1OvAOekmHqkHL/EBRUa6xmYYLzaIEtmiJUyr
7ydA/dkLc17nH6H6POd5X5geVJxZUgN4jrfzXWuvhEPMrJJ9Q0GnGRyfrvw+aqa1epyu5Uyz9qzK
IlGhsO07aiGHS2k35hVsefzqf2G9OMILOXUvTbxobgsUzYyzjC8Mh8q7S90lUnLqKADTez57Z4ph
+ipdpS1ZYWM5XYXbMlnWtBV11TIhheNa6+Se91X8l/qP/QdOlsdMjGZNJ7oQ3xIsguNU42DPy0BG
2QncxRU5KY99tGm66D1dsraAzHLrJHkiAjcduKJj6YWvdVXN+UhN364UYWc=
=F0pZ
-----END PGP SIGNATURE-----

--------------WxsKrHIy2P2sQMdeKd48j1Af--

