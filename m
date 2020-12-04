Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C712CE9BB
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 09:34:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44129.79117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6XH-00042U-K7; Fri, 04 Dec 2020 08:33:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44129.79117; Fri, 04 Dec 2020 08:33:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl6XH-000425-Gk; Fri, 04 Dec 2020 08:33:51 +0000
Received: by outflank-mailman (input) for mailman id 44129;
 Fri, 04 Dec 2020 08:33:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ov5/=FI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kl6XF-00041z-8E
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 08:33:49 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 813ff543-e725-414e-b283-9f051ed7ac18;
 Fri, 04 Dec 2020 08:33:48 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 97C75AE1C;
 Fri,  4 Dec 2020 08:33:47 +0000 (UTC)
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
X-Inumbo-ID: 813ff543-e725-414e-b283-9f051ed7ac18
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607070827; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRXR4H+VQZieES9nDZ0CJWVCk9vVRbeNavGyf5qi30I=;
	b=oacqaRd+TY0beFyxfpAViEafIlUtxxHMkbym95rPlQ9VDHWHUnnuiUYa2ug7YQEAlb5jmu
	tFGN6CzMb8fzt7VbWKLt4jkrthk1qRUSqhwiYfr+zF00bJBGsJh/OrFrep8DI8FgV/OJ2w
	Tu9ejly068lTVC4XHyZA+Roq+vSMFiU=
Subject: Re: [PATCH v2 12/17] xen/hypfs: add new enter() and exit() per node
 callbacks
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-13-jgross@suse.com>
 <0c57dd86-36d9-c378-6bdb-50221a7812b8@suse.com>
 <2503547c-1b3c-2224-c4a9-c647d9d1a058@suse.com>
 <6593ed01-23d0-70ac-faa3-556c69adec2b@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2704feac-3935-d226-8476-c47ab2d72e92@suse.com>
Date: Fri, 4 Dec 2020 09:33:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6593ed01-23d0-70ac-faa3-556c69adec2b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="oqsUZUCcfd0c9j5E1B9ELEDZz4ENdsQ7O"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--oqsUZUCcfd0c9j5E1B9ELEDZz4ENdsQ7O
Content-Type: multipart/mixed; boundary="2FWaqqLCqxvcwOsmasirwRWYnSHeIq1bb";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <2704feac-3935-d226-8476-c47ab2d72e92@suse.com>
Subject: Re: [PATCH v2 12/17] xen/hypfs: add new enter() and exit() per node
 callbacks
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-13-jgross@suse.com>
 <0c57dd86-36d9-c378-6bdb-50221a7812b8@suse.com>
 <2503547c-1b3c-2224-c4a9-c647d9d1a058@suse.com>
 <6593ed01-23d0-70ac-faa3-556c69adec2b@suse.com>
In-Reply-To: <6593ed01-23d0-70ac-faa3-556c69adec2b@suse.com>

--2FWaqqLCqxvcwOsmasirwRWYnSHeIq1bb
Content-Type: multipart/mixed;
 boundary="------------785054A3C89D5DF546978FD1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------785054A3C89D5DF546978FD1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.12.20 16:29, Jan Beulich wrote:
> On 03.12.2020 16:14, J=C3=BCrgen Gro=C3=9F wrote:
>> On 03.12.20 15:59, Jan Beulich wrote:
>>> On 01.12.2020 09:21, Juergen Gross wrote:
>>>> @@ -100,11 +112,58 @@ static void hypfs_unlock(void)
>>>>        }
>>>>    }
>>>>   =20
>>>> +const struct hypfs_entry *hypfs_node_enter(const struct hypfs_entry=
 *entry)
>>>> +{
>>>> +    return entry;
>>>> +}
>>>> +
>>>> +void hypfs_node_exit(const struct hypfs_entry *entry)
>>>> +{
>>>> +}
>>>> +
>>>> +static int node_enter(const struct hypfs_entry *entry)
>>>> +{
>>>> +    const struct hypfs_entry **last =3D &this_cpu(hypfs_last_node_e=
ntered);
>>>> +
>>>> +    entry =3D entry->funcs->enter(entry);
>>>> +    if ( IS_ERR(entry) )
>>>> +        return PTR_ERR(entry);
>>>> +
>>>> +    ASSERT(!*last || *last =3D=3D entry->parent);
>>>> +
>>>> +    *last =3D entry;
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static void node_exit(const struct hypfs_entry *entry)
>>>> +{
>>>> +    const struct hypfs_entry **last =3D &this_cpu(hypfs_last_node_e=
ntered);
>>>> +
>>>> +    if ( !*last )
>>>> +        return;
>>>
>>> Under what conditions is this legitimate to happen? IOW shouldn't
>>> there be an ASSERT_UNREACHABLE() here?
>>
>> This is for the "/" node.
>=20
> I.e. would ASSERT(!entry->parent) be appropriate to add here, at
> the same time serving as documentation of what you've just said?

I rechecked and have found that this was a remnant from an earlier
variant. *last won't ever be NULL, so the if can be dropped (a NULL
will be catched by the following ASSERT()).


Juergen

--------------785054A3C89D5DF546978FD1
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

--------------785054A3C89D5DF546978FD1--

--2FWaqqLCqxvcwOsmasirwRWYnSHeIq1bb--

--oqsUZUCcfd0c9j5E1B9ELEDZz4ENdsQ7O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/J9GoFAwAAAAAACgkQsN6d1ii/Ey9q
2wf8CZQnnuZHTNm7YwszHlHSdN1yZ9uPnPipFn/kZQHUTRsjl4Vnj1nHHdLhIyvso4nhE8rBqpwN
FcgSX4BG4It2dXdYia+CFlLgxbtvwE01bFud43GZMFUkK0NznzWDhqzj/p6X2fCWMPQWWV39FD3h
kiyWJyKhj1zH3f9nGBj0+awbHI/wZBkoF5ie35kWZVPJFCXPaNlNtJZu3wCFk65OuyhVnqQJF5tj
vqbBzEWgRt53Bzyi1q287Cw/Xl0aVA7kVVrMa9rvYqWsupSZxsV7pKojjhp3G4nC/AYQ4ynioD9E
hyvCsBRm9lmqnEmDr4d34thZ8+QKcSA/qqkQfJbEjg==
=uo7h
-----END PGP SIGNATURE-----

--oqsUZUCcfd0c9j5E1B9ELEDZz4ENdsQ7O--

