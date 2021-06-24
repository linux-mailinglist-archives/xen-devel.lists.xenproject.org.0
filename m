Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5883B2988
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 09:40:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146436.269443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwJxd-0001OD-TD; Thu, 24 Jun 2021 07:39:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146436.269443; Thu, 24 Jun 2021 07:39:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwJxd-0001Ln-Pd; Thu, 24 Jun 2021 07:39:41 +0000
Received: by outflank-mailman (input) for mailman id 146436;
 Thu, 24 Jun 2021 07:39:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ax9=LS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lwJxb-0001Lh-Ui
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 07:39:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43eedfa9-54af-4832-89ba-d3571343ac38;
 Thu, 24 Jun 2021 07:39:38 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C52A41FD66;
 Thu, 24 Jun 2021 07:39:37 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 8618D11A97;
 Thu, 24 Jun 2021 07:39:37 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id YxJ/H7k21GDRBQAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 24 Jun 2021 07:39:37 +0000
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
X-Inumbo-ID: 43eedfa9-54af-4832-89ba-d3571343ac38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624520377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=25UwmIJOXDIhmJyv5n0I5nZf7hU2bre0iKAeuX0TwzQ=;
	b=LmVxR6+pc7fYNVRyUzBi5fRhSh1Q5GmTe3aBmyLZzkEW3zuMUxkC5CKnux90goJmMxA8uY
	tE2aaDOuVbiWA8wnSY3PBRGCPSpS8jWkcdLrrJDrnk5Iv8ldPpDg/sHYYSJNYEtlmqcRBn
	09Rib8Fxu/rB960v19mVBOdbkIlfQRQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624520377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=25UwmIJOXDIhmJyv5n0I5nZf7hU2bre0iKAeuX0TwzQ=;
	b=LmVxR6+pc7fYNVRyUzBi5fRhSh1Q5GmTe3aBmyLZzkEW3zuMUxkC5CKnux90goJmMxA8uY
	tE2aaDOuVbiWA8wnSY3PBRGCPSpS8jWkcdLrrJDrnk5Iv8ldPpDg/sHYYSJNYEtlmqcRBn
	09Rib8Fxu/rB960v19mVBOdbkIlfQRQ=
Subject: Re: [PATCH 06/10] tools/xenstored: Introduce a wrapper for
 conn->funcs->can_{read, write}
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-7-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bdd6a6a3-b1ab-0629-9873-a474bd33ef66@suse.com>
Date: Thu, 24 Jun 2021 09:39:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616144324.31652-7-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="OCpk3NuKoPLc9NNh0QJfQscCYI61iPFoO"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--OCpk3NuKoPLc9NNh0QJfQscCYI61iPFoO
Content-Type: multipart/mixed; boundary="bfc1YOU1z0js8oRUL84brIkPJ0449K3aF";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <bdd6a6a3-b1ab-0629-9873-a474bd33ef66@suse.com>
Subject: Re: [PATCH 06/10] tools/xenstored: Introduce a wrapper for
 conn->funcs->can_{read, write}
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-7-julien@xen.org>
In-Reply-To: <20210616144324.31652-7-julien@xen.org>

--bfc1YOU1z0js8oRUL84brIkPJ0449K3aF
Content-Type: multipart/mixed;
 boundary="------------E99E79B311ABB28A2A6792FA"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E99E79B311ABB28A2A6792FA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 16:43, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>=20
> Currently, the callbacks can_read and can_write are called directly. Th=
is
> doesn't allow us to add generic check and therefore requires duplicatio=
n.
>=20
> At the moment, one check that could benefit to be common is whether the=

> connection should ignored. The position is slightly different between
> domain and socket because for the latter we want to check the state of
> the file descriptor first.
>=20
> In follow-up patches, there will be more potential generic checks.
>=20
> This patch provides wrappers to read/write a connection and move
> the check ->is_ignored after the callback for everyone.
>=20
> This also requires to replace the direct call to domain_can_read()
> and domain_can_write() with the new wrapper. At the same time,
> both functions can now be static. Note that the implementations need
> to be moved earlier in the file xenstored_domain.c to avoid
> declaring the prototype.
>=20
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------E99E79B311ABB28A2A6792FA
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

--------------E99E79B311ABB28A2A6792FA--

--bfc1YOU1z0js8oRUL84brIkPJ0449K3aF--

--OCpk3NuKoPLc9NNh0QJfQscCYI61iPFoO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDUNrgFAwAAAAAACgkQsN6d1ii/Ey+h
ogf+MMMUI5Juxn/ajqDtQuXypfn2zmr61S+rk4VpwJjTWxxVD+td/b9Eq5XRnK1lYXbHQnes9Kgp
CcxCedtyO4Pk5wc9USyhaj+VxJoxbg3tjTrIyvP/hsnRjagSO3pC+mB2KGgxEdclEHlr060Lookm
Lh/8iwhYQKqUPIdNjTYvjyWA0Mi5hHed42FWtoKCOHQLbS8qm1C2cQQcMgXMBTSMgULEIk58M/O3
BVJjm/9Tr6/Wn9IrwVngiwNvo6kA+qhS5NY3Av7vyVwkE4FOpHBABRzjKS8kq4LJrwB+4SnbIF+H
RFSVSfZ5Vk+MbeSbdLIboBmyZ2sXdzKwT2eKnBGxPw==
=w7DI
-----END PGP SIGNATURE-----

--OCpk3NuKoPLc9NNh0QJfQscCYI61iPFoO--

