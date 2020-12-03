Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC642CD2B5
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 10:40:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43237.77770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkl5Q-0003EG-8D; Thu, 03 Dec 2020 09:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43237.77770; Thu, 03 Dec 2020 09:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkl5Q-0003Dp-4l; Thu, 03 Dec 2020 09:39:40 +0000
Received: by outflank-mailman (input) for mailman id 43237;
 Thu, 03 Dec 2020 09:39:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yflw=FH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkl5O-0003Db-6G
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 09:39:38 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ceb0013-3ebe-4d2a-937e-8eeecf592be7;
 Thu, 03 Dec 2020 09:39:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB34AAC55;
 Thu,  3 Dec 2020 09:39:35 +0000 (UTC)
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
X-Inumbo-ID: 0ceb0013-3ebe-4d2a-937e-8eeecf592be7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606988375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CSV1sDJoRkaDSHb5Z8goZsZ3J2kND8hk6DyBcbnGWKw=;
	b=AppEi50RLKoFlFgRlzogpJkwjjovKw0O26f2j3qJ8tKD9FL4iAcKX9qdbyDS+J7Rf/uRFu
	3sluevOzl7Ivymxd2p7M67z4KMic/xtGO8L9xYP9VOaVb0ixn13K6yJyTBf8nSIaG74dii
	x1rsqhrH7EY3JNbcWytUD242o6PiFAI=
Subject: Re: [PATCH v2 11/17] xen/hypfs: add getsize() and findentry()
 callbacks to hypfs_funcs
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-12-jgross@suse.com>
 <e8a876c9-b1bf-62a4-d30c-a2c646cb68f7@suse.com>
 <e2909e87-473f-dbf5-9e58-7c817ac59e3f@suse.com>
 <d878f80d-d71d-93cd-8ee1-06fb860bf390@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a3318702-692d-ec25-cd1a-fbe6d3852659@suse.com>
Date: Thu, 3 Dec 2020 10:39:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d878f80d-d71d-93cd-8ee1-06fb860bf390@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JzzXWVCs0fg4lH9gtvbEMpwK42V3VbHTD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JzzXWVCs0fg4lH9gtvbEMpwK42V3VbHTD
Content-Type: multipart/mixed; boundary="e4g872LdFtk3sYL28g4p5I7zCh4uetgLM";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <a3318702-692d-ec25-cd1a-fbe6d3852659@suse.com>
Subject: Re: [PATCH v2 11/17] xen/hypfs: add getsize() and findentry()
 callbacks to hypfs_funcs
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-12-jgross@suse.com>
 <e8a876c9-b1bf-62a4-d30c-a2c646cb68f7@suse.com>
 <e2909e87-473f-dbf5-9e58-7c817ac59e3f@suse.com>
 <d878f80d-d71d-93cd-8ee1-06fb860bf390@suse.com>
In-Reply-To: <d878f80d-d71d-93cd-8ee1-06fb860bf390@suse.com>

--e4g872LdFtk3sYL28g4p5I7zCh4uetgLM
Content-Type: multipart/mixed;
 boundary="------------201B8C9B7884ED2947A2D03E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------201B8C9B7884ED2947A2D03E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 09:12, Jan Beulich wrote:
> On 02.12.2020 16:51, J=C3=BCrgen Gro=C3=9F wrote:
>> On 02.12.20 16:42, Jan Beulich wrote:
>>> On 01.12.2020 09:21, Juergen Gross wrote:
>>>> Add a getsize() function pointer to struct hypfs_funcs for being abl=
e
>>>> to have dynamically filled entries without the need to take the hypf=
s
>>>> lock each time the contents are being generated.
>>>>
>>>> For directories add a findentry callback to the vector and modify
>>>> hypfs_get_entry_rel() to use it.
>>>>
>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> with maybe one further small adjustment:
>>>
>>>> @@ -176,15 +188,41 @@ static int hypfs_get_path_user(char *buf,
>>>>        return 0;
>>>>    }
>>>>   =20
>>>> +struct hypfs_entry *hypfs_leaf_findentry(const struct hypfs_entry_d=
ir *dir,
>>>> +                                         const char *name,
>>>> +                                         unsigned int name_len)
>>>> +{
>>>> +    return ERR_PTR(-ENOENT);
>>>> +}
>>>
>>> ENOENT seems odd to me here. There looks to be no counterpart to
>>> EISDIR, so maybe ENODATA, EACCES, or EPERM?
>>
>> Hmm, why?
>>
>> In case I have /a/b and I'm looking for /a/b/c ENOENT seems to be just=

>> fine?
>>
>> Or I could add ENOTDIR.
>=20
> Oh, there actually is supposed to be such an entry, but public/errno.h
> is simply missing it. Yes - ENOTDIR is what I was thinking of when
> saying "there looks to be no counterpart to EISDIR".

Okay, I'll add ENOTDIR and set it here.


Juergen

--------------201B8C9B7884ED2947A2D03E
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

--------------201B8C9B7884ED2947A2D03E--

--e4g872LdFtk3sYL28g4p5I7zCh4uetgLM--

--JzzXWVCs0fg4lH9gtvbEMpwK42V3VbHTD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/IslYFAwAAAAAACgkQsN6d1ii/Ey9l
GQf9FdRbPpnd4NjUyvELRCSc60N6aM+Co9SJ0bivWpz+Ed5NQY5TY+oO5czlYHinDo/yB0bkkrjm
h8Cp5L6OYwtY4izmKyc7kPF+MhiGcdKooaE+8ML8xoVh6twAoEi9vnrnurMtdhGLBrp3uxa1E9GP
4CjgzDlH9+OR3sDVkT+L6sJ6OF5ywf2HkbiVff3L4z9pl5CY1XzbsDYupESPUcpyOdxs0C0Fm/Qh
4MLyZxq3Bl/MUdgidS8oUgw9xC33/WF3ZO4NX1x3DCLawNCWXqi406u/OgC3fdgEaiWe5rzqw7d0
WJ6q8S4affxP1BMm84faRdctFbH2s6y4+L/O0V4g3w==
=FJQ0
-----END PGP SIGNATURE-----

--JzzXWVCs0fg4lH9gtvbEMpwK42V3VbHTD--

