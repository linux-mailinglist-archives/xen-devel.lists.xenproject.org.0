Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA98360C95C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Oct 2022 12:05:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429730.680922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGo8-0004o8-Pq; Tue, 25 Oct 2022 10:05:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429730.680922; Tue, 25 Oct 2022 10:05:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1onGo8-0004lM-ML; Tue, 25 Oct 2022 10:05:16 +0000
Received: by outflank-mailman (input) for mailman id 429730;
 Tue, 25 Oct 2022 10:05:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1onGo6-0004lG-C3
 for xen-devel@lists.xenproject.org; Tue, 25 Oct 2022 10:05:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onGo5-0000AT-RT; Tue, 25 Oct 2022 10:05:13 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230] helo=[10.95.108.38])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1onGo5-0007TE-KE; Tue, 25 Oct 2022 10:05:13 +0000
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
	bh=ZS/TS1dDuhJjxa8+lfSvfXqrSym1J0iXSgax/40WI5E=; b=ptnIcvQ/m8FUjypxDU9Jn5wWwT
	4VPz6kKxREWaeVvPw2OojquooIjwxpyWiIuIT0epU4E1LoD9AxvYbzYttLUAV55Nhi6qPUElcJK3L
	t3HhkYM3gvPsghbgFqLMGGp1m1D0z/7jmSs6cTIGkvxjc/XK/x5X4BZq8mxlSZboM5kA=;
Message-ID: <f20a67c5-eee0-24b7-f410-812b3302d30b@xen.org>
Date: Tue, 25 Oct 2022 11:05:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC v2 02/12] xen/arm32: head: Jump to the runtime mapping in
 enable_mmu()
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech, lucmiccio@gmail.com,
 carlo.nonato@minervasys.tech, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221022150422.17707-1-julien@xen.org>
 <20221022150422.17707-3-julien@xen.org>
 <851b93a6-6116-2a81-f737-b7fd61d793f9@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <851b93a6-6116-2a81-f737-b7fd61d793f9@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 25/10/2022 10:45, Michal Orzel wrote:
> Hi Julien,
> 
> On 22/10/2022 17:04, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, enable_mmu() will return to an address in the 1:1 mapping
>> and each path are responsible to switch to the runtime mapping.
> s/are/is/
> 
>>
>> In a follow-up patch, the behavior to switch to the runtime mapping
>> will become more complex. So to avoid more code/comment duplication,
>> move the switch in enable_mmu().
>>
>> Lastly, take the opportunity to replace load from literal pool with
>> mov_w.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   xen/arch/arm/arm32/head.S | 51 ++++++++++++++++++++++++---------------
>>   1 file changed, 31 insertions(+), 20 deletions(-)
>>
>> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
>> index a558c2a6876e..163bd6596dec 100644
>> --- a/xen/arch/arm/arm32/head.S
>> +++ b/xen/arch/arm/arm32/head.S
>> @@ -167,19 +167,12 @@ past_zImage:
>>           bl    check_cpu_mode
>>           bl    cpu_init
>>           bl    create_page_tables
>> -        bl    enable_mmu
>>
>> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>> -        ldr   r0, =primary_switched
>> -        mov   pc, r0
>> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
>> +        mov_w lr, primary_switched
> We seem to still widely use ldr instead of mov_w which is faster.

This is boot code and personally I don't think the speed will be 
noticeable here.

The reason I am switching to mov_w is because we don't need to use the 
literal pool. The literal pool add other issues when you think about the 
1:1 mapping.

> It looks like a prerequisite patch to convert all occurences or something to keep in a backlog

I have some plan for that but decided to keep that outside of this series.

> 
>> +        b     enable_mmu
>> +
>>   primary_switched:
>> -        /*
>> -         * The 1:1 map may clash with other parts of the Xen virtual memory
>> -         * layout. As it is not used anymore, remove it completely to
>> -         * avoid having to worry about replacing existing mapping
>> -         * afterwards.
>> -         */
>> -        bl    remove_identity_mapping
>>           bl    setup_fixmap
>>   #ifdef CONFIG_EARLY_PRINTK
>>           /* Use a virtual address to access the UART. */
>> @@ -223,12 +216,10 @@ GLOBAL(init_secondary)
>>           bl    check_cpu_mode
>>           bl    cpu_init
>>           bl    create_page_tables
>> -        bl    enable_mmu
>> -
>>
>> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
>> -        ldr   r0, =secondary_switched
>> -        mov   pc, r0
>> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
>> +        mov_w lr, secondary_switched
>> +        b     enable_mmu
>>   secondary_switched:
>>           /*
>>            * Non-boot CPUs need to move on to the proper pagetables, which were
>> @@ -523,9 +514,12 @@ virtphys_clash:
>>   ENDPROC(create_page_tables)
>>
>>   /*
>> - * Turn on the Data Cache and the MMU. The function will return on the 1:1
>> - * mapping. In other word, the caller is responsible to switch to the runtime
>> - * mapping.
>> + * Turn on the Data Cache and the MMU. The function will return
>> + * to the virtual address provided in LR (e.g. the runtime mapping).
>> + *
>> + * Inputs:
>> + *   r9 : paddr(start)
>> + *   lr : Virtual address to return to
>>    *
>>    * Clobbers r0 - r3
>>    */
>> @@ -551,7 +545,24 @@ enable_mmu:
>>           dsb                          /* Flush PTE writes and finish reads */
>>           mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
>>           isb                          /* Now, flush the icache */
>> -        mov   pc, lr
>> +
>> +        /*
>> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
>> +         * to the runtime mapping.
>> +         */
>> +        mov_w r0, 1f
>> +        mov   pc, r0
> Would it be possible to stop using:
> 	mov pc, reg
> in favor of using:
> 	bx reg
> 
> Some time ago I saw this commit:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/arm/include/asm/assembler.h?id=6ebbf2ce437b33022d30badd49dc94d33ecfa498
> which states that bx is faster.

See above about my statement regarding fast. I don't see the benefits 
for early boot code. So I am not keen to switch to 'bx reg' here.

Cheers,

-- 
Julien Grall

