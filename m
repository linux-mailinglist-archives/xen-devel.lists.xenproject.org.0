Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5102B03D5
	for <lists+xen-devel@lfdr.de>; Thu, 12 Nov 2020 12:27:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25702.53640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kdAkt-0001gT-Tp; Thu, 12 Nov 2020 11:27:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25702.53640; Thu, 12 Nov 2020 11:27:07 +0000
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
	id 1kdAkt-0001g4-QP; Thu, 12 Nov 2020 11:27:07 +0000
Received: by outflank-mailman (input) for mailman id 25702;
 Thu, 12 Nov 2020 11:27:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kdAks-0001fz-EZ
 for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:27:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cca748ae-3dfb-4d3f-b7cb-67c4ad1a6f81;
 Thu, 12 Nov 2020 11:27:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A720FAEAA;
 Thu, 12 Nov 2020 11:27:04 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=bXVH=ES=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kdAks-0001fz-EZ
	for xen-devel@lists.xenproject.org; Thu, 12 Nov 2020 11:27:06 +0000
X-Inumbo-ID: cca748ae-3dfb-4d3f-b7cb-67c4ad1a6f81
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cca748ae-3dfb-4d3f-b7cb-67c4ad1a6f81;
	Thu, 12 Nov 2020 11:27:05 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605180424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I4oUzltFxwA59RzdgNlxU5/IpLu8/XoDGRR8AhR94Yc=;
	b=kkJcAwysLIbGVYoMQpmoIekw6Cg4EtEBWcTSBn/N+QYemem7Z9K0jeQZtE7zQk9QSHH1v7
	4lw78I0/6uhm6wPGB6tCC4wqKTjzrEawluBwCD8MP75iStIeztmVDPivfhPEys1J/5eLxY
	+nRTvSZD07570GUohU68aOlM2YivhVM=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A720FAEAA;
	Thu, 12 Nov 2020 11:27:04 +0000 (UTC)
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
 <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
 <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
 <b84d687e-0aab-d48f-c068-1852cc1075b2@suse.com>
 <6229914c-bc76-2670-a272-ab0603f612cc@suse.com>
 <2fe880fb-43d6-8479-278f-a2a38c5b3a9f@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
Message-ID: <f52adcb9-cff7-3bf9-ab98-881e471b0c9a@suse.com>
Date: Thu, 12 Nov 2020 12:27:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <2fe880fb-43d6-8479-278f-a2a38c5b3a9f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tQ1oNRwa0wLCtycf8pkR1Vp9PBclxpKc4"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tQ1oNRwa0wLCtycf8pkR1Vp9PBclxpKc4
Content-Type: multipart/mixed; boundary="Ocmh6EFEaXOMpHEONC1BSinVfnL5gXfYk";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <f52adcb9-cff7-3bf9-ab98-881e471b0c9a@suse.com>
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
 <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
 <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
 <b84d687e-0aab-d48f-c068-1852cc1075b2@suse.com>
 <6229914c-bc76-2670-a272-ab0603f612cc@suse.com>
 <2fe880fb-43d6-8479-278f-a2a38c5b3a9f@suse.com>
In-Reply-To: <2fe880fb-43d6-8479-278f-a2a38c5b3a9f@suse.com>

--Ocmh6EFEaXOMpHEONC1BSinVfnL5gXfYk
Content-Type: multipart/mixed;
 boundary="------------6F881C63212A999AAC6AE94D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------6F881C63212A999AAC6AE94D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.11.20 12:05, Jan Beulich wrote:
> On 12.11.2020 11:48, J=C3=BCrgen Gro=C3=9F wrote:
>> On 12.11.20 11:23, Jan Beulich wrote:
>>> On 11.11.2020 16:48, J=C3=BCrgen Gro=C3=9F wrote:
>>>> On 11.11.20 16:45, Jan Beulich wrote:
>>>>> On 09.11.2020 10:50, Juergen Gross wrote:
>>>>>>     static int nmi_callback(const struct cpu_user_regs *regs, int =
cpu)
>>>>>>     {
>>>>>>     	int xen_mode, ovf;
>>>>>>    =20
>>>>>>     	ovf =3D model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
>>>>>>     	xen_mode =3D ring_0(regs);
>>>
>>> Unrelated to the patch here (i.e. just as an observation), this
>>> use of ring_0() looks bogus when the NMI occurred in HVM guest
>>> mode.
>>
>> An NMI in an HVM guest due to oprofile would be a VMEXIT with NMI
>> reason, or just be handled completely inside the guest, right?
>=20
> Yes, and in the former case for VMX it would be handed on to do_nmi(),
> with the guest register state. For SVM it would get handled on the
> next STGI, i.e. would indeed never surface from HVM guest mode.
>=20
>> I don't see how this test should ever result in xen_mode being
>> false for an HVM guest.
>=20
> I think, because of hvm_invalidate_regs_fields(), on VMX it would be
> consistently true in release builds and consistently false in debug
> ones.

Ah, okay. I searched for do_nmi(), but the vmx code uses the exception
table instead.

So I guess this should be:

xen_mode =3D !guest_mode(regs);


Juergen

--------------6F881C63212A999AAC6AE94D
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

--------------6F881C63212A999AAC6AE94D--

--Ocmh6EFEaXOMpHEONC1BSinVfnL5gXfYk--

--tQ1oNRwa0wLCtycf8pkR1Vp9PBclxpKc4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+tHAgFAwAAAAAACgkQsN6d1ii/Ey+l
vAf+Ig7bxkSR60vkr3912wRiUqNEaRasmhtPbPhn1+63BYVlve2PGJ3smvNM8UanKkDxW914HNVh
Yrohw6xrzGm6ndBxYL4om0yprG5GJMf0lP4OhwYUJEUzTa6BKRJYG8a8c7coHkFaM/vG81Z5URz8
r6/WnCwL3yuFe6PP8CVaEw7AgY97cawUqvnULeBXmE0MbkC/4ptwxqXTzOrZRWtlEWWXcfL888FU
oZaRK6rcLZMnqfQWvgeKLKT2pLlw3YXjw7bY1W0fUAeCvz0E6PObhl2jIFPNuIjkyA7ehyxuef3H
DZjiAQAbiUDSoZjGl3p0lpy9+olOfjh8x6PljhlbOw==
=I+XE
-----END PGP SIGNATURE-----

--tQ1oNRwa0wLCtycf8pkR1Vp9PBclxpKc4--

