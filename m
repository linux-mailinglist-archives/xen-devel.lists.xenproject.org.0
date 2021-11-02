Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F42442C6E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Nov 2021 12:21:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220100.381228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrrI-0000UU-Qs; Tue, 02 Nov 2021 11:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220100.381228; Tue, 02 Nov 2021 11:21:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mhrrI-0000RB-MY; Tue, 02 Nov 2021 11:21:40 +0000
Received: by outflank-mailman (input) for mailman id 220100;
 Tue, 02 Nov 2021 11:21:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hRh8=PV=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mhrrH-0000Pp-NE
 for xen-devel@lists.xenproject.org; Tue, 02 Nov 2021 11:21:39 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0b6e7631-3bcf-11ec-8555-12813bfff9fa;
 Tue, 02 Nov 2021 11:21:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 824B01FD4C;
 Tue,  2 Nov 2021 11:21:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43FF313C1F;
 Tue,  2 Nov 2021 11:21:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tkoWD0EfgWHYQwAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 02 Nov 2021 11:21:37 +0000
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
X-Inumbo-ID: 0b6e7631-3bcf-11ec-8555-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635852097; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8qkuYdPbxJJCn8T+kZTT7jMsYYuaNY/gO0VcP9zZQ7M=;
	b=XLYwRg6irYhvoRwF/D80R39vX0ESlhLgpTR9nZ1ZnQDlEMMXO8wEGaozBXHwY2Xh8BRwT/
	yqDKFSQGeQvmHx///NGIsH+L4SK0X+HsN79G07Obprg4tXcQuZ+25EEplR7Mp+8nR/ICi7
	G1kYyi3zOvnHgtM7KFNQ32hzpiyUWDA=
Subject: Re: [PATCH v2 07/15] xen: generate hypercall interface related code
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-8-jgross@suse.com>
 <26bf3337-df7a-be55-db3d-bceaf1fb2acd@arm.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <310413a7-b7b2-6e48-6ea9-34c741206863@suse.com>
Date: Tue, 2 Nov 2021 12:21:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <26bf3337-df7a-be55-db3d-bceaf1fb2acd@arm.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="qnNXxwkUF1CbOm02yfln2ATx7VJzllfNP"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--qnNXxwkUF1CbOm02yfln2ATx7VJzllfNP
Content-Type: multipart/mixed; boundary="1MkQJsDvsmjrZOa4OwsqLzCNuDnfFccMQ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Message-ID: <310413a7-b7b2-6e48-6ea9-34c741206863@suse.com>
Subject: Re: [PATCH v2 07/15] xen: generate hypercall interface related code
References: <20211101152015.28488-1-jgross@suse.com>
 <20211101152015.28488-8-jgross@suse.com>
 <26bf3337-df7a-be55-db3d-bceaf1fb2acd@arm.com>
In-Reply-To: <26bf3337-df7a-be55-db3d-bceaf1fb2acd@arm.com>

--1MkQJsDvsmjrZOa4OwsqLzCNuDnfFccMQ
Content-Type: multipart/mixed;
 boundary="------------5C4AC0C89406005337906727"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------5C4AC0C89406005337906727
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 02.11.21 11:43, Michal Orzel wrote:
> Hi Juergen,
>=20
> On 01.11.2021 16:20, Juergen Gross wrote:
>> Instead of repeating similar data multiple times use a single source
>> file and a generator script for producing prototypes and call sequence=
s
>> of the hypercalls.
>>
>> As the script already knows the number of parameters used add generati=
ng
>> a macro for populating an array with the number of parameters per
>> hypercall.
>>
>> Signed-off-by: Juergen Gross <jgross@suse.com>

=2E..

>> +    # Generate call sequences and args array contents
>> +    for (ca in caller) {
>> +        if (caller[ca] !=3D 1)
>> +            continue;
>> +        for (pl =3D 1; pl <=3D n_prios[ca]; pl++)
>> +            p_list[pl] =3D prio_list[ca, pl];
>> +        asort(p_list, p_list, "@val_num_asc");
>=20
> Just to let you know:
> asort is a gawk built-in. I was trying to build your changes on my aarc=
h64 chroot environment.
> I did not have gawk installed and I got an error when building xen:
>=20
> make[4]: Leaving directory '/home/micorz01/xen_main/xen/include'
>    GEN     include/xen/hypercall-defs.h
> awk: scripts/gen_hypercall.awk: line 308: function asort never defined
> Makefile:477: recipe for target 'include/xen/hypercall-defs.h' failed
>=20
> During configure step I did not get any failure that gawk is not instal=
led.
> If you are making use of gawk built-ins, shouldn't configure test for i=
t?

I just checked again and I think this is the only gawk specific
feature I'm using.

I'll replace asort() with a manual sort in order to drop the gawk
dependency.

Thanks for the notice,


Juergen

--------------5C4AC0C89406005337906727
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

--------------5C4AC0C89406005337906727--

--1MkQJsDvsmjrZOa4OwsqLzCNuDnfFccMQ--

--qnNXxwkUF1CbOm02yfln2ATx7VJzllfNP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmGBH0AFAwAAAAAACgkQsN6d1ii/Ey8f
Igf8DJHHcJH1QUV6pPQqU3Pxv6R+P2gqPuEg4kpzpYBgHO+DkmEXO5ttDrSL76MtG0lw7hypObNJ
rVOgrbwAdaPYJORnllXTvq2x6Er1Nm9bpfE0ykVD0+z0G5ubsPKvGxsb/sKp59HAor/5w8u3hNWZ
CLhqtuCKMBHu4xbhAbXKFKv8Zcb//8WAcJUdh7f20OaGfLkVc/byEyyNgTL4GzAhddbNWcL0LkzJ
Ehcc/o0k+USJc/15Ty9SgY1KpaC4wDT5uJHpZeGVBA63kAn7mE7aFQELcwPblw3UkgUJJgdO6kYS
fzuDLxBoIb+D9mRGUAJjPKwLBT7CRiJh2I+vnxiWVQ==
=VPCt
-----END PGP SIGNATURE-----

--qnNXxwkUF1CbOm02yfln2ATx7VJzllfNP--

