Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F4771DAB
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 11:59:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.577949.905084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx1F-0004el-7D; Mon, 07 Aug 2023 09:59:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 577949.905084; Mon, 07 Aug 2023 09:59:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSx1F-0004cr-4M; Mon, 07 Aug 2023 09:59:21 +0000
Received: by outflank-mailman (input) for mailman id 577949;
 Mon, 07 Aug 2023 09:59:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSx1E-0004cl-7M
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 09:59:20 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11ce40e8-3509-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 11:59:17 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6EE3B320092E;
 Mon,  7 Aug 2023 05:59:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 07 Aug 2023 05:59:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 05:59:11 -0400 (EDT)
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
X-Inumbo-ID: 11ce40e8-3509-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691402353; x=1691488753; bh=NnJHsNHV4OfsrSbJcrxixDSVctE5Vm1FZDV
	XQonRK28=; b=IYZSjhevKZ39mQ5YchWxKBlYvjz7kYLK5zX4FfKNbd8l7ZR1Gy7
	QRTnjPkTR46sVXUwg92DNaR1or3MhxNkLovS6J3e/0EL2l3944O2WcbMXpE05AtQ
	aNsJNilWZZ5+V5z2sJZPUv7DW6WYccwQjysHf9o+4iKrXrJyWFfmNcSKdyMREpeH
	ploW+KPPFQRskYde8Xwj/FJpcnEjlyKgfjCtHq3116bjFLxXYWKbbh+/dFL8UI/p
	sfaINnLc5+NSWUPXZI59Hq8ZAFcs8Zkx1PvEWI3QirEJhSvSVKLonZ1vPD++su+P
	vSHXwGgzCC780j0d0ZE89togH7JudZqzFJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691402353; x=1691488753; bh=NnJHsNHV4Ofsr
	SbJcrxixDSVctE5Vm1FZDVXQonRK28=; b=Aj3BZ5wbQYvBfg1O4InTRenouxvBd
	jK61yrF4KSCnoLfUu4cxfvuMbBcT2fIsGo3Om/TExg/Dm6rm0PsQ1Zt7HTXe9yI1
	A8CUWmgfo0DCcb/r1ymzcgCnoGomZJJzHtN4uAZDdoQe+Pj1TZffsMUEmkzyysLK
	5h1omZXG7HreA0p7bWCb9L/b2/D5tEiKzamzNR88tsjvKyBcMLHHCuwB+h7mmWzA
	h/VJz77nLLuGCdwcp126o3JUNqr08nyby+MArdzDsGO4ZxBb/EWXkAXb1bum7OKm
	U1yZxfmSJgBgHuRv2vkaW4Q4g04JtvNMqs5ot+ufz0IfKHWuKhHyJk2RQ==
X-ME-Sender: <xms:ccDQZF81rdqzWv0gwLrCQCuUqm-6gi4pV__C89r9r-E6UM1kzwg-6w>
    <xme:ccDQZJsvPZdvD89PqJM0EdN6aEUozMVw1r5oAbJp4XooFxPv1Pmu2_AUFyqLOi9EC
    SnAJT3hyMCHQ-A>
X-ME-Received: <xmr:ccDQZDDfFqJ097K-I0XMKMi7tc1MzdFK_3caKJXyg84aItToaPc-MYQb9WTa-F7CqhsunLwbaBtkL6HSzenlork>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgddvudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:ccDQZJeTZTWkiKyk7vFzTlY5M2Ve3ToC3pr_JNw7EbKudg1_6KNqTw>
    <xmx:ccDQZKNFUTxl-UMhuBnFCm52IWrvdyYBhkVHAjXwqK8S9xJsuus56g>
    <xmx:ccDQZLm0VcBkrrj8UwFAwT82GYBKqbWldhWl1rkNw-7CizUmNafJGw>
    <xmx:ccDQZJfWjYWAB6Id4D-tPBMxmmnPMzpoFcEpsMwEXU5hQ2msy1Zyqg>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <ca8bec9e-69d0-0a51-5553-ff8c9423d8bb@invisiblethingslab.com>
