Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4AA3FE26F
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 20:33:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176622.321391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLV3F-0006te-Tg; Wed, 01 Sep 2021 18:33:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176622.321391; Wed, 01 Sep 2021 18:33:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLV3F-0006rr-QT; Wed, 01 Sep 2021 18:33:33 +0000
Received: by outflank-mailman (input) for mailman id 176622;
 Wed, 01 Sep 2021 18:33:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLV3F-0006rl-Ay
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 18:33:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLV3B-00009l-De; Wed, 01 Sep 2021 18:33:29 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLV3B-0003Hv-6u; Wed, 01 Sep 2021 18:33:29 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=9PGx/b8tr+VJ14PQ7FQDRJ8vRtnsMyRlQBn9zoS8bA4=; b=ZzVDPPSiIxDnYRWqoLlpuisL1m
	0Hhm4oREb5mZoJY/QZ8yfX7XSKUi2rarC3kiuCy0wkrs5uoL/TqofHmiDg1IY0mQtubIDX/7r3kDg
	GQTpBUnFNkarj0KA2Z1jrWwj68Cdv/BJ0VyYZmglcxANZU9pKxAQI5aab4lRFV6jp9LE=;
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210901124308.31573-1-michal.orzel@arm.com>
 <599515f0-4b8a-3a71-caea-b17ec27c9123@xen.org>
 <44B48162-EB44-4295-9629-2D95A40D7232@arm.com>
 <46e36ba5-8b3d-2d43-6297-b92d2654ab72@xen.org>
 <alpine.DEB.2.21.2109011045440.17925@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <0e72fb05-a477-ef79-c26f-bc011393a403@xen.org>
Date: Wed, 1 Sep 2021 19:33:26 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109011045440.17925@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 01/09/2021 18:54, Stefano Stabellini wrote:
> On Wed, 1 Sep 2021, Julien Grall wrote:
>> On 01/09/2021 14:10, Bertrand Marquis wrote:
>>>> On 1 Sep 2021, at 13:55, Julien Grall <julien@xen.org> wrote:
>>>>
>>>> Hi,
>>>>
>>>> On 01/09/2021 13:43, Michal Orzel wrote:
>>>>> Introduce new Xen command line parameter called "pmu_access".
>>>>> The default value is "trap": Xen traps PMU accesses.
>>>>> In case of setting pmu_access to "native", Xen does not trap
>>>>> PMU accesses allowing all the guests to access PMU registers.
>>>>> However, guests cannot make use of PMU overflow interrupts as
>>>>> PMU uses PPI which Xen cannot route to guests.
>>>>> This option is only intended for development and testing purposes.
>>>>> Do not use this in production system.
>>>> I am afraid your option is not safe even in development system as a vCPU
>>>> may move between pCPUs.
>>>>
>>>> However, even if we restricted the use to pinned vCPU *and* dedicated
>>>> pCPU, I am not convinced that exposing an half backed PMU (the overflow
>>>> interrupt would not work) to the guest is the right solution. This likely
>>>> means the guest OS would need to be modified and therefore the usage of
>>>> this option is fairly limited.
>>>>
>>>> So I think the first steps are:
>>>>    1) Make the PPI work. There was some attempt in the past for it on
>>>> xen-devel. You could have a look.
>>>>    2) Provide PMU bindings
>>>>
>>>> With that in place, we can discuss how to expose the PMU even if it is
>>>> unsafe in some conditions.
>>>
>>> With those limitations, using the PMU to monitor the system performances or
>>> on some specific use cases is still really useful.
>>> We are using that to do some benchmarks of Xen or of some applications to
>>> compare the behaviour to a native system or
>>> analyse the performances of Xen itself (hypercalls,context switch …etc)
> 
> I also already had to write a patch almost exactly like this one to
> provide to customers a few months back.
> 
> 
>> I understand this is useful for some setup and I am not trying to say we
>> should not have a way to expose the PMU (even unsafely) in upstream. However,
>> I think the option as it stands is too wide (this should be a per domain knob)
>> and we should properly expose the PMU (interrupts, bindings...).
> 
> I have never used PMU directly myself, only provided a patch similar to
> this one.  But as far as I could tell the users were fully satisfied
> with it and it had no interrupts support either. Could it be that
> interrupts are not actually needed to read the perf counters, which is
> probably what users care about?

You don't need the interrupts to read the perf counters. But AFAIU, you 
would have to poll at a regular interval yourself. There is also the 
question on how to catch the overflow?

> 
> In regards to "this should be a per domain knob", in reality if you are
> doing PMU experiments you don't care if only one or all domains have
> access: you are working in a controlled environment trying to figure out
> if your setup meets the timing requirements. There are no security or
> safety concerns (those are different experiments) and there is no
> interference problems in the sense of multiple domains trying to access
> PMU at the same time -- you control the domains you decide which one is
> accessing them. >
> So I am in favor of a patch like this one because it actually satisfy
> our requirements. Even if we had per-domain support and interrupts
> support, I don't think they would end up being used.

I have to disagree with that. There are valid use-cases where you may 
want to expose the PMU for using perf to a single domain because you 
know it is safe to do so. I appreciate this is may not be the use case 
for your users (yet), but I have seen (and used) it on x86. So to me 
this approach is short-sighed.

TBH, this is not the first time I have seen patch for "let's expose the 
same feature to everyone because this is easy to do" and really dislike 
it. Exposing a new feature from the toolstack is easier than you think 
(baring the lack of reviews), this is a matter of creating a new flag a 
new option. This would make Xen a lot more flexible and enable more users...

So as it stands:

NAcked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

