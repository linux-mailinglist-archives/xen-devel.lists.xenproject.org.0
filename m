Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA966E46F8
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 13:59:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522019.811127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNVV-0005q0-LA; Mon, 17 Apr 2023 11:58:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522019.811127; Mon, 17 Apr 2023 11:58:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNVV-0005oG-IL; Mon, 17 Apr 2023 11:58:53 +0000
Received: by outflank-mailman (input) for mailman id 522019;
 Mon, 17 Apr 2023 11:58:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YIcH=AI=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1poNVT-0005oA-8f
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 11:58:51 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3457aa80-dd17-11ed-8611-37d641c3527e;
 Mon, 17 Apr 2023 13:58:48 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 78AB43200926;
 Mon, 17 Apr 2023 07:58:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 17 Apr 2023 07:58:43 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Apr 2023 07:58:41 -0400 (EDT)
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
X-Inumbo-ID: 3457aa80-dd17-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1681732723; x=1681819123; bh=mUmD8VKSgcdYni5p23E9r7fMAU6U8epsMQh
	PXgFnWXA=; b=ltzpIztrjn4tewsMauo24FeuxpRrgg7H5slu5AFpZMHcNZm0f4Y
	1sJhyrhic93T5AJVEBQ8SsLS5/plt1QJwPaiD0IaQTnwIbEQV/NHEHiGIjkINIr0
	rPdQxel2zlR7y9uQ2dBsyG572x8OjUFLaB2Jt9JT0YqIPq+fKszITf6KGSh5J7Cc
	IL5xESX5gkTPtzUFPH5x432jTuG40+2v4xFEGWveqKMP44oHIVpwi6e9GExjMmQN
	1tInaOzR5CphK+5duZj3BjkFoN8HhCGdMzZihPaQvv8iXXj2jjzCaXXpRVZ+i/k+
	ek30AHIdTGCEzmH1I7LJIXkXkCCVa5mAkDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1681732723; x=1681819123; bh=mUmD8VKSgcdYn
	i5p23E9r7fMAU6U8epsMQhPXgFnWXA=; b=UTv/ExP3dZxMl5gsdSnjMoRbE/QwG
	WvQsxfXTCO8H2GCXD9JfnbTLdAR3SFdyuDTMDABTuPOiFcnLxJc6YAXgzf6QU2wT
	+L/wZDY1yetHvB3RXlPicjFW+2GLw0VxS+riS22/2zC3aV8DIyJT196rNekiDYmm
	Vqmw9IpY9y0y0vfGaFo+PEdCGNm8Go+gJG1n37CmSu5LsBnrMCDoMltqpCkuRVz9
	QQlO3ZdASRl24+wOsVH6hulfFkrChlZEPO2HGuPGzq+A8RFjfnlPGtmxp1QoPPyZ
	RMgafnZsB/b4Pc28LJSw2O4kuEgrIkyWJjNSaXJecEbpjpA3m7ToqH/iQ==
X-ME-Sender: <xms:cjQ9ZBvVzNQFfWsrHpkcKej9t74T9FH90MzAqh6okfVx37aT2Fg7bw>
    <xme:cjQ9ZKcah8lRlFRydVo_NjJcReu51TdDVO2-Nb9WtEiYHAVegKItzCw8R6IMhqOWU
    P_Tiq0wlSuH8a0>
X-ME-Received: <xmr:cjQ9ZEy7zIut2KFBNxktLZsMDh_TL6O_FcwFVdGWG507SNvBZz8Y0xnZ00bVVTo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedggeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepkfffggfuvfevfhfhjggtsehgtderredttdejnecuhfhrohhmpefuihhmohhn
    ucfirghishgvrhcuoehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homheqnecuggftrfgrthhtvghrnhepgfffudekgeeukeeihfffffeuvedtgeefheeuveev
    veeikeefueegtefhjeetgfffnecuffhomhgrihhnpedtuddrohhrghdpihhnthgvlhdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehs
    ihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:cjQ9ZINzZU0SjeW-Z8ZCp3PAat6a6aeIPAuqessuYM2saayY-OFXQw>
    <xmx:cjQ9ZB-lAW0k230XEfZw9MoaABNna7wFt7e-y2OLmmyBoTGSE3HcRA>
    <xmx:cjQ9ZIXEh3_DnQyeXgbbwG20xiGcX5ASnQAqFu4ZroymDA5AzGUwGw>
    <xmx:czQ9ZGJb3-b8Ed9oteDjywm2bNgzXNjzraFjA5EAivOT2ZAZlPgPng>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <c44c1c88-64ef-7164-2647-37709f2b2551@invisiblethingslab.com>
Date: Mon, 17 Apr 2023 13:58:27 +0200
MIME-Version: 1.0
Subject: Re: S0ix support in Xen
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
References: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
 <ZCRNSeQzfYikJMmG@Air-de-Roger>
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <ZCRNSeQzfYikJMmG@Air-de-Roger>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dijNSEYwkfgDcQp3XA8ncRM1"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dijNSEYwkfgDcQp3XA8ncRM1
Content-Type: multipart/mixed; boundary="------------n5AiTDCk20napUsgSkkHzLti";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Message-ID: <c44c1c88-64ef-7164-2647-37709f2b2551@invisiblethingslab.com>
Subject: Re: S0ix support in Xen
References: <9051e484-b128-715a-9253-48af8e47bb9d@invisiblethingslab.com>
 <ZCRNSeQzfYikJMmG@Air-de-Roger>
