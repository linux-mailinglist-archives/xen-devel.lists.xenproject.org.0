Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D78B79AAA3
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 19:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599698.935233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfl4v-0007aZ-H0; Mon, 11 Sep 2023 17:52:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599698.935233; Mon, 11 Sep 2023 17:52:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfl4v-0007YF-EJ; Mon, 11 Sep 2023 17:52:05 +0000
Received: by outflank-mailman (input) for mailman id 599698;
 Mon, 11 Sep 2023 17:52:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AVcC=E3=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qfl4t-0007Y9-Tp
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 17:52:04 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e73effa5-50cb-11ee-8785-cb3800f73035;
 Mon, 11 Sep 2023 19:52:01 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id DA6475C00C2;
 Mon, 11 Sep 2023 13:51:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Sep 2023 13:51:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Sep 2023 13:51:54 -0400 (EDT)
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
X-Inumbo-ID: e73effa5-50cb-11ee-8785-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694454717; x=1694541117; bh=xJM8rof2GKKmeP61VX43KTn7lIDQhIomEcC
	pgtCeu6g=; b=SmP0A7SVC5+ocEaPbowt6TmHjZB5GhLl69aZB+b/m4dumWBiab+
	273gH85H5+9brBXnyeCqPqAy31tQ39gFeHkfZLzJrYOs8NpFi7emzWO8BggZ+Exw
	lcxOrJC1Bsve84fxvZp8k0TJmuqIu70ErO8CeTG1FWxFNU3N+X08Pyefs94JQSy5
	Vscyd7rdzBU6cPZtoKo6BUWFnZXL1kfJFzJFxJXR9618p7qq13hobm5nD1EQDYGP
	rt6itmNc/fjasLB5a9Ij32z6SI7CI7jdlo+p/zd8prMNi5UokgAs3IwHKZsDu2Dx
	oEz+vSq1nKcaof5MsMXgQWS4jiVavYKm/WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694454717; x=1694541117; bh=xJM8rof2GKKme
	P61VX43KTn7lIDQhIomEcCpgtCeu6g=; b=q093vNvjfwAfQsMgB9LVu5+r6D0PG
	anlmLnHhm8iYt3fmc55pOXf4GgfVHKyTmX6FaIZoNpnxP26E85TRlyPvE6/7Tzz+
	IoAi9aSRi7lbQbVIJgDN0aGm9jV3Yue7q04Ho9zYZB8+PQJSf98cAg8p3k3KtoVn
	aqIWay5UyP99JtSWAfFHtDvoaLvT9x2nIkGAlz3KoiO8dmYD/nwTwjhh0XPxOXXp
	Z/aZYUba6THkv2uOrd9z4RBLnvwwUv2gtGaMzPLIlQYpL0xhnIYps4MBg7m5VU/C
	gQiYRfX3fNKXShHCuBeeBGtT6406GlmjJPX0S+nOCaQtHpMIRi+lFjudw==
X-ME-Sender: <xms:vVP_ZEnnqYblgTvAGlSTZDqsHJiTjx82qABvjn8KT364El-OPWP3eA>
    <xme:vVP_ZD0sZcnwSo2jZsLB8RlZznl5_O3WrVYjr_ekxVpT42zsHSQioF_rQDQ2GF5zd
    bf039MR6dLmzss>
X-ME-Received: <xmr:vVP_ZCr8bkvH7uwMHliTs1YugRL-8zndES47JYfZyO2F_vo1w44FnAljheG_E9j_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeigedgudduiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhho
    nhcuifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhmqeenucggtffrrghtthgvrhhnpeegfeetjedvuefghedtleevgedvtddvffektefg
    vdejhfdvffehtefgvedujeejfeenucffohhmrghinhepuhgvfhhirdhorhhgpdhkvghrnh
    gvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:vVP_ZAmGavw6k8w-KZzQYtsu2PMfHujOgrGdly6yhrdqYdPe16qPyg>
    <xmx:vVP_ZC3sVsgZAZAcawgnZ_HEDFcpRjOS-pOXNaok8fVthr-QENb0iA>
    <xmx:vVP_ZHuZlaUKCrm36BXFMVYERh01-1wcmIQSZLEyHZpuhllsDAVmvQ>
    <xmx:vVP_ZHyTC7ybj9Whb6cs-b0HYzinyb6kDPLhXjNIoKOGjsUDcOJOkw>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <46959668-24b2-bf7e-7535-9fc47fcfc5e0@invisiblethingslab.com>
Date: Mon, 11 Sep 2023 19:51:24 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries marked as unusable when
 parsing MADT
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20230911101238.18005-1-simon@invisiblethingslab.com>
 <2a19aef4-8bd6-ef8e-de4b-b85135dc7ea4@suse.com>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <2a19aef4-8bd6-ef8e-de4b-b85135dc7ea4@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fuPJqSqlgMgfFxJdfAjmvk3x"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fuPJqSqlgMgfFxJdfAjmvk3x
Content-Type: multipart/mixed; boundary="------------WWBAFW3CNVMXS9nRhqLY2vxl";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
Message-ID: <46959668-24b2-bf7e-7535-9fc47fcfc5e0@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries marked as unusable when
 parsing MADT
References: <20230911101238.18005-1-simon@invisiblethingslab.com>
 <2a19aef4-8bd6-ef8e-de4b-b85135dc7ea4@suse.com>
In-Reply-To: <2a19aef4-8bd6-ef8e-de4b-b85135dc7ea4@suse.com>

