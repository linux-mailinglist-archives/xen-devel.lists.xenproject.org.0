Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B5E39810A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 08:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135445.251594 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKET-0000eW-SW; Wed, 02 Jun 2021 06:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135445.251594; Wed, 02 Jun 2021 06:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKET-0000ad-Os; Wed, 02 Jun 2021 06:20:01 +0000
Received: by outflank-mailman (input) for mailman id 135445;
 Wed, 02 Jun 2021 06:20:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loKES-0000aX-0r
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:20:00 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a07cae91-12df-49d9-b1e1-9af4394b61ba;
 Wed, 02 Jun 2021 06:19:59 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B2C821919;
 Wed,  2 Jun 2021 06:19:58 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 10827118DD;
 Wed,  2 Jun 2021 06:19:58 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id jprSAg4jt2BrPwAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 06:19:58 +0000
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
X-Inumbo-ID: a07cae91-12df-49d9-b1e1-9af4394b61ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622614798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UOKzZZM9iU38AIsLSlj43HUq4PROSnlYG9my9vpYe3o=;
	b=dF8TjfRLF4prMmht92elvtsVIS/gVXocArH+2I/aKSDpZl3WAZpsewduNb0Lrq661cO3B/
	+WDP4mS4MezxwI/co2pAZ3juoMhCP/hMvc8cYxvVcLdo7nluqRNWq1dKRsJCrkCQ8eMhlQ
	NADqdG16C5W2LJ9iImSwuZxHOXCm1sQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622614798; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UOKzZZM9iU38AIsLSlj43HUq4PROSnlYG9my9vpYe3o=;
	b=dF8TjfRLF4prMmht92elvtsVIS/gVXocArH+2I/aKSDpZl3WAZpsewduNb0Lrq661cO3B/
	+WDP4mS4MezxwI/co2pAZ3juoMhCP/hMvc8cYxvVcLdo7nluqRNWq1dKRsJCrkCQ8eMhlQ
	NADqdG16C5W2LJ9iImSwuZxHOXCm1sQ=
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-2-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210601 01/38] tools: add API to work with sevaral bits
 at once
Message-ID: <33fa0a7f-360e-b5fc-ee0f-ad2ff98496a1@suse.com>
Date: Wed, 2 Jun 2021 08:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601161118.18986-2-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xcmw2V1XBphYYyPiNu60stHLrOUtOC2lC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xcmw2V1XBphYYyPiNu60stHLrOUtOC2lC
Content-Type: multipart/mixed; boundary="9TlvDplAWW3rMpk1DgyctGLmUyzou1tnA";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <33fa0a7f-360e-b5fc-ee0f-ad2ff98496a1@suse.com>
Subject: Re: [PATCH v20210601 01/38] tools: add API to work with sevaral bits
 at once
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-2-olaf@aepfle.de>
In-Reply-To: <20210601161118.18986-2-olaf@aepfle.de>

--9TlvDplAWW3rMpk1DgyctGLmUyzou1tnA
Content-Type: multipart/mixed;
 boundary="------------F254D6538E081A658275154C"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F254D6538E081A658275154C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.06.21 18:10, Olaf Hering wrote:
> Introduce new API to test if a fixed number of bits is clear or set,
> and clear or set them all at once.

More precise: the new functions check whether BITS_PER_LONG bits are
set or clear.

> The caller has to make sure the input bitnumber is a multiply of BITS_P=
ER_LONG.

s/multiply/multiple/

>=20
> This API avoids the loop over each bit in a known range just to see
> if all of them are either clear or set.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   tools/libs/ctrl/xc_bitops.h | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
>=20
> diff --git a/tools/libs/ctrl/xc_bitops.h b/tools/libs/ctrl/xc_bitops.h
> index f0bac4a071..92f38872fb 100644
> --- a/tools/libs/ctrl/xc_bitops.h
> +++ b/tools/libs/ctrl/xc_bitops.h
> @@ -77,4 +77,29 @@ static inline void bitmap_or(void *_dst, const void =
*_other,
>           dst[i] |=3D other[i];
>   }
>  =20
> +static inline int test_bit_long_set(unsigned long nr_base, const void =
*_addr)

Make return type bool (here and below)?

> +{
> +    const unsigned long *addr =3D _addr;
> +    unsigned long val =3D addr[nr_base / BITS_PER_LONG];

Add a blank line here (same below).

> +    return val =3D=3D ~0; > +}
> +
> +static inline int test_bit_long_clear(unsigned long nr_base, const voi=
d *_addr)
> +{
> +    const unsigned long *addr =3D _addr;
> +    unsigned long val =3D addr[nr_base / BITS_PER_LONG];
> +    return val =3D=3D 0;
> +}
> +
> +static inline void clear_bit_long(unsigned long nr_base, void *_addr)
> +{
> +    unsigned long *addr =3D _addr;
> +    addr[nr_base / BITS_PER_LONG] =3D 0;
> +}
> +
> +static inline void set_bit_long(unsigned long nr_base, void *_addr)
> +{
> +    unsigned long *addr =3D _addr;
> +    addr[nr_base / BITS_PER_LONG] =3D ~0;
> +}
>   #endif  /* XC_BITOPS_H */
>=20


Juergen

--------------F254D6538E081A658275154C
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

--------------F254D6538E081A658275154C--

--9TlvDplAWW3rMpk1DgyctGLmUyzou1tnA--

--xcmw2V1XBphYYyPiNu60stHLrOUtOC2lC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3Iw0FAwAAAAAACgkQsN6d1ii/Ey+J
iAf+LdJFaUf852kkkPbmVwA173TnZYwiLW8646/Rtcmx0JPAUiBqCVKSu9C1D7PY6C3AZZ3JJ51V
BlqhDj0uhqqX2pULWkwlBxaxTUJA5EOREh8my0EVJt3WN8a0vBre3BFq9ccPjz1tGxjUmQgMn9n+
2+6ls7jkq++eM9Bl38iD3BbYvsSYHy7zdFhfgL6Bo7xgYHeQOZMgaG/EQLW8DNQVL2Z9R1zSVBkf
Z5FdIHME1rXu2GP6DkcT7TCMm6GWwFnMWqvNRULUcKVmHRO+/xr0OVWQup2erxNQy9netLNJz8hf
tQv+HC3PTfoMxUgU0TxXe3EvOpGZx08/BBPMHITiSg==
=K8OR
-----END PGP SIGNATURE-----

--xcmw2V1XBphYYyPiNu60stHLrOUtOC2lC--

