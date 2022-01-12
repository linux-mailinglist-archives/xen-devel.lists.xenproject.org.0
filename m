Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E120448C31E
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 12:30:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256557.440392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bpu-00033J-VS; Wed, 12 Jan 2022 11:30:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256557.440392; Wed, 12 Jan 2022 11:30:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7bpu-000317-Rb; Wed, 12 Jan 2022 11:30:38 +0000
Received: by outflank-mailman (input) for mailman id 256557;
 Wed, 12 Jan 2022 11:30:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7bpt-0002ze-1W
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 11:30:37 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f7b8d60-739b-11ec-bd6f-bfb69f65cdc7;
 Wed, 12 Jan 2022 12:30:36 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A36E31F3CE;
 Wed, 12 Jan 2022 11:30:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FC4E13B42;
 Wed, 12 Jan 2022 11:30:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id T1T4Hdu73mEtFAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 11:30:35 +0000
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
X-Inumbo-ID: 0f7b8d60-739b-11ec-bd6f-bfb69f65cdc7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641987035; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=admoSzsRYndfJq4zb3YGkUaexcFGyJbMdWcz9wV5FAQ=;
	b=tehbMhfzxhPP4fhvUV8T6PZ8N3Ob2LyG6+mZ7d+veBOxV/Nsw/qCJebg2+kPYKYDhf9sXy
	k9jID/HjxSuPZ0O5E6qevGoQm3ZyluEkP6Hjp3kz/2rqw0fHNUjZIpiRyXGMoXLQFzIuOR
	Ac0rridz46sWc1p5gojAYPVpNvU59Uk=
Subject: Re: [PATCH v2 09/12] mini-os: use file_ops and get_file_from_fd() for
 console
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-10-jgross@suse.com>
 <bfa154a6-88e3-8ce9-d959-7220ea7a7e64@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <fc1e1631-2906-b3d5-19e0-d2fedc268422@suse.com>
Date: Wed, 12 Jan 2022 12:30:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <bfa154a6-88e3-8ce9-d959-7220ea7a7e64@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="AkqgYSlS9SXMIHsB11ds2eZ8s0lV1f7Uh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--AkqgYSlS9SXMIHsB11ds2eZ8s0lV1f7Uh
Content-Type: multipart/mixed; boundary="g23jRSqbHMKv1xLKeEuiJH082y0aada46";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
Cc: samuel.thibault@ens-lyon.org, wl@xen.org
Message-ID: <fc1e1631-2906-b3d5-19e0-d2fedc268422@suse.com>
Subject: Re: [PATCH v2 09/12] mini-os: use file_ops and get_file_from_fd() for
 console
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-10-jgross@suse.com>
 <bfa154a6-88e3-8ce9-d959-7220ea7a7e64@srcf.net>
In-Reply-To: <bfa154a6-88e3-8ce9-d959-7220ea7a7e64@srcf.net>

--g23jRSqbHMKv1xLKeEuiJH082y0aada46
Content-Type: multipart/mixed;
 boundary="------------688BF55A7E77BE8BB995E931"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------688BF55A7E77BE8BB995E931
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.01.22 12:23, Andrew Cooper wrote:
> On 11/01/2022 15:12, Juergen Gross wrote:
>> +static int savefile_write(int fd, const void *buf, size_t nbytes)
>> +{
>> +    int ret =3D 0, tot =3D nbytes;
>> +    struct file *file =3D get_file_from_fd(fd);
>> +
>> +    while ( nbytes > 0 )
>> +    {
>> +        ret =3D xencons_ring_send(file->dev, (char *)buf, nbytes);
>> +        nbytes -=3D ret;
>> +        buf =3D (char *)buf + ret;
>> +    }
>> +
>> +    return tot - nbytes;
>> +}
>> +
>> +static int console_write(int fd, const void *buf, size_t nbytes)
>> +{
>> +    struct file *file =3D get_file_from_fd(fd);
>> +
>> +    console_print(file->dev, (char *)buf, nbytes);
>=20
> I've just noticed this while committing the previous series, and I know=

> it is a preexisting bug, but the casts here are utterly unsafe, because=

> they're casting away constness.
>=20
> console_print() is easy to fix, and just requires a prototype
> adjustment.=C2=A0 That said, it also desperately also needs to fix 'int=

> length' to size_t to avoid problems with negative length VLAs on the st=
ack.
>=20
> xencons_ring_send() already takes const char *, so I'm pretty sure you
> can just drop the casts here.=C2=A0 It too ought to not truncate size_t=
 bytes
> to "unsigned".

Okay, will do that.


Juergen


--------------688BF55A7E77BE8BB995E931
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

--------------688BF55A7E77BE8BB995E931--

--g23jRSqbHMKv1xLKeEuiJH082y0aada46--

--AkqgYSlS9SXMIHsB11ds2eZ8s0lV1f7Uh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHeu9oFAwAAAAAACgkQsN6d1ii/Ey8d
aQf/axVxv8M94puJS0qP9I7GI4H/meJSveItNGxAXRAvqileOpntsKEv4dsPWqSgvfEYOb8h4ER7
mU5DafKbK2tJdVbnu+wpwgPrZwg0I6VICngUWLdGCis9oAfN5WxTpKY5DrO40Ihfnr1pwAnt5hX+
NT2jMz55TuaqOd52twMV1GmSjIBqMdmYooAuRUGGkgcX3V6WCkM3Z6TLj7jvYmdu24pEjP0UIKVB
w6KHSulxSvLG4NK7e65iPYdOFOzCbJyrbE7Hr8JLA1qYLAP7nbQkKFIIc+rj1fQl41BnESVn2QAJ
buWeS3vUPtxnOU/BxJ/omed2zZ0zK6cm2pL28U2xIQ==
=u+A8
-----END PGP SIGNATURE-----

--AkqgYSlS9SXMIHsB11ds2eZ8s0lV1f7Uh--

