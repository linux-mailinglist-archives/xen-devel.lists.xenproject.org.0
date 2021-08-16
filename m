Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 869CC3ECE1A
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 07:39:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167125.305057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVKi-00018j-Cj; Mon, 16 Aug 2021 05:38:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167125.305057; Mon, 16 Aug 2021 05:38:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFVKi-00016r-9h; Mon, 16 Aug 2021 05:38:48 +0000
Received: by outflank-mailman (input) for mailman id 167125;
 Mon, 16 Aug 2021 05:38:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Usjg=NH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mFVKg-00016l-SP
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 05:38:46 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 217dc736-47e6-4576-9478-db0dd2f115ef;
 Mon, 16 Aug 2021 05:38:46 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2F4C021E8A;
 Mon, 16 Aug 2021 05:38:45 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id F2244136A6;
 Mon, 16 Aug 2021 05:38:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id ueL9OOT5GWEvTgAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 16 Aug 2021 05:38:44 +0000
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
X-Inumbo-ID: 217dc736-47e6-4576-9478-db0dd2f115ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629092325; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1xaC8qgp42+JgsZAMy0738oUwYglHbF8KNfGlNsKt18=;
	b=L7ZxUhQwHmE/hDAlWsTDfBWAsz6s+/ET+52G35nIbUYvmXn0vY9q0t69EyBe/N7SUHEcWG
	5A/kXzaa+4OUH4xmtPhROIb8bB78gcjsWdhPloaiRypjhu+AaWyn8QaH7X7cXEs0Y7W/XH
	jGXMtyVkvBL49ZtT7+6NxI1fn4uFnz0=
Subject: Re: [PATCH] tests/xenstore: link in librt
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <3fe5f85c-3702-286c-46a3-d90eb094123f@suse.com>
 <24853.1273.985325.539310@mariner.uk.xensource.com>
 <74fde732-c2bb-168f-a51c-74e2220c87c5@suse.com>
 <24854.21217.976758.626859@mariner.uk.xensource.com>
 <2fbd9038-8603-da23-ce7f-1544f7c04d55@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <8da19f9f-2a7b-1f9b-f999-364bdec4af72@suse.com>
Date: Mon, 16 Aug 2021 07:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <2fbd9038-8603-da23-ce7f-1544f7c04d55@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="efXpP5L2mHnbNRkzt3eCAz9CDPae5wOQy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--efXpP5L2mHnbNRkzt3eCAz9CDPae5wOQy
Content-Type: multipart/mixed; boundary="L29RAxij1ycepfbwK157glOYy4Kh19EW5";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Message-ID: <8da19f9f-2a7b-1f9b-f999-364bdec4af72@suse.com>
Subject: Re: [PATCH] tests/xenstore: link in librt
References: <3fe5f85c-3702-286c-46a3-d90eb094123f@suse.com>
 <24853.1273.985325.539310@mariner.uk.xensource.com>
 <74fde732-c2bb-168f-a51c-74e2220c87c5@suse.com>
 <24854.21217.976758.626859@mariner.uk.xensource.com>
 <2fbd9038-8603-da23-ce7f-1544f7c04d55@suse.com>
In-Reply-To: <2fbd9038-8603-da23-ce7f-1544f7c04d55@suse.com>

--L29RAxij1ycepfbwK157glOYy4Kh19EW5
Content-Type: multipart/mixed;
 boundary="------------BDC531FA2AB3E8C91C78EA05"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BDC531FA2AB3E8C91C78EA05
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.08.21 14:35, Jan Beulich wrote:
> On 13.08.2021 13:09, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH] tests/xenstore: link in librt"):
>>> On 12.08.2021 13:24, Ian Jackson wrote:
>>>>> +LDFLAGS +=3D -lrt
>>>>
>>>> Don't this unconditionally is definitely not right.
>>>
>>> Assuming you meant "Doing this ..." - why? If the concern is that
>>> librt.so may needlessly get recorded in a DT_NEEDED entry, then I
>>> can replace the early addition with a late
>>>
>>> LDFLAGS +=3D -Wl,--as-needed -lc -lrt
>>>
>>> one.
>>
>> librt might not exist at all on some platforms.
>=20
> Hmm, indeed. Do you have any suggestion then? Adding a ./configure
> check is going to be beyond what I'd we willing to spend time on ...

libxl is using (probably due to the same problem):

LDUSELIBS-$(CONFIG_Linux) +=3D -lrt

So I guess the same construct is possible here, too.


Juergen

--------------BDC531FA2AB3E8C91C78EA05
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

--------------BDC531FA2AB3E8C91C78EA05--

--L29RAxij1ycepfbwK157glOYy4Kh19EW5--

--efXpP5L2mHnbNRkzt3eCAz9CDPae5wOQy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEZ+eQFAwAAAAAACgkQsN6d1ii/Ey++
9Af/TynUxUMgZhoZvbzSfai0qvNauf/0Vfibcughc05hO6ydOwwzGIQGPn88N7A/9md4wu5lKHeK
yVzkR9W2vOKGBfvwGi9pO/HAOewziORS9I4BZtqSy+RlkwSLGvdujVWtv648CVMLXXFs4BZOoT2N
hHjfKYwIWX2d6aomUbumd2Evx0CNNz8cID/TDnZQl807Vk7SGGreHwofIbw9QyWzOmgDVkn93Hyb
bLjT2miu/lZUx8L64p0dbTBRG2lftRenPbjKQGq1r6XtGfcctTYr5/H/BMalMcdbolcV5DSzguut
OTfVHUJhgGMTIfvFD2qgbSR90Hs4yqfVrfxpoLCDbw==
=8Ype
-----END PGP SIGNATURE-----

--efXpP5L2mHnbNRkzt3eCAz9CDPae5wOQy--

