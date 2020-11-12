Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FA52B0527
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 13:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25797.53802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdC46-0003GQ-LE; Thu, 12 Nov 2020 12:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25797.53802; Thu, 12 Nov 2020 12:51:02 +0000
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
	id 1kdC46-0003G1-IF; Thu, 12 Nov 2020 12:51:02 +0000
Received: by outflank-mailman (input) for mailman id 25797;
 Thu, 12 Nov 2020 12:51:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdC45-0003Fu-4F
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:51:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 02c56eee-d1b1-4f41-b0f0-bbb3db933b94;
 Thu, 12 Nov 2020 12:50:59 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 82276AC75;
 Thu, 12 Nov 2020 12:50:58 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdC45-0003Fu-4F
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 12:51:01 +0000
X-Inumbo-ID: 02c56eee-d1b1-4f41-b0f0-bbb3db933b94
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 02c56eee-d1b1-4f41-b0f0-bbb3db933b94;
	Thu, 12 Nov 2020 12:50:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605185458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aaQOEo1oc8aBjYCLuIdNVr/b3Z9v3z3JUDjlzDpRiI4=;
	b=Dqn2jrv1nDnfNTx5b/eO20IZVf5UtTiYQOUJWRf2356niPvdAlUYNbp7bLGAs/X4XQoOls
	jWGr3aHfoa8CL6EFUhr+RCAKwmn+hEhK29oYqgrRfIlZ+VnuV1m0lbTWOMiVF/G9A45tsS
	jtWPJSAZYeJ+1ggwRtBJF8vF5dRxXy4=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 82276AC75;
	Thu, 12 Nov 2020 12:50:58 +0000 (UTC)
Subject: Re: [PATCH] xen: add support for automatic debug key actions in case
 of crash
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201022143905.11032-1-jgross@suse.com>
 <977bab69-892c-d94d-d952-1a748f69d0b6@suse.com>
 <53732f8f-fe6d-91bd-4100-4b4d904a4073@suse.com>
 <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <8c77ff71-a14e-7cf7-5f27-c7c152ace240@suse.com>
Date: Thu, 12 Nov 2020 13:50:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hM1ECeJX8mgiaB888nnp36HVgRctACYfd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hM1ECeJX8mgiaB888nnp36HVgRctACYfd
Content-Type: multipart/mixed; boundary="bwoMxFaVyrSneugGhwez8ExgAeq6BklI3";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <8c77ff71-a14e-7cf7-5f27-c7c152ace240@suse.com>
Subject: Re: [PATCH] xen: add support for automatic debug key actions in case
 of crash
References: <20201022143905.11032-1-jgross@suse.com>
 <977bab69-892c-d94d-d952-1a748f69d0b6@suse.com>
 <53732f8f-fe6d-91bd-4100-4b4d904a4073@suse.com>
 <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com>
In-Reply-To: <ed2f73e7-04cc-f568-f0b7-19c843a8d31b@suse.com>

--bwoMxFaVyrSneugGhwez8ExgAeq6BklI3
Content-Type: multipart/mixed;
 boundary="------------4818A1C4ED0F81B33A768B73"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4818A1C4ED0F81B33A768B73
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 29.10.20 15:49, Jan Beulich wrote:
> On 29.10.2020 15:40, J=C3=BCrgen Gro=C3=9F wrote:
>> On 29.10.20 15:22, Jan Beulich wrote:
>>> On 22.10.2020 16:39, Juergen Gross wrote:
>>>> @@ -507,6 +509,41 @@ void __init initialize_keytable(void)
>>>>        }
>>>>    }
>>>>   =20
>>>> +#define CRASHACTION_SIZE  32
>>>> +static char crash_debug_panic[CRASHACTION_SIZE];
>>>> +static char crash_debug_hwdom[CRASHACTION_SIZE];
>>>> +static char crash_debug_watchdog[CRASHACTION_SIZE];
>>>> +static char crash_debug_kexeccmd[CRASHACTION_SIZE];
>>>> +static char crash_debug_debugkey[CRASHACTION_SIZE];
>>>> +
>>>> +static char *crash_action[CRASHREASON_N] =3D {
>>>> +    [CRASHREASON_PANIC] =3D crash_debug_panic,
>>>> +    [CRASHREASON_HWDOM] =3D crash_debug_hwdom,
>>>> +    [CRASHREASON_WATCHDOG] =3D crash_debug_watchdog,
>>>> +    [CRASHREASON_KEXECCMD] =3D crash_debug_kexeccmd,
>>>> +    [CRASHREASON_DEBUGKEY] =3D crash_debug_debugkey,
>>>> +};
>>>> +
>>>> +string_runtime_param("crash-debug-panic", crash_debug_panic);
>>>> +string_runtime_param("crash-debug-hwdom", crash_debug_hwdom);
>>>> +string_runtime_param("crash-debug-watchdog", crash_debug_watchdog);=

