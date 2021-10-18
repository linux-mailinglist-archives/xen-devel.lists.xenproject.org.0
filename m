Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA36431713
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 13:21:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.212074.369829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQh6-0004kj-5b; Mon, 18 Oct 2021 11:20:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 212074.369829; Mon, 18 Oct 2021 11:20:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcQh6-0004il-2N; Mon, 18 Oct 2021 11:20:40 +0000
Received: by outflank-mailman (input) for mailman id 212074;
 Mon, 18 Oct 2021 11:20:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6zTk=PG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mcQh4-0004Rr-Tk
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 11:20:38 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed0e0ac5-8489-424d-9e5c-584aec0fc897;
 Mon, 18 Oct 2021 11:20:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 860561FD6D;
 Mon, 18 Oct 2021 11:20:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA6B813D89;
 Mon, 18 Oct 2021 11:20:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JcaYN4NYbWGzFwAAMHmgww
 (envelope-from <jgross@suse.com>); Mon, 18 Oct 2021 11:20:35 +0000
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
X-Inumbo-ID: ed0e0ac5-8489-424d-9e5c-584aec0fc897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1634556036; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9RkQOPvuyGo7/0XHeYwaUfiaUeLX87l/2H056MfR5Wo=;
	b=Ti5s7horyqBs/FG4bOTYTPaR21qFWnCx9rSfghNcQqWGqK5t/OEUwXDsHPwbE2HG2itPSW
	4zWO7bxHhzo2cHoFPVbj/FyK6y/iuwq/frTRM7w+mNnM27LcgCpF787RyjaxPMBXPNJ5J2
	oVJE+xuu6vJ4ACXmavcKkBV+KlpLxYs=
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com> <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com> <YW1Dhn+oEwvKgj04@perard>
 <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
 <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>
 <9f3f6d5b-b920-911f-fea9-66fb36a09e5b@suse.com>
 <c0b2ca25-5700-e915-471b-3816d12efbd6@suse.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <129b1339-df89-44e2-2467-77b60e113882@suse.com>
Date: Mon, 18 Oct 2021 13:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <c0b2ca25-5700-e915-471b-3816d12efbd6@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="mCBhbbWkOksS968tEFJlrWSt5YleF9UtI"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--mCBhbbWkOksS968tEFJlrWSt5YleF9UtI
Content-Type: multipart/mixed; boundary="FGd6yOgwSrp0xz3vIgIyfRsWfTtKKK1S7";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <129b1339-df89-44e2-2467-77b60e113882@suse.com>
Subject: Re: [XEN PATCH v7 49/51] build: adding out-of-tree support to the xen
 build
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
 <20210824105038.1257926-50-anthony.perard@citrix.com>
 <2aaf0858-1602-be5c-77e4-2daa7fddc534@suse.com> <YWmzSkLdH5wtQ77V@perard>
 <f53e4d09-9f33-6dc8-8161-156b9eca4a6b@suse.com> <YW1Dhn+oEwvKgj04@perard>
 <70b8f320-bcd8-b864-f9de-a7ea35d53928@suse.com>
 <5a4df707-5b12-a471-e957-1a1c43340bff@suse.com>
 <9f3f6d5b-b920-911f-fea9-66fb36a09e5b@suse.com>
 <c0b2ca25-5700-e915-471b-3816d12efbd6@suse.com>
In-Reply-To: <c0b2ca25-5700-e915-471b-3816d12efbd6@suse.com>

--FGd6yOgwSrp0xz3vIgIyfRsWfTtKKK1S7
Content-Type: multipart/mixed;
 boundary="------------1D831B898F38E4F7E72CEE48"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------1D831B898F38E4F7E72CEE48
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 18.10.21 13:07, Jan Beulich wrote:
> On 18.10.2021 12:40, Juergen Gross wrote:
>> On 18.10.21 12:36, Jan Beulich wrote:
>>> On 18.10.2021 12:28, Juergen Gross wrote:
>>>> On 18.10.21 11:51, Anthony PERARD wrote:
>>>>> On Mon, Oct 18, 2021 at 11:02:20AM +0200, Jan Beulich wrote:
>>>>>> On 15.10.2021 18:58, Anthony PERARD wrote:
>>>>>>> I have to think about that. I've made some further progress in or=
der to
>>>>>>> be able to build the Xen pvhshim without a link farm and notice t=
hat
>>>>>>> nearly every source file needs to use "$(srctree)/$(src)"
>>>>>>
>>>>>> Oh, now I'm curious as to the why here. I thought use of $(srctree=
)
>>>>>> ought to be the exception.
>>>>>
>>>>> In Linux, the use of $(srctree) is indeed the exception. This is be=
cause
>>>>> we have VPATH=3D$(srctree), so when `make` look for a prerequisite =
or a
>>>>> target it will look first in the current directory and then in
>>>>> $(srctree). That works fine as long as the source tree only have so=
urces
>>>>> and no built files.
>>>>>
>>>>> But if we want to be able to build the pv-shim without the linkfarm=
 and
