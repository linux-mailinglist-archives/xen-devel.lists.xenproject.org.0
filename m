Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DE02AB0D7
	for <lists+xen-devel@lfdr.de>; Mon,  9 Nov 2020 06:34:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.21956.48298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kbzog-0003O7-Ow; Mon, 09 Nov 2020 05:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 21956.48298; Mon, 09 Nov 2020 05:34:10 +0000
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
	id 1kbzog-0003Ni-Le; Mon, 09 Nov 2020 05:34:10 +0000
Received: by outflank-mailman (input) for mailman id 21956;
 Mon, 09 Nov 2020 05:34:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kbzof-0003Nd-Sx
 for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 05:34:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 971652e7-1c2f-4917-bc75-0a2b28e0915f;
 Mon, 09 Nov 2020 05:34:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7131EABAE;
 Mon,  9 Nov 2020 05:34:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=sEkb=EP=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kbzof-0003Nd-Sx
	for xen-devel@lists.xenproject.org; Mon, 09 Nov 2020 05:34:09 +0000
X-Inumbo-ID: 971652e7-1c2f-4917-bc75-0a2b28e0915f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 971652e7-1c2f-4917-bc75-0a2b28e0915f;
	Mon, 09 Nov 2020 05:34:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604900048;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=noiwDpF5h6c55/R3o+eIuWv6Yp6OH0DaU2dC3h8Ij3M=;
	b=Ks60smEgzrqCfdsMA3Cu4ez8mQ/b+lRNUSiTGZd2dzvczdBKhKRw/CT8K9G7IxG1QArf2S
	tejkI/taZVBfcnX+x//mH5eudTrqyMkDyRhtfyu1O+BfC9KQYOu+rEWkOIM6+3MwuwY+/K
	91DIj6/Oq6t0ykacjqnRMEOLTCZGe7M=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7131EABAE;
	Mon,  9 Nov 2020 05:34:08 +0000 (UTC)
Subject: Re: [PATCH v2] x86/xen: don't unbind uninitialized lock_kicker_irq
To: Brian Masney <bmasney@redhat.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dustymabe@redhat.com
References: <20201107011119.631442-1-bmasney@redhat.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <5950df5c-79d6-b2bc-4f2b-35624a3c0d1e@suse.com>
Date: Mon, 9 Nov 2020 06:34:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201107011119.631442-1-bmasney@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YKXpHhhBagLrE4UFk7e72LVQHqGGgIOur"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YKXpHhhBagLrE4UFk7e72LVQHqGGgIOur
Content-Type: multipart/mixed; boundary="5v4Fbrt87IaxiF1E3Az2Gieiq5dDG3qgf";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Brian Masney <bmasney@redhat.com>, boris.ostrovsky@oracle.com,
 sstabellini@kernel.org
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
 hpa@zytor.com, xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dustymabe@redhat.com
Message-ID: <5950df5c-79d6-b2bc-4f2b-35624a3c0d1e@suse.com>
Subject: Re: [PATCH v2] x86/xen: don't unbind uninitialized lock_kicker_irq
References: <20201107011119.631442-1-bmasney@redhat.com>
In-Reply-To: <20201107011119.631442-1-bmasney@redhat.com>

--5v4Fbrt87IaxiF1E3Az2Gieiq5dDG3qgf
Content-Type: multipart/mixed;
 boundary="------------6D3294FCE9D5D6953DCD3E3D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6D3294FCE9D5D6953DCD3E3D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 07.11.20 02:11, Brian Masney wrote:
> When booting a hyperthreaded system with the kernel parameter
> 'mitigations=3Dauto,nosmt', the following warning occurs:
>=20
>      WARNING: CPU: 0 PID: 1 at drivers/xen/events/events_base.c:1112 un=
bind_from_irqhandler+0x4e/0x60
>      ...
>      Hardware name: Xen HVM domU, BIOS 4.2.amazon 08/24/2006
>      ...
>      Call Trace:
>       xen_uninit_lock_cpu+0x28/0x62
>       xen_hvm_cpu_die+0x21/0x30
>       takedown_cpu+0x9c/0xe0
>       ? trace_suspend_resume+0x60/0x60
>       cpuhp_invoke_callback+0x9a/0x530
>       _cpu_up+0x11a/0x130
>       cpu_up+0x7e/0xc0
>       bringup_nonboot_cpus+0x48/0x50
>       smp_init+0x26/0x79
>       kernel_init_freeable+0xea/0x229
>       ? rest_init+0xaa/0xaa
>       kernel_init+0xa/0x106
>       ret_from_fork+0x35/0x40
>=20
> The secondary CPUs are not activated with the nosmt mitigations and onl=
y
> the primary thread on each CPU core is used. In this situation,
> xen_hvm_smp_prepare_cpus(), and more importantly xen_init_lock_cpu(), i=
s
> not called, so the lock_kicker_irq is not initialized for the secondary=

> CPUs. Let's fix this by exiting early in xen_uninit_lock_cpu() if the
> irq is not set to avoid the warning from above for each secondary CPU.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen

--------------6D3294FCE9D5D6953DCD3E3D
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

--------------6D3294FCE9D5D6953DCD3E3D--

--5v4Fbrt87IaxiF1E3Az2Gieiq5dDG3qgf--

--YKXpHhhBagLrE4UFk7e72LVQHqGGgIOur
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+o1M8FAwAAAAAACgkQsN6d1ii/Ey/m
CAf+Lr22R5JRysNR9BuGXcwWkkWxoz2HyxznekTnFTH6WHZs1xTmnrStNcLH2PKYPQQzAs3QPXc9
fTsZc9S3Ev+I594scUDzKCe/teXIldn1qcXoq462o1RrXxBbtAN6Q2J0NszICInMRMfr8z/srOwc
oFtXTq9s4Ib/IzLI3nZQbnDhHSlB0Z8DyVrO0aB/8RJhJu938Fc10p1MWsRlCogWib133r+8piq0
CeF3MwncLlsfGgFfnbSWT+FNB7iBTcovcf657ks4zQHFk3nMd75/EHC2CYtm1RKzoI9izg/H4/lv
w/yfICC0TMUy7mO+bRopDMK13i8w2jSVngg9uPXpIw==
=YR3F
-----END PGP SIGNATURE-----

--YKXpHhhBagLrE4UFk7e72LVQHqGGgIOur--

