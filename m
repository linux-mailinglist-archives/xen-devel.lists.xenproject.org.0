Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0043982B8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:11:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135648.252012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loL1c-0004Ms-Ej; Wed, 02 Jun 2021 07:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135648.252012; Wed, 02 Jun 2021 07:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loL1c-0004Jj-Aa; Wed, 02 Jun 2021 07:10:48 +0000
Received: by outflank-mailman (input) for mailman id 135648;
 Wed, 02 Jun 2021 07:10:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loL1a-0004Jb-LL
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 07:10:46 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38b574fb-e25a-4ffc-8cc7-bb2fe9e2a211;
 Wed, 02 Jun 2021 07:10:45 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1BB372193C;
 Wed,  2 Jun 2021 07:10:45 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E7BCA118DD;
 Wed,  2 Jun 2021 07:10:44 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id ihBuN/Qut2AcVwAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 07:10:44 +0000
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
X-Inumbo-ID: 38b574fb-e25a-4ffc-8cc7-bb2fe9e2a211
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622617845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TjiqP1jUYF7noSIyoNCVoo2cMfZMos2Hqwbp8cguD/A=;
	b=ov647Dg8ErFWpOxffjDEcWpuWN/sXYRYrS+6U+Kg245m61WkwZ9AeVa6Ms1eU3aOIAPp7d
	9wIGrMqeK7jZtNvM95i2cjlmqQDF95QDHaKy+4Hkqn/y11thKwK8mmRhH0LZpxTSQ2v6gY
	0exXJWccNepoCdT/xqjcPltQimBQUSo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622617845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TjiqP1jUYF7noSIyoNCVoo2cMfZMos2Hqwbp8cguD/A=;
	b=ov647Dg8ErFWpOxffjDEcWpuWN/sXYRYrS+6U+Kg245m61WkwZ9AeVa6Ms1eU3aOIAPp7d
	9wIGrMqeK7jZtNvM95i2cjlmqQDF95QDHaKy+4Hkqn/y11thKwK8mmRhH0LZpxTSQ2v6gY
	0exXJWccNepoCdT/xqjcPltQimBQUSo=
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-9-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v20210601 08/38] tools: show migration transfer rate in
 send_dirty_pages
Message-ID: <42844bc5-da7e-5f6d-1ce0-1ef9e0f9dea6@suse.com>
Date: Wed, 2 Jun 2021 09:10:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601161118.18986-9-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BrqMiSmemi6ydmvK1ilhFR5iHXrP0A4Bg"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BrqMiSmemi6ydmvK1ilhFR5iHXrP0A4Bg
Content-Type: multipart/mixed; boundary="qCTocIMJRmox1xkeEyqFvBeyqPkP4wbVr";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <42844bc5-da7e-5f6d-1ce0-1ef9e0f9dea6@suse.com>
Subject: Re: [PATCH v20210601 08/38] tools: show migration transfer rate in
 send_dirty_pages
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-9-olaf@aepfle.de>
In-Reply-To: <20210601161118.18986-9-olaf@aepfle.de>

--qCTocIMJRmox1xkeEyqFvBeyqPkP4wbVr
Content-Type: multipart/mixed;
 boundary="------------C0C7F94365622C72118C79DD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------C0C7F94365622C72118C79DD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.06.21 18:10, Olaf Hering wrote:
