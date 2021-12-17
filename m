Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A9F47867D
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 09:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248472.428598 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my8wl-0006uh-AF; Fri, 17 Dec 2021 08:50:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248472.428598; Fri, 17 Dec 2021 08:50:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my8wl-0006sJ-72; Fri, 17 Dec 2021 08:50:35 +0000
Received: by outflank-mailman (input) for mailman id 248472;
 Fri, 17 Dec 2021 08:50:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NBDy=RC=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1my8wk-0006sD-B6
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 08:50:34 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64bddf76-5f16-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 09:50:32 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 470921F389;
 Fri, 17 Dec 2021 08:50:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0DCE13F28;
 Fri, 17 Dec 2021 08:50:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id axsmNVdPvGEnfwAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 17 Dec 2021 08:50:31 +0000
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
X-Inumbo-ID: 64bddf76-5f16-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639731032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TXFADIgzw9rdlZGES3wfOqa/Ue6nqk8bvW3dwfzWNw0=;
	b=BvyTD8jbWdBfubzqEDepuFw/gMIYVA2Pkhoh8hx8/g7ql+TIXmI2vw5K1J2o75P5wqxjwY
	lpRnNpM2tdmAGReqMVwqnyg/kwxfUe3ztJruSbXYem+nIlIrNqpVHCRk5SXwenZBUP78hJ
	ArvxpoEOY4sLIvuScYusYVLum4w1g+Q=
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
 <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
 <29c14fd7-4ae2-a277-2413-faa330afc49b@suse.com>
 <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
Message-ID: <287c8fba-b22f-95ec-21d4-e440e7e7fb36@suse.com>
Date: Fri, 17 Dec 2021 09:50:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="nasBDvb8IM7iEBsstkrk6ROKYs2XsboOK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--nasBDvb8IM7iEBsstkrk6ROKYs2XsboOK
Content-Type: multipart/mixed; boundary="1E8sqgQO64EoiDLARRryPRlSx9qCBvQvO";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Message-ID: <287c8fba-b22f-95ec-21d4-e440e7e7fb36@suse.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
 <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
 <alpine.DEB.2.22.394.2112151757410.3376@ubuntu-linux-20-04-desktop>
 <c650062f-948e-569d-d4fa-e5333867854e@suse.com>
 <alpine.DEB.2.22.394.2112161232310.3376@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2112161246180.3376@ubuntu-linux-20-04-desktop>
 <29c14fd7-4ae2-a277-2413-faa330afc49b@suse.com>
 <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com>
In-Reply-To: <67d3c4da-9a20-24ca-543f-02ecf4676277@suse.com>

--1E8sqgQO64EoiDLARRryPRlSx9qCBvQvO
Content-Type: multipart/mixed;
 boundary="------------9EB6E965C5C34C296DC064CB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------9EB6E965C5C34C296DC064CB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.12.21 08:45, Jan Beulich wrote:
> On 17.12.2021 06:34, Juergen Gross wrote:
>> On 16.12.21 22:15, Stefano Stabellini wrote:
>>> On Thu, 16 Dec 2021, Stefano Stabellini wrote:
>>>> On Thu, 16 Dec 2021, Juergen Gross wrote:
>>>>> On 16.12.21 03:10, Stefano Stabellini wrote:
>>>>>> The case of XENMEM_maximum_ram_page is interesting but it is not a=

>>>>>> problem in reality because the max physical address size is only 4=
0-bit
>>>>>> for aarch32 guests, so 32-bit are always enough to return the high=
est
>>>>>> page in memory for 32-bit guests.
>>>>>
>>>>> You are aware that this isn't the guest's max page, but the host's?=

>>>
>>> I can see now that you meant to say that, no matter what is the max
>>> pseudo-physical address supported by the VM, XENMEM_maximum_ram_page =
is
>>> supposed to return the max memory page, which could go above the
>>> addressibility limit of the VM.
>>>
>>> So XENMEM_maximum_ram_page should potentially be able to return (1<<4=
4)
>>> even when called by an aarch32 VM, with max IPA 40-bit.
>>>
>>> I would imagine it could be useful if dom0 is 32-bit but domUs are
>>> 64-bit on a 64-bit hypervisor (which I think it would be a very rare
>>> configuration on ARM.)
>>>
>>> Then it looks like XENMEM_maximum_ram_page needs to be able to return=
 a
