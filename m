Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D95152AF3FF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:44:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24949.52454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrLs-0003aR-Sv; Wed, 11 Nov 2020 14:44:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24949.52454; Wed, 11 Nov 2020 14:44:00 +0000
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
	id 1kcrLs-0003a2-PI; Wed, 11 Nov 2020 14:44:00 +0000
Received: by outflank-mailman (input) for mailman id 24949;
 Wed, 11 Nov 2020 14:43:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcrLr-0003Zv-KJ
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:43:59 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7d2dc119-6099-4d60-8080-c29b450e4b7b;
 Wed, 11 Nov 2020 14:43:58 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DE7E3AD11;
 Wed, 11 Nov 2020 14:43:57 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GpG1=ER=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcrLr-0003Zv-KJ
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:43:59 +0000
X-Inumbo-ID: 7d2dc119-6099-4d60-8080-c29b450e4b7b
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 7d2dc119-6099-4d60-8080-c29b450e4b7b;
	Wed, 11 Nov 2020 14:43:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605105838;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s4DJLyWnN2lYtnW/1PMpH8EielXkomSTZEp/9XlNGlc=;
	b=W0BAY2VkfQoBcUclQ+gNWZOJ/hFKSev4rhL4PmjI/wwTZVutN1p7PPJKPe7fhC0uiPuNSj
	eqRQMzjaskO7QsaLQRiDFB1egJ0599wxhHV1zOZ5y3AB00JLrJeD96lXJLEUU/9Hm8tx1j
	AZqwCYWnilJHNF2RA40uU2iewaANu04=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DE7E3AD11;
	Wed, 11 Nov 2020 14:43:57 +0000 (UTC)
Subject: Re: [PATCH 01/12] xen/cpupool: add cpu to sched_res_mask when
 removing it from cpupool
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-2-jgross@suse.com>
 <34527bbdeef138454b6a555c236b2289643b3d6b.camel@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <acef7969-4f9c-bb29-257f-d191f9527b0b@suse.com>
Date: Wed, 11 Nov 2020 15:43:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <34527bbdeef138454b6a555c236b2289643b3d6b.camel@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2tcs4pEbRSfCc4d9blLruWyh9nTxCYOCV"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2tcs4pEbRSfCc4d9blLruWyh9nTxCYOCV
Content-Type: multipart/mixed; boundary="VPrrTkA5R0g4h7dTyGWaHAuzacgvP01IH";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@citrix.com>
Message-ID: <acef7969-4f9c-bb29-257f-d191f9527b0b@suse.com>
Subject: Re: [PATCH 01/12] xen/cpupool: add cpu to sched_res_mask when
 removing it from cpupool
References: <20201026091316.25680-1-jgross@suse.com>
 <20201026091316.25680-2-jgross@suse.com>
 <34527bbdeef138454b6a555c236b2289643b3d6b.camel@suse.com>
In-Reply-To: <34527bbdeef138454b6a555c236b2289643b3d6b.camel@suse.com>

--VPrrTkA5R0g4h7dTyGWaHAuzacgvP01IH
Content-Type: multipart/mixed;
 boundary="------------7C7BF1FBB8A15192A31BC6FC"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------7C7BF1FBB8A15192A31BC6FC
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.11.20 15:32, Dario Faggioli wrote:
> On Mon, 2020-10-26 at 10:13 +0100, Juergen Gross wrote:
>> When a cpu is removed from a cpupool and added to the free cpus it
>> should be added to sched_res_mask, too.
>>
>> The related removal from sched_res_mask in case of core scheduling
>> is already done in schedule_cpu_add().
>>
>> As long as all cpupools share the same scheduling granularity there
>> is nothing going wrong with the missing removal,
>>
> This patch is adding an addition of the CPU to sched_res_mask, which
> was missing... So isn't the above "there is nothing going wrong with
> the missing addition", or something like that?

Oh yes, of course.

Will fix that.

>=20
> Or, if it's an actual missing removal that we are referring to here,
> then it must be clarified which one.
>=20
>> but this will change
>> when per-cpupool granularity is fully supported.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
> With the above fixed or clarified:
>=20
> Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks,


Juergen

--------------7C7BF1FBB8A15192A31BC6FC
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

--------------7C7BF1FBB8A15192A31BC6FC--

--VPrrTkA5R0g4h7dTyGWaHAuzacgvP01IH--

--2tcs4pEbRSfCc4d9blLruWyh9nTxCYOCV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+r+K0FAwAAAAAACgkQsN6d1ii/Ey8e
ZAf/dIxjakESFjPctT0Os4twDxyAWBEBjQeOX6KJD3EGhLkBr6ogZKtRNzykDvU9RD960UB5bVKx
wUZsQjxXZb1P2gUHAyMRT3oBmkLIXbk2haMCBBd1BoyNSMt5TECdDxbKnKtD7XeBuKm9tIo6tpC4
LixLA6JroVdAhZAbSTr6a0ElCP1UXmanEC6iRCVBVFb/CFPpCzNajdaQfz3uUvopecCp+DpdArG5
FvAtt3tCc2t54o4QQxDeNOyDlqBJn6Ulo8u4aXKh4rzhOObUXsK+DClcNCfeQNJnUt/iKtROAeJ0
WvnsZIZBEbBbIXYthEnCCIGW4nZnwFb5Jutm1cwG2A==
=CwOM
-----END PGP SIGNATURE-----

--2tcs4pEbRSfCc4d9blLruWyh9nTxCYOCV--

