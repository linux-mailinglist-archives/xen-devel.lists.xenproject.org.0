Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8567E9873
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 09:58:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631392.984679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Slx-0002UC-KN; Mon, 13 Nov 2023 08:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631392.984679; Mon, 13 Nov 2023 08:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2Slx-0002Ra-H3; Mon, 13 Nov 2023 08:58:21 +0000
Received: by outflank-mailman (input) for mailman id 631392;
 Mon, 13 Nov 2023 08:58:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2Slw-0002RU-62
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 08:58:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c7db8eff-8202-11ee-9b0e-b553b5be7939;
 Mon, 13 Nov 2023 09:58:15 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9DF2218FE;
 Mon, 13 Nov 2023 08:58:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0F3C1358C;
 Mon, 13 Nov 2023 08:58:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id faPMKSXlUWV3fgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 08:58:13 +0000
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
X-Inumbo-ID: c7db8eff-8202-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699865893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Ee37ZcATXMAwvyQ5aei1qWFhSnKB23STgC7t9N0nqq4=;
	b=Lnv8cJNwnyOoDqOB58pwpPj5ZNMghiY7RytlrLGrREoVNKGJfug62+eDZxUD8Ga7+9d4Ox
	GkF2r6Lw+KqE8BMzK4ajcwf/qI4JfEKAwny42RhZsndN/olUdz9DXasZgYupuu+jte6Jst
	hJxk1vz/ZyTtvsp1vKy99+zLLoVokhY=
Message-ID: <40e96237-f55f-4b30-b4d4-039f381d676e@suse.com>
Date: Mon, 13 Nov 2023 09:58:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/29] tools/xenstored: split domain_init()
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-25-jgross@suse.com>
 <b84878ff-59f6-424b-9ca6-89c957d963ee@xen.org>
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
In-Reply-To: <b84878ff-59f6-424b-9ca6-89c957d963ee@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RX0IIhdXPnfTKYHYsYkSvI0f"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------RX0IIhdXPnfTKYHYsYkSvI0f
Content-Type: multipart/mixed; boundary="------------NAWNsIN1BMaL8BsGpcjTi7Tw";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <40e96237-f55f-4b30-b4d4-039f381d676e@suse.com>
Subject: Re: [PATCH v2 24/29] tools/xenstored: split domain_init()
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-25-jgross@suse.com>
 <b84878ff-59f6-424b-9ca6-89c957d963ee@xen.org>
In-Reply-To: <b84878ff-59f6-424b-9ca6-89c957d963ee@xen.org>

--------------NAWNsIN1BMaL8BsGpcjTi7Tw
Content-Type: multipart/mixed; boundary="------------2G02c7K4OWKmEgBmvvM9siWl"

