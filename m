Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 101872ACF7C
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 07:14:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23023.49566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcMuY-0003ch-EI; Tue, 10 Nov 2020 06:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23023.49566; Tue, 10 Nov 2020 06:13:46 +0000
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
	id 1kcMuY-0003cI-AO; Tue, 10 Nov 2020 06:13:46 +0000
Received: by outflank-mailman (input) for mailman id 23023;
 Tue, 10 Nov 2020 06:13:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n6mT=EQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kcMuW-0003cD-9a
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 06:13:44 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7057ce77-f7f2-4c2f-8f92-ac323c81e03f;
 Tue, 10 Nov 2020 06:13:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 54B7DABCC;
 Tue, 10 Nov 2020 06:13:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=n6mT=EQ=suse.com=jgross@srs-us1.protection.inumbo.net>)
	id 1kcMuW-0003cD-9a
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 06:13:44 +0000
X-Inumbo-ID: 7057ce77-f7f2-4c2f-8f92-ac323c81e03f
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 7057ce77-f7f2-4c2f-8f92-ac323c81e03f;
	Tue, 10 Nov 2020 06:13:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604988820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=am5sI30/jpQEL6r0DGcXpXqbcTe0odIDO8MWnn6/kNE=;
	b=NKJ9mpFq9YdKQSUhRiznQbaWXeavG0o3cbBPjjNlqjxmdnqSt8FdO/SbT/JAeFz2TDcq3M
	9S3r5wZz/tnS50+QQyix7aikVw+0C8W//cBvcwhYYnvlsk4ysXo3WihU/TltH5p5mnMhi1
	RmUADBUkLrQrz5Xkv8UFu0tmiqn4vQo=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 54B7DABCC;
	Tue, 10 Nov 2020 06:13:40 +0000 (UTC)
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
 <f64158af-3468-053f-7cbe-d52ab01b8bfc@suse.com>
 <7858513b-2938-5bad-0c9e-167a8472656f@xen.org>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <55a10d06-190b-0647-28ac-05aef2ef29a6@suse.com>
Date: Tue, 10 Nov 2020 07:13:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7858513b-2938-5bad-0c9e-167a8472656f@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PPVfdByhVypL8nldDacm7BGdJuae8xDGk"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PPVfdByhVypL8nldDacm7BGdJuae8xDGk
Content-Type: multipart/mixed; boundary="RmjyHdAK7vtsYXhFx5DAC6m4boeHL7jnJ";
 protected-headers="v1"
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Stefano Stabellini
 <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Message-ID: <55a10d06-190b-0647-28ac-05aef2ef29a6@suse.com>
Subject: Re: [PATCH v6 2/3] xen/evtchn: rework per event channel lock
References: <20201109163826.13035-1-jgross@suse.com>
 <20201109163826.13035-3-jgross@suse.com>
 <f64158af-3468-053f-7cbe-d52ab01b8bfc@suse.com>
 <7858513b-2938-5bad-0c9e-167a8472656f@xen.org>
In-Reply-To: <7858513b-2938-5bad-0c9e-167a8472656f@xen.org>

--RmjyHdAK7vtsYXhFx5DAC6m4boeHL7jnJ
Content-Type: multipart/mixed;
 boundary="------------08E2B106380132A6A21E391D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------08E2B106380132A6A21E391D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09.11.20 18:46, Julien Grall wrote:
> Hi,
>=20
> On 09/11/2020 16:48, Jan Beulich wrote:
>> On 09.11.2020 17:38, Juergen Gross wrote:
>>> Currently the lock for a single event channel needs to be taken with
>>> interrupts off, which causes deadlocks in some cases.
>>>
>>> Rework the per event channel lock to be non-blocking for the case of
>>> sending an event and removing the need for disabling interrupts for
>>> taking the lock.
>>>
>>> The lock is needed for avoiding races between event channel state
>>> changes (creation, closing, binding) against normal operations (set
>>> pending, [un]masking, priority changes).
>>>
>>> Use a rwlock, but with some restrictions:
>>>
>>> - Changing the state of an event channel (creation, closing, binding)=

>>> =C2=A0=C2=A0 needs to use write_lock(), with ASSERT()ing that the loc=
k is taken as
>>> =C2=A0=C2=A0 writer only when the state of the event channel is eithe=
r before or
>>> =C2=A0=C2=A0 after the locked region appropriate (either free or unbo=
und).
>>>
>>> - Sending an event needs to use read_trylock() mostly, in case of not=

>>> =C2=A0=C2=A0 obtaining the lock the operation is omitted. This is nee=
ded as
>>> =C2=A0=C2=A0 sending an event can happen with interrupts off (at leas=
t in some
>>> =C2=A0=C2=A0 cases).
>>>
>>> - Dumping the event channel state for debug purposes is using
>>> =C2=A0=C2=A0 read_trylock(), too, in order to avoid blocking in case =
the lock is
>>> =C2=A0=C2=A0 taken as writer for a long time.
>>>
>>> - All other cases can use read_lock().
>>>
>>> Fixes: e045199c7c9c54 ("evtchn: address races with evtchn_reset()")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V4:
>>> - switch to rwlock
>>> - add ASSERT() to verify correct write_lock() usage
>>>
>>> V3:
>>> - corrected a copy-and-paste error (Jan Beulich)
>>> - corrected unlocking in two cases (Jan Beulich)
>>> - renamed evtchn_read_trylock() (Jan Beulich)
>>> - added some comments and an ASSERT() for evtchn_write_lock()
>>> - set EVENT_WRITE_LOCK_INC to INT_MIN
>>>
>>> V2:
>>> - added needed barriers
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>> I'll give it overnight for others to possibly comment, but I'd
>> like to get this in tomorrow if at all possible.
>=20
> IIRC, Citrix originally reported the issues. I would like to give them =

> an opportunity to test the patches and confirm this effectively fixed=20
> there issues.
>=20
> @Roger, @Andrew, could you give a try to confirm this unblock the vm=20
> event issue?

It should be noted that this series ought to fix current unstable
failures of XSM tests, as those are triggering the advanced lock checks
of rwlocks due to the per-event channel lock disabling interrupts.


Juergen

--------------08E2B106380132A6A21E391D
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

--------------08E2B106380132A6A21E391D--

--RmjyHdAK7vtsYXhFx5DAC6m4boeHL7jnJ--

--PPVfdByhVypL8nldDacm7BGdJuae8xDGk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAl+qL5MFAwAAAAAACgkQsN6d1ii/Ey85
twf/fs+46wJm0f7jShKJQUQXgmNsfYhLf/mq9TR4W+V/aDQcn6yG4EXwSoGea+6XkwZlhyrWTEq6
Hc+s2WSJgNcSIJLeFqsXdq0cHW7Gw2HxGp7lU4Al3+roXR6Eub7c1xapX1cNNPT/GjRCSvdkOQ3c
xBpBf/ntoFTfo+RbJEuwLEJcbe5LlbrDmjR0LDRHBVj1lZJegQP246j8uyCaZwvm1ieZUfHFtD54
OQLv78iGRkUwNxEw35oUx9t14HuwmYll6IUlR5MLGUUsdYPcgI1ZZ1C36wuDkGojVrxGE2jFfRkU
KnAN5XMmCMNDudZEqdBVxzrDjciIAa5bjGya27Xa7A==
=heia
-----END PGP SIGNATURE-----

--PPVfdByhVypL8nldDacm7BGdJuae8xDGk--

