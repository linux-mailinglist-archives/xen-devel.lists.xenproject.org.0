Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0578139DEAF
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 16:25:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137993.255549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGBs-00066z-EG; Mon, 07 Jun 2021 14:25:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137993.255549; Mon, 07 Jun 2021 14:25:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqGBs-00064X-B1; Mon, 07 Jun 2021 14:25:20 +0000
Received: by outflank-mailman (input) for mailman id 137993;
 Mon, 07 Jun 2021 14:25:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqGBr-00064R-6A
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 14:25:19 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4bcc4fc-546f-4bdb-ac99-3a7a4119c700;
 Mon, 07 Jun 2021 14:25:18 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4C07B21A90;
 Mon,  7 Jun 2021 14:25:17 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1D890118DD;
 Mon,  7 Jun 2021 14:25:17 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DM0XBk0svmCLRAAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 07 Jun 2021 14:25:17 +0000
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
X-Inumbo-ID: d4bcc4fc-546f-4bdb-ac99-3a7a4119c700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623075917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QrS2ZCPVVXB4Gk0dKMr4c0X6qluZr4NnpkXD2Y/Cljw=;
	b=fe1oz8Uh8E6GG33j9kN8O3U5nS+krWQQFQTIIm8HFysXqb3CkYwhBDOr4m2EKdXjSU+ASp
	PHujXktMMrIRR+M8LRCAjZmPtnf6YwJRMBWFR8soFf25on0Md2OViWoeuCwghImz7kA7c5
	4lkbJHlcBWzvVP0u0ey/Jh2Ou1xMFX8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623075917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QrS2ZCPVVXB4Gk0dKMr4c0X6qluZr4NnpkXD2Y/Cljw=;
	b=fe1oz8Uh8E6GG33j9kN8O3U5nS+krWQQFQTIIm8HFysXqb3CkYwhBDOr4m2EKdXjSU+ASp
	PHujXktMMrIRR+M8LRCAjZmPtnf6YwJRMBWFR8soFf25on0Md2OViWoeuCwghImz7kA7c5
	4lkbJHlcBWzvVP0u0ey/Jh2Ou1xMFX8=
Subject: Re: [PATCH v2] tools/libs/guest: fix save and restore of pv domains
 after 32-bit de-support
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
References: <20210607130005.5475-1-jgross@suse.com>
 <07fad6f2-3ace-044e-72af-a470f6864c00@suse.com>
 <d9251ebe-67e0-2b9e-3031-202f5f27d3c7@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <4d6f35fa-e3f6-fc06-8bfd-76dc2cb8fd91@suse.com>
Date: Mon, 7 Jun 2021 16:25:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d9251ebe-67e0-2b9e-3031-202f5f27d3c7@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KM5nSRNTReuDe2qNVDJLH8pB5cskeF6qR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KM5nSRNTReuDe2qNVDJLH8pB5cskeF6qR
Content-Type: multipart/mixed; boundary="awEKbKwt5imb2WTawDh3IXnR0IsoiNF5c";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Message-ID: <4d6f35fa-e3f6-fc06-8bfd-76dc2cb8fd91@suse.com>
Subject: Re: [PATCH v2] tools/libs/guest: fix save and restore of pv domains
 after 32-bit de-support
References: <20210607130005.5475-1-jgross@suse.com>
 <07fad6f2-3ace-044e-72af-a470f6864c00@suse.com>
 <d9251ebe-67e0-2b9e-3031-202f5f27d3c7@citrix.com>
In-Reply-To: <d9251ebe-67e0-2b9e-3031-202f5f27d3c7@citrix.com>

--awEKbKwt5imb2WTawDh3IXnR0IsoiNF5c
Content-Type: multipart/mixed;
 boundary="------------F71D68ADF40ECAAAC383D54A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F71D68ADF40ECAAAC383D54A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.06.21 15:59, Andrew Cooper wrote:
