Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902E16C36E1
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 17:26:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512849.793153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peenn-0002AN-LF; Tue, 21 Mar 2023 16:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512849.793153; Tue, 21 Mar 2023 16:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peenn-000287-HX; Tue, 21 Mar 2023 16:25:35 +0000
Received: by outflank-mailman (input) for mailman id 512849;
 Tue, 21 Mar 2023 16:25:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1peenm-000281-GH
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 16:25:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peenm-0001SY-4D; Tue, 21 Mar 2023 16:25:34 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1peenl-000635-Uk; Tue, 21 Mar 2023 16:25:34 +0000
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
	bh=ROw/gtgEDVcuG20bWaUK2AIC70BtOrz5OPS+Z5KExHo=; b=2+Wyq7054z30OEqPxpVH4rB5Pd
	GwxmttIRfZayeVZ17xBsjtzaVdShEKNe8YeWokp9yKGrkQNBvYuFow69nopnaAW7yfCr9IV5ngCTB
	C7v4nhpSuaTcZTPDbx0+EBg8rJhVOpFLUuYSLyAeZTQQezkeyih0iPjJPX/f1FgxCTfY=;
Message-ID: <07088184-3aa4-0e1f-2794-60219c358283@xen.org>
Date: Tue, 21 Mar 2023 16:25:31 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
 <fca300ad-0fd1-70ed-4cd4-82e89f5c3351@xen.org>
 <a0f3f1ca4277c1f8aeeaf6531d90c5b04c244af9.camel@gmail.com>
 <98d45f93-b611-1016-45b5-3d7487af261f@xen.org>
 <e0722b2323c78478f8fd07b515bb607ef168ef1e.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e0722b2323c78478f8fd07b515bb607ef168ef1e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/03/2023 16:25, Oleksii wrote:
> Hi Julien,

Hi,

Sorry for the late answer. I was away for the past couple of weeks.

> On Mon, 2023-02-27 at 17:36 +0000, Julien Grall wrote:
>> Hi Oleksii,
>>
>> On 27/02/2023 16:52, Oleksii wrote:
>>> On Sat, 2023-02-25 at 17:53 +0000, Julien Grall wrote:
>>>>> +/*
>>>>> + * WARNING: load_addr() and linker_addr() are to be called
>>>>> only
>>>>> when the MMU is
>>>>> + * disabled and only when executed by the primary CPU.  They
>>>>> cannot refer to
>>>>> + * any global variable or functions.
>>>>
>>>> I find interesting you are saying when
>>>> _setup_initial_pagetables() is
>>>> called from setup_initial_pagetables(). Would you be able to
>>>> explain
>>>> how
>>>> this is different?
>>> I am not sure that I understand your question correctly but
>>> _setup_initial_pagetables() was introduced to map some addresses
>>> with
>>> write/read flag. Probably I have to rename it to something that is
>>> more
>>> clear.
>>
>> So the comment suggests that you code cannot refer to global
>> functions/variables when the MMU is off. So I have multiple
>> questions:
>>     * Why only global? IOW, why static would be OK?
>>     * setup_initial_pagetables() has a call to
>> _setup_initial_pagetables() (IOW referring to another function). Why
>> is
>> it fine?
>>     * You have code in the next patch referring to global variables
>> (mainly _start and _end). How is this different?
>>
>>>>
>>>>> + */
>>>>> +
>>>>> +/*
>>>>> + * Convert an addressed layed out at link time to the address
>>>>> where it was loaded
>>>>
>>>> Typo: s/addressed/address/ ?
>>> Yes, it should be address. and 'layed out' should be changed to
>>> 'laid
>>> out'...
>>>>
>>>>> + * by the bootloader.
>>>>> + */
>>>>
>>>> Looking at the implementation, you seem to consider that any
>>>> address
>>>> not
>>>> in the range [linker_addr_start, linker_addr_end[ will have a 1:1
>>>> mappings.
>>>>
>>>> I am not sure this is what you want. So I would consider to throw
>>>> an
>>>> error if such address is passed.
>>> I thought that at this stage and if no relocation was done it is
>>> 1:1
>>> except the case when load_addr_start != linker_addr_start.
>>
>> The problem is what you try to map one to one may clash with the
>> linked
>> region for Xen. So it is not always possible to map the region 1:1.
>>
>> Therefore, I don't see any use for the else part here.
> Got it. Thanks.
> 
> I am curious than what is the correct approach in general to handle
> this situation?
There are multiple approach to handle it and I don't know which one 
would be best :). Relocation is one...

> I mean that throw an error it is one option but if I would like to do
> that w/o throwing an error. Should it done some relocation in that
> case?
... solution. For Arm, I decided to avoid relocation it requires more 
work in assembly.

Let me describe what we did and you can decide what you want to do in 
RISC-V.

For Arm64, as we have plenty of virtual address space, I decided to 
reshuffle the layout so Xen is running a very high address (so it is 
unlikely to clash).

For Arm32, we have a smaller address space (4GB) so instead we are going 
through a temporary area to enable the MMU when the load and runtime 
region clash. The sequence is:

   1) Map Xen to a temporary area
   2) Enable the MMU and jump to the temporary area
   3) Map Xen to the runtime area
   4) Jump to the runtime area
   5) Remove the temporary area

[...]

>>>> Hmmm... I would actually expect the address to be properly
>>>> aligned
>>>> and
>>>> therefore not require an alignment here.
>>>>
>>>> Otherwise, this raise the question of what happen if you have
>>>> region
>>>> using the same page?
>>> That map_start &=  ZEROETH_MAP_MASK is needed to page number of
>>> address
>>> w/o page offset.
>>
>> My point is why would the page offset be non-zero?
> I checked a linker script and addresses that passed to
> setup_initial_mapping() and they are really always aligned so there is
> no any sense in additional alignment.

Ok. I would suggest to add some ASSERT()/BUG_ON() in order to confirm 
this is always the case.

[...]

>>>>
>>>>> +
>>>>> +    /*
>>>>> +     * Create a mapping of the load time address range to...
>>>>> the
>>>>> load time address range.
>>>>
>>>> Same about the line length here.
>>>>
>>>>> +     * This mapping is used at boot time only.
>>>>> +     */
>>>>> +    _setup_initial_pagetables(second, first, zeroeth,
>>>>
>>>> This can only work if Xen is loaded at its linked address. So you
>>>> need a
>>>> separate set of L0, L1 tables for the identity mapping.
>>>>
>>>> That said, this would not be sufficient because:
>>>>      1) Xen may not be loaded at a 2M boundary (you can control
>>>> with
>>>> U-boot, but not with EFI). So this may cross a boundary and
>>>> therefore
>>>> need multiple pages.
>>>>      2) The load region may overlap the link address
>>>>
>>>> While I think it would be good to handle those cases from the
>>>> start,
>>>> I
>>>> would understand why are not easy to solve. So I think the
>>>> minimum is
>>>> to
>>>> throw some errors if you are in a case you can't support.
>>> Do you mean to throw some error in load_addr()/linkder_addr()?
>>
>> In this case, I meant to check if load_addr != linker_addr, then
>> throw
>> an error.
> I am not sure that it is needed now and it is easier to throw an error
> but is option exist to handler situation when load_addr != linker_addr
> except throwing an error? relocate?

I believe I answered this above.

Cheers,

-- 
Julien Grall

