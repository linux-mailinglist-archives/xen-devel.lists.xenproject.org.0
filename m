Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93949472FE6
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 15:59:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246154.424567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwmn8-0006Xw-TC; Mon, 13 Dec 2021 14:59:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246154.424567; Mon, 13 Dec 2021 14:59:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwmn8-0006VO-Pv; Mon, 13 Dec 2021 14:59:02 +0000
Received: by outflank-mailman (input) for mailman id 246154;
 Mon, 13 Dec 2021 14:59:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/ja4=Q6=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1mwmn7-0006So-07
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 14:59:01 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 339600a0-5c25-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 15:58:59 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F19AE1F3B9;
 Mon, 13 Dec 2021 14:58:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CBA1413DE2;
 Mon, 13 Dec 2021 14:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kGmFL7Jft2F9OAAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 13 Dec 2021 14:58:58 +0000
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
X-Inumbo-ID: 339600a0-5c25-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1639407538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zurqn5UDxl0JDJcf5v6FfEBfec82sylpyBbRFRa/6YI=;
	b=CxhDNSX8FinoGB1L5cZc/lxKYuF3qhjYRmnVix9nq9ESMVHV7zBvKT1Y/y6aR60zIJUU27
	u0FhlbNKHTk2jXqClGrNKzvRk0XbmYqKpMGxrz87pUSzb4y+SY06P9pQp2uPCkw3WTktxT
	Pbxm4xESdSbGSRe0NAyxP+YLELOc0Dk=
Subject: Re: [PATCH 03/10] mini-os: don't assume contiguous RAM when
 initializing in PVH mode
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-4-jgross@suse.com>
 <20211212001542.qhz7wfdwq7k5ymxr@begin>
From: Juergen Gross <jgross@suse.com>
Message-ID: <e44571e4-ba85-06a4-99b2-648d94e9af8c@suse.com>
Date: Mon, 13 Dec 2021 15:58:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20211212001542.qhz7wfdwq7k5ymxr@begin>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5l2iD5t6rMNHYWVMtsa1YRUnFkiq12ncu"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5l2iD5t6rMNHYWVMtsa1YRUnFkiq12ncu
Content-Type: multipart/mixed; boundary="e3LXZZSMPTqrrIGTauAXG641EU8VjabVd";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wl@xen.org
Message-ID: <e44571e4-ba85-06a4-99b2-648d94e9af8c@suse.com>
Subject: Re: [PATCH 03/10] mini-os: don't assume contiguous RAM when
 initializing in PVH mode
References: <20211206072337.9517-1-jgross@suse.com>
 <20211206072337.9517-4-jgross@suse.com>
 <20211212001542.qhz7wfdwq7k5ymxr@begin>
In-Reply-To: <20211212001542.qhz7wfdwq7k5ymxr@begin>

--e3LXZZSMPTqrrIGTauAXG641EU8VjabVd
Content-Type: multipart/mixed;
 boundary="------------268835E92D5168298BA9F1DE"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------268835E92D5168298BA9F1DE
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 12.12.21 01:15, Samuel Thibault wrote:
> Juergen Gross, le lun. 06 d=C3=A9c. 2021 08:23:30 +0100, a ecrit:
>> -    unsigned long pfn, max =3D 0;
>> +    unsigned long pfns, max =3D 0;
>=20
> I'd say rather rename max to start.
>=20
>>       e820_get_memmap();
>>  =20
>> @@ -166,9 +166,12 @@ unsigned long e820_get_maxpfn(void)
>>       {
>>           if ( e820_map[i].type !=3D E820_RAM )
>>               continue;
>> -        pfn =3D (e820_map[i].addr + e820_map[i].size) >> PAGE_SHIFT;
>> -        if ( pfn > max )
>> -            max =3D pfn;
>> +        pfns =3D e820_map[i].size >> PAGE_SHIFT;
>> +        max =3D e820_map[i].addr >> PAGE_SHIFT;
>=20
> since it's it's always the start of the e820 entry.
>=20
>> +        if ( pages <=3D pfns )
>> +            return max + pages;
>> +        pages -=3D pfns;
>> +        max +=3D pfns;
>=20
> Here we don't need do change max, only pages.

It is needed in case the loop is finished.

And this was the reason for naming it max.


Juergen

--------------268835E92D5168298BA9F1DE
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

--------------268835E92D5168298BA9F1DE--

--e3LXZZSMPTqrrIGTauAXG641EU8VjabVd--

--5l2iD5t6rMNHYWVMtsa1YRUnFkiq12ncu
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmG3X7IFAwAAAAAACgkQsN6d1ii/Ey/o
5Af+NX88Uja52iDBy4HAhF+kUjk2NNlsKfBnbQHQn3ZI9aJKdD8CAunZO3UJMUWeAAOdkrRWehHR
k/wIIMkJgxP7AA0autwMaG2jQhNE4sP8uq533wj9P7tz0emuGMe8tNdmUbOyjy1Ha130cNrsf6Ca
oC9nDTq0p9LAJ/T9hfbdYKk52Ip1UUP6ceaRzZEWJFPuLoofekm7Apda3K/KTw2iOZgkc2rUjhEM
bw6dd8FXsHhSBg+Jo3KJA+Ig4PZKItiAQOMS3iy3et+zGKvF1/VTezNHd3CMKgV+H/KhrymIJkbG
XdYG1bsdSTXJikBcYzqegb6HygIZxNx5QjtNBjSXUg==
=0t8/
-----END PGP SIGNATURE-----

--5l2iD5t6rMNHYWVMtsa1YRUnFkiq12ncu--

