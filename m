Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DC741F09D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 17:09:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200733.355290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWK9o-0000mk-Gx; Fri, 01 Oct 2021 15:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200733.355290; Fri, 01 Oct 2021 15:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWK9o-0000kq-Cr; Fri, 01 Oct 2021 15:09:04 +0000
Received: by outflank-mailman (input) for mailman id 200733;
 Fri, 01 Oct 2021 15:09:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kuDH=OV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mWK9m-0000kk-Og
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 15:09:02 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 824b920c-22c9-11ec-bdb3-12813bfff9fa;
 Fri, 01 Oct 2021 15:09:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CD32B1FEDA;
 Fri,  1 Oct 2021 15:09:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 780FA13C6D;
 Fri,  1 Oct 2021 15:09:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c6sYHIwkV2FVPwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 01 Oct 2021 15:09:00 +0000
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
X-Inumbo-ID: 824b920c-22c9-11ec-bdb3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1633100940; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uCuBT5tgF8p5Dex86InSy5Qi/RM5e8rP5mvOOKS7cT4=;
	b=TN0ergq45NhnaLE3x2d92L2Ki5wIJfTxU717e/ex8tarSC3uPJv/3r1t8iKGYKlADFou5Z
	YUqzpEzion7/P7Jy24M/fN8VsAdObIxFictoxe3gcYMkQGwxGbRlcQigNnOndBu/bVJ5/3
	yi0JyAB8R5a8ceC6pV06GLkYQNCn4pM=
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Alex Olson <this.is.a0lson@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Alex Olson <alex.olson@starlab.io>, xen-devel@lists.xenproject.org
References: <cover.1632512149.git.this.is.a0lson@gmail.com>
 <85b59046315b8a84afa8538aacdea92b19200faa.1632512149.git.this.is.a0lson@gmail.com>
 <d899b058-a201-e2f8-35d2-f0e59ab4bab3@suse.com>
 <d63a0e7d-7f9d-0dcb-0ac9-8995e56698b4@citrix.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/1] x86: centralize default APIC id definition
Message-ID: <2ff385c7-55bd-4647-efb5-9909addca226@suse.com>
Date: Fri, 1 Oct 2021 17:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d63a0e7d-7f9d-0dcb-0ac9-8995e56698b4@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qFnRQ2vezRbBQsa6Pi5FUPWd9zwwnp5nX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qFnRQ2vezRbBQsa6Pi5FUPWd9zwwnp5nX
Content-Type: multipart/mixed; boundary="qloal8KDuf0hTndT05o5FZvYOhMa5RJ0J";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
 <jbeulich@suse.com>, Alex Olson <this.is.a0lson@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Alex Olson <alex.olson@starlab.io>, xen-devel@lists.xenproject.org
Message-ID: <2ff385c7-55bd-4647-efb5-9909addca226@suse.com>
Subject: Re: [PATCH 1/1] x86: centralize default APIC id definition
References: <cover.1632512149.git.this.is.a0lson@gmail.com>
 <85b59046315b8a84afa8538aacdea92b19200faa.1632512149.git.this.is.a0lson@gmail.com>
 <d899b058-a201-e2f8-35d2-f0e59ab4bab3@suse.com>
 <d63a0e7d-7f9d-0dcb-0ac9-8995e56698b4@citrix.com>
In-Reply-To: <d63a0e7d-7f9d-0dcb-0ac9-8995e56698b4@citrix.com>

--qloal8KDuf0hTndT05o5FZvYOhMa5RJ0J
Content-Type: multipart/mixed;
 boundary="------------B0C5C823692A514D8492CBCF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B0C5C823692A514D8492CBCF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 01.10.21 16:29, Andrew Cooper wrote:
> On 01/10/2021 15:19, Jan Beulich wrote:
>> On 24.09.2021 21:39, Alex Olson wrote:
>>> Inspired by an earlier attempt by Chao Gao <chao.gao@intel.com>,
>>> this revision aims to put the hypervisor in control of x86 APIC ident=
ifier
>>> definition instead of hard-coding a formula in multiple places
>>> (libxl, hvmloader, hypervisor).
>>>
>>> This is intended as a first step toward exposing/altering CPU topolog=
y
>>> seen by guests.
>>>
>>> Changes:
>>>
>>> - Add field to vlapic for holding default ID (on reset)
>>>
>>> - add HVMOP_get_vcpu_topology_id hypercall so libxl (for PVH domains)=

>>>    can access APIC ids needed for ACPI table definition prior to doma=
in start.
>>>
>>> - For HVM guests, hvmloader now also uses the same hypercall.
>>>
>>> - Make CPUID code use vlapic ID instead of hard-coded formula
>>>    for runtime reporting to guests
>> I'm afraid a primary question from back at the time remains: How is
>> migration of a guest from an old hypervisor to one with this change
>> in place going to work?
>=20
> I'm afraid its not.
>=20
> Fixing this is incredibly complicated.=C2=A0 I have a vague plan, but i=
t
> needs building on the still-pending libxl cpuid work of Rogers.
>=20
> Both the toolstack and Xen need to learn about how to describe topology=

> correctly (and I'm afraid this patch isn't correct even for a number of=

> the simple cases), and know about "every VM booted up until this point
> in time" being wrong.

What about:

- adding APIC-Id to the migration stream
- adding an optional translation layer for guest APIC-Id to the
   hypervisor
- adding the functionality to set a specific APIC-Id for a vcpu
   (will use the translation layer if not the same as preferred
   by the hypervisor)


Juergen


--------------B0C5C823692A514D8492CBCF
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

--------------B0C5C823692A514D8492CBCF--

--qloal8KDuf0hTndT05o5FZvYOhMa5RJ0J--

--qFnRQ2vezRbBQsa6Pi5FUPWd9zwwnp5nX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFXJIoFAwAAAAAACgkQsN6d1ii/Ey9Z
2Qf/fUUv8rgcstveoCfe0PTSI5EvBDh6gFSxZjKUEKnnCi/mXJHz2kf/J8F/hGuG1bJqRxL0PvBx
y3qYY2Nx7QhbJ8jUIOeYN4L4cmvNBEsGxqs0Cq8fOuwW3UnOjyjEioDktSSxL+G6B/pakNiSj+YH
kj+KdvvIDisu4x6quHnfWRoV/+eVA/+8Uukno1l2tjGqLTQjq1MmB3ic7BF8ocVOzb+yIcIn2mfq
m6a72r+sM60aq3GXdAqCvZkGAwM8izyoALUpf/ugYML0Tb2FZNbPJQACA0GWSs6pPrHurxt9sifw
Ez+qVXD4X36mJ4/d03B26r6leh8WI4R5ExjhBAaByw==
=IWGm
-----END PGP SIGNATURE-----

--qFnRQ2vezRbBQsa6Pi5FUPWd9zwwnp5nX--

