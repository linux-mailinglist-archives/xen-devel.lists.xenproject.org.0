Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E55043164C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 12:40:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211999.369717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQ3w-0003jr-Ev; Mon, 18 Oct 2021 10:40:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211999.369717; Mon, 18 Oct 2021 10:40:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQ3w-0003gn-Bf; Mon, 18 Oct 2021 10:40:12 +0000
Received: by outflank-mailman (input) for mailman id 211999;
 Mon, 18 Oct 2021 10:40:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcQ3v-0003gh-Hh
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 10:40:11 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 697ecbc5-b76d-4f93-9e1a-b52471187dbd;
 Mon, 18 Oct 2021 10:40:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B1B471FD7B;
 Mon, 18 Oct 2021 10:40:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2175B1401B;
 Mon, 18 Oct 2021 10:40:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KGEYBQlPbWEnfQAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 18 Oct 2021 10:40:09 +0000
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
X-Inumbo-ID: 697ecbc5-b76d-4f93-9e1a-b52471187dbd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634553609; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TVNorc+grSkMTuYhyzTmu7hBoe2REQ8e8xBdgzIpYf4=;
	b=aQ/7hsIYiYnAa/RmHoW4Sx1SDlgeIKTOrmYrn1/4GbWnFZYsuXDOgAH8DXak00NjapgQ8R
	D0H0p9NMtOPG9AC0nqjMkDoq2Avem93nrfMOA48m4jVpYdqTbg3bd9by0Mu+xWXxKkVHPr
	zhYqV4xe12W96h/GCphN2tBHAlrZmS8=
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
To: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
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
 <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
 <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <9f3f6d5b-b920-911f-fea9-66fb36a09e5b@suse.com>
Date: Mon, 18 Oct 2021 12:40:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EWVIMzEo44VTBB9qkXJcDeJ7zwoR5dQDH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EWVIMzEo44VTBB9qkXJcDeJ7zwoR5dQDH
Content-Type: multipart/mixed; boundary="EeXIYFdVeQTvEWFaKk1NYoeU9mfAHbBUJ";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>,
 Anthony PERARD <anthony.perard@citrix.com>
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
Message-ID: <9f3f6d5b-b920-911f-fea9-66fb36a09e5b@suse.com>
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com> <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com> <YW1Dhn+oEwvKgj04@perard>
 <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
 <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>
In-Reply-To: <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>

--EeXIYFdVeQTvEWFaKk1NYoeU9mfAHbBUJ
Content-Type: multipart/mixed;
 boundary="------------32E596BF8D82DAFEEBE8D0A7"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------32E596BF8D82DAFEEBE8D0A7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.10.21 12:36, Jan Beulich wrote:
