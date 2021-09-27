Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C68D4196D7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Sep 2021 16:58:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197054.350007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUs4b-00078F-BG; Mon, 27 Sep 2021 14:57:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197054.350007; Mon, 27 Sep 2021 14:57:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mUs4b-00075Y-7V; Mon, 27 Sep 2021 14:57:41 +0000
Received: by outflank-mailman (input) for mailman id 197054;
 Mon, 27 Sep 2021 14:57:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eI72=OR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mUs4Z-00075Q-Vr
 for xen-devel@lists.xenproject.org; Mon, 27 Sep 2021 14:57:40 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d0a3453b-9b7b-4f51-b009-4f1fb6563aa8;
 Mon, 27 Sep 2021 14:57:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3FD72221D8;
 Mon, 27 Sep 2021 14:57:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DF9414007;
 Mon, 27 Sep 2021 14:57:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id imIXBuLbUWF3SgAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 27 Sep 2021 14:57:38 +0000
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
X-Inumbo-ID: d0a3453b-9b7b-4f51-b009-4f1fb6563aa8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632754658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9f+e12+t4toTAQB2zgPoQ2ut+S5PWfdy5EFiT3SqVGs=;
	b=tLx3mCMKsZB2UCjoQ3oDtxDQ/AmmlsB3OHowUzaaf953cpIzWrJcPQ2l5zjvFVQ31Tu8tg
	Tl0TouMCM564KhUFUwbrqvYeWlYnKd8wI/B4ZQvHmsC2Uc46UFDIc+ghxv0mdxs10yjAtz
	q+s+m6pPKG3hEZSjHOc0n8oHo6ChdMA=
Subject: Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210927104813.19772-1-jgross@suse.com>
 <20210927104813.19772-3-jgross@suse.com>
 <f858dda9-b844-48e4-c079-75296cc36316@citrix.com>
 <20bd7f1f-f0fc-b7a6-c0e8-05192714d384@suse.com>
 <9076ecc3-8509-f687-df11-82a561cb5b2d@citrix.com>
 <825e7a37-c39d-4cea-0992-268945ad118e@suse.com>
 <8d51e78c-e8b5-c65a-d130-cc0e527f9f92@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e56b9881-5a82-0180-765a-102fafab13ed@suse.com>
Date: Mon, 27 Sep 2021 16:57:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <8d51e78c-e8b5-c65a-d130-cc0e527f9f92@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="rP49qt83LZhsQV5Kjj8Ch7nP7Qzsixxs2"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--rP49qt83LZhsQV5Kjj8Ch7nP7Qzsixxs2
Content-Type: multipart/mixed; boundary="YBYEeWogkslpCsejnnM3Y4EV3mYdphfbI";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Message-ID: <e56b9881-5a82-0180-765a-102fafab13ed@suse.com>
Subject: Re: [PATCH v4 2/2] tools/xenstore: set open file descriptor limit for
 xenstored
References: <20210927104813.19772-1-jgross@suse.com>
 <20210927104813.19772-3-jgross@suse.com>
 <f858dda9-b844-48e4-c079-75296cc36316@citrix.com>
 <20bd7f1f-f0fc-b7a6-c0e8-05192714d384@suse.com>
 <9076ecc3-8509-f687-df11-82a561cb5b2d@citrix.com>
 <825e7a37-c39d-4cea-0992-268945ad118e@suse.com>
 <8d51e78c-e8b5-c65a-d130-cc0e527f9f92@citrix.com>
In-Reply-To: <8d51e78c-e8b5-c65a-d130-cc0e527f9f92@citrix.com>

