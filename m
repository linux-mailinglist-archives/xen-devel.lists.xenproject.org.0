Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60D2DDF78
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 09:20:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56374.98686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqAzM-0007Va-0g; Fri, 18 Dec 2020 08:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56374.98686; Fri, 18 Dec 2020 08:19:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqAzL-0007VB-Ti; Fri, 18 Dec 2020 08:19:47 +0000
Received: by outflank-mailman (input) for mailman id 56374;
 Fri, 18 Dec 2020 08:19:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4wv=FW=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kqAzK-0007V6-CH
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 08:19:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 17e0ba05-df6d-4c42-9fe6-2d509dc0cd61;
 Fri, 18 Dec 2020 08:19:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 10E5DABC6;
 Fri, 18 Dec 2020 08:19:39 +0000 (UTC)
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
X-Inumbo-ID: 17e0ba05-df6d-4c42-9fe6-2d509dc0cd61
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608279579; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H+IEL3u/f2WSITNorjp40t4yPS3R4acSzY9/k4Vg2Ts=;
	b=GpRtjrsUIjHUmwUBnhiGjwJvr3lHfeK/TSTgEkbcvqXpnL2czT5BxnBYN6NPor0+A2VMFu
	C0ZHjyYtCh6ZtzRR7oO6Eq/Um63G6C++FzMRTvtV6xXUOXQqCYq7jFfYd3v/rBN+j0Czht
	pgHH/NeIdeDehZ7bOCb8sGBXwhNiXc0=
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com,
 Rahul.Singh@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201215112610.1986-1-julien@xen.org>
 <c5ac88e6-4e06-553d-2996-d2b027acd782@suse.com>
 <04455739-f07f-3da8-f764-33600a9cab6f@xen.org>
 <3f165cf8-88a4-590a-6e86-2435e8a7e554@suse.com>
 <alpine.DEB.2.21.2012171553340.4040@sstabellini-ThinkPad-T480s>
 <81ea6132-b8b6-90b9-2c5c-9ca89ee6c0d0@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
Message-ID: <142e7b4d-649d-07d0-26cf-185a434a365c@suse.com>
Date: Fri, 18 Dec 2020 09:19:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <81ea6132-b8b6-90b9-2c5c-9ca89ee6c0d0@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dd3N3pNamgrCKyyBJdoADTe5AccG4qnuR"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dd3N3pNamgrCKyyBJdoADTe5AccG4qnuR
Content-Type: multipart/mixed; boundary="maDW8Pd8OjU1d7LYXePMnizjhfujNt8b8";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com,
 Rahul.Singh@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <142e7b4d-649d-07d0-26cf-185a434a365c@suse.com>
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
References: <20201215112610.1986-1-julien@xen.org>
 <c5ac88e6-4e06-553d-2996-d2b027acd782@suse.com>
 <04455739-f07f-3da8-f764-33600a9cab6f@xen.org>
 <3f165cf8-88a4-590a-6e86-2435e8a7e554@suse.com>
 <alpine.DEB.2.21.2012171553340.4040@sstabellini-ThinkPad-T480s>
 <81ea6132-b8b6-90b9-2c5c-9ca89ee6c0d0@suse.com>
In-Reply-To: <81ea6132-b8b6-90b9-2c5c-9ca89ee6c0d0@suse.com>

