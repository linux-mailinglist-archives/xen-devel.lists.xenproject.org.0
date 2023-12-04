Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFFD802F85
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 11:03:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646728.1009275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5mI-0007Jz-CW; Mon, 04 Dec 2023 10:02:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646728.1009275; Mon, 04 Dec 2023 10:02:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5mI-0007Gh-9F; Mon, 04 Dec 2023 10:02:14 +0000
Received: by outflank-mailman (input) for mailman id 646728;
 Mon, 04 Dec 2023 10:02:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=THDE=HP=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1rA5mG-0007FM-65
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 10:02:12 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 308e17d8-928c-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 11:02:10 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 78C151F898;
 Mon,  4 Dec 2023 10:02:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 47FEC139AA;
 Mon,  4 Dec 2023 10:02:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id oonRD6GjbWWfSwAAD6G6ig
 (envelope-from <jgross@suse.com>); Mon, 04 Dec 2023 10:02:09 +0000
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
X-Inumbo-ID: 308e17d8-928c-11ee-98e5-6d05b1d4d9a1
Message-ID: <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
Date: Mon, 4 Dec 2023 11:02:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
 <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
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
In-Reply-To: <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------axUbdFi8G4sJniSqFRLmMMib"
X-Spam-Level: ***************
X-Spamd-Bar: +++++++++++++++
Authentication-Results: smtp-out2.suse.de;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=suse.com (policy=quarantine);
	spf=fail (smtp-out2.suse.de: domain of jgross@suse.com does not designate 2a07:de40:b281:104:10:150:64:97 as permitted sender) smtp.mailfrom=jgross@suse.com
