Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB746470273
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 15:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243931.422056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvga1-0003e7-Ud; Fri, 10 Dec 2021 14:08:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243931.422056; Fri, 10 Dec 2021 14:08:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvga1-0003cH-RY; Fri, 10 Dec 2021 14:08:57 +0000
Received: by outflank-mailman (input) for mailman id 243931;
 Fri, 10 Dec 2021 14:08:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XN5i=Q3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mvga1-0003cB-2r
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 14:08:57 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b658818c-59c2-11ec-a831-37629979565c;
 Fri, 10 Dec 2021 15:08:56 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B34A8210EB;
 Fri, 10 Dec 2021 14:08:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7160A13E15;
 Fri, 10 Dec 2021 14:08:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id YxB2Gndfs2EwPgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 10 Dec 2021 14:08:55 +0000
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
X-Inumbo-ID: b658818c-59c2-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639145335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R/SnpVNZWJZI6uRNlWBRxtIlUrMOirq33a397sqbAto=;
	b=nzQRS+YmQUnDNC2ShnmjFibscihx6A8kt1B8Rscn1iZmjVsInQEjRN0XLsC8OGon/zeCDj
	oNyZMhuw1RHCty02hwCZmzKH6JqL2HEZ40kbP5M8HaLH7o7J0tSlC5NCWXVNacqqlwiymx
	OgNMw5C8+d6KxOx4d4bDvrM1OkBtLSk=
Subject: Re: [PATCH] tools/libxl: Don't read STORE/CONSOLE_PFN from Xen
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20211209170752.20576-1-andrew.cooper3@citrix.com>
 <0bf3ccd1-7958-e8c6-bb4d-4e319cc567a3@suse.com>
 <6abbbdd6-09f1-0511-ddb5-7c5222658d2a@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <570a65b7-c1e8-9df7-ab63-c49d7a66c1d7@suse.com>
Date: Fri, 10 Dec 2021 15:08:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6abbbdd6-09f1-0511-ddb5-7c5222658d2a@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5UuzIKPfCNrsPlCJEb65VaLjIw0vuHyFv"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5UuzIKPfCNrsPlCJEb65VaLjIw0vuHyFv
Content-Type: multipart/mixed; boundary="Sr5lyqBjxBx0pbn3TvoIMX8d4iyHJ7i7t";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <570a65b7-c1e8-9df7-ab63-c49d7a66c1d7@suse.com>
Subject: Re: [PATCH] tools/libxl: Don't read STORE/CONSOLE_PFN from Xen
References: <20211209170752.20576-1-andrew.cooper3@citrix.com>
 <0bf3ccd1-7958-e8c6-bb4d-4e319cc567a3@suse.com>
 <6abbbdd6-09f1-0511-ddb5-7c5222658d2a@srcf.net>
In-Reply-To: <6abbbdd6-09f1-0511-ddb5-7c5222658d2a@srcf.net>

--Sr5lyqBjxBx0pbn3TvoIMX8d4iyHJ7i7t
Content-Type: multipart/mixed;
 boundary="------------FEAFA61F84394C49F81238BD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FEAFA61F84394C49F81238BD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.12.21 14:49, Andrew Cooper wrote:
> On 10/12/2021 11:16, Juergen Gross wrote:
>> On 09.12.21 18:07, Andrew Cooper wrote:
>>> The values are already available in dom->{console,xenstore}_pfn, just=

>>> like on
>>> the PV side of things.=C2=A0 No need to ask Xen.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Anthony PERARD <anthony.perard@citrix.com>
>>> CC: Juergen Gross <jgross@suse.com>
>>> ---
>>>  =C2=A0 tools/libs/light/libxl_dom.c | 17 +++++------------
>>>  =C2=A0 1 file changed, 5 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_do=
m.c
>>> index c9c24666cd04..03841243ab47 100644
>>> --- a/tools/libs/light/libxl_dom.c
>>> +++ b/tools/libs/light/libxl_dom.c
>>> @@ -722,13 +722,10 @@ int libxl__build_pv(libxl__gc *gc, uint32_t dom=
id,
>>>  =C2=A0 }
>>>  =C2=A0 =C2=A0 static int hvm_build_set_params(xc_interface *handle, =
uint32_t
>>> domid,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libxl_domain_build_info *info,=

>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *store_mfn,
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *console_mfn)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libxl_domain_build_info *info)=

>>>  =C2=A0 {
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct hvm_info_table *va_hvm;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint8_t *va_map, sum;
>>> -=C2=A0=C2=A0=C2=A0 uint64_t str_mfn, cons_mfn;
>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int i;
>>>  =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (info->type =3D=3D LIBXL_DO=
MAIN_TYPE_HVM) {
>>
>> What about moving this if () to the only caller and renaming the
>> function from hvm_build_set_params() to hvm_set_info_table()?
>=20
> Because I was hoping to delete it outright in a subsequent patch.

I'd suggest to either do the renaming or to add that subsequent patch
making this a small series.


Juergen

--------------FEAFA61F84394C49F81238BD
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

--------------FEAFA61F84394C49F81238BD--

--Sr5lyqBjxBx0pbn3TvoIMX8d4iyHJ7i7t--

--5UuzIKPfCNrsPlCJEb65VaLjIw0vuHyFv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGzX3YFAwAAAAAACgkQsN6d1ii/Ey88
xgf/TqIDbz6aLqT5UU3+Gz/0PAojlWNkNqI/VbB8bVv+IBmByEKcRPPflmiX5lln9kn7A+7fxOJ5
OgJGj7iCi3UhLONhfzFltquV//hpAyim5HGb2kGy7DSn+H3k9aG00YilozLAMqbRm9FQ9dd81x3N
g5YjfAE9ZGNzoqdDjH1l2BeWMH1OTIln0i9df5JCTz7XYn0QuCj1GJyKMadtYH/1nghoLeQO+IUt
zUCuyHLgs1A/UfA5UpowMs4I0wQJKSMWvU9hoeTFDvCmQiL6V4Q4Tz7Gf8jZJ/kxCmtBqTQV+dTX
1Z+o67VKVyYdVZd4jvpXe/4mvpiBto5/bNctzCvZDQ==
=Qx/I
-----END PGP SIGNATURE-----

--5UuzIKPfCNrsPlCJEb65VaLjIw0vuHyFv--

