Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC4E2A6FFF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 22:58:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.19547.44728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaQmZ-0003ck-Ns; Wed, 04 Nov 2020 21:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 19547.44728; Wed, 04 Nov 2020 21:57:31 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaQmZ-0003cL-KY; Wed, 04 Nov 2020 21:57:31 +0000
Received: by outflank-mailman (input) for mailman id 19547;
 Wed, 04 Nov 2020 21:57:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cy9h=EK=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
 id 1kaQmX-0003cD-R2
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 21:57:29 +0000
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5d83d3cb-9cca-4cdf-8fbe-cd88f00e2bb7;
 Wed, 04 Nov 2020 21:57:28 +0000 (UTC)
Received: from [10.10.1.24] (c-73-129-147-140.hsd1.md.comcast.net
 [73.129.147.140]) by mx.zohomail.com
 with SMTPS id 1604527035469513.1134307116392;
 Wed, 4 Nov 2020 13:57:15 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Cy9h=EK=apertussolutions.com=dpsmith@srs-us1.protection.inumbo.net>)
	id 1kaQmX-0003cD-R2
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 21:57:29 +0000
X-Inumbo-ID: 5d83d3cb-9cca-4cdf-8fbe-cd88f00e2bb7
Received: from sender4-of-o51.zoho.com (unknown [136.143.188.51])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 5d83d3cb-9cca-4cdf-8fbe-cd88f00e2bb7;
	Wed, 04 Nov 2020 21:57:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1604527037; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=j/vBMXehQxTPf7sjbk8ovqTsIeQESGcH1Jo9GH2nX9vZw1CWmSysGjeq0oUF2DY30xuxYktp63VpX7O4sqaOl77D0z5IZY+4GBvxgG0BjJI3BFcg0LPI4am99J+NwuDRHNILVc79EPq5U0cSLGA9M++CDjGgJGgX6dHcyS47SYg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1604527037; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=AVIeUoUbZjrTw79cxyPF13nENl8IE/JbmmTQieR44vY=; 
	b=CIHFCpLnAzdUMqEVawGs8VBg1mZ3z2LRumeHCsIQh5+z4LADKYmOpMc7xsWTMKhyW0RyrHSiqwt07YPtWD5jLGt4Ms6f3ojG9NRUa0Zk2injdvSsignPCQke1ru3Zt71BieZfDiLtQpCxYGz9b5tDmRCCGRQWUd9073Iva22HdU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com> header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1604527037;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=AVIeUoUbZjrTw79cxyPF13nENl8IE/JbmmTQieR44vY=;
	b=DD/2zIBQoMxUuB0RKFcqNRmHcze6TkHdT2y5s1Vy2yWvxZJZBrMTY+Svkin6f8/i
	DvNHne8fwbH64p09FjslVNwmjfwxawdVcP2E4Sbx+8KaUwWWPoAbnNdU7oprbBhKGs5
	c84xwje6GOoC3RColeUIdKrkStWrLEIMNOIRFCg0=
Received: from [10.10.1.24] (c-73-129-147-140.hsd1.md.comcast.net [73.129.147.140]) by mx.zohomail.com
	with SMTPS id 1604527035469513.1134307116392; Wed, 4 Nov 2020 13:57:15 -0800 (PST)
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
To: Stefano Stabellini <sstabellini@kernel.org>,
 Rich Persaud <persaur@gmail.com>
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org,
 Daniel DeGraaf <dgdegra@tycho.nsa.gov>, Roman Shaposhnik <roman@zededa.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
References: <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
 <E359BD65-2917-4087-A6E1-0AD5521CF823@gmail.com>
 <alpine.DEB.2.21.2011031307430.5812@sstabellini-ThinkPad-T480s>
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Message-ID: <15a6c69d-6de2-54b3-b580-5f0fcd83ae96@apertussolutions.com>
Date: Wed, 4 Nov 2020 16:57:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011031307430.5812@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