>>> value > 32-bit when called by a 32-bit guest.
>>>
>>> The hypercall ABI follows the ARM C calling convention, so a 64-bit
>>> value should be returned using r0 and r1. But looking at
>>> xen/arch/arm/traps.c:do_trap_hypercall, it doesn't seem it ever sets =
r1
>>> today. Only r0 is set, so effectively we only support 32-bit return
>>> values on aarch32 and for aarch32 guests.
>>>
>>> In other words, today all hypercalls on ARM return 64-bit to 64-bit
>>> guests and 32-bit to 32-bit guests. Which in the case of memory_op is=

>>> "technically" the correct thing to do because it matches the C
>>> declaration in xen/include/xen/hypercall.h:
>>>
>>> extern long
>>> do_memory_op(
>>>       unsigned long cmd,
>>>       XEN_GUEST_HANDLE_PARAM(void) arg);
>>>
>>> So...  I guess the conclusion is that on ARM do_memory_op should retu=
rn
>>> "long" although it is not actually enough for a correct implementatio=
n
>>> of XENMEM_maximum_ram_page for aarch32 guests ?
>>>
>>
>> Hence my suggestion to check the return value of _all_ hypercalls to b=
e
>> proper sign extended int values for 32-bit guests. This would fix all
>> potential issues without silently returning truncated values.
>=20
> Are we absolutely certain we have no other paths left where a possibly
> large unsigned values might be returned? In fact while
> compat_memory_op() does the necessary saturation, I've never been fully=

> convinced of this being the best way of dealing with things. The range
> of error indicators is much smaller than [-INT_MIN,-1], so almost
> double the range of effectively unsigned values could be passed back
> fine. (Obviously we can't change existing interfaces, so this mem-op
> will need to remain as is.)

In fact libxenctrl tries do deal with this fact by wrapping a memory_op
for a 32-bit environment into a multicall. This will work fine for a
32-bit Arm guest, as xen_ulong_t is a uint64 there.

So do_memory_op should return long on Arm, yes. OTOH doing so will
continue to be a problem in case a 32-bit guest doesn't use the
multicall technique for handling possible 64-bit return values.

So I continue to argue that on Arm the return value of a hypercall
should be tested to fit into 32 bits. The only really clean alternative
would be to have separate hypercall function classes for Arm 32- and
64-bit guests (which still could share most of the functions by letting
those return "int"). This would allow to use the 64-bit variant even for
32-bit guests in multicall (fine as the return field is 64-bit wide),
and a probably saturating compat version for the 32-bit guest direct
hypercall.

The needed adaptions in my series would be rather limited (an additional
column in the hypercall table, a split which macro to use in
do_trap_hypercall() on Arm depending on the bitness of the guest, the
addition of the Arm compat variant of do_memory_op()).

Thoughts?


Juergen

--------------9EB6E965C5C34C296DC064CB
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

--------------9EB6E965C5C34C296DC064CB--

--1E8sqgQO64EoiDLARRryPRlSx9qCBvQvO--

--nasBDvb8IM7iEBsstkrk6ROKYs2XsboOK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG8T1cFAwAAAAAACgkQsN6d1ii/Ey9Z
ngf9HY7Ldi1QjPIx9kDYWrbqCIzbuKPe8UKKvTqvGoPvh8tGXTGr1/OpAQQMXE7OypUpmf/DGAvQ
gFU6p6IR47pCrkTdTS78LLmDR6LS85SYmqr0Ym6/8up0VVZ8wJDVEdX4uJYhvxakTPDB+CnpdaPy
PXu7DyeI8NNVyZ2p79/ovpdzkmqFVagsjKUNcnsp6mCoOesvQA94MFeDid/fTRZK2UKcGNcCLquJ
liDzmHbANVMryP7liXpebKRGdc39jTSwBSLkIs+88kPQCzL+OyNNeaKnZzBILvcCG676OY+q2pwP
uKcNYSPxYOMKhczKutnzrXmVQgSn/8/U0Vut+NOo9w==
=2tT+
-----END PGP SIGNATURE-----

--nasBDvb8IM7iEBsstkrk6ROKYs2XsboOK--

