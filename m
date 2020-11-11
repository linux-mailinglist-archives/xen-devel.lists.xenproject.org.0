Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9692AEA24
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 08:27:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24267.51417 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kckXT-00043y-WD; Wed, 11 Nov 2020 07:27:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24267.51417; Wed, 11 Nov 2020 07:27:31 +0000
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
	id 1kckXT-00043Z-Sx; Wed, 11 Nov 2020 07:27:31 +0000
Received: by outflank-mailman (input) for mailman id 24267;
 Wed, 11 Nov 2020 07:27:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kckXS-000431-9Z
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 07:27:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71df10ff-c2b0-4345-a46b-2560ca1c2ac4;
 Wed, 11 Nov 2020 07:27:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B774DABD6;
 Wed, 11 Nov 2020 07:27:25 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kckXS-000431-9Z
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 07:27:30 +0000
X-Inumbo-ID: 71df10ff-c2b0-4345-a46b-2560ca1c2ac4
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 71df10ff-c2b0-4345-a46b-2560ca1c2ac4;
	Wed, 11 Nov 2020 07:27:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605079645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cPFJXwJv1wkhJGQLQYh0ic4x7lI8xpLasYkn9Cp0j7o=;
	b=WvjaUVirCfVLEW1A4BkTpSuiqeTz/E6Fwwro+KgPsnD3zCg3dR10iVYihfEAnM+2haXg3l
	bhOS7s9vZpYfG5ybYmL+PYcMfot/DYLbQ7EdS5uMMCbcpcMMA3TBjZNDPpg+bc1JGEEKtx
	e61jkdL7Uu1o/7M+mTEwoUtHMC+hTME=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B774DABD6;
	Wed, 11 Nov 2020 07:27:25 +0000 (UTC)
Subject: Re: [PATCH] xen/events: fix build
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201111054946.3229-1-jgross@suse.com>
 <8feafd17-851f-9bb2-0fe0-2d6f8bed4d4c@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <dbd01178-d925-b01c-8624-377a00270a22@suse.com>
Date: Wed, 11 Nov 2020 08:27:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <8feafd17-851f-9bb2-0fe0-2d6f8bed4d4c@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fzT1OxlTufCMm9OaemJpr6ybTbbdOMJlC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fzT1OxlTufCMm9OaemJpr6ybTbbdOMJlC
Content-Type: multipart/mixed; boundary="KcXin2GkqMtv87soc2AYB1RRwuuzgPlKX";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <dbd01178-d925-b01c-8624-377a00270a22@suse.com>
Subject: Re: [PATCH] xen/events: fix build
References: <20201111054946.3229-1-jgross@suse.com>
 <8feafd17-851f-9bb2-0fe0-2d6f8bed4d4c@suse.com>
In-Reply-To: <8feafd17-851f-9bb2-0fe0-2d6f8bed4d4c@suse.com>

--KcXin2GkqMtv87soc2AYB1RRwuuzgPlKX
Content-Type: multipart/mixed;
 boundary="------------635302E3A5732C3E0E88207E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------635302E3A5732C3E0E88207E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.11.20 08:20, Jan Beulich wrote:
> On 11.11.2020 06:49, Juergen Gross wrote:
>> --- a/xen/common/event_channel.c
>> +++ b/xen/common/event_channel.c
>> @@ -61,7 +61,9 @@ static inline void evtchn_write_lock(struct evtchn *=
evtchn)
>>   {
>>       write_lock(&evtchn->lock);
>>  =20
>> +#ifndef NDEBUG
>>       evtchn->old_state =3D evtchn->state;
>> +#endif
>>   }
>>  =20
>>   static inline void evtchn_write_unlock(struct evtchn *evtchn)
>> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
>> index 7251b3ae3e..95f96e7a33 100644
>> --- a/xen/include/xen/sched.h
>> +++ b/xen/include/xen/sched.h
>> @@ -114,9 +114,7 @@ struct evtchn
>>           u16 virq;      /* state =3D=3D ECS_VIRQ */
>>       } u;
>>       u8 priority;
>> -#ifndef NDEBUG
>>       u8 old_state;      /* State when taking lock in write mode. */
>> -#endif
>>       u8 last_priority;
>>       u16 last_vcpu_id;
>>   #ifdef CONFIG_XSM
>=20
> Did you mean just either of the two changes (and then the former),
> not both? If so
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> and I'll be happy to drop the other half for committing.

The header fix is required for NDEBUG builds, while the other one is
removing a write with no accompanied read for NDEBUG builds.


Juergen


--------------635302E3A5732C3E0E88207E
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

--------------635302E3A5732C3E0E88207E--

--KcXin2GkqMtv87soc2AYB1RRwuuzgPlKX--

--fzT1OxlTufCMm9OaemJpr6ybTbbdOMJlC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+rklwFAwAAAAAACgkQsN6d1ii/Ey9e
8QgAgt3b+lL5jeqVJooeeBqI3s8t7hl2KtOGkuwGE/DFzAjWEXsFkKkCpyy4+Z7YoDqkfnlTG++8
QHTUgSIX7naEh8tjD+8AEgJsQ9hV/lt+fZ++6Yatj1GJd6ezKPapkww74m7kqqueFFaP2v7XyB4N
fOkiynFgRtEqWpDWHefYMqL/ONXOsRZugpNAZ/hz9E+Vlm0OkpvX5T4+Zd5tfaeBVuvQiLLQnJ5Z
lrkH4Z9PL6UFhx+Ko/VuzwWOO/e024lpy37migHgQ98bRGerFKsqklOUVZIs8GOi0zru4kX8njrG
tn9aDThS8Kwvhiudtfi2Q+9rEA25VmmusnMvMnj6iA==
=Gqn0
-----END PGP SIGNATURE-----

--fzT1OxlTufCMm9OaemJpr6ybTbbdOMJlC--

