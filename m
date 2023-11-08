Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 500537E508A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Nov 2023 07:55:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629201.981223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0cSr-0007UY-Tz; Wed, 08 Nov 2023 06:55:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629201.981223; Wed, 08 Nov 2023 06:55:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r0cSr-0007SX-Ol; Wed, 08 Nov 2023 06:55:01 +0000
Received: by outflank-mailman (input) for mailman id 629201;
 Wed, 08 Nov 2023 06:55:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=777z=GV=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r0cSq-0007NB-7k
 for xen-devel@lists.xenproject.org; Wed, 08 Nov 2023 06:55:00 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bbb9e49a-7e03-11ee-98da-6d05b1d4d9a1;
 Wed, 08 Nov 2023 07:54:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 526062195F;
 Wed,  8 Nov 2023 06:54:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 28EFA138F2;
 Wed,  8 Nov 2023 06:54:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yL/3B8MwS2XYCwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 08 Nov 2023 06:54:59 +0000
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
X-Inumbo-ID: bbb9e49a-7e03-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699426499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uAW4xBAr4gHf7EOudDtQSyj8X1lNtB7q5dyezYaf1Ik=;
	b=ak880mZqMCeah+YmY6VyPqY9XRTVrfcFv8d1rBkSVXRjBAu4YyMe4tD3A4WV6ol1TKO3us
	N9Lu/MbtPlY/W+RMblxvYMyPa4oiqnd9er9sBHkWEI2RZ593mrMt+waLXSCvT1is7hIzTs
	pOpg2rbPKM6QL9nznCuhyOXnJkTNn4c=
Message-ID: <f83f7013-a174-458f-a6d5-a24675c899da@suse.com>
Date: Wed, 8 Nov 2023 07:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/29] tools: add 9pfs device to xenstore-stubdom
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-21-jgross@suse.com>
 <CAKf6xps6DOJpVqsVv_OzQbuG2fQniYtbDyu=WSqrC+FXC=K5dw@mail.gmail.com>
From: Juergen Gross <jgross@suse.com>
Autocrypt: addr=jgross@suse.com; keydata=
 xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOB
 ycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJve
 dYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJ
 NwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvx
 XP3FAp2pkW0xqG7/377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEB
 AAHNH0p1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT7CwHkEEwECACMFAlOMcK8CGwMH
 CwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRCw3p3WKL8TL8eZB/9G0juS/kDY9LhEXseh
 mE9U+iA1VsLhgDqVbsOtZ/S14LRFHczNd/Lqkn7souCSoyWsBs3/wO+OjPvxf7m+Ef+sMtr0
 G5lCWEWa9wa0IXx5HRPW/ScL+e4AVUbL7rurYMfwCzco+7TfjhMEOkC+va5gzi1KrErgNRHH
 kg3PhlnRY0Udyqx++UYkAsN4TQuEhNN32MvN0Np3WlBJOgKcuXpIElmMM5f1BBzJSKBkW0Jc
 Wy3h2Wy912vHKpPV/Xv7ZwVJ27v7KcuZcErtptDevAljxJtE7aJG6WiBzm+v9EswyWxwMCIO
 RoVBYuiocc51872tRGywc03xaQydB+9R7BHPzsBNBFOMcBYBCADLMfoA44MwGOB9YT1V4KCy
 vAfd7E0BTfaAurbG+Olacciz3yd09QOmejFZC6AnoykydyvTFLAWYcSCdISMr88COmmCbJzn
 sHAogjexXiif6ANUUlHpjxlHCCcELmZUzomNDnEOTxZFeWMTFF9Rf2k2F0Tl4E5kmsNGgtSa
 aMO0rNZoOEiD/7UfPP3dfh8JCQ1VtUUsQtT1sxos8Eb/HmriJhnaTZ7Hp3jtgTVkV0ybpgFg
 w6WMaRkrBh17mV0z2ajjmabB7SJxcouSkR0hcpNl4oM74d2/VqoW4BxxxOD1FcNCObCELfIS
 auZx+XT6s+CE7Qi/c44ibBMR7hyjdzWbABEBAAHCwF8EGAECAAkFAlOMcBYCGwwACgkQsN6d
 1ii/Ey9D+Af/WFr3q+bg/8v5tCknCtn92d5lyYTBNt7xgWzDZX8G6/pngzKyWfedArllp0Pn
 fgIXtMNV+3t8Li1Tg843EXkP7+2+CQ98MB8XvvPLYAfW8nNDV85TyVgWlldNcgdv7nn1Sq8g
 HwB2BHdIAkYce3hEoDQXt/mKlgEGsLpzJcnLKimtPXQQy9TxUaLBe9PInPd+Ohix0XOlY+Uk
 QFEx50Ki3rSDl2Zt2tnkNYKUCvTJq7jvOlaPd6d/W0tZqpyy7KVay+K4aMobDsodB3dvEAs6
 ScCnh03dDAFgIq5nsB11j3KPKdVoPlfucX2c7kGNH+LUMbzqV6beIENfNexkOfxHfw==
