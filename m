Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB05577B0DD
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 07:43:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583157.913209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVQLc-0001fi-CY; Mon, 14 Aug 2023 05:42:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583157.913209; Mon, 14 Aug 2023 05:42:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVQLc-0001dY-9v; Mon, 14 Aug 2023 05:42:36 +0000
Received: by outflank-mailman (input) for mailman id 583157;
 Mon, 14 Aug 2023 05:42:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzbS=D7=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qVQLa-0001dK-S3
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 05:42:34 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5bddc72c-3a65-11ee-8613-37d641c3527e;
 Mon, 14 Aug 2023 07:42:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 115AF21996;
 Mon, 14 Aug 2023 05:42:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DA37213357;
 Mon, 14 Aug 2023 05:42:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1YHFM8W+2WR+EgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 14 Aug 2023 05:42:29 +0000
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
X-Inumbo-ID: 5bddc72c-3a65-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1691991750; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K1zGDBnJSZTTfvc1uP/sNsHKFV/lwgtjcpwZuX/KOTs=;
	b=a0M/uaSkOZ0Br+E0DLjem+XHJy+khik2ycy/Xc/gN1VpVDy7Bx2JCUpEe7IC0H5dooQav+
	/noPOE7zOetJPVczNupgkW7iKggvCHNoKGj2OaFn0XJ5hS3vnkf8FJywuJrPRenERG3vIA
	mMMM3BJ/qNgt+7SvYQYd7wnD+ivmEOA=
Message-ID: <7ac310ef-06a6-43a5-93fb-34cbc91bcc06@suse.com>
Date: Mon, 14 Aug 2023 07:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 24/25] tools/xenstore: rework get_node()
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-25-jgross@suse.com>
 <2b73a5f6-0fd1-bf58-569e-f53cabfa7987@xen.org>
Content-Language: en-US
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
In-Reply-To: <2b73a5f6-0fd1-bf58-569e-f53cabfa7987@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kBhEmNu0qRSnBKsSPlsPAnTi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kBhEmNu0qRSnBKsSPlsPAnTi
Content-Type: multipart/mixed; boundary="------------KiU31cn6aFI9ER6Zm6LEyh0H";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <7ac310ef-06a6-43a5-93fb-34cbc91bcc06@suse.com>
Subject: Re: [PATCH v3 24/25] tools/xenstore: rework get_node()
References: <20230724110247.10520-1-jgross@suse.com>
 <20230724110247.10520-25-jgross@suse.com>
 <2b73a5f6-0fd1-bf58-569e-f53cabfa7987@xen.org>
In-Reply-To: <2b73a5f6-0fd1-bf58-569e-f53cabfa7987@xen.org>

--------------KiU31cn6aFI9ER6Zm6LEyh0H
Content-Type: multipart/mixed; boundary="------------mbOjIE0gc094VL5iwcOR4tQV"

