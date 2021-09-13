Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 624C340839A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 06:51:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185403.334039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPdwK-0003cg-Ly; Mon, 13 Sep 2021 04:51:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185403.334039; Mon, 13 Sep 2021 04:51:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPdwK-0003Zs-Ip; Mon, 13 Sep 2021 04:51:32 +0000
Received: by outflank-mailman (input) for mailman id 185403;
 Mon, 13 Sep 2021 04:51:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=huvW=OD=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mPdwJ-0003Zm-6M
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 04:51:31 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id dd9e87d0-3035-448f-8535-9acbb1cb5259;
 Mon, 13 Sep 2021 04:51:30 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 331791FF93;
 Mon, 13 Sep 2021 04:51:29 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id DAB6D132AB;
 Mon, 13 Sep 2021 04:51:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id Pt5QM9DYPmG2YgAAGKfGzw
 (envelope-from <jgross@suse.com>); Mon, 13 Sep 2021 04:51:28 +0000
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
X-Inumbo-ID: dd9e87d0-3035-448f-8535-9acbb1cb5259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1631508689; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Pf70st+6PbyNeCrtQ1Sd32b6nRwU+ke6s+y3EZ9lB6k=;
	b=JJw/h4AFQc2dhVm7Z+QQXdhLeUWQgr+nYtgWIVDFLKIke7+3c1u3RRMKXs5eK+R2hkoUo2
	Q4Ls5siVP/IubFNgAc4ST+0b0zFnFrfsNJww+KgR2UVH2+f/s99jsWwtRdV60ssgm0FY6r
	ZvvCk4h0m9e4FRZhrQ74sXz/8UIxYLg=
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
References: <20210909124924.1698-1-jgross@suse.com>
 <20210909124924.1698-2-jgross@suse.com>
 <24890.2778.780247.724651@mariner.uk.xensource.com>
 <7e635caa-0956-332c-bd17-0bec61e58ef0@suse.com>
 <24890.12692.44064.995392@mariner.uk.xensource.com>
 <462de39a-2edc-ee3e-8016-85ce29e7ca59@suse.com>
 <24891.31395.187330.546856@mariner.uk.xensource.com>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub
Message-ID: <08e63f7e-4d94-cf82-2563-384be00982b8@suse.com>
Date: Mon, 13 Sep 2021 06:51:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <24891.31395.187330.546856@mariner.uk.xensource.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="LHaRBHbZFDn1qXXhbKrxB3hH2AZPGpBaJ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--LHaRBHbZFDn1qXXhbKrxB3hH2AZPGpBaJ
Content-Type: multipart/mixed; boundary="EIrGniSJFH1HQI8aO9SEzBO6Rj3G77mKi";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Ian Jackson <iwj@xenproject.org>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <08e63f7e-4d94-cf82-2563-384be00982b8@suse.com>
Subject: Re: [PATCH v2 1/3] stubdom: fix build with disabled pv-grub
References: <20210909124924.1698-1-jgross@suse.com>
 <20210909124924.1698-2-jgross@suse.com>
 <24890.2778.780247.724651@mariner.uk.xensource.com>
 <7e635caa-0956-332c-bd17-0bec61e58ef0@suse.com>
 <24890.12692.44064.995392@mariner.uk.xensource.com>
 <462de39a-2edc-ee3e-8016-85ce29e7ca59@suse.com>
 <24891.31395.187330.546856@mariner.uk.xensource.com>
In-Reply-To: <24891.31395.187330.546856@mariner.uk.xensource.com>

--EIrGniSJFH1HQI8aO9SEzBO6Rj3G77mKi
Content-Type: multipart/mixed;
 boundary="------------BB5FF2595ABF07EBB24A5C87"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------BB5FF2595ABF07EBB24A5C87
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10.09.21 17:32, Ian Jackson wrote:
> Juergen Gross writes ("Re: [PATCH v2 1/3] stubdom: fix build with disab=
led pv-grub"):
>> BTW, you probably want to modify OSStest to use configure with:
>>
>> --enable-pv-grub --enable-qemu-traditional
>>
>> in order to not let the tests fail (applies to x86 only, of course).
>=20
> I think it might be better to disable those tests.  What do people
> think ?

Disabling pv-grub tests is okay (I think it happened already, right?).

Disabling qemu-trad tests with qemu running in dom0 is fine, too, IMO.

Disabling the stubdom tests is much more concerning, as there is quite
some code in the tools which would be untested then.


Juergen

--------------BB5FF2595ABF07EBB24A5C87
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

--------------BB5FF2595ABF07EBB24A5C87--

--EIrGniSJFH1HQI8aO9SEzBO6Rj3G77mKi--

--LHaRBHbZFDn1qXXhbKrxB3hH2AZPGpBaJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmE+2NAFAwAAAAAACgkQsN6d1ii/Ey+W
nwf/XdJe9ngprbPE4Jf8HN3e9bZmrsM4JUhy+nW/QwqX8OmBG9xhc7WfsuuCJuzj0vA/m7YRGaIt
jhscMcBMNSzVmAZshDb/5u3aeGP0c2lyMy0jfuuZKlJ/1rt858VtbZpc75Kq+F5JHZwh4QG4k2T7
8d25hhf8KfEuG8u/IokkqAymlQgYRvQIPivFoztKefTM+SN+jlENvmfKsjexi6ezg949IN1wOsfF
F4dREz8UN0/8Oy7pRmwkVqylXvhcEP5UsDwBzYGN/nR8L0d6HRtDt9yMW4Rp6aDDz/9n6RHUQTGX
7GXhCgzhMquBCPMPDI7jlQTpgw+tnzJMr+Nbtggxjw==
=CNUa
-----END PGP SIGNATURE-----

--LHaRBHbZFDn1qXXhbKrxB3hH2AZPGpBaJ--