In-Reply-To: <CAKf6xps6DOJpVqsVv_OzQbuG2fQniYtbDyu=WSqrC+FXC=K5dw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fpq6f80frL07sXquXcnaDYvh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fpq6f80frL07sXquXcnaDYvh
Content-Type: multipart/mixed; boundary="------------Aq02Kf5xnsUN7lEvwH8oz0sj";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <f83f7013-a174-458f-a6d5-a24675c899da@suse.com>
Subject: Re: [PATCH 20/29] tools: add 9pfs device to xenstore-stubdom
References: <20231101093325.30302-1-jgross@suse.com>
 <20231101093325.30302-21-jgross@suse.com>
 <CAKf6xps6DOJpVqsVv_OzQbuG2fQniYtbDyu=WSqrC+FXC=K5dw@mail.gmail.com>
In-Reply-To: <CAKf6xps6DOJpVqsVv_OzQbuG2fQniYtbDyu=WSqrC+FXC=K5dw@mail.gmail.com>

--------------Aq02Kf5xnsUN7lEvwH8oz0sj
Content-Type: multipart/mixed; boundary="------------Y61Fk3AD34vqEYUsDTPMiKmK"

--------------Y61Fk3AD34vqEYUsDTPMiKmK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDcuMTEuMjMgMjA6MTgsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIFdlZCwgTm92
IDEsIDIwMjMgYXQgODoyM+KAr0FNIEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4g
d3JvdGU6DQo+Pg0KPj4gQWRkIGEgOXBmcyBkZXZpY2UgdG8gWGVuc3RvcmUgc3R1YmRvbSBp
biBvcmRlciB0byBhbGxvdyBpdCB0byBkbyBlLmcuDQo+PiBsb2dnaW5nIGludG8gYSBkb20w
IGZpbGUuDQo+Pg0KPj4gVXNlIHRoZSBmb2xsb3dpbmcgcGFyYW1ldGVycyBmb3IgdGhlIG5l
dyBkZXZpY2U6DQo+Pg0KPj4gLSB0YWcgPSAieGVuIg0KPj4gLSB0eXBlID0gInhlbmxvZ2Qi
DQo+PiAtIHBhdGggPSAiL3Zhci9saWIveGVuL3hlbnN0b3JlIg0KPj4NCj4+IEZvciBub3cg
ZG9uJ3QgbGltaXQgYWxsb3dlZCBmaWxlIHNwYWNlIG9yIG51bWJlciBvZiBmaWxlcy4NCj4+
DQo+PiBBZGQgYSBuZXcgbGlieGwgZnVuY3Rpb24gZm9yIGFkZGluZyBpdCBzaW1pbGFyIHRv
IHRoZSBmdW5jdGlvbiBmb3INCj4+IGFkZGluZyB0aGUgY29uc29sZSBkZXZpY2UuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29tPg0KPiAN
Cj4+IGRpZmYgLS1naXQgYS90b29scy9saWJzL2xpZ2h0L2xpYnhsXzlwZnMuYyBiL3Rvb2xz
L2xpYnMvbGlnaHQvbGlieGxfOXBmcy5jDQo+PiBpbmRleCAwYjlkODRkY2U5Li4zMjk3Mzg5
NDkzIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMvbGlicy9saWdodC9saWJ4bF85cGZzLmMNCj4+
ICsrKyBiL3Rvb2xzL2xpYnMvbGlnaHQvbGlieGxfOXBmcy5jDQo+PiBAQCAtMTc0LDYgKzE3
NCwzNSBAQCBzdGF0aWMgdm9pZCBsaWJ4bF9fZGV2aWNlX3A5X2FkZChsaWJ4bF9fZWdjICpl
Z2MsIHVpbnQzMl90IGRvbWlkLA0KPj4gICAgICAgICAgIGFvZGV2LT5jYWxsYmFjayhlZ2Ms
IGFvZGV2KTsNCj4+ICAgfQ0KPj4NCj4+ICtpbnQgbGlieGxfcDlfYWRkX3hlbnN0b3JlKGxp
YnhsX2N0eCAqY3R4LCB1aW50MzJfdCBkb21pZCwgdWludDMyX3QgYmFja2VuZCwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgIGxpYnhsX3A5X3R5cGUgdHlwZSwgY2hhciAqdGFn
LCBjaGFyICpwYXRoLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQg
aW50IG1heF9zcGFjZSwgdW5zaWduZWQgaW50IG1heF9maWxlcywNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBtYXhfb3Blbl9maWxlcywgYm9vbCBhdXRv
X2RlbGV0ZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnN0IGxpYnhsX2Fz
eW5jb3BfaG93ICphb19ob3cpDQo+PiArew0KPj4gKyAgICBBT19DUkVBVEUoY3R4LCBkb21p
ZCwgYW9faG93KTsNCj4+ICsgICAgbGlieGxfX2FvX2RldmljZSAqYW9kZXY7DQo+PiArICAg
IGxpYnhsX2RldmljZV9wOSBwOSA9IHsgLmJhY2tlbmRfZG9taWQgPSBiYWNrZW5kLA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgIC50YWcgPSB0YWcsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgLnBhdGggPSBwYXRoLA0KPj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIC5zZWN1cml0eV9tb2RlbCA9ICJub25lIiwNCj4gDQo+IFdoaWxlIHRoZSB4
bC5jZmcgbWFuIHBhZ2Ugc3RhdGVzIHRoYXQgb25seSBzZWN1cml0eV9tb2RlbD0ibm9uZSIg
aXMNCj4gc3VwcG9ydGVkLCBpdCBpcyBwb3NzaWJsZSB0byB1c2Ugb3RoZXIgb25lcy4gICAg
VGhlIHZhbHVlIGlzbid0DQo+IGluc3BlY3RlZCBhbmQgaXQgaXMganVzdCBwYXNzZWQgdGhy
b3VnaCBYZW5zdG9yZSB0byBRRU1VLiAgUUVNVSBjYW4NCj4gdGhlbiBvcGVyYXRlIGhvd2V2
ZXIgaXQgb3BlcmF0ZXMuICBJIGp1c3QgdGVzdGVkIG1hcHBlZC14YXR0ciBhbmQgaXQncw0K
PiB3b3JraW5nIGZyb20gc29tZSBxdWljayB0ZXN0aW5nLiAgU28gbWF5YmUgbGlieGxfcDlf
YWRkX3hlbnN0b3JlKCkNCj4gc2hvdWxkIHRha2Ugc2VjdXJpdHlfbW9kZWwgYXMgYW4gYXJn
dW1lbnQsIGFuZCB0aGVuDQo+IGluaXQteGVuc3RvcmUtZG9tYWluIGNhbiBwYXNzIGluICJu
b25lIj8NCg0KWWVzLCBnb29kIGlkZWEuDQoNCj4gDQo+IEV2ZXJ5dGhpbmcgZWxzZSBsb29r
cyBnb29kLCBzbyBlaXRoZXIgd2F5Og0KPiBSZXZpZXdlZC1ieTogSmFzb24gQW5kcnl1ayA8
amFuZHJ5dWtAZ21haWwuY29tPg0KDQpUaGFua3MsDQoNCkp1ZXJnZW4NCg==
--------------Y61Fk3AD34vqEYUsDTPMiKmK
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Y61Fk3AD34vqEYUsDTPMiKmK--

--------------Aq02Kf5xnsUN7lEvwH8oz0sj--

--------------fpq6f80frL07sXquXcnaDYvh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVLMMMFAwAAAAAACgkQsN6d1ii/Ey/n
0gf9HqMj9GbqwHFpCR4sNaDTjzIEocEF+5KUtyjm/KSCX4yU5s6DIfxmxAEgVHqauq15rhw1qmdW
d/P32kr3m3NjXEq3Jg9bbUNXstkgEx07Dyhbo1pZgSRDPzLyDgae6VHMnPa+jVzYWB+qbgbT1sdL
DzvoYvfbkiBM/N6bpbE5tcMClJVGYGw3Rw1zzCEgb2SbVm8bgPicECuvN5Wf0BG6Uwx8y6RMK1xk
nK3pbMt297pyXeStZRbZN3++a4PY/+yBE9c+4Gs9OkZIuz01/t2quSz8aMmTEMt5VG268YWaaeuu
iWvp+aRtMAiPv5CtGLkzkjeSjfXcweKsgRH4nSVRRQ==
=3rL3
-----END PGP SIGNATURE-----

--------------fpq6f80frL07sXquXcnaDYvh--

