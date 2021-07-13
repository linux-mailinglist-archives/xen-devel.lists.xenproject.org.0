Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F1A3C6D63
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 11:27:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155240.286622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Ehb-00041y-1H; Tue, 13 Jul 2021 09:27:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155240.286622; Tue, 13 Jul 2021 09:27:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Eha-0003zu-UQ; Tue, 13 Jul 2021 09:27:42 +0000
Received: by outflank-mailman (input) for mailman id 155240;
 Tue, 13 Jul 2021 09:27:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+3sG=MF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m3EhY-0003zk-VZ
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 09:27:41 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3a7d015-d64b-4754-810e-65d940125079;
 Tue, 13 Jul 2021 09:27:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FE482007D;
 Tue, 13 Jul 2021 09:27:39 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 1E74713A38;
 Tue, 13 Jul 2021 09:27:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id RYjUBYtc7WBjHQAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 13 Jul 2021 09:27:39 +0000
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
X-Inumbo-ID: c3a7d015-d64b-4754-810e-65d940125079
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1626168459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zEZvwH5BHaU8+osZSVxk8G65+sIKidC1FiCCPwwdqM4=;
	b=DYUTueddEb/uKnwzUwJbJ/H39rlhKwgC+Sq2gDbP19mbz2QqK+pKLfyAss036W/vcKxhaT
	YenbwRA5p9co5VEQCjsYB52CmhHUSe9GlWFspsmbVv+ZaMjLq0I8Gjr77y5i9JqzWgF46t
	sje+eN91pm4BHmDe85VEjUC1vXbwXo0=
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20210713092019.7379-1-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
Date: Tue, 13 Jul 2021 11:27:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713092019.7379-1-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="12vu99ZCUy1ecLLjVsADAYzmdKeget9oC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--12vu99ZCUy1ecLLjVsADAYzmdKeget9oC
Content-Type: multipart/mixed; boundary="odc1wvahjuxVhHWiQ7uXmGJMRIP1ZsTRu";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
References: <20210713092019.7379-1-julien@xen.org>
In-Reply-To: <20210713092019.7379-1-julien@xen.org>

--odc1wvahjuxVhHWiQ7uXmGJMRIP1ZsTRu
Content-Type: multipart/mixed;
 boundary="------------3E5354AD8CD294AE4448FF90"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3E5354AD8CD294AE4448FF90
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.07.21 11:20, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.h and
> wreck the build in an interesting way:
>=20
> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>                   from xen/tools/include/xenctrl.h:36,
>                   from private.h:4,
>                   from minios.c:29:
> xen/include/public/memory.h:407:5: error: expected specifier-qualifier-=
list before =E2=80=98XEN_GUEST_HANDLE_64=E2=80=99
>       XEN_GUEST_HANDLE_64(const_uint8) buffer;
>       ^~~~~~~~~~~~~~~~~~~
>=20
> This is happening because xenctrl.h defines __XEN_TOOLS__ and therefore=

> the public headers will start to expose the non-stable ABI. However,
> xen.h has already been included by a mini-OS header before hand. So
> there is a mismatch in the way the headers are included.
>=20
> For now solve it in a very simple (and gross) way by including
> xenctrl.h before the mini-os headers.
>=20
> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE redefinit=
ion error")
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>=20
> ---
>=20
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>=20
> I couldn't find a better way with would not result to revert the patch
> (and break build on some system) or involve a longer rework of the
> headers.

Just adding a "#define __XEN_TOOLS__" before the #include statements
doesn't work?

> ---
>   tools/libs/foreignmemory/minios.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>=20
> diff --git a/tools/libs/foreignmemory/minios.c b/tools/libs/foreignmemo=
ry/minios.c
> index c5453736d598..d7b3f0e1c823 100644
> --- a/tools/libs/foreignmemory/minios.c
> +++ b/tools/libs/foreignmemory/minios.c
> @@ -17,6 +17,14 @@
>    * Copyright 2007-2008 Samuel Thibault <samuel.thibault@eu.citrix.com=
>.
>    */
>  =20
> +/*
> + * xenctlr.h currently defines __XEN_TOOLS__ which affects what is

Typo, should be xenctrl.h

> + * exposed by Xen headers. As the define needs to be set consistently,=

> + * we want to include xenctrl.h before the mini-os headers (they inclu=
de
> + * public headers).
> + */
> +#include <xenctrl.h>
> +
>   #include <mini-os/types.h>
>   #include <mini-os/os.h>
>   #include <mini-os/mm.h>
>=20

Juergen

--------------3E5354AD8CD294AE4448FF90
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

--------------3E5354AD8CD294AE4448FF90--

--odc1wvahjuxVhHWiQ7uXmGJMRIP1ZsTRu--

--12vu99ZCUy1ecLLjVsADAYzmdKeget9oC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDtXIoFAwAAAAAACgkQsN6d1ii/Ey8Q
FAf5AbINjPizQ+8+rQPvVzK7r8f7lU05QygNRTxGL6PSUqDwuuFexGzZJhaMglL3EIRz7l/AQLMc
dmN7F7ltSbEUNMZ4AvjQgeu2g9SU+WdeM5g+Qg4ChTXCJuFvSdvQ/NEWA+PFvzTW8oy6LD3JDAvM
wXqSs82Fv8M5HyOcL2UfUsnduUo/2A5vrFzV+cywlbaDDaqUnzl0D0xspTZ5GZsBkmbrcGUd6aSj
7v7gJKeN6PjEIFKnPBbF17a6ZYFa/3C+7x2TwrTRbIjmPYzbOIUbcTFJfrKTkxl+YvXPXj8DzVUc
dXvtYb7W9FGdhgTZ3t6lTLLTvBkDzPtJYK7FK9ZuYw==
=taUR
-----END PGP SIGNATURE-----

--12vu99ZCUy1ecLLjVsADAYzmdKeget9oC--

