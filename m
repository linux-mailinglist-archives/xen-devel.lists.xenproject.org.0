Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 675674EB1BF
	for <lists+xen-devel@lfdr.de>; Tue, 29 Mar 2022 18:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295891.503689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZEbn-000171-TB; Tue, 29 Mar 2022 16:22:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295891.503689; Tue, 29 Mar 2022 16:22:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZEbn-00014O-Pu; Tue, 29 Mar 2022 16:22:15 +0000
Received: by outflank-mailman (input) for mailman id 295891;
 Tue, 29 Mar 2022 16:22:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fAbQ=UI=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nZEbm-00014I-8L
 for xen-devel@lists.xenproject.org; Tue, 29 Mar 2022 16:22:14 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62b53573-af7c-11ec-a405-831a346695d4;
 Tue, 29 Mar 2022 18:22:12 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C9F95C00CE;
 Tue, 29 Mar 2022 12:22:10 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 29 Mar 2022 12:22:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Mar 2022 12:22:09 -0400 (EDT)
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
X-Inumbo-ID: 62b53573-af7c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Sq9MwfUHKw9epayjl
	cOgXQRPPM3dTjwiwxhxxvuyQpM=; b=jqWPCQ4ImYjiO/sk3XSplYsDQml5Jl5+8
	TTm+X+uFHMKg7S4PkzS4VrpFZzohhS5Ufut58WcIe0lRS7WysNmOaSg2hSgPUYCz
	deajlZg4xSTkNLpxwNgTquoHTk/UfCvP/gP+0cWjWJSEVExg/a7gcwoDsPMZU791
	O3mfETbTcCnCoXymgjbuZWB0SF++Lp7coY50XSG0/jCfzQM4iaEk2o0O+xluONlD
	n9omeUXN8MYnJgj08cYLA/+KVJJ0zKXHou/mGTMAxDCT3xLKd3CHKT/x6WESwdyO
	+c59kca0dkl2MCn5d95ZRdkQ7mRmdUaWOnUdpQBE/nytG+b8fo/MA==
X-ME-Sender: <xms:MTJDYppSv4_JfJxTozMRY53BQS1BAGk-55SNS2y07XlIrnklSKdfVw>
    <xme:MTJDYrqjmhI5MXGpm-yfPlTPTLgNCn20QnLSTmI4HbbYeOCwDAIIwU-JBAPrBAIzu
    30H7gLYioXP98o>
X-ME-Received: <xmr:MTJDYmMqyQ2tL8IOxuT_YMPdHdcmG1HxFaXytAQ4ul7pUWGaI47JnrKByekHbZU-P0aGSQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeitddgjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffgggfvfhfhffujggtsehgtderredtfeejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuudegudfgteefjeefhedtgfegteff
    ledvgedvjeethffhkeefleduteevudfhueenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:MTJDYk5q48zf8O7aDVWROPbWx1e1iX1anUaHg37CO8YlSLjlvZhZkg>
    <xmx:MTJDYo4bgm7y8E4g-GoSp1IIgEUdRYxQbKb1perZaNdYZGD6FQvACw>
    <xmx:MTJDYsjr9f3vZZvvMpuMsys48Rbrmkj_50e6JsSERXLOLJscQUVEYQ>
    <xmx:MjJDYmkCtaslsF2D1za1IoaBoC6fmKl-BS9Y3C0Hjovg9RFmrnkaeA>
Message-ID: <1616233d-cbbe-6e45-356c-f99a57acf288@invisiblethingslab.com>
Date: Tue, 29 Mar 2022 12:22:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Mark Kettenis <mark.kettenis@xs4all.nl>, djm@mindrot.org,
 roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 xen-devel@lists.xenproject.org, tech@openbsd.org
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
 <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
 <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl>
 <10e7b01a-2a8e-17cd-6418-1a6f836cc251@invisiblethingslab.com>
 <YkLAT3AJk9usjIkD@diehard.n-r-g.com>
From: Demi Marie Obenour <demi@invisiblethingslab.com>
Subject: Re: Security support status of xnf(4) and xbf(4)
In-Reply-To: <YkLAT3AJk9usjIkD@diehard.n-r-g.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vxttd3Eb7GwmegudxlPdgs00"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------vxttd3Eb7GwmegudxlPdgs00
Content-Type: multipart/mixed; boundary="------------xdvF1D0IYzQfMBJbOMVOd0P0";
 protected-headers="v1"
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Mark Kettenis <mark.kettenis@xs4all.nl>, djm@mindrot.org,
 roger.pau@citrix.com, marmarek@invisiblethingslab.com,
 xen-devel@lists.xenproject.org, tech@openbsd.org
