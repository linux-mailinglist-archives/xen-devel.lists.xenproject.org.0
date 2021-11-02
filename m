Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504A442B4E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 11:04:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.219899.380959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqeK-0006fo-N8; Tue, 02 Nov 2021 10:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 219899.380959; Tue, 02 Nov 2021 10:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhqeK-0006dN-JO; Tue, 02 Nov 2021 10:04:12 +0000
Received: by outflank-mailman (input) for mailman id 219899;
 Tue, 02 Nov 2021 10:04:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hRh8=PV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhqeJ-0006dH-2n
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 10:04:11 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c389749e-668f-481e-8b40-e45fb335c902;
 Tue, 02 Nov 2021 10:04:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2897E218F0;
 Tue,  2 Nov 2021 10:04:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 020AC13BF7;
 Tue,  2 Nov 2021 10:04:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VBvWOhgNgWF/GAAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 Nov 2021 10:04:08 +0000
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
X-Inumbo-ID: c389749e-668f-481e-8b40-e45fb335c902
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635847449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7U+/gX8cisnVTCRoPIKt5BMrxD6WwUxRMAZtEf1xHgU=;
	b=ALmMmueaoPpY/834a9Uo4dzCanR9zrLOl4eC3SYPCaCyFTTIIS0RtPjanJl37nKvXzCW+n
	Abprf0Kh3tY4Lta+Nd71hwIKLCZuXhSH0zfYRk312hD4zIbr+OxeCOZHWKtGN0Sx1A3oOo
	yeaoOA0/99fh/MheIcOXPKVNWdSpiMY=
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-11-jgross@suse.com>
 <88c3d815-912c-a92c-2e96-7eff6a454a75@suse.com>
 <1ab4b64f-720c-4f9a-043b-eefc5f6c387e@suse.com>
 <a436f15f-6ba4-e9f0-f65e-30f4b574bea5@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 10/12] xen/x86: call hypercall handlers via switch
 statement
Message-ID: <04613f92-0b28-d703-81c2-e0dd8cbc17fe@suse.com>
Date: Tue, 2 Nov 2021 11:04:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a436f15f-6ba4-e9f0-f65e-30f4b574bea5@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qWMG1BDsL57PVNCnF7C9LUImGuwWqZdXC"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qWMG1BDsL57PVNCnF7C9LUImGuwWqZdXC
Content-Type: multipart/mixed; boundary="i04Ga5rNUaNCrjpITRiYr4q99eSemNoke";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
Message-ID: <04613f92-0b28-d703-81c2-e0dd8cbc17fe@suse.com>
Subject: Re: [PATCH 10/12] xen/x86: call hypercall handlers via switch
 statement
References: <20211015125152.25198-1-jgross@suse.com>
 <20211015125152.25198-11-jgross@suse.com>
 <88c3d815-912c-a92c-2e96-7eff6a454a75@suse.com>
 <1ab4b64f-720c-4f9a-043b-eefc5f6c387e@suse.com>
 <a436f15f-6ba4-e9f0-f65e-30f4b574bea5@suse.com>
In-Reply-To: <a436f15f-6ba4-e9f0-f65e-30f4b574bea5@suse.com>

--i04Ga5rNUaNCrjpITRiYr4q99eSemNoke
Content-Type: multipart/mixed;
 boundary="------------4FA6F6BF4A77DC2BB82D2753"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4FA6F6BF4A77DC2BB82D2753
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.11.21 10:54, Jan Beulich wrote:
> On 28.10.2021 16:32, Juergen Gross wrote:
>> On 21.10.21 16:41, Jan Beulich wrote:
>>> On 15.10.2021 14:51, Juergen Gross wrote:
>>>> Instead of using a function table use the generated switch statement=

>>>> macros for calling the appropriate hypercall handlers.
>>>>
>>>> This is beneficial to performance and avoids speculation issues.
>>>>
>>>> With calling the handlers using the correct number of parameters now=

>>>> it is possible to do the parameter register clobbering in the NDEBUG=

>>>> case after returning from the handler. This in turn removes the only=

>>>> users of hypercall_args_table[] which can be removed now.
>>>
>>> "removed" reads misleading to me: You really replace it by new tables=
,
>>> using script-generated initializers. Also it looks like you're doubli=
ng
>>> the data, as the same sets were previously used by pv64/hvm64 and
>>> pv32/hvm32 respectively.
>>
>> Yes, I'll change that paragraph.
>>
>> Regarding having 4 tables on x86 now: merging the pv/hvm tables would =
be
>> possible, but this would add some complexity to the script generating
>> the tables (it should test whether the number of parameters of pv and
>> hvm match). As the tables are present in debug build only I don't thin=
k
>> this is a real issue.
>=20
> Sure, but that imo wants saying in the description.
>=20
>>> Overall, besides these mainly cosmetic aspects the main thing missing=

