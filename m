Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AFF30D80C
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 12:02:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80877.148263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7FuB-0007VY-0o; Wed, 03 Feb 2021 11:01:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80877.148263; Wed, 03 Feb 2021 11:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7FuA-0007VC-U7; Wed, 03 Feb 2021 11:01:02 +0000
Received: by outflank-mailman (input) for mailman id 80877;
 Wed, 03 Feb 2021 11:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUjn=HF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1l7Fu9-0007V7-6f
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 11:01:01 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 71be47ef-49ca-4e16-b71b-4bc84dedfc28;
 Wed, 03 Feb 2021 11:01:00 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A247AF78;
 Wed,  3 Feb 2021 11:00:59 +0000 (UTC)
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
X-Inumbo-ID: 71be47ef-49ca-4e16-b71b-4bc84dedfc28
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612350059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=q3KE9TfPPTGcvsD79BQ0xkUg5qvgl+n+GeEjBrtJUTQ=;
	b=ldc7uadkWkVhpHyEOxvGwOxb7RHboVcDmqoQYhWqS44mzA45woaJRIssi4zeuxMj1rPzV8
	W6i2hfSx9O3GvRdgI+zG9tVg4pHJeUla8qM8LEj6TB3yfZudeRAIqRckd2EWWMTy7Z5zWw
	HjQ75RF+CZhB2XzHyeh6vmZR/Xx/Aps=
To: Julien Grall <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
 <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
 <4760cbac-b006-78bc-b064-3265384f6707@xen.org>
 <311bb201bcacfd356f0c0b67856754eceae39e37.camel@suse.com>
 <7f2ec84a-9814-ffb1-0940-e936a80afbbb@xen.org>
 <501664dbdb736eaa4d9c05255dedfd7ad3e694fa.camel@suse.com>
 <1ab7ad80-c027-ffdd-8188-e1ab1fd53335@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: Re: Null scheduler and vwfi native problem
Message-ID: <5ad8befd-75a1-4995-e0bb-e1a438f7556d@suse.com>
Date: Wed, 3 Feb 2021 12:00:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1ab7ad80-c027-ffdd-8188-e1ab1fd53335@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1lnwlIH2lKrIgSY5B9gyffH7R1kVJtffb"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1lnwlIH2lKrIgSY5B9gyffH7R1kVJtffb
Content-Type: multipart/mixed; boundary="ZTGhjvmEWTexT4YQaGjqlqe0yhO9njnuy";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Dario Faggioli <dfaggioli@suse.com>,
 =?UTF-8?Q?Anders_T=c3=b6rnqvist?= <anders.tornqvist@codiax.se>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5ad8befd-75a1-4995-e0bb-e1a438f7556d@suse.com>
Subject: Re: Null scheduler and vwfi native problem
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
 <744ddde6-a228-82fc-76b9-401926d7963b@xen.org>
 <d92c4191fb81e6d1de636f281c8624d68f8d14fc.camel@suse.com>
 <c9a4e132-5bca-aa76-ab8b-bfeee1cd5a9e@codiax.se>
 <f52baf12308d71b96d0d9be1c7c382a3c5efafbc.camel@suse.com>
 <18ef4619-19ae-90d2-459c-9b5282b49176@codiax.se>
 <a9d80e262760f6692f7086c9b6a0622caf19e795.camel@suse.com>
 <4760cbac-b006-78bc-b064-3265384f6707@xen.org>
 <311bb201bcacfd356f0c0b67856754eceae39e37.camel@suse.com>
 <7f2ec84a-9814-ffb1-0940-e936a80afbbb@xen.org>
 <501664dbdb736eaa4d9c05255dedfd7ad3e694fa.camel@suse.com>
 <1ab7ad80-c027-ffdd-8188-e1ab1fd53335@xen.org>
In-Reply-To: <1ab7ad80-c027-ffdd-8188-e1ab1fd53335@xen.org>

--ZTGhjvmEWTexT4YQaGjqlqe0yhO9njnuy
Content-Type: multipart/mixed;
 boundary="------------18CF0D851AD2BAB757E8F521"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------18CF0D851AD2BAB757E8F521
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 03.02.21 10:19, Julien Grall wrote:
> Hi,
>=20
> On 03/02/2021 07:31, Dario Faggioli wrote:
>> On Tue, 2021-02-02 at 15:23 +0000, Julien Grall wrote:
>>> In reality, it is probably still too early as a pCPU can be
>>> considered
>>> quiesced until a call to rcu_lock*() (such rcu_lock_domain()).
>>>
>> Well, yes, in theory, we could track down which is the first RCU read
>> side crit. section on this path, and put the call right before that (i=
f
>> I understood what you mean).
>=20
> Oh, that's not what I meant. This will indeed be far more complex than =
I=20
> originally had in mind.
>=20
> AFAIU, the RCU uses critical section to protect data. So the "entering"=
=20
> could be used as "the pCPU is not quiesced" and "exiting" could be used=
=20
> as "the pCPU is quiesced".
>=20
> The concern with my approach is we would need to make sure that Xen=20
> correctly uses the rcu helpers. I know Juergen worked on that recently,=
=20
> but I don't know whether this is fully complete.

I think it is complete, but I can't be sure, of course.

One bit missing (for catching some wrong uses of the helpers) is this
patch:

https://lists.xen.org/archives/html/xen-devel/2020-03/msg01759.html

I don't remember why it hasn't been taken, but I think there was a
specific reason for that.


Juergen

--------------18CF0D851AD2BAB757E8F521
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

--------------18CF0D851AD2BAB757E8F521--

--ZTGhjvmEWTexT4YQaGjqlqe0yhO9njnuy--

--1lnwlIH2lKrIgSY5B9gyffH7R1kVJtffb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmAagmoFAwAAAAAACgkQsN6d1ii/Ey9X
4wf/eCxrr0wGKXjVMonA9VTFqHDs7Ti2BxLJ5J2qCU/p++7HTzA+piAysw/MfZ3kS91+HYdZWssA
2/ZQhIi1NE6ZDAiShlKumvX9tiugo/MaYYpsbnGHYPmOXDjwfvcaTehk/2getv2BRUvy0KYkC/lV
6nqVpdpJcD77DIvjSAcqkLEUXLnhaosLZCVCRMpTmSfFB/no7kuDyvzF67z2vWXX8vANfX2UocTc
syuD7n87gox8dCcOjHfVOri+xc3pVAKkIe2NmqDbeMBCn3hBnVuMA+JToYQl3qMSFaXAEZ1KPNj1
jwuqQw1POQIoU5W8f3BRGGSho88jlt+BSOfGSnTb0A==
=HBIH
-----END PGP SIGNATURE-----

--1lnwlIH2lKrIgSY5B9gyffH7R1kVJtffb--

