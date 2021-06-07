Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CB239D98D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 12:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137795.255243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqCOv-0004Ov-Sc; Mon, 07 Jun 2021 10:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137795.255243; Mon, 07 Jun 2021 10:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lqCOv-0004Ly-PJ; Mon, 07 Jun 2021 10:22:33 +0000
Received: by outflank-mailman (input) for mailman id 137795;
 Mon, 07 Jun 2021 10:22:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kcEO=LB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lqCOt-0004Ls-Ub
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 10:22:31 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5a94c5b9-18c8-40fe-848b-59b3e251b7ca;
 Mon, 07 Jun 2021 10:22:29 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D7FB121A82;
 Mon,  7 Jun 2021 10:22:28 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id ABDC1118DD;
 Mon,  7 Jun 2021 10:22:28 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id iLHWKGTzvWA3MgAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 07 Jun 2021 10:22:28 +0000
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
X-Inumbo-ID: 5a94c5b9-18c8-40fe-848b-59b3e251b7ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623061348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YA0TCfr7yyuDvKIkc0PlRKhwillcAmnJKdpen7tfIEE=;
	b=HgTLYRvvv1HqJXdRHovs8P4jqXqNZK2eOdY/WcBR7CibgT+c7Cp5S+GxewQdEZeSxHW/hS
	bC+rEGB3Gp3Tst9fPOASqGd4GePHdtnDS4XQVxMLkgx94AU5QzznFRqLmUbPdVUTfH6yFV
	x2iNDEAFu2zlOPbRvZ3le6RG+WoNjmM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623061348; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YA0TCfr7yyuDvKIkc0PlRKhwillcAmnJKdpen7tfIEE=;
	b=HgTLYRvvv1HqJXdRHovs8P4jqXqNZK2eOdY/WcBR7CibgT+c7Cp5S+GxewQdEZeSxHW/hS
	bC+rEGB3Gp3Tst9fPOASqGd4GePHdtnDS4XQVxMLkgx94AU5QzznFRqLmUbPdVUTfH6yFV
	x2iNDEAFu2zlOPbRvZ3le6RG+WoNjmM=
Subject: Re: [PATCH v20210601 07/38] tools: unify type checking for data pfns
 in migration stream
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-8-olaf@aepfle.de>
 <9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
 <20210602132114.6fd9ee87.olaf@aepfle.de>
 <1e0a9a6d-b3b3-29e7-43dc-453711e666a7@suse.com>
 <20210607121214.3119d315.olaf@aepfle.de>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f124c2a3-94a6-5a4c-cfce-ff1abdcd42b2@suse.com>
Date: Mon, 7 Jun 2021 12:22:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210607121214.3119d315.olaf@aepfle.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5xf7Uo7xbE3PZjPKp5VohteNPG8z1VGfC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5xf7Uo7xbE3PZjPKp5VohteNPG8z1VGfC
Content-Type: multipart/mixed; boundary="pznvlZ8uE57IBHZnqF5MehJ16zOrLAIZG";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Olaf Hering <olaf@aepfle.de>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Message-ID: <f124c2a3-94a6-5a4c-cfce-ff1abdcd42b2@suse.com>
Subject: Re: [PATCH v20210601 07/38] tools: unify type checking for data pfns
 in migration stream
References: <20210601161118.18986-1-olaf@aepfle.de>
 <20210601161118.18986-8-olaf@aepfle.de>
 <9045add9-0cd0-7f9d-87ef-26cea15b74cd@suse.com>
 <20210602132114.6fd9ee87.olaf@aepfle.de>
 <1e0a9a6d-b3b3-29e7-43dc-453711e666a7@suse.com>
 <20210607121214.3119d315.olaf@aepfle.de>
In-Reply-To: <20210607121214.3119d315.olaf@aepfle.de>

--pznvlZ8uE57IBHZnqF5MehJ16zOrLAIZG
Content-Type: multipart/mixed;
 boundary="------------E9775A97C2EC0A2CC59A2367"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E9775A97C2EC0A2CC59A2367
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.06.21 12:12, Olaf Hering wrote:
> Am Wed, 2 Jun 2021 14:03:40 +0200
> schrieb Juergen Gross <jgross@suse.com>:
>=20
>> Maybe XEN_DOMCTL_PFINFO_XALLOC should no longer be supported, i.e.
>> a stream containing it should be rejected? This might be a
>> worthwhile modification of patch 5.
>=20
> If there is a desire to actively break incoming domUs from pre-4.6 host=
s, this should probably be done in a separate change.
>=20
> I have not checked if such migration works today with unmodified xen.gi=
t#staging.

At least with your patch this might change now, as you are modifying
the behavior in case of XEN_DOMCTL_PFINFO_XALLOC.

Officially pre-4.6 hosts are not supported regarding LM. So your patch
should be fine in this regard. OTH I'd rather have a clear failure than
a maybe weird behavior in case a stream is containing a record with
XEN_DOMCTL_PFINFO_XALLOC.


Juergen

--------------E9775A97C2EC0A2CC59A2367
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

--------------E9775A97C2EC0A2CC59A2367--

--pznvlZ8uE57IBHZnqF5MehJ16zOrLAIZG--

--5xf7Uo7xbE3PZjPKp5VohteNPG8z1VGfC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmC982QFAwAAAAAACgkQsN6d1ii/Ey/s
7AgAhk3ZOl2ukINKIGZtNzg1au8X3nkyWelQLwz6YncAs7+VaN2Jf26DValGvpoZ7h9k4dhIqrhi
oSQ31MofjWq2Fg3O2d5bDMBgGD1ccKSzohwOg+QTbQEe0Yw+K18bIZWTrheBvGBclczfb35dxmJ3
dfgBgjXsPRixNa9KETq91TNpwPaTEY+ofb5FuU2tb7fxGQivtaitncksywG+etINHLJgazeKRPEc
qaWOsIXXVj5nQyRJe7ikL+hhSxwCPpShE2911G2hWIHge2vlPGGeEX6NoucmSk+Ux6Ukdn1828wN
mOE+OJYZX0QD/9JJqFCia14lP7SB4onyUIsSl+dAAw==
=gpdx
-----END PGP SIGNATURE-----

--5xf7Uo7xbE3PZjPKp5VohteNPG8z1VGfC--

