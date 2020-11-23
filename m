Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E57032BFF64
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 06:23:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33606.64720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kh4Ic-0006HP-AL; Mon, 23 Nov 2020 05:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33606.64720; Mon, 23 Nov 2020 05:22:02 +0000
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
	id 1kh4Ic-0006Gz-2A; Mon, 23 Nov 2020 05:22:02 +0000
Received: by outflank-mailman (input) for mailman id 33606;
 Mon, 23 Nov 2020 05:22:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xOkN=E5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kh4Ia-0006Gu-C2
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 05:22:00 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3290cf00-ff34-4a28-ab2e-3f70a4a07943;
 Mon, 23 Nov 2020 05:21:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C30A0AC0C;
 Mon, 23 Nov 2020 05:21:57 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=xOkN=E5=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kh4Ia-0006Gu-C2
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 05:22:00 +0000
X-Inumbo-ID: 3290cf00-ff34-4a28-ab2e-3f70a4a07943
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 3290cf00-ff34-4a28-ab2e-3f70a4a07943;
	Mon, 23 Nov 2020 05:21:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606108917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bnlvBaRBDOwhFV9Frw/ljad6M3emL9wmQHU9HFSgjyg=;
	b=hp03zaAa6g9jzr7ZFVJcK9sSTowRPcxkxQEe9lmU/Iow1G3DAlxUFBpvBVKmZJWewAUzYp
	vGYrU8C7R3DG7nHlXCVKch/x7KxTgOIiJvaA3kRKTaVRHf6CnXlZA3TTNnQV9qi0tFvy5H
	GAR5vu9087dpuD1Mp71uPoXjdE0aTbI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C30A0AC0C;
	Mon, 23 Nov 2020 05:21:57 +0000 (UTC)
To: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "VMware, Inc." <pv-drivers@vmware.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-6-jgross@suse.com>
 <20201120115943.GD3021@hirez.programming.kicks-ass.net>
 <eb05e878-6334-8d19-496b-6572df67fc56@suse.com>
 <CALCETrXOGhXoOJpzhAMqD7iibi09WzbGk9SWVH7JzA=d5uarWA@mail.gmail.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
Message-ID: <894a4cec-8426-4152-d391-474711040c5b@suse.com>
Date: Mon, 23 Nov 2020 06:21:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CALCETrXOGhXoOJpzhAMqD7iibi09WzbGk9SWVH7JzA=d5uarWA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KjjwiwVOCYamlMPkg53LvZQjNAFZkdRhT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KjjwiwVOCYamlMPkg53LvZQjNAFZkdRhT
Content-Type: multipart/mixed; boundary="PYEGjNEoNCwI2vygBQpmaIoVRT2ThJktq";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "VMware, Inc." <pv-drivers@vmware.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <894a4cec-8426-4152-d391-474711040c5b@suse.com>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-6-jgross@suse.com>
 <20201120115943.GD3021@hirez.programming.kicks-ass.net>
 <eb05e878-6334-8d19-496b-6572df67fc56@suse.com>
 <CALCETrXOGhXoOJpzhAMqD7iibi09WzbGk9SWVH7JzA=d5uarWA@mail.gmail.com>
In-Reply-To: <CALCETrXOGhXoOJpzhAMqD7iibi09WzbGk9SWVH7JzA=d5uarWA@mail.gmail.com>

--PYEGjNEoNCwI2vygBQpmaIoVRT2ThJktq
Content-Type: multipart/mixed;
 boundary="------------61EFA80FF3AEF2DEA88EC6CD"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------61EFA80FF3AEF2DEA88EC6CD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 22.11.20 22:44, Andy Lutomirski wrote:
> On Sat, Nov 21, 2020 at 10:55 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.com=
> wrote:
>>
>> On 20.11.20 12:59, Peter Zijlstra wrote:
>>> On Fri, Nov 20, 2020 at 12:46:23PM +0100, Juergen Gross wrote:
>>>> +static __always_inline void arch_local_irq_restore(unsigned long fl=
ags)
>>>> +{
>>>> +    if (!arch_irqs_disabled_flags(flags))
>>>> +            arch_local_irq_enable();
>>>> +}
>>>
>>> If someone were to write horrible code like:
>>>
>>>        local_irq_disable();
>>>        local_irq_save(flags);
>>>        local_irq_enable();
>>>        local_irq_restore(flags);
>>>
>>> we'd be up some creek without a paddle... now I don't _think_ we have=

>>> genius code like that, but I'd feel saver if we can haz an assertion =
in
>>> there somewhere...
>>>
>>> Maybe something like:
>>>
>>> #ifdef CONFIG_DEBUG_ENTRY // for lack of something saner
>>>        WARN_ON_ONCE((arch_local_save_flags() ^ flags) & X86_EFLAGS_IF=
);
>>> #endif
>>>
>>> At the end?
>>
>> I'd like to, but using WARN_ON_ONCE() in include/asm/irqflags.h sounds=

>> like a perfect receipt for include dependency hell.
>>
>> We could use a plain asm("ud2") instead.
>=20
> How about out-of-lining it:
>=20
> #ifdef CONFIG_DEBUG_ENTRY
> extern void warn_bogus_irqrestore();
> #endif
>=20
> static __always_inline void arch_local_irq_restore(unsigned long flags)=

> {
>         if (!arch_irqs_disabled_flags(flags)) {
>                 arch_local_irq_enable();
>         } else {
> #ifdef CONFIG_DEBUG_ENTRY
>                 if (unlikely(arch_local_irq_save() & X86_EFLAGS_IF))
>                      warn_bogus_irqrestore();
> #endif
> }
>=20

This couldn't be a WARN_ON_ONCE() then (or it would be a catch all).
Another approach might be to open-code the WARN_ON_ONCE(), like:

#ifdef CONFIG_DEBUG_ENTRY
extern void warn_bogus_irqrestore(bool *once);
#endif

static __always_inline void arch_local_irq_restore(unsigned long flags)
{
	if (!arch_irqs_disabled_flags(flags))
		arch_local_irq_enable();
#ifdef CONFIG_DEBUG_ENTRY
	{
		static bool once;

		if (unlikely(arch_local_irq_save() & X86_EFLAGS_IF))
			warn_bogus_irqrestore(&once);
	}
#endif
}


Juergen

--------------61EFA80FF3AEF2DEA88EC6CD
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

--------------61EFA80FF3AEF2DEA88EC6CD--

--PYEGjNEoNCwI2vygBQpmaIoVRT2ThJktq--

--KjjwiwVOCYamlMPkg53LvZQjNAFZkdRhT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+7RvQFAwAAAAAACgkQsN6d1ii/Ey8g
cQf/Uld5d2rCAffpLFBdphaCOgFSPC2kdsNOxLyfO0gdHESNxsBoZ/BREBUVCnDawcH4cZlOl/6E
ZHl1LQFfe963dpoB0V3n3hscAEalez4yzbsgsoysAqDqyA7Dl/kFW4ycGCnqtQCwK1utjoejDrWo
JnODzWqm4fLZGbe1Y7VUw6G25XSL1mTfoXst86jeU0Ycvr6/NFBA4zFy10wAylyosZe/6xss9lKl
f/GAwNiafJ6o8ZQwxAAh5vRf0oU0ro47p9Pu1wmzXNMfIO8TgazfvOp68Ml/0n4DR+TuCB1tarqx
QqyidG1WLriURSEHtWCAmqiIgeagXTWcLkWsbGIImQ==
=0xzm
-----END PGP SIGNATURE-----

--KjjwiwVOCYamlMPkg53LvZQjNAFZkdRhT--

