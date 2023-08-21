Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA71D78251A
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 10:11:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587353.918704 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY00X-00075c-Lr; Mon, 21 Aug 2023 08:11:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587353.918704; Mon, 21 Aug 2023 08:11:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qY00X-000732-Ib; Mon, 21 Aug 2023 08:11:29 +0000
Received: by outflank-mailman (input) for mailman id 587353;
 Mon, 21 Aug 2023 08:11:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Cwo=EG=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qY00W-00072u-6Y
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 08:11:28 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53813233-3ffa-11ee-8782-cb3800f73035;
 Mon, 21 Aug 2023 10:11:27 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 215BA22997;
 Mon, 21 Aug 2023 08:11:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D288813421;
 Mon, 21 Aug 2023 08:11:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7WcIMi0c42SJMwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 21 Aug 2023 08:11:25 +0000
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
X-Inumbo-ID: 53813233-3ffa-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1692605486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tCId1GaHXcT9cKKQijph+UPDD2Fzx6isInW4IzUjt3Q=;
	b=ZQ8GXENlz957/q+dqUef/ZDnIMb+ji1oIPnMUhMDrK4NrKRvnljaHittNv0VCOIdq4vnnp
	pWj0RsWrqm4K76mIbT2kMC/oFL+b7YXoBE6bhiKW3spJ6+kKjrujwroPthtCyFpvmEFbJ2
	h2UfOCFZlPDcG/VemD4VrHFZzvCATAc=
Message-ID: <715dacd4-df67-4738-bfca-e47dbec98a1b@suse.com>
Date: Mon, 21 Aug 2023 10:11:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] tools/xenstore: move xenstored sources into dedicated
 directory
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20230818140848.20220-1-jgross@suse.com>
 <53982682-c49c-6f3e-87c1-f4bd0ab385ce@citrix.com>
 <e20b26b5-1422-46d1-a03c-54424bc864cd@xen.org>
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
In-Reply-To: <e20b26b5-1422-46d1-a03c-54424bc864cd@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wR4ytxEggznXN2zbLI8qJNqG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wR4ytxEggznXN2zbLI8qJNqG
Content-Type: multipart/mixed; boundary="------------YPgHmc9vYz0FL3MPjrTyWjSb";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <715dacd4-df67-4738-bfca-e47dbec98a1b@suse.com>
Subject: Re: [PATCH v5] tools/xenstore: move xenstored sources into dedicated
 directory
References: <20230818140848.20220-1-jgross@suse.com>
 <53982682-c49c-6f3e-87c1-f4bd0ab385ce@citrix.com>
 <e20b26b5-1422-46d1-a03c-54424bc864cd@xen.org>
In-Reply-To: <e20b26b5-1422-46d1-a03c-54424bc864cd@xen.org>

--------------YPgHmc9vYz0FL3MPjrTyWjSb
Content-Type: multipart/mixed; boundary="------------z5wB5sOBAGjHwTyNoHZqS014"

