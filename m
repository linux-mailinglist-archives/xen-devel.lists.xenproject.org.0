Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD593A5D35
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 08:42:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141213.260923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsgHw-0003yD-QA; Mon, 14 Jun 2021 06:41:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141213.260923; Mon, 14 Jun 2021 06:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lsgHw-0003vz-Mw; Mon, 14 Jun 2021 06:41:36 +0000
Received: by outflank-mailman (input) for mailman id 141213;
 Mon, 14 Jun 2021 06:41:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Pv4=LI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lsgHv-0003vY-88
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 06:41:35 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dad38461-204c-4d68-9fd8-ecc2473cc65e;
 Mon, 14 Jun 2021 06:41:34 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 136C821975;
 Mon, 14 Jun 2021 06:41:33 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id CD98F118DD;
 Mon, 14 Jun 2021 06:41:32 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id OCT7MBz6xmAUbQAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 14 Jun 2021 06:41:32 +0000
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
X-Inumbo-ID: dad38461-204c-4d68-9fd8-ecc2473cc65e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623652893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zebcSGQFr6VJ3TfznxJ6Xuyv0bmnuLIQaGpN9k8ulms=;
	b=S6Z5nhqlhxVd7/rNPaAv3ubRHNI+3SPoqmIzPyzRIB4nPwh1be0LvypfLqqK6T9EmhPF0V
	XOXwIDkgdXCoXGO5+9uqQ/WYpiDvDp/5KivURWB1m0+O+8OVA9FaTVB5+IDPk3oewVGUCv
	wNggUElAFhLenteHH42qc4aJS1da7os=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623652893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zebcSGQFr6VJ3TfznxJ6Xuyv0bmnuLIQaGpN9k8ulms=;
	b=S6Z5nhqlhxVd7/rNPaAv3ubRHNI+3SPoqmIzPyzRIB4nPwh1be0LvypfLqqK6T9EmhPF0V
	XOXwIDkgdXCoXGO5+9uqQ/WYpiDvDp/5KivURWB1m0+O+8OVA9FaTVB5+IDPk3oewVGUCv
	wNggUElAFhLenteHH42qc4aJS1da7os=
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-162771-mainreport@xen.org>
From: Juergen Gross <jgross@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [xen-unstable test] 162771: regressions - FAIL
Message-ID: <78aa2d24-3e2a-01cd-4596-e2796b4432a7@suse.com>
Date: Mon, 14 Jun 2021 08:41:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <osstest-162771-mainreport@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="yuJ0QH2tXUQ66J2e8qyL0feqaE3MooDDt"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--yuJ0QH2tXUQ66J2e8qyL0feqaE3MooDDt
Content-Type: multipart/mixed; boundary="GgHN18e8Ky8NYu93pkY4JBlS8EPnrygKL";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <78aa2d24-3e2a-01cd-4596-e2796b4432a7@suse.com>
Subject: Re: [xen-unstable test] 162771: regressions - FAIL
References: <osstest-162771-mainreport@xen.org>
In-Reply-To: <osstest-162771-mainreport@xen.org>

--GgHN18e8Ky8NYu93pkY4JBlS8EPnrygKL
Content-Type: multipart/mixed;
 boundary="------------FF798DF7B5533FDA60FC68D7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FF798DF7B5533FDA60FC68D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.06.21 04:21, osstest service owner wrote:
> flight 162771 xen-unstable real [real]
> flight 162783 xen-unstable real-retest [real]
> http://logs.test-lab.xenproject.org/osstest/logs/162771/
> http://logs.test-lab.xenproject.org/osstest/logs/162783/
>=20
> Regressions :-(
>=20
> Tests which did not succeed and are blocking,
> including tests which could not be run:
>   test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. =
vs. 162533
>   test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR. v=
s. 162533
>   test-amd64-amd64-i386-pvgrub 17 guest-localmigrate       fail REGR. v=
s. 162533
>   test-amd64-amd64-amd64-pvgrub 17 guest-localmigrate      fail REGR. v=
s. 162533

Hmm, this is rather unfortunate.

Those last 2 tests failed due to commit 7bd8989ab77b6ade3b, but just
reverting that patch doesn't seem right to me either.

The Linux kernel has a bug here: it will initially set max_pfn in the
shared_info page to the size of the p2m_list (so my reasoning for above
patch was wrong in this case), but when growing the p2m_list (e.g. due
to ballooning or grant mapping), it will store a real pfn number in
max_pfn. But even this pfn might be wrong, as only the pfn leading to
allocation of a new p2m page will be stored in max_pfn, any higher new
pfn having its p2m entry in the new p2m page won't result in a new
max_pfn entry.

As a result I think the only sane handling would be to assume the
max_pfn value read from the shared_info page is really a pfn. This
value should be adjusted to specify the last pfn of the related p2m
page, and the resulting last p2m page should be tolerated to not be
valid.

Another variant would be to just revert above commit and modify the
semantics of max_pfn in the shared_info page to really mean max_pfn+1.
This would result in possible migration failures of ballooned Linux
systems as today.

Additionally I'll fix the Linux kernel, of course.

Any thoughts?


Juergen

--------------FF798DF7B5533FDA60FC68D7
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

--------------FF798DF7B5533FDA60FC68D7--

--GgHN18e8Ky8NYu93pkY4JBlS8EPnrygKL--

--yuJ0QH2tXUQ66J2e8qyL0feqaE3MooDDt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDG+hwFAwAAAAAACgkQsN6d1ii/Ey88
ZQgAkAy+217Q820vkq/NAI0SIamkTmTXYhkiEiDGYNZbM39U6eL2HQZYXN8wCh0jMishh3f4Np0f
MiKMcHjXkOW6IbYcNLswk5+jEaxGOc5Wwe0BpoaQJWwqrlzQwdEgDb5O6dhY45s7etjBdKynIsKb
Ne1Q6xSq3bTzclKVr0YcnSAySk2qYV/oiOHbLMDnBrhOVSR36iurfGYeUHOQ74z9uda4nXnAHsdx
nOTEGeMca04MbA2bGMDplzRwnfPNDyyBZjTTRBRmQoXxAoi1vB7/pg3fhr6idbUc67RnQhefkzbm
OOd3X3wuIEg2hY0T5jGwh0xSU7BCKw4/LCoSwrDhZg==
=CoW3
-----END PGP SIGNATURE-----

--yuJ0QH2tXUQ66J2e8qyL0feqaE3MooDDt--

