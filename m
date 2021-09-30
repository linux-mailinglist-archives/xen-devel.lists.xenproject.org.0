Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3850341DA38
	for <lists+xen-devel@lfdr.de>; Thu, 30 Sep 2021 14:49:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199918.354255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvVO-0008Rp-55; Thu, 30 Sep 2021 12:49:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199918.354255; Thu, 30 Sep 2021 12:49:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVvVO-0008OZ-21; Thu, 30 Sep 2021 12:49:42 +0000
Received: by outflank-mailman (input) for mailman id 199918;
 Thu, 30 Sep 2021 12:49:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wsc4=OU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mVvVN-0008OT-Av
 for xen-devel@lists.xenproject.org; Thu, 30 Sep 2021 12:49:41 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e000ec55-21ec-11ec-bd4c-12813bfff9fa;
 Thu, 30 Sep 2021 12:49:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 906DC203AF;
 Thu, 30 Sep 2021 12:49:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59EAE13AF5;
 Thu, 30 Sep 2021 12:49:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MS/JFGOyVWEaSQAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 30 Sep 2021 12:49:39 +0000
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
X-Inumbo-ID: e000ec55-21ec-11ec-bd4c-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633006179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eXXM4x1MRCauedXY2Jv1XTDU3b0ITJwPLNKV+xczrqQ=;
	b=KdHv4EqN+hMlURQc9YJDfqDVWCOsP3OyS6YoLepn8C+zm2YYySGPjs49H1ltg5GEMZ5rYg
	cWoozbu15cXsa93apgDsyQoab2QBp0mdv01rLokTxhdOxsG82fjkC1doBvkMktBHRxWOLd
	gqafWi9bhJnudnGR6/Mc/w2BXDFbqUk=
Subject: Re: [PATCH v5] xen-pciback: allow compiling on other archs than x86
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com, julien@xen.org, sstabellini@kernel.org,
 jbeulich@suse.com, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
References: <20210928073501.433559-1-andr2000@gmail.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <3da6887b-6df4-a094-5bd1-50c2d411f83c@suse.com>
Date: Thu, 30 Sep 2021 14:49:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210928073501.433559-1-andr2000@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lUlzfy1G6XsbRc7JKvGWmrqpDhmvSe9Z9"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lUlzfy1G6XsbRc7JKvGWmrqpDhmvSe9Z9
Content-Type: multipart/mixed; boundary="cXsIjVzo514qfTzLwto4Ph6nYxAeADC7t";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Andrushchenko <andr2000@gmail.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: boris.ostrovsky@oracle.com, julien@xen.org, sstabellini@kernel.org,
 jbeulich@suse.com, Oleksandr Andrushchenko
 <oleksandr_andrushchenko@epam.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
Message-ID: <3da6887b-6df4-a094-5bd1-50c2d411f83c@suse.com>
Subject: Re: [PATCH v5] xen-pciback: allow compiling on other archs than x86
References: <20210928073501.433559-1-andr2000@gmail.com>
In-Reply-To: <20210928073501.433559-1-andr2000@gmail.com>

--cXsIjVzo514qfTzLwto4Ph6nYxAeADC7t
Content-Type: multipart/mixed;
 boundary="------------54D70514E388F36FE477B465"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------54D70514E388F36FE477B465
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28.09.21 09:35, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>=20
> Xen-pciback driver was designed to be built for x86 only. But it
> can also be used by other architectures, e.g. Arm.
>=20
> Currently PCI backend implements multiple functionalities at a time,
> such as:
> 1. It is used as a database for assignable PCI devices, e.g. xl
>     pci-assignable-{add|remove|list} manipulates that list. So, wheneve=
r
>     the toolstack needs to know which PCI devices can be passed through=

>     it reads that from the relevant sysfs entries of the pciback.
> 2. It is used to hold the unbound PCI devices list, e.g. when passing
>     through a PCI device it needs to be unbound from the relevant devic=
e
>     driver and bound to pciback (strictly speaking it is not required
>     that the device is bound to pciback, but pciback is again used as a=

>     database of the passed through PCI devices, so we can re-bind the
>     devices back to their original drivers when guest domain shuts down=
)
> 3. Device reset for the devices being passed through
> 4. Para-virtualised use-cases support
>=20
> The para-virtualised part of the driver is not always needed as some
> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-frontend=

> model for PCI device passthrough.
>=20
> For such use-cases make the very first step in splitting the
> xen-pciback driver into two parts: Xen PCI stub and PCI PV backend
> drivers.
>=20
> For that add new configuration options CONFIG_XEN_PCI_STUB and
> CONFIG_XEN_PCIDEV_STUB, so the driver can be limited in its
> functionality, e.g. no support for para-virtualised scenario.
> x86 platform will continue using CONFIG_XEN_PCIDEV_BACKEND for the
> fully featured backend driver.
>=20
> Please note, that CONFIG_XEN_PCIDEV_BACKEND and CONFIG_XEN_PCIDEV_STUB
> are mutually exclusive.
>=20
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.co=
m>
> Signed-off-by: Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen


--------------54D70514E388F36FE477B465
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

--------------54D70514E388F36FE477B465--

--cXsIjVzo514qfTzLwto4Ph6nYxAeADC7t--

--lUlzfy1G6XsbRc7JKvGWmrqpDhmvSe9Z9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFVsmIFAwAAAAAACgkQsN6d1ii/Ey+S
pwgAlPBK8BIl52Q0Iox5w8WmBsuStuEPF/1DwtiVdnKExhIz39cO9Sn/dOA1hNLeLzXoSCWfXpkU
qbQi7zpt/vXePjFuBabqDAsJFBDABfoq7JzeygCI5ml93dCgvCk+XLC3dWQHZ87gGDN68+dnmFpx
hXzu2TtHYFI24jjwGcev3Y37AiUYp+IhkNuAblnfu52bhhmfFxRBtFHPfSeelcs5mXmSTcoh8E2J
W5rr/dnWY15iC141j7Egcc3sPvytKwSMbb3MinO6eILflVHGuvEMMJn2fhQg4VLn3+8EGiCyRCuo
fRCv/ejY3pQg8mGo+LX0iGVjkGfMvY9dWZIMKk6Deg==
=4kLO
-----END PGP SIGNATURE-----

--lUlzfy1G6XsbRc7JKvGWmrqpDhmvSe9Z9--

