Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04F95AE892
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 14:39:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399835.641176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXrd-00032n-AJ; Tue, 06 Sep 2022 12:39:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399835.641176; Tue, 06 Sep 2022 12:39:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVXrd-0002zk-75; Tue, 06 Sep 2022 12:39:37 +0000
Received: by outflank-mailman (input) for mailman id 399835;
 Tue, 06 Sep 2022 12:39:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVXrb-0002ze-TH
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 12:39:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVXrb-0002zg-LS; Tue, 06 Sep 2022 12:39:35 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVXrb-0002mD-F2; Tue, 06 Sep 2022 12:39:35 +0000
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
	bh=eAuUBNTrdBVz7mvSFnLRVmufW2c9OSXvJBk9rWNvNgU=; b=oPD8rRl4MSXr4fjmXlu6xfDomP
	n7gevLEEvhXuFOhklaN56eEfupK6QYSq/Ytd3akMWNzyFPiXy3/4/Eo6WspQostdVMLBsEIhT2WsW
	hO2Xoqz+74XaRRojgRBgVW3rR5FL32t2Sbyrd2N71EpG60cQ1eX/BBsc8XldGGgvJnZY=;
Message-ID: <60a55b4b-4bf5-7325-e603-6abdc56234e3@xen.org>
Date: Tue, 6 Sep 2022 13:39:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v2 3/4] xen/arm: Handle reserved heap pages in boot and
 heap allocator
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220905072635.16294-1-Henry.Wang@arm.com>
 <20220905072635.16294-4-Henry.Wang@arm.com>
 <57082fec-e9ce-eeda-d051-d75a4bc35909@xen.org>
 <AS8PR08MB79915EEF32D662929B1657A3927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <e4b2721b-8ddc-080f-e602-a3c02b2a13f8@xen.org>
 <AS8PR08MB7991B12952F889C8C44540D2927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991B12952F889C8C44540D2927E9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 06/09/2022 12:11, Henry Wang wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>>>>> +        {
>>>>> +            bank_start = bootinfo.reserved_mem.bank[i].start;
>>>>> +            bank_size = bootinfo.reserved_mem.bank[i].size;
>>>>> +            bank_end = bank_start + bank_size;
>>>>> +
>>>>> +            if ( bank_size < size )
>>>>> +                continue;
>>>>> +
>>>>> +            aligned_end = bank_end & ~(align - 1);
>>>>> +            aligned_start = (aligned_end - size) & ~(align - 1);
>>>>
>>>> I find the logic a bit confusing. AFAIU, aligned_start could be below
>>>> the start of the RAM which is not what I would usually expect.
>>>
>>> Yeah I understand your concern. Here I want to make sure even if
>>> the given size is not aligned (although less likely happen in real life
>>> given the size calculation logic in setup_mm) the code still work.
>>
> 
> Sorry I probably explained in the wrong way in previous mail, but since no
> change requested here this is purely for discussion. In the code we
> are sure aligned_end calculation will make sure the end address will
> satisfy the alignment requirement within the range to a aligned (lower)
> address. The aligned_start = (aligned_end - size) & ~(align - 1) will make
> sure the start address is following the same alignment requirement, but
> the only issue would be in this case the start address will below the region
> start, hence the if ( aligned_start > bank_start ) check.
> 
>> I don't think I agree on the less likely here. The regions are provided
>> by in the Device-Tree. And there are more chance they are incorrect
>> because the value will be specific to a software/device stack.
>>
>> Related to this discussion, I can't find any alignment requirement in
>> the device-tree binding. I think we at least want to require 64KB
>> aligned (so the same Device-Tree works if we were going to support 64KB
>> page granularity).
> 
> I agree we need to require 64KB alignment, and currently we are following
> this because we are doing 32MB alignment.
Hmmm... I think we are talking about two different things here. What I 
am referring to is the alignment of the start/end of the region provided 
by the admin.

[...]

>> I think the code should be moved in populate_boot_allocator():
>>
>> if ( bootinfo.reserved_heap )
>> {
>>       for ( ...; i < bootinfo.reserved_mem.nr_banks; i++ )
>>          [....]
>>          init_boot_pages_pages()
>> }
>>
>> Note that to handle arm32, you will also need to exclude the xenheap area.
> 
> When I implement the code, I found that the arm32 Xenheap excluding logic
> somehow can be reused.
> 
> So I think I tried to reuse as much as current code. Would below
> populate_boot_allocator() seem ok to you?

I would prefer if they are separate because the logic can be simplified 
when using the static heap (the xenheap cannot across a region).

Something like:

for ( i = 0; i < banks->nr_banks; i++ )
{

#ifdef CONFIG_ARM_32
     if ( (bank_start >= mfn_to_maddr(direct_mfn_start) &&
            bank_end < mfn_to_maddr(direct_mfn_start) )
     {
       /* Add the memory *before* and *after* the region */
     }
     else
#endif
        init_boot_pages(s, e);
}

> 
> static void __init populate_boot_allocator(void)
> {
>      unsigned int i;
>      const struct meminfo *banks = bootinfo.static_heap ?
>                                    &bootinfo.reserved_mem : &bootinfo.mem;
> 
>      for ( i = 0; i < banks->nr_banks; i++ )
>      {
>          const struct membank *bank = &banks->bank[i];
>          paddr_t bank_end = bank->start + bank->size;
>          paddr_t s, e;
> 
>          if ( bootinfo.static_heap && bank->type != MEMBANK_STATIC_HEAP )
>              continue;
> 
>          s = bank->start;
>          while ( s < bank_end )
>          {
>              paddr_t n = bank_end;
> 
>              if ( bootinfo.static_heap )
>                  e = bank_end;
>              else
>              {
>                  e = next_module(s, &n);
> 
>                  if ( e == ~(paddr_t)0 )
>                      e = n = bank_end;
> 
>                  /*
>                   * Module in a RAM bank other than the one which we are
>                   * not dealing with here.
>                   */
>                  if ( e > bank_end )
>                      e = bank_end;
>              }
> 
> #ifdef CONFIG_ARM_32
>              /* Avoid the xenheap */
>              if ( s < mfn_to_maddr(directmap_mfn_end) &&
>                   mfn_to_maddr(directmap_mfn_start) < e )
>              {
>                  e = mfn_to_maddr(directmap_mfn_start);
>                  n = mfn_to_maddr(directmap_mfn_end);
>              }
> #endif
> 
>              if ( bootinfo.static_heap )
>                  init_boot_pages(s, e);
>              else
>                  fw_unreserved_regions(s, e, init_boot_pages, 0);
> 
>              s = n;
>          }
>      }
> }
> 
> Kind regards,
> Henry
> 
>>
>> Cheers,
>>
>> --
>> Julien Grall

-- 
Julien Grall