>>>>> thus using out-of-tree build, we are going to need the ability to b=
uild
>>>>> from a non-clean source tree. I don't think another way is possible=
=2E
>>>>
>>>> Is there any reason (apart from historical ones) to build the hyperv=
isor
>>>> in $(srctree)?
>>>>
>>>> I could see several advantages to build it in another directory as s=
oon
>>>> as the build system has this capability:
>>>>
>>>> - possibility to have a simple build target for building multiple ar=
chs
>>>>      (assuming the cross-tools are available), leading to probably l=
ess
>>>>      problems with breaking the build of "the other" architecture we=
 are
>>>>      normally not working with (and in future with e.g. Risc-V being=
 added
>>>>      this will be even more important)
>>>>
>>>> - possibility to have a debug and a non-debug build in parallel (in =
fact
>>>>      at least at SUSE we are working around that by building those w=
ith an
>>>>      intermediate "make clean" for being able to package both varian=
ts)
>>>>
>>>> - make clean for the hypervisor part would be just a "rm -r"
>>>
>>> I fully agree, yet ...
>>>
>>>> Yes, this would require us (the developers) to maybe change some hab=
its,
>>>> but I think this would be better than working around the issues by
>>>> adding $(srctree) all over the build system.
>>>
>>> ... developers' habits would only be my second concern here (and if t=
hat
>>> had been the only one, then I would not see this as a reason speaking=

>>> against the change, but as said I've never been building from the roo=
t,
>>> and I've also been building sort of out-of-tree all the time). Yet wh=
ile
>>> writing this reply I came to realize that my primary concern was wron=
g:
>>> People would not need to adjust their spec files (or alike), at least=

>>> not as long as they consume only files living under dist/.
>>>
>>> So, Anthony - thoughts about making the default in-tree Xen build
>>> actually build into, say, build/xen/?
>>
>> Or maybe even build-<arch>[-debug]/xen/?
>=20
> I'd be okay with build-<arch>, but things would become questionable imo=

> when considering further elements recorded in .config: Where would you
> draw the line?

Okay, this is a valid question. What about an environment variable which
can be used to determine the build directory (or a suffix of the build
directory)?

This could be used to cover other use cases, too.


Juergen

--------------1D831B898F38E4F7E72CEE48
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

--------------1D831B898F38E4F7E72CEE48--

--FGd6yOgwSrp0xz3vIgIyfRsWfTtKKK1S7--

--mCBhbbWkOksS968tEFJlrWSt5YleF9UtI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFtWIMFAwAAAAAACgkQsN6d1ii/Ey/U
fQgAhh/PbUzu3Ffz0wOajIMGLxVL4Uoo9ILRbxe5jHxgUCEa+sjTyPc+wy6kjCEo3pyz1/mPKr96
GKU9kKrLlvLcThvQh3bYWYHeHmGqg7F2O+xXI598MVwb3ELiAeEmUw8kpzeyK7tf7aBNHPFY4Bff
kvlM/6oBSn9S3QPGE579sE9p+9mDL+HN1G/Igas1wONbkVu2gAeAJG1GcgTV+pVMnL9wpCjpSbkd
9scgIVtLgiGmITFkx/jO4O2nfuaqOVcv89pSpa9ogFCm/Edq9k/0fTr+QBchOo86//GMlbqAiy3v
Eg0koYgwA0uUs9iasijoW/OwxwSJkMzrODgM6PuXmQ==
=wOjp
-----END PGP SIGNATURE-----

--mCBhbbWkOksS968tEFJlrWSt5YleF9UtI--