--YBYEeWogkslpCsejnnM3Y4EV3mYdphfbI
Content-Type: multipart/mixed;
 boundary="------------FF3089DB97FAA0C19F2C33AF"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FF3089DB97FAA0C19F2C33AF
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 27.09.21 16:54, Andrew Cooper wrote:
> On 27/09/2021 15:52, Juergen Gross wrote:
>> On 27.09.21 16:40, Andrew Cooper wrote:
>>> On 27/09/2021 15:24, Juergen Gross wrote:
>>>> On 27.09.21 16:13, Andrew Cooper wrote:
>>>>> On 27/09/2021 11:48, Juergen Gross wrote:
>>>>>> Add a configuration item for the maximum number of open file
>>>>>> descriptors xenstored should be allowed to have.
>>>>>>
>>>>>> The default should be "unlimited" in order not to restrict xenstor=
ed
>>>>>> in the number of domains it can support, but unfortunately the
>>>>>> prlimit
>>>>>> command requires specification of a real value for the number of
>>>>>> files,
>>>>>> so use 262144 as the default value.
>>>>>
>>>>> Citation needed.
>>>>>
>>>>> prlimit -nunlimited
>>>>>
>>>>> prlimit --nofile=3Dunlimited
>>>>>
>>>>> both work fine, and strace confirms they issue correct system calls=
=2E
>>>>
>>>> Not on my test system:
>>>>
>>>> # prlimit --pid 734 --nofile=3Dunlimited
>>>> prlimit: failed to set the NOFILE resource limit: Operation not
>>>> permitted
>>>> # prlimit --pid 734 --nofile=3D262144
>>>> #
>>>
>>> What does strace say in both of these cases?
>>
>> prlimit64(734, RLIMIT_NOFILE, {rlim_cur=3DRLIM64_INFINITY,
>> rlim_max=3DRLIM64_INFINITY}, NULL) =3D -1 EPERM (Operation not permitt=
ed)
>> write(2, "prlimit: ", 9prlimit: )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D 9
>>
>> vs.
>>
>> prlimit64(734, RLIMIT_NOFILE, {rlim_cur=3D256*1024, rlim_max=3D256*102=
4},
>> NULL) =3D 0
>>
>>>
>>>>
>>>>> Support for "unlimited" as a parameter has existed for the entire
>>>>> lifetime of the utility,
>>>>> https://github.com/karelzak/util-linux/commit/6bac2825af7216c547114=
8e219dbcf62ec5ede84
>>>>>
>>>>>
>>>>
>>>> Yes, but not all systems seem to support raising the limit to
>>>> "unlimited".
>>>
>>> That's as maybe, but
>>>
>>> prlimit64(0, RLIMIT_NOFILE, {rlim_cur=3DRLIM64_INFINITY,
>>> rlim_max=3DRLIM64_INFINITY}, NULL) =3D -1 EPERM (Operation not permit=
ted)
>>>
>>> is a Linux issue, not a prlimit bug.
>>
>> Nevertheless it isn't a good idea to use this setting in case it isn't=

>> supported in all Linux distros/versions we care about.
>=20
> Ok, but at a minimum you need s/prlimit/Linux/ in the commit message.

Okay.

Should I send out another version, or can this be done when committing?


Juergen

--------------FF3089DB97FAA0C19F2C33AF
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

--------------FF3089DB97FAA0C19F2C33AF--

--YBYEeWogkslpCsejnnM3Y4EV3mYdphfbI--

--rP49qt83LZhsQV5Kjj8Ch7nP7Qzsixxs2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFR2+EFAwAAAAAACgkQsN6d1ii/Ey9a
Vwf9EEUPmEjMf1cT3riBeRdXTo1Xn9URWtSaPiQ3SX0fIVQ0b6lYFZkEBVgDb8Di/M9m0kzoUISE
gNW0ltrQhFkKeJOhUuXGm5ohGTOOxU0OJNAKFkNSJXFRNdsU40g1y9DDOE+ct8n2zdJC1tWbGCfp
oeXo7ZfiP3IbQb07XMsrCRl941zBRW5jXPrUo3JOzxH8q5DHosOixefTgcr7NrYtfX6VW5B8EhKX
DNW1YLCdWTGHfWv+q/7dHv2vvkJQVlTJ1S8rpgYvTh8uaoq5p4HLcuydPej5PckvwsYOZbrZ6/5T
YQWTHO2bFVymBFhUPhUphHr6ftxL1VtSdyGuV2S0MA==
=9/Ez
-----END PGP SIGNATURE-----

--rP49qt83LZhsQV5Kjj8Ch7nP7Qzsixxs2--

