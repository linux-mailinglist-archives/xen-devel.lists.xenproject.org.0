Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F17F93B287D
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 09:22:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146409.269389 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwJgL-0005m9-7K; Thu, 24 Jun 2021 07:21:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146409.269389; Thu, 24 Jun 2021 07:21:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwJgL-0005jm-3C; Thu, 24 Jun 2021 07:21:49 +0000
Received: by outflank-mailman (input) for mailman id 146409;
 Thu, 24 Jun 2021 07:21:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ax9=LS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwJgJ-0005jg-7m
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 07:21:47 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77837906-0143-41f4-84b6-38507f91367c;
 Thu, 24 Jun 2021 07:21:45 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A9FB82197E;
 Thu, 24 Jun 2021 07:21:44 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 694B611A97;
 Thu, 24 Jun 2021 07:21:44 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id nvMuFogy1GCkewAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 24 Jun 2021 07:21:44 +0000
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
X-Inumbo-ID: 77837906-0143-41f4-84b6-38507f91367c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624519304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iBMd1VnM1SymcmFQSVpTidkwVIA930Jq4H7AHEVg+ig=;
	b=QmEhebshPKP0XmlJPbZnZ8R4my8g1HcJPxmTHkvIMclMBLHJ9c42a78SJ2m0kndSDj97BE
	qlobRTj9n17V5wR8wyMYA49YAD63ChQrJRmRLfb+n5G4wBqRDSTJXyAe0B0BJMWa0+GAGw
	E3Z8sLYlzAExT+3EKE/tKyDyjeOAI3U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624519304; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iBMd1VnM1SymcmFQSVpTidkwVIA930Jq4H7AHEVg+ig=;
	b=QmEhebshPKP0XmlJPbZnZ8R4my8g1HcJPxmTHkvIMclMBLHJ9c42a78SJ2m0kndSDj97BE
	qlobRTj9n17V5wR8wyMYA49YAD63ChQrJRmRLfb+n5G4wBqRDSTJXyAe0B0BJMWa0+GAGw
	E3Z8sLYlzAExT+3EKE/tKyDyjeOAI3U=
Subject: Re: [PATCH 02/10] tools/xenstored: Introduce lu_get_connection() and
 use it
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-3-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e1a65b5b-874c-ae7d-dd7c-9dbf1aea7cbc@suse.com>
Date: Thu, 24 Jun 2021 09:21:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616144324.31652-3-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="JrNVaHBkfC78R4iXdvHbqzHJcSDsY0MFe"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--JrNVaHBkfC78R4iXdvHbqzHJcSDsY0MFe
Content-Type: multipart/mixed; boundary="80XlrZkyMXvqn2dooROfuTJHoqJoEjsuE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <e1a65b5b-874c-ae7d-dd7c-9dbf1aea7cbc@suse.com>
Subject: Re: [PATCH 02/10] tools/xenstored: Introduce lu_get_connection() and
 use it
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-3-julien@xen.org>
In-Reply-To: <20210616144324.31652-3-julien@xen.org>

--80XlrZkyMXvqn2dooROfuTJHoqJoEjsuE
Content-Type: multipart/mixed;
 boundary="------------6D551229CDA272F2688C96BD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6D551229CDA272F2688C96BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, dump_state_buffered_data() is taking two connections
> in parameters (one is the connection to dump, the other is the
> connection used to request LU). The naming doesn't help to
> distinguish (c vs conn) them and this already lead to several mistake
> while modifying the function.
>=20
> To remove the confusion, introduce an help lu_get_connection() that
> will return the connection used to request LU and use it
> in place of the existing parameter.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------6D551229CDA272F2688C96BD
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

--------------6D551229CDA272F2688C96BD--

--80XlrZkyMXvqn2dooROfuTJHoqJoEjsuE--

--JrNVaHBkfC78R4iXdvHbqzHJcSDsY0MFe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDUMocFAwAAAAAACgkQsN6d1ii/Ey9P
BQf9GelxsCP2Ywqzrp4y+3SZCeH0PcBv+D2fTMdytq+ktrYQPLW7EJPKypJl7P6lHxdvdtGtN0jl
WoteWlG2laGbOAnq3FYw4RqGFSyEs2MPeByCIjgojvjEVaRdsX+S/SQJ7IexH5QndmZieYLS5nkC
NX+lD2XL7XpTzHQGBl90SnsCYsBMX6Spu2VY12AvUoBiF/oqjM/pmDwvlGd8RetKZFAPWFxo/MVB
xBWEsVHkHQ7XSk8b0UeR9hPdADy+CkbgvIGW90pN7PPqXU0TSaE+WsoPX7rdVJW7L9IHOlBKfxze
+UOb3mI4xaGMUy1ELJgBZuux6OHB3oqYGuzPiKhLfg==
=Huk+
-----END PGP SIGNATURE-----

--JrNVaHBkfC78R4iXdvHbqzHJcSDsY0MFe--

