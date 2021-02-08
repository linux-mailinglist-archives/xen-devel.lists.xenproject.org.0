Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706843131F4
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 13:15:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.82821.153118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l95S5-0003Ut-KM; Mon, 08 Feb 2021 12:15:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 82821.153118; Mon, 08 Feb 2021 12:15:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l95S5-0003UT-H5; Mon, 08 Feb 2021 12:15:37 +0000
Received: by outflank-mailman (input) for mailman id 82821;
 Mon, 08 Feb 2021 12:15:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q0oM=HK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l95S4-0003UM-BK
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 12:15:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 148bb942-4f65-4731-b262-b0ddd1a5d595;
 Mon, 08 Feb 2021 12:15:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8C9C8AD2E;
 Mon,  8 Feb 2021 12:15:30 +0000 (UTC)
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
X-Inumbo-ID: 148bb942-4f65-4731-b262-b0ddd1a5d595
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612786530; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RKXtbcsoovvaCUMeOTZHe5m8aYHItg1m+gJCpla7VS8=;
	b=X5fxVB+wboUGoTTgV9YtK1DA66r0Wjs0HMGrY68aayv1ZUq5YQT4nJulsXvEVL4gL+alGf
	9bKmTzNpqrpYzS8PWAQvryIIC4kMHz/YznN7n00ypcV6bGmkpwwqyzRkdOW0to55i9Wj3W
	xHMG7Z8yC7E/TG5EfZPOWe0BL0e5vUQ=
Subject: Re: [PATCH 7/7] xen/evtchn: read producer index only once
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-8-jgross@suse.com>
 <72334160-cffe-2d8a-23b7-2ea9ab1d803a@suse.com>
 <626f500a-494a-0141-7bf3-94fb86b47ed4@suse.com>
 <e88526ac-6972-fe08-c58f-ea872cbdcc14@suse.com>
 <d0ca217c-ecc9-55f7-abb1-30a687a46b31@suse.com>
 <a30db278-087b-554c-d5bf-1317e14e8508@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9d725a1b-ec8e-c078-5ec6-9c4899d4c7aa@suse.com>
Date: Mon, 8 Feb 2021 13:15:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <a30db278-087b-554c-d5bf-1317e14e8508@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YuKOlcDS7YODQvUINCuHNtInK5LAZedtz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YuKOlcDS7YODQvUINCuHNtInK5LAZedtz
Content-Type: multipart/mixed; boundary="wyQF6qxm371oj8AGDLzN5uM2V34m93hPf";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 xen-devel@lists.xenproject.org
Message-ID: <9d725a1b-ec8e-c078-5ec6-9c4899d4c7aa@suse.com>
Subject: Re: [PATCH 7/7] xen/evtchn: read producer index only once
References: <20210206104932.29064-1-jgross@suse.com>
 <20210206104932.29064-8-jgross@suse.com>
 <72334160-cffe-2d8a-23b7-2ea9ab1d803a@suse.com>
 <626f500a-494a-0141-7bf3-94fb86b47ed4@suse.com>
 <e88526ac-6972-fe08-c58f-ea872cbdcc14@suse.com>
 <d0ca217c-ecc9-55f7-abb1-30a687a46b31@suse.com>
 <a30db278-087b-554c-d5bf-1317e14e8508@suse.com>
In-Reply-To: <a30db278-087b-554c-d5bf-1317e14e8508@suse.com>

--wyQF6qxm371oj8AGDLzN5uM2V34m93hPf
Content-Type: multipart/mixed;
 boundary="------------E4AB4358A9365B6EDCA7EB62"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E4AB4358A9365B6EDCA7EB62
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.02.21 12:54, Jan Beulich wrote:
> On 08.02.2021 11:59, J=C3=BCrgen Gro=C3=9F wrote:
>> On 08.02.21 11:51, Jan Beulich wrote:
>>> On 08.02.2021 11:41, J=C3=BCrgen Gro=C3=9F wrote:
>>>> On 08.02.21 10:48, Jan Beulich wrote:
>>>>> On 06.02.2021 11:49, Juergen Gross wrote:
>>>>>> In evtchn_read() use READ_ONCE() for reading the producer index in=

