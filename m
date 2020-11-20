Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E452BA9F8
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 13:16:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32117.63055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5Kx-0001PV-KB; Fri, 20 Nov 2020 12:16:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32117.63055; Fri, 20 Nov 2020 12:16:23 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg5Kx-0001P6-Gw; Fri, 20 Nov 2020 12:16:23 +0000
Received: by outflank-mailman (input) for mailman id 32117;
 Fri, 20 Nov 2020 12:16:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kg5Kv-0001P1-Sd
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:16:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f25d6969-f41b-49d9-9db2-7a6e1c36fb64;
 Fri, 20 Nov 2020 12:16:21 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C1E4AD5C;
 Fri, 20 Nov 2020 12:16:20 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=wRTa=E2=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kg5Kv-0001P1-Sd
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 12:16:21 +0000
X-Inumbo-ID: f25d6969-f41b-49d9-9db2-7a6e1c36fb64
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f25d6969-f41b-49d9-9db2-7a6e1c36fb64;
	Fri, 20 Nov 2020 12:16:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605874580; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YefhziZmkc//JJPRQ3LwkHDQuojnCOZiaUec095OI04=;
	b=ILqKfaohLJK8dicHB14Kgv92XrND/IT0Xe8mqjbqLssK5A+dRatdi5sXW7J6K+oCUoK7fz
	5p12xurhl/C/BUJ2g05j0XkM9uGNJk/Ds20Cw3oFy0nfvZZrSjqW2j0pGZZEBxo4KA4ZOi
	q/rkJsUnGvHyvBpLwcKIpeqmJDzgvH0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1C1E4AD5C;
	Fri, 20 Nov 2020 12:16:20 +0000 (UTC)
Subject: Re: [PATCH v2 08/12] x86/paravirt: remove no longer needed 32-bit
 pvops cruft
To: Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-9-jgross@suse.com>
 <20201120120805.GF3021@hirez.programming.kicks-ass.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5c123e7f-299d-2a4c-3e30-878537d71546@suse.com>
Date: Fri, 20 Nov 2020 13:16:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120120805.GF3021@hirez.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="a2dWOuOmbtLJqOPjTKdEeUzEma86pRL3J"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--a2dWOuOmbtLJqOPjTKdEeUzEma86pRL3J
Content-Type: multipart/mixed; boundary="PNbjwsjbyz3PMr6RwhSIwf66NdqTWYnze";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: xen-devel@lists.xenproject.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 luto@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Deep Shah <sdeep@vmware.com>,
 "VMware, Inc." <pv-drivers@vmware.com>
Message-ID: <5c123e7f-299d-2a4c-3e30-878537d71546@suse.com>
Subject: Re: [PATCH v2 08/12] x86/paravirt: remove no longer needed 32-bit
 pvops cruft
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-9-jgross@suse.com>
 <20201120120805.GF3021@hirez.programming.kicks-ass.net>
In-Reply-To: <20201120120805.GF3021@hirez.programming.kicks-ass.net>

--PNbjwsjbyz3PMr6RwhSIwf66NdqTWYnze
Content-Type: multipart/mixed;
 boundary="------------648324777AF01D39B6723412"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------648324777AF01D39B6723412
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.11.20 13:08, Peter Zijlstra wrote:
> On Fri, Nov 20, 2020 at 12:46:26PM +0100, Juergen Gross wrote:
>> +#define ____PVOP_CALL(rettype, op, clbr, call_clbr, extra_clbr, ...)	=
\
>>   	({								\
>>   		PVOP_CALL_ARGS;						\
>>   		PVOP_TEST_NULL(op);					\
>> +		BUILD_BUG_ON(sizeof(rettype) > sizeof(unsigned long));	\
>> +		asm volatile(paravirt_alt(PARAVIRT_CALL)		\
>> +			     : call_clbr, ASM_CALL_CONSTRAINT		\
>> +			     : paravirt_type(op),			\
>> +			       paravirt_clobber(clbr),			\
>> +			       ##__VA_ARGS__				\
>> +			     : "memory", "cc" extra_clbr);		\
>> +		(rettype)(__eax & PVOP_RETMASK(rettype));		\
>>   	})
>=20
> This is now very similar to ____PVOP_VCALL() (note how PVOP_CALL_ARGS i=
s
> PVOP_VCALL_ARGS).
>=20
> Could we get away with doing something horrible like:
>=20
> #define ____PVOP_VCALL(X...) (void)____PVOP_CALL(long, X)
>=20
> ?

Oh, indeed. And in patch 9 the same could be done for the ALT variants.


Juergen

--------------648324777AF01D39B6723412
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
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

--------------648324777AF01D39B6723412--

--PNbjwsjbyz3PMr6RwhSIwf66NdqTWYnze--

--a2dWOuOmbtLJqOPjTKdEeUzEma86pRL3J
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+3s5MFAwAAAAAACgkQsN6d1ii/Ey8N
oggAm+XTeQxxn6EH9H9b5kDull2RxB1owydVFJXiteBb0EzjXi2FD6bMGxgzfpeVsvT6e0yQgQN/
PgTwqfzvq5glClCCPcXnzvEJubefKlqCyqBD08LRKXTnP7Dfob9f5/lq8mI507rAQf/OWDpU0djv
gPe3gL9zbundVqMnCaFq3iTSa5jMUgAu3xqaKasSoHjEcFTBGIKYDaEzacdO5PmrsbZ4LZ/aBMow
8ZIUowt41UurQrspfV6OaGmOuALn3DLUnYOX8iEYziExmHG1OTeUBrGK8VfketjkjMwG8EiwEo/j
Wq3vMKtUqrycnxsC2MHef2FRwOBR0ngcXLM9FyZpUg==
=HHlv
-----END PGP SIGNATURE-----

--a2dWOuOmbtLJqOPjTKdEeUzEma86pRL3J--

