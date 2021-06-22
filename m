Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4243AFF8E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jun 2021 10:46:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.145769.268098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvc2y-0003JA-So; Tue, 22 Jun 2021 08:46:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 145769.268098; Tue, 22 Jun 2021 08:46:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lvc2y-0003Gz-OB; Tue, 22 Jun 2021 08:46:16 +0000
Received: by outflank-mailman (input) for mailman id 145769;
 Tue, 22 Jun 2021 08:46:15 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P8ns=LQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lvc2x-0003Gr-He
 for xen-devel@lists.xenproject.org; Tue, 22 Jun 2021 08:46:15 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 110aa5c1-2451-44e1-8d5c-2908cf473679;
 Tue, 22 Jun 2021 08:46:14 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53B1D21952;
 Tue, 22 Jun 2021 08:46:13 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 22899118DD;
 Tue, 22 Jun 2021 08:46:13 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id FhQLB1Wj0WAWFQAALh3uQQ
 (envelope-from <jgross@suse.com>); Tue, 22 Jun 2021 08:46:13 +0000
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
X-Inumbo-ID: 110aa5c1-2451-44e1-8d5c-2908cf473679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624351573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bqO6v55VW8i6fUwH8jsbTg7KSAoJ15/gYicXfwyE0TY=;
	b=JewN9AmvU6VG/Kr/64X+t08+PUDkji4lzGw9Ifp8kjMUTAVVnloC47pYm14nCQE6p2i0sT
	3Ov5yjVTfjgYq/jRp7vA6Hg7QVV/qg1uf4Xu4xkRv3o5qbu0dnkeuz39fWT3H6+78OSazo
	x8vMmsOfeQQGP3jm9laJFPXCwBuYxTU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1624351573; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bqO6v55VW8i6fUwH8jsbTg7KSAoJ15/gYicXfwyE0TY=;
	b=JewN9AmvU6VG/Kr/64X+t08+PUDkji4lzGw9Ifp8kjMUTAVVnloC47pYm14nCQE6p2i0sT
	3Ov5yjVTfjgYq/jRp7vA6Hg7QVV/qg1uf4Xu4xkRv3o5qbu0dnkeuz39fWT3H6+78OSazo
	x8vMmsOfeQQGP3jm9laJFPXCwBuYxTU=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien GralL
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210617173857.6450-1-julien@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] tools/xenstored: Don't crash xenstored when Live-Update
 is cancelled
Message-ID: <e7458af5-a128-fc01-21ee-34a02f2fdf9b@suse.com>
Date: Tue, 22 Jun 2021 10:46:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210617173857.6450-1-julien@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="waj9IQirOABc9bYDUCo6F0BptcRzrt9sA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--waj9IQirOABc9bYDUCo6F0BptcRzrt9sA
Content-Type: multipart/mixed; boundary="JAOfMLXpXkIk7kohTNQRscUQJblPJQ7Ji";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien GralL
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <e7458af5-a128-fc01-21ee-34a02f2fdf9b@suse.com>
Subject: Re: [PATCH] tools/xenstored: Don't crash xenstored when Live-Update
 is cancelled
References: <20210617173857.6450-1-julien@xen.org>
In-Reply-To: <20210617173857.6450-1-julien@xen.org>

--JAOfMLXpXkIk7kohTNQRscUQJblPJQ7Ji
Content-Type: multipart/mixed;
 boundary="------------E75DA7B5BE3C054BC560017B"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E75DA7B5BE3C054BC560017B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.06.21 19:38, Julien Grall wrote:
> From: Julien GralL <jgrall@amazon.com>
>=20
> As Live-Update is asynchronous, it is possible to receive a request to
> cancel it (either on the same connection or from a different one).
>=20
> Currently, this will crash xenstored because do_lu_start() assumes
> lu_status will be valid. This is not the case when Live-Update has been=

> cancelled. This will result to dereference a NULL pointer and
> crash Xenstored.

Umm, you introduced that bug in "[PATCH 03/10] tools/xenstore: Don't
assume conn->in points to the LU request".

So I think you should fold your fix into that series.


Juergen

--------------E75DA7B5BE3C054BC560017B
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

--------------E75DA7B5BE3C054BC560017B--

--JAOfMLXpXkIk7kohTNQRscUQJblPJQ7Ji--

--waj9IQirOABc9bYDUCo6F0BptcRzrt9sA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDRo1QFAwAAAAAACgkQsN6d1ii/Ey8j
/Qf8DBtb+Mnyoogf6HvuJnE4sqz+Pa9CXLL0xKXJyt2hQGDwspSdv8oLq761JIjuK01JlaO5o8IM
HzUyNOvRhbz1g5I7+5oZdMH9cj1aYLfsKgjieFj7IMRDtlDQZK/bH0ZVPdzvaunSK5opuWczi07g
hVF2/8t2/+TpNDyLScSoawL67OzcrTYnvYC8waFvyBL/0s9ti0zwN5ISnZI1cqy4RZqDQtg4gli6
GS9wwds/Euauj1HZn/MAAvMY2+QDwN3B12u2pvQ8/NCF5g+3x7NHKotnNrlept3eo2MhWOxAiq2z
UIU4ko/UUkMwH72JBbXmoq4pm2cxbGT3wUSrMerSuw==
=eEQF
-----END PGP SIGNATURE-----

--waj9IQirOABc9bYDUCo6F0BptcRzrt9sA--

