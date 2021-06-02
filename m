Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05ACE3982F8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 09:29:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135741.252023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loLJQ-0006R3-1J; Wed, 02 Jun 2021 07:29:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135741.252023; Wed, 02 Jun 2021 07:29:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loLJP-0006P8-Sj; Wed, 02 Jun 2021 07:29:11 +0000
Received: by outflank-mailman (input) for mailman id 135741;
 Wed, 02 Jun 2021 07:29:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loLJO-0006P2-FD
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 07:29:10 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5f531261-5557-4ba5-8ef4-ff52e3267927;
 Wed, 02 Jun 2021 07:29:09 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CE18E2193F;
 Wed,  2 Jun 2021 07:29:08 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id A0EB7118DD;
 Wed,  2 Jun 2021 07:29:08 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id oMt2JUQzt2CWXwAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 07:29:08 +0000
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
X-Inumbo-ID: 5f531261-5557-4ba5-8ef4-ff52e3267927
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622618948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FRD2XSEoIRBPaIpNSoD14mHiI1NyAveNGfuhrUEYhx4=;
	b=ug8i7Yrwy5OO1w6bBX3V2SEnJ41Lhf3Prl1Kd1opPh5UVq9XFmqvOrq1kYSjmzICEgdR+6
	B3g6eODzk9nH1qvgdbi/5HXfCTnkkRPil+L+JXGo9LgRoet/V9B2gUEOLgSMEScTQDZqA/
	5cQt/1bOByE9T7xyTP+ocspaWvH+lzc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622618948; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FRD2XSEoIRBPaIpNSoD14mHiI1NyAveNGfuhrUEYhx4=;
	b=ug8i7Yrwy5OO1w6bBX3V2SEnJ41Lhf3Prl1Kd1opPh5UVq9XFmqvOrq1kYSjmzICEgdR+6
	B3g6eODzk9nH1qvgdbi/5HXfCTnkkRPil+L+JXGo9LgRoet/V9B2gUEOLgSMEScTQDZqA/
	5cQt/1bOByE9T7xyTP+ocspaWvH+lzc=
Subject: Re: [PATCH v20210601 09/38] tools/guest: prepare to allocate arrays
 once
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-10-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <531fe9c5-aa7f-be99-5d78-85d817139740@suse.com>
Date: Wed, 2 Jun 2021 09:29:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601161118.18986-10-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JqP2WOeWoCsDjk8z2fkuxqrRLUO30Vxw6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JqP2WOeWoCsDjk8z2fkuxqrRLUO30Vxw6
Content-Type: multipart/mixed; boundary="qLZB84n6oGtax1FIWe3B9RAaR711kfo6I";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <531fe9c5-aa7f-be99-5d78-85d817139740@suse.com>
Subject: Re: [PATCH v20210601 09/38] tools/guest: prepare to allocate arrays
 once
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-10-olaf@aepfle.de>
In-Reply-To: <20210601161118.18986-10-olaf@aepfle.de>

--qLZB84n6oGtax1FIWe3B9RAaR711kfo6I
Content-Type: multipart/mixed;
 boundary="------------9D97CCAD5EAE646C653D930B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9D97CCAD5EAE646C653D930B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.06.21 18:10, Olaf Hering wrote:
