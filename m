Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC1E3C71B9
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 16:01:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155391.286843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Ixn-0007gW-RU; Tue, 13 Jul 2021 14:00:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155391.286843; Tue, 13 Jul 2021 14:00:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Ixn-0007du-Nm; Tue, 13 Jul 2021 14:00:43 +0000
Received: by outflank-mailman (input) for mailman id 155391;
 Tue, 13 Jul 2021 14:00:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+3sG=MF=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m3Ixm-0007do-1Q
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 14:00:42 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6e076c88-6236-45a4-9d3a-90b8405da5cf;
 Tue, 13 Jul 2021 14:00:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 047FE2057E;
 Tue, 13 Jul 2021 14:00:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B688413A45;
 Tue, 13 Jul 2021 14:00:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id OVB5Koec7WCvdgAAGKfGzw
 (envelope-from <jgross@suse.com>); Tue, 13 Jul 2021 14:00:39 +0000
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
X-Inumbo-ID: 6e076c88-6236-45a4-9d3a-90b8405da5cf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1626184840; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AJCzCtGRNhYmTLrGH3J+hHcdizJYVl1PN4hFAGBJgrI=;
	b=YiP1gv6Vs1/SMh/fHTYBsGfz0HnvLpUBbtxW7WJsSZw4SJc7nYXuLqE4u06ScD8XaTE0j7
	/SRVK4XHiOHM80a/rmuli9iwxNXWff16hEse4qFhqGIO6L6C5cjxW7HeGGQCzl/10PdzYK
	BxzXNU03Hnt/P7x5y93F3Zgsq/DFCgA=
To: Costin Lupu <costin.lupu@cs.pub.ro>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
 <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
 <badec201-6719-844e-2a07-6508e891ca3e@citrix.com>
 <3c819563-b354-5527-050d-f698324d6021@xen.org>
 <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
Message-ID: <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
Date: Tue, 13 Jul 2021 16:00:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="teuPerawMk3KVgZzEGHSfj0vASGeFavTS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--teuPerawMk3KVgZzEGHSfj0vASGeFavTS
Content-Type: multipart/mixed; boundary="OQ5SkGBxwWLZBxo0B5e0s9fKmPRFbUrdZ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Costin Lupu <costin.lupu@cs.pub.ro>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Jan Beulich <jbeulich@suse.com>
Message-ID: <65d35862-304c-7fe3-82de-3ff62f06529a@suse.com>
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
In-Reply-To: <c299355b-c031-3efd-ef97-671bd102809b@cs.pub.ro>

--OQ5SkGBxwWLZBxo0B5e0s9fKmPRFbUrdZ
Content-Type: multipart/mixed;
 boundary="------------D549EFAE3489D5528953C02F"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D549EFAE3489D5528953C02F
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 13.07.21 15:46, Costin Lupu wrote:
> Hi guys,
>=20
> On 7/13/21 4:00 PM, Julien Grall wrote:
>>
>>
>> On 13/07/2021 13:39, Andrew Cooper wrote:
>>> On 13/07/2021 12:53, Julien Grall wrote:
>>>> Hi Andrew,
>>>>
>>>> On 13/07/2021 12:23, Andrew Cooper wrote:
>>>>> On 13/07/2021 12:21, Julien Grall wrote:
>>>>>> Hi Andrew,
>>>>>>
>>>>>> On 13/07/2021 10:35, Andrew Cooper wrote:
>>>>>>> On 13/07/2021 10:27, Juergen Gross wrote:
>>>>>>>> On 13.07.21 11:20, Julien Grall wrote:
>>>>>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>>>>>
>>>>>>>>> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private=
=2Eh
>>>>>>>>> and
>>>>>>>>> wreck the build in an interesting way:
>>>>>>>>>
>>>>>>>>> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from xen/tools/=
include/xenctrl.h:36,
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from private.h:=
4,
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 from minios.c:2=
9:
>>>>>>>>> xen/include/public/memory.h:407:5: error: expected
>>>>>>>>> specifier-qualifier-list before =E2=80=98XEN_GUEST_HANDLE_64=E2=
=80=99
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 XEN_GUEST_HAN=
DLE_64(const_uint8) buffer;
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~~~~~~~~~=
~~~~~~
>>>>>>>>>
>>>>>>>>> This is happening because xenctrl.h defines __XEN_TOOLS__ and
>>>>>>>>> therefore
>>>>>>>>> the public headers will start to expose the non-stable ABI.
>>>>>>>>> However,
>>>>>>>>> xen.h has already been included by a mini-OS header before hand=
=2E So
>>>>>>>>> there is a mismatch in the way the headers are included.
>>>>>>>>>
>>>>>>>>> For now solve it in a very simple (and gross) way by including
>>>>>>>>> xenctrl.h before the mini-os headers.
>>>>>>>>>
>>>>>>>>> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE
>>>>>>>>> redefinition error")
>>>>>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>>
>>>>>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>>>
>>>>>>>>> I couldn't find a better way with would not result to revert th=
e
>>>>>>>>> patch
>>>>>>>>> (and break build on some system) or involve a longer rework of =
the
>>>>>>>>> headers.
>>>>>>>>
>>>>>>>> Just adding a "#define __XEN_TOOLS__" before the #include statem=
ents
>>>>>>>> doesn't work?
>>>>>>>
>>>>>>> Not really, no.
>>>>>>>
>>>>>>> libxenforeignmem has nothing at all to do with any Xen unstable
>>>>>>> interfaces.=C2=A0 Including xenctrl.h in the first place was wron=
g,
>>>>>>> because
>>>>>>> it is an unstable library.=C2=A0 By extension, the use of XC_PAGE=
_SIZE is
>>>>>>> also wrong.
>>>>>>
>>>>>> Well... Previously we were using PAGE_SIZE which is just plain wro=
ng
>>>>>> on Arm.
>>>>>>
>>>>>> At the moment, we don't have a way to query the page granularity o=
f
>>>>>> the hypervisor. But we know it can't change because of the way the=

