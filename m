Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5125849683
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 10:33:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675723.1051115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvLK-0005nV-6I; Mon, 05 Feb 2024 09:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675723.1051115; Mon, 05 Feb 2024 09:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvLK-0005lA-3b; Mon, 05 Feb 2024 09:32:46 +0000
Received: by outflank-mailman (input) for mailman id 675723;
 Mon, 05 Feb 2024 09:32:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rWvLI-0005l4-OJ
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 09:32:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rWvLF-0001PD-2z; Mon, 05 Feb 2024 09:32:41 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rWvLE-000206-Sz; Mon, 05 Feb 2024 09:32:41 +0000
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
	bh=j7Brr5GINz2LyCnMs4BEdlXOcAEEvLzTCRFN5963xCU=; b=FL4xA8vkCdRkVF6bvs2AdV2aVz
	aMMT/+fJ3Ici15MumkMzzR2lBEbyvec9v4pETfvC4eW2kJ2QIB7jSwyIxSSj9ZNbcjShZOumUcFuE
	GqGIhn1a1L3b+F0W7GWh2Z+zRX+X9SGVBYzRmj9rjbvSD0Njj7dQg3Nje5mkZqSx04ts=;
Message-ID: <a19f4217-4ed7-4065-b86c-805f7d57ba09@xen.org>
Date: Mon, 5 Feb 2024 09:32:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 4/9] x86/smp: move stack_base to cpu_data
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Krystian Hebel <krystian.hebel@3mdeb.com>, xen-devel@lists.xenproject.org
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <70e3b7c84a69a7ec52b3ed6314395165c281734c.1699982111.git.krystian.hebel@3mdeb.com>
 <d0fc568a-f54e-4480-a903-6407f4e3a5b6@xen.org>
 <52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <52e2db77-88c4-47c5-85d7-34b0bb133b69@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 05/02/2024 08:41, Jan Beulich wrote:
> On 02.02.2024 19:24, Julien Grall wrote:
>>>    static bool smp_store_cpu_info(unsigned int id)
>>> @@ -579,8 +581,6 @@ static int do_boot_cpu(int apicid, int cpu)
>>>            printk("Booting processor %d/%d eip %lx\n",
>>>                   cpu, apicid, start_eip);
>>>    
>>> -    stack_start = stack_base[cpu] + STACK_SIZE - sizeof(struct cpu_info);
>>> -
>>
>> You remove this line because I can't quite figure out where stack_start
>> is now set. This is used...
> 
> This line sets a global variable, which ...
> 
>>> @@ -856,7 +856,7 @@ int setup_cpu_root_pgt(unsigned int cpu)
>>>    
>>>        /* Install direct map page table entries for stack, IDT, and TSS. */
>>>        for ( off = rc = 0; !rc && off < STACK_SIZE; off += PAGE_SIZE )
>>> -        rc = clone_mapping(__va(__pa(stack_base[cpu])) + off, rpt);
>>> +        rc = clone_mapping(__va(__pa(cpu_data[cpu].stack_base)) + off, rpt);
>>>    
>>>        if ( !rc )
>>>            rc = clone_mapping(idt_tables[cpu], rpt);
>>> @@ -1007,10 +1007,10 @@ static void cpu_smpboot_free(unsigned int cpu, bool remove)
>>>            FREE_XENHEAP_PAGE(per_cpu(gdt, cpu));
>>>            FREE_XENHEAP_PAGE(idt_tables[cpu]);
>>>    
>>> -        if ( stack_base[cpu] )
>>> +        if ( cpu_data[cpu].stack_base )
>>>            {
>>> -            memguard_unguard_stack(stack_base[cpu]);
>>> -            FREE_XENHEAP_PAGES(stack_base[cpu], STACK_ORDER);
>>> +            memguard_unguard_stack(cpu_data[cpu].stack_base);
>>> +            FREE_XENHEAP_PAGES(cpu_data[cpu].stack_base, STACK_ORDER);
>>>            }
>>>        }
>>>    }
>>> @@ -1044,11 +1044,11 @@ static int cpu_smpboot_alloc(unsigned int cpu)
>>>        if ( node != NUMA_NO_NODE )
>>>            memflags = MEMF_node(node);
>>>    
>>> -    if ( stack_base[cpu] == NULL &&
>>> -         (stack_base[cpu] = cpu_alloc_stack(cpu)) == NULL )
>>> +    if ( cpu_data[cpu].stack_base == NULL &&
>>> +         (cpu_data[cpu].stack_base = cpu_alloc_stack(cpu)) == NULL )
>>>                goto out;
>>>    
>>> -    info = get_cpu_info_from_stack((unsigned long)stack_base[cpu]);
>>> +    info = get_cpu_info_from_stack((unsigned long)cpu_data[cpu].stack_base);
>>
>> ... here.
> 
> ... pretty clearly is not used here (anymore). Instead I'd raise the
> question of what the remaining purpose of that variable then is.
> Looking through updates this patch alone makes to use sites of
> stack_start, it's unclear whether the use from assembly code has gone
> away already - brief checking suggests it hasn't.

Whoops you are right. I am not sure how I thought this line was (still) 
using stack_start.

Cheers,

-- 
Julien Grall

