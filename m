Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C513D3FB3B7
	for <lists+xen-devel@lfdr.de>; Mon, 30 Aug 2021 12:16:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174955.318873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKeKq-0003DE-TD; Mon, 30 Aug 2021 10:16:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174955.318873; Mon, 30 Aug 2021 10:16:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKeKq-0003BN-Pu; Mon, 30 Aug 2021 10:16:12 +0000
Received: by outflank-mailman (input) for mailman id 174955;
 Mon, 30 Aug 2021 10:16:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFp4=NV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mKeKp-0003BF-Tj
 for xen-devel@lists.xenproject.org; Mon, 30 Aug 2021 10:16:11 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c194768-097b-11ec-ac79-12813bfff9fa;
 Mon, 30 Aug 2021 10:16:11 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3540821DA8;
 Mon, 30 Aug 2021 10:16:10 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id EC75D13670;
 Mon, 30 Aug 2021 10:16:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id W8g5OOmvLGE0QwAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 30 Aug 2021 10:16:09 +0000
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
X-Inumbo-ID: 4c194768-097b-11ec-ac79-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1630318570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ySRnwFql9fJfhf6kdA57y05yvy5Kk5ptSmd+4e4b6pk=;
	b=kPJomYUbTAZHYlrsyur/wPutc0svGikTLhpj/vQXX/mI9FeF0jAHrBX7b9olhHaAStq8a+
	+rpVTfk29aAxSScH/jMP8NUedrxDkamqEkACihEHFeDA6SlGesTYGLK7hRBI6G3HmXeOKZ
	RAyfYJBXSHh2zIlBaDtQWn3NDpvLxzU=
Subject: Re: [PATCH v3 0/3] xen: harden blkfront against malicious backends
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>
References: <20210730103854.12681-1-jgross@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <324eab71-86ae-790a-d19c-97bb35b4f354@suse.com>
Date: Mon, 30 Aug 2021 12:16:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210730103854.12681-1-jgross@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wZC1IgbKDVH7XgM8ykJVZAWRogJ2eOmeq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wZC1IgbKDVH7XgM8ykJVZAWRogJ2eOmeq
Content-Type: multipart/mixed; boundary="00oaAymQLL261J1A92SoY0uiKtAQrzaQn";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Jens Axboe <axboe@kernel.dk>
Message-ID: <324eab71-86ae-790a-d19c-97bb35b4f354@suse.com>
Subject: Re: [PATCH v3 0/3] xen: harden blkfront against malicious backends
References: <20210730103854.12681-1-jgross@suse.com>
In-Reply-To: <20210730103854.12681-1-jgross@suse.com>

--00oaAymQLL261J1A92SoY0uiKtAQrzaQn
Content-Type: multipart/mixed;
 boundary="------------62439A08F1A8B23EA617671E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------62439A08F1A8B23EA617671E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 30.07.21 12:38, Juergen Gross wrote:
> Xen backends of para-virtualized devices can live in dom0 kernel, dom0
> user land, or in a driver domain. This means that a backend might
> reside in a less trusted environment than the Xen core components, so
> a backend should not be able to do harm to a Xen guest (it can still
> mess up I/O data, but it shouldn't be able to e.g. crash a guest by
> other means or cause a privilege escalation in the guest).
>=20
> Unfortunately blkfront in the Linux kernel is fully trusting its
> backend. This series is fixing blkfront in this regard.
>=20
> It was discussed to handle this as a security problem, but the topic
> was discussed in public before, so it isn't a real secret.
>=20
> It should be mentioned that a similar series has been posted some years=

> ago by Marek Marczykowski-G=C3=B3recki, but this series has not been ap=
plied
> due to a Xen header not having been available in the Xen git repo at
> that time. Additionally my series is fixing some more DoS cases.
>=20
> Changes in V3:
> - patch 3: insert missing unlock in error case (kernel test robot)
> - patch 3: use %#x as format for printing wrong operation value
>    (Roger Pau Monn=C3=A9)
>=20
> Changes in V2:
> - put blkfront patches into own series
> - some minor comments addressed
>=20
> Juergen Gross (3):
>    xen/blkfront: read response from backend only once
>    xen/blkfront: don't take local copy of a request from the ring page
>    xen/blkfront: don't trust the backend response data blindly
>=20
>   drivers/block/xen-blkfront.c | 126 +++++++++++++++++++++++-----------=
-
>   1 file changed, 84 insertions(+), 42 deletions(-)
>=20

Series pushed to xen/tip.git for-linus-5.15


Juergen

--------------62439A08F1A8B23EA617671E
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

--------------62439A08F1A8B23EA617671E--

--00oaAymQLL261J1A92SoY0uiKtAQrzaQn--

--wZC1IgbKDVH7XgM8ykJVZAWRogJ2eOmeq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmEsr+kFAwAAAAAACgkQsN6d1ii/Ey/V
fwgAiwttMoeaRjT6z90Dj0C5RVj2ypvjEckWpDvZFDUrKyiw7/SvtoeWj97jUaYHqDqJe7Z33p4K
HlXOStVkIGTF/6E17EsHLPC2vq7Wk9A1evnZ4BvGdRhOKRA/2qK/n05Pcp82k6XKJsM4Ctgkqr27
X1YkxWsagi3oVu5Sl4aBvvckOucCyPhJ8eLGx4d+F55EAAOjZBZpN9jnYbdmZ4NJmDn+MfAkq16s
CGArI31OVOLLzD43LjxGJ2Y5n+TNGACOF4BNy++WrIVfVgtU7BkpwUbO8JTBHSu94dej6wmUUb5V
ExlOmIDGqerbEAUHn7ccjMZu+U5g+V8jEAAoRzKxkw==
=1i13
-----END PGP SIGNATURE-----

--wZC1IgbKDVH7XgM8ykJVZAWRogJ2eOmeq--

