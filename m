Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0458B41138F
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 13:31:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190786.340579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSHVD-0002ek-Lz; Mon, 20 Sep 2021 11:30:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190786.340579; Mon, 20 Sep 2021 11:30:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSHVD-0002bi-IM; Mon, 20 Sep 2021 11:30:27 +0000
Received: by outflank-mailman (input) for mailman id 190786;
 Mon, 20 Sep 2021 11:30:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSHVB-0002bc-HR
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 11:30:25 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2511c88e-1a06-11ec-b86f-12813bfff9fa;
 Mon, 20 Sep 2021 11:30:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 399572203B;
 Mon, 20 Sep 2021 11:30:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF48913483;
 Mon, 20 Sep 2021 11:30:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id u9HUOM5wSGERDAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Sep 2021 11:30:22 +0000
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
X-Inumbo-ID: 2511c88e-1a06-11ec-b86f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632137423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XdH3uK3BHg3l2ywsZCNDi1CtvO2ZsydRlDR/fOYFywk=;
	b=fdKg0foE439xs4CJHdAKBDgj5zxakX+wtk5gvgxrqCwDra7QezF6VZqgqTntVTC+rq8kdh
	TEXs/EFAxTUmLPSLjFy0ynwL9Z9gSHlzKD3lybjJss4BMKtkedJO+GbC3rJk/vqhSi1+28
	gQxS2hecHkm/6Ghhxi6HB9vhp/ngYvw=
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
Message-ID: <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
Date: Mon, 20 Sep 2021 13:30:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZdyfyBR7MOUm3RfxfGJsHaZA5G1amdYmX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZdyfyBR7MOUm3RfxfGJsHaZA5G1amdYmX
Content-Type: multipart/mixed; boundary="glacxsSpWxu549JB1FOTUbpsSfoGxhXZc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>, "jbeulich@suse.com" <jbeulich@suse.com>,
 Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
Message-ID: <35e2e36a-bade-d801-faa1-c9953678bb9d@suse.com>
Subject: Re: [PATCH] xen-pciback: allow compiling on other archs than x86
References: <20210917130123.1764493-1-andr2000@gmail.com>
 <alpine.DEB.2.21.2109171442070.21985@sstabellini-ThinkPad-T480s>
 <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>
In-Reply-To: <d81486bc-9a2b-8675-ba4d-828d3adc75fc@epam.com>

--glacxsSpWxu549JB1FOTUbpsSfoGxhXZc
Content-Type: multipart/mixed;
 boundary="------------AADA71A647DD592FAA99BF4E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------AADA71A647DD592FAA99BF4E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.09.21 07:23, Oleksandr Andrushchenko wrote:
> Hello, Stefano!
>=20
> On 18.09.21 00:45, Stefano Stabellini wrote:
>> Hi Oleksandr,
>>
>> Why do you want to enable pciback on ARM? Is it only to "disable" a PC=
I
>> device in Dom0 so that it can be safely assigned to a DomU?
> Not only that
>>
>> I am asking because actually I don't think we want to enable the PV PC=
I
>> backend feature of pciback on ARM, right? That would clash with the PC=
I
>> assignment work you have been doing in Xen. They couldn't both work at=

>> the same time.
> Correct, it is not used
>>
>> If we only need pciback to "park" a device in Dom0, wouldn't it be
>> possible and better to use pci-stub instead?
>=20
> Not only that, so pci-stub is not enough
>=20
> The functionality which is implemented by the pciback and the toolstack=

> and which is relevant/missing/needed for ARM:
>=20
> 1. pciback is used as a database for assignable PCI devices, e.g. xl
>   =C2=A0=C2=A0 pci-assignable-{add|remove|list} manipulates that list. =
So, whenever the
>   =C2=A0=C2=A0 toolstack needs to know which PCI devices can be passed =
through it reads
>   =C2=A0=C2=A0 that from the relevant sysfs entries of the pciback.
>=20
> 2. pciback is used to hold the unbound PCI devices, e.g. when passing t=
hrough
>   =C2=A0=C2=A0 a PCI device it needs to be unbound from the relevant de=
vice driver and bound
>   =C2=A0=C2=A0 to pciback (strictly speaking it is not required that th=
e device is bound to
>   =C2=A0=C2=A0 pciback, but pciback is again used as a database of the =
passed through PCI
>   =C2=A0=C2=A0 devices, so we can re-bind the devices back to their ori=
ginal drivers when
>   =C2=A0=C2=A0 guest domain shuts down)
>=20
> 3. Device reset
>=20
> We have previously discussed on xen-devel ML possible solutions to that=
 as from the
> above we see that pciback functionality is going to be only partially u=
sed on Arm.
>=20
> Please see [1] and [2]:
>=20
> 1. It is not acceptable to manage the assignable list in Xen itself
>=20
> 2. pciback can be split into two parts: PCI assignable/bind/reset handl=
ing and
> the rest like vPCI etc.
>=20
> 3. pcifront is not used on Arm

It is neither in x86 PVH/HVM guests.

> So, limited use of the pciback is one of the bricks used to enable PCI =
passthrough
> on Arm. It was enough to just re-structure the driver and have it run o=
n Arm to achieve
> all the goals above.
>=20
> If we still think it is desirable to break the pciback driver into "com=
mon" and "pcifront specific"
> parts then it can be done, yet the patch is going to be the very first =
brick in that building.

Doing this split should be done, as the pcifront specific part could be
omitted on x86, too, in case no PV guests using PCI passthrough have to
be supported.

> So, I think this patch is still going to be needed besides which direct=
ion we take.

Some kind of this patch, yes. It might look different in case the split
is done first.

I don't mind doing it in either sequence.


Juergen

--------------AADA71A647DD592FAA99BF4E
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

--------------AADA71A647DD592FAA99BF4E--

--glacxsSpWxu549JB1FOTUbpsSfoGxhXZc--

--ZdyfyBR7MOUm3RfxfGJsHaZA5G1amdYmX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFIcM4FAwAAAAAACgkQsN6d1ii/Ey/e
mwf+Inhfr1fSRVZZvt2yJsyusaHTDmPCOwkUiIckLA1PW8CGiCkYRH0zlWEb0frVjQy0WaJKqYwa
yJ8cUmGrja3VOHMpxXsIrWoo2ZZoN+ZT68ZWexDF/wuYHBq1bI7xlLzB01+bzoarUcyhKffyiprE
cqTHyAlgqeh7eornHYTDgzm/zyJ9ltaVL/h+wLTwQs8Hxpp/4w7DvgyznySizQan9JWM+WMg98Ej
ScUVm6+1Z6u8nod0OR3miDVhVgkCGYl3gAM0TNdCn2OKOAo/uRCHN9Uldi1mBejI/5RGMHg0v0Kh
+HJYqpkkAXoHDeeaRLExP4Da6lmwdjT5xb6PFHaQiw==
=NFIO
-----END PGP SIGNATURE-----

--ZdyfyBR7MOUm3RfxfGJsHaZA5G1amdYmX--

