Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCFC47537C
	for <lists+xen-devel@lfdr.de>; Wed, 15 Dec 2021 08:04:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.247205.426232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxOJx-0000Wq-4u; Wed, 15 Dec 2021 07:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 247205.426232; Wed, 15 Dec 2021 07:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mxOJx-0000UC-1t; Wed, 15 Dec 2021 07:03:25 +0000
Received: by outflank-mailman (input) for mailman id 247205;
 Wed, 15 Dec 2021 07:03:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kH8z=RA=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mxOJv-0000U6-P8
 for xen-devel@lists.xenproject.org; Wed, 15 Dec 2021 07:03:23 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16114ba3-5d75-11ec-85d3-df6b77346a89;
 Wed, 15 Dec 2021 08:03:20 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2B30921129;
 Wed, 15 Dec 2021 07:03:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D56BA139CF;
 Wed, 15 Dec 2021 07:03:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id TqfRMjeTuWH7FAAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 15 Dec 2021 07:03:19 +0000
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
X-Inumbo-ID: 16114ba3-5d75-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639551800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I7tE/WmrRh0tbRmNof3iBkuV11rlx3fWL5o4e1WDJgs=;
	b=VC55i5QvB0u29JISehTJplAjl9n4hkjRPXJAaV+gy2C2A/ZyPeHOyvsiDmzcrhKYOIwLt0
	8jyt/mOVCz/2i8LgVL1qm3D8/VLp/lhMBdKQMx5v8flkkISGeVfM/s7ZriXojqfi/L803s
	Z1KnhNW7Lec5FImWJMyXAUPlIc6BErY=
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
Message-ID: <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
Date: Wed, 15 Dec 2021 08:03:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z0rgR56fMnYEIWcmJLqhGk2F8AM62QRz0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z0rgR56fMnYEIWcmJLqhGk2F8AM62QRz0
Content-Type: multipart/mixed; boundary="hvUyHbuLxdlKobNpd8FF7ecSSyGfHZhDG";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Christopher Clark <christopher.w.clark@gmail.com>
Message-ID: <4e9947b6-08b4-4ac6-9cfe-538c3b34175e@suse.com>
Subject: Re: [PATCH v3 02/13] xen: harmonize return types of hypercall
 handlers
References: <20211208155606.20029-1-jgross@suse.com>
 <20211208155606.20029-3-jgross@suse.com>
 <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>
In-Reply-To: <7dd419c1-9ad0-798e-317b-71c8e613ff3e@xen.org>

--hvUyHbuLxdlKobNpd8FF7ecSSyGfHZhDG
Content-Type: multipart/mixed;
 boundary="------------89277A122A0C5C84F18DC9C3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------89277A122A0C5C84F18DC9C3
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.12.21 18:36, Julien Grall wrote:
> Hi,
>=20
> On 08/12/2021 15:55, Juergen Gross wrote:
>> Today most hypercall handlers have a return type of long, while the
>> compat ones return an int. There are a few exceptions from that rule,
>> however.
>=20
> So on Arm64, I don't think you can make use of the full 64-bit because =
a=20
> 32-bit domain would not be able to see the top 32-bit.
>=20
> In fact, this could potentially cause us some trouble (see [1]) in Xen.=

> So it feels like the hypercalls should always return a 32-bit signed=20
> value on Arm.

This would break hypercalls like XENMEM_maximum_ram_page which are able
to return larger values, right?

> The other advantage is it would be clear that the top 32-bit are not=20
> usuable. Stefano, what do you think?

Wouldn't it make more sense to check the return value to be a sign
extended 32-bit value for 32-bit guests in do_trap_hypercall() instead?

The question is what to return if this is not the case. -EDOM?

>=20
>>
>> Get rid of the exceptions by letting compat handlers always return int=

>> and others always return long.
>>
>> For the compat hvm case use eax instead of rax for the stored result a=
s
>> it should have been from the beginning.
>>
>> Additionally move some prototypes to include/asm-x86/hypercall.h
>> as they are x86 specific. Move the do_physdev_op() prototype from both=

>> architecture dependant headers to the common one. Move the
>> compat_platform_op() prototype to the common header.
>>
>> Switch some non style compliant types (u32, s32, s64) to style complia=
nt
>> ones.
>=20
> TBH, I think this should have been split because the modifications are =

> done on lines that are untouched.
>=20
> The extra patch would have made the review easier (even if this patch i=
s=20
> still quite small).

I can split the patch if you want.


Juergen

--------------89277A122A0C5C84F18DC9C3
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

--------------89277A122A0C5C84F18DC9C3--

--hvUyHbuLxdlKobNpd8FF7ecSSyGfHZhDG--

--z0rgR56fMnYEIWcmJLqhGk2F8AM62QRz0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG5kzcFAwAAAAAACgkQsN6d1ii/Ey/I
/Af+KZoKfwOcntX3GBMl0kbhVtOoNsqtNfxCpbWt8sa/i0cBK7f3+2xtDGe3f8qwGGb9hVM33bi8
v+vaQYbiwcLqkFStakE0SGU/lhYreh3TLrdOCZ2CBEnhmodMBHoZ9fy7BUh/iSb3OyFW1FX5RfaJ
T9SuP1QTqefN2lJSQeDof6FVzAuO6km4vVYDE2uT9zfEpi16T9TPKQF8fzGD9rmFE+7JQfZKdUgE
gE8XL0ge3JL3OsZYCL7xTDssPiBkDnbUcVy/mKKXmQ4svxyxUJnrvEipkPH4HWEVhv3bnpSSr7bW
KhjrLafCPzSWBALyHJjHJc1M8vrxA1/cGEXicYiKaQ==
=9V5H
-----END PGP SIGNATURE-----

--z0rgR56fMnYEIWcmJLqhGk2F8AM62QRz0--

