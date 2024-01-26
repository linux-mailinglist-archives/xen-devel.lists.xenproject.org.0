Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B92A83DE57
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jan 2024 17:08:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.672156.1045905 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOkn-0000jT-Lp; Fri, 26 Jan 2024 16:08:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 672156.1045905; Fri, 26 Jan 2024 16:08:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rTOkn-0000h8-Ic; Fri, 26 Jan 2024 16:08:29 +0000
Received: by outflank-mailman (input) for mailman id 672156;
 Fri, 26 Jan 2024 16:08:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rTOkl-0000gP-UH
 for xen-devel@lists.xenproject.org; Fri, 26 Jan 2024 16:08:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTOkk-0007tG-Kv; Fri, 26 Jan 2024 16:08:26 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.150.130]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rTOkk-0002s4-DT; Fri, 26 Jan 2024 16:08:26 +0000
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
	bh=d76OtKf+FdQbQpIKUP5AAgKY86/TJ77hK0FFOCq9J5s=; b=ogAlqLiT0wWdEtycPEm0pnmU7y
	R29QxOHMEZxsd27b/4Z+4q+Wuvd/clqS2mgdwh9L0oJqOmoAe4/KwviPAb2AvseNdhf2EDreR0v50
	IcWZ/l3geH1OLR6us+k6LY4200LIYBz+8LqemsRolH1zNNU9h0MvRrlIiVNZbrXFAp4k=;
Message-ID: <a5a553cf-fe8c-4934-ac97-bdc59aeaed1c@xen.org>
Date: Fri, 26 Jan 2024 16:08:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/lib: introduce generic find next bit operations
Content-Language: en-GB
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <52730e6314210ba4164a9934a720c4fda201447b.1706266854.git.oleksii.kurochko@gmail.com>
 <f8602dc5-e603-42fc-b3a2-dc71c55db341@xen.org>
 <1104df46d7780ef1bbcb6c745685b10fe6d2aa5d.camel@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1104df46d7780ef1bbcb6c745685b10fe6d2aa5d.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Oleksii,

