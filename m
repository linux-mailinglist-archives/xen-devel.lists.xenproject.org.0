Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5C3FE930
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:20:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176938.322007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLg4w-00063S-8W; Thu, 02 Sep 2021 06:20:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176938.322007; Thu, 02 Sep 2021 06:20:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLg4w-0005zU-5I; Thu, 02 Sep 2021 06:20:02 +0000
Received: by outflank-mailman (input) for mailman id 176938;
 Thu, 02 Sep 2021 06:20:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4i5Y=NY=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1mLg4u-0005t9-4L
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:20:00 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id cc3910cd-0bb5-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:19:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F8BB1FB;
 Wed,  1 Sep 2021 23:19:58 -0700 (PDT)
Received: from [10.57.19.246] (unknown [10.57.19.246])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6CFB03F766;
 Wed,  1 Sep 2021 23:19:56 -0700 (PDT)
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
X-Inumbo-ID: cc3910cd-0bb5-11ec-ae3e-12813bfff9fa
Subject: Re: [PATCH] xen/arm: Introduce pmu_access parameter
To: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
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
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <0c527a57-44f2-d888-3210-644ea3aa940e@arm.com>
Date: Thu, 2 Sep 2021 08:19:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2109011045440.17925@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 01.09.2021 19:54, Stefano Stabellini wrote:
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
>>>>   1) Make the PPI work. There was some attempt in the past for it on
>>>> xen-devel. You could have a look.
>>>>   2) Provide PMU bindings
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
> 
Most of the people using PMU do not need interrupt as PMU can only be programmed
to generate overflow interrupt request when a counter overflows.
If we want to catch counter overflow without using interrupt, we can check
if overflow status bit is set to 1 in PMOVSCLR register.

> In regards to "this should be a per domain knob", in reality if you are
> doing PMU experiments you don't care if only one or all domains have
> access: you are working in a controlled environment trying to figure out
> if your setup meets the timing requirements. There are no security or
> safety concerns (those are different experiments) and there is no
> interference problems in the sense of multiple domains trying to access
> PMU at the same time -- you control the domains you decide which one is
> accessing them.
> 
> So I am in favor of a patch like this one because it actually satisfy
> our requirements. Even if we had per-domain support and interrupts
> support, I don't think they would end up being used.
> 