> The hotpath 'send_dirty_pages' is supposed to do just one thing: sendin=
g.
> The other end 'handle_page_data' is supposed to do just receiving.
>=20
> But instead both do other costly work like memory allocations and data =
moving.
> Do the allocations once, the array sizes are a compiletime constant.
> Avoid unneeded copying of data by receiving data directly into mapped g=
uest memory.
>=20
> This patch is just prepartion, subsequent changes will populate the arr=
ays.
>=20
> Once all changes are applied, migration of a busy HVM domU changes like=20
that:
>=20
> Without this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a2=
0963b3 xen_testing):
> 2020-10-29 10:23:10.711+0000: xc: show_transfer_rate: 23663128 bytes + =
2879563 pages in 55.324905335 sec, 203 MiB/sec: Internal error
> 2020-10-29 10:23:35.115+0000: xc: show_transfer_rate: 16829632 bytes + =
2097552 pages in 24.401179720 sec, 335 MiB/sec: Internal error
> 2020-10-29 10:23:59.436+0000: xc: show_transfer_rate: 16829032 bytes + =
2097478 pages in 24.319025928 sec, 336 MiB/sec: Internal error
> 2020-10-29 10:24:23.844+0000: xc: show_transfer_rate: 16829024 bytes + =
2097477 pages in 24.406992500 sec, 335 MiB/sec: Internal error
> 2020-10-29 10:24:48.292+0000: xc: show_transfer_rate: 16828912 bytes + =
2097463 pages in 24.446489027 sec, 335 MiB/sec: Internal error
> 2020-10-29 10:25:01.816+0000: xc: show_transfer_rate: 16836080 bytes + =
2098356 pages in 13.447091818 sec, 609 MiB/sec: Internal error
>=20
> With this series, from sr650 to sr950 (xen-4.15.20201027T173911.16a2096=
3b3 xen_unstable):
> 2020-10-28 21:26:05.074+0000: xc: show_transfer_rate: 23663128 bytes + =
2879563 pages in 52.564054368 sec, 213 MiB/sec: Internal error
> 2020-10-28 21:26:23.527+0000: xc: show_transfer_rate: 16830040 bytes + =
2097603 pages in 18.450592015 sec, 444 MiB/sec: Internal error
> 2020-10-28 21:26:41.926+0000: xc: show_transfer_rate: 16830944 bytes + =
2097717 pages in 18.397862306 sec, 445 MiB/sec: Internal error
> 2020-10-28 21:27:00.339+0000: xc: show_transfer_rate: 16829176 bytes + =
2097498 pages in 18.411973339 sec, 445 MiB/sec: Internal error
> 2020-10-28 21:27:18.643+0000: xc: show_transfer_rate: 16828592 bytes + =
2097425 pages in 18.303326695 sec, 447 MiB/sec: Internal error
> 2020-10-28 21:27:26.289+0000: xc: show_transfer_rate: 16835952 bytes + =
2098342 pages in 7.579846749 sec, 1081 MiB/sec: Internal error
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   tools/libs/saverestore/common.h  | 8 ++++++++
>   tools/libs/saverestore/restore.c | 8 ++++++++
>   tools/libs/saverestore/save.c    | 4 +++-
>   3 files changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/tools/libs/saverestore/common.h b/tools/libs/saverestore/c=
ommon.h
> index f5fe23caad..80b2e878aa 100644
> --- a/tools/libs/saverestore/common.h
> +++ b/tools/libs/saverestore/common.h
> @@ -223,6 +223,12 @@ static inline int update_blob(struct xc_sr_blob *b=
lob,
>       return 0;
>   }
>  =20
> +struct xc_sr_save_arrays {
> +};
> +
> +struct xc_sr_restore_arrays {
> +};

Can you please add the mfns/pfns arrays to above types, as ...

> +
>   struct xc_sr_context
>   {
>       xc_interface *xch;
> @@ -260,6 +266,7 @@ struct xc_sr_context
>               unsigned long *deferred_pages;
>               unsigned long nr_deferred_pages;
>               xc_hypercall_buffer_t dirty_bitmap_hbuf;
> +            struct xc_sr_save_arrays *m;
>           } save;
>  =20
>           struct /* Restore data. */
> @@ -311,6 +318,7 @@ struct xc_sr_context
>  =20
>               /* Sender has invoked verify mode on the stream. */
>               bool verify;
> +            struct xc_sr_restore_arrays *m;
>           } restore;
>       };
>  =20
> diff --git a/tools/libs/saverestore/restore.c b/tools/libs/saverestore/=
restore.c
> index 700f9e74b5..a6cf9ee41c 100644
> --- a/tools/libs/saverestore/restore.c
> +++ b/tools/libs/saverestore/restore.c
> @@ -739,6 +739,13 @@ static int setup(struct xc_sr_context *ctx)
>       }
>       ctx->restore.allocated_rec_num =3D DEFAULT_BUF_RECORDS;
>  =20
> +    ctx->restore.m =3D malloc(sizeof(*ctx->restore.m));
> +    if ( !ctx->restore.m ) {

=2E.. this case might trigger without the full series applied, due to
allocating zero bytes (same for the save side below).


Juergen

--------------9D97CCAD5EAE646C653D930B
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

--------------9D97CCAD5EAE646C653D930B--

--qLZB84n6oGtax1FIWe3B9RAaR711kfo6I--

--JqP2WOeWoCsDjk8z2fkuxqrRLUO30Vxw6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3M0QFAwAAAAAACgkQsN6d1ii/Ey+c
FQgAiPxvE4C15MXruAvM6L9L9ZB04tKiJN5vtS7oKmVFcstcM6VE9zZsuodiwqkvTeAnTGbzhWcs
PTryaG6cJ5eJHRBy5m0qC3/bPAfRZJK2PWpGdsdZYde7IvRnilNi2h067LuSdX5sw9KUizdS452b
eEgNf2UiGe/muhop7kE2VEzbJAWMoGdPJ8ctTdKZ3Tm9nQZSlZ9pdlH9H+e0AtVyGZlCmEy6vvaK
7p4W59wTq+PNSB9qQWQA1ioltRpvaRHuhmM2OfPBuqfsOBNv6N2TMRrPgMJUjQLt4xiAD0gYv9TE
n5IGSr0D2zgqnteJOgiAwQpFbO9R1G3+yQfN0q9u+Q==
=K0gl
-----END PGP SIGNATURE-----

--JqP2WOeWoCsDjk8z2fkuxqrRLUO30Vxw6--

