Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FBD7E9B42
	for <lists+xen-devel@lfdr.de>; Mon, 13 Nov 2023 12:38:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.631542.984941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2VGJ-00039X-Ao; Mon, 13 Nov 2023 11:37:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 631542.984941; Mon, 13 Nov 2023 11:37:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2VGJ-00036m-7s; Mon, 13 Nov 2023 11:37:51 +0000
Received: by outflank-mailman (input) for mailman id 631542;
 Mon, 13 Nov 2023 11:37:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=N+lR=G2=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2VGI-00036g-7O
 for xen-devel@lists.xenproject.org; Mon, 13 Nov 2023 11:37:50 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [2001:67c:2178:6::1c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 126aed4d-8219-11ee-98da-6d05b1d4d9a1;
 Mon, 13 Nov 2023 12:37:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 60FAB218F9;
 Mon, 13 Nov 2023 11:37:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2C0BC13398;
 Mon, 13 Nov 2023 11:37:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rZqiB4kKUmUpTgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Nov 2023 11:37:45 +0000
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
X-Inumbo-ID: 126aed4d-8219-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699875465; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6L0b2yaBstn0MQiPOyAgnpCxsNACouSHvDWe5ozGikY=;
	b=A/7rIkO1hc79+4f38FOqZa1JgITgRKQJSwBsAopwz6MlklpBHY6bsCrZ6ADqF/65ejTQdC
	U/ObjrYHqokOUW3mbevgM4r3kVLBx1T/iYuV6O8OnaWL184/hEfurC+4d33NgQfFlwMeIe
	JHo0ZwbNPOezSKNWq7PVAbWXk8uEco4=
Message-ID: <6da0ea59-7912-4be6-a587-5ac0c63c6d1b@suse.com>
Date: Mon, 13 Nov 2023 12:37:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 24/29] tools/xenstored: split domain_init()
Content-Language: en-US
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-25-jgross@suse.com>
 <b84878ff-59f6-424b-9ca6-89c957d963ee@xen.org>
 <40e96237-f55f-4b30-b4d4-039f381d676e@suse.com>
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
In-Reply-To: <40e96237-f55f-4b30-b4d4-039f381d676e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------65B30C2Jxg0Ypv0tdHiMJc5M"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------65B30C2Jxg0Ypv0tdHiMJc5M
Content-Type: multipart/mixed; boundary="------------w0oBuoXyd51uKM4N09e4X4g3";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <6da0ea59-7912-4be6-a587-5ac0c63c6d1b@suse.com>
Subject: Re: [PATCH v2 24/29] tools/xenstored: split domain_init()
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-25-jgross@suse.com>
 <b84878ff-59f6-424b-9ca6-89c957d963ee@xen.org>
 <40e96237-f55f-4b30-b4d4-039f381d676e@suse.com>
In-Reply-To: <40e96237-f55f-4b30-b4d4-039f381d676e@suse.com>

--------------w0oBuoXyd51uKM4N09e4X4g3
Content-Type: multipart/mixed; boundary="------------Hmoezgqes993JKYBPtMYPbG9"

