Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3669757126E
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jul 2022 08:47:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.365499.595692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB9fO-0004OY-GY; Tue, 12 Jul 2022 06:46:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 365499.595692; Tue, 12 Jul 2022 06:46:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oB9fO-0004LL-DV; Tue, 12 Jul 2022 06:46:42 +0000
Received: by outflank-mailman (input) for mailman id 365499;
 Tue, 12 Jul 2022 06:46:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AePn=XR=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1oB9fM-0004LF-Tf
 for xen-devel@lists.xenproject.org; Tue, 12 Jul 2022 06:46:40 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61e8413e-01ae-11ed-924f-1f966e50362f;
 Tue, 12 Jul 2022 08:46:39 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C1FB21FFF;
 Tue, 12 Jul 2022 06:46:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2FF6813A94;
 Tue, 12 Jul 2022 06:46:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id d/p8Cs8YzWIzAQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 12 Jul 2022 06:46:39 +0000
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
X-Inumbo-ID: 61e8413e-01ae-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1657608399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6llmww4ReNfnv3TctnPNAp5VowplEtyGScA5o5Kuix4=;
	b=P+Wsb10ZnqXlETzoeOz1lndqv33SGyoRL0PLO6rDqia6XrHcTeTR28zPHOhwBvuGMDfPbG
	EDTleFUHBM63v72/Zn505zLHaaD8GilWQV6dxHXmGW3t4NIin54NX4lZXdcAHwR34oiKgA
	jJx5s7k2h78ocaZ7/6MrC8CRbuIE5XY=
Message-ID: <ed99b8a1-3cc2-e949-d57d-ea6511dc70bb@suse.com>
Date: Tue, 12 Jul 2022 08:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] xen/gntdev: Ignore failure to unmap
 INVALID_GRANT_HANDLE
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20220710230522.1563-1-demi@invisiblethingslab.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <20220710230522.1563-1-demi@invisiblethingslab.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wifTR62gzPVUhQi2UogD5woE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wifTR62gzPVUhQi2UogD5woE
Content-Type: multipart/mixed; boundary="------------kfkGZI8k0UwMZ3vwC43xvL7H";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-ID: <ed99b8a1-3cc2-e949-d57d-ea6511dc70bb@suse.com>
Subject: Re: [PATCH v3] xen/gntdev: Ignore failure to unmap
 INVALID_GRANT_HANDLE
References: <20220710230522.1563-1-demi@invisiblethingslab.com>
In-Reply-To: <20220710230522.1563-1-demi@invisiblethingslab.com>

--------------kfkGZI8k0UwMZ3vwC43xvL7H
Content-Type: multipart/mixed; boundary="------------JEyKwfzYNs6fvV87d2Sbxhbx"

--------------JEyKwfzYNs6fvV87d2Sbxhbx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMTEuMDcuMjIgMDE6MDUsIERlbWkgTWFyaWUgT2Jlbm91ciB3cm90ZToNCj4gVGhlIGVy
cm9yIHBhdGhzIG9mIGdudGRldl9tbWFwKCkgY2FuIGNhbGwgdW5tYXBfZ3JhbnRfcGFnZXMo
KSBldmVuDQo+IHRob3VnaCBub3QgYWxsIG9mIHRoZSBwYWdlcyBoYXZlIGJlZW4gc3VjY2Vz
c2Z1bGx5IG1hcHBlZC4gIFRoaXMgd2lsbA0KPiB0cmlnZ2VyIHRoZSBXQVJOX09OKClzIGlu
IF9fdW5tYXBfZ3JhbnRfcGFnZXNfZG9uZSgpLiAgVGhlIG51bWJlciBvZg0KPiB3YXJuaW5n
cyBjYW4gYmUgdmVyeSBsYXJnZTsgSSBoYXZlIG9ic2VydmVkIHRob3VzYW5kcyBvZiBsaW5l
cyBvZg0KPiB3YXJuaW5ncyBpbiB0aGUgc3lzdGVtZCBqb3VybmFsLg0KPiANCj4gQXZvaWQg
dGhpcyBwcm9ibGVtIGJ5IG9ubHkgd2FybmluZyBvbiB1bm1hcHBpbmcgZmFpbHVyZSBpZiB0
aGUgaGFuZGxlDQo+IGJlaW5nIHVubWFwcGVkIGlzIG5vdCBJTlZBTElEX0dSQU5UX0hBTkRM
RS4gIFRoZSBoYW5kbGUgZmllbGQgb2YgYW55DQo+IHBhZ2UgdGhhdCB3YXMgbm90IHN1Y2Nl
c3NmdWxseSBtYXBwZWQgd2lsbCBiZSBJTlZBTElEX0dSQU5UX0hBTkRMRSwgc28NCj4gdGhp
cyBjYXRjaGVzIGFsbCBjYXNlcyB3aGVyZSB1bm1hcHBpbmcgY2FuIGxlZ2l0aW1hdGVseSBm
YWlsLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYtYnk6IERl
bWkgTWFyaWUgT2Jlbm91ciA8ZGVtaUBpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiBGaXhl
czogZGJlOTdjZmY3ZGQ5ICgieGVuL2dudGRldjogQXZvaWQgYmxvY2tpbmcgaW4gdW5tYXBf
Z3JhbnRfcGFnZXMoKSIpDQoNClB1c2hlZCB0byB4ZW4vdGlwLmdpdCBmb3ItbGludXMtNS4x
OWENCg0KDQpKdWVyZ2VuDQo=
--------------JEyKwfzYNs6fvV87d2Sbxhbx
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

--------------JEyKwfzYNs6fvV87d2Sbxhbx--

--------------kfkGZI8k0UwMZ3vwC43xvL7H--

--------------wifTR62gzPVUhQi2UogD5woE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmLNGM4FAwAAAAAACgkQsN6d1ii/Ey/9
awgAjPkSH4ydXd8sKoSaXVtvu2fheMlVekQO0C1FDPNv6jWjcwDcRW1f3J6eVmn+rgjqKMpG6X9e
UvlI0Oa2WXl/QVL8VXgALpvGN+EZeC3IHQwKcDoHFRyu+dff9wR7SkSNJ1U45sMGg1iXqfxIzFXw
4nTQcU8CoRK5okI8pPHmzmYIQixrikHPFPIZanI7dtH8aIoGHegUMkB4CQ7T4/RDomaKhJ+HxRdB
Ee0poL4AYWDT/Mqj/CnB/HUyPjhXxy6RDV21bcA0Z443z4qzZl2VCZmZ0DLJnsjhKadmF1N2vP91
5VSwaHzlojO0bsnij0D0w9pxMc2lIZtNLu1W1UeL8Q==
=4Fpt
-----END PGP SIGNATURE-----

--------------wifTR62gzPVUhQi2UogD5woE--

