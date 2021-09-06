Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F68401763
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 09:59:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179415.325678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9WL-0003y9-RM; Mon, 06 Sep 2021 07:58:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179415.325678; Mon, 06 Sep 2021 07:58:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mN9WL-0003vY-Nu; Mon, 06 Sep 2021 07:58:25 +0000
Received: by outflank-mailman (input) for mailman id 179415;
 Mon, 06 Sep 2021 07:58:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=t7g0=N4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mN9WK-0003vS-7d
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 07:58:24 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 28db596b-d2d7-4fdb-a851-1798376585ed;
 Mon, 06 Sep 2021 07:58:23 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 168C920090;
 Mon,  6 Sep 2021 07:58:22 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id BD3A31332A;
 Mon,  6 Sep 2021 07:58:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id vXixLB3KNWElZQAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 06 Sep 2021 07:58:21 +0000
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
X-Inumbo-ID: 28db596b-d2d7-4fdb-a851-1798376585ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630915102; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Za9VHhRvpXITUKCSZL629zvN/BxLscJdKXjSFiZ2+g=;
	b=SiROr0rslCXdR3AGf61xOFA29IRHYyXipM6FrpCmTeFR6QzuOwuwIj9O6tGyi4w7IdgpQY
	rQUKoV6RQUh034xIePoQ9aFy1OPw1hvpPdV677UUuE1v9rvG9YHepYgMnzSgcJQTs7YNN8
	Hx2rR3JWdu7uFe9jp0mFaE9gyHnmsgs=
Subject: Re: [PATCH] x86: xen: platform-pci-unplug: use pr_err() and pr_warn()
 instead of raw printk()
To: zhaoxiao <long870912@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org
Cc: hpa@zytor.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
References: <20210906075516.15066-1-long870912@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <af68f9f5-3b6e-162f-5624-e398b744a268@suse.com>
Date: Mon, 6 Sep 2021 09:58:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210906075516.15066-1-long870912@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0NiT60Arq9oUmIaGGHFc8tMs0HEluEKwq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0NiT60Arq9oUmIaGGHFc8tMs0HEluEKwq
Content-Type: multipart/mixed; boundary="OnXWnoypXks5k2gkdaUdrAwQMOYsNyAmr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: zhaoxiao <long870912@gmail.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org
Cc: hpa@zytor.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
Message-ID: <af68f9f5-3b6e-162f-5624-e398b744a268@suse.com>
Subject: Re: [PATCH] x86: xen: platform-pci-unplug: use pr_err() and pr_warn()
 instead of raw printk()
References: <20210906075516.15066-1-long870912@gmail.com>
In-Reply-To: <20210906075516.15066-1-long870912@gmail.com>

--OnXWnoypXks5k2gkdaUdrAwQMOYsNyAmr
Content-Type: multipart/mixed;
 boundary="------------6D93742B032AE25FF0D27A00"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6D93742B032AE25FF0D27A00
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.09.21 09:55, zhaoxiao wrote:
> Since we have the nice helpers pr_err() and pr_warn(), use them instead=

> of raw printk().
>=20
> Signed-off-by: zhaoxiao <long870912@gmail.com>

Any reason you are sending this patch again? It has already been applied
through the Xen tree.


Juergen

--------------6D93742B032AE25FF0D27A00
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

--------------6D93742B032AE25FF0D27A00--

--OnXWnoypXks5k2gkdaUdrAwQMOYsNyAmr--

--0NiT60Arq9oUmIaGGHFc8tMs0HEluEKwq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE1yh0FAwAAAAAACgkQsN6d1ii/Ey98
Lwf/QVhNeKbTqGC3/WByP2vXlbyE9+y9YugswvSoksaY4qBNYUsKbey1CU/ZTeZ1rKmzTzKUoh2I
Rq/atOQS41km+txxg1iOdLcKotJ8+HSu1oz72cdi5SYXxPDV6PUBtyIzgcgOAmmyn5fImCMZgLYs
dMSR6W46ffQ4KEE/Es7shi/MgADXR2H5axMyNaQqqdwvfIxrcLV2RLiEnZIYGHXyvO8WvFk8jZo4
xAyAxcOZ+/RNLl+4XtWYX8VpcHRVawzjDIZAP4o12ei77G2mKXJFhlcLfNpmIb6osbrEXvInK/pR
ZIVjJAonB1PpZjTRq0dPqxLAcfa8jI+O1jLoJ/4O5g==
=8ISr
-----END PGP SIGNATURE-----

--0NiT60Arq9oUmIaGGHFc8tMs0HEluEKwq--

