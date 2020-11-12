Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3332B082C
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 16:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25935.54014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdEG5-00023y-3S; Thu, 12 Nov 2020 15:11:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25935.54014; Thu, 12 Nov 2020 15:11:33 +0000
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
	id 1kdEG5-00023a-0H; Thu, 12 Nov 2020 15:11:33 +0000
Received: by outflank-mailman (input) for mailman id 25935;
 Thu, 12 Nov 2020 15:11:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdEG3-00023U-SH
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 15:11:31 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0298710d-4138-426b-bbb3-861713acca17;
 Thu, 12 Nov 2020 15:11:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 76CACAC1D;
 Thu, 12 Nov 2020 15:11:29 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdEG3-00023U-SH
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 15:11:31 +0000
X-Inumbo-ID: 0298710d-4138-426b-bbb3-861713acca17
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 0298710d-4138-426b-bbb3-861713acca17;
	Thu, 12 Nov 2020 15:11:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605193889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SY/NvZFHWjYh/mlEL7MuIWnVdu8w505QXd0SXbviGv4=;
	b=fZ9J0C8ASk4PJ3n9BOVMcF7CsdP0Oo+8ubSoWN15wQ7PlN/iME1GAIIu9+OjOwUdooM83b
	zm0arOeUf2+E3tBlyhNAdIG731IYr4f76TsQE0t/M8OPgz8/qWaIHKMb4r1NpAvwG8juP6
	ESoFLGJxIIT3559iTPsqpwSqBiXjPO0=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 76CACAC1D;
	Thu, 12 Nov 2020 15:11:29 +0000 (UTC)
Subject: Re: [PATCH v5 1/3] xen/x86: add nmi continuation framework
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201112131424.9930-1-jgross@suse.com>
 <20201112131424.9930-2-jgross@suse.com>
 <f266e1fe-21fe-a44c-d8b1-94d89813f42f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <422e2e77-7e26-4c9d-f022-6ecb7e398751@suse.com>
Date: Thu, 12 Nov 2020 15:50:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <f266e1fe-21fe-a44c-d8b1-94d89813f42f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ujB3BsEXuhY6FML0g7KRsCfjgz1zOOhbP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ujB3BsEXuhY6FML0g7KRsCfjgz1zOOhbP
Content-Type: multipart/mixed; boundary="FzfkXjtPAnQ5GxO6GBZa2JRGuc5uoyGs8";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <422e2e77-7e26-4c9d-f022-6ecb7e398751@suse.com>
Subject: Re: [PATCH v5 1/3] xen/x86: add nmi continuation framework
References: <20201112131424.9930-1-jgross@suse.com>
 <20201112131424.9930-2-jgross@suse.com>
 <f266e1fe-21fe-a44c-d8b1-94d89813f42f@suse.com>
In-Reply-To: <f266e1fe-21fe-a44c-d8b1-94d89813f42f@suse.com>

--FzfkXjtPAnQ5GxO6GBZa2JRGuc5uoyGs8
Content-Type: multipart/mixed;
 boundary="------------73172AECA3C1F131FBAF8636"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------73172AECA3C1F131FBAF8636
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.11.20 14:41, Jan Beulich wrote:
> On 12.11.2020 14:14, Juergen Gross wrote:
>> --- a/xen/arch/x86/genapic/x2apic.c
>> +++ b/xen/arch/x86/genapic/x2apic.c
>> @@ -89,6 +89,7 @@ static unsigned int cpu_mask_to_apicid_x2apic_cluste=
r(const cpumask_t *cpumask)
>>  =20
>>   static void send_IPI_self_x2apic(uint8_t vector)
>>   {
>> +    /* NMI continuation handling relies on using a shorthand here. */=

>>       apic_wrmsr(APIC_SELF_IPI, vector);
>>   }
>=20
> I'm inclined to drop this hunk again - I did ask for ...
>=20
>> --- a/xen/arch/x86/smp.c
>> +++ b/xen/arch/x86/smp.c
>> @@ -163,6 +163,7 @@ void send_IPI_self(int vector)
>>  =20
>>   void send_IPI_self_legacy(uint8_t vector)
>>   {
>> +    /* NMI continuation handling relies on using a shorthand here. */=

>>       send_IPI_shortcut(APIC_DEST_SELF, vector, APIC_DEST_PHYSICAL);
>>   }
>=20
> ... this one only simply because x2APIC doesn't have the same restricti=
on.

It would still be bad if the x2APIC variant would e.g. use
send_IPI_mask_x2apic_cluster() due to its usage of
per_cpu(scratch_mask).

Juergen


--------------73172AECA3C1F131FBAF8636
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

--------------73172AECA3C1F131FBAF8636--

--FzfkXjtPAnQ5GxO6GBZa2JRGuc5uoyGs8--

--ujB3BsEXuhY6FML0g7KRsCfjgz1zOOhbP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+tS5wFAwAAAAAACgkQsN6d1ii/Ey/T
GAf/XnwbekTUmeZJ8Ou8ZT69o5eqOPT/QZx5EuFrtwoR06OjhUrVY02wKIhnJOLdnCKiIzEHoqeg
zIcAZIN2uTd6OZBMaEpM1ksBsCNbzKhEZDOjiZnzg1iLDYx58h9Hp3qOHO1p2CfbEqLZtV7SN8rs
Yg2J/M/RtWc8UL1XJbsNt/96wrKMtbLJPKwM+jbwdOc70H6hRidVBpLteERThhOXM1pRPADYZggw
pHG8hhJHdUP5fwfr708IjxObIMpHIycC++Dv2gZUoJhKU+w6I2juvXpKqfvhLH9xH2XeZWAcyI++
B/M1b4Dzc+8G/8eI/Lmay6mM/XILZpKqvzvcJBYl7g==
=Taom
-----END PGP SIGNATURE-----

--ujB3BsEXuhY6FML0g7KRsCfjgz1zOOhbP--

