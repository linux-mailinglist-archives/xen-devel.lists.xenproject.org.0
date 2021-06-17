Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6C83AAA95
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 06:56:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143603.264577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltk4N-0001WZ-9m; Thu, 17 Jun 2021 04:55:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143603.264577; Thu, 17 Jun 2021 04:55:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltk4N-0001Tm-6d; Thu, 17 Jun 2021 04:55:59 +0000
Received: by outflank-mailman (input) for mailman id 143603;
 Thu, 17 Jun 2021 04:55:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bffI=LL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ltk4L-0001Tg-Fu
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 04:55:57 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4df4dea0-728e-4f2f-8bf1-00e70a38d7f9;
 Thu, 17 Jun 2021 04:55:56 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 63C40219E4;
 Thu, 17 Jun 2021 04:55:55 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1E1C6118DD;
 Thu, 17 Jun 2021 04:55:55 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id dAQhBtvVymAwQwAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 17 Jun 2021 04:55:55 +0000
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
X-Inumbo-ID: 4df4dea0-728e-4f2f-8bf1-00e70a38d7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623905755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E36MNh3UfUWCEgSQ7/x84RbS9i6ZwfJBT3hTXJiUfiE=;
	b=os8KGbJkFoFq6958tvzGjoa8yDE89Mj0ECefdLFJAtTVZ2szcSA+AkSPXHoN8p2RU/7V2c
	GqT67dx34sABU2GEcXZbR8AqfwF2DKlazAVlA2UbMvYT48pJYJgEUCXaCCjWiODgD5Fnjg
	QPZI1EnsoN6j5yNQFsVEmmIcUCNaJVg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623905755; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E36MNh3UfUWCEgSQ7/x84RbS9i6ZwfJBT3hTXJiUfiE=;
	b=os8KGbJkFoFq6958tvzGjoa8yDE89Mj0ECefdLFJAtTVZ2szcSA+AkSPXHoN8p2RU/7V2c
	GqT67dx34sABU2GEcXZbR8AqfwF2DKlazAVlA2UbMvYT48pJYJgEUCXaCCjWiODgD5Fnjg
	QPZI1EnsoN6j5yNQFsVEmmIcUCNaJVg=
Subject: Re: hypercalls with 64-bit results
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2adfba14-8adb-89d8-3e8b-a25aef6fc2d6@suse.com>
Date: Thu, 17 Jun 2021 06:55:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="zJNavzvWrmM7tdMNTIKi4bu2e92vxC4Jy"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--zJNavzvWrmM7tdMNTIKi4bu2e92vxC4Jy
Content-Type: multipart/mixed; boundary="Lh0wGOpypYfBtGM0AC9S2NBFy2DLGUZ5f";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <2adfba14-8adb-89d8-3e8b-a25aef6fc2d6@suse.com>
Subject: Re: hypercalls with 64-bit results
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
In-Reply-To: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>

--Lh0wGOpypYfBtGM0AC9S2NBFy2DLGUZ5f
Content-Type: multipart/mixed;
 boundary="------------0FEDB2DFDD21089219872CD1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0FEDB2DFDD21089219872CD1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 16.06.21 18:04, Jan Beulich wrote:
> All,
>=20
> several years back do_memory_op() in libxc was changed to have "long"
> return type. This is because some of the sub-ops return potentially
> large values as the hypercall return value (i.e. not in an argument
> structure field). This change, however, didn't have the intended
> effect from all I can tell, which apparently manifests in the present
> two remaining ovmf failures in the staging osstest flights. Anthony
> tells me that ovmf as of not very long ago puts the shared info page
> at a really high address, thus making the p2m of the guest very large.
> Its size gets returned by XENMEM_maximum_gpfn, as function return
> value.
>=20
> Since hypercalls from the tool stack are based on ioctl(), and since
> ioctl() has a return type of "int", I'm afraid there's no way we can
> deal with this by adjusting function return types in the libraries.
> Instead we appear to need either a new privcmd ioctl or new XENMEM_*
> subops (for those cases where potentially large values get returned).

I think we can just use a multicall in libxc to wrap the affected
operations.


Juergen

--------------0FEDB2DFDD21089219872CD1
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

--------------0FEDB2DFDD21089219872CD1--

--Lh0wGOpypYfBtGM0AC9S2NBFy2DLGUZ5f--

--zJNavzvWrmM7tdMNTIKi4bu2e92vxC4Jy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDK1doFAwAAAAAACgkQsN6d1ii/Ey/x
Kgf+KT2pv9nZvRlBIPad7YWCzH+ThXNhkR9c5U+KpJ43Ji56Tcx8Gj2FUkHvqZY+T3Jj4736wZMJ
9mj6hfL2pp1IROIkygiiyd/gMdqvDIOT2RiB2gvV7LHqY9H6imLyOXbZbqo3OmHszIl95a39DW8n
2Wpm+OVxA4nx8A5aGXIV0w5dFNyHqGA2CLHnwsWGVy0H3sGD/YB8OgCAulygSjeI4qiGpPb6onrg
xv7LFXPrXn/2zCSqNdK22HC1bKIgLO4ohf3fRibwgSwnsv0g8PvVpKArRmqe6pHP1RIDsBiBbMK8
x7xRgYtBOPAw8PFnWnEvGjZONjxnPOgxjqYr3UBJPQ==
=DhZc
-----END PGP SIGNATURE-----

--zJNavzvWrmM7tdMNTIKi4bu2e92vxC4Jy--