> Show how fast domU pages are transferred in each iteration.
>=20
> The relevant data is how fast the pfns travel, not so much how much
> protocol overhead exists. So the reported MiB/sec is just for pfns.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   tools/libs/saverestore/common.h |  2 ++
>   tools/libs/saverestore/save.c   | 47 ++++++++++++++++++++++++++++++++=
+
>   2 files changed, 49 insertions(+)
>=20
> diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/c=
ommon.h
> index 50a8479d39..f5fe23caad 100644
> --- a/tools/libs/saverestore/common.h
> +++ b/tools/libs/saverestore/common.h
> @@ -250,6 +250,8 @@ struct xc_sr_context
>               bool debug;
>  =20
>               unsigned long p2m_size;
> +            size_t pages_sent;
> +            size_t overhead_sent;
>  =20
>               struct precopy_stats stats;
>  =20
> diff --git a/tools/libs/saverestore/save.c b/tools/libs/saverestore/sav=
e.c
> index bcff2d28f5..760ca04a84 100644
> --- a/tools/libs/saverestore/save.c
> +++ b/tools/libs/saverestore/save.c
> @@ -1,5 +1,6 @@
>   #include <assert.h>
>   #include <arpa/inet.h>
> +#include <time.h>
>  =20
>   #include "common.h"
>  =20
> @@ -238,6 +239,8 @@ static int write_batch(struct xc_sr_context *ctx)
>       iov[3].iov_len =3D nr_pfns * sizeof(*rec_pfns);
>  =20
>       iovcnt =3D 4;
> +    ctx->save.pages_sent +=3D nr_pages;
> +    ctx->save.overhead_sent +=3D sizeof(rec) + sizeof(hdr) + nr_pfns *=20
sizeof(*rec_pfns);
>  =20
>       if ( nr_pages )
>       {
> @@ -357,6 +360,43 @@ static int suspend_domain(struct xc_sr_context *ct=
x)
>       return 0;
>   }
>  =20
> +static void show_transfer_rate(struct xc_sr_context *ctx, struct times=
pec *start)
> +{
> +    xc_interface *xch =3D ctx->xch;
> +    struct timespec end =3D {}, diff =3D {};
> +    size_t ms, MiB_sec =3D ctx->save.pages_sent * PAGE_SIZE;

I'd rather not initialize MiB_sec here ...

> +
> +    if (!MiB_sec)

=2E.. and test for ctx->save.pages_sent to be non-zero here.

> +        return;
> +
> +    if ( clock_gettime(CLOCK_MONOTONIC, &end) )
> +        PERROR("clock_gettime");
> +
> +    if ( (end.tv_nsec - start->tv_nsec) < 0 )
> +    {
> +        diff.tv_sec =3D end.tv_sec - start->tv_sec - 1;
> +        diff.tv_nsec =3D end.tv_nsec - start->tv_nsec + (1000U*1000U*1=
000U);
> +    }
> +    else
> +    {
> +        diff.tv_sec =3D end.tv_sec - start->tv_sec;
> +        diff.tv_nsec =3D end.tv_nsec - start->tv_nsec;
> +    }
> +
> +    ms =3D (diff.tv_nsec / (1000U*1000U));
> +    if (!ms)
> +        ms =3D 1;

I'd move this ...

> +    ms +=3D (diff.tv_sec * 1000U);

=2E.. below this.

> +
> +    MiB_sec *=3D 1000U;
> +    MiB_sec /=3D ms;
> +    MiB_sec /=3D 1024U*1024U;

Avoid MiB_sec holding bytes per second for some time and use:

MiB_sec =3D ((ctx->save.pages_sent * PAGE_SIZE * 1000) / ms) /
           (1024U * 1024U);


Juergen

--------------C0C7F94365622C72118C79DD
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

--------------C0C7F94365622C72118C79DD--

--qCTocIMJRmox1xkeEyqFvBeyqPkP4wbVr--

--BrqMiSmemi6ydmvK1ilhFR5iHXrP0A4Bg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3LvQFAwAAAAAACgkQsN6d1ii/Ey9M
7Af/WmegSfoqj9LzE0QPJyxfObkyDUezBeB962Fub1lU8+Ra1K/mlMUhKkm5+fYJ17GhFdgvmP+R
pzJ9bhFUZQCyzQD70vlcSJm9AuLC9cIYFTFQe9ym2Q0cn2nFX/tF3i+YugC7cJBiR65lgkPNVTQs
IzD8tqrWZxCGKmekJdJ9bDeWzYOJJt2W5KvX1WABi+VgR+4918O08VvVugfLucRVrjv9TY0uc6ww
3N2+V1ncSV1OeIdgicjQIsuBqRFLCU2+dRC9YGr8INfj6K+JjpqUUiOhCwt7ooeWwSJYb/KJWGLM
qB4pVIUU6sDwGMsHBofYxTHlvevwdWFKvhPLgEesdg==
=mb6b
-----END PGP SIGNATURE-----

--BrqMiSmemi6ydmvK1ilhFR5iHXrP0A4Bg--

