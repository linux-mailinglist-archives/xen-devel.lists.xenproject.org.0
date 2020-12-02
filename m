Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4832CC113
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 16:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42841.77100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkUFl-0001Wt-D5; Wed, 02 Dec 2020 15:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42841.77100; Wed, 02 Dec 2020 15:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkUFl-0001WU-9v; Wed, 02 Dec 2020 15:41:13 +0000
Received: by outflank-mailman (input) for mailman id 42841;
 Wed, 02 Dec 2020 15:41:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wvYF=FG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kkUFk-0001WP-AY
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 15:41:12 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a35072e-8951-4384-bc30-369ff31d6317;
 Wed, 02 Dec 2020 15:41:10 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A00DAC2D;
 Wed,  2 Dec 2020 15:41:09 +0000 (UTC)
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
X-Inumbo-ID: 3a35072e-8951-4384-bc30-369ff31d6317
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606923669; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=udBuN1ex3ZQ1V/yAGNsT7MZSXRvUWFYuB3R471utzUY=;
	b=vRV+rp0ML5zBkIVNr4h2aSqMgHY5A/Z+52ywWVAdR5qRtViYme0BKxNgRYwl3R8BqkTB6Q
	pbRLe+PrDprDTupxU+cATWlN1ZAslefVOY5AgvGtWoqOyCkIBF/+WtNXDI/7KCtRcdKGnr
	Cc9NPDkcDvglc/MaB2oKcRtWMMRGZ2A=
Subject: Re: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into
 a dedicated struct
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-10-jgross@suse.com>
 <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d9bf90f5-26b7-d5b2-c3ae-1c8b336c487d@suse.com>
Date: Wed, 2 Dec 2020 16:41:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="e36nwYktNoAgr2cTiLaWNC3fX2vpFkrjQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--e36nwYktNoAgr2cTiLaWNC3fX2vpFkrjQ
Content-Type: multipart/mixed; boundary="3cTGl03TTf2ZuecOY3I5oRt6qFtCiOuNi";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <d9bf90f5-26b7-d5b2-c3ae-1c8b336c487d@suse.com>
Subject: Re: [PATCH v2 09/17] xen/hypfs: move per-node function pointers into
 a dedicated struct
References: <20201201082128.15239-1-jgross@suse.com>
 <20201201082128.15239-10-jgross@suse.com>
 <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>
In-Reply-To: <ddb41dd4-485e-5ae3-9b3a-dd0aae787260@suse.com>

--3cTGl03TTf2ZuecOY3I5oRt6qFtCiOuNi
Content-Type: multipart/mixed;
 boundary="------------1BEEB8BA5F274B2B52C38AEA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1BEEB8BA5F274B2B52C38AEA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.12.20 16:36, Jan Beulich wrote:
> On 01.12.2020 09:21, Juergen Gross wrote:
>> @@ -297,6 +321,7 @@ int hypfs_write_leaf(struct hypfs_entry_leaf *leaf=
,
>>       int ret;
>>  =20
>>       ASSERT(this_cpu(hypfs_locked) =3D=3D hypfs_write_locked);
>> +    ASSERT(leaf->e.max_size);
>>  =20
>>       if ( ulen > leaf->e.max_size )
>>           return -ENOSPC;
>> @@ -357,6 +382,7 @@ int hypfs_write_custom(struct hypfs_entry_leaf *le=
af,
>>       int ret;
>>  =20
>>       ASSERT(this_cpu(hypfs_locked) =3D=3D hypfs_write_locked);
>> +    ASSERT(leaf->e.max_size);
>>  =20
>>       /* Avoid oversized buffer allocation. */
>>       if ( ulen > MAX_PARAM_SIZE )
>=20
> At the first glance both of these hunks look as if they
> wouldn't belong here, but I guess the ASSERT()s are getting
> lifted here from hypfs_write(). (The first looks even somewhat
> redundant with the immediately following if().) If this
> understanding of mine is correct,

It is.

> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

>=20
>> @@ -382,19 +408,20 @@ int hypfs_write_custom(struct hypfs_entry_leaf *=
leaf,
>>       return ret;
>>   }
>>  =20
>> +int hypfs_write_deny(struct hypfs_entry_leaf *leaf,
>> +                     XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned int=
 ulen)
>> +{
>> +    return -EACCES;
>> +}
>> +
>>   static int hypfs_write(struct hypfs_entry *entry,
>>                          XEN_GUEST_HANDLE_PARAM(void) uaddr, unsigned =
long ulen)
>=20
> As a tangent, is there a reason these write functions don't take
> handles of "const void"? (I realize this likely is nothing that
> wants addressing right here.)

No, not really.

I'll change that.


Juergen

--------------1BEEB8BA5F274B2B52C38AEA
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

--------------1BEEB8BA5F274B2B52C38AEA--

--3cTGl03TTf2ZuecOY3I5oRt6qFtCiOuNi--

--e36nwYktNoAgr2cTiLaWNC3fX2vpFkrjQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/HtZQFAwAAAAAACgkQsN6d1ii/Ey8W
rgf8DcZidDQkLWcz4tUpixOc54VjDr1fQPKFsdqsnhc3zGlzsjN74QfTh332RpRenxeOqepyv297
azRVyMHh96O3QocU+7jknSWRA1EtOpUGGD0tw87xeZy9n2vEk9dJx1YzgZ4jcvv4UdcKpyDKC/h9
1H8CG59o0HubZEot0nupjBRPUPqyLnnsw3feGdo2feOTpACc3sHASBAKbYbkIW2Bnm0/VQD1xOk+
KTyAlDTcbDL++7Bzes/tjDdjhwh8beUmyLgIIUMzgT5Gq4jRR0bvk3HRg6f6nxckCEZX6gjvDXo3
dVwXvf8rcclWEcBOu9k57P4WDmWE9XvT7dmb7mPiaQ==
=D8fN
-----END PGP SIGNATURE-----

--e36nwYktNoAgr2cTiLaWNC3fX2vpFkrjQ--

