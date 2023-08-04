Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E76770068
	for <lists+xen-devel@lfdr.de>; Fri,  4 Aug 2023 14:45:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577148.904054 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRu9w-0004jT-Fn; Fri, 04 Aug 2023 12:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577148.904054; Fri, 04 Aug 2023 12:44:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRu9w-0004h1-Ct; Fri, 04 Aug 2023 12:44:00 +0000
Received: by outflank-mailman (input) for mailman id 577148;
 Fri, 04 Aug 2023 12:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Hv6=DV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qRu9v-0004gv-0c
 for xen-devel@lists.xenproject.org; Fri, 04 Aug 2023 12:43:59 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93e0edcc-32c4-11ee-b26c-6b7b168915f2;
 Fri, 04 Aug 2023 14:43:57 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E63341F749;
 Fri,  4 Aug 2023 12:43:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3089133B5;
 Fri,  4 Aug 2023 12:43:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uS66KYzyzGSsfQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 04 Aug 2023 12:43:56 +0000
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
X-Inumbo-ID: 93e0edcc-32c4-11ee-b26c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691153036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfW6QB5yZXFZ2212VgUiVr7JUPgrxG7dwhv7QI16/jU=;
	b=bF+GpmGzeOpa1INu/9i8O4aDNpoTA1/vcATw89Z6/ELa7cEGcUH8LO8379tsx9+8J9n1MV
	gir7mue+uvG2KeknRzEDblH5RO+y8imZ2wYRP9rBbOlqoHpDwHJoVc4Vz5i/MJyykvciTJ
	HXH8TrH1g3/wEGGyksIUEtOoXbrj5Bo=
Message-ID: <0deb1b5f-86e7-cfe8-46cc-27c6d2bad6a8@suse.com>
Date: Fri, 4 Aug 2023 14:43:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
 <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
 <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
 <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
 <8e7d18a0-0130-4ae5-adac-cfc122d6fb16@xen.org>
 <8f9a76fc-283a-e3f3-d19f-04401389a7de@suse.com>
 <b8d23151-a159-441c-8e7e-5d4c199936f9@xen.org>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <b8d23151-a159-441c-8e7e-5d4c199936f9@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IFu6k4ljD8mJsMUVJHKk5Gl5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IFu6k4ljD8mJsMUVJHKk5Gl5
Content-Type: multipart/mixed; boundary="------------Eaqx0aNR0RTA2WKVtRlJrWkP";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <0deb1b5f-86e7-cfe8-46cc-27c6d2bad6a8@suse.com>
Subject: Re: [PATCH v3 23/25] tools/xenstore: merge is_valid_nodename() into
 canonicalize()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-24-jgross@suse.com>
 <dab986c3-e875-75a9-849c-954fb84edff7@xen.org>
 <99a76ceb-df27-3a37-296b-9fcf1671472e@suse.com>
 <e3b4e4c0-f188-4b7c-ad47-8c6d60532969@xen.org>
 <6193da26-c348-dcd2-b3ef-7b75ce4da376@suse.com>
 <8e7d18a0-0130-4ae5-adac-cfc122d6fb16@xen.org>
 <8f9a76fc-283a-e3f3-d19f-04401389a7de@suse.com>
 <b8d23151-a159-441c-8e7e-5d4c199936f9@xen.org>
In-Reply-To: <b8d23151-a159-441c-8e7e-5d4c199936f9@xen.org>

--------------Eaqx0aNR0RTA2WKVtRlJrWkP
Content-Type: multipart/mixed; boundary="------------tmV0RKt0tzrAOxmtqDCEIBog"

