Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB0C3C730E
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 17:21:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155477.287003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3KDF-0007I1-El; Tue, 13 Jul 2021 15:20:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155477.287003; Tue, 13 Jul 2021 15:20:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3KDF-0007FB-Bd; Tue, 13 Jul 2021 15:20:45 +0000
Received: by outflank-mailman (input) for mailman id 155477;
 Tue, 13 Jul 2021 15:20:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+3sG=MF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m3KDE-0007F5-DT
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 15:20:44 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac34fe78-8dd2-49f7-9854-ad224bf67590;
 Tue, 13 Jul 2021 15:20:43 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 74FE62287E;
 Tue, 13 Jul 2021 15:20:42 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 383D213A5D;
 Tue, 13 Jul 2021 15:20:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id /uvOC0qv7WARFAAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 13 Jul 2021 15:20:42 +0000
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
X-Inumbo-ID: ac34fe78-8dd2-49f7-9854-ad224bf67590
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1626189642; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gR5bqz+wSeIF9u3YneTgsLIBC29UB9Z6ixAunk7BI50=;
	b=SIIH8e84Ci4ZS6no30RYiAWiw94N1TinmPXyEMQ2BvAoSC8gZHoWQDlp5TwU2TKUFCRALC
	oAs9DM6YSYbUeSJzFJ6cfmMBEaCawPqW/yvzEZ2KVKHqs5sRk+Fb4njRkJKHTqNq77+Syi
	PD5ZMKNehOuVXcjOaJMn5Bn8XebVN/I=
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <69c62b4c-b46f-9eab-8dfd-742c07423424@suse.com>
 <c0a7de56-de7b-3451-8cc5-ccb73c78ba42@xen.org>
 <ce7a20e5-3f18-11b6-d0d1-72e31362d2fb@suse.com>
 <bb9e482c-e9b6-9def-7e7e-ac2ba9b7e7f4@xen.org>
From: Juergen Gross <jgross@suse.com>
Message-ID: <7fab704a-6b59-1e9b-663e-a3afdfcc319f@suse.com>
Date: Tue, 13 Jul 2021 17:20:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bb9e482c-e9b6-9def-7e7e-ac2ba9b7e7f4@xen.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="b29Uzl3jyIdMKcrPV5SdZCKA5DN1UHEFi"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b29Uzl3jyIdMKcrPV5SdZCKA5DN1UHEFi
Content-Type: multipart/mixed; boundary="n2TvMf4ohvVdaE1a6L8RtH65yvicFtrmR";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Julien Grall <julien@xen.org>, Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Costin Lupu <costin.lupu@cs.pub.ro>
Message-ID: <7fab704a-6b59-1e9b-663e-a3afdfcc319f@suse.com>
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
 <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
 <40c00267-60d2-c0fc-cde4-8ac4ce936f87@suse.com>
 <d7cbedf3-bb67-1eda-70e2-d15c5649c0cd@xen.org>
 <69c62b4c-b46f-9eab-8dfd-742c07423424@suse.com>
 <c0a7de56-de7b-3451-8cc5-ccb73c78ba42@xen.org>
 <ce7a20e5-3f18-11b6-d0d1-72e31362d2fb@suse.com>
 <bb9e482c-e9b6-9def-7e7e-ac2ba9b7e7f4@xen.org>
In-Reply-To: <bb9e482c-e9b6-9def-7e7e-ac2ba9b7e7f4@xen.org>

--n2TvMf4ohvVdaE1a6L8RtH65yvicFtrmR
Content-Type: multipart/mixed;
 boundary="------------E95AD78BA905F755E19F940D"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------E95AD78BA905F755E19F940D
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.07.21 17:15, Julien Grall wrote:
> Hi Juergen,
>=20
> On 13/07/2021 16:09, Juergen Gross wrote:
>> On 13.07.21 16:38, Julien Grall wrote:
>>> Hi Juergen,
>>>
>>> On 13/07/2021 15:23, Juergen Gross wrote:
>>>> On 13.07.21 16:19, Julien Grall wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 13/07/2021 15:14, Jan Beulich wrote:
>>>>>>> And I don't think it should be named XC_PAGE_*, but rather=20
>>>>>>> XEN_PAGE_*.
>>>>>>
>>>>>> Even that doesn't seem right to me, at least in principle. There=20
>>>>>> shouldn't
>>>>>> be a build time setting when it may vary at runtime. IOW on Arm I =

>>>>>> think a
>>>>>> runtime query to the hypervisor would be needed instead.
>>>>>
>>>>> Yes, we want to be able to use the same userspace/OS without=20
>>>>> rebuilding to a specific hypervisor page size.
>>>>
>>>> This define is used for accessing data of other domains. See the def=
ine
>>>> for XEN_PAGE_SIZE in xen/include/public/io/ring.h
>>>>
>>>> So it should be a constant (minimal) page size for all hypervisors a=
nd
>>>> guests of an architecture.
>>>
>>> Do you mean the maximum rather than minimal? If you use the minimal=20
>>> (4KB), then you would not be able to map the page in the stage-2 if=20
>>> the hypervisor is using 64KB.
>>
>> But this would mean that the current solution to use XC_PAGE_SIZE is
>> wrong, as this is 4k.
>=20
> The existing ABI is implicitely based on using the hypervisor page=20
> granularity (currently 4KB).
>=20
> There is really no way we can support existing guest on 64KB hypervisor=
=2E=20
> But if we were going to break them, then we should consider to do one o=
f=20
> the following option:
>  =C2=A0=C2=A0 1) use 64KB page granularity for ABI
>  =C2=A0=C2=A0 2) query the hypervisor page granularity at runtime
>=20
> The ideal is 2) because it is more scalable for the future. We also nee=
d=20
> to consider to extend the PV protocol so the backend and frontend can=20
> agree on the page size.

I absolutely agree, but my suggestion was to help finding a proper way
to cleanup the current interface mess. And this should be done the way
I suggested IMO.

A later interface extension for future guests can still be done on top
of that.


Juergen

--------------E95AD78BA905F755E19F940D
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

--------------E95AD78BA905F755E19F940D--

--n2TvMf4ohvVdaE1a6L8RtH65yvicFtrmR--

--b29Uzl3jyIdMKcrPV5SdZCKA5DN1UHEFi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDtr0kFAwAAAAAACgkQsN6d1ii/Ey/O
ZQgAjBkOJO/HDotuu66KUK21cC+SFSTZCnkTMhidxwtTxq4Egr5tE7a9ziH7Q3SzOk+V4PJROY++
iuBWZUMwL9P0mUbR6/mlT3U5KrCXC4WsZJ+b3B910WFs8bpxIQDVcik68AbKHykPkeIa8gJipcm6
xfZshvWzktJrH0Kek1jvF6P4XI3M8xTaWrOuAIgsvr6uFjPOnB4yN7MCLftrOhj1qX1gHWmSIj9T
mWwv78v/HpmKduF999EDla9yEvgYLebmERcyXEePJGiGVJQu4lasTKufAF2ZeP23X91xIih9a0r2
gsuOBz0COvfH5UVpLVh48gu1xHhfLVjlINsUhYch9A==
=I+YP
-----END PGP SIGNATURE-----

--b29Uzl3jyIdMKcrPV5SdZCKA5DN1UHEFi--