--------------Hmoezgqes993JKYBPtMYPbG9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjMgMDk6NTgsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+IE9uIDEwLjExLjIz
IDE5OjA1LCBKdWxpZW4gR3JhbGwgd3JvdGU6DQo+PiBIaSBKdWVyZ2VuLA0KPj4NCj4+IE9u
IDEwLzExLzIwMjMgMTY6MDcsIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+Pj4gVG9kYXkgZG9t
YWluX2luaXQoKSBpcyBjYWxsZWQgZWl0aGVyIGp1c3QgYmVmb3JlIGNhbGxpbmcgZG9tMF9p
bml0KCkNCj4+PiBpbiBjYXNlIG5vIGxpdmUgdXBkYXRlIGlzIGJlaW5nIHBlcmZvcm1lZCwg
b3IgaXQgaXMgY2FsbGVkIGFmdGVyDQo+Pj4gcmVhZGluZyB0aGUgZ2xvYmFsIHN0YXRlIGZy
b20gcmVhZF9zdGF0ZV9nbG9iYWwoKSwgYXMgdGhlIGV2ZW50DQo+Pj4gY2hhbm5lbCBmZCBp
cyBuZWVkZWQuDQo+Pj4NCj4+PiBTcGxpdCB1cCBkb21haW5faW5pdCgpIGludG8gYSBwcmVw
YXJhdGlvbiBwYXJ0IHdoaWNoIGNhbiBiZSBjYWxsZWQNCj4+PiB1bmNvbmRpdGlvbmFsbHks
IGFuZCBpbiBhIHBhcnQgc2V0dGluZyB1cCB0aGUgZXZlbnQgY2hhbm5lbCBoYW5kbGUuDQo+
Pg0KPj4gTG9va2luZyBhdCB0aGUgY29kZSwgZG9tYWluX2luaXQoKSBtYXkgbm90IGJlIGNh
bGxlZCBpZiAtRCBpcyBwYXNzZWQgdG8gWGVuLiANCj4+IFdpdGggeW91ciBjaGFuZ2UsIHBh
cnQgb2YgaXQgd291bGQgbm90IGJlIGNhbGxlZCB1bmNvbmRpdGlvbmFsbHkuDQo+Pg0KPj4g
U28gZG9lcyAtRCBhY3R1YWxseSBtYWtlIHNlbnNlPyBEaWQgaXQgYWN0dWFsbHkgd29yayBi
ZWZvcmUgeW91ciBjaGFuZ2U/IA0KPj4gU2hvdWxkIGl0IGJlIHJlbW92ZWQ/DQo+IA0KPiBH
b29kIHBvaW50Lg0KPiANCj4gSSB0aGluayBpdCBzaG91bGQgYmUgcmVtb3ZlZC4gSSBkb24n
dCB0aGluayBpdCBjYW4gd29yayBhdCBhbGwuDQoNCkkgZXZlbiB0aGluayB0aGUgIi1OIiBh
bmQgIi1QIiBzaG91bGQgYmUgcmVtb3ZlZCwgdG9vLg0KDQoiLU4iIGlzbid0IHJlYWxseSBf
dGhhdF8gaGVscGZ1bCB3aGVuIGRvaW5nIHRlc3RzLiBBdHRhY2hpbmcgZ2RiIHRvIHRoZQ0K
cnVubmluZyB4ZW5zdG9yZWQgZGFlbW9uIGlzIGJ5IGZhciBzdXBlcmlvci4gQW5kIGlmIHlv
dSBhcmUgdGVzdGluZyBhbnkNCmNoYW5nZXMgaW4gdGhlIGluaXQgY29kZSB5b3UgY2FuIGVh
c2lseSBwYXRjaCB4ZW5zdG9yZWQgbm90IHRvIGRhZW1vbml6ZS4NCg0KIi1QIiBoYXMgbm8g
cmVhbCBwdXJwb3NlIGF0IGFsbC4gV2h5IHdvdWxkIHdlIHdhbnQgdG8gc2hvdyB0aGUgUElE
LCBpZiB3ZQ0KY2FuIGp1c3QgbG9vayBpbnRvIHRoZSBwaWRmaWxlPw0KDQpUaG91Z2h0cz8N
Cg0KDQpKdWVyZ2VuDQoNCg==
--------------Hmoezgqes993JKYBPtMYPbG9
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------Hmoezgqes993JKYBPtMYPbG9--

--------------w0oBuoXyd51uKM4N09e4X4g3--

--------------65B30C2Jxg0Ypv0tdHiMJc5M
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVSCogFAwAAAAAACgkQsN6d1ii/Ey+Y
MQf7Bn8Tx6hd0xlaI229OtKhRlqkvCa2W7rYIsr/Z0XtUjQLr+KLXtP8NH2U86vk/IVVWlHdMaCh
GG8lEwpkcapE2xr55sfl9f1HRQl7vzFoK74pK8B2phmkUIAgFsayG9tPcX5vz/w90JDERY5wnh4y
es0Q4xP9gJ/qrJcXNRTXUu5EXCndtpjfb11aNkpoZVYCxTH92mcFF99Wqgh//8VNcXO+NoyMKI19
jFe06Xqs+wFCz5O0qyU24BMoUUEFBxUbHxW6YWDGXqqbioY/ESbf4Du2KhNbEKVI0xG0TcT6tNtg
a6HLNzvj3Ou6RHbU6wc0mmgIdCRtYOgv+o1JGUsZ5w==
=NAr4
-----END PGP SIGNATURE-----

--------------65B30C2Jxg0Ypv0tdHiMJc5M--

