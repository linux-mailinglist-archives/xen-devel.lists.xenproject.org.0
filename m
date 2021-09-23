Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17149415E6A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:31:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194070.345700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNsE-0008M3-Tu; Thu, 23 Sep 2021 12:30:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194070.345700; Thu, 23 Sep 2021 12:30:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNsE-0008K1-PQ; Thu, 23 Sep 2021 12:30:46 +0000
Received: by outflank-mailman (input) for mailman id 194070;
 Thu, 23 Sep 2021 12:30:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2Jl=ON=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mTNsE-0008Jv-2O
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:30:46 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 12595b6a-1c6a-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:30:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0E242235E;
 Thu, 23 Sep 2021 12:30:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AEA6013C62;
 Thu, 23 Sep 2021 12:30:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NvNjKXNzTGG3JwAAMHmgww
 (envelope-from <jgross@suse.com>); Thu, 23 Sep 2021 12:30:43 +0000
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
X-Inumbo-ID: 12595b6a-1c6a-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632400243; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LhcIQcMVizxGvHBw/6VV2mKGKHrIYgyDJMe76PlbHdo=;
	b=ocX8UxG9NxyMAuSYlp6hZ/vEpdGknBAUndqPdryiJUC+KAl0JjpDXnzpFQrnke18cHK1uW
	uEL0gyhwtxyL/rS6l9UQwo01xGcvzcNWd4oJj6ee/L4vkjNfdcOT47nAEs4MpLLn642Yi/
	aksD4x0o0RQTz6vumfunHYecFKiAo4k=
Subject: Re: [PATCH RFC 1/3] xen/privcmd: replace kcalloc() by kvcalloc() when
 allocating empty pages
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
 <6d698901-98a4-05be-c421-bcd0713f5335@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6e90efe0-4c0d-55d9-bff8-6da9b9614cd1@suse.com>
Date: Thu, 23 Sep 2021 14:30:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6d698901-98a4-05be-c421-bcd0713f5335@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="DReaxJbM2X5uf5LruUj9ZWLgctnRzIgmv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DReaxJbM2X5uf5LruUj9ZWLgctnRzIgmv
Content-Type: multipart/mixed; boundary="MY6l14mAjftPp6ROEXXWrrmnZRAeYFlKL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 lkml <linux-kernel@vger.kernel.org>
Message-ID: <6e90efe0-4c0d-55d9-bff8-6da9b9614cd1@suse.com>
Subject: Re: [PATCH RFC 1/3] xen/privcmd: replace kcalloc() by kvcalloc() when
 allocating empty pages
References: <0f0db6fa-2604-9a0d-1138-0063b5a39a87@suse.com>
 <6d698901-98a4-05be-c421-bcd0713f5335@suse.com>
In-Reply-To: <6d698901-98a4-05be-c421-bcd0713f5335@suse.com>

--MY6l14mAjftPp6ROEXXWrrmnZRAeYFlKL
Content-Type: multipart/mixed;
 boundary="------------7F2FB7307810C6841AC92D01"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7F2FB7307810C6841AC92D01
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.09.21 12:16, Jan Beulich wrote:
> Osstest has been suffering test failures for a little while from order-=
4
> allocation failures, resulting from alloc_empty_pages() calling
> kcalloc(). As there's no need for physically contiguous space here,
> switch to kvcalloc().
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>

> ---
> RFC: I cannot really test this, as alloc_empty_pages() only gets used i=
n
>       the auto-translated case (i.e. on Arm or PVH Dom0, the latter of
>       which I'm not trusting enough yet to actually start playing with
>       guests).
>=20
> There are quite a few more kcalloc() where it's not immediately clear
> how large the element counts could possibly grow nor whether it would b=
e
> fine to replace them (i.e. physically contiguous space not required).

I don't think those are an issue. Per default the sizes seem to be well
below a single page.

> I wasn't sure whether to Cc stable@ here; the issue certainly has been
> present for quite some time. But it didn't look to cause issues until
> recently.

I'd rather add it to stable. Its not as if the patch had a high
complexity.


Juergen

--------------7F2FB7307810C6841AC92D01
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

--------------7F2FB7307810C6841AC92D01--

--MY6l14mAjftPp6ROEXXWrrmnZRAeYFlKL--

--DReaxJbM2X5uf5LruUj9ZWLgctnRzIgmv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFMc3MFAwAAAAAACgkQsN6d1ii/Ey+0
lQf9GKjiImongEdgd0ahwBbAun2YWu+HqadhVoJKBzKa2XkXfL5RictA7VuW5J1+2XZGQzoiT1YC
VBTg5CeYvp1UoqVV2u7PcgXsfTcgMZc0VLt2pl8HpniFD34ToEFDooENtu/yxeAF557KK5gw+JQG
3ArlHZoOI2e38WXhCTj+nG79GwCbyplgZPwPqlUhAZuYtwQXu9pu6jGKdO6zUCl02aN7D7P3Vu61
ibkntBOMUorimlX5rtEF4Bryp4N8AnWI20MzFLq6FhvCH369RNfOMgz8os4hBbe2oiquQNCRpfb/
OBfZMxihbvVPqtKcImChLF+6cYBFaiBweY53CO44QQ==
=DEf8
-----END PGP SIGNATURE-----

--DReaxJbM2X5uf5LruUj9ZWLgctnRzIgmv--

