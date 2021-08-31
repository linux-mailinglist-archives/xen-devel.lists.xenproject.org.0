Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D213FC6F0
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 14:12:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175639.319878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL2c5-0003ZA-Vs; Tue, 31 Aug 2021 12:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175639.319878; Tue, 31 Aug 2021 12:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mL2c5-0003XL-Sa; Tue, 31 Aug 2021 12:11:37 +0000
Received: by outflank-mailman (input) for mailman id 175639;
 Tue, 31 Aug 2021 12:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DmOZ=NW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mL2c4-0003XF-FS
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 12:11:36 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c86eaa3e-8cd0-482b-8a58-408e923d5425;
 Tue, 31 Aug 2021 12:11:35 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7669422207;
 Tue, 31 Aug 2021 12:11:34 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 4E92813A92;
 Tue, 31 Aug 2021 12:11:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 62qoEXYcLmFHFwAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 31 Aug 2021 12:11:34 +0000
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
X-Inumbo-ID: c86eaa3e-8cd0-482b-8a58-408e923d5425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630411894; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R+CH6Q3ND6PnPKtJqyoCLsgEWNqDQCQZu02+HKiuObI=;
	b=WrP46RQLJXSnAQS99xfrrq+4QJAMK2oHhijL9iWQ+oEBQJ+b/phdXyGlAbIICMFLM7YHNx
	K2EgN6XpGG5kwwk0n1VEjspoCm+JQaJGzexxnZDTEVZPIUj5Mf6nhw48RObkA+dOarXgQT
	d+GVUug3/dzICo/oBdlyNtpaYCGqWv4=
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
To: Julien Grall <julien@xen.org>, Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-3-jgross@suse.com>
 <24836.28.655841.510063@mariner.uk.xensource.com>
 <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6ced9858-d425-887c-0045-1aad8521b826@suse.com>
