Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1426E2AF56D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:49:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25102.52697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcsMl-00036Y-22; Wed, 11 Nov 2020 15:48:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25102.52697; Wed, 11 Nov 2020 15:48:59 +0000
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
	id 1kcsMk-00036B-Us; Wed, 11 Nov 2020 15:48:58 +0000
Received: by outflank-mailman (input) for mailman id 25102;
 Wed, 11 Nov 2020 15:48:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcsMj-000365-0V
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:48:57 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 091058a1-ae73-46f4-b1d5-bd7e33d42aad;
 Wed, 11 Nov 2020 15:48:56 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1C0D3AC75;
 Wed, 11 Nov 2020 15:48:55 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcsMj-000365-0V
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:48:57 +0000
X-Inumbo-ID: 091058a1-ae73-46f4-b1d5-bd7e33d42aad
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 091058a1-ae73-46f4-b1d5-bd7e33d42aad;
	Wed, 11 Nov 2020 15:48:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605109735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jz5MMH+/kNLXTkt7JMK/JwIUuoIbxXH/8fWLmC0GjLc=;
	b=cvFGggEw//hx0ac+SNz5leTJBv3tzfAVujKVMc04LFR6W4iktBS57ju7sVQgHLzxThVI35
	TrcZQ4nSySsWSBtPae/Q9gMdrmWA5PotH5gGv0rd+74zhZi+WvGXfqv0eEzfZAK7+ErMdL
	FLDNUir0pBYU6WsnssTxgtiHnhpAH0k=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1C0D3AC75;
	Wed, 11 Nov 2020 15:48:55 +0000 (UTC)
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
 <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
Date: Wed, 11 Nov 2020 16:48:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="E8OuMYTm4FgzkMITDBAncpbr4MXDYchTP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E8OuMYTm4FgzkMITDBAncpbr4MXDYchTP
Content-Type: multipart/mixed; boundary="GvgwHDRtHjTpUpUIg6PyYNzaUrqi9jFrc";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <288804e4-75e6-6600-9634-8c0ea7a06c22@suse.com>
Subject: Re: [PATCH v4 2/3] xen/oprofile: use NMI continuation for sending
 virq to guest
References: <20201109095021.9897-1-jgross@suse.com>
 <20201109095021.9897-3-jgross@suse.com>
 <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>
In-Reply-To: <d55adbc0-8a98-dd5c-c204-2ec11955c356@suse.com>

--GvgwHDRtHjTpUpUIg6PyYNzaUrqi9jFrc
Content-Type: multipart/mixed;
 boundary="------------1E54A406AECAA0E3A49B8A0D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1E54A406AECAA0E3A49B8A0D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.11.20 16:45, Jan Beulich wrote:
> On 09.11.2020 10:50, Juergen Gross wrote:
>> @@ -83,14 +85,28 @@ void passive_domain_destroy(struct vcpu *v)
>>   		model->free_msr(v);
>>   }
>>  =20
>> +bool nmi_oprofile_send_virq(void)
>> +{
>> +	struct vcpu *v =3D this_cpu(nmi_cont_vcpu);
>> +
>> +	if ( v )
>> +		send_guest_vcpu_virq(v, VIRQ_XENOPROF);
>> +
>> +	this_cpu(nmi_cont_vcpu) =3D NULL;
>=20
> What if, by the time we make it here, a 2nd NMI has arrived? I
> agree the next overflow interrupt shouldn't arrive this
> quickly, but I also think you want to zap the per-CPU variable
> first here, and ...

How could that happen? This function is activated only from NMI
context in case the NMI happened in guest mode. And it will be
executed with higher priority than any guest, so there is a zero
chance another NMI in guest mode can happen in between.

I can add a comment in this regard if you want.

>=20
>> +
>> +	return v;
>> +}
>> +
>>   static int nmi_callback(const struct cpu_user_regs *regs, int cpu)
>>   {
>>   	int xen_mode, ovf;
>>  =20
>>   	ovf =3D model->check_ctrs(cpu, &cpu_msrs[cpu], regs);
>>   	xen_mode =3D ring_0(regs);
>> -	if ( ovf && is_active(current->domain) && !xen_mode )
>> -		send_guest_vcpu_virq(current, VIRQ_XENOPROF);
>> +	if ( ovf && is_active(current->domain) && !xen_mode ) {
>> +		this_cpu(nmi_cont_vcpu) =3D current;
>=20
> ... avoid overwriting any non-NULL value here. That's then of
> course still not closing the window, but has (imo) overall
> better behavior.
>=20
> Also, style-wise, going through the file it looks to be mainly
> Linux style, so may I suggest your additions / changes to be
> done that way, rather than extending use of this funny mixed
> style?

Works for me.


Juergen

--------------1E54A406AECAA0E3A49B8A0D
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

--------------1E54A406AECAA0E3A49B8A0D--

--GvgwHDRtHjTpUpUIg6PyYNzaUrqi9jFrc--

--E8OuMYTm4FgzkMITDBAncpbr4MXDYchTP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+sB+YFAwAAAAAACgkQsN6d1ii/Ey/J
BQf/Vrk8vFJq2wLu3DntrmxqTtJLT9PILw3e2pz3Ms63vtkURlHQJ9vTRdCcdY5GM6sxWnpcGOsF
Dcqisej3TJMp9/eKzpXAd3gIIm56mwXKNzm44yVeH+iGQomZhxYw5edRHdYXDIu19fPR288UA3t7
Sr+fJoTw6uErJjU/Fmn6aVO4euLHziJ2jWfHCnRBYWvgkNC+WslhDvVvApn/W59BR6JwRoTTzh4D
qOUGmIXoqArXrwR1iq01D/e6oKVc5gRF+w/FcZNCTVrbYEE3cPul2vEfhs/LJhRGzYaXJAaCELPQ
l9+fix/ct2zIwgbBU1lBjJsNEY5e9jdsJDGJbWCkuw==
=8qug
-----END PGP SIGNATURE-----

--E8OuMYTm4FgzkMITDBAncpbr4MXDYchTP--

