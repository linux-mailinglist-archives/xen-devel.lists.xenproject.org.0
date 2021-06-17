Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8533AAE68
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jun 2021 10:05:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.143733.264775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltn1V-0004eu-6U; Thu, 17 Jun 2021 08:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 143733.264775; Thu, 17 Jun 2021 08:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltn1V-0004bz-2O; Thu, 17 Jun 2021 08:05:13 +0000
Received: by outflank-mailman (input) for mailman id 143733;
 Thu, 17 Jun 2021 08:05:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bffI=LL=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1ltn1T-0004bp-PF
 for xen-devel@lists.xenproject.org; Thu, 17 Jun 2021 08:05:11 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5cec161c-52da-4775-8971-36fb8e7078b7;
 Thu, 17 Jun 2021 08:05:11 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3C4F21FDC4;
 Thu, 17 Jun 2021 08:05:10 +0000 (UTC)
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id EB385118DD;
 Thu, 17 Jun 2021 08:05:09 +0000 (UTC)
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id DiwXODUCy2CHGgAALh3uQQ
 (envelope-from <jgross@suse.com>); Thu, 17 Jun 2021 08:05:09 +0000
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
X-Inumbo-ID: 5cec161c-52da-4775-8971-36fb8e7078b7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623917110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cX/mv8PKPa4tHFaec8ckFRQLOv90EFQmMPQ0u+WxDPg=;
	b=TeYyc2ycfcv4qAGTybc0sIOsp0SeJ4W4MSk/18Xsgg1BHz+3iZ2ryfhdjtJQEzR5NBUYL5
	8z+MilXJiVyYENA7mHu1AYOTehjtYib5G2tv+noiHCUxaZ2C/c7NNXiPiSb4nJMYojFYH3
	HMqhJJhhp2PHxMrLpSoqZjP724NS5cs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1623917110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cX/mv8PKPa4tHFaec8ckFRQLOv90EFQmMPQ0u+WxDPg=;
	b=TeYyc2ycfcv4qAGTybc0sIOsp0SeJ4W4MSk/18Xsgg1BHz+3iZ2ryfhdjtJQEzR5NBUYL5
	8z+MilXJiVyYENA7mHu1AYOTehjtYib5G2tv+noiHCUxaZ2C/c7NNXiPiSb4nJMYojFYH3
	HMqhJJhhp2PHxMrLpSoqZjP724NS5cs=
Subject: Re: hypercalls with 64-bit results
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
 <2adfba14-8adb-89d8-3e8b-a25aef6fc2d6@suse.com>
 <cf751696-5c9b-b465-67d0-544245d8563f@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <75d84a60-1857-f62c-23f5-eb3bfa3b93b2@suse.com>
Date: Thu, 17 Jun 2021 10:05:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <cf751696-5c9b-b465-67d0-544245d8563f@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="R7VCp0nAA68jraq20emljAjH812HxPBif"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R7VCp0nAA68jraq20emljAjH812HxPBif
Content-Type: multipart/mixed; boundary="34PJlwSh19z5tPPbrCtPPgT0hNktS5zgB";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <75d84a60-1857-f62c-23f5-eb3bfa3b93b2@suse.com>
Subject: Re: hypercalls with 64-bit results
References: <71b8a4f1-9c18-36e7-56b1-3f1b1dabddd6@suse.com>
 <2adfba14-8adb-89d8-3e8b-a25aef6fc2d6@suse.com>
 <cf751696-5c9b-b465-67d0-544245d8563f@suse.com>
In-Reply-To: <cf751696-5c9b-b465-67d0-544245d8563f@suse.com>

--34PJlwSh19z5tPPbrCtPPgT0hNktS5zgB
Content-Type: multipart/mixed;
 boundary="------------FB86F1DDFC7E319F7301ED11"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FB86F1DDFC7E319F7301ED11
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 17.06.21 10:00, Jan Beulich wrote:
> On 17.06.2021 06:55, Juergen Gross wrote:
>> On 16.06.21 18:04, Jan Beulich wrote:
>>> Since hypercalls from the tool stack are based on ioctl(), and since
>>> ioctl() has a return type of "int", I'm afraid there's no way we can
>>> deal with this by adjusting function return types in the libraries.
>>> Instead we appear to need either a new privcmd ioctl or new XENMEM_*
>>> subops (for those cases where potentially large values get returned).=

>>
>> I think we can just use a multicall in libxc to wrap the affected
>> operations.
>=20
> Hmm, we might, if we're happy for these to then not work in HVM domains=

> (PVH Dom0, which still is experimental only, or PVH/HVM DomU-s using
> the libraries for some purpose), or if we finally wire up multicalls in=

> the HVM case (there ought to be a reason why they aren't, but I have no=

> idea what that is).

Me neither, especially as on Arm they are supported.

And TBH: PVH Dom0 without multicalls might be hard anyway.


Juergen

--------------FB86F1DDFC7E319F7301ED11
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

--------------FB86F1DDFC7E319F7301ED11--

--34PJlwSh19z5tPPbrCtPPgT0hNktS5zgB--

--R7VCp0nAA68jraq20emljAjH812HxPBif
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDLAjUFAwAAAAAACgkQsN6d1ii/Ey+T
xwf/Tg5TXSMDKHRfRkDgWJ0BjiW2YC1pxvEP9ovl4Qg6JT1/ki+nO5e2IpRXLHxg9kuclIOGhhQ2
7Y00Q5MfBC2nTvwTUzLMyrVbeTIJLnyBcL6ELLoDOhyW/sU+SOU6V57JkEdV4fkyOCfoiKEkKhyp
ROxZIykQOmSnNyBfsmJDgDcB1cRR4GmzgJ27yBDIhu+yHtXii+xYKquZDW14U5sJT2jY1G+A5rJO
ml4EDNZsmxTO+MI9wItCWIW+KsemHLnU/1oDcigqVYpvGNoZUP4pxzuHZjIWJwr1eVgJ+nCOzKxf
MWDJy9PlZz5Sg4WAW5osEGbTIwwKspg5Ejtw6MDWow==
=XFsu
-----END PGP SIGNATURE-----

--R7VCp0nAA68jraq20emljAjH812HxPBif--

