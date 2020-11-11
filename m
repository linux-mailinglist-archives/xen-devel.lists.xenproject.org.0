Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E14F82AF44D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25015.52564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrcK-0006Q6-Cg; Wed, 11 Nov 2020 15:01:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25015.52564; Wed, 11 Nov 2020 15:01:00 +0000
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
	id 1kcrcK-0006Ph-9b; Wed, 11 Nov 2020 15:01:00 +0000
Received: by outflank-mailman (input) for mailman id 25015;
 Wed, 11 Nov 2020 15:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcrcI-0006Pa-KC
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:00:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ed46d09-9bff-4607-a13b-508f8f990254;
 Wed, 11 Nov 2020 15:00:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B7985AC82;
 Wed, 11 Nov 2020 15:00:56 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcrcI-0006Pa-KC
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:00:58 +0000
X-Inumbo-ID: 2ed46d09-9bff-4607-a13b-508f8f990254
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 2ed46d09-9bff-4607-a13b-508f8f990254;
	Wed, 11 Nov 2020 15:00:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605106856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OF669ofiJecTVgQi3KBql6TEQF3bqXpo9qIem+avUXw=;
	b=Q1ZaoTtqxvSNnBNlcwTL3+tJqdlQNxs4fxc+3mwV2ZNsV7RhmaaT85yjTAs2cPqQxQJ8G5
	Zd867kqkYajXvBc7uuoQkX0rcmRG2MevuBVWlSyBxDcV+h0bX7Tb4ArgZLgMJRg+0586uH
	ST+ySef/WDN0ZuqVu6a8JQuWgrYgXaE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B7985AC82;
	Wed, 11 Nov 2020 15:00:56 +0000 (UTC)
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
To: Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-11-jgross@suse.com>
 <c5b12f33b4e3feb0d6f6bc51d5474b36fa42d881.camel@suse.com>
 <6b2cf5d0-9c6d-07bd-51d3-9fd34cd8d1a5@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <9aba12c7-f8ec-7670-2661-f82b05adf649@suse.com>
Date: Wed, 11 Nov 2020 16:00:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <6b2cf5d0-9c6d-07bd-51d3-9fd34cd8d1a5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="UFfRQk51QwmHYfK2ztisLzaFZePB3Kwdu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--UFfRQk51QwmHYfK2ztisLzaFZePB3Kwdu
Content-Type: multipart/mixed; boundary="30TUk66TA6sHbf3dfEr1pQcOfMLqQbsZ6";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <9aba12c7-f8ec-7670-2661-f82b05adf649@suse.com>
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-11-jgross@suse.com>
 <c5b12f33b4e3feb0d6f6bc51d5474b36fa42d881.camel@suse.com>
 <6b2cf5d0-9c6d-07bd-51d3-9fd34cd8d1a5@suse.com>
In-Reply-To: <6b2cf5d0-9c6d-07bd-51d3-9fd34cd8d1a5@suse.com>

--30TUk66TA6sHbf3dfEr1pQcOfMLqQbsZ6
Content-Type: multipart/mixed;
 boundary="------------03BBD9441982CAFB9FB35B1D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------03BBD9441982CAFB9FB35B1D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.11.20 15:56, Jan Beulich wrote:
> On 11.11.2020 15:51, Dario Faggioli wrote:
>> On Mon, 2020-10-26 at 10:13 +0100, Juergen Gross wrote:
>>> Add /cpupool/<cpupool-id> directories to hypfs. Those are completely
>>> dynamic, so the related hypfs access functions need to be
>>> implemented.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>
>> So, I'm almost sold... Just one comment:
>>
>>> --- a/xen/common/sched/cpupool.c
>>> +++ b/xen/common/sched/cpupool.c
>>> @@ -999,6 +1073,10 @@ static int __init cpupool_init(void)
>>>  =20
>>>  =C2=A0=C2=A0=C2=A0=C2=A0 cpupool_gran_init();
>>>  =20
>>> +#ifdef CONFIG_HYPFS
>>> +=C2=A0=C2=A0=C2=A0 hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
>>> +#endif
>>> +
>> What would you think about doing this in an helper function
>> (hypfs_cpupool_init() ?), implemented inside the above #ifdef and as a=
n
>> empty stub if !CONFIG_HYPFS ?
>>
>> That will save us from having the #ifdef-s again here.
>=20
> Having a hypfs_add_dir() stub would also allow to achieve this, and
> then, going forward, perhaps also elsewhere.

I thought about that. This would require to be macro for the stub case,
but I don't think this is a major problem.

Currently there are no other places requiring a stub, but in future this
might change.


Juergen

--------------03BBD9441982CAFB9FB35B1D
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

--------------03BBD9441982CAFB9FB35B1D--

--30TUk66TA6sHbf3dfEr1pQcOfMLqQbsZ6--

--UFfRQk51QwmHYfK2ztisLzaFZePB3Kwdu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+r/KgFAwAAAAAACgkQsN6d1ii/Ey8X
yAgAmFY4vaqgfiRdstt+cTjhjcnl1omNrcAkLJs/KP5walDsGG8gLND5turAu2Cf7JEg2mHLifW5
PYO3FbOnSd9HUi6OSt/FEajEySf/8wu7B4oBtZm4oiiE8slo9VT7RWu3eyoZhTo4GHnaf4Ia38xc
SVGqO4w53x6cxzGm/oS65wn+/fffNikIPGUrSZSg0LlhYW58u13qMGsuTdm0lug6lHP6CkmAtBw7
ilSq3ZmdjLQgQ9bqXQl/ChdOTC8tmblV/wkeImXXMmYGol4hnD0xTfvQp7FTR2rIJ+WgoQwl/j4U
Ma0I7m12EFnphQADXOT0uk+IscrpiU61evH6ItRwFQ==
=q4jW
-----END PGP SIGNATURE-----

--UFfRQk51QwmHYfK2ztisLzaFZePB3Kwdu--

