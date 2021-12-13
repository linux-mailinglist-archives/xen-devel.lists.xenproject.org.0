Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF5F473011
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 16:05:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246169.424588 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwmtP-0000Ko-Ut; Mon, 13 Dec 2021 15:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246169.424588; Mon, 13 Dec 2021 15:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwmtP-0000I8-Rt; Mon, 13 Dec 2021 15:05:31 +0000
Received: by outflank-mailman (input) for mailman id 246169;
 Mon, 13 Dec 2021 15:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/ja4=Q6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mwmtP-0000I2-4f
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 15:05:31 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c3cba0d-5c26-11ec-9e60-abaf8a552007;
 Mon, 13 Dec 2021 16:05:30 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3BBE8210F2;
 Mon, 13 Dec 2021 15:05:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B19813DE2;
 Mon, 13 Dec 2021 15:05:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iAxvBTlht2FOOwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Dec 2021 15:05:29 +0000
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
X-Inumbo-ID: 1c3cba0d-5c26-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639407929; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=43WTY6tloIhb+jp532ffO8lA63mPUVPlnlIrFB+zC54=;
	b=OuA1JUzGIkvlxq6t9LS1DvaihY0uIPZjo0qWbasVxtJf39XovX4PzkaDDccOtPxc3ojCJU
	Z66caCfB9ILqFADQ+mw2UnkUIQP7annmLgHr6youiRpdrt6aIqbGQ0m8utt21nOceE+xbY
	rvbFGvatNFTTrLTa/m/nqmoAKFxLm+w=
Subject: Re: [PATCH 04/10] mini-os: respect memory map when ballooning up
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-5-jgross@suse.com>
 <20211212002624.fmmebrd5sudcmco4@begin>
From: Juergen Gross <jgross@suse.com>
Message-ID: <0b7c86f2-bddd-b650-ed58-7e69e1b1c58e@suse.com>
Date: Mon, 13 Dec 2021 16:05:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211212002624.fmmebrd5sudcmco4@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="1WhaJPULB0DvvgYmQAFFoXOhtEQXABxqT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--1WhaJPULB0DvvgYmQAFFoXOhtEQXABxqT
Content-Type: multipart/mixed; boundary="LYk1sPWTt3gNdeLkHnL5vpHg85ia8zJ0d";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <0b7c86f2-bddd-b650-ed58-7e69e1b1c58e@suse.com>
Subject: Re: [PATCH 04/10] mini-os: respect memory map when ballooning up
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-5-jgross@suse.com>
 <20211212002624.fmmebrd5sudcmco4@begin>
In-Reply-To: <20211212002624.fmmebrd5sudcmco4@begin>

--LYk1sPWTt3gNdeLkHnL5vpHg85ia8zJ0d
Content-Type: multipart/mixed;
 boundary="------------4A99575EED9A2156AA6E4B7A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4A99575EED9A2156AA6E4B7A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.12.21 01:26, Samuel Thibault wrote:
> Juergen Gross, le lun. 06 d=C3=A9c. 2021 08:23:31 +0100, a ecrit:
>> @@ -81,8 +93,11 @@ int balloon_up(unsigned long n_pages)
>>       if ( n_pages > N_BALLOON_FRAMES )
>>           n_pages =3D N_BALLOON_FRAMES;
>>  =20
>> +    start_pfn =3D e820_get_maxpfn(nr_mem_pages + 1) - 1;
>> +    n_pages =3D e820_get_max_pages(start_pfn, n_pages);
>=20
> I'd say call it e820_get_max_contig_pages?

Fine with me.

>=20
>> +unsigned long e820_get_max_pages(unsigned long pfn, unsigned long pag=
es)
>> +{
>> +    int i;
>> +    unsigned long end;
>> +
>> +    for ( i =3D 0; i < e820_entries; i++ )
>> +    {
>> +        if ( e820_map[i].type !=3D E820_RAM ||
>> +             (e820_map[i].addr >> PAGE_SHIFT) > pfn )
>> +            continue;
>=20
> "> pfn" looks odd to me? If the start of the e820 entry is already
> beyond pfn, we'll never find any other entry. We however do want to ski=
p
> entries that have addr+size that is below pfn.

Oh, you are right.


Juergen

--------------4A99575EED9A2156AA6E4B7A
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

--------------4A99575EED9A2156AA6E4B7A--

--LYk1sPWTt3gNdeLkHnL5vpHg85ia8zJ0d--

--1WhaJPULB0DvvgYmQAFFoXOhtEQXABxqT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG3YTgFAwAAAAAACgkQsN6d1ii/Ey+2
pggAnxeSG75rqOP2q1dPe7mqOcmTzY9k2hJfVUUh9zPznzcxX0Sjul6BAO3CKlxYmlYKNngr4atA
sMK7YfUPWkVKykfSyyh1dKgMisLxtvwo+4jRoyoLU3KYlCizNgAE9zp/8JQRWtlE4p/BCnhgrIKw
l3mn7H+bvh52foABAb5BnAtVRRUEk1DWJ/oPPJv6LA8qCvflFjOKQRbw6PfFGArl2Eh1zV84bUZX
XLqkh0F1W8fgRmUaWey54fqGbQkUtNGL9LWijGuncVsS3mKAu4yut1wnh8vjkK/5SCIE9lx/ECWm
bZzrsjOMiVfMhNXd1LW/ulfWNZF4MfozA+qmw6xIjw==
=Ujo7
-----END PGP SIGNATURE-----

--1WhaJPULB0DvvgYmQAFFoXOhtEQXABxqT--

