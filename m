Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFE775F000
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 11:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568580.887936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsBS-0007VT-7n; Mon, 24 Jul 2023 09:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568580.887936; Mon, 24 Jul 2023 09:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNsBS-0007St-4l; Mon, 24 Jul 2023 09:48:54 +0000
Received: by outflank-mailman (input) for mailman id 568580;
 Mon, 24 Jul 2023 09:48:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sIK2=DK=invisiblethingslab.com=simon@srs-se1.protection.inumbo.net>)
 id 1qNsBQ-0007Pe-GK
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 09:48:52 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 49170100-2a07-11ee-8612-37d641c3527e;
 Mon, 24 Jul 2023 11:48:49 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 5FFC73200065;
 Mon, 24 Jul 2023 05:48:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 24 Jul 2023 05:48:45 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Jul 2023 05:48:40 -0400 (EDT)
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
X-Inumbo-ID: 49170100-2a07-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1690192124; x=1690278524; bh=2rLKSuU16UsnDfiMjPqYzoBhsClO4zSaeBL
	j/AD8j3o=; b=zinzpmKDgvyvA+XfsPVuDxD5BhJ/IC/cIU6erncXhQumrGFqW9N
	wHywbRgNM3UodM3aiwhoJAOlNhuOTDJP4sx/3luYLCTipe1X/8yDs+5ABqchmOxX
	E4MZl6RYvYUscgaC95qq9eeyYsK6OZSUa/LhoMjq3MAcybz/Oom0ig1f+VFomqi/
	Zan+lvcDYO8nubHvrvSf8zkGOKnDOw9LPnMURzhLCrDPtpLCzw/K1JeqXEmvSewT
	Axo3CsYtyP/72/VEOKKl9BF9Ndbu+6P8d8VkOn+R2A+g4kOJOsroWFNRrGhA1V8P
	+wbDkglvlKOlBOwEjdXZjlj+pRyZh3Wqliw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1690192124; x=1690278524; bh=2rLKSuU16UsnD
	fiMjPqYzoBhsClO4zSaeBLj/AD8j3o=; b=jaGpchDJCwSbaGsk7mdZSuU7tkWYq
	CZSMzkHBV9zjhYyVFhTYVt9pZG+qJVyxJGGzleQZn79TUmaFK8Ob1lsSQI+P2rAp
	NytI8fZxWFrxDIBWwOZK4ELBYOmbXflcNRnTerlpaZmqMXEAZH+t2kgItn+orWve
	Lfzw/tLNqwIKleOGyviwmH/ilFYtjCGovkVSmMptnU99xhVn5Rc/CnBVCtvGQcjg
	lsiF+aL5uW194aLTvVGMK67loSn7+PWSX1vv3tKaDSoGNlaEbBkBjgVouAfZfZfW
	sAHOCHlF+BSj5hDCOftDFWaZ0FeR7wPskzdh7pJvarZc8kFHKszWvvb7g==
X-ME-Sender: <xms:_Ei-ZGtCrqPojc3lqdPdePyySCxn7PfGGjQfBnf3kLRKabGOWKGzyA>
    <xme:_Ei-ZLeFeI3uqrLKZA9ANMmn6Gh4qrayhT0dYUn-B1M2r1S1PXPIUFdp6e-Os3f8V
    Nveq9i8zyGuGS0>
X-ME-Received: <xmr:_Ei-ZByxh3Itp-JN7uemWWjqWHxW6kNpC05NQJ3Q0n6xwnBbsiNDSClr79veagdB>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrheekgddulecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffgguffvvehfhfgjtgesghdtreertddtjeenucfhrhhomhepufhimhhonhcu
    ifgrihhsvghruceoshhimhhonhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hmqeenucggtffrrghtthgvrhhnpeekueffiedtgeffleeglefhledtfefgiedtveeiffeg
    hffgledtveehhfdugfetveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpehsihhmohhnsehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:_Ei-ZBP9mH-FhqcuIatPiNiv60S1gQoDsTm0hkWufo2LH6Dzh2_nVg>
    <xmx:_Ei-ZG-XSstEohxVe-_timxON9w41F59geEX06gC58feTVBmVyaXyw>
    <xmx:_Ei-ZJXQCvAf6-oIGO7nqoemCpXLt-U7RCFQ-NTyUrZrRInC1DmTWA>
    <xmx:_Ei-ZNbTIj9LOGlB4nuznzzfTae9yPMrUGCut2ZH9S5OLVU-I32-tg>
Feedback-ID: idc5945a3:Fastmail
Message-ID: <2b4075e5-0b17-fe14-72db-12c63ab30f86@invisiblethingslab.com>
Date: Mon, 24 Jul 2023 11:48:24 +0200
MIME-Version: 1.0
Subject: Re: [XEN PATCH] x86/hpet: Disable legacy replacement mode after IRQ
 test if not needed
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230718122603.2002-1-simon@invisiblethingslab.com>
 <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>
 <ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com>
 <58ee9410-e758-1503-e3f1-d25989fedc1e@suse.com>
