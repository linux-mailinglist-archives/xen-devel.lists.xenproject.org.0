Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 956933F12DD
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 07:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168392.307451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGarY-0005XO-15; Thu, 19 Aug 2021 05:45:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168392.307451; Thu, 19 Aug 2021 05:45:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGarX-0005Uv-U9; Thu, 19 Aug 2021 05:45:11 +0000
Received: by outflank-mailman (input) for mailman id 168392;
 Thu, 19 Aug 2021 05:45:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/7+2=NK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mGarW-0005Up-EL
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 05:45:10 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89431ff5-69ca-4b17-b03d-0a612ef71147;
 Thu, 19 Aug 2021 05:45:09 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 70C091FD76;
 Thu, 19 Aug 2021 05:45:08 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 351971371C;
 Thu, 19 Aug 2021 05:45:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id cJFcC+TvHWGQGAAAGKfGzw
 (envelope-from <jgross@suse.com>); Thu, 19 Aug 2021 05:45:08 +0000
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
X-Inumbo-ID: 89431ff5-69ca-4b17-b03d-0a612ef71147
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1629351908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g2SwivnKRzFRC1AwW9KhKdIdo0BzbL09L1eZJ4FC6KM=;
	b=anvBYUTgQb0y52ZI7auW0qmt8bwaR6wUIe4osBgDP2c480lrpVYUyiR82yRQt5yk4ldqNQ
	VelGDL8Lt6i3iPmcv3wA/E7hmRYe7Ru110w/jK45EXs7HTvg/4JZA9Qhl3+NJGu1H8vEEU
	iss3xTEWrbzP9S5Mo1HhA/hxClvfiqE=
Subject: Re: [PATCH] tools: ROUNDUP() related adjustments
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <c5d84f5a-0350-f197-b98a-07512ac0dd91@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c1b59a02-cce2-b18d-6c2a-4e7057b0a0ed@suse.com>
Date: Thu, 19 Aug 2021 07:45:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c5d84f5a-0350-f197-b98a-07512ac0dd91@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Rp2wsaGixTlaQuwY610DpyGKgYHXTSKpX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Rp2wsaGixTlaQuwY610DpyGKgYHXTSKpX
Content-Type: multipart/mixed; boundary="eR4XEk4AcBzRkwPtCO6VneCdJ7LhpAJjS";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <c1b59a02-cce2-b18d-6c2a-4e7057b0a0ed@suse.com>
Subject: Re: [PATCH] tools: ROUNDUP() related adjustments
References: <c5d84f5a-0350-f197-b98a-07512ac0dd91@suse.com>
In-Reply-To: <c5d84f5a-0350-f197-b98a-07512ac0dd91@suse.com>

--eR4XEk4AcBzRkwPtCO6VneCdJ7LhpAJjS
Content-Type: multipart/mixed;
 boundary="------------E8F0106CCD41CBF707805452"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E8F0106CCD41CBF707805452
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.08.21 12:03, Jan Beulich wrote:
> For one xc_private.h needlessly repeats xen-tools/libs.h's definition.
>=20
> And then there are two suspicious uses (resulting from the inconsistenc=
y
> with the respective 2nd parameter of DIV_ROUNDUP()): While the one in
> tools/console/daemon/io.c - as per the code comment - intentionally use=
s
> 8 as the second argument (meaning to align to a multiple of 256), the
> one in alloc_magic_pages_hvm() pretty certainly does not: There the goa=
l
> is to align to a uint64_t boundary, for the following module struct to
> end up aligned.
>=20
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------E8F0106CCD41CBF707805452
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

--------------E8F0106CCD41CBF707805452--

--eR4XEk4AcBzRkwPtCO6VneCdJ7LhpAJjS--

--Rp2wsaGixTlaQuwY610DpyGKgYHXTSKpX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEd7+MFAwAAAAAACgkQsN6d1ii/Ey/7
7gf+JE0xl9QpsfpeNtXPLQeYWScnM/tDsKESTQ1Ky7TU8rJoVMQsbY9iCCmRPXm97BGR3p0WTruj
OMV5sKEQGvCV59O8rAdQkp6jS6Thlag9hbu4dmufAqS+OiZE0uLyBr43aHYKfpziw6xVqdqOnqE4
Lp91LwE7OYYMO8PUAD0t5Snm6YOvLt+v8LSmyrK7C3bEYrBNLG5fjhCOOsEiHCy4ADrC6JcwyJHn
gVKBUsUdWn3PslPMCBnXCe+T/JLcObONkfkfgVf34VFqPYemn9FQw6kM58eCZMSAQnSM2/cz1V92
sXjGCS1aujM+JKpWXZC0F+i7PZgTLycQRH+EIFEoWA==
=o7jM
-----END PGP SIGNATURE-----

--Rp2wsaGixTlaQuwY610DpyGKgYHXTSKpX--

