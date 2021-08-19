Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B86F83F1AFB
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:55:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168831.308296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiVH-0002wM-AI; Thu, 19 Aug 2021 13:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168831.308296; Thu, 19 Aug 2021 13:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGiVH-0002ta-5x; Thu, 19 Aug 2021 13:54:43 +0000
Received: by outflank-mailman (input) for mailman id 168831;
 Thu, 19 Aug 2021 13:54:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7+2=NK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGiVF-0002tU-1o
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:54:41 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 340f3e41-39b2-465b-a7dd-4dc0350287f3;
 Thu, 19 Aug 2021 13:54:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1738A1FDA4;
 Thu, 19 Aug 2021 13:54:39 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id C39631363C;
 Thu, 19 Aug 2021 13:54:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 0F9QLZ5iHmHXfwAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 19 Aug 2021 13:54:38 +0000
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
X-Inumbo-ID: 340f3e41-39b2-465b-a7dd-4dc0350287f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629381279; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r1+ltUWql8Ucc9tu8CwNbwMd7GT5PEksV9EGwMbyiEs=;
	b=S8y3bOffmFypQTUO8JXATOFkSIOGckjlbrG1AIHmLZ1fEJBV5F1rpR3hEbWvMdNSSkJVvh
	Z3pw6ySeBSykp3pevT64zN3OURH5xveO8eJ4vnsBd+jzYOoD6HLERIhI9o0/TcI23GjR6Y
	WAlv6FPUSAF3+U1RYrRJ6oUq35dVAk0=
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <24862.23463.360542.801702@mariner.uk.xensource.com>
 <20210819132617.10668-1-iwj@xenproject.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] SUPPORT.md: Explicitly desupport pvgrub1; and support
 grub-pv
Message-ID: <caa66294-1beb-959f-c117-53562a0d00f7@suse.com>
Date: Thu, 19 Aug 2021 15:54:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210819132617.10668-1-iwj@xenproject.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FBecpNaKSJmL9KgPg0frJcrSk9XaoXx7z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FBecpNaKSJmL9KgPg0frJcrSk9XaoXx7z
Content-Type: multipart/mixed; boundary="WwsGgCgvvv3tNZinQXQZkpaGCdypxPIfa";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Message-ID: <caa66294-1beb-959f-c117-53562a0d00f7@suse.com>
Subject: Re: [PATCH] SUPPORT.md: Explicitly desupport pvgrub1; and support
 grub-pv
References: <24862.23463.360542.801702@mariner.uk.xensource.com>
 <20210819132617.10668-1-iwj@xenproject.org>
In-Reply-To: <20210819132617.10668-1-iwj@xenproject.org>

--WwsGgCgvvv3tNZinQXQZkpaGCdypxPIfa
Content-Type: multipart/mixed;
 boundary="------------8B950C7A6B8728467F8A371B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------8B950C7A6B8728467F8A371B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 19.08.21 15:26, Ian Jackson wrote:
> We can no longer conveniently even test pv-grub1; osstest tests for
> this have just been dropped from all Xen branches
> (by osstest.git#8dee6e333622).
>=20
> This is without prejudice to its eventual removal.  We should perhaps
> proceed cautiously with that since it may be helpful for some old
> guests.

Probably, yes. OTOH keeping just old binaries should work without
any problem. This might be worth considering.

Especially as this would open up the path to drop the support of
32-bit libxenctrl/libxenguest support on 64-bit platforms in case we
want to got that route.

> Under the circumstances, I think this patch has to be a backport
> candidate to all still-supported trees.
>=20
> CC: Juergen Gross <jgross@suse.com>
> CC: Jan Beulich <jbeulich@suse.com>,
> CC: Wei Liu <wl@xen.org>
> Backport-requested-by: Ian Jackson <iwj@xenproject.org>
> Signed-off-by: Ian Jackson <iwj@xenproject.org>
> ---
>   SUPPORT.md | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
>=20
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 317392d8f3..9db027a85f 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -832,6 +832,28 @@ OVMF firmware implements the UEFI boot protocol.
>  =20
>       Status, qemu-xen: Supported
>  =20
> +### grub-pv aka pvgrub2 (guest bootloader)
> +
> +    Status: Supported
> +
> +Support in upstream GRUB2 for running in Xen PV, to booting Xen PV
> +guests.
> +
> +Collaboration (and security coordination) and fixes will be provided
> +by the Xen Project, as needed.
> +
> +### x86/HVM pvgrub1 (aka stubdom pv-grub)

s/HVM/PV/

> +
> +    Status: Obsolescent, limited support
> +
> +GRUB1 compiled with minios and Xen stubdom, to run in guest context.
> +This is provided in the Xen source distribution for the benefit of
> +very old guests; it is no longer tested, but build and functionality
> +fixes are welcome.
> +
> +pvgrub1 is not security-supported.  However, it runs in guest context,=

> +so there should be no implications for host security.
> +


Juergen


--------------8B950C7A6B8728467F8A371B
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

--------------8B950C7A6B8728467F8A371B--

--WwsGgCgvvv3tNZinQXQZkpaGCdypxPIfa--

--FBecpNaKSJmL9KgPg0frJcrSk9XaoXx7z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEeYp4FAwAAAAAACgkQsN6d1ii/Ey95
5Af/dnB5Lwm201QVjvUgLXCckmxq//CL8MRcrfz680DY8qJk3DomNx8Mjg/Cas4rAvHOJlKR9oRo
/LMjxJF6cCXEmlyiyAPYfFXeeZH23TfklzLvF49ZfkJmx4egqDVnk5iH3SrWG+VJ3/0NjQ4iLpvd
pjZ3qn2dtfPEci4dMYYDxcX5lqTSLbcG6QcMdI62Uif34JDufeLhKUj1hs/Z9G8XF4eSqFu7+MnA
mYMVI1en8RPGhVw54ZXTMKdGHVeYFmhA7V/RBS3OBBEHj7Zgqc026QIcUykFSl7CX73LWZQev4sx
Fd/OXrDFsS/bqEMhReLpi4jRxG8wnzO9ug+Tw+6isA==
=Vo2+
-----END PGP SIGNATURE-----

--FBecpNaKSJmL9KgPg0frJcrSk9XaoXx7z--