--------------2G02c7K4OWKmEgBmvvM9siWl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTAuMTEuMjMgMTk6MDUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzExLzIwMjMgMTY6MDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSBkb21haW5faW5pdCgpIGlzIGNhbGxlZCBlaXRoZXIganVzdCBiZWZvcmUgY2FsbGlu
ZyBkb20wX2luaXQoKQ0KPj4gaW4gY2FzZSBubyBsaXZlIHVwZGF0ZSBpcyBiZWluZyBwZXJm
b3JtZWQsIG9yIGl0IGlzIGNhbGxlZCBhZnRlcg0KPj4gcmVhZGluZyB0aGUgZ2xvYmFsIHN0
YXRlIGZyb20gcmVhZF9zdGF0ZV9nbG9iYWwoKSwgYXMgdGhlIGV2ZW50DQo+PiBjaGFubmVs
IGZkIGlzIG5lZWRlZC4NCj4+DQo+PiBTcGxpdCB1cCBkb21haW5faW5pdCgpIGludG8gYSBw
cmVwYXJhdGlvbiBwYXJ0IHdoaWNoIGNhbiBiZSBjYWxsZWQNCj4+IHVuY29uZGl0aW9uYWxs
eSwgYW5kIGluIGEgcGFydCBzZXR0aW5nIHVwIHRoZSBldmVudCBjaGFubmVsIGhhbmRsZS4N
Cj4gDQo+IExvb2tpbmcgYXQgdGhlIGNvZGUsIGRvbWFpbl9pbml0KCkgbWF5IG5vdCBiZSBj
YWxsZWQgaWYgLUQgaXMgcGFzc2VkIHRvIFhlbi4gDQo+IFdpdGggeW91ciBjaGFuZ2UsIHBh
cnQgb2YgaXQgd291bGQgbm90IGJlIGNhbGxlZCB1bmNvbmRpdGlvbmFsbHkuDQo+IA0KPiBT
byBkb2VzIC1EIGFjdHVhbGx5IG1ha2Ugc2Vuc2U/IERpZCBpdCBhY3R1YWxseSB3b3JrIGJl
Zm9yZSB5b3VyIGNoYW5nZT8gU2hvdWxkIA0KPiBpdCBiZSByZW1vdmVkPw0KDQpHb29kIHBv
aW50Lg0KDQpJIHRoaW5rIGl0IHNob3VsZCBiZSByZW1vdmVkLiBJIGRvbid0IHRoaW5rIGl0
IGNhbiB3b3JrIGF0IGFsbC4NCg0KPiANCj4+DQo+PiBOb3RlIHRoYXQgdGhlcmUgaXMgbm8g
Y2hhbmNlIHRoYXQgY2hrX2RvbWFpbl9nZW5lcmF0aW9uKCkgY2FuIGJlDQo+PiBjYWxsZWQg
bm93IGJlZm9yZSB4Y19oYW5kbGUgaGFzIGJlZW4gc2V0dXAsIHNvIHRoZXJlIGlzIG5vIG5l
ZWQgZm9yDQo+PiB0aGUgcmVsYXRlZCBzcGVjaWFsIGNhc2UgYW55bW9yZS4NCj4+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+PiAtLS0N
Cj4+IMKgIHRvb2xzL3hlbnN0b3JlZC9jb3JlLmPCoMKgIHzCoCAyICsrDQo+PiDCoCB0b29s
cy94ZW5zdG9yZWQvZG9tYWluLmMgfCAxMiArKysrKystLS0tLS0NCj4+IMKgIHRvb2xzL3hl
bnN0b3JlZC9kb21haW4uaCB8wqAgMSArDQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDkgaW5z
ZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvdG9vbHMv
eGVuc3RvcmVkL2NvcmUuYyBiL3Rvb2xzL3hlbnN0b3JlZC9jb3JlLmMNCj4+IGluZGV4IDhl
MjcxZTMxZjkuLmI5ZWM1MGIzNGMgMTAwNjQ0DQo+PiAtLS0gYS90b29scy94ZW5zdG9yZWQv
Y29yZS5jDQo+PiArKysgYi90b29scy94ZW5zdG9yZWQvY29yZS5jDQo+PiBAQCAtMjk2MCw2
ICsyOTYwLDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkNCj4+IMKgwqDC
oMKgwqAgaW5pdF9waXBlKHJlb3Blbl9sb2dfcGlwZSk7DQo+PiArwqDCoMKgIGRvbWFpbl9z
dGF0aWNfaW5pdCgpOw0KPiANCj4gTklUOiBJIGZpbmQgJ3N0YXRpYycgYSBiaXQgY29uZnVz
aW5nLiBIb3cgYWJvdXQgdXNpbmcgJ2Vhcmx5JyBpbnN0ZWFkIHRvIG1hdGNoIA0KPiAnZWFy
bHlfaW5pdCgpJz8NCg0KWWVzLCBnb29kIGlkZWEuIEkgd2Fzbid0IHZlcnkgaGFwcHkgd2l0
aCB0aGUgbmFtZSBlaXRoZXIuDQoNCg0KSnVlcmdlbg0K
--------------2G02c7K4OWKmEgBmvvM9siWl
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------2G02c7K4OWKmEgBmvvM9siWl--

--------------NAWNsIN1BMaL8BsGpcjTi7Tw--

--------------RX0IIhdXPnfTKYHYsYkSvI0f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVR5SUFAwAAAAAACgkQsN6d1ii/Ey9X
Vwf7BGEMbFYpwtv5wY0pyFUMzhfeC0fsCZlecFCXuNMvg71Cphr+JYJvUVnLGbElRGW0hQsoNoKq
etH50JgY7oxmorrIhjqk3vtAAqkXHw2kZUeXSQ0dzfsujRmg89Cw582SFA8c9iGXeRgpTO84cRyr
qtyM+7w7r7FICmnUMIrukF/o9Cgvqmw9kTaceeFeflSKs/CWoGHMwPLz05JYpquWP20PAZVJM1Mh
v6V/hRpPyTZb2ab6KtrbCOiiIYv7NqKAqeUYmzNJ4kaZWtJ63dgYVoYjHV95angfw9CS0phGvay0
ZONixHwUmVKQOJnFV2+hJqC/DDJO1uKfxDGHdeVbFA==
=Q2fe
-----END PGP SIGNATURE-----

--------------RX0IIhdXPnfTKYHYsYkSvI0f--

