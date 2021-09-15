Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 664FF40C3F2
	for <lists+xen-devel@lfdr.de>; Wed, 15 Sep 2021 12:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187476.336353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSTG-0007eo-1I; Wed, 15 Sep 2021 10:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187476.336353; Wed, 15 Sep 2021 10:48:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQSTF-0007c7-U9; Wed, 15 Sep 2021 10:48:53 +0000
Received: by outflank-mailman (input) for mailman id 187476;
 Wed, 15 Sep 2021 10:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XwCH=OF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mQSTE-0007Z2-RT
 for xen-devel@lists.xenproject.org; Wed, 15 Sep 2021 10:48:52 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 804632c8-1612-11ec-b4f9-12813bfff9fa;
 Wed, 15 Sep 2021 10:48:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9A0EF2220E;
 Wed, 15 Sep 2021 10:48:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7661113C2F;
 Wed, 15 Sep 2021 10:48:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7bKnG43PQWEmBAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Sep 2021 10:48:45 +0000
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
X-Inumbo-ID: 804632c8-1612-11ec-b4f9-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631702925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iTKSaRtAvb4MPwNlHHAs/1gnbRIWxnDB5cbkIAO1GYk=;
	b=t/rojrg2wrxx4pRgBWYGWnJ2Ze410a7OmVESnyHsEw5REFzBJObacrRkBjT+2UP7rqPRbY
	zBEkWKtm4HWZeH7du5fRizxnFtJWmqoDX5BO5eqNKcmF74RzIIM+UB0jtY9BK9kP9rOM7b
	kOu98XwmIq2F8Baq8wo98+MgEI4Jfa8=
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20210818152610.6114-1-jgross@suse.com>
 <20210914231742.pxpac2lhp2kk5ook@begin>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] mini-os: xenbus: support large messages
Message-ID: <2304b885-434c-8a19-78e0-14637a4adee3@suse.com>
Date: Wed, 15 Sep 2021 12:48:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210914231742.pxpac2lhp2kk5ook@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="a6FiRo5rvrV8rM1QpL0b6BtntmpTnTYqB"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--a6FiRo5rvrV8rM1QpL0b6BtntmpTnTYqB
Content-Type: multipart/mixed; boundary="dCjWhK2Ru03rTrBBaj7QlVmsqxnePxHnB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <2304b885-434c-8a19-78e0-14637a4adee3@suse.com>
Subject: Re: [PATCH] mini-os: xenbus: support large messages
References: <20210818152610.6114-1-jgross@suse.com>
 <20210914231742.pxpac2lhp2kk5ook@begin>
In-Reply-To: <20210914231742.pxpac2lhp2kk5ook@begin>

--dCjWhK2Ru03rTrBBaj7QlVmsqxnePxHnB
Content-Type: multipart/mixed;
 boundary="------------4AF975DB5AFDAF92EAD2B51A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4AF975DB5AFDAF92EAD2B51A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.09.21 01:17, Samuel Thibault wrote:
> Hello,
>=20
> Thanks for having worked on this!
>=20
> Juergen Gross, le mer. 18 ao=C3=BBt 2021 17:26:10 +0200, a ecrit:
>> +static void xenbus_read_data(char *buf, unsigned int len)
>> +{
>> +    unsigned int off =3D 0;
>> +    unsigned int prod;
>> +    unsigned int size;
>> +    int notify;
>> +
>> +    while (off !=3D len)
>> +    {
>> +        if (xenstore_buf->rsp_prod =3D=3D xenstore_buf->rsp_cons)
>> +            wait_event(xb_waitq,
>> +                       xenstore_buf->rsp_prod !=3D xenstore_buf->rsp_=
cons);
>=20
> The if is redundant since wait_event already tests it.

Ah, right.

>=20
>> +        prod =3D xenstore_buf->rsp_prod;
>> +        DEBUG("Rsp_cons %d, rsp_prod %d.\n", xenstore_buf->rsp_cons, =
prod);
>> +        size =3D min(len - off, prod - xenstore_buf->rsp_cons);
>> +        memcpy_from_ring(xenstore_buf->rsp, buf + off,
>> +                         MASK_XENSTORE_IDX(xenstore_buf->rsp_cons), s=
ize);
>> +        off +=3D size;
>> +        notify =3D (xenstore_buf->rsp_cons + XENSTORE_RING_SIZE =3D=3D=

>> +                  xenstore_buf->rsp_prod);
>=20
> This looks odd to me?  We want to notify as soon as the ring is empty,
> which can happen at any place in the ring right?

No, we want to notify if the ring was full and is about to gain some
space again, as the other side was probably not able to put all data
in and is now waiting for more space to become available.

>=20
> Linux' code uses (intf->rsp_prod - cons >=3D XENSTORE_RING_SIZE), *afte=
r*
> the rsp_cons increase.
>=20
>> +        rmb();
>=20
> rmb() must be placed before memcpy_from_ring, to make sure that the dat=
a
> we read from the buffer is up-to-date according to the read we made fro=
m
> rsp_prod.

Ah, yes. Thanks for spotting that one!

>=20
> The rest seems ok to me.

Thanks,


Juergen

--------------4AF975DB5AFDAF92EAD2B51A
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

--------------4AF975DB5AFDAF92EAD2B51A--

--dCjWhK2Ru03rTrBBaj7QlVmsqxnePxHnB--

--a6FiRo5rvrV8rM1QpL0b6BtntmpTnTYqB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFBz4wFAwAAAAAACgkQsN6d1ii/Ey+l
dQf6ApRTwp9ksBqlRW19px1aRTw+8f8odlRkxEUfzEj0AFav0/wyCygTBCSdWev93acVbAF2Uo+T
czuUxY6dWAiPdxrYS0XzfoG8C+Pq8TMDmxt+nl582VSMwDxLJzYIkZmwh0897je9jr86m1x5a2lS
EnpBiZn0UJvBiYTn5cP6ocFWA6at5vW88fT9UmWX6NBwguH9u9y4Y9ZV7Wv8unJKyNjtsQ7mKGgA
PL5+2yxM8Mwxvv1WCCT7fee7AYF//gpX/CYyZVe2nw5Chjf64NvoLJBLnVIMMGrn6SH46xx+ba3H
cE81xv80CGJsiJWZJf+8hHt6mD0lQ1Aj1uWsLbKbCg==
=Isq2
-----END PGP SIGNATURE-----

--a6FiRo5rvrV8rM1QpL0b6BtntmpTnTYqB--

