Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 134EF3B001E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 11:24:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145784.268131 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvcdA-0008VU-78; Tue, 22 Jun 2021 09:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145784.268131; Tue, 22 Jun 2021 09:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvcdA-0008TA-2e; Tue, 22 Jun 2021 09:23:40 +0000
Received: by outflank-mailman (input) for mailman id 145784;
 Tue, 22 Jun 2021 09:23:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P8ns=LQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lvcd8-0008T4-P7
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 09:23:38 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2f02d891-5cb1-466d-914f-b9591431af90;
 Tue, 22 Jun 2021 09:23:36 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AFD5D2198C;
 Tue, 22 Jun 2021 09:23:35 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7E0CE118DD;
 Tue, 22 Jun 2021 09:23:35 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id tnypHBes0WAJKQAALh3uQQ
 (envelope-from <jgross@suse.com>); Tue, 22 Jun 2021 09:23:35 +0000
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
X-Inumbo-ID: 2f02d891-5cb1-466d-914f-b9591431af90
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624353815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrGILk5TF1Zhl5wMEICap1qzcWtZAIP+G9BYsVDJ00k=;
	b=GuvXIBgtdSgCuYNvJW4AGUqIOwfkJ9tW4a/n8gh+DXeF+kyGrBWCJnjWs9MRWlPqv2Z0m2
	qurszEL6mTyB7fZ5N5b1eEVkWVtBlr2SdRTwsyYAQ1HUIYvTi7tWOE14QXzNLF2fAAU8IL
	9i1HT+hOgBtcHAl/xvWZgKegr5m9iC4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624353815; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZrGILk5TF1Zhl5wMEICap1qzcWtZAIP+G9BYsVDJ00k=;
	b=GuvXIBgtdSgCuYNvJW4AGUqIOwfkJ9tW4a/n8gh+DXeF+kyGrBWCJnjWs9MRWlPqv2Z0m2
	qurszEL6mTyB7fZ5N5b1eEVkWVtBlr2SdRTwsyYAQ1HUIYvTi7tWOE14QXzNLF2fAAU8IL
	9i1HT+hOgBtcHAl/xvWZgKegr5m9iC4=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien GralL
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210617173857.6450-1-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xenstored: Don't crash xenstored when Live-Update
 is cancelled
Message-ID: <136d6a10-c93d-accd-fc34-62fbaa4742b0@suse.com>
Date: Tue, 22 Jun 2021 11:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210617173857.6450-1-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="BM8HYKSk6JU0miiBhsDfUZQ99pUV5IlxA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--BM8HYKSk6JU0miiBhsDfUZQ99pUV5IlxA
Content-Type: multipart/mixed; boundary="csuHntVeq7SnTgkWBQ8iGcGbjzxcTxVkv";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien GralL
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <136d6a10-c93d-accd-fc34-62fbaa4742b0@suse.com>
Subject: Re: [PATCH] tools/xenstored: Don't crash xenstored when Live-Update
 is cancelled
References: <20210617173857.6450-1-julien@xen.org>
In-Reply-To: <20210617173857.6450-1-julien@xen.org>

--csuHntVeq7SnTgkWBQ8iGcGbjzxcTxVkv
Content-Type: multipart/mixed;
 boundary="------------194A444496820619141E8FBE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------194A444496820619141E8FBE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.06.21 19:38, Julien Grall wrote:
> From: Julien GralL <jgrall@amazon.com>
>=20
> As Live-Update is asynchronous, it is possible to receive a request to
> cancel it (either on the same connection or from a different one).
>=20
> Currently, this will crash xenstored because do_lu_start() assumes
> lu_status will be valid. This is not the case when Live-Update has been=

> cancelled. This will result to dereference a NULL pointer and
> crash Xenstored.
>=20
> Rework do_lu_start() to check if lu_status is NULL and return an
> error in this case.
>=20
> Fixes: af216a99fb ("tools/xenstore: add the basic framework for doing t=
he live update")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ----
>=20
> This is currently based on top of:
>=20
> https://lore.kernel.org/xen-devel/20210616144324.31652-1-julien@xen.org=

>=20
> This can be re-ordered if necessary.
> ---
>   tools/xenstore/xenstored_control.c | 15 +++++++++++++--
>   1 file changed, 13 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/xenstore/xenstored_control.c b/tools/xenstore/xensto=
red_control.c
> index a045f102a420..37a3d39f20b5 100644
> --- a/tools/xenstore/xenstored_control.c
> +++ b/tools/xenstore/xenstored_control.c
> @@ -696,7 +696,18 @@ static bool do_lu_start(struct delayed_request *re=
q)
>   	time_t now =3D time(NULL);
>   	const char *ret;
>   	struct buffered_data *saved_in;
> -	struct connection *conn =3D lu_status->conn;
> +	struct connection *conn =3D req->data;
> +
> +	/*
> +	 * Cancellation may have been requested asynchronously. In this
> +	 * case, lu_status will be NULL.
> +	 */
> +	if (!lu_status) {
> +		ret =3D "Cancellation was requested";
> +		conn =3D req->data;

This will set conn to the same value it already has.


Other than that:

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------194A444496820619141E8FBE
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

--------------194A444496820619141E8FBE--

--csuHntVeq7SnTgkWBQ8iGcGbjzxcTxVkv--

--BM8HYKSk6JU0miiBhsDfUZQ99pUV5IlxA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDRrBcFAwAAAAAACgkQsN6d1ii/Ey+u
2wf+JWKqfQB7M4Nd/jEL3m9Nj9NV7U32Mxb3+Xbhtj+vx0nKg7P8dDExh6IkAgvCQp23Ch+kA8OI
HIVPiPYOA1fEfC6ysWMDOUr//Po67boxROWF3YIHB4WE4aSt4rYzk2BuEOtSnxUImKSRBJbvvGhv
j/1Ox+EUW4KAqHZFqpcucaXmOTgHPA6KPPDSmKwiC5wduCenU6PBTO7cKMxggKD1eVlB3iJaWYOq
pKyEENSJrCm3sSQz3Z8eQPx7EO6+Tu8dweMotZx56bRmKFM9ojShFEL6Lhtf2flH2TX1L2l8cd9J
GEHsDVD7oDl11waIz37i37y04xHoWMQqHSxThW6EtQ==
=5QqH
-----END PGP SIGNATURE-----

--BM8HYKSk6JU0miiBhsDfUZQ99pUV5IlxA--

