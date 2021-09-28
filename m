Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 826C341A99B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 09:20:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197628.350788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7PY-0006FI-4e; Tue, 28 Sep 2021 07:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197628.350788; Tue, 28 Sep 2021 07:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV7PX-0006CS-WA; Tue, 28 Sep 2021 07:20:19 +0000
Received: by outflank-mailman (input) for mailman id 197628;
 Tue, 28 Sep 2021 07:20:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TiGH=OS=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mV7PW-0006CM-6h
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 07:20:18 +0000
Received: from smtp-out1.suse.de (unknown [195.135.220.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a8e02a8d-7b2d-4807-82da-acc085ecfa9d;
 Tue, 28 Sep 2021 07:20:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DACAF2232F;
 Tue, 28 Sep 2021 07:20:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9594813ACF;
 Tue, 28 Sep 2021 07:20:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4uUzIi/CUmFEYgAAMHmgww
 (envelope-from <jgross@suse.com>); Tue, 28 Sep 2021 07:20:15 +0000
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
X-Inumbo-ID: a8e02a8d-7b2d-4807-82da-acc085ecfa9d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1632813615; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1FKOZwJG6HvIY+z5mULGzJSY89j94N90X87PspFD9nw=;
	b=oYwJQHMTPtMjozqkBMdy3KSlqyldGJp0kq8jbOVDjJ27Rfj9a4vKFB1c8gEXg6lhPwdtud
	pUdsIfEBZgfm2J6/jzlvxa8lsVVZsZmjmAkyBQA55lQzaEbNXm2GAwQfxSGtnhG+ukPNte
	WpiqTANEhKSYfwkT7J6f2718JEtnHfE=
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
 <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
 <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
 <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com>
 <b4c8b964-56d7-c693-98e0-ecb435925eb0@epam.com>
 <da921aa0-0259-cd2e-5f43-5e2934ad3f82@suse.com>
 <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>
From: Juergen Gross <jgross@suse.com>
Message-ID: <2b4dc684-a00f-1a08-92b0-7b0b614aeb24@suse.com>
Date: Tue, 28 Sep 2021 09:20:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="9JPaecaKNSLG4dtwkDnNuLHkoyV401xiQ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--9JPaecaKNSLG4dtwkDnNuLHkoyV401xiQ
Content-Type: multipart/mixed; boundary="lWJdWbU42RmXa51U7mt4OnICpSJdaD3nN";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>,
 "julien@xen.org" <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Message-ID: <2b4dc684-a00f-1a08-92b0-7b0b614aeb24@suse.com>
Subject: Re: [PATCH v4 1/2] xen-pciback: prepare for the split for stub and PV
References: <20210927065822.350973-1-andr2000@gmail.com>
 <e472468a-625e-6c4d-a9c2-85594e2ff908@suse.com>
 <accd0220-a9d7-145b-6632-9dee085ffc65@epam.com>
 <1cf5fbf3-6453-e258-3940-8b5bb96117b6@suse.com>
 <alpine.DEB.2.21.2109272112150.5022@sstabellini-ThinkPad-T480s>
 <0b952b8d-0ebd-1c8c-84d4-f02e05bc2a2b@suse.com>
 <b4c8b964-56d7-c693-98e0-ecb435925eb0@epam.com>
 <da921aa0-0259-cd2e-5f43-5e2934ad3f82@suse.com>
 <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>
In-Reply-To: <51e38ddc-49df-2e70-d094-71d045297ab1@epam.com>

--lWJdWbU42RmXa51U7mt4OnICpSJdaD3nN
Content-Type: multipart/mixed;
 boundary="------------4E1FD0FE258D97863A978DA5"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------4E1FD0FE258D97863A978DA5
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28.09.21 09:17, Oleksandr Andrushchenko wrote:
>=20
> On 28.09.21 09:59, Juergen Gross wrote:
>> On 28.09.21 08:56, Oleksandr Andrushchenko wrote:
>>>
>>> On 28.09.21 09:42, Jan Beulich wrote:
>>>> On 28.09.2021 06:18, Stefano Stabellini wrote:
>>>>> On Mon, 27 Sep 2021, Juergen Gross wrote:
>>>>>> On 27.09.21 09:35, Oleksandr Andrushchenko wrote:
>>>>>>> On 27.09.21 10:26, Jan Beulich wrote:
>>>>>>>> On 27.09.2021 08:58, Oleksandr Andrushchenko wrote:
>>>>>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com=
>
>>>>>>>>>
>>>>>>>>> Currently PCI backend implements multiple functionalities at a =
time.
>>>>>>>>> To name a few:
>>>>>>>>> 1. It is used as a database for assignable PCI devices, e.g. xl=

>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pci-assignable-{add|remov=
e|list} manipulates that list. So,
>>>>>>>>> whenever
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the toolstack needs to kn=
ow which PCI devices can be passed through
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 it reads that from the re=
levant sysfs entries of the pciback.
>>>>>>>>> 2. It is used to hold the unbound PCI devices list, e.g. when p=
assing
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 through a PCI device it n=
eeds to be unbound from the relevant
>>>>>>>>> device
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 driver and bound to pciba=
ck (strictly speaking it is not required
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 that the device is bound =
to pciback, but pciback is again used as a
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 database of the passed th=
rough PCI devices, so we can re-bind the
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 devices back to their ori=
ginal drivers when guest domain shuts
>>>>>>>>> down)
>>>>>>>>> 3. Device reset for the devices being passed through
>>>>>>>>> 4. Para-virtualised use-cases support
>>>>>>>>>
>>>>>>>>> The para-virtualised part of the driver is not always needed as=
 some
>>>>>>>>> architectures, e.g. Arm or x86 PVH Dom0, are not using backend-=
frontend
>>>>>>>>> model for PCI device passthrough. For such use-cases make the v=
ery
>>>>>>>>> first step in splitting the xen-pciback driver into two parts: =
Xen
>>>>>>>>> PCI stub and PCI PV backend drivers.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Oleksandr Andrushchenko
>>>>>>>>> <oleksandr_andrushchenko@epam.com>
>>>>>>>>>
>>>>>>>>> ---
>>>>>>>>> Changes since v3:
>>>>>>>>> - Move CONFIG_XEN_PCIDEV_STUB to the second patch
>>>>>>>> I'm afraid this wasn't fully done:
>>>>>>>>
>>>>>>>>> --- a/drivers/xen/xen-pciback/Makefile
>>>>>>>>> +++ b/drivers/xen/xen-pciback/Makefile
>>>>>>>>> @@ -1,5 +1,6 @@
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 # SPDX-License-Identifier: GPL-2.0
>>>>>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 obj-$(CONFIG_XEN_PCIDEV_BACKEND) +=3D=
 xen-pciback.o
>>>>>>>>> +obj-$(CONFIG_XEN_PCIDEV_STUB) +=3D xen-pciback.o
>>>>>>>> While benign when added here, this addition still doesn't seem t=
o
>>>>>>>> belong here.
>>>>>>> My bad. So, it seems without CONFIG_XEN_PCIDEV_STUB the change se=
ems
>>>>>>>
>>>>>>> to be non-functional. With CONFIG_XEN_PCIDEV_STUB we fail to buil=
d on 32-bit
>>>>>>>
>>>>>>> architectures...
>>>>>>>
>>>>>>> What would be the preference here? Stefano suggested that we stil=
l define
>>>>>>>
>>>>>>> CONFIG_XEN_PCIDEV_STUB, but in disabled state, e.g. we add trista=
te to it
>>>>>>>
>>>>>>> in the second patch
>>>>>>>
>>>>>>> Another option is just to squash the two patches.
>>>>>> Squashing would be fine for me.
>>>>>  =C2=A0=C2=A0 It is fine for me to squash the two patches.
>>>>>
>>>>> But in any case, wouldn't it be better to modify that specific chan=
ge to:
>>>>>
>>>>> diff --git a/drivers/xen/xen-pciback/Makefile b/drivers/xen/xen-pci=
back/Makefile
>>>>> index e2cb376444a6..e23c758b85ae 100644
>>>>> --- a/drivers/xen/xen-pciback/Makefile
>>>>> +++ b/drivers/xen/xen-pciback/Makefile
>>>>> @@ -1,6 +1,5 @@
>>>>>  =C2=A0=C2=A0 # SPDX-License-Identifier: GPL-2.0
>>>>> -obj-$(CONFIG_XEN_PCIDEV_BACKEND) +=3D xen-pciback.o
>>>>> -obj-$(CONFIG_XEN_PCIDEV_STUB) +=3D xen-pciback.o
>>>>> +obj-$(CONFIG_XEN_PCI_STUB) +=3D xen-pciback.o
>>>> But that wouldn't allow the driver to be a module anymore, would it?=

>>>
>>> Exactly. I forgot that when playing with module/built-in I was not ab=
le
>>>
>>> to control that anymore because CONFIG_XEN_PCI_STUB will always be
>>>
>>> in "y" state, thus even if you have CONFIG_XEN_PCIDEV_BACKEND=3Dm
>>>
>>> you won't be able to build it as module. So, I will probably put a co=
mment
>>>
>>> about that in the Makefile explaining the need for
>>>
>>> obj-$(CONFIG_XEN_PCIDEV_BACKEND) +=3D xen-pciback.o
>>> obj-$(CONFIG_XEN_PCIDEV_STUB) +=3D xen-pciback.o
>>
>> In case the real split between both parts of xen-pciback is done this
>> will be needed anyway.
>=20
> Yes, it will
>=20
> So, I'll put a comment in the Makefile:
>=20
> # N.B. This cannot be expressed with a single line using CONFIG_XEN_PCI=
_STUB
>=20
> # as it always remains in "y" state, thus preventing the driver to be b=
uilt as
>=20
> # a module.
>=20
> obj-$(CONFIG_XEN_PCIDEV_BACKEND) +=3D xen-pciback.o
> obj-$(CONFIG_XEN_PCIDEV_STUB) +=3D xen-pciback.o
>=20
> Will this be ok or needs some re-wording?

I'd add that CONFIG_XEN_PCIDEV_BACKEND and CONFIG_XEN_PCIDEV_STUB are
mutually exclusive.


Juergen

--------------4E1FD0FE258D97863A978DA5
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

--------------4E1FD0FE258D97863A978DA5--

--lWJdWbU42RmXa51U7mt4OnICpSJdaD3nN--

--9JPaecaKNSLG4dtwkDnNuLHkoyV401xiQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmFSwi4FAwAAAAAACgkQsN6d1ii/Ey+y
2Af9Gg7mt7iIcCHwDFkUPwaZYPLL2M/CgOZ9V8rsGKHxkAcS1dseTfKJ7MVhpV+AjxKvHXoSbN3e
1I+7/csF61/cMx+0u7UzPAhH74reMjgdv5Rhui6uidt05z2NB9AgKtXBrlL/HYKST3oRCpHyBAvs
J1bJKZphohkn5gG5WpXjKUpy8RzCzgNIyJ8fqMLAjsZHrtJU20dKPxmsACUkZGeVNmRkqV8LHPax
1ndZfVaArihLCpLSn5rblXCwnl7KaYQcCKMHF5uL0pIhsK3xmq2zWPrIlGEcyEZiv+oNUfVqBtPs
6sJ9tEYaN87Fb6vAIV9z92GZrxGQ7nkERZoqGTW9Uw==
=AoUA
-----END PGP SIGNATURE-----

--9JPaecaKNSLG4dtwkDnNuLHkoyV401xiQ--

