Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 676BA46970D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 14:30:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.238915.414070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE4T-0002yW-F7; Mon, 06 Dec 2021 13:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 238915.414070; Mon, 06 Dec 2021 13:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muE4T-0002vj-BL; Mon, 06 Dec 2021 13:30:21 +0000
Received: by outflank-mailman (input) for mailman id 238915;
 Mon, 06 Dec 2021 13:30:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9VqD=QX=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1muE4S-0002vN-4o
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 13:30:20 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7af0572-5698-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 14:30:19 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id AFF9921138;
 Mon,  6 Dec 2021 13:30:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79B1D13BAE;
 Mon,  6 Dec 2021 13:30:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id qh0KHGoQrmFAIAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 06 Dec 2021 13:30:18 +0000
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
X-Inumbo-ID: a7af0572-5698-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1638797418; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rjH3GlR6qZT+gmpjB2DhmHifnrM7sEnhkVMQpV3UbrE=;
	b=gS6adLdFpQXfcIb97KxYBNFuK2u8R+zBKWC7a2XW9CMfeRrykQBu3V2raxnNFjdw1EFmoK
	+lECzyB3BGaNGHJawdRoplBik6ZGfVN3Q72zf6MxbskPRpEYoPP8PaxdDB+9rlbWocvNRp
	svgM+2KCXB2kAWQMkQQ4e8MPeIP55qM=
Subject: Re: [PATCH] mini-os: support event channel 0 for console
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206124612.24758-1-jgross@suse.com>
 <39a4ae01-7ea9-7526-74da-1fea71274890@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e3a098f7-e296-de04-889b-3983d23e58c5@suse.com>
Date: Mon, 6 Dec 2021 14:30:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <39a4ae01-7ea9-7526-74da-1fea71274890@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0yj4b187kHHxs2gYxzlqTiOSZhnZSWTHm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0yj4b187kHHxs2gYxzlqTiOSZhnZSWTHm
Content-Type: multipart/mixed; boundary="Ppp2vYvGThO8wQQ2EBYyUaL68OiVZg9IC";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: samuel.thibault@ens-lyon.org, wl@xen.org,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org
Message-ID: <e3a098f7-e296-de04-889b-3983d23e58c5@suse.com>
Subject: Re: [PATCH] mini-os: support event channel 0 for console
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206124612.24758-1-jgross@suse.com>
 <39a4ae01-7ea9-7526-74da-1fea71274890@suse.com>
In-Reply-To: <39a4ae01-7ea9-7526-74da-1fea71274890@suse.com>

--Ppp2vYvGThO8wQQ2EBYyUaL68OiVZg9IC
Content-Type: multipart/mixed;
 boundary="------------2BC56277A4C35AB15AE644E2"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2BC56277A4C35AB15AE644E2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 06.12.21 14:24, Jan Beulich wrote:
> On 06.12.2021 13:46, Juergen Gross wrote:
>> The console event channel might be 0 for the console, so use the value=

>> of ~0 as invalid instead.
>=20
> I may be missing something mini-os specific here, but in Xen channel 0
> is always invalid. It's not just here that this value would be used as
> a sentinel.

Maybe this is a special case for Xenstore stubdom. Without this change
I can't connect to the console when the system is up, with this patch
it is possible.


Juergen

--------------2BC56277A4C35AB15AE644E2
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

--------------2BC56277A4C35AB15AE644E2--

--Ppp2vYvGThO8wQQ2EBYyUaL68OiVZg9IC--

--0yj4b187kHHxs2gYxzlqTiOSZhnZSWTHm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGuEGkFAwAAAAAACgkQsN6d1ii/Ey+U
2gf/QyjWryYWgG4hsAgy3ipz3es5FZ5ydqr/7kmBNEpyn89hb4XemnnrBpT1D61h/deoUH/i6qII
OyM6GQWfCPUPSTDXXffU1BV+RrbWpXxMbKgGlW8xJAdopuHRPk8DhM3UOqVfHtR+oC6rEuHWDAWm
sIJkFvnaQ8JEXgYdwBKhsp1F7ET3zr25eGWZy3YEtJd51Mw5/qipJCz33pOZg28Fadx97S8mMxnI
GSPYf2Siz7kAZEkLx6p750ErOIXO2m3+lc3Aiws1YL50sWkpi47Tw53Q+ulVz2Yv8SGp+0HNqoHR
bHerv1WGQ0uMKG4ymJYpt7kQSziu02ElD/Oe4OXVfQ==
=OwFN
-----END PGP SIGNATURE-----

--0yj4b187kHHxs2gYxzlqTiOSZhnZSWTHm--