X-Rspamd-Server: rspamd2
X-Spamd-Result: default: False [15.00 / 50.00];
	 TO_DN_EQ_ADDR_SOME(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 R_SPF_FAIL(1.00)[-all];
	 XM_UA_NO_VERSION(0.01)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 NEURAL_HAM_LONG(-1.00)[-0.997];
	 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
	 HAS_ATTACHMENT(0.00)[];
	 ARC_NA(0.00)[];
	 DMARC_POLICY_QUARANTINE(1.50)[suse.com : No valid SPF, No valid DKIM,quarantine];
	 RCPT_COUNT_FIVE(0.00)[6];
	 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	 RCVD_COUNT_THREE(0.00)[3];
	 MX_GOOD(-0.01)[];
	 MIME_BASE64_TEXT(0.10)[];
	 SIGNED_PGP(-2.00)[];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 R_DKIM_NA(2.20)[];
	 MIME_TRACE(0.00)[0:+,1:+,2:+,3:+,4:~,5:~];
	 RCVD_TLS_ALL(0.00)[];
	 MID_RHS_MATCH_FROM(0.00)[];
	 MIME_UNKNOWN(0.10)[application/pgp-keys]
X-Spam-Score: 15.00
X-Rspamd-Queue-Id: 78C151F898
X-Spam-Flag: YES
X-Spam: Yes

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------axUbdFi8G4sJniSqFRLmMMib
Content-Type: multipart/mixed; boundary="------------a3rNEQbV3fYnvfUnBVduIZ57";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Ren=C3=A9_Winther_H=C3=B8jgaard?= <renewin@proton.me>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <44bbbc6f-607e-4c8c-b4a4-de220345b2b5@suse.com>
Subject: Re: Trying add smt=off disabled cores to cpupool crash xen
References: <ImC5JB7OjNgCNtCixZSzBIyXAyR0qI-DKWcm-w5YtHP_5aH71GA_zJK2C4AmA4_GtaYAKK6wGEM8YZ2THj2qLe9kFhjO5bEl8qoqRY8o9p4=@proton.me>
 <987b03e9-7a16-434a-a060-538dd5a6f045@citrix.com>
 <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>
In-Reply-To: <2e25ea9e-5f38-4363-ae34-cf838d161cc8@suse.com>

--------------a3rNEQbV3fYnvfUnBVduIZ57
Content-Type: multipart/mixed; boundary="------------Fj6kQXg8rMkVq28WK3C0zV2L"

--------------Fj6kQXg8rMkVq28WK3C0zV2L
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDQuMTIuMjMgMTA6MTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4xMi4yMDIz
IDIxOjEyLCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4gT24gMDEvMTIvMjAyMyA3OjU5IHBt
LCBSZW7DqSBXaW50aGVyIEjDuGpnYWFyZCB3cm90ZToNCj4+PiBJZiBJIHNldCBzbXQ9b2Zm
IGFuZCB0cnkgdG8gY29uZmlndXJlIGNwdXBvb2xzIHdpdGggY3JlZGl0KDEpIGFzIGlmDQo+
Pj4gYWxsIGNvcmVzIGFyZSBhdmFpbGFibGUsIEkgZ2V0IHRoZSBmb2xsb3dpbmcgY3Jhc2gu
DQo+Pj4NCj4+PiBUaGUgY3Jhc2ggaGFwcGVucyB3aGVuIEkgdHJ5IHRvIHVzZSB4bCBjcHVw
b29sLWFkZC1jcHUgb24gdGhlIGRpc2FibGVkDQo+Pj4gSFQgc2libGluZyBjb3Jlcy4NCj4+
Pg0KPj4+IEh5cGVyLXRocmVhZGluZyBpcyBlbmFibGVkIGluIHRoZSBmaXJtd2FyZSwgYW5k
IG9ubHkgZGlzYWJsZWQgd2l0aA0KPj4+IHNtdD1vZmYuDQo+Pg0KPj4gQ0MnaW5nIHNvbWUg
bWFpbnRhaW5lcnMuDQo+Pg0KPj4gSSBleHBlY3QgdGhpcyB3aWxsIGFsc28gZXhwbG9kZSB3
aGVuIGEgQ1BVIGlzIHJ1bnRpbWUgb2ZmbGluZWQgd2l0aA0KPj4gYHhlbi1ocHRvb2wgY3B1
LW9mZmxpbmVgIGFuZCB0aGVuIGFkZGVkIHRvIGEgY3B1cG9vbC4NCj4+DQo+PiBJbnRlcmVz
dGluZ2x5LCB0aGUgY3Jhc2ggaXMgbW92ICglcmR4LCVyYXgsMSksJXIxMywgYW5kIEkgdGhp
bmsgdGhhdCdzDQo+PiB0aGUgcGVyY3B1IHBvc2lvbiB2YWx1ZSBpbiAlcmR4Lg0KPj4NCj4+
IEkgZXhwZWN0IGNwdXBvb2xzIHdhbnQgdG8gcmVqZWN0IHBhcmtlZC9vZmZsaW5lIENQVXMu
DQo+IA0KPiBXaGlsZSB0aGUgb25seSBleHBsaWNpdCBjaGVjayB0aGVyZSBpcw0KPiANCj4g
ICAgICAgICAgaWYgKCBjcHUgPj0gbnJfY3B1X2lkcyApDQo+ICAgICAgICAgICAgICBnb3Rv
IGFkZGNwdV9vdXQ7DQo+IA0KPiBJIHdvdWxkIGhhdmUgZXhwZWN0ZWQgdGhpcw0KPiANCj4g
ICAgICAgICAgaWYgKCAhY3B1bWFza19zdWJzZXQoY3B1cywgJmNwdXBvb2xfZnJlZV9jcHVz
KSB8fA0KPiAgICAgICAgICAgICAgIGNwdW1hc2tfaW50ZXJzZWN0cyhjcHVzLCAmY3B1cG9v
bF9sb2NrZWRfY3B1cykgKQ0KPiAgICAgICAgICAgICAgZ290byBhZGRjcHVfb3V0Ow0KPiAN
Cj4gdG8gZGVhbCB3aXRoIHRoZSBzaXR1YXRpb24sIGFzIHBhcmtlZC9vZmZsaW5lIENQVXMg
c2hvdWxkbid0IGJlICJmcmVlIi4NCj4gSsO8cmdlbj8NCg0KVGhlIHByb2JsZW0gaXMgdGhl
IGNhbGwgb2Ygc2NoZWRfZ2V0X29wdF9jcHVtYXNrKCkgdG8gbmVlZCB0aGUgcGVyY3B1IGFy
ZWENCm9mIHRoZSBjcHUgaW4gcXVlc3Rpb24uDQoNCg0KSnVlcmdlbg0K
--------------Fj6kQXg8rMkVq28WK3C0zV2L
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
kt+z4drzFUyEjLM1vVvIMjkUoJs=3D
=3DeeAB
-----END PGP PUBLIC KEY BLOCK-----

--------------Fj6kQXg8rMkVq28WK3C0zV2L--

--------------a3rNEQbV3fYnvfUnBVduIZ57--

--------------axUbdFi8G4sJniSqFRLmMMib
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVto6AFAwAAAAAACgkQsN6d1ii/Ey/r
5gf9G4REmHurVaYJt5fW7mC+GTh79XlmDKQk1FginaTCbWnFYYZVG0ws3yd2ZXTCNPoZmJBU0RZ3
OdN28y54YSFJReprR/EJKuDHMiPCPKOByThaJVoHYCI1/YdxI6LZQ/+AzjIQz7/BGo5eoZEKeaIC
uogRgQJXDR8Nc3xilcHO0/kR8BIhcmpR+Pf5VOCAiOaVXBQUWhrLYJjGgA6hT6T0sVz6OqOpPpNM
bhPZPRyjp+1TNLVpEgAgQOITvSxBn6n38NWzCm6yYvaUxlN0Nh2QD5/oAeVIz58flmhlGnT/J9qs
oMJTIH3FExE9UVxqodGmcHDZwqWJBcXBqlwlPcFfLA==
=AAlR
-----END PGP SIGNATURE-----

--------------axUbdFi8G4sJniSqFRLmMMib--

