Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CF84440AD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 12:37:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220846.382266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEZz-0008Nn-78; Wed, 03 Nov 2021 11:37:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220846.382266; Wed, 03 Nov 2021 11:37:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miEZz-0008Lc-42; Wed, 03 Nov 2021 11:37:19 +0000
Received: by outflank-mailman (input) for mailman id 220846;
 Wed, 03 Nov 2021 11:37:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=neJr=PW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1miEZy-0008LS-3H
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 11:37:18 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6531575c-3c9a-11ec-8568-12813bfff9fa;
 Wed, 03 Nov 2021 11:37:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E3F33218C8;
 Wed,  3 Nov 2021 11:37:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9271113DC1;
 Wed,  3 Nov 2021 11:37:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GycgImt0gmHYOAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 03 Nov 2021 11:37:15 +0000
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
X-Inumbo-ID: 6531575c-3c9a-11ec-8568-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635939435; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KFHG0Y+Q9MWogrgrt0kM7aes0CoHqrPN9x7Dnh68/aw=;
	b=a1ftKLMyNi+d9yTXnD0/OBaWKMfW7aNIWAb93VOOzdGTrhM7Dj2Nienr3qHm3iN9bqCb/f
	LagtNVuAvjrgwlrygkI7Tq0V862GeOVmkLOn98hsP9IKSX910giRBYP6pV8NpTEbQ09KD5
	7MPrcExzrFI2ruwaN+U6goLz50kgQxs=
Subject: Re: [PATCH v2 00/15] xen: drop hypercall function tables
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>
References: <20211101152015.28488-1-jgross@suse.com>
 <f9f3aed5-46b3-4eb0-0cb4-1303eb42a454@arm.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <546114dc-5ef5-ab23-0f9a-ad786f1d7bf1@suse.com>
Date: Wed, 3 Nov 2021 12:37:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <f9f3aed5-46b3-4eb0-0cb4-1303eb42a454@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qCT9l1P2i1csPLi7WBWN7kqp57HujzWAE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qCT9l1P2i1csPLi7WBWN7kqp57HujzWAE
Content-Type: multipart/mixed; boundary="u3mGTK0Vx98uPI3iw8LMpETyy7TWFxTQJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>
Message-ID: <546114dc-5ef5-ab23-0f9a-ad786f1d7bf1@suse.com>
Subject: Re: [PATCH v2 00/15] xen: drop hypercall function tables
References: <20211101152015.28488-1-jgross@suse.com>
 <f9f3aed5-46b3-4eb0-0cb4-1303eb42a454@arm.com>
In-Reply-To: <f9f3aed5-46b3-4eb0-0cb4-1303eb42a454@arm.com>

--u3mGTK0Vx98uPI3iw8LMpETyy7TWFxTQJ
Content-Type: multipart/mixed;
 boundary="------------263141B50FD6F987B7A391E7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------263141B50FD6F987B7A391E7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.11.21 12:35, Michal Orzel wrote:
> Hi Juergen,
>=20
> On 01.11.2021 16:20, Juergen Gross wrote:
>> In order to avoid indirect function calls on the hypercall path as
>> much as possible this series is removing the hypercall function tables=

>> and is replacing the hypercall handler calls via the function array
>> by automatically generated call macros.
>>
>> Another by-product of generating the call macros is the automatic
>> generating of the hypercall handler prototypes from the same data base=

>> which is used to generate the macros.
>>
>> This has the additional advantage of using type safe calls of the
>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>> the same prototypes.
>>
>> A very brief performance test (parallel build of the Xen hypervisor
>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>> the performance with the patches applied. The test was performed using=

>> a PV and a PVH guest.
>>
>> Changes in V2:
>> - new patches 6, 14, 15
>> - patch 7: support hypercall priorities for faster code
>> - comments addressed
>=20
> For the ARM part:
> Apart from the issue I found and reported in patch 7/15, the build was =
successful.
> I tested the following basics also successfully:
> -booting a dom0
> -booting domUs
> -networking between guest and dom0 using NAT
> -stressing hypercall xen_version
>=20
> so,
>=20
> Tested-by: Michal Orzel <michal.orzel@arm.com>

Thanks, much appreciated!


Juergen


--------------263141B50FD6F987B7A391E7
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

--------------263141B50FD6F987B7A391E7--

--u3mGTK0Vx98uPI3iw8LMpETyy7TWFxTQJ--

--qCT9l1P2i1csPLi7WBWN7kqp57HujzWAE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGCdGsFAwAAAAAACgkQsN6d1ii/Ey9M
Awf+NV4oRKBdpWKQmVPRA+I5T9eOvrDNllFFz+aFYGGDCrDm37geyVwSAF3SmyF09x5A0r2Iluth
JeHVc9PZB7rZYm22kQhi1xHLPrb+82vkljX/YORTX5cJylTaOCPJgH4gdFJNp8b33RYN2JjqnWQ0
djONCEurwp53myfaBcMTVlxaD7QoKo5onTZujffiFIwXt8t25UFW8Tz5TInzJUU5Lvvzp/hMyvP9
9z2tFjfEg4jKx0yiubvUx558wvw1/ylFitO08hH91uLDa59LCXc82+uIAyr7sjO29Rwfl2hNIXdS
4dpDG/ZQrhi61SqGGh+T0jFgnz8zsGKY/FBgMv3iGA==
=+/LQ
-----END PGP SIGNATURE-----

--qCT9l1P2i1csPLi7WBWN7kqp57HujzWAE--

