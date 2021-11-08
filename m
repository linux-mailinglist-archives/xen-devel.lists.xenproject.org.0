Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D243B4499A1
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 17:25:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223521.386280 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk7S2-0005Bo-6A; Mon, 08 Nov 2021 16:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223521.386280; Mon, 08 Nov 2021 16:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk7S2-00059v-2w; Mon, 08 Nov 2021 16:24:54 +0000
Received: by outflank-mailman (input) for mailman id 223521;
 Mon, 08 Nov 2021 16:24:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NS6W=P3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mk7S1-00059S-EW
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 16:24:53 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66a5ccee-40b0-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 17:24:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id F26C3218D6;
 Mon,  8 Nov 2021 16:24:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AF2EE13BC0;
 Mon,  8 Nov 2021 16:24:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hlFxKVNPiWFYZgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 Nov 2021 16:24:51 +0000
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
X-Inumbo-ID: 66a5ccee-40b0-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636388692; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U0zZLb0HvWCCao8EJ+NqyQpxoV5ZQgJvH2DC+c9bMtc=;
	b=Hgw5zelZjDq3KEJewEqjIBsIxED3LinUp/1sAUEmEnl/90dFCHLb9H7AmBhvKa3tQsiiK5
	PiH17LAUQoP6VhDx1DDdEDMN5uwH8Ci9rFJD74358khYtC5RJ3xK98JKkgtvzamgOOTAFI
	aheOFYAE6jYdqLEiUyxZtm+2K308+8E=
Subject: Re: [PATCH] xen/balloon: fix unused-variable warning
To: Arnd Bergmann <arnd@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stefano Stabellini
 <sstabellini@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
References: <20211108111408.3940366-1-arnd@kernel.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4d0f02ec-4a36-34f1-3bfd-3f4758c4eea3@suse.com>
Date: Mon, 8 Nov 2021 17:24:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211108111408.3940366-1-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SkVOgLpshoD9dlISz1HVW9prGmzrAK94T"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SkVOgLpshoD9dlISz1HVW9prGmzrAK94T
Content-Type: multipart/mixed; boundary="BAODkXB4N8PiE6nyzjEthqTiehs8bjioQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Arnd Bergmann <arnd@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Stefano Stabellini
 <sstabellini@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Message-ID: <4d0f02ec-4a36-34f1-3bfd-3f4758c4eea3@suse.com>
Subject: Re: [PATCH] xen/balloon: fix unused-variable warning
References: <20211108111408.3940366-1-arnd@kernel.org>
In-Reply-To: <20211108111408.3940366-1-arnd@kernel.org>

