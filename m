Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C7B403BBC
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 16:47:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182160.329619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNyrW-0003Ji-8t; Wed, 08 Sep 2021 14:47:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182160.329619; Wed, 08 Sep 2021 14:47:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNyrW-0003HE-5P; Wed, 08 Sep 2021 14:47:42 +0000
Received: by outflank-mailman (input) for mailman id 182160;
 Wed, 08 Sep 2021 14:47:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTps=N6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mNyrU-0003Ge-Tj
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 14:47:40 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a2c40b9-ccba-4694-9d0f-edbae8295add;
 Wed, 08 Sep 2021 14:47:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 52D7022256;
 Wed,  8 Sep 2021 14:47:39 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id E608C13A96;
 Wed,  8 Sep 2021 14:47:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Kxm0NgrNOGFWNwAAGKfGzw
 (envelope-from <jgross@suse.com>); Wed, 08 Sep 2021 14:47:38 +0000
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
X-Inumbo-ID: 2a2c40b9-ccba-4694-9d0f-edbae8295add
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631112459; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jEFNWRIePbeIPt9GmDov9/wA6u8O4zqeE8y8N3lFb/0=;
	b=R7t45CL/vN0fqwIkKaTAptvlWWf5gcWvgVuoFeE8stPitbx+wMt2erghnki2rfI1oLiRal
	wySquU2/gkjDEWjjC/y+en3qzsYcI3d8UpNpxOHZ8/P2XcT+jtCtj+m9xtfmFOMJM65BAm
	5nu0K6rkLjboJJnJRO4INfze4CY3N6A=
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org, Sander Eikelenboom <linux@eikelenboom.it>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
References: <20210908073640.11299-1-jgross@suse.com>
 <5a4859db-d173-88dd-5ea9-dd5fd893d934@suse.com>
 <34afed98-5072-c563-5d29-97e09a0b4ebd@suse.com>
 <6862566d-4d55-dc5c-082a-da4fbcafcfce@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] xen: fix usage of pmd/pud_poplulate in mremap for pv
 guests
Message-ID: <21bad77f-90fb-1288-be52-291b56ccdd40@suse.com>
Date: Wed, 8 Sep 2021 16:47:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <6862566d-4d55-dc5c-082a-da4fbcafcfce@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3GzrgL9tJGXXoMnm3mnp4eEQIR0B4Ilr6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3GzrgL9tJGXXoMnm3mnp4eEQIR0B4Ilr6
Content-Type: multipart/mixed; boundary="BAS2MNyQNemPES6JplNDoPiAx8GLYmZex";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 stable@vger.kernel.org, Sander Eikelenboom <linux@eikelenboom.it>,
 xen-devel@lists.xenproject.org, x86@kernel.org, linux-kernel@vger.kernel.org
Message-ID: <21bad77f-90fb-1288-be52-291b56ccdd40@suse.com>
Subject: Re: [PATCH] xen: fix usage of pmd/pud_poplulate in mremap for pv
 guests
References: <20210908073640.11299-1-jgross@suse.com>
 <5a4859db-d173-88dd-5ea9-dd5fd893d934@suse.com>
 <34afed98-5072-c563-5d29-97e09a0b4ebd@suse.com>
 <6862566d-4d55-dc5c-082a-da4fbcafcfce@suse.com>
In-Reply-To: <6862566d-4d55-dc5c-082a-da4fbcafcfce@suse.com>

--BAS2MNyQNemPES6JplNDoPiAx8GLYmZex
Content-Type: multipart/mixed;
 boundary="------------57ADF394A2EC90BAF7B799FF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------57ADF394A2EC90BAF7B799FF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 08.09.21 16:28, Jan Beulich wrote:
> On 08.09.2021 15:32, Juergen Gross wrote:
>> On 08.09.21 13:07, Jan Beulich wrote:
>>> On 08.09.2021 09:36, Juergen Gross wrote:
>>>> Commit 0881ace292b662 ("mm/mremap: use pmd/pud_poplulate to update p=
age
>>>> table entries") introduced a regression when running as Xen PV guest=
=2E
>>>
>>> The description of that change starts with "pmd/pud_populate is the
>>> right interface to be used to set the respective page table entries."=

>>> If this is deemed true, I don't think pmd_populate() should call
>>> paravirt_alloc_pte(): The latter function, as its name says, is
>>> supposed to be called for newly allocated page tables only (aiui).
>>
>> In theory you are correct, but my experience with reality tells me tha=
t
>> another set of macros for this case will not be appreciated.
>=20
> Perhaps a new parameter to the macros / inlines identifying fresh
> vs moved? Or perhaps the offending change wasn't really correct in
> what its description said?

The problem is that those macros are spread over all architectures with
each architecture defining them separately. Changing all those will not
be really welcomed.

And the change was correct IMO, as the replaced pmd_set() should be used
for leaf entries only (at least in arch independent code).
pmd_populate() is the correct one for non-leaf entries.


Juergen

--------------57ADF394A2EC90BAF7B799FF
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

--------------57ADF394A2EC90BAF7B799FF--

--BAS2MNyQNemPES6JplNDoPiAx8GLYmZex--

--3GzrgL9tJGXXoMnm3mnp4eEQIR0B4Ilr6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE4zQoFAwAAAAAACgkQsN6d1ii/Ey+r
dgf6Ake5fyapfF3DOH1qLAFqjRubIjOR2e/8QUAFI5HTwoeZXQhCgyPXBCLL6RRk/EdXEoiq8S9M
cjQmylBZGpE3ow72fI2tGPV1OVasY/3aowSKd8Ib+a7lcOr/y7Kt0kBo7IpWahER4GX0nmBjZHve
9izQnBRiAgGFoBHwq/1SKegbW0bKk9RSUnhboEb106+64kYG3Aaa4OGvSt9XMAUEYllq3VX2m62x
GQjcimcHVViw2CVSCJUu7gDr9qmY3O6aIctZln0G2TVsc9SpPm4ZctEq1psKvFz+ikW8JT68MWPd
EckUq8qIkYDKV+GltlE3Xz4GRcjWY99z5IJ9WS75sA==
=zv9R
-----END PGP SIGNATURE-----

--3GzrgL9tJGXXoMnm3mnp4eEQIR0B4Ilr6--