Date: Tue, 31 Aug 2021 14:11:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="HVkL9xdgQoawHeG8fcamFbiAjz0OGcnu6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--HVkL9xdgQoawHeG8fcamFbiAjz0OGcnu6
Content-Type: multipart/mixed; boundary="GRQLmLJrPYqpxtHlOdGF8zNvesGDcTjUd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Message-ID: <6ced9858-d425-887c-0045-1aad8521b826@suse.com>
Subject: Re: [PATCH v3 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
References: <20210730122643.2043-1-jgross@suse.com>
 <20210730122643.2043-3-jgross@suse.com>
 <24836.28.655841.510063@mariner.uk.xensource.com>
 <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>
In-Reply-To: <81a39ab5-5588-65ad-f1a1-7bfe0379b394@xen.org>

--GRQLmLJrPYqpxtHlOdGF8zNvesGDcTjUd
Content-Type: multipart/mixed;
 boundary="------------724E9162CF2512FDF0DA8D0A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------724E9162CF2512FDF0DA8D0A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 30.07.21 19:14, Julien Grall wrote:
> Hi Ian,
>=20
> On 30/07/2021 14:35, Ian Jackson wrote:
>> Juergen Gross writes ("[PATCH v3 2/2] tools/xenstore: set open file=20
>> descriptor limit for xenstored"):
>>> Add a configuration item for the maximum number of domains xenstored
>>> should support and set the limit of open file descriptors accordingly=
=2E
>>>
>>> For HVM domains there are up to 5 socket connections per domain (2 by=

>>> the xl daemon process, and 3 by qemu). So set the ulimit for xenstore=
d
>>> to 5 * XENSTORED_MAX_DOMAINS + 100 (the "+ 100" is for some headroom,=

>>> like logging, event channel device, etc.).
>> ...
>>> +## Type: integer
>>> +## Default: 32768
>>> +#
>>> +# Select maximum number of domains supported by xenstored.
>>> +# Only evaluated if XENSTORETYPE is "daemon".
>>> +#XENSTORED_MAX_N_DOMAINS=3D32768
>>
>> I approve of doing something about the fd limit.=C2=A0 I have some qua=
lms
>> about the documentation.
>>
>> The documentation doesn't say what happens if this limit is exceeded.
>> Also the default of 32758 suggests that we actually support that many
>> domains.=C2=A0 I don't think we do...
>>
>> I didn't find anything in SUPPORT.md about how many guests we support
>> but I wouldn't want this setting here to imply full support for 32768
>> domains.
>>
>> If you don't want to tackle this can of works, maybe add this:
>>
>> =C2=A0=C2=A0 # This just controls some resource limits for xenstored; =
if the
>> =C2=A0=C2=A0 # limit is exceeded, xenstored will stop being able to fu=
nction
>> =C2=A0=C2=A0 # properly for additional guests.=C2=A0 The default value=
 is so large
>> =C2=A0=C2=A0 # that it won't be exceeded in a supported configuration,=
 but
>> =C2=A0=C2=A0 # should not be taken to mean that the whole Xen system i=
s
>> =C2=A0=C2=A0 # guaranteed to work properly with that many guests.
>>
>> Julien, did you ask for this to be made configurable ?=C2=A0 Having wr=
itten
>> the text above, I wonder if it wouldn't just be better to
>> unconditionally set it to "unlimited" rather than offering footgun
>> dressed up like a tuneable...
>=20
> So in v1 (see [1]), Juergen wanted to raise the limit. I assumed this=20
> meant that the default limit (configured by the system may not be enoug=
h).
>=20
> I felt this was wrong to impose an higher limit on everyone when an=20
> admin may know the maximum number of domains.
>=20
> By "unlimited", do you mean the calling "ulimit" (or whatever is used=20
> for configuring FDs) with unlimited?
>=20
> If so, I would be OK with that. My main was was to move the raising the=
=20
> limit outside Xenstored because:
>  =C2=A01) This is easier for an admin to tweak it (in particular the OO=
M)
>  =C2=A02) It feels wrong to me that the daemon chose the limits
>  =C2=A03) An admin can enforce it

Coming back to this series, I'm puzzled now.

Julien, you didn't want me to raise the limit to a specific number
covering the maximum possible number of domains, because you thought
this might result in xenstored hogging huge numbers of file descriptors
in case of a bug. Why is unlimited better then? This will make the
possible number even larger.

I'd really like to know how to come to an acceptable end result soon.
Right now the max number of domains supported by xenstored is just
limited by an arbitrary system wide limit.


Juergen

--------------724E9162CF2512FDF0DA8D0A
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

--------------724E9162CF2512FDF0DA8D0A--

--GRQLmLJrPYqpxtHlOdGF8zNvesGDcTjUd--

--HVkL9xdgQoawHeG8fcamFbiAjz0OGcnu6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEuHHUFAwAAAAAACgkQsN6d1ii/Ey+B
vQf/QTwsV43jbPgT4eOgw4/pnpeGe8/s0JvEHhhXAuSRyqlKnxPRXv2FU+U/sQgfejvaEpU6gC+y
dRSQQyD3768RRaOdmxom1TvZ1pRjLGT/uKXwXkQMeo+P0MBGNou5TFSp3BTQCseagdTwhAdDj6z2
L370sgRaxO0raQoHD0eiPavVoRmOlGzqMNowlyagydpBKX4ADXU6cJv0KZiQJpsvaSxKIT3gANOr
V1UutLoOktsy2pY+nMLNyxQ2Y8YwCR/KgGnJ5xSIezmhGgVjKQSHkCjuAT/7lWtMsJfCtwJNZToI
whghYNbY4PHt0K7ZUcoNcY4/oGISPdST7WKUNPgpNQ==
=jTK0
-----END PGP SIGNATURE-----

--HVkL9xdgQoawHeG8fcamFbiAjz0OGcnu6--

