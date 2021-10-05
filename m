Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 68ED8421EEA
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 08:39:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202026.356684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXe6L-0007P8-SE; Tue, 05 Oct 2021 06:38:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202026.356684; Tue, 05 Oct 2021 06:38:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXe6L-0007MX-Ox; Tue, 05 Oct 2021 06:38:57 +0000
Received: by outflank-mailman (input) for mailman id 202026;
 Tue, 05 Oct 2021 06:38:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/jnY=OZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mXe6J-0007MR-W9
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 06:38:56 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e8e216be-25a6-11ec-beca-12813bfff9fa;
 Tue, 05 Oct 2021 06:38:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1C0331FD36;
 Tue,  5 Oct 2021 06:38:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E35551342A;
 Tue,  5 Oct 2021 06:38:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fy0SNv3yW2FXNQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 05 Oct 2021 06:38:53 +0000
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
X-Inumbo-ID: e8e216be-25a6-11ec-beca-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633415934; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=u2W/0sxDK5AgRn31zQVuvVIXL6AfZ7cpXZaqC4+mztM=;
	b=rrJL+J42VjixomPyBgL7vDUJbWWKd9BEntB5ONZ35Z5mKlBDMV/5HwyYiTsSOT0ed+elDJ
	OWIEy5ZnJPiYFOeVtucXOFEr4WrspX9JrgN/XYE4/FlqCq6F3JcHzFHj1Sv1zpg4wnXGjD
	48faCppWhh34QVyQ0XYG7zBBs/Ln0JI=
Subject: Re: [PATCH v2 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e3f4db18-fe1b-ef73-84d6-a3351d83f8f3@suse.com>
Date: Tue, 5 Oct 2021 08:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="k1flIbnjlsz2Q2MNiCXDWuMdIfECCPdRQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--k1flIbnjlsz2Q2MNiCXDWuMdIfECCPdRQ
Content-Type: multipart/mixed; boundary="lO92llj5y9yTNSIOiYW1T1WQ1BtZ6KvPL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Message-ID: <e3f4db18-fe1b-ef73-84d6-a3351d83f8f3@suse.com>
Subject: Re: [PATCH v2 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
References: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>
In-Reply-To: <9a26d4ff-80a1-e0c1-f528-31a8568d41f7@suse.com>

--lO92llj5y9yTNSIOiYW1T1WQ1BtZ6KvPL
Content-Type: multipart/mixed;
 boundary="------------1FD4F71C571D2E8C96218F6F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1FD4F71C571D2E8C96218F6F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 30.09.21 14:12, Jan Beulich wrote:
> In order to try to debug hypervisor side breakage from XSA-378 I found
> myself urged to finally give PVH Dom0 a try. Sadly things didn't work
> quite as expected. In the course of investigating these issues I actual=
ly
> spotted one piece of PV Dom0 breakage as well, a fix for which is also
> included here.
>=20
> There are one immediate remaining issues: Dom0, unlike in the PV case,
> cannot access the screen (to use as a console) when in a non-default
> mode (i.e. not 80x25 text), as the necessary information (in particular=

> about VESA-bases LFB modes) is not communicated. On the hypervisor side=

> this looks like deliberate behavior, but it is unclear to me what the
> intentions were towards an alternative model. (X may be able to access
> the screen depending on whether it has a suitable driver besides the
> presently unusable /dev/fb<N> based one.)
>=20
> v2 merely addresses small review comments in patches 7 and 9 (see there=
).
>=20
> 1: xen/x86: prevent PVH type from getting clobbered
> 2: xen/x86: allow PVH Dom0 without XEN_PV=3Dy
> 3: xen/x86: make "earlyprintk=3Dxen" work better for PVH Dom0
> 4: xen/x86: allow "earlyprintk=3Dxen" to work for PV Dom0
> 5: xen/x86: make "earlyprintk=3Dxen" work for HVM/PVH DomU
> 6: xen/x86: generalize preferred console model from PV to PVH Dom0
> 7: xen/x86: hook up xen_banner() also for PVH
> 8: x86/PVH: adjust function/data placement
> 9: xen/x86: adjust data placement

Series pushed to xen/tip.git for-linus-5.15b


Juergen


--------------1FD4F71C571D2E8C96218F6F
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

--------------1FD4F71C571D2E8C96218F6F--

--lO92llj5y9yTNSIOiYW1T1WQ1BtZ6KvPL--

--k1flIbnjlsz2Q2MNiCXDWuMdIfECCPdRQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFb8v0FAwAAAAAACgkQsN6d1ii/Ey/r
ygf+JsV9JgkOA9ziBmzoFUbqdSlb+9FIA4VJWD1jM5K9/QeDROVDGg8n0hcHQlEFjMw6z42qK28X
Q18A2UgSACIRTT0gXypsKCZM2y5y+WTHtsVY6c/Bs70kaV+3EKDzaWPRfNWeB5h62i3EbW5G+As+
t76FduJiec8hgRwG1DJNqvNa9+puyoZB1TTa+y0kQhFWgCE8fuYKwVi5g6gbuc8sKbbmS+at6m1r
lEq/Xb4ZaVD+QsCGSqtWsoOdg2vITcqDBUP72kpmXIHn2z8MSHWeew0moilVX1+m/k3LqZpvJ9EG
UmYk9QcagAjF2gxN9POs+w+ajL4hsdpWay92Okym+w==
=OtMC
-----END PGP SIGNATURE-----

--k1flIbnjlsz2Q2MNiCXDWuMdIfECCPdRQ--