On 26/01/2024 15:58, Oleksii wrote:
> On Fri, 2024-01-26 at 13:20 +0000, Julien Grall wrote:
>> Hi,
> Hi Julien,
> 
>>
>> On 26/01/2024 12:20, Oleksii Kurochko wrote:
>>> find-next-bit.c is common for Arm64, PPC and RISCV64,
>>> so it is moved to xen/lib.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>> ---
>>>    docs/misra/exclude-list.json                  |   4 -
>>>    xen/arch/arm/arm64/lib/Makefile               |   2 +-
>>>    xen/arch/arm/include/asm/arm64/bitops.h       |  48 --------
>>>    xen/arch/ppc/include/asm/bitops.h             | 115 -------------
>>> -----
>>>    xen/include/xen/bitops.h                      |  48 ++++++++
>>>    xen/lib/Makefile                              |   1 +
>>>    .../find_next_bit.c => lib/find-next-bit.c}   |   0
>>>    7 files changed, 50 insertions(+), 168 deletions(-)
>>>    rename xen/{arch/arm/arm64/lib/find_next_bit.c => lib/find-next-
>>> bit.c} (100%)
>>>
>>> diff --git a/docs/misra/exclude-list.json b/docs/misra/exclude-
>>> list.json
>>> index 7971d0e70f..7fe02b059d 100644
>>> --- a/docs/misra/exclude-list.json
>>> +++ b/docs/misra/exclude-list.json
>>> @@ -13,10 +13,6 @@
>>>                "rel_path": "arch/arm/arm64/insn.c",
>>>                "comment": "Imported on Linux, ignore for now"
>>>            },
>>> -        {
>>> -            "rel_path": "arch/arm/arm64/lib/find_next_bit.c",
>>
>> Rather than removing the section, I was expecting the rel_path to be
>> updated. Can you explain why you think the exclusion is not
>> necessary?
> I considered simply updating the path to xen/lib/find-next-bit.c, but
> ultimately opted to remove it. This decision was based on the fact that
> the line in question checks for a file that no longer exists. 

That's not quite correct. The file still exists but with a different name.

> If it's
> preferable to update the rel_path with xen/lib/find-next-bit.c, I'm
> more than willing to make that adjustment.

The problem is by removing the file, you effectively tell Eclair to 
report any MISRA error. I don't believe this is what we want here.

But if the other agrees with you, then this change ought to be explained 
in the commit message.

To me the key is the commit message should contain enough information 
for the reviewer to understand what/why you are doing. All the changes I 
pointed out are definitely not just a normal code movement.
> 
>>
>>> -            "comment": "Imported from Linux, ignore for now"
>>> -        },
>>>            {
>>>                "rel_path": "arch/x86/acpi/boot.c",
>>>                "comment": "Imported from Linux, ignore for now"
>>> diff --git a/xen/arch/arm/arm64/lib/Makefile
>>> b/xen/arch/arm/arm64/lib/Makefile
>>> index 1b9c7a95e6..66cfac435a 100644
>>> --- a/xen/arch/arm/arm64/lib/Makefile
>>> +++ b/xen/arch/arm/arm64/lib/Makefile
>>> @@ -1,4 +1,4 @@
>>>    obj-y += memcpy.o memcmp.o memmove.o memset.o memchr.o
>>>    obj-y += clear_page.o
>>> -obj-y += bitops.o find_next_bit.o
>>> +obj-y += bitops.o
>>>    obj-y += strchr.o strcmp.o strlen.o strncmp.o strnlen.o strrchr.o
>>> diff --git a/xen/arch/arm/include/asm/arm64/bitops.h
>>> b/xen/arch/arm/include/asm/arm64/bitops.h
>>> index d85a49bca4..f9dd066237 100644
>>> --- a/xen/arch/arm/include/asm/arm64/bitops.h
>>> +++ b/xen/arch/arm/include/asm/arm64/bitops.h
>>> @@ -36,57 +36,9 @@ static inline int flsl(unsigned long x)
>>>    
>>>    /* Based on linux/include/asm-generic/bitops/find.h */
>>>    
>>> -#ifndef find_next_bit
>>> -/**
>>> - * find_next_bit - find the next set bit in a memory region
>>> - * @addr: The address to base the search on
>>> - * @offset: The bitnumber to start searching at
>>> - * @size: The bitmap size in bits
>>> - */
>>> -extern unsigned long find_next_bit(const unsigned long *addr,
>>> unsigned long
>>> -		size, unsigned long offset);
>>> -#endif
>>> -
>>> -#ifndef find_next_zero_bit
>>> -/**
>>> - * find_next_zero_bit - find the next cleared bit in a memory
>>> region
>>> - * @addr: The address to base the search on
>>> - * @offset: The bitnumber to start searching at
>>> - * @size: The bitmap size in bits
>>> - */
>>> -extern unsigned long find_next_zero_bit(const unsigned long *addr,
>>> unsigned
>>> -		long size, unsigned long offset);
>>> -#endif
>>> -
>>> -#ifdef CONFIG_GENERIC_FIND_FIRST_BIT
>>> -
>>> -/**
>>> - * find_first_bit - find the first set bit in a memory region
>>> - * @addr: The address to start the search at
>>> - * @size: The maximum size to search
>>> - *
>>> - * Returns the bit number of the first set bit.
>>> - */
>>> -extern unsigned long find_first_bit(const unsigned long *addr,
>>> -				    unsigned long size);
>>> -
>>> -/**
>>> - * find_first_zero_bit - find the first cleared bit in a memory
>>> region
>>> - * @addr: The address to start the search at
>>> - * @size: The maximum size to search
>>> - *
>>> - * Returns the bit number of the first cleared bit.
>>> - */
>>> -extern unsigned long find_first_zero_bit(const unsigned long
>>> *addr,
>>> -					 unsigned long size);
>>> -#else /* CONFIG_GENERIC_FIND_FIRST_BIT */
>>> -
>>>    #define find_first_bit(addr, size) find_next_bit((addr), (size),
>>> 0)
>>>    #define find_first_zero_bit(addr, size)
>>> find_next_zero_bit((addr), (size), 0)
>>>    
>>> -#endif /* CONFIG_GENERIC_FIND_FIRST_BIT */
>>
>> AFAICT, you are changing the behavior for Arm64 without explaining
>> why.
>> Before, it was possible to set CONFIG_GENERIC_FIND_FIRST_BIT so the
>> generic version of find_first_*_bit are used. This is not possible
>> anymore with your change.
>>
>> Looking at Linux, I see that arm64 is now selecting
>> GENERIC_FIND_FIRST_BIT (see [1]). So I would argue, we should not
>> define
>> find_first_bit(). That said, that's probably a separate patch.
>>
>> For now, you want to explain why GENERIC_FIND_FIRST_BIT is dropped.
> I chose to remove it because I couldn't find any usage or configuration
> setting for this in Xen (Arm).

Right. My point is the commit message can lead to think this is a simple 
code movement and there are no change of behavior.

It wasn't clear to me whether this was done on purpose or not. It looks 
like it was and therefore should really be explained in the commit message.

> 
> I can add "#ifdef GENERIC_FIND_FIRST_BIT" around find_first_zero_bit()
> and find_first_bit() in xen/bitops.h, and according to the link [1], it
> should be wrapped with ifdef. Perhaps it would be better to use "#if
> defined(GENERIC_FIND_FIRST_BIT) && defined(CONFIG_ARM_64)".
> 
> My only concern is that it might seem somewhat inconsistent with the
> other find_*_bit() functions added in this patch. Should we be care
> about that? I mean that do we need similar config or it would be enough
> to add a comment why it is necessary to have ifdef
> GENERIC_FIND_FIRST_BIT.

Note that I didn't ask to keep GENERIC_FIND_FIRST_BIT. I actually 
pointed out that it can be removed but it should be explained in the 
commit message.

Cheers,

-- 
Julien Grall