Date: Mon, 7 Aug 2023 11:58:57 +0200
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amzn.com>,
 xen-devel@lists.xenproject.org
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
 <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
 <d01574a2-962f-20a5-281f-7672a06b5f10@suse.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <d01574a2-962f-20a5-281f-7672a06b5f10@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------suLZkn5eJE6TTbWMj8Dz7Q7b"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------suLZkn5eJE6TTbWMj8Dz7Q7b
Content-Type: multipart/mixed; boundary="------------mpW42AXmdBj07vPFTjgkt9Mo";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Wei Liu <wei.liu2@citrix.com>, KarimAllah Ahmed <karahmed@amazon.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Jan_H=2e_Sch=c3=b6nherr?= <jschoenh@amazon.de>,
 Matt Wilson <msw@amazon.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Anthony Liguori <aliguori@amzn.com>,
 xen-devel@lists.xenproject.org
Message-ID: <ca8bec9e-69d0-0a51-5553-ff8c9423d8bb@invisiblethingslab.com>
Subject: Re: [Xen-devel] [PATCH v2 04/23] x86: Don't use potentially incorrect
 CPUID values for topology information
References: <1515356919-922-1-git-send-email-aliguori@amzn.com>
 <1515356919-922-5-git-send-email-aliguori@amzn.com>
 <df21a319-b8a4-bb14-ac43-20035d04d4a2@invisiblethingslab.com>
 <d01574a2-962f-20a5-281f-7672a06b5f10@suse.com>
In-Reply-To: <d01574a2-962f-20a5-281f-7672a06b5f10@suse.com>

