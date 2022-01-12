Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1B248BEFC
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 08:27:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256249.439616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Y2E-00014f-2t; Wed, 12 Jan 2022 07:27:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256249.439616; Wed, 12 Jan 2022 07:27:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7Y2D-00012W-Vl; Wed, 12 Jan 2022 07:27:05 +0000
Received: by outflank-mailman (input) for mailman id 256249;
 Wed, 12 Jan 2022 07:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSVc=R4=suse.com=jgross@srs-se1.protection.inumbo.net>)
 id 1n7Y2C-00012Q-DU
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 07:27:04 +0000
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 09b68764-7379-11ec-81c1-a30af7de8005;
 Wed, 12 Jan 2022 08:27:03 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 22F88212CC;
 Wed, 12 Jan 2022 07:27:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF22913B32;
 Wed, 12 Jan 2022 07:27:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /mpSOMaC3mHUCwAAMHmgww
 (envelope-from <jgross@suse.com>); Wed, 12 Jan 2022 07:27:02 +0000
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
X-Inumbo-ID: 09b68764-7379-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1641972423; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ECF8hIJ+7WRKFX24XULzJQ51kqrKUoj4GzpiF1a/BNY=;
	b=dBaD+WtCgbjsCK9cJUBJ12fEVx3h+2LVIl3Yg6yeAlHLFqCHg5Nya5Bljakd5I8ujoTbyf
	738NtDKt2ip+lzGiLADqNGxxpQbh8v83Ff04MzoAWH34JJuJS41zPfy6aGWfqFNM6PRYUT
	PyOySCWaBltxG1PutYTsLR+GPIGc8hI=
Subject: Re: [PATCH v2 2/3] tools/libs/gnttab: decouple more from mini-os
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-3-jgross@suse.com>
 <b0dec08d-2b94-efbb-cbc8-d67e3529fcc1@srcf.net>
From: Juergen Gross <jgross@suse.com>
Message-ID: <6e7dbf91-8c0e-900a-dacc-5afa36b6261d@suse.com>
Date: Wed, 12 Jan 2022 08:27:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <b0dec08d-2b94-efbb-cbc8-d67e3529fcc1@srcf.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VmQqsnHyfJ80wO4GAMZ4adAmBRumrSshc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VmQqsnHyfJ80wO4GAMZ4adAmBRumrSshc
Content-Type: multipart/mixed; boundary="YE3MXxshzAWYh9bEsND7Z5WhbkGgAWMOX";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Andrew Cooper <amc96@srcf.net>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <6e7dbf91-8c0e-900a-dacc-5afa36b6261d@suse.com>
Subject: Re: [PATCH v2 2/3] tools/libs/gnttab: decouple more from mini-os
References: <20220111150318.22570-1-jgross@suse.com>
 <20220111150318.22570-3-jgross@suse.com>
 <b0dec08d-2b94-efbb-cbc8-d67e3529fcc1@srcf.net>
In-Reply-To: <b0dec08d-2b94-efbb-cbc8-d67e3529fcc1@srcf.net>

--YE3MXxshzAWYh9bEsND7Z5WhbkGgAWMOX
Content-Type: multipart/mixed;
 boundary="------------D61CEED232C22BCE52E81D13"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D61CEED232C22BCE52E81D13
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 11.01.22 21:08, Andrew Cooper wrote:
> On 11/01/2022 15:03, Juergen Gross wrote:
>> libgnttab is using implementation details of Mini-OS. Change that by
>> letting libgnttab use the new alloc_file_type() and get_file_from_fd()=

>> functions and the generic dev pointer of struct file from Mini-OS.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>
>> ---
>> V2:
>> - add alloc_file_type() support
>> ---
>>   tools/libs/gnttab/minios.c | 68 +++++++++++++++++++++++++++---------=
--
>>   1 file changed, 48 insertions(+), 20 deletions(-)
>>
>> diff --git a/tools/libs/gnttab/minios.c b/tools/libs/gnttab/minios.c
>> index f78caadd30..c19f339c8c 100644
>> --- a/tools/libs/gnttab/minios.c
>> +++ b/tools/libs/gnttab/minios.c
>> @@ -28,18 +28,53 @@
>>   #include <sys/mman.h>
>>  =20
>>   #include <errno.h>
>> +#include <malloc.h>
>>   #include <unistd.h>
>>  =20
>>   #include "private.h"
>>  =20
>> -void minios_gnttab_close_fd(int fd);
>> +int minios_gnttab_close_fd(int fd);
>=20
> Again, like evtchn, no need to forward declare.
>=20
>=20
> However, I've only just realised...
>=20
>> +
>> +int minios_gnttab_close_fd(int fd)
>> +{
>> +    struct file *file =3D get_file_from_fd(fd);
>> +
>> +    gntmap_fini(file->dev);
>> +    free(file->dev);
>> +
>> +    return 0;
>> +}
>=20
> The only reason this doesn't break the build is because the declaration=

> is not in a header.=C2=A0 After this change, you've got the function
> returning int here, but declared as returning void as far as MiniOS is
> concerned.
>=20
> Furthermore, we cannot fix this mess atomically now that minios has
> moved into a separate repo.=C2=A0 It's tolerable from an ABI point of v=
iew on
> x86, but I don't know for certain on other architectures.

Mini-OS is x86 only right now (well, it has some Arm parts in it, but
it is not in a state to be usable on Arm).

> The least bad way I can think of doing this would be to leave void
> minios_gnttab_close_fd(int fd) exactly as it was, and instead of
> converting it's use here, use a separate static function straight away
> for the file ops.=C2=A0 (Will be necessary anyway if you like my sugges=
tion
> of passing file too).=C2=A0 Then in the whole function in "tools/libs: =
final
> cleanup making mini-os callbacks static", rather than just making it st=
atic.

I can change it if you really want.


Juergen

--------------D61CEED232C22BCE52E81D13
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

--------------D61CEED232C22BCE52E81D13--

--YE3MXxshzAWYh9bEsND7Z5WhbkGgAWMOX--

--VmQqsnHyfJ80wO4GAMZ4adAmBRumrSshc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmHegsYFAwAAAAAACgkQsN6d1ii/Ey+I
Vgf/bwZoRbesJPHFfIeNnc07ImoBhqEdJgcYEMs/fv2LmEhSZ4+smlukKOxs5+gJ53Xw/2VTd0PG
d6mzBJzxox0QdZyMDD3jrqrg80l9d4Gr/Kv6rjRPjIYOUOUCL9CBMN7n/3uBwW19On+9ezZoKZTp
cb7acjbyoxDlfkOCQgz4wITUrOpH426dxPEHosusXQFnG2A991gfxG9bHu3oTbJo7/6Mvd7GXj/j
N269I9CX1oB+P8s16oOaDi0p3xuwGepNgCvBUuAQtqwV7tmVq3R1nD41xtVn3missnm9jsESk2bn
3Jwt4dsS+H170W3hlfVPlb7Hv1/qab1FykNDfhxdmw==
=7/OJ
-----END PGP SIGNATURE-----

--VmQqsnHyfJ80wO4GAMZ4adAmBRumrSshc--

