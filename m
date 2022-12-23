Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD44655044
	for <lists+xen-devel@lfdr.de>; Fri, 23 Dec 2022 13:23:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468932.728150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8h4a-0003Tl-OK; Fri, 23 Dec 2022 12:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468932.728150; Fri, 23 Dec 2022 12:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8h4a-0003RB-JV; Fri, 23 Dec 2022 12:22:48 +0000
Received: by outflank-mailman (input) for mailman id 468932;
 Fri, 23 Dec 2022 12:22:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p8h4Z-0003R5-31
 for xen-devel@lists.xenproject.org; Fri, 23 Dec 2022 12:22:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8h4W-00048y-0s; Fri, 23 Dec 2022 12:22:44 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.3.230]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p8h4V-0002nV-Pi; Fri, 23 Dec 2022 12:22:43 +0000
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
	bh=2vy4MA9pgVOUDMvlpG1zptZaUm68AlCvHnLI/b1NpFk=; b=V2qdrGydADw/D1aVwi7IjPUZgP
	eZcQpqtTNW6V+EK9J3xtH3irKmQJVpb33IK7w/zfHB4T2l8FJoW10MlZSbwClSkAKy5OhAWpa01ii
	/ZJw+whmQ7TYA8P3+vxLQ9Z8fluiafLDKp01oEJGtbyQlievTp+hyIifQRhuMI2hpbts=;
Message-ID: <f84d30cb-e743-60f8-a496-603323b79f37@xen.org>
Date: Fri, 23 Dec 2022 12:22:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 06/22] x86: map/unmap pages in restore_all_guests
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Hongyan Xia <hongyxia@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-7-julien@xen.org>
 <478e04bc-6ff7-de01-dfb9-55d579228152@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <478e04bc-6ff7-de01-dfb9-55d579228152@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/12/2022 11:12, Jan Beulich wrote:
> On 16.12.2022 12:48, Julien Grall wrote:
>> --- a/xen/arch/x86/x86_64/entry.S
>> +++ b/xen/arch/x86/x86_64/entry.S
>> @@ -165,7 +165,24 @@ restore_all_guest:
>>           and   %rsi, %rdi
>>           and   %r9, %rsi
>>           add   %rcx, %rdi
>> -        add   %rcx, %rsi
>> +
>> +         /*
>> +          * Without a direct map, we have to map first before copying. We only
>> +          * need to map the guest root table but not the per-CPU root_pgt,
>> +          * because the latter is still a xenheap page.
>> +          */
>> +        pushq %r9
>> +        pushq %rdx
>> +        pushq %rax
>> +        pushq %rdi
>> +        mov   %rsi, %rdi
>> +        shr   $PAGE_SHIFT, %rdi
>> +        callq map_domain_page
>> +        mov   %rax, %rsi
>> +        popq  %rdi
>> +        /* Stash the pointer for unmapping later. */
>> +        pushq %rax
>> +
>>           mov   $ROOT_PAGETABLE_FIRST_XEN_SLOT, %ecx
>>           mov   root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rsi), %r8
>>           mov   %r8, root_table_offset(SH_LINEAR_PT_VIRT_START)*8(%rdi)
>> @@ -177,6 +194,14 @@ restore_all_guest:
>>           sub   $(ROOT_PAGETABLE_FIRST_XEN_SLOT - \
>>                   ROOT_PAGETABLE_LAST_XEN_SLOT - 1) * 8, %rdi
>>           rep movsq
>> +
>> +        /* Unmap the page. */
>> +        popq  %rdi
>> +        callq unmap_domain_page
>> +        popq  %rax
>> +        popq  %rdx
>> +        popq  %r9
> 
> While the PUSH/POP are part of what I dislike here, I think this wants
> doing differently: Establish a mapping when putting in place a new guest
> page table, and use the pointer here. This could be a new per-domain
> mapping, to limit its visibility.

I have looked at a per-domain approach and this looks way more complex 
than the few concise lines here (not mentioning the extra amount of 
memory).

So I am not convinced this is worth the effort here.

I don't have an other approach in mind. So are you disliking this 
approach to the point this will be nacked?

Cheers,

-- 
Julien Grall

