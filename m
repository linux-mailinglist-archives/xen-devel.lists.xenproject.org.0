Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9091245EA3B
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 10:22:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232443.402987 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqXQP-0008Ek-N8; Fri, 26 Nov 2021 09:21:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232443.402987; Fri, 26 Nov 2021 09:21:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqXQP-0008CH-K5; Fri, 26 Nov 2021 09:21:45 +0000
Received: by outflank-mailman (input) for mailman id 232443;
 Fri, 26 Nov 2021 09:21:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8kDD=QN=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mqXQO-0008C9-2O
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 09:21:44 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 438b11e1-4e9a-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 10:21:41 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 637861FD37;
 Fri, 26 Nov 2021 09:21:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 290EC13BAE;
 Fri, 26 Nov 2021 09:21:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r8gUCCanoGGvPAAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 26 Nov 2021 09:21:42 +0000
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
X-Inumbo-ID: 438b11e1-4e9a-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1637918502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=B2xRYrmkoHHoZx4GV6/uurVwkzkoQG2PWMZAbB3v8Rs=;
	b=rWAgmFqcFNNx2tdko+V6clnKGgNm1YT1iMNTMRDi9WPiQFd0DSYBociGDscftqdxNUlwSi
	gNHx38nON+BDLoJhMkXlmvSTcLamoiShLVhjgEPUxEBLyRp5CJe94fOeLgeTQMAJ6xHUxM
	SGaiGdfuRAih0TJTYLibQ6KZleIJio4=
Subject: Re: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
References: <20211126065547.22644-1-jgross@suse.com>
 <4afcdfb2-cdab-a019-7541-598917bc4592@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <66843af2-d653-39ef-504c-46342507faab@suse.com>
Date: Fri, 26 Nov 2021 10:21:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4afcdfb2-cdab-a019-7541-598917bc4592@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bOXcR9RXoDHdTNCU9Vo3Iz1hvHqISItCa"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bOXcR9RXoDHdTNCU9Vo3Iz1hvHqISItCa
Content-Type: multipart/mixed; boundary="nyWnGDeCuGKssSIuXO8euLW4CqHRBtMa6";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>,
 Simon Kuenzer <simon.kuenzer@neclab.eu>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Message-ID: <66843af2-d653-39ef-504c-46342507faab@suse.com>
Subject: Re: [PATCH] public: add RING_NR_UNCONSUMED_*() macros to ring.h
References: <20211126065547.22644-1-jgross@suse.com>
 <4afcdfb2-cdab-a019-7541-598917bc4592@suse.com>
In-Reply-To: <4afcdfb2-cdab-a019-7541-598917bc4592@suse.com>

--nyWnGDeCuGKssSIuXO8euLW4CqHRBtMa6
Content-Type: multipart/mixed;
 boundary="------------3385736B0DB33F8B7E8B77D9"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------3385736B0DB33F8B7E8B77D9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 26.11.21 10:17, Jan Beulich wrote:
> On 26.11.2021 07:55, Juergen Gross wrote:
>> Today RING_HAS_UNCONSUMED_*() macros are returning the number of
>> unconsumed requests or responses instead of a boolean as the name of
>> the macros would imply.
>>
>> As this "feature" is already being used, rename the macros to
>> RING_NR_UNCONSUMED_*() and define the RING_HAS_UNCONSUMED_*() macros
>> by using the new RING_NR_UNCONSUMED_*() macros. In order to avoid
>> future misuse let RING_HAS_UNCONSUMED_*() really return a boolean.
>=20
> I don't think we can go this far; consumers of our headers may choose
> to do so, but anyone taking the headers verbatim would be at risk of
> getting screwed if they had any instance of abuse in their trees. IOW
> I think the original-name macros ought to be direct aliases of the
> new-name ones, and only in Linux'es clone you could then go further.

Fine with me. I'm inclined to add a comment hinting at that possibility
then.


Juergen

--------------3385736B0DB33F8B7E8B77D9
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

--------------3385736B0DB33F8B7E8B77D9--

--nyWnGDeCuGKssSIuXO8euLW4CqHRBtMa6--

--bOXcR9RXoDHdTNCU9Vo3Iz1hvHqISItCa
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGgpyUFAwAAAAAACgkQsN6d1ii/Ey/K
4wgAhmFMEaUdVT27s1ZBA7MCytdIZYgqRd/eK7ZKo/nufdX0yuMxfNQ8AZf/4n1vZRKDmSfCKjGk
c0A+HRAOEOUYpLzVizvo5RMqAvhb3YtjQ0J1itlksuEf9CuamdVDHyfKuJMtaepGUHecNfTJOD81
brpFxCXFdxvGfIBXBXkPZKlevuiMxUWllZwRUi/y8NgnZbooDfWqG8i5QGtPrWpBYZx3WAneYgey
UdfYQW5Or301aLO7FYp2JWtL99lH3mR7JgakWoDf9NEBjj2FBE5BCAOjDk0SDSqkp9shDhYcWUIT
PjVZUKCPA6jQJ+47H05NDxQDhDCxhVyOaFwx5W0Xbg==
=zFYz
-----END PGP SIGNATURE-----

--bOXcR9RXoDHdTNCU9Vo3Iz1hvHqISItCa--