> On 18.10.2021 12:28, Juergen Gross wrote:
>> On 18.10.21 11:51, Anthony PERARD wrote:
>>> On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
>>>> On 15.10.2021 18:58, Anthony PERARD wrote:
>>>>> On Thu, Oct 14, 2021 at 12:14:29PM +0200, Jan Beulich wrote:
>>>>>> On 24.08.2021 12:50, Anthony PERARD wrote:
>>>>>>> --- a/xen/Rules.mk
>>>>>>> +++ b/xen/Rules.mk
>>>>>>> @@ -38,7 +38,7 @@ SPECIAL_DATA_SECTIONS :=3D rodata $(foreach a,1=
 2 4 8 16, \
>>>>>>>                             $(foreach r,rel rel.ro,data.$(r).loca=
l)
>>>>>>>   =20
>>>>>>>    # The filename build.mk has precedence over Makefile
>>>>>>> -mk-dir :=3D $(src)
>>>>>>> +mk-dir :=3D $(srctree)/$(src)
>>>>>>>    include $(if $(wildcard $(mk-dir)/build.mk),$(mk-dir)/build.mk=
,$(mk-dir)/Makefile)
>>>>>>
>>>>>> Perhaps already when it was changed to $(src) the name has become
>>>>>> slightly misleading, at least imo: I would rather expect a variabl=
e
>>>>>> with this name to refer to the build dir/tree. Maybe "srcdir" or
>>>>>> even shorted "sd" right from the start? (Reaching here I can final=
ly
>>>>>> see why having a shorthand is helpful.)
>>>>>
>>>>> I have to think about that. I've made some further progress in orde=
r to
>>>>> be able to build the Xen pvhshim without a link farm and notice tha=
t
>>>>> nearly every source file needs to use "$(srctree)/$(src)"
>>>>
>>>> Oh, now I'm curious as to the why here. I thought use of $(srctree)
>>>> ought to be the exception.
>>>
>>> In Linux, the use of $(srctree) is indeed the exception. This is beca=
use
>>> we have VPATH=3D$(srctree), so when `make` look for a prerequisite or=
 a
>>> target it will look first in the current directory and then in
>>> $(srctree). That works fine as long as the source tree only have sour=
ces
>>> and no built files.
>>>
>>> But if we want to be able to build the pv-shim without the linkfarm a=
nd
>>> thus using out-of-tree build, we are going to need the ability to bui=
ld
>>> from a non-clean source tree. I don't think another way is possible.
>>
>> Is there any reason (apart from historical ones) to build the hypervis=
or
>> in $(srctree)?
>>
>> I could see several advantages to build it in another directory as soo=
n
>> as the build system has this capability:
>>
>> - possibility to have a simple build target for building multiple arch=
s
>>     (assuming the cross-tools are available), leading to probably less=

>>     problems with breaking the build of "the other" architecture we ar=
e
>>     normally not working with (and in future with e.g. Risc-V being ad=
ded
>>     this will be even more important)
>>
>> - possibility to have a debug and a non-debug build in parallel (in fa=
ct
>>     at least at SUSE we are working around that by building those with=
 an
>>     intermediate "make clean" for being able to package both variants)=

>>
>> - make clean for the hypervisor part would be just a "rm -r"
>=20
> I fully agree, yet ...
>=20
>> Yes, this would require us (the developers) to maybe change some habit=
s,
>> but I think this would be better than working around the issues by
>> adding $(srctree) all over the build system.
>=20
> ... developers' habits would only be my second concern here (and if tha=
t
> had been the only one, then I would not see this as a reason speaking
> against the change, but as said I've never been building from the root,=

> and I've also been building sort of out-of-tree all the time). Yet whil=
e
> writing this reply I came to realize that my primary concern was wrong:=

> People would not need to adjust their spec files (or alike), at least
> not as long as they consume only files living under dist/.
>=20
> So, Anthony - thoughts about making the default in-tree Xen build
> actually build into, say, build/xen/?

Or maybe even build-<arch>[-debug]/xen/?


Juergen

--------------32E596BF8D82DAFEEBE8D0A7
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

--------------32E596BF8D82DAFEEBE8D0A7--

--EeXIYFdVeQTvEWFaKk1NYoeU9mfAHbBUJ--

--EWVIMzEo44VTBB9qkXJcDeJ7zwoR5dQDH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFtTwgFAwAAAAAACgkQsN6d1ii/Ey/k
bAf/fVIQUNg+kYq69VP646gJDwQcTC9DKqxSTGsVv1T5oxF/cDHDjMQmmRDfORQ+4Z6eUekrZW/d
mGh2HEOxdf7gF07YtkLzJBska0exy4CVzy3pSuchpSDsF+PEgh8OFKLS0V3vWVLphGbvbp1LSPqf
ckvW4+Da7o5HDymsaWmNKzc4hwcHIz2HudZAywrfkm9RgDnZph7zyJAvXCh0bgHrvI8r8lzRGatZ
Zi4mL+nxiyL52taemMDld72HAyoychMdQxIzqNIVpZdzbiXMYVUzjlG9q0wePX6zja+JAZmLvy1D
58bKJi/0I2aI43klOdAkycrAj7bH5r9Fhh3rK84bdg==
=TbgG
-----END PGP SIGNATURE-----

--EWVIMzEo44VTBB9qkXJcDeJ7zwoR5dQDH--

