Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 411BC758E1E
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jul 2023 08:50:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.565597.883878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM10S-0002Mq-Ck; Wed, 19 Jul 2023 06:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 565597.883878; Wed, 19 Jul 2023 06:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qM10S-0002KD-9W; Wed, 19 Jul 2023 06:49:52 +0000
Received: by outflank-mailman (input) for mailman id 565597;
 Wed, 19 Jul 2023 06:49:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vyro=DF=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1qM10R-0002K7-Jl
 for xen-devel@lists.xenproject.org; Wed, 19 Jul 2023 06:49:51 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74f45db9-2600-11ee-b23a-6b7b168915f2;
 Wed, 19 Jul 2023 08:49:50 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B28631F8BB;
 Wed, 19 Jul 2023 06:49:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 88F7B1361C;
 Wed, 19 Jul 2023 06:49:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id a+DMH42Ht2RQSQAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 19 Jul 2023 06:49:49 +0000
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
X-Inumbo-ID: 74f45db9-2600-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1689749389; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kEJy0oGHVye6UxthBqVCd1onO3FJYeVO7mdaOLNqlv0=;
	b=VCCeOxNLJi9daI00FmYzO/9oBoTZgOHGlCy09UJDME5761XB3saHk3PhULDQIW/FxLdT86
	C5jPxkDCEt2pRT+S479ycXRijpqGKxnI4t8x8Tx5p2G1cAi1Y8hvyPEP93qrAM/46/bMvx
	ru/vKOfg0Il1xux6+69I0s/PtjpYmYs=
Message-ID: <32cd8b9f-8afa-2cde-3815-82edc7052535@suse.com>
Date: Wed, 19 Jul 2023 08:49:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-19-jgross@suse.com>
 <64ec2fd3-fcec-6ebf-5924-6b591215e19e@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 18/18] tools/xenstore: add nocopy flag to node read
 functions
In-Reply-To: <64ec2fd3-fcec-6ebf-5924-6b591215e19e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------mIJTYrpb9zyUT67yW82sPK7E"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------mIJTYrpb9zyUT67yW82sPK7E
Content-Type: multipart/mixed; boundary="------------rkLr9aeODPwVUkxn26MyCG7P";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <32cd8b9f-8afa-2cde-3815-82edc7052535@suse.com>
Subject: Re: [PATCH v2 18/18] tools/xenstore: add nocopy flag to node read
 functions
References: <20230710065947.4201-1-jgross@suse.com>
 <20230710065947.4201-19-jgross@suse.com>
 <64ec2fd3-fcec-6ebf-5924-6b591215e19e@xen.org>
In-Reply-To: <64ec2fd3-fcec-6ebf-5924-6b591215e19e@xen.org>

--------------rkLr9aeODPwVUkxn26MyCG7P
Content-Type: multipart/mixed; boundary="------------u8KaduSr3UsuuSSALm6LmfCz"

