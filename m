Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB88343F6C3
	for <lists+xen-devel@lfdr.de>; Fri, 29 Oct 2021 07:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.218392.378804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgKfw-0005Yj-RF; Fri, 29 Oct 2021 05:43:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 218392.378804; Fri, 29 Oct 2021 05:43:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mgKfw-0005Wx-O3; Fri, 29 Oct 2021 05:43:36 +0000
Received: by outflank-mailman (input) for mailman id 218392;
 Fri, 29 Oct 2021 05:43:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3izX=PR=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1mgKfv-0005Wr-EN
 for xen-devel@lists.xenproject.org; Fri, 29 Oct 2021 05:43:35 +0000
Received: from smtp-out2.suse.de (unknown [195.135.220.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a586b931-5579-48ac-ac47-be7ddfb8d9ce;
 Fri, 29 Oct 2021 05:43:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 99D0B1FD62;
 Fri, 29 Oct 2021 05:43:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4969813AE9;
 Fri, 29 Oct 2021 05:43:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gEYGEAWKe2HDUQAAMHmgww
 (envelope-from <jgross@suse.com>); Fri, 29 Oct 2021 05:43:33 +0000
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
X-Inumbo-ID: a586b931-5579-48ac-ac47-be7ddfb8d9ce
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1635486213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=w8qnuh6NKeWK8CUZKe2fxzHcUtWJLDFvEgoVy0TQ3H8=;
	b=CuN8zqc7FXWe7JJB3e0RaI7fApYnSfqOk5VScYYESql2ja1+fhTGd7u0itqs0yXD58D/DD
	d3Qctcar1jEYmDdhJNGV48RqeL4VDK7xpam1DmK9FcUqdf0+bslIhi7gFD+uInhTjHuHCL
	7qZ5PjGGtta/+bkBs2Bzf4PlhwQWc08=
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com,
 wl@xen.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-2-sstabellini@kernel.org>
 <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com>
 <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com>
 <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s>
 <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com>
 <alpine.DEB.2.21.2110271543150.20134@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110271619240.20134@sstabellini-ThinkPad-T480s>
 <4f82901a-2e74-f4ee-311e-b8187d856745@suse.com>
 <alpine.DEB.2.21.2110280939130.20134@sstabellini-ThinkPad-T480s>
From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
Message-ID: <bf4c4138-2bd3-4fcb-b279-9f21495a20cc@suse.com>
Date: Fri, 29 Oct 2021 07:43:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2110280939130.20134@sstabellini-ThinkPad-T480s>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="aaoTVkTsdCnKxrv9qpQYkb4ljIpnyQMjA"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--aaoTVkTsdCnKxrv9qpQYkb4ljIpnyQMjA
Content-Type: multipart/mixed; boundary="qyBtStghmxWAQUApAxQujhDGdFBHIsCd1";
 protected-headers="v1"
From: Juergen Gross <jgross@suse.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com,
 wl@xen.org, anthony.perard@citrix.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
Message-ID: <bf4c4138-2bd3-4fcb-b279-9f21495a20cc@suse.com>
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s>
 <20211021230839.10794-2-sstabellini@kernel.org>
 <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com>
 <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
 <d559b765-9e38-00bd-039b-9c33845b8e54@suse.com>
 <alpine.DEB.2.21.2110251753200.4586@sstabellini-ThinkPad-T480s>
 <8c0a2a97-04ab-4836-fc35-026dd7c122a4@suse.com>
 <alpine.DEB.2.21.2110271543150.20134@sstabellini-ThinkPad-T480s>
 <alpine.DEB.2.21.2110271619240.20134@sstabellini-ThinkPad-T480s>
 <4f82901a-2e74-f4ee-311e-b8187d856745@suse.com>
 <alpine.DEB.2.21.2110280939130.20134@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2110280939130.20134@sstabellini-ThinkPad-T480s>

--qyBtStghmxWAQUApAxQujhDGdFBHIsCd1
Content-Type: multipart/mixed;
 boundary="------------00C444EF7015E3FAD7CEB0EB"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------00C444EF7015E3FAD7CEB0EB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

On 28.10.21 18:41, Stefano Stabellini wrote:
> On Thu, 28 Oct 2021, Juergen Gross wrote:
>> On 28.10.21 01:24, Stefano Stabellini wrote:
>>> On Wed, 27 Oct 2021, Stefano Stabellini wrote:
>>>> On Wed, 27 Oct 2021, Juergen Gross wrote:
>>>>> On 26.10.21 02:54, Stefano Stabellini wrote:
>>>>>> On Mon, 25 Oct 2021, Juergen Gross wrote:
>>>>>>> On 22.10.21 21:41, Stefano Stabellini wrote:
>>>>>>>> +Juergen
>>>>>>>>
>>>>>>>> On Fri, 22 Oct 2021, Andrew Cooper wrote:
>>>>>>>>> On 22/10/2021 00:08, Stefano Stabellini wrote:
>>>>>>>>>> +# build depends
>>>>>>>>>> +RUN apt-get update && \
>>>>>>>>>> +    apt-get --quiet --yes install \
>>>>>>>>>> +        build-essential \
>>>>>>>>>> +        libssl-dev \
>>>>>>>>>> +        bc \
>>>>>>>>>> +        curl \
>>>>>>>>>> +        flex \
>>>>>>>>>> +        bison \
>>>>>>>>>> +        libelf-dev \
>>>>>>>>>> +        && \
>>>>>>>>>> +    \
>>>>>>>>>> +    # Build the kernel
>>>>>>>>>> +    curl -fsSLO
>>>>>>>>>> https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VER=
SION".tar.xz
>>>>>>>>>> && \
>>>>>>>>>> +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
>>>>>>>>>> +    cd linux-"$LINUX_VERSION" && \
>>>>>>>>>> +    make defconfig && \
>>>>>>>>>> +    make xen.config && \
>>>>>>>>>> +    cp .config .config.orig && \
>>>>>>>>>> +    cat .config.orig | grep XEN | grep =3Dm |sed 's/=3Dm/=3Dy=
/g' >>
>>>>>>>>>> .config
>>>>>>>>>> && \
>>>>>>>>>> +    make -j$(nproc) bzImage && \
>>>>>>>>>
>>>>>>>>> defconfig is huuuuge.=C2=A0 Can we use tinyconfig instead?
>>>>>>>>>
>>>>>>>>> Also, you want to turn off CONFIG_MODULES seeing as you only
>>>>>>>>> copy
>>>>>>>>> bzImage to the test.
>>>>>>>>>
>>>>>>>>> This also fixes the fact that `grep XEN` also matches
>>>>>>>>> CONFIG_NETXEN_NIC
>>>>>>>>> which has nothing to do with Xen.
>>>>>>>>
>>>>>>>> Tinyconfig would be a good idea but it crashes on QEMU with the
>>>>>>>> appended
>>>>>>>> boot log. I did:
>>>>>>>>
>>>>>>>> # make tinyconfig
>>>>>>>> # make xen.config
>>>>>>>> # make bzImage
>>>>>>>>
>>>>>>>> Of course we could have our own tailored special kernel config f=
or
>>>>>>>> this
>>>>>>>> kernel but I like the simplicify of "make tinyconfig" or "make
>>>>>>>> defconfig" followed by "make xen.config".
>>>>>>>>
>>>>>>>> Unless you know one kconfig option or two that we need to add to=

>>>>>>>> tinyconfig to make it work my preference is to go with defconfig=

>>>>>>>> for
>>>>>>>> now.
>>>>>>>
>>>>>>> You will need to add the dom0 and SMP related config options at
>>>>>>> least.
>>>>>>>
>>>>>>> I'll have a look at config.xen, which is a little bit weird: it
>>>>>>> configures the backends, but not dom0.
>>>>>>
>>>>>> Thanks, it would be good if make tinyconfig && make xen.config wou=
ld
>>>>>> just work on QEMU. In the meantime I'll keep defconfig for this te=
st,
>>>>>> we
>>>>>> can always improve later.
>>>>>
>>>>> Can you please test the attached patch?
>>>>
>>>> Yes, that works, thanks!
>>>
>>> Sorry, I spoke too soon: same error as before:
>>>
>>> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/17229096=
07/raw
>>>
>>> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
>>>
>>> No output from the kernel.
>>
>> This is not very surprising, as tinyconfig doesn't have CONFIG_PRINTK.=

>> BTW, it doesn't have initrd support either (BLK_DEV_RAM and
>> BLK_DEV_INITRD), so I added those to xen.config as well.
>>
>> With the (updated) attached patch the kernel boots fine as dom0 until
>> rootfs is tried to be mounted on a physical machine.
>>
>> I've added CONFIG_BUG, too, in order to have more debugging output if
>> needed.
>=20
> Much better, now there is output:
> https://gitlab.com/xen-project/people/sstabellini/xen/-/jobs/1726396600=
/raw
>=20
> This kernel is used as dom0 and from the logs it looks like for dom0 we=

> need a couple more things:
> - flocks

CONFIG_FILE_LOCKING probably wants to be added.

> - the kconfig to recognize #!/bin/sh

This is probably CONFIG_BINFMT_SCRIPT.

I'm not sure those should be added to the upstream xen.config.


Juergen

--------------00C444EF7015E3FAD7CEB0EB
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

--------------00C444EF7015E3FAD7CEB0EB--

--qyBtStghmxWAQUApAxQujhDGdFBHIsCd1--

--aaoTVkTsdCnKxrv9qpQYkb4ljIpnyQMjA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEhRJncuj2BJSl0Jf3sN6d1ii/Ey8FAmF7igQFAwAAAAAACgkQsN6d1ii/Ey9T
SQf/bzR34G8TGpKCfe6/SPYU4o6+gOavvVocoDI70P5vTWaUFSs5KKWjtI2vlVPM0MxTzAFJ64qZ
1oopQ0aW/6dU6ek3Pv5GiisPTbBrYPe5VI23tvXDCg9Kp0XPoobqzJa/n8qk6tjzh1C13wTagqcF
cG7KAkfhjxUYqI0mLXIONuxmZToMM2pmJmaofpJ5SZMe9JnCuoZziFz2fRjWZn8aDtMTtiwTi/QQ
dCmUanY2sGOjEGJRf3/HWTZfJENXIX9iPysjSO4vtUq1zZcGojeHQiuIeLTynFwW68ZI3sSgxJUR
LE2Xz8/c6HwQGO40QqCuRVXWcu8VB7gUd2p0JyjYHA==
=aocm
-----END PGP SIGNATURE-----

--aaoTVkTsdCnKxrv9qpQYkb4ljIpnyQMjA--

