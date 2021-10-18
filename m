Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B60A443161A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:29:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211965.369672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPsr-00080X-B0; Mon, 18 Oct 2021 10:28:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211965.369672; Mon, 18 Oct 2021 10:28:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcPsr-0007yb-7S; Mon, 18 Oct 2021 10:28:45 +0000
Received: by outflank-mailman (input) for mailman id 211965;
 Mon, 18 Oct 2021 10:28:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcPsp-0007yS-R3
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:28:43 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34c51bc3-f4e2-42d0-a812-86d8d8457599;
 Mon, 18 Oct 2021 10:28:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1121D1FD6D;
 Mon, 18 Oct 2021 10:28:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8D3AD13FEE;
 Mon, 18 Oct 2021 10:28:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BA31IFlMbWGIdQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 18 Oct 2021 10:28:41 +0000
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
X-Inumbo-ID: 34c51bc3-f4e2-42d0-a812-86d8d8457599
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634552922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ado6MtlaAgrZ1Rli89sn7WhX36BUDjCnqGiv7hIJAEs=;
	b=Cl+g9c5rqY9B9UN4IULAx2rngltYYMmTPbqE7xEC+MSfoKx8tGoUxcP0TIUHfDAYpvOPoT
	SXxFBOVSuQ2BkwA7Eq4fNwMKS+IhFgKlnY2JsarP2Jb3QrogSL7wGCyXbwo05iS2gE1vv6
	DmAzbD3O9H1biGdWQeedTTNJlrQfqYY=
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com> <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com> <YW1Dhn+oEwvKgj04@perard>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
Message-ID: <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
Date: Mon, 18 Oct 2021 12:28:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YW1Dhn+oEwvKgj04@perard>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="z1f5VhX0LfcOjfEa7574f2jM5xrMQwykK"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--z1f5VhX0LfcOjfEa7574f2jM5xrMQwykK
Content-Type: multipart/mixed; boundary="PLX5GIJ3S7q6aOpAEPNIOkm0Zvvq8HagV";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
Message-ID: <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com> <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com> <YW1Dhn+oEwvKgj04@perard>
In-Reply-To: <YW1Dhn+oEwvKgj04@perard>

--PLX5GIJ3S7q6aOpAEPNIOkm0Zvvq8HagV
Content-Type: multipart/mixed;
 boundary="------------FCA8054FC2BAE24B14951845"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------FCA8054FC2BAE24B14951845
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.10.21 11:51, Anthony PERARD wrote:
> On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
>> On 15.10.2021 18:58, Anthony PERARD wrote:
>>> On Thu, Oct 14, 2021 at 12:14:29PM +0200, Jan Beulich wrote:
>>>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>>>> --- a/xen/Rules.mk
>>>>> +++ b/xen/Rules.mk
>>>>> @@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS :=3D rodata $(foreach a,1 2=
 4 8 16, \
>>>>>                            $(foreach r,rel rel.ro,data.$(r).local)
>>>>>  =20
>>>>>   # The filename build.mk has precedence over Makefile
>>>>> -mk-dir :=3D $(src)
>>>>> +mk-dir :=3D $(srctree)/$(src)
>>>>>   include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk,$(=
mk-dir)/Makefile)
>>>>
>>>> Perhaps already when it was changed to $(src) the name has become
>>>> slightly misleading, at least imo: I would rather expect a variable
>>>> with this name to refer to the build dir/tree. Maybe "srcdir" or
>>>> even shorted "sd" right from the start? (Reaching here I can finally=

>>>> see why having a shorthand is helpful.)
>>>
>>> I have to think about that. I've made some further progress in order =
to
>>> be able to build the Xen pvhshim without a link farm and notice that
>>> nearly every source file needs to use "$(srctree)/$(src)"
>>
>> Oh, now I'm curious as to the why here. I thought use of $(srctree)
>> ought to be the exception.
>=20
> In Linux, the use of $(srctree) is indeed the exception. This is becaus=
e
> we have VPATH=3D$(srctree), so when `make` look for a prerequisite or a=

> target it will look first in the current directory and then in
> $(srctree). That works fine as long as the source tree only have source=
s
> and no built files.
>=20
> But if we want to be able to build the pv-shim without the linkfarm and=

> thus using out-of-tree build, we are going to need the ability to build=

> from a non-clean source tree. I don't think another way is possible.

Is there any reason (apart from historical ones) to build the hypervisor
in $(srctree)?

I could see several advantages to build it in another directory as soon
as the build system has this capability:

- possibility to have a simple build target for building multiple archs
   (assuming the cross-tools are available), leading to probably less
   problems with breaking the build of "the other" architecture we are
   normally not working with (and in future with e.g. Risc-V being added
   this will be even more important)

- possibility to have a debug and a non-debug build in parallel (in fact
   at least at SUSE we are working around that by building those with an
   intermediate "make clean" for being able to package both variants)

- make clean for the hypervisor part would be just a "rm -r"

Yes, this would require us (the developers) to maybe change some habits,
but I think this would be better than working around the issues by
adding $(srctree) all over the build system.


Juergen

--------------FCA8054FC2BAE24B14951845
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

--------------FCA8054FC2BAE24B14951845--

--PLX5GIJ3S7q6aOpAEPNIOkm0Zvvq8HagV--

--z1f5VhX0LfcOjfEa7574f2jM5xrMQwykK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFtTFkFAwAAAAAACgkQsN6d1ii/Ey9C
ogf9FkEA0tfMJDk6JpxsZWB3zVHUM76S5YqyFtqVFD4fkRdOUW90CBud3oCrwrxCZSg3HrvPrqGz
4Jn0jNDDrRbDMXyRhK6vKGIzYD+pAS8Xle3LkDANwexwgADETCF5jG5PDkUHBouJwMsyb2J+thv5
52SYxWZPQW1VXBDyCyiIITsVI/gIOD+QqYaErk2mo5N6vw6v2p9yrPxZaiAwJi3Bh4ghjrAw53o+
/z9Gqi1g1DegOADCiMnVCgz8mtQdQ5csq4JviTGbRW6ayNY1SMtHLCi4vujLRshyRf97y4lxJAFR
Q9yrSf7TQk4/+B5LNLC3h4vis2bz674pXoEmWv2sdw==
=Ex/U
-----END PGP SIGNATURE-----

--z1f5VhX0LfcOjfEa7574f2jM5xrMQwykK--

