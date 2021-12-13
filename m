Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EF7472A9E
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 11:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245972.424297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwisZ-0000Mn-Lm; Mon, 13 Dec 2021 10:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245972.424297; Mon, 13 Dec 2021 10:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwisZ-0000KD-Ij; Mon, 13 Dec 2021 10:48:23 +0000
Received: by outflank-mailman (input) for mailman id 245972;
 Mon, 13 Dec 2021 10:48:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/ja4=Q6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mwisY-000096-5x
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 10:48:22 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 30518394-5c02-11ec-a74f-db008197e53d;
 Mon, 13 Dec 2021 11:48:21 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C504D1F3BB;
 Mon, 13 Dec 2021 10:48:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7DA5613CE5;
 Mon, 13 Dec 2021 10:48:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id trpAHfQkt2FfRwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Dec 2021 10:48:20 +0000
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
X-Inumbo-ID: 30518394-5c02-11ec-a74f-db008197e53d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639392500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v1YiFDbbZL8I/o3qjFEhE8iDRU/DnB83w3TMAnHNu/I=;
	b=RKaf9VT3vrFvI1v9BokM3fLQ2lxLtcdNoSCMKE15jL2ikpNCAzdV3rwwNNGgWgj7ffkGk9
	1Zb6tEPBQFeMs+e2PcG1fNO4kTYlsX6YUKtqekO/ItpABXly4y4fG79kLRO5mHTe2E54ti
	VLODC7cR+yizjwyBlRdjcfgzQp3ZtUI=
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
References: <20211208155606.20029-1-jgross@suse.com>
 <b7010028-5a5a-c6ea-fd14-e0d9aa662487@suse.com>
 <4c98984a-6c06-506a-8ee5-ba671cdc4873@suse.com>
 <c3f1e075-e142-7fc4-e050-89cf3665901c@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <5643c1b5-2adb-5f46-76cb-8651f5edf7c2@suse.com>
Date: Mon, 13 Dec 2021 11:48:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c3f1e075-e142-7fc4-e050-89cf3665901c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pdlsmhd6EokMq4yvelCNA7Do0uf9e1tU7"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--pdlsmhd6EokMq4yvelCNA7Do0uf9e1tU7
Content-Type: multipart/mixed; boundary="C2fGwQBz63puS1h42K9YaDv3cNXy9ibnf";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 xen-devel@lists.xenproject.org
Message-ID: <5643c1b5-2adb-5f46-76cb-8651f5edf7c2@suse.com>
Subject: Re: [PATCH v3 00/13] xen: drop hypercall function tables
References: <20211208155606.20029-1-jgross@suse.com>
 <b7010028-5a5a-c6ea-fd14-e0d9aa662487@suse.com>
 <4c98984a-6c06-506a-8ee5-ba671cdc4873@suse.com>
 <c3f1e075-e142-7fc4-e050-89cf3665901c@suse.com>
In-Reply-To: <c3f1e075-e142-7fc4-e050-89cf3665901c@suse.com>

--C2fGwQBz63puS1h42K9YaDv3cNXy9ibnf
Content-Type: multipart/mixed;
 boundary="------------52386199200D050C9326B7D7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------52386199200D050C9326B7D7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.12.21 11:35, Jan Beulich wrote:
> On 09.12.2021 10:10, Juergen Gross wrote:
>> On 09.12.21 10:05, Jan Beulich wrote:
>>> On 08.12.2021 16:55, Juergen Gross wrote:
>>>> In order to avoid indirect function calls on the hypercall path as
>>>> much as possible this series is removing the hypercall function tabl=
es
>>>> and is replacing the hypercall handler calls via the function array
>>>> by automatically generated call macros.
>>>>
>>>> Another by-product of generating the call macros is the automatic
>>>> generating of the hypercall handler prototypes from the same data ba=
se
>>>> which is used to generate the macros.
>>>>
>>>> This has the additional advantage of using type safe calls of the
>>>> handlers and to ensure related handler (e.g. PV and HVM ones) share
>>>> the same prototypes.
>>>>
>>>> A very brief performance test (parallel build of the Xen hypervisor
>>>> in a 6 vcpu guest) showed a very slim improvement (less than 1%) of
>>>> the performance with the patches applied. The test was performed usi=
ng
>>>> a PV and a PVH guest.
>>>>
>>>> Changes in V2:
>>>> - new patches 6, 14, 15
>>>> - patch 7: support hypercall priorities for faster code
>>>> - comments addressed
>>>>
>>>> Changes in V3:
>>>> - patches 1 and 4 removed as already applied
>>>> - comments addressed
>>>>
>>>> Juergen Gross (13):
>>>>     xen: move do_vcpu_op() to arch specific code
>>>>     xen: harmonize return types of hypercall handlers
>>>>     xen: don't include asm/hypercall.h from C sources
>>>>     xen: include compat/platform.h from hypercall.h
>>>>     xen: generate hypercall interface related code
>>>>     xen: use generated prototypes for hypercall handlers
>>>>     x86/pv-shim: don't modify hypercall table
>>>>     xen/x86: don't use hypercall table for calling compat hypercalls=

>>>>     xen/x86: call hypercall handlers via generated macro
>>>>     xen/arm: call hypercall handlers via generated macro
>>>>     xen/x86: add hypercall performance counters for hvm, correct pv
>>>>     xen: drop calls_to_multicall performance counter
>>>>     tools/xenperf: update hypercall names
>>>
>>> It's not easy to tell which, if any, of the later patches are fully
>>> independent of earlier ones and could go in ahead of those awaiting
>>> further acks. Do you have any suggestion there, or should we wait
>>> until things can be applied in order?
>>
>> I think all but the last patch should be applied in order. The last on=
e
>> obviously can be applied at any time.
>=20
> Hmm, I think 11 and 12 are fine to go ahead as well; I actually need th=
em
> for some immediate purpose and hence I did pull them (but nothing else)=

> into my local tree, without observing issues.

Yeah, those should be okay to take.


Juergen


--------------52386199200D050C9326B7D7
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

--------------52386199200D050C9326B7D7--

--C2fGwQBz63puS1h42K9YaDv3cNXy9ibnf--

--pdlsmhd6EokMq4yvelCNA7Do0uf9e1tU7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG3JPMFAwAAAAAACgkQsN6d1ii/Ey8x
/wf7BLKXr6wnqni0l74KUOPvs+CJjjZ5vBvhl3SK+0WFiWnlm1BzoIhjY9L3W5CM0wxfQ3L56bid
GD0Or9qD+bgAkG/bZAOhv1Ahy48G+Wqz8yFs4/puWi9LMdDhySfHcxyRT2obhaDyVvFVisxF3WZj
kH17+d1IfVUl9dd6JtCGGkoQN5KdYpW5VSvNPkVpAFcDCS6v4pdpZMC4WMgWWnr23PdEqN5U5+qe
zBY7KlPeXrlSrk5cIMP89yi6v97q8HOldHZfuzF0pbcAiB8bEtepdRrVW1oEeY85ry+Hema9cHFE
mHFLeGswi0e1HTn6esHnb01U1Sp1Wm0Y1MgFfAOKdg==
=fZsU
-----END PGP SIGNATURE-----

--pdlsmhd6EokMq4yvelCNA7Do0uf9e1tU7--

