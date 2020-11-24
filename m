Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B272C2587
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 13:19:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35864.67512 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khXHf-0001PR-97; Tue, 24 Nov 2020 12:18:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35864.67512; Tue, 24 Nov 2020 12:18:59 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khXHf-0001P2-5Z; Tue, 24 Nov 2020 12:18:59 +0000
Received: by outflank-mailman (input) for mailman id 35864;
 Tue, 24 Nov 2020 12:18:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khXHd-0001Ox-0t
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:18:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4f5f1624-66c9-4873-bc92-77be059c37ae;
 Tue, 24 Nov 2020 12:18:55 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8114EAC2E;
 Tue, 24 Nov 2020 12:18:54 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khXHd-0001Ox-0t
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:18:57 +0000
X-Inumbo-ID: 4f5f1624-66c9-4873-bc92-77be059c37ae
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 4f5f1624-66c9-4873-bc92-77be059c37ae;
	Tue, 24 Nov 2020 12:18:55 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606220334; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RFWJDXQbZkjrb5CRsC/eLe96jaTP+gxrZWQQaIRru8I=;
	b=VugQZ21xNQ9Vk6lSigrRD7YjB2WhIJDu+ULIPJalqll4J3jwUHkI9ouEHOgOmGyaRQ+Z+J
	E5flwcHEdQm91vqiOwIbndv/Kkb2wz5Cm4WW2PSSGVMbMwrkvX9X2kwrxJX/l85s1J704d
	grJYdhyOfbBHV0dpbAltQ5SZH8SDzY8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8114EAC2E;
	Tue, 24 Nov 2020 12:18:54 +0000 (UTC)
Subject: Re: [PATCH v7 2/3] xen/events: modify struct evtchn layout
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-3-jgross@suse.com>
 <440bced0-97ec-33c4-f6fa-01850777e5c2@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <696314b9-18e3-e18d-10f2-a510e19438da@suse.com>
Date: Tue, 24 Nov 2020 13:18:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <440bced0-97ec-33c4-f6fa-01850777e5c2@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TT1hRZiCRHqfqHKBklAnfyKM1R4I6rr16"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TT1hRZiCRHqfqHKBklAnfyKM1R4I6rr16
Content-Type: multipart/mixed; boundary="8fjOsoXHK3aUncWCh5rGMM9UVGnCsIO5a";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <696314b9-18e3-e18d-10f2-a510e19438da@suse.com>
Subject: Re: [PATCH v7 2/3] xen/events: modify struct evtchn layout
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-3-jgross@suse.com>
 <440bced0-97ec-33c4-f6fa-01850777e5c2@suse.com>
In-Reply-To: <440bced0-97ec-33c4-f6fa-01850777e5c2@suse.com>

--8fjOsoXHK3aUncWCh5rGMM9UVGnCsIO5a
Content-Type: multipart/mixed;
 boundary="------------2BC00B69429FD899B1B88A01"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2BC00B69429FD899B1B88A01
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.11.20 12:42, Jan Beulich wrote:
> On 24.11.2020 08:01, Juergen Gross wrote:
>> In order to avoid latent races when updating an event channel put
>> xen_consumer and pending fields in different bytes.
>=20
> I think there's a little more to be said here as to what the
> actual risk is, as the two fields are - afaict - at present
> fine the way they're declared.

Okay.

>=20
>> @@ -94,9 +93,10 @@ struct evtchn
>>   #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ line=
=2E        */
>>   #define ECS_IPI          6 /* Channel is bound to a virtual IPI line=
=2E        */
>>       u8  state;             /* ECS_* */
>> -    u8  xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if nonzero=
 */
>=20
> I see no reason to use a full byte for this one; in fact I
> was considering whether it, state, and old_state couldn't
> share storage (the latest when we run into space issues with
> this struct). (In this context I'm also observing that
> old_state could get away with just 2 bits, i.e. all three
> fields would fit in a single byte.)

I think doing further compression now isn't really helping. It would
just add more padding bytes and result in larger code.

>=20
>> -    u8  pending:1;
>> -    u16 notify_vcpu_id;    /* VCPU for local delivery notification */=

>> +#ifndef NDEBUG
>> +    u8  old_state;     /* State when taking lock in write mode. */
>> +#endif
>> +    u8  xen_consumer;  /* Consumer in Xen if nonzero */
>>       u32 port;
>>       union {
>>           struct {
>> @@ -113,11 +113,13 @@ struct evtchn
>>           } pirq;        /* state =3D=3D ECS_PIRQ */
>>           u16 virq;      /* state =3D=3D ECS_VIRQ */
>>       } u;
>> -    u8 priority;
>> -#ifndef NDEBUG
>> -    u8 old_state;      /* State when taking lock in write mode. */
>> -#endif
>> -    u32 fifo_lastq;    /* Data for fifo events identifying last queue=
=2E */
>> +
>> +    /* FIFO event channels only. */
>> +    u8  pending;
>> +    u8  priority;
>> +    u16 notify_vcpu_id;    /* VCPU for local delivery notification */=

>=20
> This field definitely isn't FIFO-only.

Oh, you are right.

> Also for all fields you touch anyway, may I ask that you switch to
> uint<N>_t or, in the case of "pending", bool?

Fine with me.

Would you object to switching the whole structure in this regard?


Juergen

--------------2BC00B69429FD899B1B88A01
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

--------------2BC00B69429FD899B1B88A01--

--8fjOsoXHK3aUncWCh5rGMM9UVGnCsIO5a--

--TT1hRZiCRHqfqHKBklAnfyKM1R4I6rr16
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+8+i0FAwAAAAAACgkQsN6d1ii/Ey+g
Awf/RqmtqWU4u7986qrW0DVLqlQ7kDvnUsKdtytwLVrrVgp2XA9BSd3FtehnA0UtdbzOWxID8kHN
6uRCM7mKO/YGT3+A7cJ+B/oLemIY9AllbIwRhiuHiZ0R8XeuX6ITqpoiCz4/YvcHeiVJRlBwpcNT
+Bdbt+MSf7NAFg7Z6Q57keGVon+pY+CW/vzfdvf+JjjK/QUIBbHHSN6HaKa8D38K2ElMi++BP/fa
AuJqwj/1cAx9w8QUkM7n3Q8IOvcOjx9d0fFeKH9zwHs/HgWtdXCoz8bWgb5Z3cMSS+Tx8ElWe6Q2
grDPRk6Atx4I/LC8uER7fnbMh4pXpjMJefLbD2xQ7g==
=P9zi
-----END PGP SIGNATURE-----

--TT1hRZiCRHqfqHKBklAnfyKM1R4I6rr16--