>>> is an approach to prioritize the handful most frequently used functio=
ns,
>>> for them to be pulled out of the switch() so we don't depend on the
>>> compiler's choice for the order of comparisons done.
>>
>> I have already prepared that step by generating the complete call
>> sequence, so any change for prioritizing some hypercalls can be local =
to
>> the generator script and the used input data.
>>
>> The main question is how to do that. I've collected some hypercall
>> statistics data for PV and PVH guests running some simple tests (once =
a
>> build of the Xen hypervisor, and once a scp of a large file). The data=

>> is split between guest and dom0 (PV) counts. There is no clear "winner=
"
>> which hypercall should be fastest, but several hypercalls are clearly
>> not important.
>>
>> Here is the data:
>>
>> PV-hypercall    PV-guest build   PV-guest scp    dom0 build     dom0 s=
cp
>> mmu_update           186175729           2865         20936        337=
25
>=20
> Builds should be local to the guest and I/O should involve gnttab ops
> but no mmu-update. Hence I have a hard time seeing where the huge
> difference here would be coming from. Did you have any thoughts here?

I think you misunderstood the columns.

The first column of data is the build job running in domU and the number
of hypercalls done by that domU. The 3rd data column is the same test
(build running in domU), but the number of hypercalls done by dom0 (so
pure backend hypercall activity).

The missing gnttab ops on domU side are fine, as granting a page doesn't
require a hypercall.

>=20
>> stack_switch           1273311          62381        108589       2707=
64
>> multicall              2182803             50           302          5=
24
>=20
> A fair amount of the mmu-updates is going to be coming through
> muticalls, I would guess. Priorities therefore may even differ for
> the two separate dispatch points.

I can look into collecting some data here.

>=20
>> update_va_mapping       571868             10            60           =
80
>> xen_version              73061            850           859         54=
32
>> grant_table_op               0              0         35557       1391=
10
>> iret                  75673006         484132        268157       7579=
58
>=20
> The huge differences for builds is puzzling mere here ...
>=20
>> vcpu_op                 453037          71199        138224       3349=
88
>> set_segment_base       1650249          62387        108645       2708=
23
>> mmuext_op             11225681            188          7239         34=
26
>=20
> ... and here as well. Did Dom0 and DomU use identical numbers of
> vCPU-s and identical -j make option values?
>=20
>> sched_op                280153         134645         70729       1379=
43
>> event_channel_op        192327          66204         71409       2141=
91
>> physdev_op                   0              0          7721         43=
15
>> (the dom0 values are for the guest running the build or scp test, so
>> dom0 acting as backend)
>>
>> HVM-hypercall   PVH-guest build    PVH-guest scp
>> vcpu_op                  277684             2324
>> event_channel_op         350233            57383
>> (the related dom0 counter values are in the same range as with the tes=
t
>> running in the PV guest)
>>
>> It should be noted that during boot of the guests the numbers for the =
PV
>> guest are more like the ones for the build test with the exception of
>> iret and sched_op being higher, while for PVH sched_op is by far the
>> most often used hypercall.
>>
>> I'm not sure how to translate those numbers into a good algorithm for
>> generating the call sequence.
>=20
> Well, there's never going to be a clear cut fitting everything, I
> suppose.
>=20
>> I could add priorities to each hypercall in hypercall-defs.c and have =
a
>> cascade of if (likely(foo)) call_foo; else if (likely(bla)) ... else
>> switch(rest).
>=20
> Personally I'd lean to an approach like this one; perhaps there's not
> even a need to specify priorities for every hypercall, but just the
> ones we deem most frequently used?

See my new series.


Juergen

--------------4FA6F6BF4A77DC2BB82D2753
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

--------------4FA6F6BF4A77DC2BB82D2753--

--i04Ga5rNUaNCrjpITRiYr4q99eSemNoke--

--qWMG1BDsL57PVNCnF7C9LUImGuwWqZdXC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGBDRgFAwAAAAAACgkQsN6d1ii/Ey+6
gwgAjeMkHeOxotKTAEs92/pgh8zAKz4ZHWstge8FwwcSHhiy6x3nsicW0Nl/qIRzmtLEfIv5cbfX
HA1yN7/mZCY00KwGzFyM++9g5NEjkRsgOawRkKH82tY3SPyOq5RraPbTTnI55GqR6Q1DNuOsnsEa
9acZH0wHnLtKNm+0lPtoW2vjvqkBELo7Z1jikC3FFPQXdWzerxitlWMOMFEjLYDLttR6zDVAnuou
HpJ3HNE5V5ywo8XaBeCKKEkl8leKWj4kouEkHI/UPY2fwlFay17HLQ7wM/u8KWXNRrlbLpCc/046
F0LBeR4qoBCg1geIE0/nhcqetfAosmbTqRuUfIV7SQ==
=BrIK
-----END PGP SIGNATURE-----

--qWMG1BDsL57PVNCnF7C9LUImGuwWqZdXC--

