Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A3848A764
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 06:34:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255600.438025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n79mE-0007vx-RM; Tue, 11 Jan 2022 05:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255600.438025; Tue, 11 Jan 2022 05:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n79mE-0007tN-Mu; Tue, 11 Jan 2022 05:32:58 +0000
Received: by outflank-mailman (input) for mailman id 255600;
 Tue, 11 Jan 2022 05:32:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zHlr=R3=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n79mD-0007tH-3a
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 05:32:57 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed37ea4d-729f-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 06:32:55 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4B5FA1F383;
 Tue, 11 Jan 2022 05:32:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0999A13A42;
 Tue, 11 Jan 2022 05:32:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Y11qOoUW3WHwTQAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 11 Jan 2022 05:32:53 +0000
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
X-Inumbo-ID: ed37ea4d-729f-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641879174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j3DUv0V5byu4UTorL2QDYg64UAgard7q89jYQ4PgLCM=;
	b=CTUWzWGQ70uL7sGNJv1bCC+exrGlaYeXgKb4Ik4eFAsJjh37Y3wunICfN7lxRknxLzgo6E
	FgAnHOJGX4YRM6L4ZkqtJGIlYYKm7rfBhCB6J/CY+6Ix+gssGmGM0zM+IRVFsQpJAK+vX5
	/UgLeLZIyKpn6mR8EPvmthn8NB0L7Dc=
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <amc96@srcf.net>
Cc: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <YdwodzmyvNwGJaSM@Air-de-Roger>
 <539e31bc-3e68-9e9d-3bb3-2d0f1b2834fc@suse.com>
 <0b2d6240-5780-b8ea-8828-ece44047cd63@srcf.net>
 <d887e3c2-8d89-8855-887c-943ebac6494d@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <42287336-2d9c-c4d1-9253-ed3e9fbedbf3@suse.com>
Date: Tue, 11 Jan 2022 06:32:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <d887e3c2-8d89-8855-887c-943ebac6494d@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="McxQlypiyRxNhcRBgnsDwmp3tfZXBECYz"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--McxQlypiyRxNhcRBgnsDwmp3tfZXBECYz
Content-Type: multipart/mixed; boundary="b5CzcQCJ9pSrJ0090MclyK5lbTK2qsLFc";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <amc96@srcf.net>
Cc: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Message-ID: <42287336-2d9c-c4d1-9253-ed3e9fbedbf3@suse.com>
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <YdwodzmyvNwGJaSM@Air-de-Roger>
 <539e31bc-3e68-9e9d-3bb3-2d0f1b2834fc@suse.com>
 <0b2d6240-5780-b8ea-8828-ece44047cd63@srcf.net>
 <d887e3c2-8d89-8855-887c-943ebac6494d@suse.com>
In-Reply-To: <d887e3c2-8d89-8855-887c-943ebac6494d@suse.com>

--b5CzcQCJ9pSrJ0090MclyK5lbTK2qsLFc
Content-Type: multipart/mixed;
 boundary="------------67AEAA8ACFAEA8468A990565"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------67AEAA8ACFAEA8468A990565
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.01.22 18:04, Jan Beulich wrote:
> On 10.01.2022 16:43, Andrew Cooper wrote:
>> On 10/01/2022 13:11, Jan Beulich wrote:
>>> On 10.01.2022 13:37, Roger Pau Monn=C3=A9 wrote:
>>>> On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
>>>>> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>>>>>  =20
>>>>>       pts->frequency =3D hpet_rate;
>>>>>  =20
>>>>> +for(i =3D 0; i < 16; ++i) {//temp
>>>>>       count =3D hpet_read32(HPET_COUNTER);
>>>>>       start =3D rdtsc_ordered();
>>>>>       target =3D count + CALIBRATE_VALUE(hpet_rate);
>>>>>       if ( target < count )
>>>>>           while ( hpet_read32(HPET_COUNTER) >=3D count )
>>>>>               continue;
>>>>> -    while ( hpet_read32(HPET_COUNTER) < target )
>>>>> +    while ( (count =3D hpet_read32(HPET_COUNTER)) < target )
>>>>>           continue;
>>>>>  =20
>>>>> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
>>>>> +    expired =3D rdtsc_ordered() - start;
>>>> There's also a window between the HPET read and the TSC read where a=
n
>>>> SMI/NMI could cause a wrong frequency detection.
>>> Right, as said in an earlier reply I did notice this myself (actually=

>>> on the way home on Friday). As also said there, for now I can't see
>>> any real (i.e. complete) solution to this and the similar instances
>>> of the issue elsewhere.
>>
>> Calibration loops like this cannot be made robust.=C2=A0 This is speci=
fically
>> why frequency information is being made available via architectural
>> means, and is available via non-architectural means in other cases.
>>
>> There's a whole bunch of situations (#STOPCLK, TERM and PSMI off the t=
op
>> of my head, but I bet HDC will screw with things too) which will mess
>> with any calibration loop, even if you could disable SMIs.=C2=A0 While=
,
>> mechanically, we can disable SMIs on AMD with CLGI, we absolutely
>> shouldn't run a calibration loop like this with SMIs disabled.
>>
>>
>> Much as I hate to suggest it, we should parse the frequency out of the=

