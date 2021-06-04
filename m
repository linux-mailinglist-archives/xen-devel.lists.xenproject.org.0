Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 269CF39B39D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 09:11:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136761.253427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp3yS-0005z8-KW; Fri, 04 Jun 2021 07:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136761.253427; Fri, 04 Jun 2021 07:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lp3yS-0005wD-H3; Fri, 04 Jun 2021 07:10:32 +0000
Received: by outflank-mailman (input) for mailman id 136761;
 Fri, 04 Jun 2021 07:10:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x6aI=K6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lp3yR-0005w6-AK
 for xen-devel@lists.xen.org; Fri, 04 Jun 2021 07:10:31 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 378d2af0-c382-4096-9183-40cc292bc29f;
 Fri, 04 Jun 2021 07:10:30 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 29A2C21A10;
 Fri,  4 Jun 2021 07:10:29 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id F390A118DD;
 Fri,  4 Jun 2021 07:10:28 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id VvFCOuTRuWDUNAAALh3uQQ
 (envelope-from <jgross@suse.com>); Fri, 04 Jun 2021 07:10:28 +0000
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
X-Inumbo-ID: 378d2af0-c382-4096-9183-40cc292bc29f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622790629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9EfjWUkQUOb60GN9NSBR3bPAh69zGtr9vLU1ZSX0+M8=;
	b=W4Y9Bz6mi61tKpdcwQr5RgmQ/PRTrSHhgDxDCpJhOn0aG4EX2lYDWsv5ACSlyqKvLXJegS
	EhiGj99sd6xaK6Zpe+4RL/58UBtVOrFj/oOMe2nSTon282/RpzUPbe9Fpjx5S4f0+9pcZU
	YWcmxjxCIsF/7r+4zL08ElJN1imrvYg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622790629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9EfjWUkQUOb60GN9NSBR3bPAh69zGtr9vLU1ZSX0+M8=;
	b=W4Y9Bz6mi61tKpdcwQr5RgmQ/PRTrSHhgDxDCpJhOn0aG4EX2lYDWsv5ACSlyqKvLXJegS
	EhiGj99sd6xaK6Zpe+4RL/58UBtVOrFj/oOMe2nSTon282/RpzUPbe9Fpjx5S4f0+9pcZU
	YWcmxjxCIsF/7r+4zL08ElJN1imrvYg=
To: Jan Beulich <jbeulich@suse.com>, AL13N <alien@rmail.be>
Cc: Xen-devel <xen-devel@lists.xen.org>, "Durrant, Paul" <pdurrant@amazon.com>
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
 <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
 <175befe0e853565761e51f07b79c49cf@mail.rmail.be>
 <552b4348-1c52-ce6b-9001-a144c7147a7c@suse.com>
 <0100caba62175123c63f0df4749a8c88@mail.rmail.be>
 <8a572357-e743-80a6-fed6-3c4999b986ec@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
Message-ID: <23d90cf3-2bc8-f6f6-449d-1741ff4261ec@suse.com>
Date: Fri, 4 Jun 2021 09:10:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <8a572357-e743-80a6-fed6-3c4999b986ec@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2LnsbVJj3UtyLWLg86IVKQM5yc7IXNz6h"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2LnsbVJj3UtyLWLg86IVKQM5yc7IXNz6h
Content-Type: multipart/mixed; boundary="yUIQOeA5GkctKYl9JEe1VlbStF28ZkT2H";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, AL13N <alien@rmail.be>
Cc: Xen-devel <xen-devel@lists.xen.org>, "Durrant, Paul" <pdurrant@amazon.com>
Message-ID: <23d90cf3-2bc8-f6f6-449d-1741ff4261ec@suse.com>
Subject: Re: pci passthrough issue introduced between 4.14.1 and 4.15.0
References: <6ccb04f2d93be6089b049df1f94a91dd@mail.rmail.be>
 <e9a3f7a8-7bf2-4f0a-cc25-d8ce015df1f2@suse.com>
 <a7c0e9b0cdd8f9e709abc329c7f6239c@mail.rmail.be>
 <b5ff15fc-ec3b-6b48-3d15-7de29fa5b2aa@suse.com>
 <175befe0e853565761e51f07b79c49cf@mail.rmail.be>
 <552b4348-1c52-ce6b-9001-a144c7147a7c@suse.com>
 <0100caba62175123c63f0df4749a8c88@mail.rmail.be>
 <8a572357-e743-80a6-fed6-3c4999b986ec@suse.com>
In-Reply-To: <8a572357-e743-80a6-fed6-3c4999b986ec@suse.com>

--yUIQOeA5GkctKYl9JEe1VlbStF28ZkT2H
Content-Type: multipart/mixed;
 boundary="------------F10E9242EBCD1C77246CF79B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F10E9242EBCD1C77246CF79B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 04.06.21 08:56, Jan Beulich wrote:
> On 03.06.2021 18:01, AL13N wrote:
>> Jan Beulich schreef op 2021-06-01 16:53:
>>> On 01.06.2021 16:44, AL13N wrote:
>>>> This mailing list is the correct place for the toolstack too? right?=

>>>
>>> Yes.
>>
>> So, what's the plan to fix this? is the plan to fix the toolstack? or
>> put your patch in kernel to kinda workaround it?
>=20
> The patch has already been put in the kernel, as said. It would be good=

> to know whether it actually has helped your case as well.
>=20
>> Is there a way to make a regression test or unit test or something?
>=20
> Would be nice, but may be a little difficult to arrange for in, say,
> osstest.
>=20
>> Does anyone have an idea on what patch would cause the regression?
>=20
> Not me, but I'm also not a tool stack maintainer (nor expert in any
> way).

There has been a large series by Paul Durrant [1] making heavy
modifications in this area.

Juergen

[1]: https://lists.xen.org/archives/html/xen-devel/2020-11/msg01680.html


--------------F10E9242EBCD1C77246CF79B
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

--------------F10E9242EBCD1C77246CF79B--

--yUIQOeA5GkctKYl9JEe1VlbStF28ZkT2H--

--2LnsbVJj3UtyLWLg86IVKQM5yc7IXNz6h
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC50eQFAwAAAAAACgkQsN6d1ii/Ey8N
AAf/eFWb6WX0BxK8n6rKeo9McCeOhNE3E7IlVXaNBKEyD+iA4tTZdjJIpnlEtkqG/ve2ZRqpmskh
l3wdTHuaWfQx1FH3HfKxRn+zmm6abEC6y+TJUO/5blGuybhtlCrUrdf1NjmbwWVqBfCONrTBVBkU
K7B7/aIxqup8EM63tK76nAXA0HSGixZnvFqZ/OioaXPFVNXXt3pJ+pMLZqDEVZc8eOIkZTwhwa55
CbzhebmWVSDmwNXhXpMrWqC8yZwmV/zBzDWKMmUpBfkGtZoNX4jNXJ1//GL3g2ugm5magujJHqdM
ikLPeTIyt7Fs05eXD9v2qzUerZBIogiWE77W2oaCKg==
=UFJR
-----END PGP SIGNATURE-----

--2LnsbVJj3UtyLWLg86IVKQM5yc7IXNz6h--