>>>>>> order to avoid the compiler generating multiple accesses.
>>>>>>
>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>> ---
>>>>>>     drivers/xen/evtchn.c | 2 +-
>>>>>>     1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/xen/evtchn.c b/drivers/xen/evtchn.c
>>>>>> index 421382c73d88..f6b199b597bf 100644
>>>>>> --- a/drivers/xen/evtchn.c
>>>>>> +++ b/drivers/xen/evtchn.c
>>>>>> @@ -211,7 +211,7 @@ static ssize_t evtchn_read(struct file *file, =
char __user *buf,
>>>>>>     			goto unlock_out;
>>>>>>    =20
>>>>>>     		c =3D u->ring_cons;
>>>>>> -		p =3D u->ring_prod;
>>>>>> +		p =3D READ_ONCE(u->ring_prod);
>>>>>>     		if (c !=3D p)
>>>>>>     			break;
>>>>>
>>>>> Why only here and not also in
>>>>>
>>>>> 		rc =3D wait_event_interruptible(u->evtchn_wait,
>>>>> 					      u->ring_cons !=3D u->ring_prod);
>>>>>
>>>>> or in evtchn_poll()? I understand it's not needed when
>>>>> ring_prod_lock is held, but that's not the case in the two
>>>>> afaics named places. Plus isn't the same then true for
>>>>> ring_cons and ring_cons_mutex, i.e. aren't the two named
>>>>> places plus evtchn_interrupt() also in need of READ_ONCE()
>>>>> for ring_cons?
>>>>
>>>> The problem solved here is the further processing using "p" multiple=

>>>> times. p must not be silently replaced with u->ring_prod by the
>>>> compiler, so I probably should reword the commit message to say:
>>>>
>>>> ... in order to not allow the compiler to refetch p.
>>>
>>> I still wouldn't understand the change (and the lack of
>>> further changes) then: The first further use of p is
>>> outside the loop, alongside one of c. IOW why would c
>>> then not need treating the same as p?
>>
>> Its value wouldn't change, as ring_cons is being modified only at
>> the bottom of this function, and nowhere else (apart from the reset
>> case, but this can't run concurrently due to ring_cons_mutex).
>>
>>> I also still don't see the difference between latching a
>>> value into a local variable vs a "freestanding" access -
>>> neither are guaranteed to result in exactly one memory
>>> access afaict.
>>
>> READ_ONCE() is using a pointer to volatile, so any refetching by
>> the compiler would be a bug.
>=20
> Of course, but this wasn't my point. I was contrasting
>=20
> 		c =3D u->ring_cons;
> 		p =3D u->ring_prod;
>=20
> which you change with
>=20
> 		rc =3D wait_event_interruptible(u->evtchn_wait,
> 					      u->ring_cons !=3D u->ring_prod);
>=20
> which you leave alone.

Can you point out which problem might arise from that?


Juergen

--------------E4AB4358A9365B6EDCA7EB62
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

--------------E4AB4358A9365B6EDCA7EB62--

--wyQF6qxm371oj8AGDLzN5uM2V34m93hPf--

--YuKOlcDS7YODQvUINCuHNtInK5LAZedtz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAhK2EFAwAAAAAACgkQsN6d1ii/Ey8H
9wf+MPuO3ggydQhCAfAfX21hvC2kwrm+cuFYLd6oNmNNUUxwMFRpU2he8VbAF/pzFZNm/ikIfmQe
Yr5Oeaa2WYDZq0NjGB3khtK11dreh0Ec5F6Z14uMxnTuezK+q7jJPvr7q09NXFPYlJKS458DmWM7
sIoCYNvRpVJdC//ZX/ybvaCMq3+wC6ySJgtFcbxUxQgB5t5oqnvTnVAOZzs0TaT4UKm7JlpDsH+j
WcpWyPx8Km5TIqHgM+SvfEPMOXMmPeB4zj1/YPh4koj/YDTA64DWirN6dcf6W2Eq2MbBXr7+u0fO
4OpZ2B/ld6d1WG2/FhGqIcixUlm1pJo3i6W+ZWioKA==
=Jxbh
-----END PGP SIGNATURE-----

--YuKOlcDS7YODQvUINCuHNtInK5LAZedtz--