--maDW8Pd8OjU1d7LYXePMnizjhfujNt8b8
Content-Type: multipart/mixed;
 boundary="------------E84DAD1C22DFDE7C30466659"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E84DAD1C22DFDE7C30466659
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.12.20 08:54, Jan Beulich wrote:
> On 18.12.2020 00:54, Stefano Stabellini wrote:
>> On Tue, 15 Dec 2020, Jan Beulich wrote:
>>> On 15.12.2020 14:19, Julien Grall wrote:
>>>> On 15/12/2020 11:46, Jan Beulich wrote:
>>>>> On 15.12.2020 12:26, Julien Grall wrote:
>>>>>> --- a/xen/include/xen/lib.h
>>>>>> +++ b/xen/include/xen/lib.h
>>>>>> @@ -23,7 +23,13 @@
>>>>>>    #include <asm/bug.h>
>>>>>>   =20
>>>>>>    #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
>>>>>> -#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
>>>>>> +#define WARN_ON(p)  ({                  \
>>>>>> +    bool __ret_warn_on =3D (p);           \
>>>>>
>>>>> Please can you avoid leading underscores here?
>>>>
>>>> I can.
>>>>
>>>>>
>>>>>> +                                        \
>>>>>> +    if ( unlikely(__ret_warn_on) )      \
>>>>>> +        WARN();                         \
>>>>>> +    unlikely(__ret_warn_on);            \
>>>>>> +})
>>>>>
>>>>> Is this latter unlikely() having any effect? So far I thought it
>>>>> would need to be immediately inside a control construct or be an
>>>>> operand to && or ||.
>>>>
>>>> The unlikely() is directly taken from the Linux implementation.
>>>>
>>>> My guess is the compiler is still able to use the information for th=
e
>>>> branch prediction in the case of:
>>>>
>>>> if ( WARN_ON(...) )
>>>
>>> Maybe. Or maybe not. I don't suppose the Linux commit introducing
>>> it clarifies this?
>>
>> I did a bit of digging but it looks like the unlikely has been there
>> forever. I'd just keep it as is.
>=20
> I'm afraid I don't view this as a reason to inherit code unchanged.
> If it was introduced with a clear indication that compilers can
> recognize it despite the somewhat unusual placement, then fine. But
> likely() / unlikely() quite often get put in more or less blindly -
> see the not uncommon unlikely(a && b) style of uses, which don't
> typically have the intended effect and would instead need to be
> unlikely(a) && unlikely(b) [assuming each condition alone is indeed
> deemed unlikely], unless compilers have learned to guess/infer
> what's meant between when I last looked at this and now.

I have made a little experiment and found that the unlikely() at the
end of a macro is having effect.

The disassembly of

#define unlikely(x) __builtin_expect(!!(x), 0)

#define foo() ({        \
         int i =3D !time(NULL); \
         unlikely(i); })

#include "stdio.h"
#include "time.h"

int main() {
     if (foo())
         puts("a");
     return 0;
}

is the same as that of:

#define unlikely(x) __builtin_expect(!!(x), 0)

#include "stdio.h"
#include "time.h"

int main() {
     int i =3D !time(NULL);

     if (unlikely(i))
         puts("a");
     return 0;
}

while that of:

#include "stdio.h"
#include "time.h"

int main() {
     int i =3D !time(NULL);

     if (i)
         puts("a");
     return 0;
}

is different.


Juergen

--------------E84DAD1C22DFDE7C30466659
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

--------------E84DAD1C22DFDE7C30466659--

--maDW8Pd8OjU1d7LYXePMnizjhfujNt8b8--

--dd3N3pNamgrCKyyBJdoADTe5AccG4qnuR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/cZhoFAwAAAAAACgkQsN6d1ii/Ey/R
kgf7BmbbJsVx6qRMVxfz4T4JHaCjQ6i8YVR50AOvG4Ba4MhG/Gn6ppSNi0dJk9d4fWPP8Y8WQvYy
npRqLWSd50PSAkwQ9x2gIK25VGCLxK0gfQ44xqsphu1UwQjIq+kMWvdz+nxYqPnYmg0Nzyb1anZ2
Ju3uz935QPe1XRT0gvTPK1uhlMZSI3+8bizRKTvEc5JYomhbB3lI6fAT8DovKfUoZCQm68HFt1Kn
KVnUMiXxCJWEh3QzDljTIXTvFkOS7qdMKKglLXS8ejkI1DJDcoadtoohxASL4w1014xNdfr1vvXw
JwVvYP6pwfs5Du3So4D2QWhIAucnLw2kQSS3J712kw==
=I7FP
-----END PGP SIGNATURE-----

--dd3N3pNamgrCKyyBJdoADTe5AccG4qnuR--

