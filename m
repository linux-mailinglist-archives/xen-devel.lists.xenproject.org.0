Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF703A663C
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jun 2021 14:06:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.141377.261161 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslMB-0007xI-L7; Mon, 14 Jun 2021 12:06:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 141377.261161; Mon, 14 Jun 2021 12:06:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lslMB-0007uc-Gq; Mon, 14 Jun 2021 12:06:19 +0000
Received: by outflank-mailman (input) for mailman id 141377;
 Mon, 14 Jun 2021 12:06:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Pv4=LI=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1lslM9-0007uW-I5
 for xen-devel@lists.xenproject.org; Mon, 14 Jun 2021 12:06:17 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 49bdc282-99fa-45b9-9bca-b08e4ca42933;
 Mon, 14 Jun 2021 12:06:16 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 97D881FD33;
 Mon, 14 Jun 2021 12:06:15 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 6969B118DD;
 Mon, 14 Jun 2021 12:06:15 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 9tYiGDdGx2CiKAAALh3uQQ
 (envelope-from <jgross@suse.com>); Mon, 14 Jun 2021 12:06:15 +0000
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
X-Inumbo-ID: 49bdc282-99fa-45b9-9bca-b08e4ca42933
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623672375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bWA9byQYGvx3i/KMZ+TS2SFSHdemHYmaBgI1QZEX+u4=;
	b=gcoIypOD6iWK7f5RTn0IhinpGco+zN0w9CcVb5zaxj2+OBNEhH2PlNZEogpjYRtWWSmATv
	UZdNLVmZnE6JI6LWC68SRq0B16UQnCP0LeQEInblsI3F+OIsg+MbEm553+6ePc2NgNHCco
	eBwBs4H5B2ON5u9Ehyto7EBkU824bXU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623672375; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bWA9byQYGvx3i/KMZ+TS2SFSHdemHYmaBgI1QZEX+u4=;
	b=gcoIypOD6iWK7f5RTn0IhinpGco+zN0w9CcVb5zaxj2+OBNEhH2PlNZEogpjYRtWWSmATv
	UZdNLVmZnE6JI6LWC68SRq0B16UQnCP0LeQEInblsI3F+OIsg+MbEm553+6ePc2NgNHCco
	eBwBs4H5B2ON5u9Ehyto7EBkU824bXU=
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
References: <osstest-162771-mainreport@xen.org>
 <78aa2d24-3e2a-01cd-4596-e2796b4432a7@suse.com>
 <7dd0b271-7904-0316-2b4f-00d5eaa78bf4@suse.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [xen-unstable test] 162771: regressions - FAIL
Message-ID: <f3eca526-0669-3c2a-6d3b-40e69deef288@suse.com>
Date: Mon, 14 Jun 2021 14:06:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <7dd0b271-7904-0316-2b4f-00d5eaa78bf4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="xHLWCXlJnTyOvCdbeoZrOQgQIz5krIdsS"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--xHLWCXlJnTyOvCdbeoZrOQgQIz5krIdsS
Content-Type: multipart/mixed; boundary="b44jQHhricizJZePUmUuSOCfJ5494ZNSi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org
Message-ID: <f3eca526-0669-3c2a-6d3b-40e69deef288@suse.com>
Subject: Re: [xen-unstable test] 162771: regressions - FAIL
References: <osstest-162771-mainreport@xen.org>
 <78aa2d24-3e2a-01cd-4596-e2796b4432a7@suse.com>
 <7dd0b271-7904-0316-2b4f-00d5eaa78bf4@suse.com>
In-Reply-To: <7dd0b271-7904-0316-2b4f-00d5eaa78bf4@suse.com>

