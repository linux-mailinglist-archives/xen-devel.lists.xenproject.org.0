Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 773C22C2595
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 13:23:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35896.67548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khXM8-0002YC-JL; Tue, 24 Nov 2020 12:23:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35896.67548; Tue, 24 Nov 2020 12:23:36 +0000
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
	id 1khXM8-0002Xn-GD; Tue, 24 Nov 2020 12:23:36 +0000
Received: by outflank-mailman (input) for mailman id 35896;
 Tue, 24 Nov 2020 12:23:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1khXM7-0002Xi-Ci
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:23:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecea3f05-e2dc-489a-8df0-7de91c429efe;
 Tue, 24 Nov 2020 12:23:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41361AF8D;
 Tue, 24 Nov 2020 12:23:33 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=KyA6=E6=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1khXM7-0002Xi-Ci
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 12:23:35 +0000
X-Inumbo-ID: ecea3f05-e2dc-489a-8df0-7de91c429efe
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ecea3f05-e2dc-489a-8df0-7de91c429efe;
	Tue, 24 Nov 2020 12:23:34 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606220613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AMXFbJWran/SKNcGpSeqiLdeuTGZOHkVHWpnp252xgE=;
	b=boEmeBdwnvjZiikQp2QlanlKHyy1yRKY3G0F8syetyxwZARiY/NdRdFp+/0CcSujdqYfs8
	I1QZGE+2yZp4ZtIU7kdFk6wwTaxeWNF9Owa+v3czVhE8HdX9tptvHV45p/kPz8LCyclvDH
	nDgt49t55ItNUbQc4MyaoSwONfM+jEc=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 41361AF8D;
	Tue, 24 Nov 2020 12:23:33 +0000 (UTC)
Subject: Re: [PATCH v2] xen: add support for automatic debug key actions in
 case of crash
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201120131306.24388-1-jgross@suse.com>
 <e7cc6511-d741-c7dd-5c35-ab9cf031d4b5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <30821266-e800-c2f2-a903-8c361d0bb5dd@suse.com>
Date: Tue, 24 Nov 2020 13:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e7cc6511-d741-c7dd-5c35-ab9cf031d4b5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dncJQbPPS14y6VWt6BLheMrJfk7aIAfjc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dncJQbPPS14y6VWt6BLheMrJfk7aIAfjc
Content-Type: multipart/mixed; boundary="bVyeKRY09QN2rNwI7Qs5NwuA7fxCvCUsI";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <30821266-e800-c2f2-a903-8c361d0bb5dd@suse.com>
Subject: Re: [PATCH v2] xen: add support for automatic debug key actions in
 case of crash
References: <20201120131306.24388-1-jgross@suse.com>
 <e7cc6511-d741-c7dd-5c35-ab9cf031d4b5@suse.com>
In-Reply-To: <e7cc6511-d741-c7dd-5c35-ab9cf031d4b5@suse.com>

--bVyeKRY09QN2rNwI7Qs5NwuA7fxCvCUsI
Content-Type: multipart/mixed;
 boundary="------------5415E507314CAE744F164A3D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5415E507314CAE744F164A3D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 24.11.20 12:27, Jan Beulich wrote:
> On 20.11.2020 14:13, Juergen Gross wrote:
>> @@ -507,6 +509,42 @@ void __init initialize_keytable(void)
>>       }
>>   }
>>  =20
>> +#define CRASHACTION_SIZE  32
>> +static char crash_debug_panic[CRASHACTION_SIZE];
>> +static char crash_debug_hwdom[CRASHACTION_SIZE];
>> +static char crash_debug_watchdog[CRASHACTION_SIZE];
>> +static char crash_debug_kexeccmd[CRASHACTION_SIZE];
>> +static char crash_debug_debugkey[CRASHACTION_SIZE];
>> +
>> +static char *crash_action[CRASHREASON_N] =3D {
>=20
> Considering the sole use below, I think there can be two "const"
> added here. With this single use I also wonder whether this
> array wouldn't better be private to that function.

Both fine with me.

>=20
>> +    [CRASHREASON_PANIC] =3D crash_debug_panic,
>> +    [CRASHREASON_HWDOM] =3D crash_debug_hwdom,
>> +    [CRASHREASON_WATCHDOG] =3D crash_debug_watchdog,
>> +    [CRASHREASON_KEXECCMD] =3D crash_debug_kexeccmd,
>> +    [CRASHREASON_DEBUGKEY] =3D crash_debug_debugkey,
>> +};
>> +
>> +string_runtime_param("crash-debug-panic", crash_debug_panic);
>> +string_runtime_param("crash-debug-hwdom", crash_debug_hwdom);
>> +string_runtime_param("crash-debug-watchdog", crash_debug_watchdog);
>> +string_runtime_param("crash-debug-kexeccmd", crash_debug_kexeccmd);
>=20
> This one probably wants a CONFIG_KEXEC conditional around it,
> such that requests to set it won't appear to be "okay" on !KEXEC
> builds. At which point the doc probably also wants to mention the
> conditional availability of this option.

Yes.

>=20
>> +string_runtime_param("crash-debug-debugkey", crash_debug_debugkey);
>> +
>> +void keyhandler_crash_action(enum crash_reason reason)
>> +{
>> +    const char *action =3D crash_action[reason];
>=20
> In order to avoid cascade problems when the system's already in
> trouble, maybe better to bounds check "reason" before using as
> array index and, also with the CONFIG_KEXEC related adjustment
> requested above in mind, ...
>=20
>> +    struct cpu_user_regs *regs =3D get_irq_regs() ? : guest_cpu_user_=
regs();
>> +
>> +    while ( *action )
>=20
> ... perhaps also better to check action against NULL before
> de-referencing?

Okay (to both).

And I only now realized that get_irq_regs() is x86 only. I'll add a
dummy Arm function always returning NULL.


Juergen

--------------5415E507314CAE744F164A3D
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

--------------5415E507314CAE744F164A3D--

--bVyeKRY09QN2rNwI7Qs5NwuA7fxCvCUsI--

--dncJQbPPS14y6VWt6BLheMrJfk7aIAfjc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+8+0QFAwAAAAAACgkQsN6d1ii/Ey8s
bwf/doDjtbwRUn9zNVna/5VgJuamyS6g48ysWIlFtwPPUW5Abg37EBSQFWzi5uGwval6MaART/85
C/T3YK4zmeJc+vHnACVW/rSF1OLeqMw38vKe7tAO9bJR77g2DNsqAfd6u/68/vflmm9/w6AnDemh
PZ/s4CVLUvYh7r5f+ug76yT1ZK6ilLQUF62llqZm+fF+NfDERgZqBsJAsC5olmWvu14ubZYbC99I
78ny8yxGU8KsGhL9oWim83rLdghhuXyyjmk0OqCN3zoZtJNcolDfpc0bWdmDjLUI9cN4AEmcbfv7
vXbCAN16RMia0D4s452+nGNJbJi/YhFwh6fbGiAFXg==
=SSAr
-----END PGP SIGNATURE-----

--dncJQbPPS14y6VWt6BLheMrJfk7aIAfjc--

