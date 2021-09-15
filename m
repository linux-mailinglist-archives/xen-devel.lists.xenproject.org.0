Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E30340C4DF
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 14:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187544.336446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQTdg-000342-PF; Wed, 15 Sep 2021 12:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187544.336446; Wed, 15 Sep 2021 12:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQTdg-00030y-LH; Wed, 15 Sep 2021 12:03:44 +0000
Received: by outflank-mailman (input) for mailman id 187544;
 Wed, 15 Sep 2021 12:03:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwCH=OF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQTdf-0002yV-8Y
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 12:03:43 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e30529ed-5b9f-496f-bba0-b9d1997f84a0;
 Wed, 15 Sep 2021 12:03:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0F69A20187;
 Wed, 15 Sep 2021 12:03:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDABD13C29;
 Wed, 15 Sep 2021 12:03:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sIa1NBfhQWFYLgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Sep 2021 12:03:35 +0000
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
X-Inumbo-ID: e30529ed-5b9f-496f-bba0-b9d1997f84a0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631707416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ENhmOeCtsm5hfqnNK954lymn6nLMXDrcKR3qancrAyk=;
	b=JbRqSckOJdoT1BrjCsXvigpfRJUYL2Wj9ROLqtKkvTLGYrlfvmyIS/tHSvvKx/dfX0Ma1S
	UF9ZFAjxmMcrNt6QbgMQ0lAAuZADFJO78nYCNBE8Dx3wN4z4lQgxmvIeclDz2W2Kn3/dMF
	lQBYvEqjc7HmdSy7wtLybB51/WxVjv8=
Subject: Re: [PATCH] mini-os: xenbus: support large messages
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20210818152610.6114-1-jgross@suse.com>
 <20210914231742.pxpac2lhp2kk5ook@begin>
 <2304b885-434c-8a19-78e0-14637a4adee3@suse.com>
 <20210915112020.iy6vqn4qcvtbohyi@begin>
From: Juergen Gross <jgross@suse.com>
Message-ID: <20e4fa88-74a8-35a0-dffa-fd5e5765fe0d@suse.com>
Date: Wed, 15 Sep 2021 14:03:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210915112020.iy6vqn4qcvtbohyi@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ScL0Va8R8fzjJJz3Nv9BCmmjeBa35z0nA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ScL0Va8R8fzjJJz3Nv9BCmmjeBa35z0nA
Content-Type: multipart/mixed; boundary="CMMeocb5gxwlK7fdJkh0AgWtsvXXjTXOp";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <20e4fa88-74a8-35a0-dffa-fd5e5765fe0d@suse.com>
Subject: Re: [PATCH] mini-os: xenbus: support large messages
References: <20210818152610.6114-1-jgross@suse.com>
 <20210914231742.pxpac2lhp2kk5ook@begin>
 <2304b885-434c-8a19-78e0-14637a4adee3@suse.com>
 <20210915112020.iy6vqn4qcvtbohyi@begin>
In-Reply-To: <20210915112020.iy6vqn4qcvtbohyi@begin>

--CMMeocb5gxwlK7fdJkh0AgWtsvXXjTXOp
Content-Type: multipart/mixed;
 boundary="------------A0BD0CE41CC0BB783A29960C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A0BD0CE41CC0BB783A29960C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.09.21 13:20, Samuel Thibault wrote:
> Juergen Gross, le mer. 15 sept. 2021 12:48:44 +0200, a ecrit:
>> On 15.09.21 01:17, Samuel Thibault wrote:
>>>> +        prod =3D xenstore_buf->rsp_prod;
>>>> +        DEBUG("Rsp_cons %d, rsp_prod %d.\n", xenstore_buf->rsp_cons=
, prod);
>>>> +        size =3D min(len - off, prod - xenstore_buf->rsp_cons);
>>>> +        memcpy_from_ring(xenstore_buf->rsp, buf + off,
>>>> +                         MASK_XENSTORE_IDX(xenstore_buf->rsp_cons),=
 size);
>>>> +        off +=3D size;
>>>> +        notify =3D (xenstore_buf->rsp_cons + XENSTORE_RING_SIZE =3D=
=3D
>>>> +                  xenstore_buf->rsp_prod);
>>>
>>> This looks odd to me?  We want to notify as soon as the ring is empty=
,
>>> which can happen at any place in the ring right?
>>
>> No, we want to notify if the ring was full and is about to gain some
>> space again, as the other side was probably not able to put all data
>> in and is now waiting for more space to become available.
>=20
> Ok, that said, the producer may fill the ring between this test and
> the rsp_cons update, and thus the producer will go sleep and here the
> consumer will not notice it and thus never notify it.
>=20
> So we really need to make the test after the rsp_cons update, like Linu=
x
> does:
>=20
>>> Linux' code uses (intf->rsp_prod - cons >=3D XENSTORE_RING_SIZE), *af=
ter*
>>> the rsp_cons increase.

Oh, you are right, of course. How could I overlook this?

Thanks,


Juergen

--------------A0BD0CE41CC0BB783A29960C
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

--------------A0BD0CE41CC0BB783A29960C--

--CMMeocb5gxwlK7fdJkh0AgWtsvXXjTXOp--

--ScL0Va8R8fzjJJz3Nv9BCmmjeBa35z0nA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFB4RcFAwAAAAAACgkQsN6d1ii/Ey8A
ywf/RgULYRjT5cSCcoBw6DISFWGq+0kG0JV/52VpYOvEuHQ4QB2jfdSW2FnhiI+zi7AhhmurF2fI
W9VacbvdcDjQU6YLWXVRGQkirLAIg9LPZxtE8XTU9kZ0GS+PKsfAuKvm0YmmNVzT9tltsPMRiivL
aqzHi4sdioQhpBxMi2uUpTqZhoX1k2T3uokEA/WkGOQpaWFxsVUuy+9uwu8hndtJY07leHazIpun
X5oH5XuBoJOOhH9XvRfXOZuZ6Deq+WbzKnyZLY2eCeOM9L5uwK6On/awQe+zuRgvVZ1LTKZ0JxXS
wgIfraKDHxZ77q1+acbEVg706lemRhj2Xw3PHzPcCA==
=0vWU
-----END PGP SIGNATURE-----

--ScL0Va8R8fzjJJz3Nv9BCmmjeBa35z0nA--

