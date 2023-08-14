Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9333D77B0DE
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 07:48:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583163.913219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVQRG-0002KF-0z; Mon, 14 Aug 2023 05:48:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583163.913219; Mon, 14 Aug 2023 05:48:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVQRF-0002Hi-Tp; Mon, 14 Aug 2023 05:48:25 +0000
Received: by outflank-mailman (input) for mailman id 583163;
 Mon, 14 Aug 2023 05:48:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVQRF-0002Hc-0C
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 05:48:25 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2e2c67b6-3a66-11ee-b288-6b7b168915f2;
 Mon, 14 Aug 2023 07:48:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E30AB21996;
 Mon, 14 Aug 2023 05:48:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B449E13357;
 Mon, 14 Aug 2023 05:48:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id z4InKibA2WQ6FAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 05:48:22 +0000
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
X-Inumbo-ID: 2e2c67b6-3a66-11ee-b288-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691992102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=I0vapKqRXQ37MjK8Q9xHiGe0FOpELOjBDXxmd8FN0CA=;
	b=Qi+n5xPLMcgfVEdbIYSXtDCuu4CNr8J/G2zzQDt4QncMJSseSkk37Hh77E/R7HD4jtnLlK
	eksxU3PukF+CieUM3x7Gl1/xC6rACEtPW1iFXp5R1Oa3Q4NPponTwvIBAScsB8l6UPP+SF
	UtmahjYJ8cbStil//oWEIozgN0W1pWw=
Message-ID: <78c8132e-ee13-47da-8ca7-684f5ede5c74@suse.com>
Date: Mon, 14 Aug 2023 07:48:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/25] tools/xenstore: rework get_node()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-25-jgross@suse.com>
 <389197ab-92fa-b3ad-969f-29dcda402b21@xen.org>
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
In-Reply-To: <389197ab-92fa-b3ad-969f-29dcda402b21@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------407cAlYM55HK0IyqqFlPv12Y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------407cAlYM55HK0IyqqFlPv12Y
Content-Type: multipart/mixed; boundary="------------t2DUuHy9uBrmJnZzE1voT670";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <78c8132e-ee13-47da-8ca7-684f5ede5c74@suse.com>
Subject: Re: [PATCH v3 24/25] tools/xenstore: rework get_node()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-25-jgross@suse.com>
 <389197ab-92fa-b3ad-969f-29dcda402b21@xen.org>
In-Reply-To: <389197ab-92fa-b3ad-969f-29dcda402b21@xen.org>

--------------t2DUuHy9uBrmJnZzE1voT670
Content-Type: multipart/mixed; boundary="------------AAMNeWIOMwOd0my257dVhvFR"

