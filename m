Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E25B33BA
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:26:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403992.646288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaGu-0000jD-6M; Fri, 09 Sep 2022 09:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403992.646288; Fri, 09 Sep 2022 09:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaGu-0000gl-2g; Fri, 09 Sep 2022 09:26:00 +0000
Received: by outflank-mailman (input) for mailman id 403992;
 Fri, 09 Sep 2022 09:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F8UZ=ZM=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oWaGs-0000gf-GE
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:25:58 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ff6e4a2-3021-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 11:25:42 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 95D4D1F8B6;
 Fri,  9 Sep 2022 09:25:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5769A13A93;
 Fri,  9 Sep 2022 09:25:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id j0DZE6QGG2NrXwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 09 Sep 2022 09:25:56 +0000
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
X-Inumbo-ID: 5ff6e4a2-3021-11ed-9760-273f2230c3a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662715556; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ND/rz4TrKNww8aOrf72+1OECzuYRaJL1t0AUd/GZv94=;
	b=kBErtH7dai9O3VFWGV+8wVqY8smpP+cZukzjCTCQfx7iMZ3G8F+trck7BmZjxRp4xeDk9M
	32mSF3VlHmCIN7krS9SCjG6zDumiIV1esDIqbD/TeKUYx44CQtXBhKPMakd7cUBiADwoGt
	zN4zCiJJ8xfG25lwDIwYGMwWG+pqjzY=
Message-ID: <77d2c3fa-7cee-6f86-215a-a95ce242a990@suse.com>
Date: Fri, 9 Sep 2022 11:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220909080944.28559-1-jgross@suse.com>
 <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sKEWVXj645OmzupvKhjAA2ss"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sKEWVXj645OmzupvKhjAA2ss
Content-Type: multipart/mixed; boundary="------------Hwig5wVfU0dMwqGVZR3TVSxA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <77d2c3fa-7cee-6f86-215a-a95ce242a990@suse.com>
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
References: <20220909080944.28559-1-jgross@suse.com>
 <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>
In-Reply-To: <52ff1228-3092-c455-479d-315a16cfaaa6@suse.com>

--------------Hwig5wVfU0dMwqGVZR3TVSxA
Content-Type: multipart/mixed; boundary="------------aaYZ0EBWowl0Pf0ZVZVEXwvO"

