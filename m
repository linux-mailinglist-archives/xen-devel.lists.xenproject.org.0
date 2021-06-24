Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F15463B2B4E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 11:24:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146544.269633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwLad-0004aM-Ah; Thu, 24 Jun 2021 09:24:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146544.269633; Thu, 24 Jun 2021 09:24:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwLad-0004Xq-76; Thu, 24 Jun 2021 09:24:03 +0000
Received: by outflank-mailman (input) for mailman id 146544;
 Thu, 24 Jun 2021 09:24:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ax9=LS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwLab-0004Xi-Iw
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 09:24:01 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 38f517d1-93d5-440a-bd43-8e18a842ce72;
 Thu, 24 Jun 2021 09:24:00 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18AB22195D;
 Thu, 24 Jun 2021 09:24:00 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id E043011A97;
 Thu, 24 Jun 2021 09:23:59 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id z4GlNS9P1GAXQAAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 24 Jun 2021 09:23:59 +0000
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
X-Inumbo-ID: 38f517d1-93d5-440a-bd43-8e18a842ce72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624526640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lfjqJs9CAcNNhXC+z3oQjM+eSBWPvGfNycQzwEl7QRc=;
	b=oACgJAMzQXHmQq1hOAomY7FEw/X83+x+HLA/wZC55Kq3b6zfUsPM1cKCw4hcqV7m/VcOmO
	PZnvm8yoHQbpsfCSBzEX/AbBHY0q4K8c1qA3hWamw/164ENYSDXCK7wPPIhiiSDXwKeVfU
	jcHLYxZTFqZKbNqSc8f4P1loN+kzuHI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624526640; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lfjqJs9CAcNNhXC+z3oQjM+eSBWPvGfNycQzwEl7QRc=;
	b=oACgJAMzQXHmQq1hOAomY7FEw/X83+x+HLA/wZC55Kq3b6zfUsPM1cKCw4hcqV7m/VcOmO
	PZnvm8yoHQbpsfCSBzEX/AbBHY0q4K8c1qA3hWamw/164ENYSDXCK7wPPIhiiSDXwKeVfU
	jcHLYxZTFqZKbNqSc8f4P1loN+kzuHI=
Subject: Re: [PATCH 10/10] tools/xenstored: Delay new transaction while
 Live-Update is pending
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-11-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f2a5a643-17fb-4cb3-fb54-2c80ec45e43e@suse.com>
Date: Thu, 24 Jun 2021 11:23:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616144324.31652-11-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IYkzF63UCtCJxdBqRNaYuPSRbLxNLC57b"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IYkzF63UCtCJxdBqRNaYuPSRbLxNLC57b
Content-Type: multipart/mixed; boundary="NcT2SaY58QGVI6xvg3pmLzItYEgMn1oml";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <f2a5a643-17fb-4cb3-fb54-2c80ec45e43e@suse.com>
Subject: Re: [PATCH 10/10] tools/xenstored: Delay new transaction while
 Live-Update is pending
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-11-julien@xen.org>
In-Reply-To: <20210616144324.31652-11-julien@xen.org>

--NcT2SaY58QGVI6xvg3pmLzItYEgMn1oml
Content-Type: multipart/mixed;
 boundary="------------58443455899DAF2201504E25"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------58443455899DAF2201504E25
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> At the moment, Live-Update will, by default, not proceed if there are
> in-flight transactions. It is possible force it by passing -F but this
> will break any connection with in-flight transactions.
>=20
> There are PV drivers out that may never terminate some transaction. On
> host running such guest, we would need to use -F. Unfortunately, this
> also risks to break well-behaving guests (and even dom0) because
> Live-Update will happen as soon as the timeout is hit.
>=20
> Ideally, we would want to preserve transactions but this requires
> some work and a lot of testing to be able to use it in production.
>=20
> As a stop gap, we want to limit the damage of -F. This patch will delay=

> any transactions that are started after Live-Update has been requested.=

>=20
> If the request cannot be delayed, the connection will be stalled to
> avoid loosing requests.
>=20
> If the connection has already a pending transaction before Live-Update,=

> then new transaction will not be delayed. This is to avoid the connecti=
on
> to stall.
>=20
> With this stop gap in place, domains with long running transactions wil=
l
> still break when using -F, but other domains which starts a transaction=

> in the middle of Live-Update will continue to work.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------58443455899DAF2201504E25
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

--------------58443455899DAF2201504E25--

--NcT2SaY58QGVI6xvg3pmLzItYEgMn1oml--

--IYkzF63UCtCJxdBqRNaYuPSRbLxNLC57b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDUTy8FAwAAAAAACgkQsN6d1ii/Ey82
8gf/W0WEIFnYqcX95AnediIZvOITedmkujGEiqhqJ/S/Q4wVaAfn52xChfWVrjM2HQr+2eLQzwJL
lWA/4Va8Birjsulo4VdSflCSWDAs1Y8cXXXWIL0Ds4j7dF+HI7RTz8SgaFpHg5Td66q/tySuu1yQ
m6N6WalmC0aHSFU9eRK0ZyKt6Y2dVLtm36d2hbES0bnlXlIOXNv2eLygyo1dKUr5Msa7lCUXK1A3
mJi/4p5QI1hr7dH+OsBdMxP1cyjJUrgIKrgxAlB2LxiX5LdhzWsKO+cQHCu3hfQxNjaINSY8MLxJ
S1DOPTk3r8iMWS7F310BVZJ9lq6GaRm3UhkaQ0pJWA==
=h+8i
-----END PGP SIGNATURE-----

--IYkzF63UCtCJxdBqRNaYuPSRbLxNLC57b--