--------------u8KaduSr3UsuuSSALm6LmfCz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTguMDcuMjMgMjM6MzUsIEp1bGllbiBHcmFsbCB3cm90ZToNCj4gSGkgSnVlcmdlbiwN
Cj4gDQo+IE9uIDEwLzA3LzIwMjMgMDc6NTksIEp1ZXJnZW4gR3Jvc3Mgd3JvdGU6DQo+PiBU
b2RheSB3aGVuIHJlYWRpbmcgYSBub2RlIGZyb20gdGhlIGRhdGEgYmFzZSB0aHJvdWdoIHJl
YWRfbm9kZSgpLCB0aGUNCj4+IG5vZGUgZGF0YSBpcyBjb3BpZWQgaW4gb3JkZXIgdG8gYXZv
aWQgbW9kaWZ5aW5nIHRoZSBkYXRhIGJhc2Ugd2hlbg0KPj4gcHJlcGFyaW5nIGEgbm9kZSB1
cGRhdGUsIGFzIG90aGVyd2lzZSBhbiBlcnJvciBtaWdodCByZXN1bHQgaW4gYW4NCj4+IGlu
Y29uc2lzdGVudCBzdGF0ZS4NCj4+DQo+PiBUaGVyZSBhcmUsIGhvd2V2ZXIsIG1hbnkgY2Fz
ZXMgd2hlcmUgc3VjaCBhIGNvcHkgb3BlcmF0aW9uIGlzbid0DQo+PiBuZWVkZWQsIGFzIHRo
ZSBub2RlIGlzbid0IG1vZGlmaWVkLg0KPj4NCj4+IEFkZCBhICJub2NvcHkiIGZsYWcgdG8g
cmVhZF9ub2RlKCkgYW5kIGdldF9ub2RlKigpIGZ1bmN0aW9ucyBmb3IgbWFraW5nDQo+PiB0
aG9zZSBjYXNlcyBsZXNzIG1lbW9yeSBjb25zdW1pbmcgYW5kIG1vcmUgcGVyZm9ybWFudC4N
Cj4gDQo+IFJlZHVjaW5nIG1lbW9yeSBjb25zdW1wdGlvbiBhbmQgaW1wcm92aW5nIHBlcmZv
cm1hbmNlIGlzIGdvb2QuIEhvd2V2ZXIgeW91IGFyZSANCj4gbm93IHJlbHlpbmcgb24gdGhl
IGNhbGxlciB0byBkbyB0aGUgcmlnaHQgdGhpbmcgd2hlbiAnbm9jb3B5JyBpcyB0cnVlLiBJ
IGJlbGlldmUgDQo+IHRoaXMgaXMgYSBkaXNhc3RlciB3YWl0aW5nIHRvIGhhcHBlbi4NCj4g
DQo+IFNvIGFzIGl0IHN0YW5kcywgSSBkb24ndCBzdXBwb3J0IHRoaXMgYXBwcm9hY2guIFRo
ZSBzb2x1dGlvbiBJIGhhdmUgaW4gbWluZCANCj4gd291bGQgcmVxdWlyZSB0aGF0ICdzdHJ1
Y3Qgbm9kZScgaXMgY29uc3QgZm9yIHRoZSAnbm9jb3B5JyBjYXNlLiBJIGFncmVlIHRoaXMg
DQo+IG1lYW5zIG1vcmUgd29yaywgYnV0IHRoYXQncyB0aGUgcHJpY2UgZm9yIHJlZHVjZSB0
aGUgdGhlIHJpc2sgb2YgY29ycnVwdGlvbi4NCg0KRmFpciBlbm91Z2guDQoNCkknbGwgbG9v
ayBpbnRvIHNwbGl0dGluZyByZWFkX25vZGUoKSBpbnRvIGEgZGlyZWN0IHZhcmlhbnQgcmV0
dXJuaW5nIGEgY29uc3QNCnBvaW50ZXIgYW5kIGEgdmFyaWFudCBjb3B5aW5nIHRoZSBkYXRh
LiBTYW1lIHdpbGwgYmUgbmVlZGVkIGZvciBnZXRfbm9kZSooKS4NCg0KPiANCj4+DQo+PiBO
b3RlIHRoYXQgdGhlcmUgaXMgb25lIG1vZGlmaWNhdGlvbiBvZiB0aGUgbm9kZSBkYXRhIGxl
ZnQsIHdoaWNoIGlzIG5vdA0KPj4gcHJvYmxlbWF0aWM6IGRvbWFpbl9hZGp1c3Rfbm9kZV9w
ZXJtcygpIG1pZ2h0IHNldCB0aGUgImlnbm9yZSIgZmxhZyBvZg0KPj4gYSBwZXJtaXNzaW9u
LiBUaGlzIGRvZXMgbm8gaGFybSwgYXMgc3VjaCBhbiB1cGRhdGUgb2YgdGhlIHBlcm1pc3Np
b25zDQo+PiBkb2Vzbid0IG5lZWQgdG8gYmUgdW5kb25lIGluIGNhc2Ugb2YgYSBsYXRlciBw
cm9jZXNzaW5nIGVycm9yLg0KPiBFdmVuIGlmIHRoaXMgaXMgdGhlICJpZ25vcmUiIGZsYWcs
IHRoaXMgaXMgZGVmaW5pdGVseSBub3QgYW4gaWRlYWwgc2l0dWF0aW9uLiANCj4gQW5kLCBB
RkFJQ1QsIHRoaXMgaXMgbm90IGV2ZW4gZG9jdW1lbnQuIEkgZG9uJ3QgdG8gYmUgdGhlIHJl
YWRlciB0cnlpbmcgdG8gDQo+IGZpZ3VyZSBvdXQgd2h5IHJlYWRfbm9kZSgpIGFuZCBkYl9m
ZXRjaCgpIHJldHVybnMgYSBzbGlnaHRseSBkaWZmZXJlbnQgbm9kZSANCj4gY29udGVudCA6
KS4NCg0KU28gd291bGQgeW91IGJlIGZpbmUgd2l0aCB0aGUgYWRkaXRpb24gb2YgYSBjb21t
ZW50IGV4cGxhaW5pbmcgdGhlIHNpdHVhdGlvbj8NCg0KDQpKdWVyZ2VuDQoNCg==
--------------u8KaduSr3UsuuSSALm6LmfCz
Content-Type: application/pgp-keys; name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjri
oyspZKOBycWxw3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2
kaV2KL9650I1SJvedYm8Of8Zd621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i
1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y9bfIhWUiVXEK7MlRgUG6MvIj6Y3Am/B
BLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xqG7/377qptDmrk42GlSK
N4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR3Jvc3Mg
PGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsE
FgIDAQIeAQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4F
UGNQH2lvWAUy+dnyThpwdtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3Tye
vpB0CA3dbBQp0OW0fgCetToGIQrg0MbD1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u
+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbvoPHZ8SlM4KWm8rG+lIkGurq
qu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v5QL+qHI3EIP
tyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVy
Z2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJ
CAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4
RF7HoZhPVPogNVbC4YA6lW7DrWf0teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz7
8X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC/nuAFVGy+67q2DH8As3KPu0344T
BDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0LhITTd9jLzdDad1pQ
SToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLmXBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkM
nQfvUewRz80hSnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMB
AgAjBQJTjHDXAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/
Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJnFOXgMLdBQgBlVPO3/D9R8LtF9DBAFPN
hlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1jnDkfJZr6jrbjgyoZHi
w/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0N51N5Jf
VRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwP
OoE+lotufe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK
/1xMI3/+8jbO0tsn1tqSEUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1
c2UuZGU+wsB5BBMBAgAjBQJTjHDrAhsDBwsJCAcDAgEGFQgCCQoLBBYCAwECHgEC
F4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3g3OZUEBmDHVVbqMtzwlmNC4
k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5dM7wRqzgJpJ
wK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu
5D+jLRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzB
TNh30FVKK1EvmV2xAKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37Io
N1EblHI//x/e2AaIHpzK5h88NEawQsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6
AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpWnHIs98ndPUDpnoxWQugJ6MpMncr
0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZRwgnBC5mVM6JjQ5x
Dk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNVbVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mm
we0icXKLkpEdIXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0I
v3OOImwTEe4co3c1mwARAQABwsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMv
Q/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEwTbe8YFsw2V/Buv6Z4Mysln3nQK5ZadD
534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1vJzQ1fOU8lYFpZXTXIH
b+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8VGiwXvT
yJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqc
suylWsviuGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5B
jR/i1DG86lem3iBDXzXsZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------u8KaduSr3UsuuSSALm6LmfCz--

--------------rkLr9aeODPwVUkxn26MyCG7P--

--------------mIJTYrpb9zyUT67yW82sPK7E
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmS3h4wFAwAAAAAACgkQsN6d1ii/Ey/J
Ygf/ZxG1b1HYxLBNte6YP/fBkHCQPm7dPPJGocgWas2oR5FX5un6Iu5Vt78IWpn5+cSc+IeHtmvG
LgjDj4gpLWR5bTUC2c/aslAuhJRwrosxKNm93gQ8mHab1CY0L5undNW1/eIeX/sY3BuzFV5iBjek
L8DXb6H7TN4QZi5N9ixvaj8r33E5QW9yWIhMcWqRB8RhAXVrHhIbsOWsD/nEQjrEDZw7UBI4Kdy7
8Q50o23MXmVl49f5waRmnoELXBdAbsMhqwraTCjJtG97BVcYLT61p2pOfLAFEZSa5tNCaKHzuD5q
V6qcHIZ2UIPvuubyZAeEGUaAnBlEPmmU8Up7lCUR+w==
=pMq4
-----END PGP SIGNATURE-----

--------------mIJTYrpb9zyUT67yW82sPK7E--

