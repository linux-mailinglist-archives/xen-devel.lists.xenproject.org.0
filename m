Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uN4zA4rpAWohmQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 16:36:58 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D09510487
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 16:36:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1306266.1578322 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMRjs-0004VD-DQ; Mon, 11 May 2026 14:36:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1306266.1578322; Mon, 11 May 2026 14:36:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMRjs-0004SH-AA; Mon, 11 May 2026 14:36:08 +0000
Received: by outflank-mailman (input) for mailman id 1306266;
 Mon, 11 May 2026 14:36:06 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e17775cf1000f373@swg.vates.tech>)
 id 1wMRjp-0004SB-Pr
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 14:36:06 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMRjo-00DSIM-WD
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 16:36:05 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e17775cf1000f373@swg.vates.tech>)
 id 6a01e952-e002-0a2a0a5209dd-0a2a450cc764-8
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 16:36:04 +0200
Received: from [185.255.28.34] (helo=prod-mta-13.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.19e17775cf1000f373@swg.vates.tech>)
 id 6a01e954-62f1-0a2a450c0019-b9ff1c229467-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 16:36:04 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 19e17775cf1000f373.005 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 11 May 2026 14:35:59 +0000
Received: from [192.168.1.18] (88-175-170-134.subs.proxad.net [88.175.170.134])
 (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 4AE3586223;
 Mon, 11 May 2026 16:35:58 +0200 (CEST)
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
 q=dns/txt; s=selector1; bh=a0q201vIKf1vO7S42ZZHRgvkH9wSeEzbBYXM2JnybF8=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=V8MqBWm04AuDl1a1z51cnFDQt+J5C+n/jORdx/RAQe+2faalV6c01fsblUpIpQp48YD7s7Pb8
 IcHQVTTHHzBnau8FH18wUekMcTEAcwPth0XUOXC4CMsG7+Ao/GYxH7Ih2hsUIjxkSALZ5QaoNh8
 ryJBY+94Bf/nqT9BI+UuJtEJqstecQNve32DAnwKZi3NKKthbnt5BHPeD0C/qVhQ8OGDmDJ+JXv
 LYtzn5oMugsROh1cTpMdfqvT9Xyx0a/uKwp8hSPhsE3cVWDJ7biFb1HOt6EWH7QJx3V0Mpgmu33
 +v6kAk22eqNmeDuPCgrHocsVx/oYGmrZ0l+P9Rwhn5Lg==
X-Zone-Loop: 78f179093fe7b0610ca74ffcc80f43a459d16538e9c5
x-campaign-type: default
x-transaction-id: 54fdc653-9cd2-4b3b-93d9-8b7273cb7261
x-swg-uid: 01-7354f868-cbc0-4385-9139-e58603462f12
X-Mailer: Sweego
Message-ID:
 <1778510159.8631fc262581453bbf619ec5b2062170.19e17775cf1000f373@vates.tech>
x-swg-bid: 1778510159.8631fc262581453bbf619ec5b2062170.19e17775cf1000f373
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
Date: Mon, 11 May 2026 16:35:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nestedsvm: Clear GIF when injecting VMEXIT
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
References: <20260423161112.50221-1-ross.lagerwall@citrix.com>
 <1777481694.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@vates.tech>
 <c41ff9d5-82ff-4a7e-bff3-85e866338897@citrix.com>
Content-Language: en-US
From: Teddy Astie <teddy.astie@vates.tech>
Autocrypt: addr=teddy.astie@vates.tech; keydata=
 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
 x9fhaZEsniw8/bYgC3igkk5YJiOa
In-Reply-To: <c41ff9d5-82ff-4a7e-bff3-85e866338897@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2tCv8lah157BJQF9rpGpL77U"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1778510158434
X-purgate-ID: tlsNG-d25034/1778510164-DBD7BCF5-553F3735/0/0
X-purgate-type: clean
X-purgate-size: 8354
X-Rspamd-Queue-Id: 70D09510487
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.08 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[vates.tech,none];
	R_DKIM_ALLOW(-0.20)[vates.tech:s=selector1];
	MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_UNKNOWN(0.10)[application/pgp-keys];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ross.lagerwall@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_MUA_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,vates.tech:mid,vates.tech:dkim];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[teddy.astie@vates.tech,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[vates.tech:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------2tCv8lah157BJQF9rpGpL77U
Content-Type: multipart/mixed; boundary="------------C0cURaa7BNCpW75c6NUlBXOP";
 protected-headers="v1"
From: Teddy Astie <teddy.astie@vates.tech>
To: Ross Lagerwall <ross.lagerwall@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Message-ID: <00bc6b62-3529-4b55-8626-d25ba9376bda@vates.tech>
Subject: Re: [PATCH] nestedsvm: Clear GIF when injecting VMEXIT
References: <20260423161112.50221-1-ross.lagerwall@citrix.com>
 <1777481694.8631fc262581453bbf619ec5b2062170.19dda2a3d88000f373@vates.tech>
 <c41ff9d5-82ff-4a7e-bff3-85e866338897@citrix.com>
In-Reply-To: <c41ff9d5-82ff-4a7e-bff3-85e866338897@citrix.com>

--------------C0cURaa7BNCpW75c6NUlBXOP
Content-Type: multipart/mixed; boundary="------------ZN9nz83x4Y6svk0UURO5xRNp"

--------------ZN9nz83x4Y6svk0UURO5xRNp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

TGUgMDcvMDUvMjAyNiDDoCAxNTowMywgUm9zcyBMYWdlcndhbGwgYSDDqWNyaXTCoDoNCj4g
T24gNC8yOS8yNiA1OjU0IFBNLCBUZWRkeSBBc3RpZSB3cm90ZToNCj4+IExlIDIzLzA0LzIw
MjYgw6AgMTg6MTMsIFJvc3MgTGFnZXJ3YWxsIGEgw6ljcml0IDoNCj4+PiBJZiBMMSBleGVj
dXRlcyBWTVJVTiB3aXRoIHRoZSBHSUYgc2V0IGFuZCBpdCBmYWlscyBjb25zaXN0ZW5jeSBj
aGVja3MsDQo+Pj4gWGVuIHdpbGwgaW5qZWN0IGEgVk1FWElUIGFuZCBmYWlsIHRoZSBhc3Nl
cnQgY2hlY2tpbmcgdGhlIEdJRiBpcyANCj4+PiBjbGVhcmVkLg0KPj4+DQo+Pj4gSW5zdGVh
ZCwgY2xlYXIgdGhlIEdJRiB3aGVuIGluamVjdGluZyBhIFZNRVhJVCB0byBtYXRjaCB3aGF0
IGhhcmR3YXJlDQo+Pj4gZG9lcy4NCj4+Pg0KPj4+IEZpeGVzOiA5YTc3OWU0ZmMxNjEgKCJJ
bXBsZW1lbnQgU1ZNIHNwZWNpZmljIHBhcnQgZm9yIE5lc3RlZCANCj4+PiBWaXJ0dWFsaXph
dGlvbiIpDQo+Pj4gU2lnbmVkLW9mZi1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3MubGFnZXJ3
YWxsQGNpdHJpeC5jb20+DQo+Pj4gLS0tDQo+Pj4gwqDCoCB4ZW4vYXJjaC94ODYvaHZtL3N2
bS9uZXN0ZWRzdm0uYyB8IDQgKystLQ0KPj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS94ZW4v
YXJjaC94ODYvaHZtL3N2bS9uZXN0ZWRzdm0uYyBiL3hlbi9hcmNoL3g4Ni9odm0vc3ZtLyAN
Cj4+PiBuZXN0ZWRzdm0uYw0KPj4+IGluZGV4IGVmNmZhNWQyM2I2Ny4uZjg5YjA4N2ExMTU1
IDEwMDY0NA0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL25lc3RlZHN2bS5jDQo+
Pj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS9zdm0vbmVzdGVkc3ZtLmMNCj4+PiBAQCAtNzMz
LDkgKzczMyw5IEBAIG5zdm1fdmNwdV92bWV4aXRfaW5qZWN0KHN0cnVjdCB2Y3B1ICp2LCBz
dHJ1Y3QgDQo+Pj4gY3B1X3VzZXJfcmVncyAqcmVncywNCj4+PiDCoMKgwqDCoMKgwqAgc3Ry
dWN0IHZtY2Jfc3RydWN0ICp2bWNiID0gdi0+YXJjaC5odm0uc3ZtLnZtY2I7DQo+Pj4gwqDC
oMKgwqDCoMKgIGlmICggdm1jYi0+X3ZpbnRyLmZpZWxkcy52Z2lmX2VuYWJsZSApDQo+Pj4g
LcKgwqDCoMKgwqDCoMKgIEFTU0VSVCh2bWNiLT5fdmludHIuZmllbGRzLnZnaWYgPT0gMCk7
DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHZtY2ItPl92aW50ci5maWVsZHMudmdpZiA9IDA7DQo+
Pj4gwqDCoMKgwqDCoMKgIGVsc2UNCj4+PiAtwqDCoMKgwqDCoMKgwqAgQVNTRVJUKHN2bS0+
bnNfZ2lmID09IDApOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBuZXN0ZWRzdm1fdmNwdV9jbGdp
KHYpOw0KPj4+IMKgwqDCoMKgwqDCoCBuc192bWNiID0gbnYtPm52X3Z2bWN4Ow0KPj4NCj4+
IExvb2tzIGdvb2QgdG8gbWUsIHRob3VnaCBJIHRoaW5rIHdlIGFyZSBoZXJlIGxvb2tpbmcg
dG8gbWFrZSBhICJndWVzdA0KPj4gQ0xHSSIgKGNsZWFyIEdJRiksIHNvIHRoZSB2R0lGIHNw
ZWNpZmljIGxvZ2ljIHNob3VsZCBiZSBjb2xsYXBzZWQgaW50bw0KPj4gbmVzdGVkc3ZtX3Zj
cHVfY2xnaSgpIGluc3RlYWQgb2YgaGF2aW5nIGl0IGFzIHRoZSBub24tdmdpZi1zdXBwb3J0
IGNhc2UuDQo+PiAoYXMgSUlVQywgdkdJRiBpcyBhIGhhcmR3YXJlIGFjY2VscmF0aW9uIGZv
ciBuZXN0ZWQgR0lGIGhhbmRsaW5nID8pDQo+IA0KPiBOb3QgMTAwJSBzdXJlIEkgZm9sbG93
IHlvdXIgcG9pbnQgaGVyZSBidXQgdjIgb2YgdGhpcyBzZXJpZXMgcmVtb3Zlcw0KPiBuZXN0
ZWRzdm1fdmNwdV9jbGdpKCkgZW50aXJlbHkuIERvZXMgdGhhdCBhZGRyZXNzIHlvdXIgY29u
Y2Vybj8NCj4gDQo+Pg0KPj4gKGFsc28gbWFraW5nIG1lIG5vdGljZSB0aGF0IHN2bV92bWV4
aXRfZG9fe3N0Z2ksY2xnaX0oKSBzZWVtcyB0byBsYWNrDQo+PiB2R0lGIHNwZWNpZmljIGxv
Z2ljKQ0KPj4NCj4gDQo+IElzbid0IHRoYXQgYnkgZGVzaWduPyBJZiB2R0lGIGlzIGVuYWJs
ZWQgdGhlIGhhcmR3YXJlIHNob3VsZCBoYW5kbGUNCj4gU1RHSS9DTEdJIHdpdGhvdXQgYSBW
TUVYSVQuDQo+IA0KDQpJIHRoaW5rIGF0IHNvbWUgcG9pbnQgaW4gdGhlIGZ1dHVyZSwgd2Ug
bWF5IG5lZWQgYSANCmBuZXN0ZWRzdm1fdmNwdV97c3RnaSxjbGdpfSgpYCBmdW5jdGlvbiwg
b3Igc29tZXRoaW5nIGluIHRoYXQgcmVnYXJkOyANCmUuZyBmb3IgZW11bGF0aW5nIHRoaXMg
aW5zdHJ1Y3Rpb24gb3V0c2lkZSBvZiBhIFNWTSBpbnRlcmNlcHQgcGF0aCAoeDg2IA0KZW11
bGF0b3IgYml0cyA/KS4gQXMgSSB0aGluayB0aGVyZSBhcmUgY2FzZXMgd2hlcmUgdGhlIGlu
c3RydWN0aW9uIGlzIA0Kbm90IGludGVyY2VwdGVkIGJ1dCBzdGlsbCBuZWVkcyB0byBiZSBl
bXVsYXRlZC4NCg0KU3VjaCBmdW5jdGlvbiB3b3VsZCBuZWVkIHRvIGtub3cgd2hldGhlciBv
ciBub3Qgd2UgdXNlIHZHSUYuDQoNCj4gUm9zcw0KPiANCg0KVGVkZHkNCg==
--------------ZN9nz83x4Y6svk0UURO5xRNp
Content-Type: application/pgp-keys; name="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Disposition: attachment; filename="OpenPGP_0x660FA9D102CBCFD0.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
x9fhaZEsniw8/bYgC3igkk5YJiOa
=3DlUIA
-----END PGP PUBLIC KEY BLOCK-----

--------------ZN9nz83x4Y6svk0UURO5xRNp--

--------------C0cURaa7BNCpW75c6NUlBXOP--

--------------2tCv8lah157BJQF9rpGpL77U
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsD5BAABCAAjFiEEGAIew9LzHY3pdrqtZg+p0QLLz9AFAmoB6U4FAwAAAAAACgkQZg+p0QLLz9CH
RAv+Njhg4aoZOxwXzk43zNbO4ppsGiRoSFX2IgyZMRvCfZQslqwhqvNpkIvzSy79mMJTNwoNAyKm
t59yMNbl4VzprsYUiQpeDrFrXusbnItZp1c6tOyL2p82MKlA1ZeTl127s0fzzvjxFNi2fZXsQEQS
2gYU3u4qTb36NxR3xqnZsGvVGNLlh+AHqLJ0/bLZl3n/umSk6ZYbfgD1dJWv3l9acC+1wcRBj9qY
+zx7wTRmtyyVWGI9LlI/VSCgtjSqT0uDP/tGcoKlEcxc01vqKe0BXFM/0+2nwTG0dYwBZ0CF6Zif
CGqUujHFiRu31zGChiSO/xolsH8bznYKDsAzF2ualSVZD/ZcL/b9TyB2zZWCZaVqOE6cIMa0moDg
KhjjJ8qZ8T4IWO3wX6qbvWToC/cnE+bVTRanH6NePC4tiBuh6z1UN/cv2nnYS4INjAfNhaVK3fyu
Qnf9v68MjGDl5wDkuxAVlI4MN/BJloQ/g2H3rNfPsyFPE8bQxJqPkDG7UFPk
=G7NF
-----END PGP SIGNATURE-----

--------------2tCv8lah157BJQF9rpGpL77U--

