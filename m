Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1DD8771DD3
	for <lists+xen-devel@lfdr.de>; Mon,  7 Aug 2023 12:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.578001.905174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSxJ6-0003S9-05; Mon, 07 Aug 2023 10:17:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 578001.905174; Mon, 07 Aug 2023 10:17:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qSxJ5-0003PA-TI; Mon, 07 Aug 2023 10:17:47 +0000
Received: by outflank-mailman (input) for mailman id 578001;
 Mon, 07 Aug 2023 10:17:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LmzZ=DY=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qSxJ4-0003P4-6U
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 10:17:46 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a539c8c7-350b-11ee-8613-37d641c3527e;
 Mon, 07 Aug 2023 12:17:43 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 47E543200923;
 Mon,  7 Aug 2023 06:17:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 07 Aug 2023 06:17:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Aug 2023 06:17:39 -0400 (EDT)
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
X-Inumbo-ID: a539c8c7-350b-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691403460; x=1691489860; bh=lF5FFi9qv4L715tY6xYh8C7OAp6/fQDjMng
	GRYfiSD4=; b=FYEvczzNpFQZJNX8oM4xUWjy65FIFUROgtlyUKPxVgaRuTF5LjV
	M1FZRRMf+BICfM2Zf04fi7/2mJHcm/VWnMQihetg6qJrqg9lzvw09GqRiww72Urz
	OlDw6NWgWvFvjePbqpqZ0pa13sK0Z954WMnPA3t0TrFA0e1I1UoiFvg6d2NeeXJd
	bUwVCtuYixYrM5bqE2j7fv16HaohNUvkf4kJ9X4YlhgTu7vpKYWNuRwFPY4f1kF8
	Wazj3fBwbomezBRXdjS9zaYHLuumb8C3skfiEvsh5iKI3SLii6DJVevYYpHklRyw
	7hPR7n4dsV3LesHZcU+ZoAvRYJQz9BTXwXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1691403460; x=1691489860; bh=lF5FFi9qv4L71
	5tY6xYh8C7OAp6/fQDjMngGRYfiSD4=; b=bfiTZUvNzSIfZXrUX+/JDbfZZ5n9U
	Riq7DlSOT4wjjhlgdRhTHZmKkYAaAB3ovPwCnoIx9/nnxCtc4nkvLlTkSe8sB+RP
	7/hBWFS0/ipOAbLNBpuTbLYW42CIA1A8p5omyexdA2AzOFOBKz9mZk5ofozyTxew
	cH4yNYTtZQkxBX7vcc0vLSgYs8WXmdQ1ArRVkthgLxE/mPZefdO5BcTJbVbuWfKu
	Kc7z1r5oPsU1oxxGIPE9rskJp35HuN/pAaKX/lTQhD9pellSQZk6DBgwLMAmP2Ex
	70Fvj7f2LQYrOkJfkMLtbgz9dCYLif0PZM+Jho404PNtr7rdR94Z+N+yw==
X-ME-Sender: <xms:xMTQZJKNt6vnbFzi9Fbr-ssS-Aw1OEXrfUAVld9pLktDKvHMG9AeOw>
    <xme:xMTQZFKP5mz7soP1xTi5lv_hAjDcotGUax73qiouwlk9aRAeyrpnyZ4KjDCj0dzsM
    D0MpXq97qClvgc>
X-ME-Received: <xmr:xMTQZBsK57VRE2bgdxO8hc3vcxJiKNoOEf8x0zn9HdmS2-31KPOracbjSoSjK6XYYF4fwIKrD_JsoczEgV-O-XH5-2XEjEu2HGsZUslYXA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrledtgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeeftdefudeltdevhfehkeefhfeutdfhffdugeetffdv
    gfehfeekhfetgedvuefggfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepshhimhhonhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:xMTQZKb7OgYQB0an_y0F_8bDGBszDgcnAVE4t7rInAVjJfLdHaHPCw>
    <xmx:xMTQZAYOgNKeuCT4XEPF0BqUHayfbVmei5TGT4rCNvt9Wvs-iAXfRA>
    <xmx:xMTQZOD4jU8sy5YQ9dgWPXYVNLh4iPh7BTYLrFes0gLqnirxabl_sw>
    <xmx:xMTQZIGa6GywLARuCbdxkVR0FmY7dHMmbfwkkItiALNas_jD9u48uw>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <06e706fe-4338-876e-8888-a43542c43661@invisiblethingslab.com>
Date: Mon, 7 Aug 2023 12:17:27 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
 <f6bf4dc4-5ec8-866c-3b54-c3584c407cc2@citrix.com>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <f6bf4dc4-5ec8-866c-3b54-c3584c407cc2@citrix.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ef8mOtNBNQLW0oZoN7Aq8nUc"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ef8mOtNBNQLW0oZoN7Aq8nUc
Content-Type: multipart/mixed; boundary="------------168yFGGLT072wOQwBV1gDYF9";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Message-ID: <06e706fe-4338-876e-8888-a43542c43661@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/ACPI: Ignore entries with invalid APIC IDs when
 parsing MADT
References: <7f158a54548456daba9f2e105d099d2e5e2c2f38.1691399031.git.simon@invisiblethingslab.com>
 <d5a99971-059b-022f-1b17-ca22431fad4f@citrix.com>
 <f6bf4dc4-5ec8-866c-3b54-c3584c407cc2@citrix.com>
