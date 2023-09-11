Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B179A735
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 12:18:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.599241.934563 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdzu-0002r3-AB; Mon, 11 Sep 2023 10:18:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 599241.934563; Mon, 11 Sep 2023 10:18:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfdzu-0002oL-6r; Mon, 11 Sep 2023 10:18:26 +0000
Received: by outflank-mailman (input) for mailman id 599241;
 Mon, 11 Sep 2023 10:18:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AVcC=E3=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qfdzt-0002oB-FJ
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 10:18:25 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8981bc44-508c-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 12:18:23 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 97BBB5C010C;
 Mon, 11 Sep 2023 06:18:22 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 11 Sep 2023 06:18:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Sep 2023 06:18:19 -0400 (EDT)
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
X-Inumbo-ID: 8981bc44-508c-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694427502; x=1694513902; bh=ScrWZQKwX09Lm7cCEF/K+QNOvN5j9Emk7tI
	4RlnwZ5c=; b=pMqI5KrZkQ/SsOlVH7pURqGlQH2U8W5r90ZXuyxFLMpoqyFpMLH
	qW9Dw9mpTx0w91uIAIg7Qs4HTu8HQCUuNZZ9KhqVTfb2GF5k6gUHvR2ViSnHCQqM
	mdppOtquqzqs/XhYcovIHrOfWLhDzd+plFRQFj6YwU/JzF1oWb4deIFN3zpAdh3I
	S6AE46mQCq2zcjjoEkBPSE0avUlyhOrq/zB7oxNpEVJOlHpe72YWsJiGaBd5uFJv
	0YLi8LUzE8E2SZDDP1pjwzvU7yXkE1G9h2YUZiWixEc6G+NUYkPn+A0Aib4kpOCp
	kKxtU9Cd6fNH7Vlp1H+aAaLpyalxC19s2+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694427502; x=1694513902; bh=ScrWZQKwX09Lm
	7cCEF/K+QNOvN5j9Emk7tI4RlnwZ5c=; b=PgDJ0LKmMN3ROFV1GcI4kFYBfzuCE
	wx8ro7McPucHqRKFQEJ1lfp7zKzMh6X9VWQQ1ClNkanyOLrmCjF1tF0XBD39S6WT
	XpK/L2jIF+OEitFtKB4Gn5oxrfMlRimWYicHYdo7zerNCE+bNKslmPJJuY95DUUI
	39N2eZ+rYoWf9C35P5Ns2f2yvpE6Jb6G03YMri3uoECEiSicDhWyZCfoel3TRf9f
	mcjz9vNmcneOa+Nsolbb0iZ6m0oKJWpo9K8MzpGOmvCFuA5orDk0U7zHGaML7f9P
	I1qQMiJHb2e/V/LqF+hQm83U5mt/FhQ8N/8DCNfzeZ9XpVGGqbeIcEr/A==
X-ME-Sender: <xms:bun-ZHuvmc0x5MxT150HFgvPP-FYGnHqjLB7rJrAUjgXPUzAwFh_NA>
    <xme:bun-ZIdVclUJ7QXW_7WNepOrpIMli6YK-46P5drsPrwOgAhfh2tw1i6ygVkthglxD
    -qmUK4YkU-BH4o>
X-ME-Received: <xmr:bun-ZKwMWvxJdGHq84_rg_PVnsvR4zsUtVJ3wOtTZHzf-89mO2K1t__ccU9NCxm0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeigedgvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffggfuvfevfhfhjggtsehgtderredttdejnecuhfhrohhmpefuihhmohhn
    ucfirghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homheqnecuggftrfgrthhtvghrnhepvdeukeevgeekgeetffdthffgheejjefgteektedt
    tdejgeekiedvleeuvedvgeeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpuhgvfh
    hirdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:bun-ZGNZLXX8okaTDfxL-_xrlvPKT-Rtn9vV1Lv1sfJmCF1YZWjJxA>
    <xmx:bun-ZH_FJSA9Qxn15JgUtBSLrc8hJLT4Jrr6M_VhQVz5uvuRe2uULw>
    <xmx:bun-ZGXNf1NaWr5mgF1v59EjO1bvHkw0DhH0JukDG-f6_FO1YCi9mQ>
    <xmx:bun-ZKaaTHQHRi5W5H-3CiecSQyR-nH59x4ihI7qBwhN-EibAAWlnA>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <5a27c672-b176-0f77-3003-f3e3de0e32f7@invisiblethingslab.com>
Date: Mon, 11 Sep 2023 12:17:51 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
 <80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com>
 <6f81176c-2df8-d3d3-b3a6-ac6349b97ef2@citrix.com>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <6f81176c-2df8-d3d3-b3a6-ac6349b97ef2@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9NLtl5rYABqj561OCXqs6uaZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9NLtl5rYABqj561OCXqs6uaZ
Content-Type: multipart/mixed; boundary="------------RHe5H2gi4sNvZU9jX1Muvv4V";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <5a27c672-b176-0f77-3003-f3e3de0e32f7@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
 <80bae614-052e-0f90-cf13-0e5e4ed1a5cd@invisiblethingslab.com>
 <6f81176c-2df8-d3d3-b3a6-ac6349b97ef2@citrix.com>
In-Reply-To: <6f81176c-2df8-d3d3-b3a6-ac6349b97ef2@citrix.com>