--------------aaYZ0EBWowl0Pf0ZVZVEXwvO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDkuMjIgMTE6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwOS4wOS4yMDIy
IDEwOjA5LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4gQ29tbWl0IDlkYzQ2Mzg2ZDg5ZCAo
ImdudHRhYjogd29yayBhcm91bmQgIm1heSBiZSB1c2VkIHVuaW5pdGlhbGl6ZWQiDQo+PiB3
YXJuaW5nIikgd2FzIHdyb25nLCBhcyB2YWRkciBjYW4gbGVnaXRpbWF0ZWx5IGJlIE5VTEwg
aW4gY2FzZQ0KPj4gWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlX2lkX3N0YXR1cyB3YXMg
c3BlY2lmaWVkIGZvciBhIGdyYW50IHRhYmxlDQo+PiB2MS4gVGhpcyB3b3VsZCByZXN1bHQg
aW4gY3Jhc2hlcyBpbiBkZWJ1ZyBidWlsZHMgZHVlIHRvDQo+PiBBU1NFUlRfVU5SRUFDSEFC
TEUoKSB0cmlnZ2VyaW5nLg0KPj4NCj4+IEJhc2ljYWxseSByZXZlcnQgc2FpZCBjb21taXQs
IGJ1dCBrZWVwIHJldHVybmluZyAtRU5PREFUQSBpbiB0aGF0IGNhc2UuDQo+Pg0KPj4gRml4
ZXM6IDlkYzQ2Mzg2ZDg5ZCAoImdudHRhYjogd29yayBhcm91bmQgIm1heSBiZSB1c2VkIHVu
aW5pdGlhbGl6ZWQiIHdhcm5pbmciKQ0KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9z
cyA8amdyb3NzQHN1c2UuY29tPg0KPj4gLS0tDQo+PiBNaWdodCBiZSBjb25zaWRlcmVkIGZv
ciA0LjE3IGFuZCBmb3IgYmFja3BvcnRpbmcNCj4+IC0tLQ0KPj4gICB4ZW4vY29tbW9uL2dy
YW50X3RhYmxlLmMgfCAxNCArKystLS0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEv
eGVuL2NvbW1vbi9ncmFudF90YWJsZS5jIGIveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+
PiBpbmRleCBhZDc3M2E2OTk2Li42OGU3ZjFkZjM4IDEwMDY0NA0KPj4gLS0tIGEveGVuL2Nv
bW1vbi9ncmFudF90YWJsZS5jDQo+PiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMN
Cj4+IEBAIC00MTI1LDcgKzQxMjUsMTAgQEAgaW50IGdudHRhYl9hY3F1aXJlX3Jlc291cmNl
KA0KPj4gICANCj4+ICAgICAgIGNhc2UgWEVOTUVNX3Jlc291cmNlX2dyYW50X3RhYmxlX2lk
X3N0YXR1czoNCj4+ICAgICAgICAgICBpZiAoIGd0LT5ndF92ZXJzaW9uICE9IDIgKQ0KPj4g
KyAgICAgICAgew0KPj4gKyAgICAgICAgICAgIHJjID0gLUVOT0RBVEE7DQo+PiAgICAgICAg
ICAgICAgIGJyZWFrOw0KPj4gKyAgICAgICAgfQ0KPiANCj4gVGhpcyBwYXRoIGlzIHN1cHBv
c2VkIHRvIHByb2R1Y2UgLUVJTlZBTC4NCg0KT2theS4NCg0KPiANCj4+IEBAIC00MTM1LDE3
ICs0MTM4LDYgQEAgaW50IGdudHRhYl9hY3F1aXJlX3Jlc291cmNlKA0KPj4gICAgICAgICAg
IGJyZWFrOw0KPj4gICAgICAgfQ0KPj4gICANCj4+IC0gICAgLyoNCj4+IC0gICAgICogU29t
ZSBvbGRlciB0b29sY2hhaW5zIGNhbid0IHNwb3QgdGhhdCB2YWRkcnMgd29uJ3QgcmVtYWlu
IHVuaW5pdGlhbGl6ZWQNCj4+IC0gICAgICogb24gbm9uLWVycm9yIHBhdGhzLCBhbmQgaGVu
Y2UgaXQgbmVlZHMgc2V0dGluZyB0byBOVUxMIGF0IHRoZSB0b3Agb2YgdGhlDQo+PiAtICAg
ICAqIGZ1bmN0aW9uLiAgTGVhdmUgc29tZSBydW50aW1lIHNhZmV0eS4NCj4+IC0gICAgICov
DQo+PiAtICAgIGlmICggIXZhZGRycyApDQo+IA0KPiBJIGd1ZXNzIHRoaXMgd2FudHMgYW1l
bmRpbmcgYnkgIiYmICFyYyI/DQoNCkkgY2FuIGRvIHRoYXQsIGlmIHlvdSBsaWtlIHRoYXQg
YmV0dGVyLg0KDQoNCkp1ZXJnZW4NCg==
--------------aaYZ0EBWowl0Pf0ZVZVEXwvO
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------aaYZ0EBWowl0Pf0ZVZVEXwvO--

--------------Hwig5wVfU0dMwqGVZR3TVSxA--

--------------sKEWVXj645OmzupvKhjAA2ss
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmMbBqMFAwAAAAAACgkQsN6d1ii/Ey+w
kQf/YFcJa5HFjDkLU+kbkQEVVCD10J4zONOXy6LNaNal/tCGADZ0EBF1W0KbpZTjH26Osv0ANZeP
KOldAdym/H/SSdP1pwZK5XgG1yXiDEieU05lwAYqiZLDPukaK7iah18yEoXSNpvHd/Fg0XZrSvdT
QX18HnkFP5WcUJ9ypbnrIkO4s9dK8Euadd22YfMM6VqpXl8As7lIAP3vOjTTACFhEDEHHov52ffa
S+jXuXiiXsXIj50pKg0ahryHA1ob2WMaAK0R++5EUYl0PkMgdFxaoUokgHQCkaxAQs2behdHTEz3
wKwzRW3fIy3NDCDns7O3GrvauVakNHIOLPFx2AyqGA==
=TwWj
-----END PGP SIGNATURE-----

--------------sKEWVXj645OmzupvKhjAA2ss--

