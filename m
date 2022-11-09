Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5AC622B60
	for <lists+xen-devel@lfdr.de>; Wed,  9 Nov 2022 13:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440898.695134 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osk1o-0008Ro-Ov; Wed, 09 Nov 2022 12:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440898.695134; Wed, 09 Nov 2022 12:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osk1o-0008Q2-LB; Wed, 09 Nov 2022 12:18:00 +0000
Received: by outflank-mailman (input) for mailman id 440898;
 Wed, 09 Nov 2022 12:17:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B/Op=3J=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1osk1n-0008Pu-7s
 for xen-devel@lists.xenproject.org; Wed, 09 Nov 2022 12:17:59 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b96e0d2-6028-11ed-91b5-6bf2151ebd3b;
 Wed, 09 Nov 2022 13:17:57 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 34CBC226C8;
 Wed,  9 Nov 2022 12:17:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0EAC5139F1;
 Wed,  9 Nov 2022 12:17:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id F8HsAXWaa2NaWQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 09 Nov 2022 12:17:57 +0000
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
X-Inumbo-ID: 8b96e0d2-6028-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1667996277; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Yr3VsMNK5AD4K8VNOVgIQzk0vM9N6EBiDw24ioIQ4cE=;
	b=mHumIm353eqkj+YZZTMIbjRWenfSlhS1Hpiq93oEIi+758EThomB1as/EDcwWvtQ6VZVg9
	eQjP1L1BYGH8i0WsZVU5AmX1Hmc0tr+O8B4aQOmphBcaeUwxTFI6GrSSU5FLr/H8lkgukS
	hCUKXFltCu1btaoStRCz9apFPq/S6HU=
Message-ID: <53c894ea-f073-7f82-69dc-99b74f501ccd@suse.com>
Date: Wed, 9 Nov 2022 13:17:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
 <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
 <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
 <5fe0a47c-66ca-9e0a-4742-1663c7761256@xen.org>
 <90878b0e-c40e-e4cc-e423-c514a72ede7f@suse.com>
 <10204661-e985-ef5e-b7a7-820e2dbba021@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
In-Reply-To: <10204661-e985-ef5e-b7a7-820e2dbba021@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LRnbvbbvCuOzubQR5dFJs0Bo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LRnbvbbvCuOzubQR5dFJs0Bo
Content-Type: multipart/mixed; boundary="------------SS9qB0wkPQNshs40rb83nA0E";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <53c894ea-f073-7f82-69dc-99b74f501ccd@suse.com>
Subject: Re: [PATCH 06/20] tools/xenstore: remove all watches when a domain
 has stopped
References: <20221101152842.4257-1-jgross@suse.com>
 <20221101152842.4257-7-jgross@suse.com>
 <67cb3364-d5c1-28d8-4cda-8933de5cb9f7@xen.org>
 <703aa58c-1b7c-abb6-995d-5c5cdfcde878@suse.com>
 <5fe0a47c-66ca-9e0a-4742-1663c7761256@xen.org>
 <90878b0e-c40e-e4cc-e423-c514a72ede7f@suse.com>
 <10204661-e985-ef5e-b7a7-820e2dbba021@xen.org>
In-Reply-To: <10204661-e985-ef5e-b7a7-820e2dbba021@xen.org>

--------------SS9qB0wkPQNshs40rb83nA0E
Content-Type: multipart/mixed; boundary="------------B7xbmxkMqaNmMZUEqBGFezxm"