In-Reply-To: <ZCRNSeQzfYikJMmG@Air-de-Roger>

--------------n5AiTDCk20napUsgSkkHzLti
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Roger Pau Monn=C3=A9:
> On Mon, Feb 27, 2023 at 12:48:03PM +0100, Simon Gaiser wrote:
>> Hi,
>>
>> I have been looking into using S0ix with Xen. On systems with with
>> 11th gen (Tiger Lake) Intel mobile CPUs or newer this is often the
>> only supported suspend method, thus we want to support it in Qubes
>> OS.
>>
>> Below a summary of my current understanding of what's needed (and
>> known unknowns). I would appreciate some feedback (what's missing,
>> preferred solutions, etc.).
>>
>> Note this topic is much above my previous experience with Xen and x86
>> power management internals, so sorry if I'm missing things that are
>> obvious to you.
>>
>> PIT timer: During some previous private discussion it was mentioned
>> that the PIT timer that Xen initializes for IO-APIC testing prevents
>> S0ix residency and therefore that part needs to be reworked. But if
>> I'm reading the current code correctly Xen can already use the HPET
>> timer instead, either with an automatic fallback if PIT is
>> unavailable or by forcing it via hpet=3Dlegacy-replacement=3D1. Lookin=
g
>> at the rest I think the PIT isn't used if Xen finds another
>> clocksource. Did I miss something?
>=20
> Do you have some reference to documentation related to the S0ix
> states?
>=20
> I would like to understand exactly what's required in terms of
> hardware devices the OS can use and still be able to enter such
> states.

Unfortunately the documentation that I'm aware of is rather sparse.
There are two blog posts by Intel [1] and [2] that are quite good when
you are trying to get it working under Linux. [3] might be also useful
for debugging.=20

But I'm not aware of an explicit and complete list of what is required
to enter S0ix. You can deduct things from the blog posts or for example
the names of the debug register fields, but yeah ...

Also [2] contains this gem:

    Currently, only the NDA version of the Intel=C2=AE SoC Watch tool can=

    expose the IP Link Power State. [...] If you have any questions,
    please refer to your Intel representative.

Regarding what devices are active in S0ix the PCH datasheet [4] has a
few additional pointers like:

    USB 3.2 only works in S0. USB 2.0 survives S0ix and Sx states and
    provides early boot access.

If someone knows about more public docs, I'm all ear.

Simon

[1]: https://01.org/blogs/qwang59/2018/how-achieve-s0ix-states-linux
[2]: https://01.org/blogs/qwang59/2020/linux-s0ix-troubleshooting
[3]: https://01.org/blogs/2019/using-power-management-controller-drivers-=
debug-low-power-platform-states
[4]: https://cdrdv2.intel.com/v1/dl/getContent/631119

--------------n5AiTDCk20napUsgSkkHzLti--

--------------dijNSEYwkfgDcQp3XA8ncRM1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmQ9NGUACgkQkO9xfO/x
ly972A//VAAPjXpWKoQW2CE2d6UIEugoxogcsB32rpYFDqWJgGUWoIia+2WL8mMs
uvbeV51SMatKwjX3ruS0E41k98MvATPvyG0VpTUjR54NptdO8dZsW2Oz8a59eSs1
JFiQQ7RAkhAGL/+KETSu5NhUn7uvEnuQFyN3Fie/yzUM/odkC9EkqVa39cZhs6E6
uko+XShLogKpKk23N0Mt8Yr0tuz6qKCmZDm1zJHlToJanHV4YgRwDffnN/a48lcz
WFgoN8f0xzyviG8Obb0NZmkCwV2puoHtJcQURv5TSI+6k3gpFmZe+49bgWXhPMGM
JTszxb3IcKBuA9cACLbogdiLeUZbvsyFHb9CH+CYmIUApfBntMU8SdM0KA2TMQxh
HVg9Z0Zda11ZL9A6j5A2ii3FT6lWCNF/ERnyR47VKu76WsfAqs+NVw/e++V6LuzF
G9/uUhi2wFuJQd/aYyzRiS7jPEk2PlSO3edHORdbxonumbokAuWARkgtSqCC+Ilg
DaKDgOfqlmuPUp6OAiEsZKazFvsgXqaqbl8uDRde3FUbqC9iBlyjYFJRy+heY96D
2ck7l5umCzwFXO0O+1dRRqDqR1ZO6OZ8A4NEfYIO/5GVO4tVTqqSxhCy5QpJfSrj
fJqSgP+bAoLMyvILVV9PzCUBb2OVC8MZyBTbDzqhj6BuHb0+1Uw=
=iRok
-----END PGP SIGNATURE-----

--------------dijNSEYwkfgDcQp3XA8ncRM1--