--------------mbOjIE0gc094VL5iwcOR4tQV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTIuMDguMjMgMTM6NTYsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDI0LzA3LzIwMjMgMTI6MDIsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSBnZXRfbm9kZV9jYW5vbmljYWxpemVkKCkgaXMgdGhlIG9ubHkgY2FsbGVyIG9mIGdl
dF9ub2RlKCkuDQo+Pg0KPj4gSW4gb3JkZXIgdG8gcHJlcGFyZSBpbnRyb2R1Y2luZyBhIGdl
dF9ub2RlKCkgdmFyaWFudCByZXR1cm5pbmcgYQ0KPj4gcG9pbnRlciB0byBjb25zdCBzdHJ1
Y3Qgbm9kZSwgZG8gdGhlIGZvbGxvd2luZyByZXN0cnVjdHVyaW5nOg0KPj4NCj4+IC0gbW92
ZSB0aGUgY2FsbCBvZiByZWFkX25vZGUoKSBmcm9tIGdldF9ub2RlKCkgaW50bw0KPj4gwqDC
oCBnZXRfbm9kZV9jYW5vbmljYWxpemVkKCkNCj4+DQo+PiAtIHJlbmFtZSBnZXRfbm9kZSgp
IHRvIGdldF9ub2RlX2Noa19wZXJtKCkNCj4+DQo+PiAtIHJlbmFtZSBnZXRfbm9kZV9jYW5v
bmljYWxpemVkKCkgdG8gZ2V0X25vZGUoKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEp1ZXJn
ZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gVjM6DQo+PiAtIG5ldyBw
YXRjaA0KPj4gLS0tDQo+PiDCoCB0b29scy94ZW5zdG9yZS94ZW5zdG9yZWRfY29yZS5jIHwg
NTcgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hh
bmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMzIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL3Rvb2xzL3hlbnN0b3JlL3hlbnN0b3JlZF9jb3JlLmMgYi90b29scy94ZW5zdG9y
ZS94ZW5zdG9yZWRfY29yZS5jDQo+PiBpbmRleCBlYzIwYmMwNDJkLi5mYTA3YmMwYzMxIDEw
MDY0NA0KPj4gLS0tIGEvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gKysr
IGIvdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkX2NvcmUuYw0KPj4gQEAgLTk5NiwyNyArOTk2
LDI2IEBAIHN0YXRpYyBpbnQgZXJybm9fZnJvbV9wYXJlbnRzKHN0cnVjdCBjb25uZWN0aW9u
ICpjb25uLCANCj4+IGNvbnN0IHZvaWQgKmN0eCwNCj4+IMKgwqAgKiBJZiBpdCBmYWlscywg
cmV0dXJucyBOVUxMIGFuZCBzZXRzIGVycm5vLg0KPj4gwqDCoCAqIFRlbXBvcmFyeSBtZW1v
cnkgYWxsb2NhdGlvbnMgYXJlIGRvbmUgd2l0aCBjdHguDQo+PiDCoMKgICovDQo+PiAtc3Rh
dGljIHN0cnVjdCBub2RlICpnZXRfbm9kZShzdHJ1Y3QgY29ubmVjdGlvbiAqY29ubiwNCj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb25zdCB2b2lkICpjdHgsDQo+
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqbmFtZSwN
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQgcGVy
bSkNCj4+ICtzdGF0aWMgYm9vbCBnZXRfbm9kZV9jaGtfcGVybShzdHJ1Y3QgY29ubmVjdGlv
biAqY29ubiwgY29uc3Qgdm9pZCAqY3R4LA0KPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IG5vZGUgKm5vZGUsIGNvbnN0IGNoYXIgKm5hbWUs
DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBpbnQg
cGVybSkNCj4+IMKgIHsNCj4+IC3CoMKgwqAgc3RydWN0IG5vZGUgKm5vZGU7DQo+PiDCoMKg
wqDCoMKgIHN0cnVjdCBub2RlX3Blcm1zIHBlcm1zOw0KPj4gK8KgwqDCoCBib29sIGVyciA9
IGZhbHNlOw0KPj4gLcKgwqDCoCBub2RlID0gcmVhZF9ub2RlKGNvbm4sIGN0eCwgbmFtZSk7
DQo+PiDCoMKgwqDCoMKgIC8qIElmIHdlIGRvbid0IGhhdmUgcGVybWlzc2lvbiwgd2UgZG9u
J3QgaGF2ZSBub2RlLiAqLw0KPj4gwqDCoMKgwqDCoCBpZiAobm9kZSkgew0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIG5vZGVfdG9fbm9kZV9wZXJtcyhub2RlLCAmcGVybXMpOw0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIGlmICgocGVybV9mb3JfY29ubihjb25uLCAmcGVybXMpICYgcGVy
bSkgIT0gcGVybSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJybm8gPSBF
QUNDRVM7DQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBub2RlID0gTlVMTDsNCj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IHRydWU7DQo+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgfQ0KPj4gwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgIC8qIENsZWFuIHVwIGVycm5v
IGlmIHRoZXkgd2VyZW4ndCBzdXBwb3NlZCB0byBrbm93LiAqLw0KPj4gLcKgwqDCoCBpZiAo
IW5vZGUgJiYgIXJlYWRfbm9kZV9jYW5fcHJvcGFnYXRlX2Vycm5vKCkpDQo+PiArwqDCoMKg
IGlmIChlcnIgJiYgIXJlYWRfbm9kZV9jYW5fcHJvcGFnYXRlX2Vycm5vKCkpDQo+IA0KPiBM
b29raW5nIGF0IHRoZSBjYWxsZXIgZm9yIGdldF9ub2RlX2Noa19wZXJtKCksIG5vZGUgY291
bGQgYmUgTlVMTC4gSW4gdGhpcyBjYXNlLCANCj4gZXJyIHdvdWxkIGJlIGZhbHNlLiBTbyB0
aGVyZSBpcyBhIGNoYW5nZSBvZiBiZWhhdmlvciBoZXJlLg0KPiANCj4gSXQgaXMgbm90IGVu
dGlyZWx5IGNsZWFyIHdoeSBpdCBpcyBmaW5lLiBCdXQgaXQgbWlnaHQgYmUgYmV0dGVyIHRv
IGhhdmUgZXJyIA0KPiBlcXVhbHMgdG8gdHJ1ZSB3aGVuIG5vZGUgaXMgTlVMTC4NCg0KWWVz
LCB5b3UgYXJlIHJpZ2h0LiBJJ2xsIHN3aXRjaCB0bzoNCg0KKwlib29sIGVyciA9ICFub2Rl
Ow0KDQoNCkp1ZXJnZW4NCg0K
--------------mbOjIE0gc094VL5iwcOR4tQV
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------mbOjIE0gc094VL5iwcOR4tQV--

--------------KiU31cn6aFI9ER6Zm6LEyh0H--

--------------kBhEmNu0qRSnBKsSPlsPAnTi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTZvsUFAwAAAAAACgkQsN6d1ii/Ey9H
Jwf/cE1ZPSaALZSfo0J4zIdTMlyHPb22t+izOhQ9muavnl8eX+MOhYkuZusPXHRpQ2VJUxaJcmeL
7DPZgDBYT6syAHMI+4Cd0tDiCfSv0/XlqQkGhGtN4YJB4+pTRCOGUNScNcGKUqSpg6PmFJ0zTv1r
5kAEnW7oDsfXXwdODd76NllpgSgtu9otZCnLApcGpIrJuOkRFY7HtLTF/M/ysUB8IDAQhtMWvD1G
r0YSQQsGso90BzBCUXr/PuEl8ZFq9/lgtyQwNTLSTlZbqgZ5ZTvm9jfPhIwmtLR7fIuTipYjM/3K
SCbBPZ23maLllGiyMJaaJudtnM/nnVTUl37l4pmsgw==
=eKlv
-----END PGP SIGNATURE-----

--------------kBhEmNu0qRSnBKsSPlsPAnTi--

