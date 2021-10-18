Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0885D4322A7
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 17:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212431.370297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUQq-0001Zw-Sk; Mon, 18 Oct 2021 15:20:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212431.370297; Mon, 18 Oct 2021 15:20:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcUQq-0001XR-P1; Mon, 18 Oct 2021 15:20:08 +0000
Received: by outflank-mailman (input) for mailman id 212431;
 Mon, 18 Oct 2021 15:20:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcUQo-0001TF-UP
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 15:20:06 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df2e68a4-3026-11ec-82dc-12813bfff9fa;
 Mon, 18 Oct 2021 15:20:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0A8AC1FD6D;
 Mon, 18 Oct 2021 15:20:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8CA7F140A7;
 Mon, 18 Oct 2021 15:20:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3Wz+HqSQbWFIGgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 18 Oct 2021 15:20:04 +0000
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
X-Inumbo-ID: df2e68a4-3026-11ec-82dc-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634570405; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=x2yXV/Siuehs8GyFtdcqFeLIMcQJnQGVInlldGwAG7A=;
	b=BlKHhI3ukQOqZ3gm5VO9ZRvNPG8kNd7ryrX16G1boGtKcwtyHH4H3XmnFTcp3E3V6BPUV5
	tZ+6PCeEqsvsXNoh5KwltTUjzHJO5UfjNmQ67FizSwzpm0v6jVrncLp50Lg0IYZrak3XY8
	idoizN6Rjn2E9cikcyxawy5AltdpIGM=
Subject: Re: [PATCH 05/12] xen: don't include asm/hypercall.h from C sources
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-6-jgross@suse.com>
 <d26c7087-8c39-9624-bbce-876cef47f84c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <c2a955f6-eb30-b839-91db-b7bcaeedf848@suse.com>
Date: Mon, 18 Oct 2021 17:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d26c7087-8c39-9624-bbce-876cef47f84c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="FPAqaxEU4v9nBwrDODEo3xpp2cEkrvoV6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--FPAqaxEU4v9nBwrDODEo3xpp2cEkrvoV6
Content-Type: multipart/mixed; boundary="KhcZtdsEDhmfwxHV8ybASNEAD1LheWvJJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Message-ID: <c2a955f6-eb30-b839-91db-b7bcaeedf848@suse.com>
Subject: Re: [PATCH 05/12] xen: don't include asm/hypercall.h from C sources
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-6-jgross@suse.com>
 <d26c7087-8c39-9624-bbce-876cef47f84c@suse.com>
In-Reply-To: <d26c7087-8c39-9624-bbce-876cef47f84c@suse.com>

--KhcZtdsEDhmfwxHV8ybASNEAD1LheWvJJ
Content-Type: multipart/mixed;
 boundary="------------76EB8D639C1646C9CBCD82F5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------76EB8D639C1646C9CBCD82F5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.10.21 14:39, Jan Beulich wrote:
> On 15.10.2021 14:51, Juergen Gross wrote:
>> --- a/xen/arch/x86/x86_64/mm.c
>> +++ b/xen/arch/x86/x86_64/mm.c
>> @@ -32,7 +32,6 @@ EMIT_FILE;
>>   #include <asm/page.h>
>>   #include <asm/flushtlb.h>
>>   #include <asm/fixmap.h>
>> -#include <asm/hypercall.h>
>>   #include <asm/msr.h>
>>   #include <asm/pv/domain.h>
>>   #include <asm/setup.h>
>=20
> Afaict xen/hypercall.h also doesn't need including here. But I can
> agree that this is at best a partly related change.

Will check and delete it in case not needed.

>=20
>> --- a/xen/arch/x86/x86_64/platform_hypercall.c
>> +++ b/xen/arch/x86/x86_64/platform_hypercall.c
>> @@ -41,8 +41,8 @@ CHECK_pf_resource_entry;
>>   #undef xen_pf_resource_entry
>>  =20
>>   #define COMPAT
>> -#define _XEN_GUEST_HANDLE(t) XEN_GUEST_HANDLE(t)
>> -#define _XEN_GUEST_HANDLE_PARAM(t) XEN_GUEST_HANDLE_PARAM(t)
>> +#undef guest_handle_okay
>> +#define guest_handle_okay          compat_handle_okay
>=20
> Is this a change that slipped in here from patch 3, accompanying
>=20
> -#define do_platform_op(x)   compat_platform_op(_##x)
> +#define do_platform_op(x)   compat_platform_op(x)
>=20
> there? Or does that change belong here? I have to admit anyway that
> it's not entirely clear to me why this adjustment needs making.

Oh yes, this is a leftover to make things work with prototypes being
made seen in platform_hypercall.c.

>=20
>> --- a/xen/common/compat/grant_table.c
>> +++ b/xen/common/compat/grant_table.c
>> @@ -4,6 +4,7 @@
>>    */
>>  =20
>>   #include <compat/grant_table.h>
>> +#include <xen/hypercall.h>
>=20
> Nit: Generally compat/*.h go last.

Okay.


Juergen


--------------76EB8D639C1646C9CBCD82F5
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

--------------76EB8D639C1646C9CBCD82F5--

--KhcZtdsEDhmfwxHV8ybASNEAD1LheWvJJ--

--FPAqaxEU4v9nBwrDODEo3xpp2cEkrvoV6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFtkKMFAwAAAAAACgkQsN6d1ii/Ey90
bggAhrI5cvrJPI1zMDHk4PG7uYPYh8qSIJwofQ2t0CAK+3P3PBGZVvtCnnNGkjPlkNHnBDVjkfeJ
hXwmYeQdFd8mXmFNrxZRDaqSjMTkBSb7ADmK9e04iycytVAF3FLt77xDKLUJKNC5PWISy0/z0lN4
1e3lnxPrXA27AXLQPTF71DJnGDGTuqxADZNGhu3ACyP7HLJfkl4137Q+HFexYQLqxrJSMNehOe0b
AQNHz4XydHdWbVIyeMpY8dkI78zcRzIZR7AW8g5E6IPKLJWI7N9umT0FX6YVmCU2rt+xDA1IPvNt
gkcBGW2Pj4CUy70KDnNT1+ABgrwHUBp5ZRSAY4WiAA==
=0FkH
-----END PGP SIGNATURE-----

--FPAqaxEU4v9nBwrDODEo3xpp2cEkrvoV6--