In-Reply-To: <f6bf4dc4-5ec8-866c-3b54-c3584c407cc2@citrix.com>

--------------168yFGGLT072wOQwBV1gDYF9
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Andrew Cooper:
> On 07/08/2023 11:01 am, Andrew Cooper wrote:
>> On 07/08/2023 10:38 am, Simon Gaiser wrote:
>>> It seems some firmwares put dummy entries in the ACPI MADT table for =
non
>>> existing processors. On my NUC11TNHi5 those have the invalid APIC ID
>>> 0xff. Linux already has code to handle those cases both in
>>> acpi_parse_lapic [1] as well as in acpi_parse_x2apic [2]. So add the
>>> same check to Xen.
>>>
>>> Note that on some older (2nd gen Core i) laptop of mine I also saw du=
mmy
>>> entries with a valid APIC ID. Linux would still ignore those because
>>> they have !ACPI_MADT_ENABLED && !ACPI_MADT_ONLINE_CAPABLE. But in Xen=

>>> this check is only active for madt_revision >=3D 5. But since this ve=
rsion
>>> check seems to be intentionally I leave that alone.
>> I recall there being a discussion over this, ultimately with the versi=
on
>> check being removed.  IIRC it was a defacto standard used for a long
>> time prior to actually getting written into the ACPI spec, so does exi=
st
>> in practice in older MADTs.
>>
>> Otherwise LGTM.  I'd suggest dropping this paragraph as it's not relat=
ed
>> to the change.  It will also help if we do decide to follow up and dro=
p
>> the MADT version check.

It's in so far related as that I know this doesn't cover all cases I
actually wanted to address and I want to mention this. But I can see why
you might not want to have this in this commit message. Feel free to
drop.

>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3Df3bf1dbe64b62a2058dd1944c00990df203e8e7a # [1]
>>> Link: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.=
git/commit/?id=3D10daf10ab154e31237a8c07242be3063fb6a9bf4 # [2]
>> https://git.kernel.org/torvalds/c/$SHA
>>
>> Somewhat less verbose. https://korg.docs.kernel.org/git-url-shorteners=
=2Ehtml

Ah, handy.

>>> Signed-off-by: Simon Gaiser <simon@invisiblethingslab.com>
>>> ---
>>>  xen/arch/x86/acpi/boot.c | 14 ++++++++++----
>>>  1 file changed, 10 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/acpi/boot.c b/xen/arch/x86/acpi/boot.c
>>> index 54b72d716b..4a62822fa9 100644
>>> --- a/xen/arch/x86/acpi/boot.c
>>> +++ b/xen/arch/x86/acpi/boot.c
>>> @@ -87,14 +87,17 @@ acpi_parse_x2apic(struct acpi_subtable_header *he=
ader, const unsigned long end)
>>>  	if (BAD_MADT_ENTRY(processor, end))
>>>  		return -EINVAL;
>>> =20
>>> +	/* Ignore entries with invalid apicid */
>> x2apic ID.
>=20
> Oh, and I forgot to say.  I'm happy to fix all of this up on commit if
> you're happy.

Sure, go ahead. Thanks!

--------------168yFGGLT072wOQwBV1gDYF9--

--------------ef8mOtNBNQLW0oZoN7Aq8nUc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmTQxLkACgkQkO9xfO/x
ly8+GhAAxj+qBeew0LYZ+KhFN/1TP7V9Vp8HQxEy/HTbM1V8mSmL0g4zTUzXySAN
HsN4i+AL9lXsMacxsVhvkD8rNQGRDlRBYSh+iRSb0X8bHFyjAq8+ozv/b7sy8Fj1
zrMyFQe1pvvKCHg8Zh9dGngKIYJhjISExkqwF0JlBEZ66jriOgna7tiy4Xag/awX
mU0eqWEF+9zaDqKS+V/a/nE02+zcW8P8w0YskHlOZEfyulCf7tpAH0SNUMrOdBOM
Or6kJ1MO6aFx3eOk5NRizRjHxHk9wWGksbT0mKNH7HpdyYE/Uk0eXR40z+4nb4Ky
p3timasA0vI43ZSryVQjiRxI+VRvVVV6Gqi7rDWKgZjv3a4kdsf6ZGEEiM/bNIvx
OB0R6lNPYk1tzz51wLTypVuz4yDYC2CzFZ2DwlDfbhlDM4SBL8aXxYQCuq86T9HY
lAbPlfKfh2XLLK0AsTwG2LTf9UkUS72j1hQGQkiQvx7czT3Q7kLQsHPqB1H1zyWO
rSEfI9gl6/5eAPSrrn+DqQoognAb/m/PJB3GgigG5zQlNhNCk0pCo2vyWoEHtuCe
xkBBMgzV7JacwYk/W3aKrdX4hzdlLRb0guikoNzi935k3ZNYnuyt2BpYQw9U9RBe
TLX2uak7Eg3LIghZcWMYxLf+LhuL9xpyaB+eV/VRzAFj3d3YKHc=
=gNX7
-----END PGP SIGNATURE-----

--------------ef8mOtNBNQLW0oZoN7Aq8nUc--