> On 07/06/2021 14:04, Jan Beulich wrote:
>> On 07.06.2021 15:00, Juergen Gross wrote:
>>> --- a/tools/libs/guest/xg_sr_common_x86_pv.c
>>> +++ b/tools/libs/guest/xg_sr_common_x86_pv.c
>>> @@ -149,27 +149,32 @@ int x86_pv_map_m2p(struct xc_sr_context *ctx)
>>>  =20
>>>       ctx->x86.pv.nr_m2p_frames =3D (M2P_CHUNK_SIZE >> PAGE_SHIFT) * =
m2p_chunks;
>>>  =20
>>> +    if ( ctx->x86.pv.levels =3D=3D 3 )
>>> +    {
>> With this opening brace you no longer need ...
>>
>>>   #ifdef __i386__
>>> -    /* 32 bit toolstacks automatically get the compat m2p */
>>> -    ctx->x86.pv.compat_m2p_mfn0 =3D entries[0].mfn;
>>> +        /* 32 bit toolstacks automatically get the compat m2p */
>>> +        ctx->x86.pv.compat_m2p_mfn0 =3D entries[0].mfn;
>>>   #else
>>> -    /* 64 bit toolstacks need to ask Xen specially for it */
>>> -    {
>> ... this one, and hence you could avoid re-indenting ...
>>
>>> -        struct xen_machphys_mfn_list xmml =3D {
>>> -            .max_extents =3D 1,
>>> -            .extent_start =3D { &ctx->x86.pv.compat_m2p_mfn0 },
>>> -        };
>>> -
>>> -        rc =3D do_memory_op(xch, XENMEM_machphys_compat_mfn_list,
>>> -                          &xmml, sizeof(xmml));
>>> -        if ( rc || xmml.nr_extents !=3D 1 )
>>> +        /* 64 bit toolstacks need to ask Xen specially for it */
>>>           {
>>> -            PERROR("Failed to get compat mfn list from Xen");
>>> -            rc =3D -1;
>>> -            goto err;
>>> +            struct xen_machphys_mfn_list xmml =3D {
>>> +                .max_extents =3D 1,
>>> +                .extent_start =3D { &ctx->x86.pv.compat_m2p_mfn0 },
>>> +            };
>>> +
>>> +            rc =3D do_memory_op(xch, XENMEM_machphys_compat_mfn_list=
,
>>> +                              &xmml, sizeof(xmml));
>>> +            if ( rc || xmml.nr_extents !=3D 1 )
>>> +            {
>>> +                PERROR("Failed to get compat mfn list from Xen");
>>> +                rc =3D -1;
>>> +                goto err;
>>> +            }
>> ... all of this. Preferably with such reduced code churn,
>> still/again:
>=20
> I agree.=C2=A0 I can fix on commit, if you're happy with that.

I'm fine with that.

>=20
> Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
>=20

Thanks,

Juergen

--------------F71D68ADF40ECAAAC383D54A
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

--------------F71D68ADF40ECAAAC383D54A--

--awEKbKwt5imb2WTawDh3IXnR0IsoiNF5c--

--KM5nSRNTReuDe2qNVDJLH8pB5cskeF6qR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC+LEwFAwAAAAAACgkQsN6d1ii/Ey/b
iAgAhFgU5XFeBFKH+DAcz9MgDupd29OeWVkVE0c8GQ4SCdOxIxV6xJAhlKYV1pS5MHdXyMsH0jDi
B+KVoZVXgiq0SksCt6E7q6erWtjBkbdeKkvJu7r/w3mLdM6iwyXvIWG2vK9i/jm9+XuXi2ltxj3/
S9v/sA/idf4YX7NHsAYBtwfu5w93fexAJCham7J/7lE0WFuK9kZeOkO63t1ZHj0n075Fp3x7pAOT
uSrwLr2QFkb3yrIxbMkNl7PREhI4n/4aXdpjSRsdd0ADP0bv6QaxSUNZmvZC1fn6d6ajGzAYznrW
juJLu6ePtm6KvTZIDO/HjQB34+YJ/pTs7sJpBFgTgQ==
=jdb7
-----END PGP SIGNATURE-----

--KM5nSRNTReuDe2qNVDJLH8pB5cskeF6qR--