--------------AAMNeWIOMwOd0my257dVhvFR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDguMjMgMTQ6MDMsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uZSBtb3JlIHJlbWFyay4NCj4gDQo+IE9uIDI0LzA3LzIwMjMgMTI6MDIsIEp1
ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBUb2RheSBnZXRfbm9kZV9jYW5vbmljYWxpemVkKCkg
aXMgdGhlIG9ubHkgY2FsbGVyIG9mIGdldF9ub2RlKCkuDQo+Pg0KPj4gSW4gb3JkZXIgdG8g
cHJlcGFyZSBpbnRyb2R1Y2luZyBhIGdldF9ub2RlKCkgdmFyaWFudCByZXR1cm5pbmcgYQ0K
Pj4gcG9pbnRlciB0byBjb25zdCBzdHJ1Y3Qgbm9kZSwgZG8gdGhlIGZvbGxvd2luZyByZXN0
cnVjdHVyaW5nOg0KPj4NCj4+IC0gbW92ZSB0aGUgY2FsbCBvZiByZWFkX25vZGUoKSBmcm9t
IGdldF9ub2RlKCkgaW50bw0KPj4gwqDCoCBnZXRfbm9kZV9jYW5vbmljYWxpemVkKCkNCj4+
DQo+PiAtIHJlbmFtZSBnZXRfbm9kZSgpIHRvIGdldF9ub2RlX2Noa19wZXJtKCkNCj4+DQo+
PiAtIHJlbmFtZSBnZXRfbm9kZV9jYW5vbmljYWxpemVkKCkgdG8gZ2V0X25vZGUoKQ0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+
IC0tLQ0KPj4gVjM6DQo+PiAtIG5ldyBwYXRjaA0KPj4gLS0tDQo+PiDCoCB0b29scy94ZW5z
dG9yZS94ZW5zdG9yZWRfY29yZS5jIHwgNTcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMzIgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3Jl
ZF9jb3JlLmMgYi90b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBpbmRleCBl
YzIwYmMwNDJkLi5mYTA3YmMwYzMxIDEwMDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUv
eGVuc3RvcmVkX2NvcmUuYw0KPj4gKysrIGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2Nv
cmUuYw0KPj4gQEAgLTk5NiwyNyArOTk2LDI2IEBAIHN0YXRpYyBpbnQgZXJybm9fZnJvbV9w
YXJlbnRzKHN0cnVjdCBjb25uZWN0aW9uICpjb25uLCANCj4+IGNvbnN0IHZvaWQgKmN0eCwN
Cj4+IMKgwqAgKiBJZiBpdCBmYWlscywgcmV0dXJucyBOVUxMIGFuZCBzZXRzIGVycm5vLg0K
Pj4gwqDCoCAqIFRlbXBvcmFyeSBtZW1vcnkgYWxsb2NhdGlvbnMgYXJlIGRvbmUgd2l0aCBj
dHguDQo+PiDCoMKgICovDQo+PiAtc3RhdGljIHN0cnVjdCBub2RlICpnZXRfbm9kZShzdHJ1
Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb25zdCB2b2lkICpjdHgsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgY29uc3QgY2hhciAqbmFtZSwNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB1bnNpZ25lZCBpbnQgcGVybSkNCj4+ICtzdGF0aWMgYm9vbCBnZXRfbm9kZV9j
aGtfcGVybShzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwgY29uc3Qgdm9pZCAqY3R4LA0KPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IG5vZGUg
Km5vZGUsIGNvbnN0IGNoYXIgKm5hbWUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgcGVybSkNCj4gDQo+IEFzIHlvdSB1c2UgYm9vbCwg
SSBmaW5kIGEgYml0IGNvbmZ1c2luZyB0aGF0ICd0cnVlJyB3b3VsZCBiZSByZXR1cm5lZCBv
biBlcnJvciANCj4gd2hpbGUgJ2ZhbHNlJyBpbmRpY2F0ZSBpdCBpcyBvay4gSSBmZWVsIHRo
ZSBpbnZlcnNlIGlzIG1vcmUgaW50dWl0aXZlLg0KDQpEZXBlbmRzIGhvdyB5b3UgYXJlIGxv
b2tpbmcgYXQgaXQuIE9uIHRoZSBjYWxsZXIgc2lkZSBpdCBpcyBJTU8gbW9yZQ0KaW50dWl0
aXZlIHRoZSBvdGhlciB3YXkgcm91bmQgKGl0IGlzIGEgY29tbW9uIHBhdHRlcm4gZm9yIGZ1
bmN0aW9uIHJldHVybmluZw0KYW4gaW50IHRvIHJldHVybiAwIGluIHRoZSBuby1lcnJvciBj
YXNlKS4NCg0KT1RPSCByZXR1cm5pbmcgInRydWUiIGZvciB0aGUgbm8tZXJyb3IgY2FzZSBz
ZWVtcyB0byBiZSB0aGUgc3RhbmRhcmQgaW4NClhlbnN0b3JlIGZvciByZXR1cm4gdHlwZSBi
b29sLg0KDQo+IEkgY2FuIHVuZGVyc3RhbmQgdGhpcyBpcyBhIG1hdHRlciBvZiB0YXN0ZS4g
U28gdGhlIG9ubHkgdGhpbmcgSSB3b3VsZCBhc2sgaXMgDQo+IGRvY3VtZW50aW5nIHRoaXMg
b2RkaXR5IGFzIEkgY2FuIGZvcmVzZWUgc29tZW9uZSB0aGF0IG1pc2ludGVycHJldGluZyB0
aGUgcmV0dXJuLg0KDQpJJ2xsIHN3aXRjaCBlcnIgdG8gc3VjY2Vzcy4NCg0KDQpKdWVyZ2Vu
DQo=
--------------AAMNeWIOMwOd0my257dVhvFR
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------AAMNeWIOMwOd0my257dVhvFR--

--------------t2DUuHy9uBrmJnZzE1voT670--

--------------407cAlYM55HK0IyqqFlPv12Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTZwCYFAwAAAAAACgkQsN6d1ii/Ey+x
jgf/ZlqPxPt+JHapL9jurYZcE15NqwHehTLnsoeS2sam0KRHbYhTl3nraLudTaJAq4U1POOcOS/a
MNCbmykY3l6lDF0LM87Np89NG4Sllu5938+e87HJYVQ8GONrRK1bzc6rbm2JA8LXFgi4nnIOWdCs
cEsMj3Ls4YBdfruP9DKQ5lmRiCVj2vuEttYxadN3aFca8mPvdHcA0Ocg+lGVuCsDoccXZlHxRQ2c
9D76CItutNnrub2il75ynx0J5jktdUSjgRTd70GVgracWtJwJp4KJb+8fzXJyK3sgYKRZElOTMEM
u022ACZHP7XV9iWsHvNnwp912ZD5/ScifwNLQ8l0qQ==
=wLUL
-----END PGP SIGNATURE-----

--------------407cAlYM55HK0IyqqFlPv12Y--