Content-Language: en-US
From: Simon Gaiser <simon@invisiblethingslab.com>
In-Reply-To: <58ee9410-e758-1503-e3f1-d25989fedc1e@suse.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BaKg4KX5cvA95YSCPwr5wObm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BaKg4KX5cvA95YSCPwr5wObm
Content-Type: multipart/mixed; boundary="------------LVwnDABkqVYRbyUaMPboQkTp";
 protected-headers="v1"
From: Simon Gaiser <simon@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Message-ID: <2b4075e5-0b17-fe14-72db-12c63ab30f86@invisiblethingslab.com>
Subject: Re: [XEN PATCH] x86/hpet: Disable legacy replacement mode after IRQ
 test if not needed
References: <20230718122603.2002-1-simon@invisiblethingslab.com>
 <ZLaLLe2HFDN5oWUq@MacBook-Air-de-Roger.local>
 <ac77ecba-6804-1d16-60dc-f184e5d31dcb@invisiblethingslab.com>
 <58ee9410-e758-1503-e3f1-d25989fedc1e@suse.com>
In-Reply-To: <58ee9410-e758-1503-e3f1-d25989fedc1e@suse.com>

--------------LVwnDABkqVYRbyUaMPboQkTp
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Jan Beulich:
> On 18.07.2023 23:51, Simon Gaiser wrote:
>> Roger Pau Monn=C3=A9:
>>> On Tue, Jul 18, 2023 at 02:26:03PM +0200, Simon Gaiser wrote:
>>>> As far as I understand the HPET legacy mode is not required on syste=
ms
>>>> with ARAT after the timer IRQ test.
>>>
>>> What's the relation with ARAT here?
>>>
>>> It would seem to me that keeping legacy replacement enabled should
>>> only be done when opt_hpet_legacy_replacement > 0, and the currently
>>> modified block is already in a opt_hpet_legacy_replacement < 0 gated
>>> chunk.
>>
>> I was concerned that on systems without ARAT cpuidle might rely on HPE=
T
>> legacy mode being available. See _disable_pit_irq and lapic_timer_init=
=2E
>> But now that I stared at this again, I think that condition isn't
>> actually needed. If we reach that code we know that we have no working=

>> PIT, but HPET is working. So _disable_pit_irq which is run after
>> check_timer (__start_xen first calls check_timer via smp_prepare_cpus
>> and only later disable_pit_irq via do_initcalls) will setup HPET
>> broadcast, which should succeed since HPET worked previously.
>>
>> So I guess we can just drop the condition (please double check, that
>> code is quite tangled and I'm not familiar with it).
>=20
> What you want to respect instead though is opt_hpet_legacy_replacement.=


Can you please explain what behavior you expect? As Roger pointed out
this code only runs with opt_hpet_legacy_replacement < 0 so the user
didn't make an explicit choice. In that case enabling the legacy mode
for the timer IRQ test and then disabling it to allow lower power modes
seems reasonable to me.

Simon

--------------LVwnDABkqVYRbyUaMPboQkTp--

--------------BaKg4KX5cvA95YSCPwr5wObm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE3E8ezGzG3N1CTQ//kO9xfO/xly8FAmS+SOoACgkQkO9xfO/x
ly9JPw//WumzM2bn//BEMPfXjj2ucaftDIJnuu3r44ih3EPtDdtUSSrdojLUqce3
vRBETsGbdMowB/5rTfr34xXoyNA/gcvy0SormM7+soou74ZrC7aq0VMYoz9F9R5U
oLPS3l2I3gxCOPr/wO1j5L3Exq7+XBTL/bIn5xl13BN97a6cqsk/AcB9gYcuUag4
MzlUa3FNdbJtcxaMbk8tSxsWL5snuFmtIjmUcdn1TDPNPS9RxtsjefsVVaXbexrV
5Ejt8wGlD6X+9rgZMsrc5fjA1SbqmQU4E/I8PipH9d+oVzqzfbSQNkgk4QS2C8WW
7jZxMLs34hN6ZiF3pok6Od+VfcYHhqw6ihlLGGpp6KGjI/UsjNGjDdBkWE+zPg8r
GS4p28KlhD/RBfoJUKgun9WdQq/z7hXo3m8czwONIMhLPEpKxDfrr9yJYnAwe6P2
JYmje077UgNtXyg4d/xzzlqCMFaxHthkeu0nyWJfEz1ARXldHEs7NVObbEustPV5
o7YgsHzE1LobqK8JWNeKDqDV8SUrNgvUIKn9V+CKU8kE2VBbzPSt6cSmkxDxQbOR
ubTOxn4CgQE7Q2opwjMTLe/qF16YQdTOqlL+EIZ1DiWI4x+uy/Qyo9Y7rTjS+Z22
EXZXkzh/273tMzRnUnyGsb8sVP1EPIaBcOZNnpa9Uda0PzHYBn4=
=gRqi
-----END PGP SIGNATURE-----

--------------BaKg4KX5cvA95YSCPwr5wObm--

