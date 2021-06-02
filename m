Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E2F398127
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 08:30:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135453.251605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKOK-0002sq-Sx; Wed, 02 Jun 2021 06:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135453.251605; Wed, 02 Jun 2021 06:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKOK-0002pd-PW; Wed, 02 Jun 2021 06:30:12 +0000
Received: by outflank-mailman (input) for mailman id 135453;
 Wed, 02 Jun 2021 06:30:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loKOJ-0002pX-OS
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:30:11 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0dfc82b3-2b42-4850-8430-29b7bfda74b5;
 Wed, 02 Jun 2021 06:30:10 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1E66B1FD32;
 Wed,  2 Jun 2021 06:30:10 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E6695118DD;
 Wed,  2 Jun 2021 06:30:09 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id FkpJNnElt2DIQwAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 06:30:09 +0000
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
X-Inumbo-ID: 0dfc82b3-2b42-4850-8430-29b7bfda74b5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622615410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zn2FBJyBSmD2wvdoETJjGC8BW04cSEbwAHqYhfPKguQ=;
	b=iZMYPyFPQr1wGqjNOORU6JHk1UdTUL8Dp+YAEvJ8wtaWPp4rDGSJ3K22iZoGAnCoLhd2mF
	KypJWz5QSlWy3cWE7vFh3CZ8cHV7OzZmOdvCt3a5wm5LTosq5QBCXEwHpbZ8tiwykUoPo6
	gGobJnVIJAfAsYfyQWbxaTpnTLQ4LlY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622615410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Zn2FBJyBSmD2wvdoETJjGC8BW04cSEbwAHqYhfPKguQ=;
	b=iZMYPyFPQr1wGqjNOORU6JHk1UdTUL8Dp+YAEvJ8wtaWPp4rDGSJ3K22iZoGAnCoLhd2mF
	KypJWz5QSlWy3cWE7vFh3CZ8cHV7OzZmOdvCt3a5wm5LTosq5QBCXEwHpbZ8tiwykUoPo6
	gGobJnVIJAfAsYfyQWbxaTpnTLQ4LlY=
Subject: Re: [PATCH v20210601 04/38] tools: add readv_exact to libxenctrl
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-5-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <23783088-dc59-abd1-c66c-5fcd314d1f5c@suse.com>
Date: Wed, 2 Jun 2021 08:30:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601161118.18986-5-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bRlk6HqKhqVKkKdAurDgUasSvORqDaYRD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bRlk6HqKhqVKkKdAurDgUasSvORqDaYRD
Content-Type: multipart/mixed; boundary="gNGgc9DCOFQqgRTPe7WSYKnM9mYUHWE4z";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <23783088-dc59-abd1-c66c-5fcd314d1f5c@suse.com>
Subject: Re: [PATCH v20210601 04/38] tools: add readv_exact to libxenctrl
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-5-olaf@aepfle.de>
In-Reply-To: <20210601161118.18986-5-olaf@aepfle.de>

--gNGgc9DCOFQqgRTPe7WSYKnM9mYUHWE4z
Content-Type: multipart/mixed;
 boundary="------------D42367AB7853177860FBC717"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D42367AB7853177860FBC717
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.06.21 18:10, Olaf Hering wrote:
> Read a batch of iovec's.
>=20
> In the common case of short reads, finish individual iov's with read_ex=
act.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   tools/libs/ctrl/xc_private.c | 55 +++++++++++++++++++++++++++++++++++=
-
>   tools/libs/ctrl/xc_private.h |  1 +
>   2 files changed, 55 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/libs/ctrl/xc_private.c b/tools/libs/ctrl/xc_private.=
c
> index d94f846686..ea420b9ba8 100644
> --- a/tools/libs/ctrl/xc_private.c
> +++ b/tools/libs/ctrl/xc_private.c
> @@ -659,8 +659,23 @@ int write_exact(int fd, const void *data, size_t s=
ize)
>  =20
>   #if defined(__MINIOS__)
>   /*
> - * MiniOS's libc doesn't know about writev(). Implement it as multiple=20
write()s.
> + * MiniOS's libc doesn't know about readv/writev().
> + * Implement it as multiple read/write()s.
>    */
> +int readv_exact(int fd, const struct iovec *iov, int iovcnt)
> +{
> +    int rc, i;
> +
> +    for ( i =3D 0; i < iovcnt; ++i )
> +    {
> +        rc =3D read_exact(fd, iov[i].iov_base, iov[i].iov_len);
> +        if ( rc )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
>   int writev_exact(int fd, const struct iovec *iov, int iovcnt)
>   {
>       int rc, i;
> @@ -675,6 +690,44 @@ int writev_exact(int fd, const struct iovec *iov, =
int iovcnt)
>       return 0;
>   }
>   #else
> +int readv_exact(int fd, const struct iovec *iov, int iovcnt)
> +{
> +    int rc =3D 0, idx =3D 0;
> +    ssize_t len;
> +
> +    while ( idx < iovcnt )
> +    {
> +        len =3D readv(fd, &iov[idx], min(iovcnt - idx, IOV_MAX));
> +        if ( len =3D=3D -1 && errno =3D=3D EINTR )
> +            continue;
> +        if ( len <=3D 0 )
> +        {
> +            rc =3D -1;

Is EOF really an error?

> +            goto out;
> +        }
> +        while ( len > 0 && idx < iovcnt )
> +        {
> +            if ( len >=3D iov[idx].iov_len )
> +            {
> +                len -=3D iov[idx].iov_len;
> +            }
> +            else
> +            {
> +                void *p =3D iov[idx].iov_base + len;
> +                size_t l =3D iov[idx].iov_len - len;
> +
> +                rc =3D read_exact(fd, p, l);
> +                if ( rc )
> +                    goto out;
> +                len =3D 0;

This will stop the loop, even if idx hasn't reached iovcnt.

> +            }
> +            idx++;
> +        }
> +    }
> +out:
> +    return rc;
> +}
> +


Juergen

--------------D42367AB7853177860FBC717
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

--------------D42367AB7853177860FBC717--

--gNGgc9DCOFQqgRTPe7WSYKnM9mYUHWE4z--

--bRlk6HqKhqVKkKdAurDgUasSvORqDaYRD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3JXAFAwAAAAAACgkQsN6d1ii/Ey88
2gf/eBa3ZquvgaqWEDqBTF/z5Kuc2fwHhEX0bjtYwxDPG9jHUqqAtO+53i9A4aAN0XOg0CgtDqgz
XwTm0IM/dKgzs31oRGGLYW0DimzJxbVpRbExrriaf/5RHrRNWZJOaDVuNLT+ruZE7kRJ1g+cCejw
+4qzbKCxnNGiFvQsKrQ5JXhxYbVsvD8D2iRao0xSMIFqgM9/LS8vUZ12zW+RWHKKlKlj3tgAJoCY
27q8ndwLSnDQcswNDEY9x7hxBMVRFcaryuLAfkZlRvxahkxlH7M27oE3eDY+vrSMnyjgWJtr3U79
Rv13IX4oIETPNTgL9fs0R9Lhlj0BPST6kbkLOc/oCw==
=oHkY
-----END PGP SIGNATURE-----

--bRlk6HqKhqVKkKdAurDgUasSvORqDaYRD--