--------------B7xbmxkMqaNmMZUEqBGFezxm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMTEuMjIgMTE6NDYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDA4LzExLzIwMjIgMDc6NTQsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBP
biAwNy4xMS4yMiAxOTozMywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+DQo+Pj4NCj4+PiBP
biAwNy8xMS8yMDIyIDA3OjU0LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+PiBPbiAwNi4x
MS4yMiAyMjoxOCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPj4+Pj4gSGkgSnVlcmdlbiwNCj4+
Pj4+DQo+Pj4+PiBPbiAwMS8xMS8yMDIyIDE1OjI4LCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0K
Pj4+Pj4+IFdoZW4gYSBkb21haW4gaGFzIGJlZW4gcmVjb2duaXplZCB0byBoYXZlIHN0b3Bw
ZWQsIHJlbW92ZSBhbGwgaXRzDQo+Pj4+Pj4gcmVnaXN0ZXJlZCB3YXRjaGVzLiBUaGlzIGF2
b2lkcyBzZW5kaW5nIHdhdGNoIGV2ZW50cyB0byB0aGUgZGVhZCBkb21haW4NCj4+Pj4+PiB3
aGVuIGFsbCB0aGUgbm9kZXMgcmVsYXRlZCB0byBpdCBhcmUgYmVpbmcgcmVtb3ZlZCBieSB0
aGUgWGVuIHRvb2xzLg0KPj4+Pj4NCj4+Pj4+IMKgRnJvbSBteSB1bmRlcnN0YW5kaW5nLCBz
aHV0ZG93biBkb2Vzbid0IG1lYW4gZGVhZC4gSXQgbWF5IGJlIHVzZWQgZHVyaW5nIA0KPj4+
Pj4gbWlncmF0aW9uIChvciBzbmFwc2hvdHRpbmcpLCB3aGVyZSB3ZSBkb24ndCB3YW50IHRv
IHRvdWNoIHRoZSBzdGF0ZSBpbiBjYXNlIA0KPj4+Pj4gb2YgYSBjYW5jZWxsYXRpb24gKG9y
IHJlc3VtZSkuDQo+Pj4+Pg0KPj4+Pj4gRm9yIGluc3RhbmNlLCBzZWUgdGhlIGNvbW1hbmQg
WFNfUkVTVU1FIHdoaWNoIHdpbGwgY2xlYXIgZG9tYWluLT5zaHV0ZG93bi4NCj4+Pj4NCj4+
Pj4gT2gsIGdvb2QgY2F0Y2ghDQo+Pj4+DQo+Pj4+IEkgbmVlZCB0byBhZGRpdGlvbmFsbHkg
Y2hlY2sgdGhlICJzaHV0ZG93biByZWFzb24iLiBJIGNhbiByZW1vdmUgdGhlDQo+Pj4+IHdh
dGNoZXMgb25seSBpbiBjYXNlIG9mIHRoZSByZWFzb24gbm90IGhhdmluZyBiZWVuICJzdXNw
ZW5kIi4NCj4+Pg0KPj4+IFRoaXMgaXMgcXVpdGUgZnJhZ2lsZSBiZWNhdXNlIHdlIG1heSBh
ZGQgbmV3IHNodXRkb3duIGNvZGUgaW4gdGhlIGZ1dHVyZSB0aGF0IA0KPj4+IGNvdWxkIHJl
c3VtZS4NCj4+Pg0KPj4+IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIG9ubHkgZGVs
ZXRlIHRoZSB3YXRjaGVzIGlmIHRoZSBkb21haW4gaXMgDQo+Pj4gZWZmZWN0aXZlbHkgZHlp
bmcgKEkgZG9uJ3QgdGhpbmsgaXQgY2FuIGNvbWUgYmFjayBmcm9tIHRoYXQgc3RhdGUpDQo+
Pg0KPj4gVGhpcyBpcyBob3cgaXQgaXMgZG9uZSB0b2RheS4NCj4gDQo+IE5vdCByZWFsbHku
IGRvbWluZm8uZHlpbmcgaXMgb25seSBzZXQgaWYgdGhlIGRvbWFpbiBpcyBkZWFkIChpLmUu
IA0KPiBET01EWUlOR19kZWFkKS4gVGhpcyBpcyBoYXBwZW5pbmcgKmFmdGVyKiBldmVyeXRo
aW5nIGhhcyBiZWVuIHJlbGlucXVpc2hlZC4gU28gDQo+IHRoaXMgaXMgcXVpdGUgbGF0ZSBj
b21wYXJlIHRvIHdoYXQgeW91IHNlZW0gdG8gd2FudC4NCg0KSSBtZWFudCB0aGF0IHRoZSB3
YXRjaGVzIGFyZSByZW1vdmVkIHRvZGF5IHdoZW4gdGhlIGRvbWFpbiBoYXMgYmVlbg0KZGV0
ZWN0ZWQgdG8gYnkgZHlpbmcgKHNvIHdoZW4gcmVtb3ZpbmcgdGhlIHN0cnVjdCBkb21haW4g
aW4geGVuc3RvcmVkKS4NCg0KPj4gVGhlIGRvbWFpbidzIFhlbnN0b3JlIGVudHJpZXMgYXJl
IHJlbW92ZWQgYmVmb3JlIHRoZSBkb21haW4gaXMgYmVpbmcNCj4+IGRlc3Ryb3llZC4NCj4g
RG8geW91IG1lYW4gYmVmb3JlIGRvbWFpbl9raWxsKCkgaXMgY2FsbGVkPyBJZiBzbywgbWF5
YmUgd2Ugc2hvdWxkIGNhbGwgDQo+IGRvbWFpbl9raWxsKCkgYmVmb3JlIGhhbmQuDQoNClRo
aXMgd291bGQgcHJvYmFibHkgaW50cm9kdWNlIGEgcmFjZTogdGhlIGRvbWlkIHdvdWxkIG5v
IGxvbmdlciBiZSByZXNlcnZlZA0KaW4gdGhlIGh5cGVydmlzb3IsIHNvIGEgbmV3IGRvbWFp
biB3aXRoIHRoZSBzYW1lIGRvbWlkIGNvdWxkIHNob3cgdXAgYW5kDQpyZW1vdmFsIG9mIHRo
ZSBvbGQgZG9tYWluIGRhdGEgYW5kIGludHJvZHVjdGlvbiBvZiB0aGUgbmV3IGRvbWFpbiBk
YXRhIGNvdWxkDQppbnRlcmZlcmUuDQoNCj4gVGhlIG90aGVyIGFsdGVybmF0aXZlLCB3b3Vs
ZCBiZSB0byBub3RpZnkgdGhlIFhlbnN0b3JlZCB0aGF0IGRvbWFpbiBpcyBuZXZlciANCj4g
Z29pbmcgdG8gY29tZSBiYWNrLg0KDQpZZXMsIHRoaXMgc2hvdWxkIHJlYWxseSB3b3JrLg0K
DQp4c19yZWxlYXNlX2RvbWFpbigpIHNob3VsZCBwcm9iYWJseSBkbyB0aGUgam9iLg0KDQoN
Ckp1ZXJnZW4NCg==
--------------B7xbmxkMqaNmMZUEqBGFezxm
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------B7xbmxkMqaNmMZUEqBGFezxm--

--------------SS9qB0wkPQNshs40rb83nA0E--

--------------LRnbvbbvCuOzubQR5dFJs0Bo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmNrmnQFAwAAAAAACgkQsN6d1ii/Ey+t
mAf/VjEQwRfxojTfnsZnK3K6nDzaXdqMqBEw5UnbN1oM8XE7/oiwewUB1kh8FIFEB1fWAO9orprR
7d2BEGtAGDS8jIk53S1l3Zo/czbmK6HoryG3HXzbwYERkffcl96ww9OOBntyeocCVtuGoQ3HQOho
Yelki+AwQIp/jVqS1eesecSQkPMi/gdCUViEnyBHkGs9euP2Ce3DF5fBcesIWDtnN+IjltK1FXyj
Vue1qpkzlYOPApkmyiXr69e/awF4UopQw6GNtAf5Yg/OnZQS790rbHjdcsaL487qg9lUv0lIiPGa
UTcohVnvZ9itVZNDj0hWCPP79WiWSuZH03uKJdz+mA==
=+jsd
-----END PGP SIGNATURE-----

--------------LRnbvbbvCuOzubQR5dFJs0Bo--