>> long CPUID string, and compare it to the calibration time.=C2=A0 (This=

>> technique is mandated in the Intel BWG during very early setup.)
>=20
> This, according to some initial checking, might work for Intel CPUs,
> but apparently won't work for AMD ones (and I don't dare to think of
> what might happen if we run under, say, qemu). Imo we'd need to deal
> gracefully with the case that we can't parse the frequency out of
> that string, with "gracefully" including that our calibration still
> won't be too far off.
>=20
> Also I wonder if we wouldn't better prefer CPUID leaf 0x15 / 0x16
> data over parsing extended leaf.
>=20
>> If it is different by a large margin, rerun the calibration, and if it=

>> is still different, complain loudly into the logs.=C2=A0 This will fix=
 a
>> one-off-spurious event, whereas if e.g. the system is thermally
>> throttling due to a bad heat sync, there is nothing software can do to=

>> recover the system.
>=20
> I was already considering to use reference data like that from CPUID
> leaves 0x15 / 0x16, but I couldn't really settle on what "large
> margin" would really want to be. Imo we should try to correct not-
> just-as-large errors as well, if we can.
>=20
> For the moment I continue to consider my plan (outlined in another
> reply on this thread) superior to what you suggest, but I'll be
> looking forward to further replies from you or others.

Didn't Andrew mention that SMIs can be detected to have happened via
an SMI counter?

I'd save the SMI counter (and possibly MCE and NMI counters, too)
before calibration and check them not to have changed afterwards.

In case one of the counters did change, redo the calibration.

In the qemu (or nested virt) case the frequency might just be wrong,
but this is no regression compared to today.


Juergen

--------------67AEAA8ACFAEA8468A990565
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

--------------67AEAA8ACFAEA8468A990565--

--b5CzcQCJ9pSrJ0090MclyK5lbTK2qsLFc--

--McxQlypiyRxNhcRBgnsDwmp3tfZXBECYz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHdFoUFAwAAAAAACgkQsN6d1ii/Ey8N
rggAk1FFGP+HFq3W0lS0t1wqAm7sdlcY5SQEeafChx05+SISRwK6QJBJ0La12l+gBf6RpddflP9f
GiTcnZ7JK4whJLcpKhErxGZZbKmNa+3jQF/WFcB98EkTbPA/fjqXwLyX5ckaIwUglsJJY90oBC71
W2iYPKxY2L5zhrhRdhQXG4OvxE4X3vYwBMDIZNVl5f9BZRC1gtgrbwjwnZcmpxJwwQ7NER8a6gDq
WChNjrtg6tmHzizCneiqDxcH7c0QJXyhVlFoTDw2vDpeBO2WxwErFd8npBcBe88rjIE77fFH10KY
LrF1L5D8NToK1jXlXg+a7N5r7zOHSRN8QMfViXGJrQ==
=Q2aU
-----END PGP SIGNATURE-----

--McxQlypiyRxNhcRBgnsDwmp3tfZXBECYz--