Message-ID: <1616233d-cbbe-6e45-356c-f99a57acf288@invisiblethingslab.com>
Subject: Re: Security support status of xnf(4) and xbf(4)
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
 <c904abda-e6a0-256e-478a-ee0909c17e50@invisiblethingslab.com>
 <d3ccc20d61dc7636@bloch.sibelius.xs4all.nl>
 <10e7b01a-2a8e-17cd-6418-1a6f836cc251@invisiblethingslab.com>
 <YkLAT3AJk9usjIkD@diehard.n-r-g.com>
In-Reply-To: <YkLAT3AJk9usjIkD@diehard.n-r-g.com>

--------------xdvF1D0IYzQfMBJbOMVOd0P0
Content-Type: multipart/mixed; boundary="------------aUgANmB4F9DEhKAky5I0jRAX"

--------------aUgANmB4F9DEhKAky5I0jRAX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3/29/22 04:16, Claudio Jeker wrote:
> On Mon, Mar 28, 2022 at 04:38:33PM -0400, Demi Marie Obenour wrote:
>> On 3/28/22 10:39, Mark Kettenis wrote:
>>>> Date: Mon, 28 Mar 2022 09:51:22 -0400
>>>> From: Demi Marie Obenour <demi@invisiblethingslab.com>
>>>>
>>>> On 3/27/22 21:45, Damien Miller wrote:
>>>>> On Fri, 25 Mar 2022, Demi Marie Obenour wrote:
>>>>>
>>>>>> Linux=E2=80=99s netfront and blkfront drivers recently had a secur=
ity
>>>>>> vulnerability (XSA-396) that allowed a malicious backend to potent=
ially
>>>>>> compromise them.  In follow-up audits, I found that OpenBSD=E2=80=99=
s xnf(4)
>>>>>> currently trusts the backend domain.  I reported this privately to=
 Theo
>>>>>> de Raadt, who indicated that OpenBSD does not consider this to be =
a
>>>>>> security concern.
>>>>>>
>>>>>> This is obviously a valid position for the OpenBSD project to take=
, but
>>>>>> it is surprising to some (such as myself) from the broader Xen
>>>>>> ecosystem.  Standard practice in the Xen world is that bugs in fro=
ntends
>>>>>> that allow a malicious backend to cause mischief *are* considered
>>>>>> security bugs unless there is explicit documentation to the contra=
ry.
>>>>>> As such, I believe this deserves to be noted in xnf(4) and xbf(4)=E2=
=80=99s man
>>>>>> pages.  If the OpenBSD project agrees, I am willing to write a pat=
ch,
>>>>>> but I have no experience with mandoc so it might take a few tries.=

>>>>>
>>>>> Hang on, what is a "malicious backend" in this context? Is it somet=
hing
>>>>> other than the Xen Hypervisor? If not, then it seems not to be a us=
eful
>>>>> attack model, as the hypervisor typically has near-complete access =
to
>>>>> guests' memory and CPU state.
>>>>
>>>> The backend can run in any Xen VM.  It often runs in dom0, but it
>>>> is not required to, and in Qubes OS the network backend never runs
>>>> in dom0.  Unless it runs in dom0, it has no access to frontend memor=
y,
>>>> except for memory the frontend has explicitly given it access to via=

>>>> grant tables.
>>>
>>> So this is somewhat similar to the situation on sun4v (Sun's
>>> virtualization of the SPARC architecture).  When writing the vnet(4)
>>> and vdsk(4) drivers for OpenBSD, I did consider the implications of
>>> those drivers talking to a "malicious" domain.  the SPARC hypervisor
>>> implements a concept similar to grant tables.  It is fairly obvious
>>> that any memory you grant access to should be considered insecure.
>>> This means that you either have to make a copy of the data or revoke
>>> access to the shared memory through some sort of Hypervisor call that=