--------------WWBAFW3CNVMXS9nRhqLY2vxl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 11.09.2023 12:12, Simon Gaiser wrote:
>> Up to version 6.2 Errata B [2] the ACPI spec only defines
>> ACPI_MADT_ENABLE as:
>>
>>     If zero, this processor is unusable, and the operating system
>>     support will not attempt to use it.
>>
>> The bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved with
>> "Must be zero".
>>
>> Version 6.3 [3] then adds ACPI_MADT_ONLINE_CAPABLE and changes the
>> meaning of ACPI_MADT_ENABLE:
>>
>>     Enabled
>>         If this bit is set the processor is ready for use. If this bit=

>>         is clear and the Online Capable bit is set, system hardware
>>         supports enabling this processor during OS runtime. If this bi=
t
>>         is clear and the Online Capable bit is also clear, this
>>         processor is unusable, and OSPM shall ignore the contents of t=
he
>>         Processor Local APIC Structure.
>>
>>     Online Capbable
>>         The information conveyed by this bit depends on the value of t=
he
>>         Enabled bit. If the Enabled bit is set, this bit is reserved a=
nd
>>         must be zero. Otherwise, if this this bit is set, system
>>         hardware supports enabling this processor during OS runtime.
>>
>> So with conforming firmwares it should be safe to simply ignore the
>> entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE
>>
>> As a precaution against buggy firmwares this change, like Linux [4],
>> ignores ACPI_MADT_ONLINE_CAPABLE completely if MADT revision < 5. Note=

>> that the MADT revision was already increased to 5 with spec version 6.=
2
>> Errata A [1], so before introducing the online capable flag. But it
>> wasn't changed for the new flag, so this is the best we can do here.
>>
>> For previous discussion see thread [5].
>>
>> Link: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_S=
ept29.pdf # [1]
>> Link: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_=
Jan30.pdf # [2]
>> Link: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pd=
f # [3]
>> Link: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2f=
e99644a01f # [4]
>> Link: https://lore.kernel.org/xen-devel/80bae614-052e-0f90-cf13-0e5e4e=
d1a5cd@invisiblethingslab.com/ # [5]
>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>=20
> Just to avoid misunderstandings: This change addresses a comment from
> Andrew. I does not attempt to address my feedback on the earlier change=
,
> which - as indicated - I intend to revert (timeline extended until mid
> of the week), unless by then my earlier comments are addressed or the
> suggested possible alternative is carried out.
>=20
> I think it goes without saying that this patch can't sensibly go in
> until the earlier one was properly settled upon. In particular, in case=

> of reverting aiui this patch won't even apply anymore.

It textually conflicts with the other patch [6], and obviously was
triggered by that discussion, but addresses a slightly different aspect.
The textual conflict is trivial to resolve. I wasn't sure if it also
conflicts with the concern you raised there, see below.

The other patch is about ignoring entries with invalid APIC IDs. As the
discussion there showed the spec isn't very clear on that and there are
different opinions how they should be handled. Regarding the flags the
spec is much more concrete although given the response above I assume
you also interpret "is unusable" of the old version of the
ACPI_MADT_ENABLE flag as such that Xen should still allocate resources
for those processors?

If I understood your main concern with the other patch correctly you
have seen firmwares that later update those invalid APIC IDs with valid
ones. Do those firmwares make use of the online capable flag? (Given
above response probably not)

If not, then it indeed doesn't address your concern, and I see no way,
at least by parsing MADT, how to distinguish those cases from firmwares
that have dummy entries (the motivation for these patches).

Simon

[6]: https://lore.kernel.org/xen-devel/7f158a54548456daba9f2e105d099d2e5e=
2c2f38.1691399031.git.simon@invisiblethingslab.com/

--------------WWBAFW3CNVMXS9nRhqLY2vxl--

--------------fuPJqSqlgMgfFxJdfAjmvk3x
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmT/U58ACgkQkO9xfO/x
ly/Buw/9H/hszRxHiFdp82YE4gyS0Nn5q4IF2AHgdpJ8B3J1E8dbFWWcUf8A26Za
Wfi33knuCZ6ofI6Q0w3sDyqbV+rVFrDfPvolird3g9hNstdrJy9OLGJFa7negbnj
p7NHVLxYUapMJr/08WrFFFI8XzhGJMF7yPx0YqN5hekgVBdM+2ENYoXJQBYyfm2p
D+2koQ/9tbE2JewVAS0Ea+WUnPKMPorvDL5AtCbUdyeKFdVGJVtNxxL78uOrpx9s
tICclxDMbaF5PZsDGDqzVU1MboSmBQF1wzugHlp3tvnAUGmwTFw73JbxWVxC3seG
g6EIFBKWv3vkmhKO37kAmnD2NjeabkRXtMXu7dv7FIo3LoLFWpJaywOo9iyGUZDb
hQEnh5YnqP5i1EHqM3RCr9+Px5a/2NYuFE3R7bsTRofwyToxCZeNXmMkmuedvHl7
DQEJVmXHqSQowusI7z2Y6Yn8tx4Eaz6rxzLKId2r3BSkm6XJmwaPm1kEACiG2FBe
NCnBbNNV0g4M8tFHzn8cU0w3gJ1P/w+alxS93EKwG4ZwY2qRwQynFly5vzEBhwQI
Vd+uZDSQrvGpBo020d7AUTr6SrKs3ylAlV7D+Vx4Rv4J6EFEYBfpPfIQZ5ju0+WO
qQ8Go5YR682+8YAUZ3hrRvtNZn9dDivvg5hgFhtxobTmr7RgYrc=
=PA3q
-----END PGP SIGNATURE-----

--------------fuPJqSqlgMgfFxJdfAjmvk3x--

