Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D895766DC
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 20:44:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368475.599775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQHz-00089H-JB; Fri, 15 Jul 2022 18:43:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368475.599775; Fri, 15 Jul 2022 18:43:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCQHz-00086X-Fw; Fri, 15 Jul 2022 18:43:47 +0000
Received: by outflank-mailman (input) for mailman id 368475;
 Fri, 15 Jul 2022 18:43:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCQHx-00086R-VG
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 18:43:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQHx-00033y-BR; Fri, 15 Jul 2022 18:43:45 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCQHx-0004Qr-3E; Fri, 15 Jul 2022 18:43:45 +0000
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
	bh=PcZm0DHbVphf3FyzZlxWrneC0vuRwz5cMQN3Cx+Xfw8=; b=uAYS80UC7qCsRr+pRweShefKbe
	Yb43E+RB+YalTuadVkrQwNvz7tnHB2VvNhX1dcQyMG7UiubAL1VfFQ5WK7f1gjIkMz4Z2bh5BKk3B
	0Kx30CIwKMq+t8irk2HcweT12aP3M8WwP20MNAfhQPQM5la7yLBHm55SgzQWuE1oo/f8=;
Message-ID: <b24c1d49-528d-9f17-b46b-41acb2b60c2a@xen.org>
Date: Fri, 15 Jul 2022 19:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 2/8] xen/arm: allocate static shared memory to the
 default owner dom_io
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-3-Penny.Zheng@arm.com>
 <3b7b32cb-df48-e458-e8a9-f17e86f39c9a@xen.org>
 <DU2PR08MB7325A7C7C50807D7FF6AE280F7BB9@DU2PR08MB7325.eurprd08.prod.outlook.com>
 <5a49381c-c69d-88dc-1bba-783241dbfe23@xen.org>
 <DU2PR08MB7325AF32FF119BCDB5890C58F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325AF32FF119BCDB5890C58F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 04/07/2022 08:20, Penny Zheng wrote:
>>>>> +
>>>>> +    return acquire_static_memory_bank(d, NULL, addr_cells, size_cells,
>>>>> +                                      pbase, psize);
>>>>> +
>>>>> +}
>>>>> +
>>>>> +/*
>>>>> + * Func allocate_shared_memory is supposed to be only called
>>>>
>>>> I am a bit concerned with the word "supposed". Are you implying that
>>>> it may be called by someone that is not the owner? If not, then it
>>>> should be "should".
>>>>
>>>> Also NIT: Spell out completely "func". I.e "The function".
>>>>
>>>>> + * from the owner.
>>>>
>>>> I read from as "current should be the owner". But I guess this is not
>>>> what you mean here. Instead it looks like you mean "d" is the owner.
>>>> So I would write "d should be the owner of the shared area".
>>>>
>>>> It would be good to have a check/ASSERT confirm this (assuming this
>>>> is easy to write).
>>>>
>>>
>>> The check is already in the calling path, I guess...
>>
>> Can you please confirm it?
>>
> 
> I mean that allocate_shared_memory is only called under the following condition, and
> it confirms it is the right owner.
> "
>          if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
>               (!owner_dom_io && strcmp(role_str, "owner") == 0) )
>          {
>              /* Allocate statically shared pages to the owner domain. */
>              ret = allocate_shared_memory(owner_dom_io ? dom_io : d,
>                                           addr_cells, size_cells,
>                                           pbase, psize, gbase);
> "

I agree that this looks to be the case today. But error can slip easily, 
so if we can add some ASSERT() in function then you could catch issues 
during development. Hence why I suggested to add an ASSERT() if possible.

> 
> TBH, apart from that, I don't know how to check if the input d is the right owner, or am I
> misunderstanding some your suggestion here?

Is page_get_owner() already properly set? If yes, you could ASSERT() the 
first page of the range belongs to 'd'.

This is more an hardening exercise, so it is not critical if it is 
difficult (or not possible) to have an ASSERT().

>   
>> [...]
>>
>>>>> +        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
>>>>> +        if ( !prop )
>>>>> +        {
>>>>> +            printk("Shared memory node does not provide
>>>>> + \"xen,shared-
>>>> mem\" property.\n");
>>>>> +            return -ENOENT;
>>>>> +        }
>>>>> +        cells = (const __be32 *)prop->value;
>>>>> +        /* xen,shared-mem = <pbase, psize, gbase>; */
>>>>> +        device_tree_get_reg(&cells, addr_cells, size_cells, &pbase, &psize);
>>>>> +        ASSERT(IS_ALIGNED(pbase, PAGE_SIZE) && IS_ALIGNED(psize,
>>>>> + PAGE_SIZE));
>>>>
>>>> See above about what ASSERT()s are for.
>>>>
>>>
>>> Do you think address was suitably checked here, is it enough?
>>
>> As I wrote before, ASSERT() should not be used to check user inputs.
>> They need to happen in both debug and production build.
>>
>>> If it is enough, I'll modify above ASSERT() to mfn_valid()
>>
>> It is not clear what ASSERT() you are referring to.
>>
> 
> For whether page is aligned, I will add the below check:
> "
>          if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(psize, PAGE_SIZE) ||
>               !IS_ALIGNED(gbase, PAGE_SIZE) )
>          {
>              printk("%pd: physical address %lu, size %lu or guest address %lu is not suitably aligned.\n",

AFAICT, the type for the 3 variables is paddr_t. So you want to use 
0x%"PRIpaddr" instead of %lu.

BTW, in general, for address it is preferable to use hexadecimal over 
decimal.

>                     d, pbase, psize, gbase);
>              return -EINVAL;
>          }
> "
> For whether the whole address range is valid, I will add the below check:
> "
>          for ( i = 0; i < PFN_DOWN(psize); i++ )
>              if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
>              {
>                  printk("%pd: invalid physical address %"PRI_paddr" or size %"PRI_paddr"\n",

s/PRI_paddr/PRIpaddr/

I am also not sure why you want to print the size here?

>                         d, pbase, psize);
>                  return -EINVAL;
>              }
> "

Cheers,

-- 
Julien Grall

