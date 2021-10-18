Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E7D4322E4
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 17:31:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212449.370318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUbp-0003nu-9h; Mon, 18 Oct 2021 15:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212449.370318; Mon, 18 Oct 2021 15:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUbp-0003k8-6Y; Mon, 18 Oct 2021 15:31:29 +0000
Received: by outflank-mailman (input) for mailman id 212449;
 Mon, 18 Oct 2021 15:31:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcUbo-0003k2-1s
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 15:31:28 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 645b8893-8fe7-48a1-b408-8b20a99f1489;
 Mon, 18 Oct 2021 15:31:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7BEBD21961;
 Mon, 18 Oct 2021 15:31:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 33BA113E74;
 Mon, 18 Oct 2021 15:31:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PYJZC06TbWHpHwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 18 Oct 2021 15:31:26 +0000
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
X-Inumbo-ID: 645b8893-8fe7-48a1-b408-8b20a99f1489
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634571086; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Bebn0aIVvHG2YKd1gePyAeqWFN8ricr7tbVd8kUDnY8=;
	b=aiUDnNIFyKhfPW4LwA8ofBKE/ulW15aqs3jXivEsuZ8XA3TIqZEbFmbs5KGp2uggdvrTAn
	fyuNUUjFEDEmxGA5L6BFoBVhn5gL9+6pL3YHcFOayea3CwrDFEDSFrsoTtwI8CfMGK17Dn
	6xaEWzV/dnwTbfbft50yD0YoAD4en2Q=
Subject: Re: [PATCH 03/12] xen: harmonize return types of hypercall handlers
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-4-jgross@suse.com>
 <7bd0cff1-6e88-f8dd-d857-229e75dd2772@suse.com>
 <0ca6cdf1-330b-f47f-dea8-442c3cc268ea@suse.com>
 <838aace7-8076-3c78-cb53-faef04162568@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <ccff48c8-2602-d9e1-09c2-bb8ea34199b6@suse.com>
Date: Mon, 18 Oct 2021 17:31:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <838aace7-8076-3c78-cb53-faef04162568@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="IZ7raxpQLwcLC0WnNJktuPV4tK1wc2PKd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--IZ7raxpQLwcLC0WnNJktuPV4tK1wc2PKd
Content-Type: multipart/mixed; boundary="f28DWcDy3mVdrwdjhptSCPNPhd0OHDMWj";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <ccff48c8-2602-d9e1-09c2-bb8ea34199b6@suse.com>
Subject: Re: [PATCH 03/12] xen: harmonize return types of hypercall handlers
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-4-jgross@suse.com>
 <7bd0cff1-6e88-f8dd-d857-229e75dd2772@suse.com>
 <0ca6cdf1-330b-f47f-dea8-442c3cc268ea@suse.com>
 <838aace7-8076-3c78-cb53-faef04162568@suse.com>
In-Reply-To: <838aace7-8076-3c78-cb53-faef04162568@suse.com>

--f28DWcDy3mVdrwdjhptSCPNPhd0OHDMWj
Content-Type: multipart/mixed;
 boundary="------------18F8228651698E4AAF501EC8"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------18F8228651698E4AAF501EC8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.10.21 16:25, Jan Beulich wrote:
> On 18.10.2021 15:24, Juergen Gross wrote:
>> On 18.10.21 13:55, Jan Beulich wrote:
>>> On 15.10.2021 14:51, Juergen Gross wrote:
>>>> Change the type of the cmd parameter for [do|compat]_kexec_op() to
>>>> unsigned int, as this is more appropriate for the compat case.
>>>
>>> The change for the compat case is fine, but for native you change
>>> behavior for callers passing values equaling valid KEXEC_CMD_*
>>> modulo 2=C2=B3=C2=B2.
>>
>> TBH, I don't think this is really a problem. Or do you think there
>> really is a user of this interface relying on a -ENOSYS in this
>> case?
>=20
> That's a secondary consideration of mine only. The primary one is
> that invoking with an invalid sub-op should fail, such that in the
> future we can assign meaning to the upper bits, if need be. See
> their use for continuations in memory-op, for example.

But this would mean to exclude such usage of upper bits for 32 bit
systems in case this difference should matter.


Juergen


--------------18F8228651698E4AAF501EC8
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

--------------18F8228651698E4AAF501EC8--

--f28DWcDy3mVdrwdjhptSCPNPhd0OHDMWj--

--IZ7raxpQLwcLC0WnNJktuPV4tK1wc2PKd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFtk00FAwAAAAAACgkQsN6d1ii/Ey9A
/gf/QiZ5fVV31RdsfmSg9G2jEx9rhKO4SH/Q0i7qXl73JSDLR3IVXt64MUrmMizuCJYGiMYU3WCt
youyADI1k7l74UBQiIlCebiOwmLcYxyONNolAQC8RJMth0KkgN5cpTIIlLdAM1rVJRyXj0NUjk0I
wo3rgVVXx6FGLjaHPi/PTgU7kvBAZt/ZrDhJS87OQe2N5VEluFEFYH/6+sXacAje+B/7LR/831PR
L7oZs2BQ1/SfnGUmj6aB9zi6jviVShzS2YmyaPAxNEH7HiB183nERgKOkzFtELtRYGimoNjZNJn0
dCGe217vI5fYrTFQD0jDgrfJhdXyj/YInSpO/iaDPA==
=p8m/
-----END PGP SIGNATURE-----

--IZ7raxpQLwcLC0WnNJktuPV4tK1wc2PKd--

