Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 712544345CF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 09:18:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213597.371872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5ry-0006Yy-3g; Wed, 20 Oct 2021 07:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213597.371872; Wed, 20 Oct 2021 07:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md5rx-0006X7-W1; Wed, 20 Oct 2021 07:18:37 +0000
Received: by outflank-mailman (input) for mailman id 213597;
 Wed, 20 Oct 2021 07:18:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jFZ1=PI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1md5rw-0006Wz-Sw
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 07:18:36 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6854f230-07e9-4a5e-a695-e96d56644841;
 Wed, 20 Oct 2021 07:18:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 53BF421A71;
 Wed, 20 Oct 2021 07:18:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5DD613F77;
 Wed, 20 Oct 2021 07:18:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5WYnMcrCb2F/QAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 20 Oct 2021 07:18:34 +0000
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
X-Inumbo-ID: 6854f230-07e9-4a5e-a695-e96d56644841
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634714315; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iAQRyXnHPCQuPOhNfqeQHZjQbKH9JXABicZP+6qsUWc=;
	b=LrlJSuvfBb2UdhyZl6hnXQbLwlG/OtZqJJ5PiAYX0x7ZNLlpNx9hXiNbRkJFYiZxjILHJQ
	CSCw02KJXtlqEM3rQAMAefq3QHLUThPxcwydmSTtVdaDloWoQUqd7k5/60BcEidyK3Cp3B
	iU9CMHG/S/sJTm/6LMM/5sTCHnCkfeU=
Subject: Re: [PATCH 06/12] xen: generate hypercall interface related code
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-7-jgross@suse.com>
 <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>
 <e547b584-54e6-3227-82a8-ff1301eddb21@suse.com>
 <c7f5e7eb-7558-4812-0a5b-d02683396704@suse.com>
 <52ccd0e5-249d-658d-aae1-c28ced7e1314@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <bc1c64ce-e8cd-4000-7e78-70c35f729ec2@suse.com>
Date: Wed, 20 Oct 2021 09:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <52ccd0e5-249d-658d-aae1-c28ced7e1314@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="loQb1UQImVkEjI6LXhGHypddmMt0g9KHu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--loQb1UQImVkEjI6LXhGHypddmMt0g9KHu
Content-Type: multipart/mixed; boundary="SOHCMkLWjRC6RGVo20pqshjjdh4jNwjUE";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <bc1c64ce-e8cd-4000-7e78-70c35f729ec2@suse.com>
Subject: Re: [PATCH 06/12] xen: generate hypercall interface related code
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-7-jgross@suse.com>
 <e5f55c9e-5615-7d10-c86c-db1a3c724f43@suse.com>
 <e547b584-54e6-3227-82a8-ff1301eddb21@suse.com>
 <c7f5e7eb-7558-4812-0a5b-d02683396704@suse.com>
 <52ccd0e5-249d-658d-aae1-c28ced7e1314@suse.com>
In-Reply-To: <52ccd0e5-249d-658d-aae1-c28ced7e1314@suse.com>

--SOHCMkLWjRC6RGVo20pqshjjdh4jNwjUE
Content-Type: multipart/mixed;
 boundary="------------4FB16F3F35E9C41DD1185983"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4FB16F3F35E9C41DD1185983
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.10.21 09:11, Jan Beulich wrote:
> On 20.10.2021 09:02, Juergen Gross wrote:
>> On 18.10.21 17:28, Juergen Gross wrote:
>>> On 18.10.21 14:58, Jan Beulich wrote:
>>>> On 15.10.2021 14:51, Juergen Gross wrote:
>>>>> --- a/.gitignore
>>>>> +++ b/.gitignore
>>>>> @@ -332,10 +332,12 @@ xen/include/asm-x86/asm-macros.h
>>>>>  =C2=A0 xen/include/compat/*
>>>>>  =C2=A0 xen/include/config/
>>>>>  =C2=A0 xen/include/generated/
>>>>> +xen/include//hypercall-defs.i
>>>>
>>>> Nit: Stray double slash (unless this has a meaning I'm unaware of).
>>>
>>> Oh, right. No special meaning AFAIK.
>>>
>>>> Yet then I wonder: Shouldn't *.i be among the patterns at the top of=

>>>> the file, like *.o is?
>>>
>>> Yes, I can do that. Probably via a separate patch then.
>>
>> I can't do that, as we have one source file in our git tree matching
>> this pattern: tools/libs/stat/bindings/swig/xenstat.i is used as an
>> input file for swig for generating perl and python bindings. And the
>> .i suffix seems to be the common one for swig input files.
>=20
> Ugly. Since we have a rule to produce *.i in xen/Rules.mk, I think we
> really should have these ignored. Perhaps a good enough reason to put
> *.i in xen/.gitignore? And while at it perhaps also *.s? Unless
> there's a way to specify a pattern for an entire subtree - it's not
> clear to me whether xen/*.i in ./.gitignore would cover subdirs of
> xen/ as well ...

xen/**/*.i will do that. From the gitignore syntax description:

   A slash followed by two consecutive asterisks then a slash matches
   zero or more directories. For example, "a/**/b" matches "a/b",
   "a/x/b", "a/x/y/b" and so on.

So I'll go with adding xen/**/*.i and xen/**/*.s to .gitignore.


Juergen

--------------4FB16F3F35E9C41DD1185983
Content-Type: application/pgp-keys;
 name="OpenPGP_0xB0DE9DD628BF132F.asc"
Content-Transfer-Encoding: quoted-printable
Content-Description: OpenPGP public key
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

--------------4FB16F3F35E9C41DD1185983--

--SOHCMkLWjRC6RGVo20pqshjjdh4jNwjUE--

--loQb1UQImVkEjI6LXhGHypddmMt0g9KHu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFvwsoFAwAAAAAACgkQsN6d1ii/Ey+i
iQf/Vi+dp/2Vhl+ph3UOZ16ecTAVsjHeByD8YUZ30DtXoqqdqdP6rxLL9qxXowMze56S7Hlg8OjH
9Vu3xNNmYEZce6vPvi6Aa2J+gBP6D+WBq4wtGfSZEhg27sv53HpjwdC0hPbIqDN0G59K0GcdXs5A
Afv5bG07VgY3S4+pGS8bBrNEC8bfDLCNbdmxdkA6AENyEFeKfihMhd1sdrxEgLIYe7ZiptaddCZe
dpqgWcpJopKnxOhLt+j3CJlXP0a/rUBvtzUSnWOTKEpAHeqABkGs8tGq2uIRNh6tVlkgMsiNUTg2
OmZ4UaqH/aApDrNDQVwygqeK7U7fVmkfjKqT/BNWGw==
=GzOu
-----END PGP SIGNATURE-----

--loQb1UQImVkEjI6LXhGHypddmMt0g9KHu--