--------------mpW42AXmdBj07vPFTjgkt9Mo
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 07.08.2023 10:18, Simon Gaiser wrote:
>> Anthony Liguori:
>>> From: Jan H. Sch=C3=B6nherr <jschoenh@amazon.de>
>>>
>>> Intel says for CPUID leaf 0Bh:
>>>
>>>   "Software must not use EBX[15:0] to enumerate processor
>>>    topology of the system. This value in this field
>>>    (EBX[15:0]) is only intended for display/diagnostic
>>>    purposes. The actual number of logical processors
>>>    available to BIOS/OS/Applications may be different from
>>>    the value of EBX[15:0], depending on software and platform
>>>    hardware configurations."
>>>
>>> And yet, we're using them to derive the number cores in a package
>>> and the number of siblings in a core.
>>>
>>> Derive the number of siblings and cores from EAX instead, which is
>>> intended for that.
>>>
>>> Signed-off-by: Jan H. Sch=C3=B6nherr <jschoenh@amazon.de>
>>> ---
>>>  xen/arch/x86/cpu/common.c | 4 ++--
>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
>>> index e9588b3..22f392f 100644
>>> --- a/xen/arch/x86/cpu/common.c
>>> +++ b/xen/arch/x86/cpu/common.c
>>> @@ -479,8 +479,8 @@ void detect_extended_topology(struct cpuinfo_x86 =
*c)
>>>     initial_apicid =3D edx;
>>> =20
>>>     /* Populate HT related information from sub-leaf level 0 */
>>> -   core_level_siblings =3D c->x86_num_siblings =3D LEVEL_MAX_SIBLING=
S(ebx);
>>>     core_plus_mask_width =3D ht_mask_width =3D BITS_SHIFT_NEXT_LEVEL(=
eax);
>>> +   core_level_siblings =3D c->x86_num_siblings =3D 1 << ht_mask_widt=
h;
>>> =20
>>>     sub_index =3D 1;
>>>     do {
>>> @@ -488,8 +488,8 @@ void detect_extended_topology(struct cpuinfo_x86 =
*c)
>>> =20
>>>             /* Check for the Core type in the implemented sub leaves =
*/
>>>             if ( LEAFB_SUBTYPE(ecx) =3D=3D CORE_TYPE ) {
>>> -                   core_level_siblings =3D LEVEL_MAX_SIBLINGS(ebx);
>>>                     core_plus_mask_width =3D BITS_SHIFT_NEXT_LEVEL(ea=
x);
>>> +                   core_level_siblings =3D 1 << core_plus_mask_width=
;
>>
>>
>> On the i5-1135G7 (4 cores with each 2 threads) I'm currently testing o=
n
>> I noticed that this changes leads to core_level_siblings =3D=3D 16 and=

>> therefore x86_max_cores =3D=3D 8. If read from ebx like before this ch=
ange
>> and what Linux is still doing [1] it reads core_level_siblings =3D=3D =
8 (as
>> expected?).
>>
>> What's the expected semantic here? If it's to derive the actual number=

>> of siblings (and therefore cores) in a package as the commit message
>> suggest, the new code can't work even ignoring the example from my tes=
t
>> system. It will always produce powers of 2, so can't get it right on a=

>> system with, say, 6 cores.
>=20
> The only use of the variable in question is in this statement:
>=20
>       c->x86_max_cores =3D (core_level_siblings / c->x86_num_siblings);=

>=20
> Note the "max" in the name. This is how many _could_ be there, not how
> many _are_ there, aiui.

I'm indeed not quite sure on the intended semantic, hence the question
(although it's not clear to me what case that "could" would cover here).

It doesn't have to be identical but Linux says for it's version of the
variable:

    The number of cores in a package. This information is retrieved via
    CPUID.

And if I look at it's usage in set_nr_sockets in Xen:

    nr_sockets =3D last_physid(phys_cpu_present_map)
                 / boot_cpu_data.x86_max_cores
                 / boot_cpu_data.x86_num_siblings + 1;

It seems to be also be used in this meaning. At least on my test system
I get last_physid =3D=3D 7 (as I would have expected for 8 logical cpus).=
 So
dividing this by the 4 (number of cores) and 2 (threads per core) is
what I think was intended here.

Simon

--------------mpW42AXmdBj07vPFTjgkt9Mo--

--------------suLZkn5eJE6TTbWMj8Dz7Q7b
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmTQwGMACgkQkO9xfO/x
ly910g//btGBpAMajhFtMxVqr9mciThE8/H86UuVN9Dw9EgaMexo12ulQLLoj0E6
mZTA1oJ/Yi560VJwCGhKOG3PMFh8XnFCGw8zLYYYsHhnrWaPknx7t3tC9ZsHBUA9
zx8gdCZGM9AsnwVL3Sv1nwAVwCqHHiA8+5BcOLzgBMc9MbV3NLOrrQNTagI96KWP
njyZs9a7r6+5yGwUD4ypHmu4yC6Qj2FBhMcG8xuAcxV0VMYz9imq4lcVEF0qL4BA
nsqtMHGGh6S3AUJ6zt+k9kVpVIhPkOH/c4NsP7j1tsE6nMd5Uoc0MvqRhsIygYpd
6+wHTnnXUPtvxpBY5TKYt1N01zKZmP3dJiyRhgUs9uAwNQ/kWdSOXFSRlD4AFIl/
Oj1RtLLdSQMp5Lzwu7w0cTEkYfVk5zD66Ku7R4SdkJz3n9P0a8EXy/4iX41cMGem
MrMjIdp0BvLs9W2APz6wQ6QQa56dQ7zuSCQ8mxAnZagm2bRd5Jc6jhT5om8V4K8s
YQX5+vNUQvM/ILwFNfUSci0KAnklRE3YcIG0oUZFE03EfW5/KZZ3yiS9JZZvBqsV
O5SU8rfkBUN8rd73JcRqDoly5ypLsuyHs+HMUx5azk7vIglk6EO9nPUqs7cUUVui
0gim1f1HLhS2xeN23iD1ALWzmeUSAcp76vOuF1csLOQTYglgnJw=
=9E1i
-----END PGP SIGNATURE-----

--------------suLZkn5eJE6TTbWMj8Dz7Q7b--

