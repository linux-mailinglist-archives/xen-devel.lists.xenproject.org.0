Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B33412D43DE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 15:06:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48284.85362 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn06C-0004rk-Ao; Wed, 09 Dec 2020 14:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48284.85362; Wed, 09 Dec 2020 14:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn06C-0004qp-7R; Wed, 09 Dec 2020 14:05:44 +0000
Received: by outflank-mailman (input) for mailman id 48284;
 Wed, 09 Dec 2020 14:05:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sDS6=FN=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kn06B-0004qf-0V
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 14:05:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 74e3124d-8db3-46b9-aee1-d8f53be237dc;
 Wed, 09 Dec 2020 14:05:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0203ACEB;
 Wed,  9 Dec 2020 14:05:40 +0000 (UTC)
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
X-Inumbo-ID: 74e3124d-8db3-46b9-aee1-d8f53be237dc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607522741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uXgDSSgnRzBGDMdctLYaRQ+Qn2PprXJNdztVTKfo77c=;
	b=VBLFnGdFLTZejaes667CEyWZxD0WAgEJ51z5oj3X8hKrujSoQO3KE8O+t/PTAzZi9+s3+H
	s0Ej2Glu5ccJ8u9gsnr256lA8K5pMwj5Xsyx4FqRkAfCEtHb/xtCrk2T3NVppdMovVrLTa
	7NxlwD+oCqy1r458bCjBnqoIF2sArLY=
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
To: Mark Rutland <mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>
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
 <20201209132710.GA8566@C02TD0UTHF1T.local>
 <20201209140221.GA9087@C02TD0UTHF1T.local>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <a37be173-6702-5523-8757-2b5a1b4ae311@suse.com>
Date: Wed, 9 Dec 2020 15:05:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201209140221.GA9087@C02TD0UTHF1T.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="SbHnCuqvhr456hxBGyZfmnROM8i0IqhVV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--SbHnCuqvhr456hxBGyZfmnROM8i0IqhVV
Content-Type: multipart/mixed; boundary="3SWBQ2CGRPlIb6qugl6p4NZVoXATi0Vjq";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Mark Rutland <mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "VMware, Inc." <pv-drivers@vmware.com>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, xen-devel
 <xen-devel@lists.xenproject.org>, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <a37be173-6702-5523-8757-2b5a1b4ae311@suse.com>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-6-jgross@suse.com>
 <20201120115943.GD3021@hirez.programming.kicks-ass.net>
 <eb05e878-6334-8d19-496b-6572df67fc56@suse.com>
 <CALCETrXOGhXoOJpzhAMqD7iibi09WzbGk9SWVH7JzA=d5uarWA@mail.gmail.com>
 <20201209132710.GA8566@C02TD0UTHF1T.local>
 <20201209140221.GA9087@C02TD0UTHF1T.local>
In-Reply-To: <20201209140221.GA9087@C02TD0UTHF1T.local>

--3SWBQ2CGRPlIb6qugl6p4NZVoXATi0Vjq
Content-Type: multipart/mixed;
 boundary="------------11CE66C562C189ECDCC48235"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------11CE66C562C189ECDCC48235
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.12.20 15:02, Mark Rutland wrote:
> On Wed, Dec 09, 2020 at 01:27:10PM +0000, Mark Rutland wrote:
>> On Sun, Nov 22, 2020 at 01:44:53PM -0800, Andy Lutomirski wrote:
>>> On Sat, Nov 21, 2020 at 10:55 PM J=C3=BCrgen Gro=C3=9F <jgross@suse.c=
om> wrote:
>>>> On 20.11.20 12:59, Peter Zijlstra wrote:
>>>>> If someone were to write horrible code like:
>>>>>
>>>>>        local_irq_disable();
>>>>>        local_irq_save(flags);
>>>>>        local_irq_enable();
>>>>>        local_irq_restore(flags);
>>>>>
>>>>> we'd be up some creek without a paddle... now I don't _think_ we ha=
ve
>>>>> genius code like that, but I'd feel saver if we can haz an assertio=
n in
>>>>> there somewhere...
>=20
>> I was just talking to Peter on IRC about implementing the same thing f=
or
>> arm64, so could we put this in the generic irqflags code? IIUC we can
>> use raw_irqs_disabled() to do the check.
>>
>> As this isn't really entry specific (and IIUC the cases this should
>> catch would break lockdep today), maybe we should add a new
>> DEBUG_IRQFLAGS for this, that DEBUG_LOCKDEP can also select?
>>
>> Something like:
>>
>> #define local_irq_restore(flags)                               \
>>         do {                                                    \
>>                 if (!raw_irqs_disabled_flags(flags)) {          \
>>                         trace_hardirqs_on();                    \
>>                 } else if (IS_ENABLED(CONFIG_DEBUG_IRQFLAGS) {  \
>>                         if (unlikely(raw_irqs_disabled())       \
>=20
> Whoops; that should be !raw_irqs_disabled().
>=20
>>                                 warn_bogus_irqrestore();        \
>>                 }                                               \
>>                 raw_local_irq_restore(flags);                   \
>>          } while (0)
>>
>> ... perhaps? (ignoring however we deal with once-ness).
>=20
> If no-one shouts in the next day or two I'll spin this as its own patch=
=2E

Fine with me. So I'll just ignore a potential error case in my patch.

Thanks,


Juergen


--------------11CE66C562C189ECDCC48235
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

--------------11CE66C562C189ECDCC48235--

--3SWBQ2CGRPlIb6qugl6p4NZVoXATi0Vjq--

--SbHnCuqvhr456hxBGyZfmnROM8i0IqhVV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl/Q2bMFAwAAAAAACgkQsN6d1ii/Ey+M
Sgf/YvUCb1mTnblXUk7krczQ1ATvqpRzUPkRKWI/gbHwiba2E6IgZu9qI9rnOGU2XftlrlseQrYY
TgBQ6ElRBxmD7UwTQHYEo8sGuk4aRzlqWFZLiOQhYPhqFc8uv3eWlZWVcplQH9mer1rAZS4Z0tCR
Rbh4HJa+Qmfhh0n0L+kBDWzNfll7LrjnV21sZLSSzSDLsDxObqi4yRoM+Mr/0wLovtHHb3oVIE3y
q87ZQjcZeCZZYcwIYLQrhpIPtU5b7rrYB5kLEyKHus+S+B+PciDn7QYEvbfIddjOmaIMB8VWIIC4
Ir1NaFfvEJlgYdw15YRsTmU/yqkiTZ3/cp4vlaFqKw==
=ZFoe
-----END PGP SIGNATURE-----

--SbHnCuqvhr456hxBGyZfmnROM8i0IqhVV--