>>>> +string_runtime_param("crash-debug-kexeccmd", crash_debug_kexeccmd);=

>>>> +string_runtime_param("crash-debug-debugkey", crash_debug_debugkey);=

>>>
>>> In general I'm not in favor of this (or similar) needing
>>> five new command line options, instead of just one. The problem
>>> with e.g.
>>>
>>> crash-debug=3Dpanic:rq,watchdog:0d
>>>
>>> is that ',' (or any other separator chosen) could in principle
>>> also be a debug key. It would still be possible to use
>>>
>>> crash-debug=3Dpanic:rq crash-debug=3Dwatchdog:0d
>>>
>>> though. Thoughts?
>>
>> OTOH the runtime parameters are much easier addressable that way.
>=20
> Ah yes, I can see this as a reason. Would make we wonder whether
> command line and runtime handling may want disconnecting in this
> specific case then. (But I can also see the argument of this
> being too much overhead then.)
>=20
>>>> +void keyhandler_crash_action(enum crash_reason reason)
>>>> +{
>>>> +    const char *action =3D crash_action[reason];
>>>> +    struct cpu_user_regs *regs =3D get_irq_regs() ? : guest_cpu_use=
r_regs();
>>>> +
>>>> +    while ( *action ) {
>>>> +        if ( *action =3D=3D '.' )
>>>> +            mdelay(1000);
>>>> +        else
>>>> +            handle_keypress(*action, regs);
>>>> +        action++;
>>>> +    }
>>>> +}
>>>
>>> I think only diagnostic keys should be permitted here.
>>
>> While I understand that other keys could produce nonsense or do harm,
>> I'm not sure we should really prohibit them. Allowing them would e.g.
>> allow to do just a reboot without kdump for one type of crashes.
>=20
> Ah yes, that's a fair point.
>=20
>>>> --- a/xen/include/xen/kexec.h
>>>> +++ b/xen/include/xen/kexec.h
>>>> @@ -1,6 +1,8 @@
>>>>    #ifndef __XEN_KEXEC_H__
>>>>    #define __XEN_KEXEC_H__
>>>>   =20
>>>> +#include <xen/keyhandler.h>
>>>
>>> Could we go without this, utilizing the gcc extension of forward
>>> declared enums? Otoh ...
>>>
>>>> @@ -82,7 +84,11 @@ void vmcoreinfo_append_str(const char *fmt, ...)
>>>>    #define kexecing 0
>>>>   =20
>>>>    static inline void kexec_early_calculations(void) {}
>>>> -static inline void kexec_crash(void) {}
>>>> +static inline void kexec_crash(enum crash_reason reason)
>>>> +{
>>>> +    keyhandler_crash_action(reason);
>>>> +}
>>>
>>> ... if this is to be an inline function and not just a #define,
>>> it'll need the declaration of the function to have been seen.
>>
>> And even being a #define all users of kexec_crash() would need to
>> #include keyhandler.h (and I'm not sure there are any source files
>> including kexec.h which don't use kexec_crash()).
>=20
> About as many which do as ones which don't. But there's no
> generally accessible header which includes xen/kexec.h, so perhaps
> the extra dependency indeed isn't all this problematic.

Any further comments, or even better, Acks?


Juergen


--------------4818A1C4ED0F81B33A768B73
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

--------------4818A1C4ED0F81B33A768B73--

--bwoMxFaVyrSneugGhwez8ExgAeq6BklI3--

--hM1ECeJX8mgiaB888nnp36HVgRctACYfd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+tL7EFAwAAAAAACgkQsN6d1ii/Ey9Z
oAgAnrBT9BDrZN9Nv4LYT/EOflIVmzHiiAPSHVn61h7a2s3Xew8erTXFZuzdaYzdvvzwyW5ovr+v
fYcBfCD9s0Nc7tIMJRQ8X4tPjM3owaDHkT2qzAFnHXaiVbF1pCvR1Vc7yUNSNaaGWyMnrbx+Kml6
ls8ln7vczjAbFEbL6dM8NiXN4LbKJ2jDEIFJaJS5sAAz3AZmLI1+EspBwRiAfHTrlm/E4gslCI21
cLYVf0agdk1IgU7C3uyHgX/TvZb0H+AoBlinnM/bblbg1CkZUdcCZka1QldX4yOOMrUPhQEDTxkE
+wU6SR/I4xXwtDjEClqKvy2JMguOiUDWwGGO+4GkCQ==
=bRa8
-----END PGP SIGNATURE-----

--hM1ECeJX8mgiaB888nnp36HVgRctACYfd--

