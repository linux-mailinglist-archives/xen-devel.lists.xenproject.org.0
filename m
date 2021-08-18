Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECDE3F0201
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 12:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168178.307044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJ8q-0006u5-PD; Wed, 18 Aug 2021 10:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168178.307044; Wed, 18 Aug 2021 10:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGJ8q-0006r2-Ly; Wed, 18 Aug 2021 10:49:52 +0000
Received: by outflank-mailman (input) for mailman id 168178;
 Wed, 18 Aug 2021 10:49:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jUNG=NJ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGJ8p-0006qw-JS
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 10:49:51 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98285684-d738-4b10-b071-73e9f98b005c;
 Wed, 18 Aug 2021 10:49:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C582E2204C;
 Wed, 18 Aug 2021 10:49:49 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 932C71371C;
 Wed, 18 Aug 2021 10:49:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id nbZEIs3lHGG/LwAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 18 Aug 2021 10:49:49 +0000
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
X-Inumbo-ID: 98285684-d738-4b10-b071-73e9f98b005c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629283789; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NI6Si8vIHuLLAa8EsFZWJYnKwgdkQ0KIbmeMADYMw4w=;
	b=iCiL7s09pZ5D3SM2Vn+L3f/OQZyyuIVme45oYFzm8YxwEHwymHd2EDPGL3jhL9uyPZZ7Rg
	CYomOJy5Khc2NGa7KeYZ95nLPdtlL9C30CFuOkmEN5p7MpF2TuUf5o2NbcQhEUDMTrqJLc
	hcyvyrQsGrvVssegBWHOrtxKlNRiBF0=
Subject: Re: [PATCH] xen/sched: fix get_cpu_idle_time() for smt=0
 suspend/resume
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20210818102136.23797-1-jgross@suse.com>
 <b7cffe58-3ef7-9fc8-a9dc-1c8898104418@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <97bc7ba9-2269-17b6-46a0-8f6a891bb7a8@suse.com>
Date: Wed, 18 Aug 2021 12:49:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b7cffe58-3ef7-9fc8-a9dc-1c8898104418@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ae6mRIJxPWb7bP56r0JX3OefnI4w2XgHV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ae6mRIJxPWb7bP56r0JX3OefnI4w2XgHV
Content-Type: multipart/mixed; boundary="Wofk2lwiFUAhGlfMArpPF7RsS6RtqjKzF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <97bc7ba9-2269-17b6-46a0-8f6a891bb7a8@suse.com>
Subject: Re: [PATCH] xen/sched: fix get_cpu_idle_time() for smt=0
 suspend/resume
References: <20210818102136.23797-1-jgross@suse.com>
 <b7cffe58-3ef7-9fc8-a9dc-1c8898104418@suse.com>
In-Reply-To: <b7cffe58-3ef7-9fc8-a9dc-1c8898104418@suse.com>

--Wofk2lwiFUAhGlfMArpPF7RsS6RtqjKzF
Content-Type: multipart/mixed;
 boundary="------------C78D5E61EDFFA9E95B9E2C46"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C78D5E61EDFFA9E95B9E2C46
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.08.21 12:35, Jan Beulich wrote:
> On 18.08.2021 12:21, Juergen Gross wrote:
>> With smt=3D0 during a suspend/resume cycle of the machine the threads
>> which have been parked before will briefly come up again. This can
>> result in problems e.g. with cpufreq driver being active as this will
>> call into get_cpu_idle_time() for a cpu without initialized scheduler
>> data.
>>
>> Fix that by letting get_cpu_idle_time() deal with this case.
>>
>> Fixes: 132cbe8f35632fb2 ("sched: fix get_cpu_idle_time() with core sch=
eduling")
>> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethings=
lab.com>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsla=
b.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -337,7 +337,7 @@ uint64_t get_cpu_idle_time(unsigned int cpu)
>>       struct vcpu_runstate_info state =3D { 0 };
>>       const struct vcpu *v =3D idle_vcpu[cpu];
>>  =20
>> -    if ( cpu_online(cpu) && v )
>> +    if ( cpu_online(cpu) && v && get_sched_res(cpu) )
>>           vcpu_runstate_get(v, &state);
>=20
> My earlier question was aiming at getting rid of the (now) middle part
> of the condition; I thought this may be okay to do as a secondary chang=
e
> here. But perhaps you intentionally left it there, so I'm unsure whethe=
r
> to suggest to make the adjustment while committing (awaiting a
> maintainer ack first anyway).

Ah, okay. Yes, I think the test of v being non-NULL can be removed.


Juergen

--------------C78D5E61EDFFA9E95B9E2C46
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

--------------C78D5E61EDFFA9E95B9E2C46--

--Wofk2lwiFUAhGlfMArpPF7RsS6RtqjKzF--

--ae6mRIJxPWb7bP56r0JX3OefnI4w2XgHV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEc5c0FAwAAAAAACgkQsN6d1ii/Ey/q
WAf/d3Tw5oCS0XEYxVl6E3AnWmfDnvPYAPioNk5zqb+ezQ+vJnYooVbTFUhZofre6g4e3lRf+jEl
HPLejJAja4pTfKlAJjCzvHlVjyevKl8pEhmmmRpMahDjGX9cPeT6QKn/McIeVbfsBC9ppa9jLnwt
ZBq1HgblgginJWnFP0TwM4tAJbrvrtsu9U3qCJCd+3WOs/ZkI+enVB0gk31OKp7k/RaKcIL3Z6uK
tnpgai9IckrYe8hoynFw7up3apLKk4WxVJFu+iQnh3twhuLMPpc3T1Y0CIsG2+OlW2WH8I7oJ2CM
7TR4kgEwphnkysa9yRq1uY3j2VZDUA0murg+HDRqbA==
=GWUl
-----END PGP SIGNATURE-----

--ae6mRIJxPWb7bP56r0JX3OefnI4w2XgHV--

