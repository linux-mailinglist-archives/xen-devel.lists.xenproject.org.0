Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FF43B2968
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 09:36:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146425.269423 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwJu1-0008WU-5V; Thu, 24 Jun 2021 07:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146425.269423; Thu, 24 Jun 2021 07:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwJu1-0008Ti-0O; Thu, 24 Jun 2021 07:35:57 +0000
Received: by outflank-mailman (input) for mailman id 146425;
 Thu, 24 Jun 2021 07:35:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ax9=LS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwJu0-0008Ta-6x
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 07:35:56 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9cb16e62-4821-416e-b3bf-9f00f672b300;
 Thu, 24 Jun 2021 07:35:55 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BB62A2197E;
 Thu, 24 Jun 2021 07:35:54 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 7F4D611A97;
 Thu, 24 Jun 2021 07:35:54 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id rQtnHdo11GCQAwAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 24 Jun 2021 07:35:54 +0000
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
X-Inumbo-ID: 9cb16e62-4821-416e-b3bf-9f00f672b300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624520154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0EkdKkisfuHr55+cqW5Usgz9i6J8IrNZ6rHa3/zBZrI=;
	b=e6UsJXxmz42MB+Tgf95HDcvucZkOszdbmnpfmKv2L7a0qJcUWtyJ+RDfodRSG4vH7kqZFA
	1PloioKkrLROggknRyIukOGpQFD69tzKbV7ZmjYLlz97+npWLtQVgt4T2g+qp+ebWvxxET
	50V/KBplVLOOBmBdRTxY8iAjCW7dKmI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624520154; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0EkdKkisfuHr55+cqW5Usgz9i6J8IrNZ6rHa3/zBZrI=;
	b=e6UsJXxmz42MB+Tgf95HDcvucZkOszdbmnpfmKv2L7a0qJcUWtyJ+RDfodRSG4vH7kqZFA
	1PloioKkrLROggknRyIukOGpQFD69tzKbV7ZmjYLlz97+npWLtQVgt4T2g+qp+ebWvxxET
	50V/KBplVLOOBmBdRTxY8iAjCW7dKmI=
Subject: Re: [PATCH 04/10] tools/xenstored: Limit the number of requests a
 connection can delay
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-5-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2a086073-5da3-dc80-3b41-ff0e70101c01@suse.com>
Date: Thu, 24 Jun 2021 09:35:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616144324.31652-5-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dYkN3K2nZFopLrAgrwz2EsJImcWewBBji"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dYkN3K2nZFopLrAgrwz2EsJImcWewBBji
Content-Type: multipart/mixed; boundary="KzAzcaHVL0ZAugGtJCKsmNPDISQsna4Xg";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <2a086073-5da3-dc80-3b41-ff0e70101c01@suse.com>
Subject: Re: [PATCH 04/10] tools/xenstored: Limit the number of requests a
 connection can delay
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-5-julien@xen.org>
In-Reply-To: <20210616144324.31652-5-julien@xen.org>

--KzAzcaHVL0ZAugGtJCKsmNPDISQsna4Xg
Content-Type: multipart/mixed;
 boundary="------------0970C87F7796C4AAA7E346DE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0970C87F7796C4AAA7E346DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, only liveupdate request can be delayed. The request can only=

> be performed by a privileged connection (e.g. dom0). So it is fine to
> have no limits.
>=20
> In a follow-up patch we will want to delay request for unprivileged
> connection as well. So it is best to apply a limit.
>=20
> For now and for simplicity, only a single request can be delayed
> for a given unprivileged connection.
>=20
> Take the opportunity to tweak the prototype and provide a way to
> bypass the quota check. This would be useful when the function
> is called from the restore code.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------0970C87F7796C4AAA7E346DE
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

--------------0970C87F7796C4AAA7E346DE--

--KzAzcaHVL0ZAugGtJCKsmNPDISQsna4Xg--

--dYkN3K2nZFopLrAgrwz2EsJImcWewBBji
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDUNdkFAwAAAAAACgkQsN6d1ii/Ey81
OQf/U7YhwGQqpzA6iYNTUaGGx1aCPs/Jvwqp5CrQQ6CB5RDkR5BetvJskXWIQMyyGEiavJyAdKJl
yjNBtJ0AcRPhfeqeyDaTb32/fhhPoQwXXg7LyTa8tBTbcVFVSukLLoIWvtgCnuAgbeRH3NCXuCLC
fBmCCzoO3AjOSQZkpuYRNNBSCsc7M7e+YFthgyv5Cd8uV9VWM8OpC5rP8SQRSfoWh0MfBLUPBrI0
dnQaX/XjVSyUX0J+c8mGlkFNeyp2i7knTlzBTllKXOXkoUzZ1a53Lo9D42p6UllJTIfonKKA5yKN
ZLYU0dpvK+K+48t1q63YaCwAwc4lH96VkMqpdgjaVw==
=DpdV
-----END PGP SIGNATURE-----

--dYkN3K2nZFopLrAgrwz2EsJImcWewBBji--

