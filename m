Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6F02A5ECF
	for <lists+xen-devel@lfdr.de>; Wed,  4 Nov 2020 08:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.18796.43805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kaDJR-0004Rl-6Y; Wed, 04 Nov 2020 07:34:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 18796.43805; Wed, 04 Nov 2020 07:34:33 +0000
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
	id 1kaDJR-0004RO-3M; Wed, 04 Nov 2020 07:34:33 +0000
Received: by outflank-mailman (input) for mailman id 18796;
 Wed, 04 Nov 2020 07:34:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kaDJP-0004RJ-Ud
 for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 07:34:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 3511bffa-4372-4e15-9b4a-132b0542cb09;
 Wed, 04 Nov 2020 07:34:30 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0B347AE1F;
 Wed,  4 Nov 2020 07:34:30 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gnt3=EK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kaDJP-0004RJ-Ud
	for xen-devel@lists.xenproject.org; Wed, 04 Nov 2020 07:34:32 +0000
X-Inumbo-ID: 3511bffa-4372-4e15-9b4a-132b0542cb09
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTP
	id 3511bffa-4372-4e15-9b4a-132b0542cb09;
	Wed, 04 Nov 2020 07:34:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604475270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vOeiraqo5k/9PCWGLJfcX0cIM7vQ7pneAS3SvoRlm80=;
	b=PJk5dFy37eEw7OICTWUK8jdJp3CguEztZ2s32si1ra6IxRA/c4fawX8qCSwixN9pR9Ck9g
	p584BDupGlYNai2OMXhSRr0N/JFOIQjwdmMgUuoV1dzWAH35xG4Dy2oz12YHQaXoHOTQlW
	olIBZqNzljCyKKZULoTNwRKS2EcLT7Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0B347AE1F;
	Wed,  4 Nov 2020 07:34:30 +0000 (UTC)
Subject: Re: [RFC PATCH] xen: EXPERT clean-up
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, iwj@xenproject.org,
 julien@xen.org, wl@xen.org, xen-devel@lists.xenproject.org
References: <20201031002405.4545-1-sstabellini@kernel.org>
 <cd44d479-8dba-6311-9386-0c8c1134d07e@suse.com>
 <alpine.DEB.2.21.2011021332460.5812@sstabellini-ThinkPad-T480s>
 <c127499b-810b-63af-5487-2cc9ecfdba09@suse.com>
 <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e0842284-a894-1e0b-ffbe-484013acefa5@suse.com>
Date: Wed, 4 Nov 2020 08:34:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2011031123420.5812@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.11.2020 20:37, Stefano Stabellini wrote:
> On Tue, 3 Nov 2020, Jan Beulich wrote:
>> On 02.11.2020 22:41, Stefano Stabellini wrote:
>>> On Mon, 2 Nov 2020, Jan Beulich wrote:
>>>> On 31.10.2020 01:24, Stefano Stabellini wrote:
>>>>> @@ -79,8 +79,8 @@ config SBSA_VUART_CONSOLE
>>>>>  	  SBSA Generic UART implements a subset of ARM PL011 UART.
>>>>>  
>>>>>  config ARM_SSBD
>>>>> -	bool "Speculative Store Bypass Disable" if EXPERT
>>>>> -	depends on HAS_ALTERNATIVE
>>>>> +	bool "Speculative Store Bypass Disable"
>>>>> +	depends on HAS_ALTERNATIVE && EXPERT
>>>>>  	default y
>>>>
>>>> At the example of this, I'm afraid when the default isn't "n"
>>>> (or there's no default directive at all, as ought to be
>>>> equivalent to and preferred over "default n"), such a
>>>> transformation is not functionally identical: Before your
>>>> change, with !EXPERT this option defaults to y. After your
>>>> change this option is unavailable (which resolves to it being
>>>> off for all consuming purposes).
>>>>
>>>> IOW there are reasons to have "if ..." attached to the prompts
>>>> (for this construct indeed only making the prompt conditional,
>>>> not the entire option), but there are also cases where the
>>>> cleanup you do is indeed desirable / helpful.
>>>
>>> Yeah, thanks for catching it, it is obviously a problem.
>>>
>>> My intention was just to "tag" somehow the options to EXPERT so that it
>>> would show on the menu. Maybe a better, simpler, way to do it is
>>> to add the word "EXPERT" to the one line prompt:
>>>
>>>  config ARM_SSBD
>>> -	bool "Speculative Store Bypass Disable" if EXPERT
>>> +	bool "Speculative Store Bypass Disable (EXPERT)" if EXPERT
>>>  	depends on HAS_ALTERNATIVE
>>>  	default y
>>>  	help
>>>
>>>
>>> What do you think?
>>
>> While on the surface this may look like an improvement, I don't
>> see how it would actually help: If you read the Kconfig file
>> itself, the dependency is seen anyway. And on the menu I don't
>> see the point of telling someone who has enabled EXPERT that a
>> certain option is (or is not) an expert one. If they think
>> they're experts, so should they be treated. (It was, after all,
>> a deliberate decision to make enabling expert mode easier, and
>> hence easier to use for what one might consider not-really-
>> experts. I realize saying so may be considered tendentious; I
>> mean it in a purely technical sense, and I'd like to apologize
>> in advance to anyone not sharing this as a possible perspective
>> to take.)
>>
>> Plus, of course, the addition of such (EXPERT) markers to
>> future options' prompts is liable to get forgotten now and then,
>> so sooner or later we'd likely end up with an inconsistent
>> mixture anyway.
> 
> I tend to agree with you on everything you wrote. The fundamental issue
> is that we are (mis)using EXPERT to tag features that are experimental,
> as defined by SUPPORT.md.
> 
> It is important to be able to distinguish clearly at the kconfig level
> options that are (security) supported from options that are
> unsupported/experimental. Today the only way to do it is with EXPERT
> which is not great because:
> 
> - it doesn't convey the idea that it is for unsupported/experimental
>   features
> - if you want to enable one unsupported feature, it is not clear what
>   you have to do
> 
> So maybe we should replace EXPERT with UNSUPPORTED (or EXPERIMENTAL) in
> the Kconfig menu?

If you mean this to be added to prompt texts, then yes, I'd view
this as helpful. However, ...

> It would make it clearer that by enabling UNSUPPORTED you are going to
> get a configuration that is not security supported. And ideally we would
> also tag features like ACPI as UNSUPPORTED as I suggested above.

... things will get uglier when (just a simple example) something
is supported on x86, but not on Arm.

Jan

