Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 652B09DBC76
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2024 20:23:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.845617.1260977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGk65-0004Fl-B2; Thu, 28 Nov 2024 19:22:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 845617.1260977; Thu, 28 Nov 2024 19:22:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGk65-0004EB-7H; Thu, 28 Nov 2024 19:22:41 +0000
Received: by outflank-mailman (input) for mailman id 845617;
 Thu, 28 Nov 2024 19:22:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tGk63-0004E5-HY
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2024 19:22:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGk5z-00A8BD-0k;
 Thu, 28 Nov 2024 19:22:35 +0000
Received: from [2a02:8012:3a1:0:1024:27fc:e73a:2414]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGk5z-00B2QB-0y;
 Thu, 28 Nov 2024 19:22:35 +0000
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
	bh=5WjNmllbYj0mUnnZuhPg9KKXB5/Pup9q2PC9fIKxRoY=; b=UeMyq8cgrCffowDup9d6f1WDUJ
	nhVXabJQ9WqFswY1vt9YBv2hQ39stqUedMj9JKrgkRjBdH+QwY8+Co5kGkYaF49I3U3cPPZPo7Jze
	SDD2qTdoygLtvOhPiPxLfgn9e+3OhqPI1Bk0Pm3b6URcM5a88ObKSNGFISOBcJ5lv9oA=;
Message-ID: <7248576a-2743-4d08-a272-532ef234083d@xen.org>
Date: Thu, 28 Nov 2024 19:22:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: do not give memory back to static heap
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>, Jan Beulich <jbeulich@suse.com>
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20241119085806.805142-1-luca.fancellu@arm.com>
 <20241119085806.805142-5-luca.fancellu@arm.com>
 <ca91b717-47c3-4f92-af6a-cb740ef6e91d@suse.com>
 <BE895863-B07F-42C2-BD44-D0A1E6150DC4@arm.com>
 <e5f0b9e4-80ab-4cf5-8745-4cb83cfe4c7d@suse.com>
 <7761CEB9-2304-4588-9ADE-C81B9A5E536C@arm.com>
 <7cc9ad6f-e5f6-444f-994c-b176a93cfb29@suse.com>
 <C881D093-C583-49BE-B541-ACE705C2C2C7@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <C881D093-C583-49BE-B541-ACE705C2C2C7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Luca,

Sorry for the late answer.

On 26/11/2024 13:52, Luca Fancellu wrote:
> 
> 
>> On 26 Nov 2024, at 13:29, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 26.11.2024 14:25, Luca Fancellu wrote:
>>>> This reads better, thanks. Follow-on question: Is what is statically
>>>> configured for the heap guaranteed to never overlap with anything passed
>>>> to init_domheap_pages() in those places that you touch?
>>>
>>> I think so, the places of the check are mainly memory regions related to boot modules,
>>> when we add a boot module we also do a check in order to see if it clashes with any
>>> reserved regions already defined, which the static heap is part of.
>>>
>>> Could you explain me why the question?
>>
>> Well, if there was a chance of overlap, then parts of the free region would
>> need to go one way, and the rest the other way.
> 
> oh ok, sure of course, thanks for answering.
> 
>>
>>>>>>> --- a/xen/include/xen/bootfdt.h
>>>>>>> +++ b/xen/include/xen/bootfdt.h
>>>>>>> @@ -132,7 +132,6 @@ struct bootinfo {
>>>>>>> #ifdef CONFIG_STATIC_SHM
>>>>>>>    struct shared_meminfo shmem;
>>>>>>> #endif
>>>>>>> -    bool static_heap;
>>>>>>> };
>>>>>>>
>>>>>>> #ifdef CONFIG_ACPI
>>>>>>> @@ -157,6 +156,10 @@ struct bootinfo {
>>>>>>>
>>>>>>> extern struct bootinfo bootinfo;
>>>>>>>
>>>>>>> +#ifdef CONFIG_STATIC_MEMORY
>>>>>>> +extern bool static_heap;
>>>>>>> +#endif
>>>>>>
>>>>>> Just to double check Misra-wise: Is there a guarantee that this header will
>>>>>> always be included by page-alloc.c, so that the definition of the symbol
>>>>>> has an earlier declaration already visible? I ask because this header
>>>>>> doesn't look like one where symbols defined in page-alloc.c would normally
>>>>>> be declared. And I sincerely hope that this header isn't one of those that
>>>>>> end up being included virtually everywhere.
>>>>>
>>>>> I’ve read again MISRA rule 8.4 and you are right, I should have included bootfdt.h in
>>>>> page-alloc.c in order to have the declaration visible before defining static_heap.
>>>>>
>>>>> I will include the header in page-alloc.c
>>>>
>>>> Except that, as said, I don't think that header should be included in this file.
>>>> Instead I think the declaration wants to move elsewhere.
>>>
>>> Ok sorry, I misunderstood your comment, I thought you were suggesting to have the
>>> declaration visible in that file since we are defining there the variable.
>>>
>>> So Julien suggested that file, it was hosted before in common/device-tree/device-tree.c,
>>> see the comment here:
>>> https://patchwork.kernel.org/project/xen-devel/patch/20241115105036.218418-6-luca.fancellu@arm.com/#26125054
>>>
>>> Since it seems you disagree with Julien, could you suggest a more suitable place?
>>
>> Anything defined in page-alloc.c should by default have its declaration in
>> xen/mm.h, imo. Exceptions would need justification.
> 
> I would be fine to have the declaration in xen/mm.h, I just need to import xen/mm.h in bootfdt.h so that it is visible to
> “using_static_heap”, @Julien would you be ok with that?

I think using_static_heap() should be defined in xen/mm.h as well 
because we expect everyone to use using_static_heap() rather than 
static_heap.

This is to avoid adding #ifdef for every user.

Cheers,

-- 
Julien Grall