--BAODkXB4N8PiE6nyzjEthqTiehs8bjioQ
Content-Type: multipart/mixed;
 boundary="------------ADE257E85A8FD6F18CF3FC67"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------ADE257E85A8FD6F18CF3FC67
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.11.21 12:14, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> In configurations with CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dn
> and CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy, gcc warns about an
> unused variable:
>=20
> drivers/xen/balloon.c:83:12: error: 'xen_hotplug_unpopulated' defined b=
ut not used [-Werror=3Dunused-variable]
>=20
> Since this is always zero when CONFIG_XEN_BALLOON_MEMORY_HOTPLUG
> is disabled, turn it into a preprocessor constant in that case.
>=20
> Fixes: 121f2faca2c0 ("xen/balloon: rename alloc/free_xenballooned_pages=
")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


--------------ADE257E85A8FD6F18CF3FC67
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
Content-Disposition: attachment;
 filename="OpenPGP_0xB0DE9DD628BF132F.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFOMcBYBCACgGjqjoGvbEouQZw/ToiBg9W98AlM2QHV+iNHsEs7kxWhKMjrioyspZKOBy=
cWx
w3ie3j9uvg9EOB3aN4xiTv4qbnGiTr3oJhkB1gsb6ToJQZ8uxGq2kaV2KL9650I1SJvedYm8O=
f8Z
d621lSmoKOwlNClALZNew72NjJLEzTalU1OdT7/i1TXkH09XSSI8mEQ/ouNcMvIJNwQpd369y=
9bf
IhWUiVXEK7MlRgUG6MvIj6Y3Am/BBLUVbDa4+gmzDC9ezlZkTZG2t14zWPvxXP3FAp2pkW0xq=
G7/
377qptDmrk42GlSKN4z76ELnLxussxc7I2hx18NUcbP8+uty4bMxABEBAAHNHEp1ZXJnZW4gR=
3Jv
c3MgPGpnQHBmdXBmLm5ldD7CwHkEEwECACMFAlOMcBYCGwMHCwkIBwMCAQYVCAIJCgsEFgIDA=
QIe
AQIXgAAKCRCw3p3WKL8TL0KdB/93FcIZ3GCNwFU0u3EjNbNjmXBKDY4FUGNQH2lvWAUy+dnyT=
hpw
dtF/jQ6j9RwE8VP0+NXcYpGJDWlNb9/JmYqLiX2Q3TyevpB0CA3dbBQp0OW0fgCetToGIQrg0=
MbD
1C/sEOv8Mr4NAfbauXjZlvTj30H2jO0u+6WGM6nHwbh2l5O8ZiHkH32iaSTfN7Eu5RnNVUJbv=
oPH
Z8SlM4KWm8rG+lIkGurqqu5gu8q8ZMKdsdGC4bBxdQKDKHEFExLJK/nRPFmAuGlId1E3fe10v=
5QL
+qHI3EIPtyfE7i9Hz6rVwi7lWKgh7pe0ZvatAudZ+JNIlBKptb64FaiIOAWDCx1SzR9KdWVyZ=
2Vu
IEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+wsB5BBMBAgAjBQJTjHCvAhsDBwsJCAcDAgEGFQgCC=
QoL
BBYCAwECHgECF4AACgkQsN6d1ii/Ey/HmQf/RtI7kv5A2PS4RF7HoZhPVPogNVbC4YA6lW7Dr=
Wf0
teC0RR3MzXfy6pJ+7KLgkqMlrAbN/8Dvjoz78X+5vhH/rDLa9BuZQlhFmvcGtCF8eR0T1v0nC=
/nu
AFVGy+67q2DH8As3KPu0344TBDpAvr2uYM4tSqxK4DURx5INz4ZZ0WNFHcqsfvlGJALDeE0Lh=
ITT
d9jLzdDad1pQSToCnLl6SBJZjDOX9QQcyUigZFtCXFst4dlsvddrxyqT1f17+2cFSdu7+ynLm=
XBK
7abQ3rwJY8SbRO2iRulogc5vr/RLMMlscDAiDkaFQWLoqHHOdfO9rURssHNN8WkMnQfvUewRz=
80h
SnVlcmdlbiBHcm9zcyA8amdyb3NzQG5vdmVsbC5jb20+wsB5BBMBAgAjBQJTjHDXAhsDBwsJC=
AcD
AgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey8PUQf/ehmgCI9jB9hlgexLvgOtf7PJn=
FOX
gMLdBQgBlVPO3/D9R8LtF9DBAFPNhlrsfIG/SqICoRCqUcJ96Pn3P7UUinFG/I0ECGF4EvTE1=
jnD
kfJZr6jrbjgyoZHiw/4BNwSTL9rWASyLgqlA8u1mf+c2yUwcGhgkRAd1gOwungxcwzwqgljf0=
N51
N5JfVRHRtyfwq/ge+YEkDGcTU6Y0sPOuj4Dyfm8fJzdfHNQsWq3PnczLVELStJNdapwPOoE+l=
otu
fe3AM2vAEYJ9rTz3Cki4JFUsgLkHFqGZarrPGi1eyQcXeluldO3m91NK/1xMI3/+8jbO0tsn1=
tqS
EUGIJi7ox80eSnVlcmdlbiBHcm9zcyA8amdyb3NzQHN1c2UuZGU+wsB5BBMBAgAjBQJTjHDrA=
hsD
BwsJCAcDAgEGFQgCCQoLBBYCAwECHgECF4AACgkQsN6d1ii/Ey+LhQf9GL45eU5vOowA2u5N3=
g3O
ZUEBmDHVVbqMtzwlmNC4k9Kx39r5s2vcFl4tXqW7g9/ViXYuiDXb0RfUpZiIUW89siKrkzmQ5=
dM7
wRqzgJpJwK8Bn2MIxAKArekWpiCKvBOB/Cc+3EXE78XdlxLyOi/NrmSGRIov0karw2RzMNOu5=
D+j
LRZQd1Sv27AR+IP3I8U4aqnhLpwhK7MEy9oCILlgZ1QZe49kpcumcZKORmzBTNh30FVKK1Evm=
V2x
AKDoaEOgQB4iFQLhJCdP1I5aSgM5IVFdn7v5YgEYuJYx37IoN1EblHI//x/e2AaIHpzK5h88N=
Eaw
QsaNRpNSrcfbFmAg987ATQRTjHAWAQgAyzH6AOODMBjgfWE9VeCgsrwH3exNAU32gLq2xvjpW=
nHI
s98ndPUDpnoxWQugJ6MpMncr0xSwFmHEgnSEjK/PAjppgmyc57BwKII3sV4on+gDVFJR6Y8ZR=
wgn
BC5mVM6JjQ5xDk8WRXljExRfUX9pNhdE5eBOZJrDRoLUmmjDtKzWaDhIg/+1Hzz93X4fCQkNV=
bVF
LELU9bMaLPBG/x5q4iYZ2k2ex6d47YE1ZFdMm6YBYMOljGkZKwYde5ldM9mo45mmwe0icXKLk=
pEd
IXKTZeKDO+Hdv1aqFuAcccTg9RXDQjmwhC3yEmrmcfl0+rPghO0Iv3OOImwTEe4co3c1mwARA=
QAB
wsBfBBgBAgAJBQJTjHAWAhsMAAoJELDendYovxMvQ/gH/1ha96vm4P/L+bQpJwrZ/dneZcmEw=
Tbe
8YFsw2V/Buv6Z4Mysln3nQK5ZadD534CF7TDVft7fC4tU4PONxF5D+/tvgkPfDAfF77zy2AH1=
vJz
Q1fOU8lYFpZXTXIHb+559UqvIB8AdgR3SAJGHHt4RKA0F7f5ipYBBrC6cyXJyyoprT10EMvU8=
VGi
wXvTyJz3fjoYsdFzpWPlJEBRMedCot60g5dmbdrZ5DWClAr0yau47zpWj3enf1tLWaqcsuylW=
svi
uGjKGw7KHQd3bxALOknAp4dN3QwBYCKuZ7AddY9yjynVaD5X7nF9nO5BjR/i1DG86lem3iBDX=
zXs
ZDn8R38=3D
=3D2wuH
-----END PGP PUBLIC KEY BLOCK-----

--------------ADE257E85A8FD6F18CF3FC67--

--BAODkXB4N8PiE6nyzjEthqTiehs8bjioQ--

--SkVOgLpshoD9dlISz1HVW9prGmzrAK94T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGJT1MFAwAAAAAACgkQsN6d1ii/Ey+2
SQf/VATQhAPufmxQQXGhnOvti0OPrb2Cca3DVfFUY5yRow3hAD27XrRY3SU7Rvh7mlBM5GUQArDm
xzU4wO4GMdR7ljzRWKGg+5fllW9ZdkNTxFRTAf8cD+DArmhaIoCQ7c7/vrOD9H5q8ojJqjfc+Z2s
UqH0nbZwrbvuSDWKgC15xdT1q7Ip/XAeRVXPwdaRRqZR0HvOjxWvRNaQ7UMZGgDsAt6xIB5XkQ67
+BezorBLASwp+iX/yb48xs595GXqZ/PVKPu/29zCBn+6GM2Qgs0JvwabaovuGUJO/Cot8/bB5y9m
FJrQ2n8yrogHyp+/ZuJagEOH1V+pJccKvcIvsS6gGg==
=JrLZ
-----END PGP SIGNATURE-----

--SkVOgLpshoD9dlISz1HVW9prGmzrAK94T--

