Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB80F2C26F8
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 14:20:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35959.67621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYEW-0007gs-7d; Tue, 24 Nov 2020 13:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35959.67621; Tue, 24 Nov 2020 13:19:48 +0000
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
	id 1khYEW-0007gW-4Y; Tue, 24 Nov 2020 13:19:48 +0000
Received: by outflank-mailman (input) for mailman id 35959;
 Tue, 24 Nov 2020 13:19:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khYEU-0007gR-Du
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:19:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1dbd80f-5505-4f0e-be61-8067dc6d77e1;
 Tue, 24 Nov 2020 13:19:45 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2464FAC2D;
 Tue, 24 Nov 2020 13:19:44 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khYEU-0007gR-Du
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 13:19:46 +0000
X-Inumbo-ID: c1dbd80f-5505-4f0e-be61-8067dc6d77e1
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c1dbd80f-5505-4f0e-be61-8067dc6d77e1;
	Tue, 24 Nov 2020 13:19:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606223984; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8Apj1z0TnJBFEQzKcpxGgYAQeXqw9VJt7qawygadYbg=;
	b=ZlPM2Kqh8f0uAKixkiQ/6w+uteYNYpPaYwK2ojXE5WsEc3gvq0NgBsxhVF5ObRqdoGcWmX
	IB24Sa2IiLMH1YSTpdPIrYwZ1HJQ1DK3/61YfKbPDX5PHti29Yw++w/FU/eCgiA4Dfg1MJ
	TKeiik4Y5I9atR8AXxIXgqd5s16lKqg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 2464FAC2D;
	Tue, 24 Nov 2020 13:19:44 +0000 (UTC)
Subject: Re: [PATCH v7 2/3] xen/events: modify struct evtchn layout
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-3-jgross@suse.com>
 <440bced0-97ec-33c4-f6fa-01850777e5c2@suse.com>
 <696314b9-18e3-e18d-10f2-a510e19438da@suse.com>
 <9017e6a2-2fa0-4093-32a8-a256a58f4a33@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <78318d0b-b80e-c50e-c3a7-7a0d2e616dc4@suse.com>
Date: Tue, 24 Nov 2020 14:19:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <9017e6a2-2fa0-4093-32a8-a256a58f4a33@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="TkxJVRfb5WQYg5Sl8K4TnW14HXuhnC4Tt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--TkxJVRfb5WQYg5Sl8K4TnW14HXuhnC4Tt
Content-Type: multipart/mixed; boundary="n0EZJFrZMQQbhjTZEkQA5oQ1kEpObiQhM";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <78318d0b-b80e-c50e-c3a7-7a0d2e616dc4@suse.com>
Subject: Re: [PATCH v7 2/3] xen/events: modify struct evtchn layout
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-3-jgross@suse.com>
 <440bced0-97ec-33c4-f6fa-01850777e5c2@suse.com>
 <696314b9-18e3-e18d-10f2-a510e19438da@suse.com>
 <9017e6a2-2fa0-4093-32a8-a256a58f4a33@suse.com>
In-Reply-To: <9017e6a2-2fa0-4093-32a8-a256a58f4a33@suse.com>

--n0EZJFrZMQQbhjTZEkQA5oQ1kEpObiQhM
Content-Type: multipart/mixed;
 boundary="------------80CFB60A314653583D64E407"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------80CFB60A314653583D64E407
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.11.20 13:37, Jan Beulich wrote:
> On 24.11.2020 13:18, J=C3=BCrgen Gro=C3=9F wrote:
>> On 24.11.20 12:42, Jan Beulich wrote:
>>> On 24.11.2020 08:01, Juergen Gross wrote:
>>>> @@ -94,9 +93,10 @@ struct evtchn
>>>>    #define ECS_VIRQ         5 /* Channel is bound to a virtual IRQ l=
ine.        */
>>>>    #define ECS_IPI          6 /* Channel is bound to a virtual IPI l=
ine.        */
>>>>        u8  state;             /* ECS_* */
>>>> -    u8  xen_consumer:XEN_CONSUMER_BITS; /* Consumer in Xen if nonze=
ro */
>>>
>>> I see no reason to use a full byte for this one; in fact I
>>> was considering whether it, state, and old_state couldn't
>>> share storage (the latest when we run into space issues with
>>> this struct). (In this context I'm also observing that
>>> old_state could get away with just 2 bits, i.e. all three
>>> fields would fit in a single byte.)
>>
>> I think doing further compression now isn't really helping. It would
>> just add more padding bytes and result in larger code.
>=20
> I'm not meaning to ask to widen the use of bitfields right now
> (unless this helps avoiding holes). But I'd like to not see the
> one non-problematic use go away without this really being
> necessary.

Okay.

>=20
>>> Also for all fields you touch anyway, may I ask that you switch to
>>> uint<N>_t or, in the case of "pending", bool?
>>
>> Fine with me.
>>
>> Would you object to switching the whole structure in this regard?
>=20
> I didn't dare to suggest you doing so. So no, I wouldn't mind.
> However, there's more room then for what some would possibly
> call bike shedding: The wider the scope of the conversion you
> do the more relevant it'll become that strictly speaking there
> ought to be (almost?) no use of fixed width types here, as per
> ./CODING_STYLE.

No problem with that.


Juergen

--------------80CFB60A314653583D64E407
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

--------------80CFB60A314653583D64E407--

--n0EZJFrZMQQbhjTZEkQA5oQ1kEpObiQhM--

--TkxJVRfb5WQYg5Sl8K4TnW14HXuhnC4Tt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+9CG8FAwAAAAAACgkQsN6d1ii/Ey8U
2Af/ZAPIasqOKBRPa6YEk2iXCe+fXgeI90o8Rg6ff3+EmQJxMzkbV4PGQ8EqtQZvWcjwxx5MA/VQ
medukuI+6zHkw6VmTNdeVYcYThXWYgAMNYI1hcsWThB423rTASCwuuLRKIF80rYzrEqttQk1eDsF
WUHHT+MASQPPZOdzmkq0dutJs3fImZc8dfq7+1un/AdCjiP1YqFQhsiWu7e3RCpl9GGSZo4hxqmZ
K7za6mcvYEU/3sO8lT5Jv53OMkNVP8Nj0flimVcPiJ83N7FMerI0I+OFs8mJZLL3XsypJ7MdRG4n
wGNtq0Ymq7e9TsLbFCvVwT6m88I4oHZe1bj9qDyg6Q==
=Nl2X
-----END PGP SIGNATURE-----

--TkxJVRfb5WQYg5Sl8K4TnW14HXuhnC4Tt--

