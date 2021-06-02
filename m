Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F74639827D
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:03:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135539.251835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuS-0008QW-5K; Wed, 02 Jun 2021 07:03:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135539.251835; Wed, 02 Jun 2021 07:03:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKuR-0008Nn-Tt; Wed, 02 Jun 2021 07:03:23 +0000
Received: by outflank-mailman (input) for mailman id 135539;
 Wed, 02 Jun 2021 07:03:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loKqX-0007A2-DI
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:59:21 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e37098d-3c97-4c7c-a59d-1bc383dcfcf9;
 Wed, 02 Jun 2021 06:59:15 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 578F01FD2D;
 Wed,  2 Jun 2021 06:59:14 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 2A94E118DD;
 Wed,  2 Jun 2021 06:59:14 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 4HqCCEIst2AxUQAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 06:59:14 +0000
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
X-Inumbo-ID: 5e37098d-3c97-4c7c-a59d-1bc383dcfcf9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622617154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdBvG+0FsUAmReTO/XftE6HTFmGjRf0uXjCMPsQH1nM=;
	b=S/tQZEvbXcTqFoE3ou9CnoeJagiLipzTe9C+1VjHRVvajWC/ApbYROkH0XgIOgV+c5KtjZ
	2MhJP/Budy1TeXOv/tbghfG8b5S9R6U00I/UtUsr9HIomY2QZdAVC6MMLiEGtjvc/Iaq1B
	dBsrFoV3/2F6Af/wdN9U2AVMRdVRlNA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622617154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rdBvG+0FsUAmReTO/XftE6HTFmGjRf0uXjCMPsQH1nM=;
	b=S/tQZEvbXcTqFoE3ou9CnoeJagiLipzTe9C+1VjHRVvajWC/ApbYROkH0XgIOgV+c5KtjZ
	2MhJP/Budy1TeXOv/tbghfG8b5S9R6U00I/UtUsr9HIomY2QZdAVC6MMLiEGtjvc/Iaq1B
	dBsrFoV3/2F6Af/wdN9U2AVMRdVRlNA=
Subject: Re: [PATCH v20210601 07/38] tools: unify type checking for data pfns
 in migration stream
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-8-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
Date: Wed, 2 Jun 2021 08:59:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601161118.18986-8-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Qbsz8S2ZeH31Pb7jaHGGo8aAeWhDzmbty"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Qbsz8S2ZeH31Pb7jaHGGo8aAeWhDzmbty
Content-Type: multipart/mixed; boundary="D7PqIiafqrscaQG9vey6UULGmaCe3LuDX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
Subject: Re: [PATCH v20210601 07/38] tools: unify type checking for data pfns
 in migration stream
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-8-olaf@aepfle.de>
In-Reply-To: <20210601161118.18986-8-olaf@aepfle.de>

--D7PqIiafqrscaQG9vey6UULGmaCe3LuDX
Content-Type: multipart/mixed;
 boundary="------------599F303F92C22A3F17171267"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------599F303F92C22A3F17171267
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.06.21 18:10, Olaf Hering wrote:
> Introduce a helper which decides if a given pfn type has data
> for the migration stream.
>=20
> No change in behavior intended.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   tools/libs/saverestore/common.h  | 17 ++++++++++++++++
>   tools/libs/saverestore/restore.c | 34 +++++--------------------------=
-
>   tools/libs/saverestore/save.c    | 14 ++-----------
>   3 files changed, 24 insertions(+), 41 deletions(-)
>=20
> diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/c=
ommon.h
> index 36946e5d48..50a8479d39 100644
> --- a/tools/libs/saverestore/common.h
> +++ b/tools/libs/saverestore/common.h
> @@ -467,6 +467,23 @@ int populate_pfns(struct xc_sr_context *ctx, unsig=
ned int count,
>   /* Handle a STATIC_DATA_END record. */
>   int handle_static_data_end(struct xc_sr_context *ctx);
>  =20
> +static inline bool page_type_has_stream_data(uint32_t type)
> +{
> +    bool ret;
> +
> +    switch (type)
> +    {
> +    case XEN_DOMCTL_PFINFO_XTAB:
> +    case XEN_DOMCTL_PFINFO_XALLOC:
> +    case XEN_DOMCTL_PFINFO_BROKEN:
> +        ret =3D false;
> +        break;
> +    default:
> +        ret =3D true;
> +        break;
> +    }
> +    return ret;
> +}
>   #endif
>   /*
>    * Local variables:
> diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/=
restore.c
> index cccb0dcb71..700f9e74b5 100644
> --- a/tools/libs/saverestore/restore.c
> +++ b/tools/libs/saverestore/restore.c
> @@ -152,9 +152,8 @@ int populate_pfns(struct xc_sr_context *ctx, unsign=
ed int count,
>  =20
>       for ( i =3D 0; i < count; ++i )
>       {
> -        if ( (!types || (types &&
> -                         (types[i] !=3D XEN_DOMCTL_PFINFO_XTAB &&
> -                          types[i] !=3D XEN_DOMCTL_PFINFO_BROKEN))) &&=

> +        if ( (!types ||
> +              (types && page_type_has_stream_data(types[i]) =3D=3D tru=
e)) &&

What about XEN_DOMCTL_PFINFO_XALLOC? Is this case impossible here, or
are you changing behavior?


Juergen

--------------599F303F92C22A3F17171267
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

--------------599F303F92C22A3F17171267--

--D7PqIiafqrscaQG9vey6UULGmaCe3LuDX--

--Qbsz8S2ZeH31Pb7jaHGGo8aAeWhDzmbty
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3LEEFAwAAAAAACgkQsN6d1ii/Ey+W
Jwf+LqjCX/chM+6JQIKunF1kjtoJ6L7LXVdlYJxB4SLano3bQBvc50Hwui9b3dSKFQcR4qbv4LCr
sYCsr0LSG7r9EplRi3sOdUkTnWDMEsMMHotysZ5i0YOM7e8UEMGkHNL9HafDUc2XRbMqTQ8ycDly
C/06bPnZsMxLlP2NMdqmak9cVUGwDdmNhQLj0IUOxrfSiILJrcpjt8N719/+EQX/Du3wKRirhj9f
72Dl7wJwGzqq/1bhOehvlgnd7xPmnIeATCLvYCSi/ZXlA2VKjrnBsO59xOwYKXndZbD1DEgerdEC
S/0n8EYSVezjUBorBAyF7dnAcA5oNWhUy7vF+Z0wcA==
=L6za
-----END PGP SIGNATURE-----

--Qbsz8S2ZeH31Pb7jaHGGo8aAeWhDzmbty--