--------------z5wB5sOBAGjHwTyNoHZqS014
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMjEuMDguMjMgMDk6NTksIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGksDQo+IA0KPiBP
biAxOC8wOC8yMDIzIDE1OjIwLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMTgvMDgv
MjAyMyAzOjA4IHBtLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOg0KPj4+IGRpZmYgLS1naXQgYS8u
Z2l0aWdub3JlIGIvLmdpdGlnbm9yZQ0KPj4+IGluZGV4IGMxYjczYjA5NjguLmM2NDg5YzRl
NzAgMTAwNjQ0DQo+Pj4gLS0tIGEvLmdpdGlnbm9yZQ0KPj4+ICsrKyBiLy5naXRpZ25vcmUN
Cj4+PiBAQCAtMjM3LDIyICsyMzcsMjIgQEAgdG9vbHMveGVubW9uL3hlbnRyYWNlX3NldG1h
c2sNCj4+PiDCoCB0b29scy94ZW5tb24veGVuYmFrZWQNCj4+PiDCoCB0b29scy94ZW5wYWdp
bmcveGVucGFnaW5nDQo+Pj4gwqAgdG9vbHMveGVucG1kL3hlbnBtZA0KPj4+IC10b29scy94
ZW5zdG9yZS94ZW5zdG9yZQ0KPj4+IC10b29scy94ZW5zdG9yZS94ZW5zdG9yZS1jaG1vZA0K
Pj4+IC10b29scy94ZW5zdG9yZS94ZW5zdG9yZS1jb250cm9sDQo+Pj4gLXRvb2xzL3hlbnN0
b3JlL3hlbnN0b3JlLWV4aXN0cw0KPj4+IC10b29scy94ZW5zdG9yZS94ZW5zdG9yZS1saXN0
DQo+Pj4gLXRvb2xzL3hlbnN0b3JlL3hlbnN0b3JlLWxzDQo+Pj4gLXRvb2xzL3hlbnN0b3Jl
L3hlbnN0b3JlLXJlYWQNCj4+PiAtdG9vbHMveGVuc3RvcmUveGVuc3RvcmUtcm0NCj4+PiAt
dG9vbHMveGVuc3RvcmUveGVuc3RvcmUtd2F0Y2gNCj4+PiAtdG9vbHMveGVuc3RvcmUveGVu
c3RvcmUtd3JpdGUNCj4+PiAtdG9vbHMveGVuc3RvcmUveGVuc3RvcmVkDQo+Pj4gK3Rvb2xz
L3hlbnN0b3JlZC94ZW5zdG9yZWQNCj4+PiDCoCB0b29scy94ZW50b3AveGVudG9wDQo+Pj4g
wqAgdG9vbHMveGVudHJhY2UveGVudHJhY2Vfc2V0c2l6ZQ0KPj4+IMKgIHRvb2xzL3hlbnRy
YWNlL3RiY3RsDQo+Pj4gwqAgdG9vbHMveGVudHJhY2UveGVuY3R4DQo+Pj4gwqAgdG9vbHMv
eGVudHJhY2UveGVudHJhY2UNCj4+PiArdG9vbHMveHMtY2xpZW50cy94ZW5zdG9yZQ0KPj4+
ICt0b29scy94cy1jbGllbnRzL3hlbnN0b3JlLWNobW9kDQo+Pj4gK3Rvb2xzL3hzLWNsaWVu
dHMveGVuc3RvcmUtY29udHJvbA0KPj4+ICt0b29scy94cy1jbGllbnRzL3hlbnN0b3JlLWV4
aXN0cw0KPj4+ICt0b29scy94cy1jbGllbnRzL3hlbnN0b3JlLWxpc3QNCj4+PiArdG9vbHMv
eHMtY2xpZW50cy94ZW5zdG9yZS1scw0KPj4+ICt0b29scy94cy1jbGllbnRzL3hlbnN0b3Jl
LXJlYWQNCj4+PiArdG9vbHMveHMtY2xpZW50cy94ZW5zdG9yZS1ybQ0KPj4+ICt0b29scy94
cy1jbGllbnRzL3hlbnN0b3JlLXdhdGNoDQo+Pj4gK3Rvb2xzL3hzLWNsaWVudHMveGVuc3Rv
cmUtd3JpdGUNCj4+PiDCoCB4ZW4vKiovKi5pDQo+Pj4gwqAgeGVuLyoqLyoucw0KPj4+IMKg
IHhlbi8uYmFubmVyDQo+Pg0KPj4gUGxlYXNlIHRha2UgdGhlIG9wcG9ydHVuaXR5IHRvIG1v
dmUgdGhlc2UgaW50byBsb2NhbCAuZ2l0aWdub3JlIGZpbGVzLg0KPj4gT25lIGxlc3MgYXJl
YSBvZiBjaHVybiBpbiBmdXR1cmUgcmVuYW1pbmcuwqAgUHJvYmFibHkgY2FuIGJlIGZpeGVk
IG9uDQo+PiBjb21taXQgYXMgaXRzIG9ubHkgbWVjaGFuaWNhbC4NCj4gSWYgeW91IGVuZCB1
cCB0byB0aGUgYmUgY29tbWl0dGVyIHRoZW4gc3VyZS4gSSB3b3VsZCBwcmVmZXIgbm90IGRv
aW5nIGl0IHdoaWxlIA0KPiBjb21taXR0aW5nLg0KDQpJJ2xsIHNlbmQgYSBWNi4NCg0KDQpK
dWVyZ2VuDQoNCg==
--------------z5wB5sOBAGjHwTyNoHZqS014
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------z5wB5sOBAGjHwTyNoHZqS014--

--------------YPgHmc9vYz0FL3MPjrTyWjSb--

--------------wR4ytxEggznXN2zbLI8qJNqG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmTjHC0FAwAAAAAACgkQsN6d1ii/Ey+u
YAf/eL6TZcBiUFYQeneOVv2d8wgrd1RJwy44RvcszkhYNPCRUb0r7S1BvXWzXV3kzOu6bjfH1xp3
0r/7Ex9qlYXRmiXsHix1O8wMrYH6PqrNKdPjt7Lv8DWh4y0oQLgPnQfb2NdAQH+90KemN26kZu7n
5DWAnwxNjnMfShl0tcxuYffQWbF6bAXKDRR4WBFUXTLMQBLXQHT9vowOVSZwKP1ePUu35YFwPzYV
WM/YI4YhrtvruULzAixmmJwu0LPqa+24RAnaKENXeEjqIB7ZYHBw74qOQzp/9VO4495vMg5CROoJ
D9Pz7H9FKQVgAztTBYvVovIvfokVJ2/+tki17IqwFQ==
=wMTC
-----END PGP SIGNATURE-----

--------------wR4ytxEggznXN2zbLI8qJNqG--

