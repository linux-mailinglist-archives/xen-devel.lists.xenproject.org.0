Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A8448080
	for <lists+xen-devel@lfdr.de>; Mon,  8 Nov 2021 14:48:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223344.386009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk4zN-0000Wq-G4; Mon, 08 Nov 2021 13:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223344.386009; Mon, 08 Nov 2021 13:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mk4zN-0000V0-Bi; Mon, 08 Nov 2021 13:47:09 +0000
Received: by outflank-mailman (input) for mailman id 223344;
 Mon, 08 Nov 2021 13:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NS6W=P3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mk4zL-0000Uu-Nj
 for xen-devel@lists.xenproject.org; Mon, 08 Nov 2021 13:47:07 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c34d37f-409a-11ec-a9d2-d9f7a1cc8784;
 Mon, 08 Nov 2021 14:47:06 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5C1B42191A;
 Mon,  8 Nov 2021 13:47:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1156113BA7;
 Mon,  8 Nov 2021 13:47:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BQW5AlkqiWGVDwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 08 Nov 2021 13:47:05 +0000
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
X-Inumbo-ID: 5c34d37f-409a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1636379225; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=z3meriKKHOe/NcNbVgdqycptoFmuUzuN3QHOr6U4gSk=;
	b=SEt58bsbfZfHCmi8r5DUpFGpdwBWQX9vKVzS2W1xAVX8FeBC0r5ZkgqO/g6fSUR3R+V9WQ
	1wvn6EWE7Bvs8d9xrg2biajJLX6SWJrvRuZx5djeylJP0gz/RKZlAGU6PAMMdrnZ/ESLbg
	zfR4fVEcbp7zw9q5j+yCmUyRqXMppjw=
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211101152015.28488-1-jgross@suse.com>
 <ddde3565-de0f-f025-f762-9d3e08a5c2e5@citrix.com>
 <17fdb6e6-382e-81b3-2f11-3e520e1c7ef8@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 00/15] xen: drop hypercall function tables
Message-ID: <de5cbf31-f36d-d524-a63c-226802aba49a@suse.com>
Date: Mon, 8 Nov 2021 14:47:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <17fdb6e6-382e-81b3-2f11-3e520e1c7ef8@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="W2Os093DEcpO8GB26mzfjbBXq8JYQbHrD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--W2Os093DEcpO8GB26mzfjbBXq8JYQbHrD
Content-Type: multipart/mixed; boundary="SaKJpZHYlYUFBcj19VssUOwm79JFxAG1d";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ian Jackson <iwj@xenproject.org>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <de5cbf31-f36d-d524-a63c-226802aba49a@suse.com>
Subject: Re: [PATCH v2 00/15] xen: drop hypercall function tables
References: <20211101152015.28488-1-jgross@suse.com>
 <ddde3565-de0f-f025-f762-9d3e08a5c2e5@citrix.com>
 <17fdb6e6-382e-81b3-2f11-3e520e1c7ef8@suse.com>
In-Reply-To: <17fdb6e6-382e-81b3-2f11-3e520e1c7ef8@suse.com>

--SaKJpZHYlYUFBcj19VssUOwm79JFxAG1d
Content-Type: multipart/mixed;
 boundary="------------B7AF15ABCAD9DD542748056A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B7AF15ABCAD9DD542748056A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.11.21 09:36, Jan Beulich wrote:
