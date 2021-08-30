Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2120E3FB3B6
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 12:15:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174950.318861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKeJs-0002dy-Ie; Mon, 30 Aug 2021 10:15:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174950.318861; Mon, 30 Aug 2021 10:15:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKeJs-0002bR-Fc; Mon, 30 Aug 2021 10:15:12 +0000
Received: by outflank-mailman (input) for mailman id 174950;
 Mon, 30 Aug 2021 10:15:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFp4=NV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mKeJr-0002bL-0r
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 10:15:11 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 27aa1948-097b-11ec-ac79-12813bfff9fa;
 Mon, 30 Aug 2021 10:15:09 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E406022114;
 Mon, 30 Aug 2021 10:15:08 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 9605113670;
 Mon, 30 Aug 2021 10:15:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Eh0YI6yvLGH2QgAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 30 Aug 2021 10:15:08 +0000
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
X-Inumbo-ID: 27aa1948-097b-11ec-ac79-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630318508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wcriqiY1NMqpzuM9nXJtM0yN37QrMo+tW4/oy7RSsjk=;
	b=YCvrOJCvdhnS8ZHXy7t3zr48YsWASt1Y6O/2n31UXD8xDxXAfMvNhHR3GdDPvNJHoIgysn
	ye13micZVkNclGWDHom2fYEMGipLES3pwfd5NaoQFM1QFlOW77/iQ0kGRIC/2ooIW7/pjP
	KxgCT0s1iQGMLgsNq51Xd/02HPDwmOk=
Subject: Re: [PATCH] x86: xen: platform-pci-unplug: use pr_err() and pr_warn()
 instead of raw printk()
To: zhaoxiao <zhaoxiao@uniontech.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org
Cc: hpa@zytor.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
References: <20210825114111.29009-1-zhaoxiao@uniontech.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7a10253d-c549-5507-b672-7885509cb528@suse.com>
Date: Mon, 30 Aug 2021 12:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210825114111.29009-1-zhaoxiao@uniontech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xT8aENdSD2swBm0FJXI7WFkcBHKeqBZPi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xT8aENdSD2swBm0FJXI7WFkcBHKeqBZPi
Content-Type: multipart/mixed; boundary="w04qN6hNey5BmQczBbjkgzsSDxCMr97ph";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: zhaoxiao <zhaoxiao@uniontech.com>, tglx@linutronix.de, mingo@redhat.com,
 bp@alien8.de, x86@kernel.org
Cc: hpa@zytor.com, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
Message-ID: <7a10253d-c549-5507-b672-7885509cb528@suse.com>
Subject: Re: [PATCH] x86: xen: platform-pci-unplug: use pr_err() and pr_warn()
 instead of raw printk()
References: <20210825114111.29009-1-zhaoxiao@uniontech.com>
In-Reply-To: <20210825114111.29009-1-zhaoxiao@uniontech.com>

--w04qN6hNey5BmQczBbjkgzsSDxCMr97ph
Content-Type: multipart/mixed;
 boundary="------------46280C33D24262895ECB9970"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------46280C33D24262895ECB9970
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 25.08.21 13:41, zhaoxiao wrote:
> Since we have the nice helpers pr_err() and pr_warn(), use them instead=

> of raw printk().
>=20
> Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>

Pushed to xen/tip.git for-linus-5.15 with a small fix (moved the
"#define pr_fmt" before the first #include in order to avoid
build warnings due to redefinition).


Juergen

--------------46280C33D24262895ECB9970
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

--------------46280C33D24262895ECB9970--

--w04qN6hNey5BmQczBbjkgzsSDxCMr97ph--

--xT8aENdSD2swBm0FJXI7WFkcBHKeqBZPi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEsr6wFAwAAAAAACgkQsN6d1ii/Ey/8
aAf/dE7Yyi2/6fpKCtUUGI5yM93HFk6brze0KwOO3WXctUSSi5fn2ouAzoPvZqZrv0Eg7U26Tqsv
W4NDHIyXJL7XsSsgFxQrszPSc1PKLQhTHnK6hBv8WXjmwCRKQkWkubU67LxLH4+C5MvabP9qgVJz
klG77aGaVWc/+OmnS1a9a4Us1XW+zt8cTrXNc11dJDRtrzEHHqrGhKIIxGVNFZYQedykaKzRNNjg
fL/vc6FuVIPl4v/O9YXeFQ87LtQNBsa1OmzWJgfjTCdhYHKDLw3qIOI6ijhLp6JVZrGzijqwQYgK
9oQNPyuF0p2z4N4TmnBbWZpHiNkViKZPl6l+hAVK9g==
=4Ucr
-----END PGP SIGNATURE-----

--xT8aENdSD2swBm0FJXI7WFkcBHKeqBZPi--