--------------tmV0RKt0tzrAOxmtqDCEIBog
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMDguMjMgMTQ6MjcsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA0LzA4LzIwMjMgMTM6MDUsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwNC4wOC4yMyAxMjozMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+PiBjb25zdCBjaGFy
ICpjYW5vbmljYWxpemUoc3RydWN0IGNvbm5lY3Rpb24gKmNvbm4sIGNvbnN0IHZvaWQgKmN0
eCwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29uc3QgY2hhciAqbm9kZSwgYm9vbCBhbGxvd19zcGVjaWFsKQ0KPj4+PiB7DQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqbmFtZTsNCj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoCBpbnQgbG9jYWxfb2ZmID0gMDsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCB1bnNp
Z25lZCBpbnQgZG9taWQ7DQo+Pj4+DQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqAgLyoNCj4+Pj4g
wqDCoMKgwqDCoMKgwqDCoMKgICogSW52YWxpZCBpZiBhbnkgb2Y6DQo+Pj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCAqIC0gbm8gbm9kZSBhdCBhbGwNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKg
ICogLSBpbGxlZ2FsIGNoYXJhY3RlciBpbiBub2RlDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCAqIC0gc3RhcnRzIHdpdGggJ0AnIGJ1dCBubyBzcGVjaWFsIG5vZGUgYWxsb3dlZA0KPj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqAgKi8NCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBlcnJubyA9
IEVJTlZBTDsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAoIW5vZGUgfHwNCj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnNwbihub2RlLCANCj4+Pj4gIkFCQ0RFRkdISUpL
TE1OT1BRUlNUVVZXWFlaYWJjZGVmZ2hpamtsbW5vcHFyc3R1dnd4eXoiDQo+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICIwMTIzNDU2
Nzg5LS9fQCIpICE9IHN0cmxlbihub2RlKSB8fA0KPj4+DQo+Pj4gLi4uIEkgd291bGQgcmF0
aGVyIGtlZXAgY2FsbGluZyB2YWxpZF9jaGFycygpIGhlcmUuIFRoZSByZXN0IGxvb2tzIGZp
bmUgZXZlbiANCj4+PiB0aG91Z2ggdGhpcyBpcyBkZWZpbml0ZWx5IG5vdCBteSBwcmVmZXJl
bmNlLg0KPj4NCj4+IEkgY2FuIGRvIHRoYXQsIGV2ZW4gaWYgSSBkb24ndCBzZWUgdGhlIHJl
YWwgdmFsdWUgd2l0aCB0aGUgY29tbWVudCBhYm92ZSB0aGUgaWYuDQo+IA0KPiBIb3cgYWJv
dXQgd3JpdGluZyBYZW5zdG9yZWQgaW4gYSBzaW5nbGUgZnVuY3Rpb24gdGhlbj8gQWZ0ZXIg
YWxsIHdpdGggY29tbWVudHMgDQo+IGl0IHNob3VsZCBiZSBlYXN5IHRvIHJlYWQsIHJpZ2h0
PyA6KQ0KDQpZZWFoLCByaWdodC4NCg0KTWlnaHQgY29tZSB3aXRoIHRoZSBkb3duc2lkZSBv
ZiBhIGxpdHRsZSBiaXQgb2YgY29kZSBkdXBsaWNhdGlvbi4gOy0pDQoNCj4gDQo+IFRoZXJl
IGFyZSBhIGZldyBkaWZmaWN1bHR5IHdpdGggdGhlIGN1cnJlbnQgYXBwcm9hY2guIFRoZXJl
IGFyZToNCj4gIMKgICogYSBsYXJnZSBmdW5jdGlvbiBjYWxsIHRoYXQgbmVlZHMgdG8gYmUg
c3BsaXQgb3ZlciB0d28gbGluZXMNCj4gIMKgICogbXVsdGlwbGUgfHwgd2hpY2ggYWxzbyBu
ZWVkIHRvIHNwbGl0IG92ZXIgbXVsdGlwbGUgbGluZXMuDQo+ICDCoCAqIE5vIHBhcmVudGhl
c2VzIG92ZXIgc3Ryc3BuKC4uLi4pICE9IHN0cmxlbihub2RlKQ0KPiANCj4gTWF5YmUgeW91
IGNhbiBwYXJzZS91bmRlcnN0YW5kIHRoaXMgJ2lmJyB2ZXJ5IHF1aWNrbHkuIEJ1dCBJIGNh
bid0IGFuZCB0aGlzIGlzIA0KPiBqdXN0IHNsb3dpbmcgZG93biByZXZpZXcgYW5kIGluY3Jl
YXNpbmcgdGhlIHJpc2sgb2YgaW50cm9kdWNpbmcgYnVncy4NCg0KT2theSwgYXMgc2FpZCBh
Ym92ZTogSSBjYW4gZG8gdGhhdC4NCg0KDQpKdWVyZ2VuDQo=
--------------tmV0RKt0tzrAOxmtqDCEIBog
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------tmV0RKt0tzrAOxmtqDCEIBog--

--------------Eaqx0aNR0RTA2WKVtRlJrWkP--

--------------IFu6k4ljD8mJsMUVJHKk5Gl5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTM8owFAwAAAAAACgkQsN6d1ii/Ey+Z
Bgf/ZDNcEpJglkRia3GBqq4fhgft1+Q/yp19qfqNoloc4+riNuy5RQSWPZDWVM2Fnyz50AdN6s0X
J/HWlZXcX2Lg3DzMMu4YxDqjtdL/klsUkJLzfK4zYxU+9LyAoNPm90ym0c7QxuVzexk765Kz46GE
L3bBmvWsNgl4ct8tXQeeszkDGmVXRmmVKuQ9woRic55+RVgYKqTIIRwNNdkqqrvxRk1O79ZsYR+j
ElJHmF4L83vRH2CiZOklfOPpb/my99EgtkyG5qUx/z3cWKaIYQz2uNugBn7HCuoTyJQwS19SCb0r
ZkclE4BWZmD4W84NbW7Jb+JwmxXU9cVA7eGEVNA4Dg==
=U0OI
-----END PGP SIGNATURE-----

--------------IFu6k4ljD8mJsMUVJHKk5Gl5--