> On 05.11.2021 15:18, Andrew Cooper wrote:
>> On 01/11/2021 15:20, Juergen Gross wrote:
>>> In order to avoid indirect function calls on the hypercall path as
>>> much as possible this series is removing the hypercall function table=
s
>>> and is replacing the hypercall handler calls via the function array
>>> by automatically generated call macros.
>>>
>>> Another by-product of generating the call macros is the automatic
>>> generating of the hypercall handler prototypes from the same data bas=
e
>>> which is used to generate the macros.
>>>
>>> This has the additional advantage of using type safe calls of the
>>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>>> the same prototypes.
>>>
>>> A very brief performance test (parallel build of the Xen hypervisor
>>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>>> the performance with the patches applied. The test was performed usin=
g
>>> a PV and a PVH guest.
>>>
>>> Changes in V2:
>>> - new patches 6, 14, 15
>>> - patch 7: support hypercall priorities for faster code
>>> - comments addressed
>>>
>>> Juergen Gross (15):
>>>    xen: limit number of hypercall parameters to 5
>>>    xen: move do_vcpu_op() to arch specific code
>>>    xen: harmonize return types of hypercall handlers
>>>    xen/x86: modify hvm_memory_op() prototype
>>>    xen: don't include asm/hypercall.h from C sources
>>>    add .gitignore entries for *.[is] below xen
>>>    xen: generate hypercall interface related code
>>>    xen: use generated prototypes for hypercall handlers
>>>    x86/pv-shim: don't modify hypercall table
>>>    xen/x86: don't use hypercall table for calling compat hypercalls
>>>    xen/x86: call hypercall handlers via generated macro
>>>    xen/arm: call hypercall handlers via generated macro
>>>    xen/x86: add hypercall performance counters for hvm, correct pv
>>>    xen: drop calls_to_multicall performance counter
>>>    tools/xenperf: update hypercall names
>>
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/1752237172
>>
>> Something here causes
>>
>> hypercall.c: In function 'hvm_hypercall':
>> hypercall.c:174:23: error: unused variable 'r8' [-Werror=3Dunused-vari=
able]
>>  =C2=A0 174 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 long r8 =3D regs->r8;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ^~
>> hypercall.c:190:22: error: unused variable 'edi' [-Werror=3Dunused-var=
iable]
>>  =C2=A0 190 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned=
 int edi =3D regs->edi;
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 ^~~
>> cc1: all warnings being treated as errors
>>
>> I suspect it will be "call hypercall handlers via generated macro", bu=
t
>> I haven't investigated further.
>=20
> I suspect that's a randconfig build with !HYPFS + !ARGO. The hypfs and
> argo hypercalls are the only ones with 5 parameters that HVM wires up.
> A similar issue ought to exist in PV hypercall handling though, as the
> compat form of update_va_mapping_otherdomain is the only other one
> taking 5 arguments.
>=20
> As to possible solutions - besides maybe adding (void)r8 to the -ENOSYS=

> path, I was wondering anyway in how far the local variables are still
> warranted to retain.

I think dropping those local variables is the easiest solution. And I
think this applies to the PV variant, too.


Juergen

--------------B7AF15ABCAD9DD542748056A
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

--------------B7AF15ABCAD9DD542748056A--

--SaKJpZHYlYUFBcj19VssUOwm79JFxAG1d--

--W2Os093DEcpO8GB26mzfjbBXq8JYQbHrD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGJKlgFAwAAAAAACgkQsN6d1ii/Ey9C
+Af/WvB2aDxCPFCxdo44gwjeukCcb4geA/qRNDmOknuVk+HQox9iIdAgaqW/tYJvD6IgJYYJfma3
mF5flR8aJhTOQi0Lt9g8T6lzzD2Zv4nmWXbL56wKQKIVqrxxqhP3AnMFk4V3REU3z2JHyRMW9ckP
GCe7RjnAtAO+8LPkQ5JNrYM9jsx9DIoU+S9A4ScjZ6dAkbLuIadjKLt5NpZ1PJNkh87+VtyhfXUt
imk61Y33QwrezDMsuz9fOKOd8Y15jhuWvoA8NMCR7alBG2jYmknaCIUWQeQkH5XsY7ITIXBbthRe
SPrZahPsQFAELKkT04ewMn1N4/iB3WJNkOoScwO8gg==
=L1rX
-----END PGP SIGNATURE-----

--W2Os093DEcpO8GB26mzfjbBXq8JYQbHrD--

