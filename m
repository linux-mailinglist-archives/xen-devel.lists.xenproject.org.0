Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 894F1398E4A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jun 2021 17:19:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136109.252592 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSdv-0007Kv-4i; Wed, 02 Jun 2021 15:18:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136109.252592; Wed, 02 Jun 2021 15:18:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1loSdu-0007Hy-SD; Wed, 02 Jun 2021 15:18:50 +0000
Received: by outflank-mailman (input) for mailman id 136109;
 Wed, 02 Jun 2021 15:18:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Q/fn=K4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1loSds-0004jV-HM
 for xen-devel@lists.xenproject.org; Wed, 02 Jun 2021 15:18:48 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c8e6fa52-9500-49dc-af38-aa66c03b5315;
 Wed, 02 Jun 2021 15:18:31 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 39C8A1FE26;
 Wed,  2 Jun 2021 15:18:30 +0000 (UTC)
Received: by imap.suse.de (Postfix, from userid 51)
 id 3019A11CD5; Wed,  2 Jun 2021 16:06:26 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 43A3A11EA9;
 Wed,  2 Jun 2021 13:48:36 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 1948DzSMt2CHUAAALh3uQQ
 (envelope-from <jgross@suse.com>); Wed, 02 Jun 2021 13:48:36 +0000
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
X-Inumbo-ID: c8e6fa52-9500-49dc-af38-aa66c03b5315
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622647110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D65dpeEgcvshZPY6JSFiSgrHsN2KCrew/EttgjaOezE=;
	b=PKZ547hI4tyzNwF5/ioezn+9zgFJ3mwfGKzjRVDZEP9dAuhhSz3DHo8e6g7sUxzsBdBZ6M
	J5CsPwYNWG9IiGEJww1idvRA7meKbDUMIhNGzK0Fs9t/kqDdUkhozk9K8A4Tn70XKvdOUO
	iF9LhmcqmQYlNsEa+NRJ80zt0IKG4Pg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1622641716; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D65dpeEgcvshZPY6JSFiSgrHsN2KCrew/EttgjaOezE=;
	b=Xf1y7LK2U3aNSSkECbjoWl4JwYVFqUOMgq4ms1i7f9s1ny6pqrIlAuD3xLx61gIpsGlyEk
	52B1smfa05IIFqygydKsM0O93/QUyQmGID1lgOfgLsFhJI/piPLx0R1GZp/KwQVa8CaFX3
	PlESGLFAhKlmDSYRtIaiSZkR4zgG7g4=
Subject: Re: [PATCH v20210602 02/38] xl: fix description of migrate --debug
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-3-olaf@aepfle.de>
 <20210602143215.3a0cb971.olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <91cf7800-76f9-245d-b0a0-9c0fe3bf1a02@suse.com>
Date: Wed, 2 Jun 2021 15:48:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602143215.3a0cb971.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wke2dD5zmEQ8GMehUaOe8Sn7Ts71OzDSo"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wke2dD5zmEQ8GMehUaOe8Sn7Ts71OzDSo
Content-Type: multipart/mixed; boundary="xPy1LWsPMLA4hsPlCxw6siZ9rz1mrLxHm";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <91cf7800-76f9-245d-b0a0-9c0fe3bf1a02@suse.com>
Subject: Re: [PATCH v20210602 02/38] xl: fix description of migrate --debug
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-3-olaf@aepfle.de>
 <20210602143215.3a0cb971.olaf@aepfle.de>
In-Reply-To: <20210602143215.3a0cb971.olaf@aepfle.de>

--xPy1LWsPMLA4hsPlCxw6siZ9rz1mrLxHm
Content-Type: multipart/mixed;
 boundary="------------7C7FED5B6629F9435C906E8B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7C7FED5B6629F9435C906E8B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.06.21 14:32, Olaf Hering wrote:
> xl migrate --debug used to track every pfn in every batch of pages.
> But these times are gone. The code in xc_domain_save is the consumer
> of this knob, but it considers it only for the remus and colo case.
>=20
> Adjust the help text to tell what --debug does today: Nothing.
>=20
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>=20
> v02:
> - the option has no effect anymore

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------7C7FED5B6629F9435C906E8B
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

--------------7C7FED5B6629F9435C906E8B--

--xPy1LWsPMLA4hsPlCxw6siZ9rz1mrLxHm--

--wke2dD5zmEQ8GMehUaOe8Sn7Ts71OzDSo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC3jDMFAwAAAAAACgkQsN6d1ii/Ey98
jggAkwsh9HvGSm/pxkKUd2AvYJwv8ig0kFSnNpZMlfQDanEQQuPr4i3rXOgvxQ048FFVJuhRNOFs
ZldUGM1DDEAbZeYPLKdqVcVsa9pI1EG5Nd3hFVwMMon0RYEu3FpLoCb8ZxivLDYcH2C7rx3kw7I6
8ZxK4sYmT2/ERm84v2jGtYK+Z5FgFksf2NS6soqbFIw0xl4Q1rSf/wbPWSTU0R9AGorh2TsF5tCD
s4PLtZdV6YbWRgoUuF/DS3K+cxmNf3i5QXOiQBdPPzZdtUYd5w2uJ3GsrGoF71fIq6t5qEtG+a42
ZIIh+jcoDB0GeQGqdGJiCdp36xI4CBCjsAb7gSqCQg==
=97dm
-----END PGP SIGNATURE-----

--wke2dD5zmEQ8GMehUaOe8Sn7Ts71OzDSo--

