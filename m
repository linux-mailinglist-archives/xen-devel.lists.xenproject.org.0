Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6353BBA08
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jul 2021 11:16:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149964.277354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Kid-0000kU-2R; Mon, 05 Jul 2021 09:16:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149964.277354; Mon, 05 Jul 2021 09:16:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0Kic-0000iY-Vb; Mon, 05 Jul 2021 09:16:46 +0000
Received: by outflank-mailman (input) for mailman id 149964;
 Mon, 05 Jul 2021 09:16:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cjuk=L5=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1m0Kib-0000iO-H4
 for xen-devel@lists.xenproject.org; Mon, 05 Jul 2021 09:16:45 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b9e2d87c-01f7-4094-831c-083a1ba081fa;
 Mon, 05 Jul 2021 09:16:44 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05DDC22622;
 Mon,  5 Jul 2021 09:16:44 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id AFAA6139A1;
 Mon,  5 Jul 2021 09:16:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id TuELKfvN4mARSAAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 05 Jul 2021 09:16:43 +0000
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
X-Inumbo-ID: b9e2d87c-01f7-4094-831c-083a1ba081fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1625476604; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FKzinTSRNuqJ/0cne276ylTKasgO+NhrI52GsfjHrsc=;
	b=dfAa3dfanPAOQ3AV3UxbeqjaZz7cHclNR5QejhMWNf8TWXWMvY8y/o47a/c/vIoh1E5TlR
	4uB7/ugslreIsPPddQM6By3gTvOt2rAHN58wYvQtPjgxfU3A3xS5X/kvk8NWvvP3ZU/VMQ
	rm3P7M6EQAywv0bdvqAQ8ZJIPF+hf2Y=
Subject: Re: [PATCH] xen/events: reset active flag for lateeoi events later
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
References: <20210623130913.9405-1-jgross@suse.com>
 <41f6aeaa-583f-9b00-7789-d8a6f751b49d@citrix.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <f8f83223-061c-84cf-41c6-cc64e8aedfcc@suse.com>
Date: Mon, 5 Jul 2021 11:16:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <41f6aeaa-583f-9b00-7789-d8a6f751b49d@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="x1aACQPEPpalHO3aMzmGsOJpPFY7hqvjU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--x1aACQPEPpalHO3aMzmGsOJpPFY7hqvjU
Content-Type: multipart/mixed; boundary="NyN0xPKmib9zdzVTUVSMxwGt6rt4Q0QBd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ross Lagerwall <ross.lagerwall@citrix.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Message-ID: <f8f83223-061c-84cf-41c6-cc64e8aedfcc@suse.com>
Subject: Re: [PATCH] xen/events: reset active flag for lateeoi events later
References: <20210623130913.9405-1-jgross@suse.com>
 <41f6aeaa-583f-9b00-7789-d8a6f751b49d@citrix.com>
In-Reply-To: <41f6aeaa-583f-9b00-7789-d8a6f751b49d@citrix.com>

--NyN0xPKmib9zdzVTUVSMxwGt6rt4Q0QBd
Content-Type: multipart/mixed;
 boundary="------------0DCB1735DA5DDD533E680C3E"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------0DCB1735DA5DDD533E680C3E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 05.07.21 11:00, Ross Lagerwall wrote:
> On 2021-06-23 14:09, Juergen Gross wrote:
>> In order to avoid a race condition for user events when changing
>> cpu affinity reset the active flag only when EOI-ing the event.
>>
>> This is working fine as all user events are lateeoi events. Note that
>> lateeoi_ack_mask_dynirq() is not modified as there is no explicit call=

>> to xen_irq_lateeoi() expected later.
>>
>> Reported-by: Julien Grall <julien@xen.org>
>> Fixes: b6622798bc50b62 ("xen/events: avoid handling the same event on =
two cpus at the same time")
>> Tested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>=20
> Hi Juergen,
>=20
> Are you planning on backporting this fix to releases <=3D 5.10?

It is on my todo list. :-)


Juergen

--------------0DCB1735DA5DDD533E680C3E
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

--------------0DCB1735DA5DDD533E680C3E--

--NyN0xPKmib9zdzVTUVSMxwGt6rt4Q0QBd--

--x1aACQPEPpalHO3aMzmGsOJpPFY7hqvjU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmDizfsFAwAAAAAACgkQsN6d1ii/Ey8g
AQf/S8AU56191xN6vEeRnV0l+vdq5e2nMzj8f13Y8Cfk1ZPmQIru3bza+8f4Pny87w6Z4EVnX5lc
EytV0p5hPRmaNh29zzTr9ubgSzScztsnqJJCGut5MDAfvU1oJMIdGcAss1RHCWhYRh3eVKlCe4NO
EYqu/+AJ/Wf0bVoo7XDCfvlwHviFWMJc8ucgde+ba8BflMwQEM+Zwuox+88iZm/8Zc+JI6ouZjkg
g87FKsVkhXZFK7IEHgMMh9zwbcsW6cnnp8iSYYMg9tOmv2SXdVoN+hUNbNrb0BrAEFjr5N+I6ZPY
a0/EYlY+ZrEhDbD5NW2NFFUO/rXz8pY36vN37tec2g==
=u8FY
-----END PGP SIGNATURE-----

--x1aACQPEPpalHO3aMzmGsOJpPFY7hqvjU--

