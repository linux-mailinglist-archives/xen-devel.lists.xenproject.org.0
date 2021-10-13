Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B8742BC2B
	for <lists+xen-devel@lfdr.de>; Wed, 13 Oct 2021 11:52:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208153.364195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maawA-0005Hi-GJ; Wed, 13 Oct 2021 09:52:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208153.364195; Wed, 13 Oct 2021 09:52:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maawA-0005ER-Ct; Wed, 13 Oct 2021 09:52:38 +0000
Received: by outflank-mailman (input) for mailman id 208153;
 Wed, 13 Oct 2021 09:52:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=quvz=PB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1maaw8-0005EL-HZ
 for xen-devel@lists.xenproject.org; Wed, 13 Oct 2021 09:52:36 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f4b697a-ab7b-46ba-bc8c-4c58ff06e7c9;
 Wed, 13 Oct 2021 09:52:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CDA6E201CA;
 Wed, 13 Oct 2021 09:52:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F95D13CEC;
 Wed, 13 Oct 2021 09:52:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VdEmJWKsZmE/OgAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 13 Oct 2021 09:52:34 +0000
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
X-Inumbo-ID: 8f4b697a-ab7b-46ba-bc8c-4c58ff06e7c9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634118754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SZ63tRYxBuNCk5b65eKHthYeTyWErK25Bc1+cY1qj3o=;
	b=Vp80ZvD0ZT9eFXsmRa7WYzxIurfUadSpoFwi6SYVakaNvduHgsldTTClfxr3sNMItv5UQW
	T30S6TzcMXvjeZeDz9lvp4DvdFlCX2RL9zPwaEhpFVu/rL+8KBlx02kXVzfRemxNYpI9Th
	8TIZtiTSd5GAAC8JcsB/gbSxEEeunVA=
To: Kevin Stefanov <kevin.stefanov@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211013093546.17203-1-kevin.stefanov@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/tests: Make E2BIG non-fatal to xenstore unit test
Message-ID: <571c8595-d257-7a94-5d7c-282f00a9631c@suse.com>
Date: Wed, 13 Oct 2021 11:52:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211013093546.17203-1-kevin.stefanov@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Szf9WSZJ6U48QBFpppDgzTu5ER8ZJMugo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Szf9WSZJ6U48QBFpppDgzTu5ER8ZJMugo
Content-Type: multipart/mixed; boundary="f1JPBAK5l97KMjA1UGfwYxbze3HCadrgW";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Kevin Stefanov <kevin.stefanov@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <571c8595-d257-7a94-5d7c-282f00a9631c@suse.com>
Subject: Re: [PATCH] tools/tests: Make E2BIG non-fatal to xenstore unit test
References: <20211013093546.17203-1-kevin.stefanov@citrix.com>
In-Reply-To: <20211013093546.17203-1-kevin.stefanov@citrix.com>

--f1JPBAK5l97KMjA1UGfwYxbze3HCadrgW
Content-Type: multipart/mixed;
 boundary="------------20DDA9258F5517875FD5F554"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------20DDA9258F5517875FD5F554
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.10.21 11:35, Kevin Stefanov wrote:
> Xenstore's unit test fails on read and write of big numbers if
> quota-maxsize is set to a lower number than those test cases use.
>=20
> Output a special warning instead of a failure message in such cases
> and make the error non-fatal to the unit test.
>=20
> Signed-off-by: Kevin Stefanov <kevin.stefanov@citrix.com>
> ---
> CC: Ian Jackson <iwj@xenproject.org>
> CC: Wei Liu <wl@xen.org>
> CC: Juergen Gross <jgross@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>   tools/tests/xenstore/test-xenstore.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/tests/xenstore/test-xenstore.c b/tools/tests/xenstor=
e/test-xenstore.c
> index d3574b3fa2..ec8c63a65d 100644
> --- a/tools/tests/xenstore/test-xenstore.c
> +++ b/tools/tests/xenstore/test-xenstore.c
> @@ -110,8 +110,13 @@ static int call_test(struct test *tst, int iters, =
bool no_clock)
>               break;
>       }
>  =20
> -    if ( ret )
> -        printf("%-10s: failed (ret =3D %d, stage %s)\n", tst->name, re=
t, stage);
> +    /* Make E2BIG non-fatal to the test */
> +    if ( ret ){
> +	if( ret =3D=3D 7 )

Why not use E2BIG instead of the literal 7 here?

And please adhere to the coding style! There are some blanks missing and
the '{' wants to go into a separate line.

> +            printf("%-10s: Not run - argument list too long\n", tst->n=
ame);

Not setting ret to 0 here will result in Xenstore not being cleaned up
after the test.

> +        else
> +            printf("%-10s: failed (ret =3D %d, stage %s)\n", tst->name=
, ret, stage);
> +    }
>       else if ( !no_clock )
>       {
>           printf("%-10s:", tst->name);
>=20


Juergen

--------------20DDA9258F5517875FD5F554
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

--------------20DDA9258F5517875FD5F554--

--f1JPBAK5l97KMjA1UGfwYxbze3HCadrgW--

--Szf9WSZJ6U48QBFpppDgzTu5ER8ZJMugo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFmrGEFAwAAAAAACgkQsN6d1ii/Ey8H
Mgf7BteRW4uSQDkLW+Hg1qLs5+2MjhMPe6qSkQInYoSukWnrRfqcviJcn5R/3NHYfu1+bRm6poP6
vFcqPIh6rfA9rUFEqgRDvyY9oaoKvQ1SHsLFKZ6cq4qIzAhKUl/ewtuAAkvlTsphI2ApIxyc7C+S
EHMqc7m+XKXTEHhVsYh2mGdG9j3C6+gr7UfjsXoetf3JeF1MO3YymggG38fY11jhxRt6i/hwRTJR
5r8QkE5uHBDuM9p37o9cliKs+atmDZ6iW+kQrrIPuVESi32YOl+tOLR38U5U+L+KKKzeTLGC5jpg
L/p0l39qtKZhowOYhlUDjPvYwqVb/yeD1WGYb12kHA==
=nuJp
-----END PGP SIGNATURE-----

--Szf9WSZJ6U48QBFpppDgzTu5ER8ZJMugo--

