Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934C07EAA79
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 07:21:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632131.986169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2mnO-0005Ll-Cb; Tue, 14 Nov 2023 06:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632131.986169; Tue, 14 Nov 2023 06:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2mnO-0005Jx-8J; Tue, 14 Nov 2023 06:21:10 +0000
Received: by outflank-mailman (input) for mailman id 632131;
 Tue, 14 Nov 2023 06:21:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OFhv=G3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1r2mnM-0005Jr-KV
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 06:21:08 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fcc72ee7-82b5-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 07:21:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6EE7C1F889;
 Tue, 14 Nov 2023 06:21:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AA8213460;
 Tue, 14 Nov 2023 06:21:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oN+hEM8RU2UyOgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 14 Nov 2023 06:21:03 +0000
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
X-Inumbo-ID: fcc72ee7-82b5-11ee-98db-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1699942863; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=J+c5G0C03rmnegNz6hYPpWKiMhfaADGJT/j7cFg9zOo=;
	b=fDrBMEcRf+/+1uzZ+U+LcVXeBf8hb/7cMGbXRhDjTuJh9auKZAj89s2zw0becpjtUTTVdm
	0nTj1Zjlo1HrUCXtTtg9SjR7+JQeUTvldVOr2SwCO37WPooQPsiEwXVnyeyCxrwpnPHfYa
	9SBpOnJuExNlVb6kCVn51D+xa2+CsFQ=
Message-ID: <a2c050b2-a920-431c-9345-18070e73a9a8@suse.com>
Date: Tue, 14 Nov 2023 07:21:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/29] tools: add a new xen logging daemon
Content-Language: en-US
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-3-jgross@suse.com>
 <CAKf6xpvOOU04rsuHq=39vDF=i+HQ67ZdejrVxJUju4ud87pT5w@mail.gmail.com>
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
In-Reply-To: <CAKf6xpvOOU04rsuHq=39vDF=i+HQ67ZdejrVxJUju4ud87pT5w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tF2glWORHsatfVEq9dKtL3gU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tF2glWORHsatfVEq9dKtL3gU
Content-Type: multipart/mixed; boundary="------------SwsEsY646L7s8AD0TM6eFf0L";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <a2c050b2-a920-431c-9345-18070e73a9a8@suse.com>
Subject: Re: [PATCH v2 02/29] tools: add a new xen logging daemon
References: <20231110160804.29021-1-jgross@suse.com>
 <20231110160804.29021-3-jgross@suse.com>
 <CAKf6xpvOOU04rsuHq=39vDF=i+HQ67ZdejrVxJUju4ud87pT5w@mail.gmail.com>
In-Reply-To: <CAKf6xpvOOU04rsuHq=39vDF=i+HQ67ZdejrVxJUju4ud87pT5w@mail.gmail.com>

--------------SwsEsY646L7s8AD0TM6eFf0L
Content-Type: multipart/mixed; boundary="------------0HHYAWhVuj87BYeEgC3unkGq"

--------------0HHYAWhVuj87BYeEgC3unkGq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTMuMTEuMjMgMTg6MzYsIEphc29uIEFuZHJ5dWsgd3JvdGU6DQo+IE9uIEZyaSwgTm92
IDEwLCAyMDIzIGF0IDExOjA44oCvQU0gSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuY29t
PiB3cm90ZToNCj4+DQo+PiBBZGQgInhlbi05cGZzZCIsIGEgbmV3IGxvZ2dpbmcgZGFlbW9u
IG1lYW50IHRvIHN1cHBvcnQgaW5mcmFzdHJ1Y3R1cmUNCj4+IGRvbWFpbnMgKGUuZy4geGVu
c3RvcmUtc3R1YmRvbSkgdG8gYWNjZXNzIGZpbGVzIGluIGRvbTAuDQo+Pg0KPj4gRm9yIG5v
dyBvbmx5IGFkZCB0aGUgY29kZSBuZWVkZWQgZm9yIHN0YXJ0aW5nIHRoZSBkYWVtb24gYW5k
DQo+PiByZWdpc3RlcmluZyBpdCB3aXRoIFhlbnN0b3JlIHZpYSBhIG5ldyAibGlieGwveGVu
LTlwZnMvc3RhdGUiIG5vZGUgYnkNCj4+IHdyaXRpbmcgdGhlICJydW5uaW5nIiBzdGF0ZSB0
byBpdC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3Vz
ZS5jb20+DQo+PiAtLS0NCj4gDQo+PiAtLS0gL2Rldi9udWxsDQo+PiArKysgYi90b29scy94
ZW4tOXBmc2QveGVuLTlwZnNkLmMNCj4+IEBAIC0wLDAgKzEsMTQ1IEBADQo+IA0KPj4gKyAq
IFRoZSBiYWNrZW5kIGRldmljZSBzdHJpbmcgaXMgInhlbl85cGZzIiwgdGhlIHRhZyB1c2Vk
IGZvciBtb3VudGluZyB0aGUNCj4+ICsgKiA5cGZzIGRldmljZSBpcyAiWGVuIi4NCj4gDQo+
ICdfJyBpcyBtdWNoIGxlc3MgY29tbW9uIGluIHhlbnN0b3JlIG5vZGUgbmFtZXMgdGhhbiAn
LScuICBJcyB0aGVyZSBhDQo+IHBhcnRpY3VsYXIgcmVhc29uIHlvdSBjaG9zZSAnXyc/ICBJ
IGdlbmVyYWxseSBwcmVmZXIgJy0nLCBidXQgSUlSQyB0aGUNCj4gbGlieGwgaWRsIGNhbid0
IGhhbmRsZSAnLScuICBEaWQgeW91IGhpdCB0aGF0Pw0KDQpZZXMuDQoNCj4gDQo+IFJldmll
d2VkLWJ5OiBKYXNvbiBBbmRyeXVrIDxqYW5kcnl1a0BnbWFpbC5jb20+DQoNClRoYW5rcywN
Cg0KSnVlcmdlbg0K
--------------0HHYAWhVuj87BYeEgC3unkGq
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------0HHYAWhVuj87BYeEgC3unkGq--

--------------SwsEsY646L7s8AD0TM6eFf0L--

--------------tF2glWORHsatfVEq9dKtL3gU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmVTEc8FAwAAAAAACgkQsN6d1ii/Ey9W
fAf/RKgzRhQXrZFA16JOSyigPdNlE7fRdCjVTua818xyOoti/GDMruWDWiYigYeMN+wSkc9C+Soo
K3l1Tuz5sXX01ZohNlGMjlnV6i0XZ0TEt9gSeYQ8Uh4xzmfdFCgEiMab896/szsWauIrzlBSdUDX
ajcGddw3kZHb6qyBIH8vqIICRUFOE/XPk9tB/LTMXdC24M1txU0x18tb7BmiqCsE6tiURZGeCKYM
JP3fpHJuRnUOao+05Gf5xZ4JQ+Yyev+HA2FHVo2AF0QyY1G8qcOJlsNLn7sOjpHIm4fVBgm4Y193
yHCZViBQ5n4amREJrjZ5Oj54vf/oP5ey6HSjyNIaPA==
=q3py
-----END PGP SIGNATURE-----

--------------tF2glWORHsatfVEq9dKtL3gU--