--------------RHe5H2gi4sNvZU9jX1Muvv4V
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 07/08/2023 3:45 pm, Simon Gaiser wrote:
>> Andrew Cooper:
>>> On 07/08/2023 10:38 am, Simon Gaiser wrote:
>>>> It seems some firmwares put dummy entries in the ACPI MADT table for=
 non
>>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID=

>>>> 0xff. Linux already has code to handle those cases both in
>>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the=

>>>> same check to Xen.
>>>>
>>>> Note that on some older (2nd gen Core i) laptop of mine I also saw d=
ummy
>>>> entries with a valid APIC ID. Linux would still ignore those because=

>>>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xe=
n
>>>> this check is only active for madt_revision >=3D 5. But since this v=
ersion
>>>> check seems to be intentionally I leave that alone.
>>> I recall there being a discussion over this, ultimately with the vers=
ion
>>> check being removed.  IIRC it was a defacto standard used for a long
>>> time prior to actually getting written into the ACPI spec, so does ex=
ist
>>> in practice in older MADTs.
>> So I noticed that the check in Linux is actually slightly different th=
an
>> I thought. Since [3] it always considers the CPU usable if
>> ACPI_MADT_ENABLED is set. Otherwise it consider it only usable if
>> MADT revision >=3D 5 and ACPI_MADT_ONLINE_CAPABLE is set.
>>
>> So I checked what the ACPI spec says:
>>
>> Up to 6.2 Errata B [6] it only defines ACPI_MADT_ENABLE as:
>>
>>     If zero, this processor is unusable, and the operating system
>>     support will not attempt to use it.
>>
>> And the bit that later will be ACPI_MADT_ONLINE_CAPABLE is reserved wi=
th
>> "Must be zero".
>>
>> 6.3 [7] Then adds ACPI_MADT_ONLINE_CAPABLE and changes the meaning of
>> ACPI_MADT_ENABLE:
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
>> So with confirming firmwares it should be safe change the simply ignor=
e
>> the entry if !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE
>>
>> We can also do it like Linux and ignore ACPI_MADT_ONLINE_CAPABLE
>> completely if revision < 5.
>>
>> Note that the revision was already increased to 5 before 6.3.
>>
>> ACPI spec version    MADT revision
>>                  =20
>> 6.2 [4]              4
>> 6.2 Errata A [5]     45 (typo I guess)
>> 6.2 Errata B         5
>> 6.3                  5
>>
>> [3]: https://git.kernel.org/torvalds/c/e2869bd7af608c343988429ceb1c2fe=
99644a01f
>> [4]: http://www.uefi.org/sites/default/files/resources/ACPI_6_2.pdf
>> [5]: http://www.uefi.org/sites/default/files/resources/ACPI%206_2_A_Se=
pt29.pdf
>> [6]: https://uefi.org/sites/default/files/resources/ACPI_6_2_B_final_J=
an30.pdf
>> [7]: https://uefi.org/sites/default/files/resources/ACPI_6_3_May16.pdf=

>=20
> Honestly, the reserved must be zero means there's no need for a version=

> check at all.  That bit will not be set even in older MADT revisions.
>=20
> That said, it's likely easier to retain the version check than to set u=
p
> a quirks infrastructure for buggy older MADTs.

Yes, that's what I was thinking too. Send a patch:
https://lore.kernel.org/xen-devel/20230911101238.18005-1-simon@invisiblet=
hingslab.com/

Simon

--------------RHe5H2gi4sNvZU9jX1Muvv4V--

--------------9NLtl5rYABqj561OCXqs6uaZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmT+6VIACgkQkO9xfO/x
ly8g4g/+OFmAInumSqZBLJFA9RNo6wSaqAnGCD9ueWr2DpHbIK1nM/DQz30XHXp9
4NlfklK8ltCehxR+DcEh0mRYIFfgycqRsNSc0k5IwfX3ehM1aYnniT2wdfvoNHmr
F9v7DtAWxv3APCNozWRYQibNY43ly20e1mj9vMtiTW0IYJaswmP18yJRfKXAadW1
NPbRckNwC8objOSmoL60ThnD0KbD//mdkdSvMR4/+rdpWiFN91PNey3lGqDuu3yQ
u02ECeCAMOiPpZfBElafFqZMMWYkGG/XCv7mBloYqmFFowSAHEH6AhMw+662CBku
GdHFQ/Pr9Faul+6f+2KDyve7kADBo0uwhbewYCBjs7J47/0e91klS1KnlX8gm/ot
uNp33gVQ4oD9m2S2mv5WVNrJmPDRCudr9Iv1iDiivy0PXcm0SZ2JCdKfunGc4Eiv
wqODwfVgzFliC9YmQPxEt5/a686P7Cq9ocwXoVSDAy+9tlOO+UhkXoNXxeLLLuR2
Pyo7Fbn17xM/feSdA1tzqU8JWo/NeYfqbUyZARIwCGeYfLRTB4dYSzH3iObf4aeI
j6cjfjJogy9at9OPz73m8pHQyM0S7AARPNiHhPxtQ9h21BjdL8e9Ew8lvhQDa8rB
kJPWWcoKZkYSoxFAM7BOKVCYE0sklYUv0pVMqt5i5oGP39t8qyk=
=ze3I
-----END PGP SIGNATURE-----

--------------9NLtl5rYABqj561OCXqs6uaZ--

