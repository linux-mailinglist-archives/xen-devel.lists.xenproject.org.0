Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB7786C6C7
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 11:24:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686932.1069559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdZj-00068z-MN; Thu, 29 Feb 2024 10:23:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686932.1069559; Thu, 29 Feb 2024 10:23:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfdZj-00066s-JY; Thu, 29 Feb 2024 10:23:39 +0000
Received: by outflank-mailman (input) for mailman id 686932;
 Thu, 29 Feb 2024 10:23:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfdZi-00066m-RI
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 10:23:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfdZh-00011S-8f; Thu, 29 Feb 2024 10:23:37 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfdZh-0002xv-2L; Thu, 29 Feb 2024 10:23:37 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=VlKEEr7nzJ/vC+nohN07hS03u5u0GKXZwV5f7Ew6S0A=; b=ayeEl4vGB4m4Xj4E9l4llzVVhH
	kvg/yKbC7XX0JSmnmOmXNfHrt5j0rwYVQl5CYVHFKgBKJc/A68enMfxDuv5IS9LAfG98HXotwc7cA
	1cKMwntwq2sIfLsK98L1z6cP+Dq3lGZsA/6todYA2aRRwGec/8sfH3R+lQG7ZydQcb2U=;
Message-ID: <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
Date: Thu, 29 Feb 2024 10:23:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
 <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/02/2024 07:58, Jan Beulich wrote:
> On 28.02.2024 23:58, Julien Grall wrote:
>> On 27/02/2024 07:55, Jan Beulich wrote:
>>> On 26.02.2024 18:39, Oleksii Kurochko wrote:
>>>> This patch doesn't represent a strict lower bound for GCC and
>>>> GNU Binutils; rather, these versions are specifically employed by
>>>> the Xen RISC-V container and are anticipated to undergo continuous
>>>> testing.
>>>
>>> Up and until that container would be updated to a newer gcc. I'm
>>> afraid I view this as too weak a criteria,
>>
>> I disagree. We have to decide a limit at some point. It is sensible to
>> say that we are only supporting what we can tests. AFAIK, this is what
>> QEMU has been doing.
> 
> I view qemu as a particularly bad example. They raise their baselines
> far too aggressively for my taste.

AFAICT, the decision was based on the supported distros at the time. 
Which makes sense to me (even though I got recently caught because of 
this check). They also seem to be open to relax the check if there are 
any use cases.

Why would we want to support build Xen on non-supported distros?

> 
>>> IOW it is hard for me to see why RISC-V needs stronger restrictions here
>>> than other architectures. It ought to be possible to determine a baseline
>>> version. Even if taking the desire to have "pause" available as a
>>> requirement, gas (and presumably gld) 2.36.1 would already suffice.
>>
>> I think we want to bump it on Arm. There are zero reasons to try to keep
>> a lower versions if nobody tests/use it in production.
>>
>> I would suggest to do the same on x86. What's the point of try to
>> support Xen with a 15+ years old compiler?
> 
> It could have long been bumped if only a proper scheme to follow for
> this and future bumping would have been put forward by anyone keen on
> such bumping, like - see his reply - e.g. Andrew. You may recall that
> this was discussed more than once on meetings, with no real outcome.
> I'm personally not meaning to stand in the way of such bumping as long
> as it's done in a predictable manner, but I'm not keen on doing so and
> hence I don't view it as my obligation to try to invent a reasonable
> scheme. (My personal view is that basic functionality should be
> possible to have virtually everywhere, whereas for advanced stuff it
> is fine to require a more modern tool chain.)

That's one way to see it. The problem with this statement is a user 
today is mislead to think you can build Xen with any GCC versions since 
4.1. I don't believe we can guarantee that and we are exposing our users 
to unnecessary risk.

In addition to that, I agree with Andrew. This is preventing us to 
improve our code base and we have to carry hacks for older compilers.

> 
> The one additional concern I've raised in the past is that in the end
> it's not just minimal tool chain versions we rely on, but also other
> core system tools (see the recent move from "which" to "command -v"
> for an example of such a dependency, where luckily it turned out to
> not be an issue that the -v had only become a standard thing at some
> point). While for the tool chain I can arrange for making newer
> versions available, for core system tools I can't.

I agree we probably want to clarify the minimum version of the 
coretools. However, I think we need to separate the two. Otherwise, we 
will be forever in the statu quo on x86.

> Therefore being too
> eager there would mean I can't really / easily (smoke) test Xen
> anymore on ancient hardware every once in a while. When afaict we do
> too little of such testing already anyway, despite not having any
> lower bound on hardware that formally we support running Xen on.

Can you provide more details of what you mean by "ancient"?

> (And
> no, upgrading the ancient distros on that ancient hardware is not an
> option for me.)

May I ask why? Is it because newer distros don't support your HW?

Cheers,

-- 
Julien Grall