--b44jQHhricizJZePUmUuSOCfJ5494ZNSi
Content-Type: multipart/mixed;
 boundary="------------388BBEC2B8EF8B7B53A46B53"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------388BBEC2B8EF8B7B53A46B53
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 14.06.21 13:58, Jan Beulich wrote:
> On 14.06.2021 08:41, Juergen Gross wrote:
>> On 14.06.21 04:21, osstest service owner wrote:
>>> flight 162771 xen-unstable real [real]
>>> flight 162783 xen-unstable real-retest [real]
>>> http://logs.test-lab.xenproject.org/osstest/logs/162771/
>>> http://logs.test-lab.xenproject.org/osstest/logs/162783/
>>>
>>> Regressions :-(
>>>
>>> Tests which did not succeed and are blocking,
>>> including tests which could not be run:
>>>    test-amd64-amd64-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REG=
R. vs. 162533
>>>    test-amd64-i386-xl-qemuu-ovmf-amd64 15 guest-saverestore fail REGR=
=2E vs. 162533
>>>    test-amd64-amd64-i386-pvgrub 17 guest-localmigrate       fail REGR=
=2E vs. 162533
>>>    test-amd64-amd64-amd64-pvgrub 17 guest-localmigrate      fail REGR=
=2E vs. 162533
>>
>> Hmm, this is rather unfortunate.
>>
>> Those last 2 tests failed due to commit 7bd8989ab77b6ade3b, but just
>> reverting that patch doesn't seem right to me either.
>>
>> The Linux kernel has a bug here: it will initially set max_pfn in the
>> shared_info page to the size of the p2m_list (so my reasoning for abov=
e
>> patch was wrong in this case), but when growing the p2m_list (e.g. due=

>> to ballooning or grant mapping), it will store a real pfn number in
>> max_pfn. But even this pfn might be wrong, as only the pfn leading to
>> allocation of a new p2m page will be stored in max_pfn, any higher new=

>> pfn having its p2m entry in the new p2m page won't result in a new
>> max_pfn entry.
>>
>> As a result I think the only sane handling would be to assume the
>> max_pfn value read from the shared_info page is really a pfn.
>=20
> This would be contrary to the public interface header having
>=20
>      /*
>       * Number of valid entries in the p2m table(s) anchored at
>       * pfn_to_mfn_frame_list_list and/or p2m_vaddr.
>       */
>      unsigned long max_pfn;
>=20
> IOW the name containing "max" is misleading (should be "num" or
> alike), but there's no room imo to change this.

Oh, how nice! :-(

I have let myself been fooled by the correctly named max_pfn field in
libxenguest, together with the wrong usage in the kernel.

>=20
>> This
>> value should be adjusted to specify the last pfn of the related p2m
>> page, and the resulting last p2m page should be tolerated to not be
>> valid.
>>
>> Another variant would be to just revert above commit and modify the
>> semantics of max_pfn in the shared_info page to really mean max_pfn+1.=

>=20
> But that's what it is already, according to the comment. Are you
> suggesting there was code prior to the change you've quoted that
> already violated this (in Xen or the tool stack, that is, not
> the issue you suggest has been present in Linux)?

Reading the comment would have helped.

So a plain revert is the way to go.


Juergen

--------------388BBEC2B8EF8B7B53A46B53
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

--------------388BBEC2B8EF8B7B53A46B53--

--b44jQHhricizJZePUmUuSOCfJ5494ZNSi--

--xHLWCXlJnTyOvCdbeoZrOQgQIz5krIdsS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDHRjYFAwAAAAAACgkQsN6d1ii/Ey/I
TAf+L+99a6/YVzz0JI4PXMy+nY8af8g5aJza54IZeAJN/xKGYZ7z/VREPSAyJ75xLmi9RDrsa3Du
0ave4kd/KmHxgYhewHcybD2I1fkLJEJ+NfcIkAGgwYwNiQu5cmnychPNSkWCpK096tW0PqWj+GSy
5iP5Dq4hMJIscFI2RE3fGxR1ZZNtdq3B+4cJi4Vj+X8JGQJvQjqF/5GwCn6cQwCngTpaNR9HE+8c
ECz7q1k9bIjS0we//q7z1yR6BNLbQTMaMo9CfquHOKuM6StotwY5GZolZm8nBDExhW56F1M5oEEc
yIFO9MlV7RsmrEoXNpJzLPWGuPaesN5t5F0zkqdW3g==
=Mybk
-----END PGP SIGNATURE-----

--xHLWCXlJnTyOvCdbeoZrOQgQIz5krIdsS--

