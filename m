Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282D542F69B
	for <lists+xen-devel@lfdr.de>; Fri, 15 Oct 2021 17:07:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.210783.367777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOo6-00021n-AV; Fri, 15 Oct 2021 15:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 210783.367777; Fri, 15 Oct 2021 15:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mbOo6-0001z2-7J; Fri, 15 Oct 2021 15:07:38 +0000
Received: by outflank-mailman (input) for mailman id 210783;
 Fri, 15 Oct 2021 15:07:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=esao=PD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mbOo4-0001ys-5C
 for xen-devel@lists.xenproject.org; Fri, 15 Oct 2021 15:07:36 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a00de816-2dc9-11ec-823f-12813bfff9fa;
 Fri, 15 Oct 2021 15:07:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 96A641FD4F;
 Fri, 15 Oct 2021 15:07:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D3F813C25;
 Fri, 15 Oct 2021 15:07:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HMR5GTWZaWFCXgAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 15 Oct 2021 15:07:33 +0000
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
X-Inumbo-ID: a00de816-2dc9-11ec-823f-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634310453; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xPiDGgZf1/Xhaexxhb5+lJmg3U7KAxj1ix3DM0yh+iw=;
	b=fW/wCoImFeZ2wFc+4D4LIqeuzh9yvBrgUordytBOXihjbO+PAf7wm7aavsSDVx4ckIdaXB
	0AcASL+8wRl/LwXJdSy2WTSd3Fr8wAVEKMCTEHoxjL/VB2Dvz8yHE2OFFGz9IJWVRQLnOV
	QC4b1PG/9AiGPV+WpsB+hDVjFdhmCpM=
To: Ian Jackson <iwj@xenproject.org>,
 Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <20211015121409.24434-1-kevin.stefanov@citrix.com>
 <24937.32544.417730.402070@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2] tools/tests: Make E2BIG non-fatal to xenstore unit
 test
Message-ID: <227b70e9-23c1-1aaa-4e77-1c64ba8f24ae@suse.com>
Date: Fri, 15 Oct 2021 17:07:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24937.32544.417730.402070@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Lm90hfZgeWCAMF3pmRhVafx8ot1HI2VNr"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Lm90hfZgeWCAMF3pmRhVafx8ot1HI2VNr
Content-Type: multipart/mixed; boundary="uUOeEvfsRexUssKlieshmLQWNrRTbhGDe";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>,
 Kevin Stefanov <kevin.stefanov@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <227b70e9-23c1-1aaa-4e77-1c64ba8f24ae@suse.com>
Subject: Re: [PATCH v2] tools/tests: Make E2BIG non-fatal to xenstore unit
 test
References: <20211015121409.24434-1-kevin.stefanov@citrix.com>
 <24937.32544.417730.402070@mariner.uk.xensource.com>
In-Reply-To: <24937.32544.417730.402070@mariner.uk.xensource.com>

--uUOeEvfsRexUssKlieshmLQWNrRTbhGDe
Content-Type: multipart/mixed;
 boundary="------------1A74959F423BE42A6DD2FA25"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1A74959F423BE42A6DD2FA25
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 15.10.21 15:16, Ian Jackson wrote:
> Kevin Stefanov writes ("[PATCH v2] tools/tests: Make E2BIG non-fatal to=
 xenstore unit test"):
>> Xenstore's unit test fails on read and write of big numbers if
>> quota-maxsize is set to a lower number than those test cases use.
>>
>> Output a special warning instead of a failure message in such cases
>> and make the error non-fatal to the unit test.
>=20
> I realise that I am late to this, but I'm not sure I agree with the
> basic principle of this change.  In general tolerating particular
> errors in a test, and simply abandoning the test if they occcur, is
> normally not the best approach.
>=20
> Questions that come to my mind (and which aren't answered in the
> commit message and probably should be) include:
>=20
> Why does test-xenstore using these large numbers for its tests ?

For testing large data packets.

> Why would you run the tests with a quota too low for the tests ?

Good question.

> Might this test change not in principle miss genuine bugs ?

Yes, e.g. if a test returns E2BIG even if it shouldn't.

So I agree to being more cautious here.

Maybe a parameter could be added to limit the allowed data size?
Then the "large data" test could be adjusted to not send more data
than allowed (it should be noted that the node size quota is
including data, names of children, and access right entries, so
the pure node data should be selected with some spare size in
mind, e.g. 100 bytes smaller than the quota).


Juergen

--------------1A74959F423BE42A6DD2FA25
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

--------------1A74959F423BE42A6DD2FA25--

--uUOeEvfsRexUssKlieshmLQWNrRTbhGDe--

--Lm90hfZgeWCAMF3pmRhVafx8ot1HI2VNr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFpmTQFAwAAAAAACgkQsN6d1ii/Ey/a
vQf/ekvSODBbnsIuY9lhJkK1osIKM2ROEGpbNcy/lmRr0nlHZcPHSdwCCLOG43tbfugouN78eYY4
pfWHXXXeQT/c8kJPRQMDXUZ81MEtwBrSj916tvxgkfWKhDDpmRQBYv+qqLBU1S4eOPBLRK5Nteqa
D9Wo3gfxHCSMgMn1cdC/YM3KWYh69ZgSd/VK6PUDcf0gmDNfmWWU9mPe3kmiIlA69B63Mlb53hPE
AC1ooaRN2Pjj59oOoTzk4v3JrFzbS7/u4NR1t5uetTip4jA4FEEAskNFtttRxBZKZMRfuxdXq8WQ
5Uc3e1m9/o991/Yt58yvS2rwcuG3NW6FmwLWmi/X6A==
=+U/Y
-----END PGP SIGNATURE-----

--Lm90hfZgeWCAMF3pmRhVafx8ot1HI2VNr--