>>>>>> current ABI was designed. Hence why using XC_PAGE_SIZE is the best=
 of
>>>>>> option we had until we go to ABIv2.
>>>>>
>>>>> Still doesn't mean that XC_PAGE_SIZE was ok to use.
>>>>
>>>> Note that I wrote "best of the option". The series has been sitting
>>>> for ages with no-one answering... You could have provided your optio=
n
>>>> back then if you thought it wasn't a good use...
>>>
>>> On a series I wasn't even CC'd on?
>>
>> You had the link on IRC because we discussed it.
>>
>>>
>>> And noone had even bothered to compile test?
>>
>> Well, that was a mistake. At the same time, if it compiled the "issue"=

>> you describe would have gone unnoticed. ;)
>>
>>>>
>>>>>
>>>>> Sounds like the constant needs moving into the Xen public headers, =
and
>>>>> the inclusions of xenctrl.h into stable libraries needs reverting.
>>>>
>>>> This could work. Are you planning to work on it?
>>>
>>> No.=C2=A0 I don't have enough time to do my own work thanks to all th=
e CI
>>> breakage and regressions being committed.
>>> This needs fixing, or the original series reverting for 4.16 because =
the
>>> current form (with or without this emergency build fix) isn't accepta=
ble
>>> to release with.
>> I disagree with this caracterization. Yes, this is including a
>> non-stable header but it doesn't link with non-stable library.
>>
>> In fact, reverting the series will bring back two issues:
>>  =C2=A0 1) Xen tools will not build on all the distros
>>  =C2=A0 2) Using PAGE_{SIZE, SHIFT} break arm tools because the usersp=
ace is
>> not meant to rely on a given kernel page granularity.
>>
>> So this doesn't look like a priority for 4.16. Although, it would be a=

>> nice clean-up to have so the libraries are more compliant.
>=20
> First of all, sorry for breaking the build.
>=20
> As Jan already suggested on a different thread, we can fix this by
> isolating the XC_PAGE_* definitions of the toolstack in a header of
> their own. I'm open to suggestions regarding the name of the header (my=

> suggestion would be xenctrl_page.h) and path (I guess it should be in
> tools/include, right?). Also, should we change the names of the macros
> from XC_PAGE_* to something else in order to reflect that they are
> toolstack related instead of xenctrl specific?

I would rather have that definition in xen/include/public/arch-*.h as
this is a hypervisor attribute.

And I don't think it should be named XC_PAGE_*, but rather XEN_PAGE_*.


Juergen


--------------D549EFAE3489D5528953C02F
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

--------------D549EFAE3489D5528953C02F--

--OQ5SkGBxwWLZBxo0B5e0s9fKmPRFbUrdZ--

--teuPerawMk3KVgZzEGHSfj0vASGeFavTS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDtnIcFAwAAAAAACgkQsN6d1ii/Ey+3
hAf+N5RyK/PlOw8Nv6iGGJKRs+Fs5hL9RvnLHxbZvI1A8sIhjBWSh7yMT/KCO1GwJ8LrpPIGYESD
vol29v4RS20OVXm/8mLDwtqvWkR+WGK3T5H+rGHcGMV89KvmF5fnlutdvHiVGycpEnRgbltIrw3l
+FgDTYsX4gmt0vb6q3fCPMoglHi2D1nyI+YVNIYBTByYf9CxZLFH3W1V0AJEc7+UXLT7adlwnzfg
7thOBd8RQrXvV4reuQxsMxnE4zCfUpthu/Lo13H1SXonlwk1mjOpmq6pOBSB8pSu1o50jc0Aq6ek
sEfe8qprqX0QJ03w/xihF7U8NOerYxf8k71OQ1RrGA==
=bdbK
-----END PGP SIGNATURE-----

--teuPerawMk3KVgZzEGHSfj0vASGeFavTS--

