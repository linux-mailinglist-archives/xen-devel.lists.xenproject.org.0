Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CFC2BC44F
	for <lists+xen-devel@lfdr.de>; Sun, 22 Nov 2020 07:57:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.33169.64255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kgjI0-0004wC-Fb; Sun, 22 Nov 2020 06:56:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 33169.64255; Sun, 22 Nov 2020 06:56:00 +0000
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
	id 1kgjI0-0004vm-CC; Sun, 22 Nov 2020 06:56:00 +0000
Received: by outflank-mailman (input) for mailman id 33169;
 Sun, 22 Nov 2020 06:55:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JHnk=E4=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kgjHy-0004vh-S0
 for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 06:55:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0052d6bb-2154-4a33-add4-31ff9b8c8229;
 Sun, 22 Nov 2020 06:55:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A9C9CAC24;
 Sun, 22 Nov 2020 06:55:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=JHnk=E4=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kgjHy-0004vh-S0
	for xen-devel@lists.xenproject.org; Sun, 22 Nov 2020 06:55:58 +0000
X-Inumbo-ID: 0052d6bb-2154-4a33-add4-31ff9b8c8229
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0052d6bb-2154-4a33-add4-31ff9b8c8229;
	Sun, 22 Nov 2020 06:55:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606028156; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iPGIycc5SreX1tNqAnk1CrbGSvaixY401jSnfZ0OcO8=;
	b=YhoVc6yRJA7Hyd/6qRQ2RCeZ+gNklZ2SO9S+Pxnrycp3TpHrudIFIdz8h9htqfw1z0o0Da
	/WPtpBMxHLf1kadp09NCbwpwD7z0+gmXzGkyoeLkegl8dV6bF2bvdBtEW0aCpuIwNhe5kI
	02OXq2CHZxqbryAx1CzDsfpcPuui+pg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A9C9CAC24;
	Sun, 22 Nov 2020 06:55:56 +0000 (UTC)
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "VMware, Inc." <pv-drivers@vmware.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-6-jgross@suse.com>
 <20201120115943.GD3021@hirez.programming.kicks-ass.net>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <eb05e878-6334-8d19-496b-6572df67fc56@suse.com>
Date: Sun, 22 Nov 2020 07:55:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120115943.GD3021@hirez.programming.kicks-ass.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="518rpEih7o1nPFHrAWjcWEEq1OxhTURnl"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--518rpEih7o1nPFHrAWjcWEEq1OxhTURnl
Content-Type: multipart/mixed; boundary="jQq1T1YouRN2JZiH7iLQxRXnrey8Ohlrr";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "VMware, Inc." <pv-drivers@vmware.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 luto@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <eb05e878-6334-8d19-496b-6572df67fc56@suse.com>
Subject: Re: [PATCH v2 05/12] x86: rework arch_local_irq_restore() to not use
 popf
References: <20201120114630.13552-1-jgross@suse.com>
 <20201120114630.13552-6-jgross@suse.com>
 <20201120115943.GD3021@hirez.programming.kicks-ass.net>
In-Reply-To: <20201120115943.GD3021@hirez.programming.kicks-ass.net>

--jQq1T1YouRN2JZiH7iLQxRXnrey8Ohlrr
Content-Type: multipart/mixed;
 boundary="------------E1F431A6017EB6D5E463C990"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E1F431A6017EB6D5E463C990
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.11.20 12:59, Peter Zijlstra wrote:
> On Fri, Nov 20, 2020 at 12:46:23PM +0100, Juergen Gross wrote:
>> +static __always_inline void arch_local_irq_restore(unsigned long flag=
s)
>> +{
>> +	if (!arch_irqs_disabled_flags(flags))
>> +		arch_local_irq_enable();
>> +}
>=20
> If someone were to write horrible code like:
>=20
> 	local_irq_disable();
> 	local_irq_save(flags);
> 	local_irq_enable();
> 	local_irq_restore(flags);
>=20
> we'd be up some creek without a paddle... now I don't _think_ we have
> genius code like that, but I'd feel saver if we can haz an assertion in=

> there somewhere...
>=20
> Maybe something like:
>=20
> #ifdef CONFIG_DEBUG_ENTRY // for lack of something saner
> 	WARN_ON_ONCE((arch_local_save_flags() ^ flags) & X86_EFLAGS_IF);
> #endif
>=20
> At the end?

I'd like to, but using WARN_ON_ONCE() in include/asm/irqflags.h sounds
like a perfect receipt for include dependency hell.

We could use a plain asm("ud2") instead.


Juergen

--------------E1F431A6017EB6D5E463C990
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

--------------E1F431A6017EB6D5E463C990--

--jQq1T1YouRN2JZiH7iLQxRXnrey8Ohlrr--

--518rpEih7o1nPFHrAWjcWEEq1OxhTURnl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+6C3sFAwAAAAAACgkQsN6d1ii/Ey+j
1Af/ccrLifuyIl3V4LsUu/cvNyV8QALQhJ7KI/N59Zdpr151J4U1s0XAPrdAOlHy6NJQrA7/weGM
JYypQDuZxWj05tupE1AyPtaF3gudxpmB9ZtWbvRNR0VAsJJpi03a5ZcIe7dEc0igSYlccykUcIU/
HaQeb97wnEJhBH0Dc6xAi5DLrmcOxYyHnHBPed2pAwJWYSDiHRK3hqT6UHsxSPcTZqf259C+tAK0
4Pfe7fg6z4rfS4VCao+k0NRAD+B7tRRcYY9Fkz3UxdQh2g18u9w1zscTt8t7t31SWIzSkURhkon3
Z6lm83tdpUrE9142wyGoZZO1XXlAhZJ7m2vGXRzMWw==
=th+3
-----END PGP SIGNATURE-----

--518rpEih7o1nPFHrAWjcWEEq1OxhTURnl--

