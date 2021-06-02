Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F839816E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 08:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.135462.251616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKjF-0005OV-SE; Wed, 02 Jun 2021 06:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 135462.251616; Wed, 02 Jun 2021 06:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loKjF-0005LE-OZ; Wed, 02 Jun 2021 06:51:49 +0000
Received: by outflank-mailman (input) for mailman id 135462;
 Wed, 02 Jun 2021 06:51:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loKjE-0005L8-1R
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 06:51:48 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 980cd92d-25f3-4c19-87e3-c11a33c3fd31;
 Wed, 02 Jun 2021 06:51:47 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2FEF821928;
 Wed,  2 Jun 2021 06:51:46 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 03119118DD;
 Wed,  2 Jun 2021 06:51:45 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id fSI7O4Eqt2DzTQAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 06:51:45 +0000
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
X-Inumbo-ID: 980cd92d-25f3-4c19-87e3-c11a33c3fd31
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622616706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7h38BL584hO19wtfBX6H3SP7X8t4ul+fWeygrPyzZ2k=;
	b=lzj+mk2/j1ICe9zy/O6OWaOWpdOJi815t60TpERBRfmnsgF8HPNO48oj6CGPs36va2AduO
	Qh5h7uG7K9+pntzPz/53YZAQPZ/4XVAZlFLMePTcax4ZsTJsOX+ylItHkmtAPZ+jm23I8b
	+NNh1SuYSYjNNNTSSSJY+WkdKRoUXbY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622616706; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7h38BL584hO19wtfBX6H3SP7X8t4ul+fWeygrPyzZ2k=;
	b=lzj+mk2/j1ICe9zy/O6OWaOWpdOJi815t60TpERBRfmnsgF8HPNO48oj6CGPs36va2AduO
	Qh5h7uG7K9+pntzPz/53YZAQPZ/4XVAZlFLMePTcax4ZsTJsOX+ylItHkmtAPZ+jm23I8b
	+NNh1SuYSYjNNNTSSSJY+WkdKRoUXbY=
Subject: Re: [PATCH v20210601 05/38] tools: add xc_is_known_page_type to
 libxenctrl
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-6-olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f1f00500-f74f-3515-cd46-7a12abdf18c3@suse.com>
Date: Wed, 2 Jun 2021 08:51:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210601161118.18986-6-olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="g7SepDU1tVx8HBQBwS79hijoJmtCBxivC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g7SepDU1tVx8HBQBwS79hijoJmtCBxivC
Content-Type: multipart/mixed; boundary="V5MxSTN6LxHhXJhOPB4nJMASIm9LOR58B";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <f1f00500-f74f-3515-cd46-7a12abdf18c3@suse.com>
Subject: Re: [PATCH v20210601 05/38] tools: add xc_is_known_page_type to
 libxenctrl
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-6-olaf@aepfle.de>
In-Reply-To: <20210601161118.18986-6-olaf@aepfle.de>

--V5MxSTN6LxHhXJhOPB4nJMASIm9LOR58B
Content-Type: multipart/mixed;
 boundary="------------DE2FE20E396435AB51020ACE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------DE2FE20E396435AB51020ACE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.06.21 18:10, Olaf Hering wrote:
> Users of xc_get_pfn_type_batch may want to sanity check the data
> returned by Xen. Add a simple helper for this purpose.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>   tools/libs/ctrl/xc_private.h | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>=20
> diff --git a/tools/libs/ctrl/xc_private.h b/tools/libs/ctrl/xc_private.=
h
> index 5d2c7274fb..afb08aafe1 100644
> --- a/tools/libs/ctrl/xc_private.h
> +++ b/tools/libs/ctrl/xc_private.h
> @@ -421,6 +421,39 @@ void *xc_map_foreign_ranges(xc_interface *xch, uin=
t32_t dom,
>   int xc_get_pfn_type_batch(xc_interface *xch, uint32_t dom,
>                             unsigned int num, xen_pfn_t *);
>  =20
> +/* Sanitiy check for types returned by Xen */
> +static inline bool xc_is_known_page_type(xen_pfn_t type)
> +{
> +    bool ret;
> +
> +    switch (type)

I think you should not imply the planned use case here. It would be
better to use "switch (type & XEN_DOMCTL_PFINFO_LTAB_MASK)".

I'm on the edge regarding putting the new function into xc_private.h.
In the end your use case is _not_ to call the new function from
libxenctrl.


Juergen

--------------DE2FE20E396435AB51020ACE
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

--------------DE2FE20E396435AB51020ACE--

--V5MxSTN6LxHhXJhOPB4nJMASIm9LOR58B--

--g7SepDU1tVx8HBQBwS79hijoJmtCBxivC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3KoEFAwAAAAAACgkQsN6d1ii/Ey/C
lAf/TaysGhgMVz+LFg9v/AUW+h4263+CqOc9H+o8dO58f66W8bDAWDiW6trTviR1yrWMYXon2v93
3fhDYikoOqwPXADxEPOJZyGpgl40o3MUAMGeAG8CHSGSWqISkeE+MaWZvf7PK3yebT6kRTGX35Jw
EdoVxo2l5XPy6XO0Cvxxh1wtDkBbRzwzP65GNPQgiaumP7lMZz/w9h8WiHHtkl2TQKNwUORu0gZK
BtzLNnf5HCNyIYgvG2WExsUWfmVbayFRuEw523ukJkQtMns7kpUCxeiMwEPEByfiZkPxYyhhTSio
Ij+8MbaVjAKA48xu1OaA+Js6Ht8qgh7SlMS9WnQpDQ==
=7GkR
-----END PGP SIGNATURE-----

--g7SepDU1tVx8HBQBwS79hijoJmtCBxivC--