>>> implements a synchronization point of some sorts.  Otherwise you and
>>> up TOCTOU issues all over the place.  But this obviously has
>>> significant performance consequences.  For vnet(4) I decided that an
>>> extra copy was worth doing and the only reasonable way of doing thing=
s
>>> given how OpenBSD's mbuf layer works.  But for vdsk(4) I decided to
>>> trust the other domain as there is no way to prevent it from feeding
>>> you compromised data.  Full disk encryption doesn't really solve the
>>> problem unless you have a way to securely verify the bootloader.
>>
>> In Qubes OS, xbf(4) devices are configurable.  While all of them are
>> provided by dom0 (which is trusted) by default, it is possible to
>> attach devices that are *not* provided by dom0, and these devices
>> should not be trusted.
>>
>>> Personally I think it might be beneficial for us to turn xnf(4) into
>>> what we colloquially call a "bcopy" network driver.  But folks who
>>> actually use xen may find the performance impact of doing this
>>> unacceptable and decide to trust the backend instead.
>>
>> You actually don=E2=80=99t have to do that.  The Xen network protocol
>> requires the backend to drop access to the buffer before giving it
>> to the frontend, so the frontend only needs to ensure that it cannot
>> regain access.  This will fail if the backend still has access, but
>> that is a bug in the backend, in which case you should shut down the
>> interface.  So there should not be any significant performance impact.=

>>
>> If you are curious about how Linux does this, you can look at
>> drivers/xen/grant-table.c, drivers/net/xen-netfront.c, and
>> drivers/block/xen-blkfront.c from the Linux source.  They are
>> dual licensed GPL/MIT so there should not be licensing issues there.
>> Be sure to use a version at or after =E2=80=9Cxen/netfront: react prop=
erly to
>> failing gnttab_end_foreign_access_ref()=E2=80=9D and the other XSA-396=
 patches.
>=20
> So how does xen manage to limit access to less than a page size?
> The hardware on x86 does not give you byte precise mappings for grantin=
g
> memory.
> An mbuf is 256 bytes and of those 256 bytes less then that is used for
> data. Still for dma the full 4k page needs to be granted to the host.
> The only way this can be done is by memcpy all data into individual pag=
es.
> The same is true for the most common mbuf cluster size of 2k.

I was not aware that the OpenBSD mbuf layer could not handle the
approach I described.  Sorry for the misunderstanding.

> So yes, this will be a bcopy ethernet driver and by that will be on the=

> same level of crappyness as bce(4) and old old old realtek.

Mark, is there any way this could be made tunable at runtime?

> If you can trust the host don't run your vm on that host.

As Marek has stated, in Qubes OS the network backend is not considered
to be part of the host.  The host has no network access whatsoever.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab
--------------aUgANmB4F9DEhKAky5I0jRAX
Content-Type: application/pgp-keys; name="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Disposition: attachment; filename="OpenPGP_0xB288B55FFF9C22C1.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dx+Ro
-----END PGP PUBLIC KEY BLOCK-----

--------------aUgANmB4F9DEhKAky5I0jRAX--

--------------xdvF1D0IYzQfMBJbOMVOd0P0--

--------------vxttd3Eb7GwmegudxlPdgs00
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJDMjAACgkQsoi1X/+c
IsG+sA/9ENFM77f3YeE6js4tqb+ONsV29VLe22kj91p45pgXwpNoCZO6G6HqfpA7
iyzz7hcW48LbM6ZjgtZeaDgPWm7b13FfOx6kt2D1EoFTgbZODPLDkle/heTFQLvn
afMo1W3S3v+Dc4rzzHFFaby7VabzrzeMjyj9kxQoafhgRVJSQ3fXr2b9uER4OA3b
hf1ZTB44JDO9B5FMty3XzlvI9r/C1HXrGppE71mtFwDK+uBe9JFoKsbCFgG7H9Os
bpdKkaj5Ie7BkyQj2d9YbEGJA/e0sl1+vwxw7XSlaw7WxmkvSs8Af7gZ1/7ulWE7
Uz7KNTjZpdN9FL8mVU0aI1o7U7p1+GEfpqwfARlFE5VCdrwIslN6/k3U0RPWLlJQ
QeS2cDxuZUN5QyvzquthT4rtHInLUtO2creH+Zn6NNdN2ZyBl6YGHPmVomDL6KmK
ksBH22i7e1iq/cWb3aJunU+7Cl6bGrbT8rAVDoZSzkpjyLTppyee7ZkUMGfzZz+M
EjDnJSgoq/HSB0risV5U85SoeRHMH2C28XAy+FgJ/8y3D0jPz4q/4K44PvYr/bj3
5+WxERf2kPH51qeu73wdMMCtu3FoiPg/MLpCZheP9QAjsXX+fhKmF+L/qStZ9fNx
PTCAqAkc7GkNFWm2DnfRhj+v8d4e5/RqPZ6mvFHP4RPF0meFAvY=
=fWiF
-----END PGP SIGNATURE-----

--------------vxttd3Eb7GwmegudxlPdgs00--