On 11/3/20 4:15 PM, Stefano Stabellini wrote:
> On Tue, 3 Nov 2020, Rich Persaud wrote:
>> On Nov 3, 2020, at 14:37, Stefano Stabellini <sstabellini@kernel.org> wr=
ote:
>>>
>>> =EF=BB=BFOn Tue, 3 Nov 2020, Jan Beulich wrote:
>>>>> On 02.11.2020 22:41, Stefano Stabellini wrote:
>>>>> On Mon, 2 Nov 2020, Jan Beulich wrote:
>>>>>> On 31.10.2020 01:24, Stefano Stabellini wrote:
>>>>>>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
>>>>>>>      SBSA Generic UART implements a subset of ARM PL011 UART.
>>>>>>>
>>>>>>> config ARM_SSBD
>>>>>>> -    bool "Speculative Store Bypass Disable" if EXPERT
>>>>>>> -    depends on HAS_ALTERNATIVE
>>>>>>> +    bool "Speculative Store Bypass Disable"
>>>>>>> +    depends on HAS_ALTERNATIVE && EXPERT
>>>>>>>    default y
>>>>>>
>>>>>> At the example of this, I'm afraid when the default isn't "n"
>>>>>> (or there's no default directive at all, as ought to be
>>>>>> equivalent to and preferred over "default n"), such a
>>>>>> transformation is not functionally identical: Before your
>>>>>> change, with !EXPERT this option defaults to y. After your
>>>>>> change this option is unavailable (which resolves to it being
>>>>>> off for all consuming purposes).
>>>>>>
>>>>>> IOW there are reasons to have "if ..." attached to the prompts
>>>>>> (for this construct indeed only making the prompt conditional,
>>>>>> not the entire option), but there are also cases where the
>>>>>> cleanup you do is indeed desirable / helpful.
>>>>>
>>>>> Yeah, thanks for catching it, it is obviously a problem.
>>>>>
>>>>> My intention was just to "tag" somehow the options to EXPERT so that =
it
>>>>> would show on the menu. Maybe a better, simpler, way to do it is
>>>>> to add the word "EXPERT" to the one line prompt:
>>>>>
>>>>> config ARM_SSBD
>>>>> -    bool "Speculative Store Bypass Disable" if EXPERT
>>>>> +    bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
>>>>>    depends on HAS_ALTERNATIVE
>>>>>    default y
>>>>>    help
>>>>>
>>>>>
>>>>> What do you think?
>>>>
>>>> While on the surface this may look like an improvement, I don't
>>>> see how it would actually help: If you read the Kconfig file
>>>> itself, the dependency is seen anyway. And on the menu I don't
>>>> see the point of telling someone who has enabled EXPERT that a
>>>> certain option is (or is not) an expert one. If they think
>>>> they're experts, so should they be treated. (It was, after all,
>>>> a deliberate decision to make enabling expert mode easier, and
>>>> hence easier to use for what one might consider not-really-
>>>> experts. I realize saying so may be considered tendentious; I
>>>> mean it in a purely technical sense, and I'd like to apologize
>>>> in advance to anyone not sharing this as a possible perspective
>>>> to take.)
>>>>
>>>> Plus, of course, the addition of such (EXPERT) markers to
>>>> future options' prompts is liable to get forgotten now and then,
>>>> so sooner or later we'd likely end up with an inconsistent
>>>> mixture anyway.
>>>
>>> I tend to agree with you on everything you wrote. The fundamental issue
>>> is that we are (mis)using EXPERT to tag features that are experimental,
>>> as defined by SUPPORT.md.
>>>
>>> It is important to be able to distinguish clearly at the kconfig level
>>> options that are (security) supported from options that are
>>> unsupported/experimental. Today the only way to do it is with EXPERT
>>> which is not great because:
>>>
>>> - it doesn't convey the idea that it is for unsupported/experimental
>>>  features
>>> - if you want to enable one unsupported feature, it is not clear what
>>>  you have to do
>>>
>>> So maybe we should replace EXPERT with UNSUPPORTED (or EXPERIMENTAL) in
>>> the Kconfig menu?
>>>
>>> It would make it clearer that by enabling UNSUPPORTED you are going to
>>> get a configuration that is not security supported.
>>
>> If going down this path, there should be one, authoritative, in-tree def=
inition of feature-level support from which Kconfig (build-time policy enfo=
rcement) and SUPPORT.md (documentation) can be derived.  Later, even run-ti=
me enforcement can be similarly classified.  FuSA may also wish for documen=
ted policy to align with enforcement.
>=20
> The goal is trying to align Kconfig and SUPPORT.md by clarifying the
> EXPERT option, which today is a poor implementation of "experimental".

Just a thought but what if it were to be kept as EXPERT for the config
option to expose all of these features and then by convention require
that experimental options be required to carry an EXPERIMENTAL tag at
the beginning of the option's description. This would separate the idea
of EXPERT configuration mode from that of EXPERIMENTAL features which
can only be reached in EXPERT mode. The convention could be carried
through to UNSUPPORTED, TECHPREVIEW, or any new types of tags as they
are needed.

> There could be further improvements down the line, for instance we could
> taint Xen when UNSUPPORTED is selected and even have separate kconfig
> options for UNSUPPORTED, EXPERIMENTAL, and TECHPREVIEW. FuSa is likely
> going to need its own SAFETY option too. Like you suggested, we could
> even have a single source of feature-level support information for both
> Kconfig and SUPPORT.md.
>=20
> However, I didn't want to increase the scope of this one patch. For now,
> it would be a good start if we replaced EXPERT with something that covers
> anything not security supported, for which UNSUPPORTED looks like a good
> name.
>=20



