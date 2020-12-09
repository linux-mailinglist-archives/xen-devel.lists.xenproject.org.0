Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C002D49A2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Dec 2020 19:58:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48668.86084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4fM-0005vO-Iu; Wed, 09 Dec 2020 18:58:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48668.86084; Wed, 09 Dec 2020 18:58:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kn4fM-0005v3-Fn; Wed, 09 Dec 2020 18:58:20 +0000
Received: by outflank-mailman (input) for mailman id 48668;
 Wed, 09 Dec 2020 18:58:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kn4fK-0005uy-HK
 for xen-devel@lists.xenproject.org; Wed, 09 Dec 2020 18:58:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn4fJ-0007mx-I9; Wed, 09 Dec 2020 18:58:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kn4fJ-0007px-3x; Wed, 09 Dec 2020 18:58:17 +0000
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
	bh=9CP0Wr+HcuavK8spAj03FIwOzghiv+hj+CI3XS6MuIw=; b=CXarsxWDoyytJ6yFV+IU80FM1b
	+QxjOlFmrg+sCgD5pDq6QeeMz9QkPUB95zncgaNbxq4cSdC3/VVSbMn9AX7XKYTJC6MIqE+QTeELf
	mHvLQDpctiwar2U9G5nY1PKHpTTA69kxYgH0R3baZTvUiqsqTZsFVOWYslBH2umhqV6w=;
Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
To: paul@xen.org, 'Oleksandr' <olekstysh@gmail.com>
Cc: 'Jan Beulich' <jbeulich@suse.com>,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Volodymyr Babchuk' <Volodymyr_Babchuk@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Julien Grall' <julien.grall@arm.com>, xen-devel@lists.xenproject.org
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-18-git-send-email-olekstysh@gmail.com>
 <3bb4c3b5-a46a-ba31-292f-5c6ba49fa9be@suse.com>
 <6026b7f3-ae6e-f98f-be65-27d7f729a37f@gmail.com>
 <18bfd9b1-3e6a-8119-efd0-c82ad7ae681d@gmail.com>
 <0d6c01d6cd9a$666326c0$33297440$@xen.org>
 <57bfc007-e400-6777-0075-827daa8acf0e@gmail.com>
 <0d7201d6ce09$e13dce80$a3b96b80$@xen.org>
From: Julien Grall <julien@xen.org>
Message-ID: <84d7238d-0ec1-acdd-6cea-db78aba6f3d7@xen.org>
Date: Wed, 9 Dec 2020 18:58:14 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <0d7201d6ce09$e13dce80$a3b96b80$@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr and Paul,

Sorry for jumping late in the conversation.

