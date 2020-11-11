Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CC72AF53C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:42:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25088.52673 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcsG0-0002jX-0V; Wed, 11 Nov 2020 15:42:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25088.52673; Wed, 11 Nov 2020 15:41:59 +0000
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
	id 1kcsFz-0002j6-RY; Wed, 11 Nov 2020 15:41:59 +0000
Received: by outflank-mailman (input) for mailman id 25088;
 Wed, 11 Nov 2020 15:41:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcsFy-0002ia-37
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:41:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id df4fbc96-11cd-45ee-ba55-dd01125eceb2;
 Wed, 11 Nov 2020 15:41:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E81ECAD2D;
 Wed, 11 Nov 2020 15:41:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcsFy-0002ia-37
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:41:58 +0000
X-Inumbo-ID: df4fbc96-11cd-45ee-ba55-dd01125eceb2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id df4fbc96-11cd-45ee-ba55-dd01125eceb2;
	Wed, 11 Nov 2020 15:41:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605109316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WTdcv23mN42Sf8leYa9YjTx+k3M5XiMjv661+oaQwrQ=;
	b=I5vPuXuNxmHc4k9wdfKRiFjcHlAaydUl17z5VCb4Vrkz6Tl08jW4u3MKDGh9GvFV+Xji5Z
	W38Ky8xvRPw9LcFeLKaYKOimb3hMXHc75Xt/K1VXga2Zp5duj9Q17QzN5Q0DEsXKY8m24V
	jAH1APGzTAVSQXUibJjYQKGg3Zs9Y2Q=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E81ECAD2D;
	Wed, 11 Nov 2020 15:41:55 +0000 (UTC)
Subject: Re: [PATCH v4 1/3] xen/x86: add nmi continuation framework
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-2-jgross@suse.com>
 <13e71151-e395-4da9-ce1e-60f02247c6b7@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <f943ab23-6194-edbb-591d-8e9912f2c77c@suse.com>
Date: Wed, 11 Nov 2020 16:41:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <13e71151-e395-4da9-ce1e-60f02247c6b7@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QV5hD0Of1wLymUj9aQGJxeFqwbYkFQnAd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QV5hD0Of1wLymUj9aQGJxeFqwbYkFQnAd
Content-Type: multipart/mixed; boundary="IVj8jKFGIUUAl3xT8xtBm1IxmH5Y44CQ1";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <f943ab23-6194-edbb-591d-8e9912f2c77c@suse.com>
Subject: Re: [PATCH v4 1/3] xen/x86: add nmi continuation framework
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-2-jgross@suse.com>
 <13e71151-e395-4da9-ce1e-60f02247c6b7@suse.com>
In-Reply-To: <13e71151-e395-4da9-ce1e-60f02247c6b7@suse.com>

--IVj8jKFGIUUAl3xT8xtBm1IxmH5Y44CQ1
Content-Type: multipart/mixed;
 boundary="------------214B6131AA4A084F972617E0"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------214B6131AA4A084F972617E0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.11.20 16:37, Jan Beulich wrote:
> On 09.11.2020 10:50, Juergen Gross wrote:
>> Actions in NMI context are rather limited as e.g. locking is rather
>> fragile.
>>
>> Add a framework to continue processing in normal interrupt context
>> after leaving NMI processing.
>>
>> This is done by a high priority interrupt vector triggered via a
>> self IPI from NMI context, which will then call the continuation
>> function specified during NMI handling.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one further adjustment request:
>=20
>> @@ -1799,6 +1800,24 @@ void unset_nmi_callback(void)
>>       nmi_callback =3D dummy_nmi_callback;
>>   }
>>  =20
>> +bool nmi_check_continuation(void)
>> +{
>> +    bool ret =3D false;
>> +
>> +    return ret;
>> +}
>> +
>> +void trigger_nmi_continuation(void)
>> +{
>> +    /*
>> +     * Issue a self-IPI. Handling is done in spurious_interrupt().
>> +     * NMI could have happened in IPI sequence, so wait for ICR being=
 idle
>> +     * again before leaving NMI handler.
>> +     */
>> +    send_IPI_self(SPURIOUS_APIC_VECTOR);
>> +    apic_wait_icr_idle();
>> +}
>=20
> This additionally relies on send_IPI_self_legacy() calling
> send_IPI_shortcut(), rather than e.g. resolving the local CPU
> number to a destination ID. I think this wants saying maybe
> here, but more importantly in that function.

Okay.


Juergen


--------------214B6131AA4A084F972617E0
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

--------------214B6131AA4A084F972617E0--

--IVj8jKFGIUUAl3xT8xtBm1IxmH5Y44CQ1--

--QV5hD0Of1wLymUj9aQGJxeFqwbYkFQnAd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+sBkMFAwAAAAAACgkQsN6d1ii/Ey8R
KAf+MBlHqLO/qrWVySBdnpxhslkG5Hx4X6E+QhBPjXkDnzkbv012fvD0fNu1LU5PIZldFekSd/PU
Vks1RP5bkdgCwsJDMCk77I1IGOEZd+Bd40vOuj0YxqSfNb0VMvdfT+hWAw/lF20XJ1u8FjFQkpP1
GfuQngMy+PxV+w9PoqMnpXHhkz2G6hs2OguRMxFYjy4RCBMn1AXrapUmQdMerbUpW/3OPyidsKQV
OzHbPeWAgfvbOkrp0apOu4M/B/y4pvZkyqM7fjyp10zWpTjvBNTKOpBrC1RGxNrHL9DNl6xZAwvl
14Iw3E5RwoCoRXm3tGtwVJZVhXunWFHHuiSX7+TyiA==
=vXXe
-----END PGP SIGNATURE-----

--QV5hD0Of1wLymUj9aQGJxeFqwbYkFQnAd--

