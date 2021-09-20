Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 691AE411325
	for <lists+xen-devel@lfdr.de>; Mon, 20 Sep 2021 12:52:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.190739.340513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGu0-0003JS-7H; Mon, 20 Sep 2021 10:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 190739.340513; Mon, 20 Sep 2021 10:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSGu0-0003HX-3s; Mon, 20 Sep 2021 10:52:00 +0000
Received: by outflank-mailman (input) for mailman id 190739;
 Mon, 20 Sep 2021 10:51:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pAY=OK=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mSGty-0003HR-Ei
 for xen-devel@lists.xenproject.org; Mon, 20 Sep 2021 10:51:58 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c63350c6-1a00-11ec-b86e-12813bfff9fa;
 Mon, 20 Sep 2021 10:51:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A640C22040;
 Mon, 20 Sep 2021 10:51:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A32E139F0;
 Mon, 20 Sep 2021 10:51:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 40cEHMxnSGHucwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 20 Sep 2021 10:51:56 +0000
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
X-Inumbo-ID: c63350c6-1a00-11ec-b86e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632135116; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ovsJwCgE2oOX88DPBvaAJ9HrXG+ZgjILiELUqCGyC90=;
	b=GKqF7oCw2HTl3CB5jWEpVQHcgvg7SCmDD0d9cdS2IShPdBxvvzvCKEXNpJzdQH8Q6AeTVH
	HAO2GGovm4bJSWnf7U+Vf0OJCPmVoOlNVTJZHea+IeOna6oYjoT5NPPfN0KRjSUOhm2Bsp
	JWaQRCdWKadPQCPuXFlKq39GqS+irCQ=
Subject: Re: [PATCH DNA 5/6] tools/xenstored: restore support for mapping ring
 as foreign memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-6-roger.pau@citrix.com>
 <b1fb5e04-29a8-c60b-c754-5a4275a0601e@suse.com>
 <YUhlfuPWEqnT0/42@MacBook-Air-de-Roger.local>
From: Juergen Gross <jgross@suse.com>
Message-ID: <1cff7e8e-613f-629e-99b9-0407767900ae@suse.com>
Date: Mon, 20 Sep 2021 12:51:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YUhlfuPWEqnT0/42@MacBook-Air-de-Roger.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="GX7ZRe8wthL4fhbkAXwyuXPehx8Kjc4L5"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--GX7ZRe8wthL4fhbkAXwyuXPehx8Kjc4L5
Content-Type: multipart/mixed; boundary="katGje8aBZw1iHOan691wrfy64l9KqL8g";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Message-ID: <1cff7e8e-613f-629e-99b9-0407767900ae@suse.com>
Subject: Re: [PATCH DNA 5/6] tools/xenstored: restore support for mapping ring
 as foreign memory
References: <20210917154625.89315-1-roger.pau@citrix.com>
 <20210917154625.89315-6-roger.pau@citrix.com>
 <b1fb5e04-29a8-c60b-c754-5a4275a0601e@suse.com>
 <YUhlfuPWEqnT0/42@MacBook-Air-de-Roger.local>
In-Reply-To: <YUhlfuPWEqnT0/42@MacBook-Air-de-Roger.local>

--katGje8aBZw1iHOan691wrfy64l9KqL8g
Content-Type: multipart/mixed;
 boundary="------------2F459516E5B601A825AE7E33"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------2F459516E5B601A825AE7E33
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 20.09.21 12:42, Roger Pau Monn=C3=A9 wrote:
> On Mon, Sep 20, 2021 at 10:24:45AM +0200, Juergen Gross wrote:
>> On 17.09.21 17:46, Roger Pau Monne wrote:
>>> Restore the previous way of mapping the xenstore ring using foreign
>>> memory. Use xenforeignmemory instead of libxc in order to avoid addin=
g
>>> another dependency on a unstable interface.
>>
>> Mapping a guest page via xenforeignmemory is no good move IMO. A guest=

>> not supporting a grant table for security reasons is a rather strange
>> idea, as it needs to trade that for a general memory access by any
>> backend without a way to restrict such accesses. This contradicts one
>> of the main concepts of the Xen security architecture.
>=20
> I've done this in order to be able to assert that the switch to
> disable grant tables was working correctly, I don't intended this
> specific mode to be something that is desirable or that should be used
> in production, but I do think it's useful to be able to create such
> guests in order to assert that the option is taking effect.
>=20
> The main problem of xenstore not being correctly initialized on a
> domain is that the "@introduceDomain" watch doesn't fire, and thus
> other components don't get notified of the newly created domain.
>=20
> This seems to be a limitation of the current design, where the only
> way to get notifications of new domain creation is using
> "@introduceDomain", even when the caller doesn't care of whether the
> created domain as a working xenstore connection.
>=20
> Maybe I can workaround this differently in xenstore, so that the watch
> fires even when the shared xenstore ring cannot be initialized.

Yes, I think this would be the way to go.


Juergen

--------------2F459516E5B601A825AE7E33
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

--------------2F459516E5B601A825AE7E33--

--katGje8aBZw1iHOan691wrfy64l9KqL8g--

--GX7ZRe8wthL4fhbkAXwyuXPehx8Kjc4L5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFIZ8sFAwAAAAAACgkQsN6d1ii/Ey+L
XAf/aTbYYQAEuF8lCaunhhAf2CHcLul3xiEMJSA6Ahbefpp+MSbKSBwpE7xOxRAmwIW8nzUiaW7x
vIpuoOW7z73q6XD/yFfTjwypripPbwu+Q8RKBoV23amiysj7OgxxlNJG3nHGxw0jmTjUmI9G1Yer
4tHYqTGcMkihm94neLrRarE1sEs2RjI1imXLCtXFpu9Pk/Ok+CTI8Zq0u2LB14PkOLx5TfYm/KR+
DMt6PKYa3tkYULhFGB6Rryo0UIbkQO5SkRiVyH4Xl2KNvDw/Y6NzeQWAX7i7pW+ty/IzSoCDG3G9
4NzIEmzoLMZx7qT0XrSesof/EbM6rlCMY0XfxS/k2A==
=dJFI
-----END PGP SIGNATURE-----

--GX7ZRe8wthL4fhbkAXwyuXPehx8Kjc4L5--

