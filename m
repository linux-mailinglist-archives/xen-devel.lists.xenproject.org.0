Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 081993438F0
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 06:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.99988.190325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lODaJ-0006u9-7L; Mon, 22 Mar 2021 05:58:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 99988.190325; Mon, 22 Mar 2021 05:58:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lODaJ-0006tm-43; Mon, 22 Mar 2021 05:58:39 +0000
Received: by outflank-mailman (input) for mailman id 99988;
 Mon, 22 Mar 2021 05:58:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lx7y=IU=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lODaH-0006th-Di
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 05:58:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d5f0792e-f3d3-4ce1-9f5d-a864a789db8d;
 Mon, 22 Mar 2021 05:58:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 302E5AC1F;
 Mon, 22 Mar 2021 05:58:35 +0000 (UTC)
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
X-Inumbo-ID: d5f0792e-f3d3-4ce1-9f5d-a864a789db8d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616392715; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rpfcsvKFLtYwXTwkcaD3SMIT07anvDjM2o1RlVIT5tQ=;
	b=a83pjg1mYWQrab/nZveqt0sAahlov+NEHXk/jorvLIE3o8R4oh0oZqPIA8d80cKrO37GZ3
	82nr32pVBkDB3/3ybYnkLsI2JAB5W627O1uuv2/nPXI2yl29eExydW3feZpmMZx/cz6krA
	yAeIO+L3z6+ftuUNVs4wX2726g9GmEk=
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
To: Leon Romanovsky <leon@kernel.org>, "Hsu, Chiahao" <andyhsu@amazon.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, wei.liu@kernel.org,
 paul@xen.org, davem@davemloft.net, kuba@kernel.org,
 xen-devel@lists.xenproject.org
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch> <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch> <YE3foiFJ4sfiFex2@unreal>
 <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com> <YFI676dumSDJvTlV@unreal>
 <f3b76d9b-7c82-d3bd-7858-9e831198e33c@amazon.com> <YFeAzfJsHAqPvPuY@unreal>
 <12f643b5-7a35-d960-9b1f-22853aea4b4c@amazon.com> <YFgtf6NBPMjD/U89@unreal>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <c7b2a12d-bf81-3d5f-40ae-f70e6cfa1637@suse.com>
Date: Mon, 22 Mar 2021 06:58:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFgtf6NBPMjD/U89@unreal>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GEck0MXAkH1N6s1uP2AhJml1gohEKJuvu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GEck0MXAkH1N6s1uP2AhJml1gohEKJuvu
Content-Type: multipart/mixed; boundary="XUP3wTaC5PcuOZo2Tj6lUqDgZCIZPhCqg";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Leon Romanovsky <leon@kernel.org>, "Hsu, Chiahao" <andyhsu@amazon.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, wei.liu@kernel.org,
 paul@xen.org, davem@davemloft.net, kuba@kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <c7b2a12d-bf81-3d5f-40ae-f70e6cfa1637@suse.com>
Subject: Re: [net-next 1/2] xen-netback: add module parameter to disable
 ctrl-ring
References: <20210311225944.24198-1-andyhsu@amazon.com>
 <YEuAKNyU6Hma39dN@lunn.ch> <ec5baac1-1410-86e4-a0d1-7c7f982a0810@amazon.com>
 <YEvQ6z5WFf+F4mdc@lunn.ch> <YE3foiFJ4sfiFex2@unreal>
 <64f5c7a8-cc09-3a7f-b33b-a64d373aed60@amazon.com> <YFI676dumSDJvTlV@unreal>
 <f3b76d9b-7c82-d3bd-7858-9e831198e33c@amazon.com> <YFeAzfJsHAqPvPuY@unreal>
 <12f643b5-7a35-d960-9b1f-22853aea4b4c@amazon.com> <YFgtf6NBPMjD/U89@unreal>
In-Reply-To: <YFgtf6NBPMjD/U89@unreal>

--XUP3wTaC5PcuOZo2Tj6lUqDgZCIZPhCqg
Content-Type: multipart/mixed;
 boundary="------------E31744AF77CBCB1800D0DE83"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E31744AF77CBCB1800D0DE83
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.03.21 06:39, Leon Romanovsky wrote:
> On Sun, Mar 21, 2021 at 06:54:52PM +0100, Hsu, Chiahao wrote:
>>
>=20
> <...>
>=20
>>>> Typically there should be one VM running netback on each host,
>>>> and having control over what interfaces or features it exposes is al=
so
>>>> important for stability.
>>>> How about we create a 'feature flags' modparam, each bits is specifi=
ed for
>>>> different new features?
>>> At the end, it will be more granular module parameter that user still=

>>> will need to guess.
>> I believe users always need to know any parameter or any tool's flag b=
efore
>> they use it.
>> For example, before user try to set/clear this ctrl_ring_enabled, they=

>> should already have basic knowledge about this feature,
>> or else they shouldn't use it (the default value is same as before), a=
nd
>> that's also why we use the 'ctrl_ring_enabled' as parameter name.
>=20
> It solves only forward migration flow. Move from machine A with no
> option X to machine B with option X. It doesn't work for backward
> flow. Move from machine B to A back will probably break.
>=20
> In your flow, you want that users will set all module parameters for
> every upgrade and keep those parameters differently per-version.

I think the flag should be a per guest config item. Adding this item to
the backend Xenstore nodes for netback to consume it should be rather
easy.

Yes, this would need a change in Xen tools, too, but it is the most
flexible way to handle it. And in case of migration the information
would be just migrated to the new host with the guest's config data.


Juergen

--------------E31744AF77CBCB1800D0DE83
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------E31744AF77CBCB1800D0DE83--

--XUP3wTaC5PcuOZo2Tj6lUqDgZCIZPhCqg--

--GEck0MXAkH1N6s1uP2AhJml1gohEKJuvu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmBYMgoFAwAAAAAACgkQsN6d1ii/Ey+c
BQf+IQ+ho3RQLTWFN65txeg1WgkVlfNNUdCRW2SHljtxWQOhLidl7/zqHCT0gWlO8z+Cv6L5SaYm
gWX1MxOoeqcKi0m42Om8N6uypfWBcsuWj4/Zr0bYr+4l+8l2IjyB884Si6hmd5He4nra8eqVb5y4
d0DuBy4jTt9oNW3oIKF+CoVkCDsy5EfXYO8YtRqXuxGooG1umzjrnvmTcQuqi8pqWI2dynJlDufr
chtN1hlXYi8ON/HAic/dOmRbKtb7en+nhoDTcm3hyQ6bULq2zGwbFI58fcuZroB4JjWP+5IO2JAJ
Bd9Grs8g3bxnS9rBXl8mgs58k4VFx8jCq6yJb4vZYA==
=C3yn
-----END PGP SIGNATURE-----

--GEck0MXAkH1N6s1uP2AhJml1gohEKJuvu--