On 09/12/2020 09:01, Paul Durrant wrote:
>> -----Original Message-----
>> From: Oleksandr <olekstysh@gmail.com>
>> Sent: 08 December 2020 20:17
>> To: paul@xen.org
>> Cc: 'Jan Beulich' <jbeulich@suse.com>; 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>;
>> 'Stefano Stabellini' <sstabellini@kernel.org>; 'Julien Grall' <julien@xen.org>; 'Volodymyr Babchuk'
>> <Volodymyr_Babchuk@epam.com>; 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'George Dunlap'
>> <george.dunlap@citrix.com>; 'Ian Jackson' <iwj@xenproject.org>; 'Wei Liu' <wl@xen.org>; 'Julien Grall'
>> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
>>
>>
>> On 08.12.20 21:43, Paul Durrant wrote:
>>
>> Hi Paul
>>
>>>> -----Original Message-----
>>>> From: Oleksandr <olekstysh@gmail.com>
>>>> Sent: 08 December 2020 16:57
>>>> To: Paul Durrant <paul@xen.org>
>>>> Cc: Jan Beulich <jbeulich@suse.com>; Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Stefano
>>>> Stabellini <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Volodymyr Babchuk
>>>> <Volodymyr_Babchuk@epam.com>; Andrew Cooper <andrew.cooper3@citrix.com>; George Dunlap
>>>> <george.dunlap@citrix.com>; Ian Jackson <iwj@xenproject.org>; Wei Liu <wl@xen.org>; Julien Grall
>>>> <julien.grall@arm.com>; xen-devel@lists.xenproject.org
>>>> Subject: Re: [PATCH V3 17/23] xen/ioreq: Introduce domain_has_ioreq_server()
>>>>
>>>>
>>>> Hi Paul.
>>>>
>>>>
>>>> On 08.12.20 17:33, Oleksandr wrote:
>>>>> On 08.12.20 17:11, Jan Beulich wrote:
>>>>>
>>>>> Hi Jan
>>>>>
>>>>>> On 30.11.2020 11:31, Oleksandr Tyshchenko wrote:
>>>>>>> --- a/xen/include/xen/ioreq.h
>>>>>>> +++ b/xen/include/xen/ioreq.h
>>>>>>> @@ -55,6 +55,20 @@ struct ioreq_server {
>>>>>>>         uint8_t                bufioreq_handling;
>>>>>>>     };
>>>>>>>     +/*
>>>>>>> + * This should only be used when d == current->domain and it's not
>>>>>>> paused,
>>>>>> Is the "not paused" part really relevant here? Besides it being rare
>>>>>> that the current domain would be paused (if so, it's in the process
>>>>>> of having all its vCPU-s scheduled out), does this matter at all?do
>>>>>> any extra actionsdo any extra actions
>>>>> No, it isn't relevant, I will drop it.
>>>>>
>>>>>
>>>>>> Apart from this the patch looks okay to me, but I'm not sure it
>>>>>> addresses Paul's concerns. Iirc he had suggested to switch back to
>>>>>> a list if doing a swipe over the entire array is too expensive in
>>>>>> this specific case.
>>>>> We would like to avoid to do any extra actions in
>>>>> leave_hypervisor_to_guest() if possible.
>>>>> But not only there, the logic whether we check/set
>>>>> mapcache_invalidation variable could be avoided if a domain doesn't
>>>>> use IOREQ server...
>>>>
>>>> Are you OK with this patch (common part of it)?
>>> How much of a performance benefit is this? The array is small to simply counting the non-NULL
>> entries should be pretty quick.
>> I didn't perform performance measurements on how much this call consumes.
>> In our system we run three domains. The emulator is in DomD only, so I
>> would like to avoid to call vcpu_ioreq_handle_completion() for every
>> Dom0/DomU's vCPUs
>> if there is no real need to do it.
> 
> This is not relevant to the domain that the emulator is running in; it's concerning the domains which the emulator is servicing. How many of those are there?

AFAICT, the maximum number of IOREQ servers is 8 today.

> 
>> On Arm vcpu_ioreq_handle_completion()
>> is called with IRQ enabled, so the call is accompanied with
>> corresponding irq_enable/irq_disable.
>> These unneeded actions could be avoided by using this simple one-line
>> helper...
>>
> 
> The helper may be one line but there is more to the patch than that. I still think you could just walk the array in the helper rather than keeping a running occupancy count.

Right, the concern here is this function will be called in an hotpath 
(everytime we are re-entering to the guest). At the difference of x86, 
the entry/exit code is really small, so any additional code will have an 
impact on the overall performance.

That said, the IOREQ code is a tech preview for Arm. So I would be fine 
going with Paul's approach until we have a better understanding on the 
performance of virtio/IOREQ.

I am going to throw some more thoughts about the optimization here. The 
patch is focusing on performance impact when IOREQ is built-in and not 
used. I think we can do further optimization (which may superseed this one).

get_pending_vcpu() (called from handle_hvm_io_completion()) is overly 
expensive in particular if you have no I/O forwarded to an IOREQ server. 
Entry to the hypervisor can happen for many reasons (interrupts, system 
registers emulation, I/O emulation...) and the I/O forwarded should be a 
small subset.

Ideally, handle_hvm_io_completion() should be a NOP (at max a few 
instructions) if there are nothing to do. Maybe we want to introduce a 
per-vCPU flag indicating if an I/O has been forwarded to an IOREQ server.

This would also us to bypass most of the function if there is nothing to do.

Any thoughts?

In any case this is more a forward looking rather than a request for the 
current series. What matters to me is we have a functional (not 
necessarily optimized) version of IOREQ in Xen 4.15. This would be a 
great step towards using Virto on Xen.

Cheers,

-- 
Julien Grall

