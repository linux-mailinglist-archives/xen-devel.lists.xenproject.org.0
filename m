Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D41D6687C9
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 00:20:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476441.738619 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG6ri-0008JM-Hv; Thu, 12 Jan 2023 23:20:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476441.738619; Thu, 12 Jan 2023 23:20:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pG6ri-0008HC-Eq; Thu, 12 Jan 2023 23:20:10 +0000
Received: by outflank-mailman (input) for mailman id 476441;
 Thu, 12 Jan 2023 23:20:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pG6rg-0008H2-TD
 for xen-devel@lists.xenproject.org; Thu, 12 Jan 2023 23:20:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pG6rf-00073n-C4; Thu, 12 Jan 2023 23:20:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pG6rf-000511-60; Thu, 12 Jan 2023 23:20:07 +0000
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
	bh=09NX0mt3JsdJrsXz9Xp/CqgrNkZN7cALRFZmr8cvHbU=; b=dfHLfXzVTw9Xc9AZB/pLAPih1T
	jgo9eg5gifsYxaE9aasLrYqObg/81s9If+MTJPC+C5+Y1b7fz954jwuP74wDNVHz4FjmyXBsR1BXf
	Qmkt7Vwx9kBaA7rsM11pWHsLbxoWWwwn6FKbmtDREXmvRF/2ZCty47QvKzCQ0hgt0ops=;
Message-ID: <a99a8246-bc80-07b9-dacc-f117ace37027@xen.org>
Date: Thu, 12 Jan 2023 23:20:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 06/22] x86: map/unmap pages in restore_all_guests
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-7-julien@xen.org>
 <478e04bc-6ff7-de01-dfb9-55d579228152@suse.com>
 <f84d30cb-e743-60f8-a496-603323b79f37@xen.org>
 <01584e11-36ca-7836-85ad-bba9351af46e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <01584e11-36ca-7836-85ad-bba9351af46e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 04/01/2023 10:27, Jan Beulich wrote:
> On 23.12.2022 13:22, Julien Grall wrote:
>> Hi,
>>
>> On 22/12/2022 11:12, Jan Beulich wrote:
>>> On 16.12.2022 12:48, Julien Grall wrote:
>>>> --- a/xen/arch/x86/x86_64/entry.S
>>>> +++ b/xen/arch/x86/x86_64/entry.S
>>>> @@ -165,7 +165,24 @@ restore_all_guest:
>>>>            and   %rsi, %rdi
>>>>            and   %r9, %rsi
>>>>            add   %rcx, %rdi
>>>> -        add   %rcx, %rsi
>>>> +
>>>> +         /*
>>>> +          * Without a direct map, we have to map first before copying. We only
>>>> +          * need to map the guest root table but not the per-CPU root_pgt,
>>>> +          * because the latter is still a xenheap page.
>>>> +          */
>>>> +        pushq %r9
>>>> +        pushq %rdx
>>>> +        pushq %rax
>>>> +        pushq %rdi
>>>> +        mov   %rsi, %rdi
>>>> +        shr   $PAGE_SHIFT, %rdi
>>>> +        callq map_domain_page
>>>> +        mov   %rax, %rsi
>>>> +        popq  %rdi
>>>> +        /* Stash the pointer for unmapping later. */
>>>> +        pushq %rax
>>>> +
>>>>            mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
>>>>            mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
>>>>            mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
>>>> @@ -177,6 +194,14 @@ restore_all_guest:
>>>>            sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
>>>>                    ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
>>>>            rep movsq
>>>> +
>>>> +        /* Unmap the page. */
>>>> +        popq  %rdi
>>>> +        callq unmap_domain_page
>>>> +        popq  %rax
>>>> +        popq  %rdx
>>>> +        popq  %r9
>>>
>>> While the PUSH/POP are part of what I dislike here, I think this wants
>>> doing differently: Establish a mapping when putting in place a new guest
>>> page table, and use the pointer here. This could be a new per-domain
>>> mapping, to limit its visibility.
>>
>> I have looked at a per-domain approach and this looks way more complex
>> than the few concise lines here (not mentioning the extra amount of
>> memory).
> 
> Yes, I do understand that would be a more intrusive change.

I could be persuaded to look at a more intrusive change if there are a 
good reason to do it. To me, at the moment, it mostly seem a matter of 
taste.

So what would we gain from a perdomain mapping?

> 
>> So I am not convinced this is worth the effort here.
>>
>> I don't have an other approach in mind. So are you disliking this
>> approach to the point this will be nacked?
> 
> I guess I wouldn't nack it, but I also wouldn't provide an ack.
> I'm curious
> what Andrew or Roger think here...

Unfortunately Roger is on parental leaves for the next couple of months. 
It would be good to make some progress before hand. Andrew, what do you 
think?

-- 
Julien Grall

