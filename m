Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF23C46D074
	for <lists+xen-devel@lfdr.de>; Wed,  8 Dec 2021 10:56:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.242104.418771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mutfy-0002sO-GA; Wed, 08 Dec 2021 09:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 242104.418771; Wed, 08 Dec 2021 09:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mutfy-0002pg-Cs; Wed, 08 Dec 2021 09:55:50 +0000
Received: by outflank-mailman (input) for mailman id 242104;
 Wed, 08 Dec 2021 09:55:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mutfx-0002pa-CR
 for xen-devel@lists.xenproject.org; Wed, 08 Dec 2021 09:55:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mutft-0002KR-LI; Wed, 08 Dec 2021 09:55:45 +0000
Received: from [54.239.6.189] (helo=[192.168.13.103])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mutft-0006lm-F6; Wed, 08 Dec 2021 09:55:45 +0000
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
	bh=oVcnsqiknoJr2KCk247C8Qv8DBhB7s98VvYWxkyS/Yo=; b=MLhoqLszMDNZWkmOcVDHeOf3Gi
	Y/G01dg+JnAs1EsEVAaJBcP22e3D+rgiX23RR4T7vZzQag9aSFd9j97IRpuX3F99nkSoZub1qxq5m
	tjgUoyEG7biUpI82Zc9io232FQwAKKEUAP0A9ANczJ6ChVyW8RQtDYEc/1BcqO/MEFGA=;
Message-ID: <73913bdf-7449-34fb-b86b-662774cb3e62@xen.org>
Date: Wed, 8 Dec 2021 09:55:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] xen/arm64: Zero the top 32 bits of gp registers on
 entry...
To: Jan Beulich <jbeulich@suse.com>, Michal Orzel <michal.orzel@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <20211206142032.27536-1-michal.orzel@arm.com>
 <f3573439-4893-440f-54e1-fdeba3eb4508@xen.org>
 <dc114877-b9da-7a5b-260d-b9438cddd777@arm.com>
 <b7a53384-39cb-f368-f39b-9b560336226b@xen.org>
 <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <6ab797ce-86dc-2c32-1cd0-417fab7516c7@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/12/2021 07:20, Jan Beulich wrote:
> On 07.12.2021 20:11, Julien Grall wrote:
>>
>>
>> On 07/12/2021 08:37, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>> On 06.12.2021 16:29, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 06/12/2021 14:20, Michal Orzel wrote:
>>>>> to hypervisor when switching to AArch32 state.
>>>>>
>>> I will change to "from AArch32 state".
>>>>> According to section D1.20.2 of Arm Arm(DDI 0487A.j):
>>>>> "If the general-purpose register was accessible from AArch32 state the
>>>>> upper 32 bits either become zero, or hold the value that the same
>>>>> architectural register held before any AArch32 execution.
>>>>> The choice between these two options is IMPLEMENTATIONDEFINED"
>>>>
>>>> Typo: Missing space between IMPLEMENTATION and DEFINED.
>>>>
>>> Ok.
>>>>>
>>>>> Currently Xen does not ensure that the top 32 bits are zeroed and this
>>>>> needs to be fixed.
>>>>
>>>> Can you outline why this is a problem and why we need to protect? IIRC, the main concern is Xen may misinterpret what the guest requested but we are not concerned about Xen using wrong value.
>>>>
>>> I would say:
>>> "
>>> The reason why this is a problem is that there are places in Xen where we assume that top 32bits are zero for AArch32 guests.
>>> If they are not, this can lead to misinterpretation of Xen regarding what the guest requested.
>>> For example hypercalls returning an error encoded in a signed long like do_sched_op, do_hmv_op, do_memory_op would return -ENOSYS
>>> if the command passed as the first argument was clobbered,
>>> "
>>>>>
>>>>> Fix this bug by zeroing the upper 32 bits of these registers on an
>>>>> entry to hypervisor when switching to AArch32 state.
>>>>>
>>>>> Set default value of parameter compat of macro entry to 0 (AArch64 mode
>>>>> as we are on 64-bit hypervisor) to avoid checking if parameter is blank
>>>>> when not passed.
>>>>
>>>> Which error do you see otherwise? Is it a compilation error?
>>>>
>>> Yes, this is a compilation error. The errors appear at each line when "entry" is called without passing value for "compat".
>>> So basically in all the places where entry is called with hyp=1.
>>> When taking the current patch and removing default value for compat you will get:
>>> ```
>>> entry.S:254: Error: ".endif" without ".if"
>>> entry.S:258: Error: symbol `.if' is already defined
>>> entry.S:258: Error: ".endif" without ".if"
>>> entry.S:262: Error: symbol `.if' is already defined
>>> entry.S:262: Error: ".endif" without ".if"
>>> entry.S:266: Error: symbol `.if' is already defined
>>> entry.S:266: Error: ".endif" without ".if"
>>> entry.S:278: Error: symbol `.if' is already defined
>>> entry.S:278: Error: ".endif" without ".if"
>>> entry.S:292: Error: symbol `.if' is already defined
>>> entry.S:292: Error: ".endif" without ".if"
>>> entry.S:317: Error: symbol `.if' is already defined
>>> entry.S:317: Error: ".endif" without ".if"
>>> ```
>>
>> Thanks for input. I am concerned with your suggested approach (or using
>> .if 0\compat as suggested by Jan) because they allow the caller to not
>> properly specify compat when hyp=0. The risk here is we may generate the
>> wrong entry.
>>
>> compat should need to be specified when hyp=1 as we will always run in
>> aarch64 mode. So could we protect this code with hyp=0?
> 
> Since my suggestion was only to avoid the need for specifying a default
> for the parameter (which you didn't seem to be happy about), it would
> then merely extend to
> 
> .if !0\hyp && 0\compat
Isn't it effectively the same as setting a default value?

The reason we seem to get away is because other part of the macro (e.g. 
entry_guest) will need compat to be valid.

But that seems pretty fragile to me. So I would prefer if the new code 
it added within a macro that is only called when hyp==0.

Cheers,

> 
> or something along those lines.
> 
> Jan
> 

-- 
Julien Grall

