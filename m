Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35191557C6A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 15:01:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354971.582379 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MSa-0007nD-Th; Thu, 23 Jun 2022 13:01:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354971.582379; Thu, 23 Jun 2022 13:01:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4MSa-0007kL-Qh; Thu, 23 Jun 2022 13:01:24 +0000
Received: by outflank-mailman (input) for mailman id 354971;
 Thu, 23 Jun 2022 13:01:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j28/=W6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1o4MSa-0007bG-0C
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 13:01:24 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 953fbf30-f2f4-11ec-bd2d-47488cf2e6aa;
 Thu, 23 Jun 2022 15:01:23 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1FC221F919;
 Thu, 23 Jun 2022 13:01:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC33313461;
 Thu, 23 Jun 2022 13:01:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7AR3NCJktGK7GwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Jun 2022 13:01:22 +0000
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
X-Inumbo-ID: 953fbf30-f2f4-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1655989283; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jRAMK4H9VufbaUiYFMKr2eIlefiWX6ewJxyHep4f/XY=;
	b=JTQ7L2mMh2XWT33x8HDuNc4taDE1H0Q0HrXH1Hg3ifuiwzzqJAUhdf/1zmiHD6lEWMj4vJ
	alRFbRvmrT2kbf9vbgWzyWIBotqFv0t4illQ/3AkUpGMh4dCtl8/34OmwOafJmxWuOl6Pu
	NPAIsX84j9BU/84fdyv9tZsFJ77FcLQ=
Message-ID: <c138b4b1-334e-a025-5e9d-b0268a87c09b@suse.com>
Date: Thu, 23 Jun 2022 15:01:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/xen: Add missing VM_DONTEXPAND flag in mmap callback
Content-Language: en-US
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <1652104303-5098-1-git-send-email-olekstysh@gmail.com>
From: Juergen Gross <jgross@suse.com>
In-Reply-To: <1652104303-5098-1-git-send-email-olekstysh@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6DUnQpAN8lflTtrHV0i7OL6y"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6DUnQpAN8lflTtrHV0i7OL6y
Content-Type: multipart/mixed; boundary="------------DCDpdEXNrYQUNz07he00L9Y0";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <c138b4b1-334e-a025-5e9d-b0268a87c09b@suse.com>
Subject: Re: [PATCH] drm/xen: Add missing VM_DONTEXPAND flag in mmap callback
References: <1652104303-5098-1-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1652104303-5098-1-git-send-email-olekstysh@gmail.com>

--------------DCDpdEXNrYQUNz07he00L9Y0
Content-Type: multipart/mixed; boundary="------------pu2M1o1cMI1x7ICNDMtN7tho"

--------------pu2M1o1cMI1x7ICNDMtN7tho
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

T24gMDkuMDUuMjIgMTU6NTEsIE9sZWtzYW5kciBUeXNoY2hlbmtvIHdyb3RlOg0KPiBGcm9t
OiBPbGVrc2FuZHIgVHlzaGNoZW5rbyA8b2xla3NhbmRyX3R5c2hjaGVua29AZXBhbS5jb20+
DQo+IA0KPiBXaXRoIFhlbiBQViBEaXNwbGF5IGRyaXZlciBpbiB1c2UgdGhlICJleHBlY3Rl
ZCIgVk1fRE9OVEVYUEFORCBmbGFnDQo+IGlzIG5vdCBzZXQgKG5laXRoZXIgZXhwbGljaXRs
eSBub3IgaW1wbGljaXRseSksIHNvIHRoZSBkcml2ZXIgaGl0cw0KPiB0aGUgY29kZSBwYXRo
IGluIGRybV9nZW1fbW1hcF9vYmooKSB3aGljaCB0cmlnZ2VycyB0aGUgV0FSTklORy4NCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE9sZWtzYW5kciBUeXNoY2hlbmtvIDxvbGVrc2FuZHJfdHlz
aGNoZW5rb0BlcGFtLmNvbT4NCg0KUHVzaGVkIHRvIHhlbi90aXAuZ2l0IGZvci1saW51cy01
LjE5YQ0KDQoNCkp1ZXJnZW4NCg==
--------------pu2M1o1cMI1x7ICNDMtN7tho
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

--------------pu2M1o1cMI1x7ICNDMtN7tho--

--------------DCDpdEXNrYQUNz07he00L9Y0--

--------------6DUnQpAN8lflTtrHV0i7OL6y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmK0ZCIFAwAAAAAACgkQsN6d1ii/Ey9x
+Af+MQ2D0no/fEtmPq82OAyMEdS1oBH1e+m0aoX9RZ++somCEdLRNKmnpo9k7Y1w1VY/f23u0SQI
u5a6I78CEE7Gn3fB2Wmx9Pk789Q1Qc8A5VnQx6dAC94NUSb5AuZCbZN/7+PNvNejSuZSlTSJ9u3P
TARbOoIPgCEQDpRJbTBpu177JRQ6+lgQVcHdD0y6X3D2tjV3gXqPECOi5b1D7lypPWCdgbcKtCSE
UqFTnmHVOXL7yBgTOx0yHzqLRm6RLe+DABB0iuhqn6yYwEgIpEjoNCLcq5TkDdHgrnlTRMmKVca1
N9qapKkmnUrAJeogRTufVi8UUo429jTZz2rdYZr1IA==
=xBaj
-----END PGP SIGNATURE-----

--------------6DUnQpAN8lflTtrHV0i7OL6y--

