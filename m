Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89288645939
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 12:48:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.456223.713969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2suD-00055D-F6; Wed, 07 Dec 2022 11:48:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 456223.713969; Wed, 07 Dec 2022 11:48:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2suD-000538-CG; Wed, 07 Dec 2022 11:48:05 +0000
Received: by outflank-mailman (input) for mailman id 456223;
 Wed, 07 Dec 2022 11:48:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2suC-000532-GX
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 11:48:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2suC-0007Af-5j; Wed, 07 Dec 2022 11:48:04 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.0.175]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2suB-0004YQ-T5; Wed, 07 Dec 2022 11:48:04 +0000
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
	bh=aCay1+xEav4dreMy9XtJGw7/QDI0rSergn3efGwgx1w=; b=Gnv5Kp8OCxJSYMazN3PLW6XDzv
	MA3DfCjvIELPkC3DzNahoUUgmK1Z7doDz3SSW1Qi13nEuEEJQVBR9tKr98lw+pbp1PhxdCfFM/FPI
	OLqGkqZiJOlO+ZwGRQUou6890YyEjbpImN+Mr3v/ECJicHx+L+zSKweu+4e9Vb6RzBSA=;
Message-ID: <8e635354-fdf4-a37f-0dba-c4b29063e152@xen.org>
Date: Wed, 7 Dec 2022 11:48:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>,
 Henry Wang <Henry.Wang@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221205025753.2178965-1-Henry.Wang@arm.com>
 <20221205025753.2178965-2-Henry.Wang@arm.com>
 <alpine.DEB.2.22.394.2212061716170.4039@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2212061716170.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 07/12/2022 01:37, Stefano Stabellini wrote:
> On Mon, 5 Dec 2022, Henry Wang wrote:
>> As we are having more and more types of static region, and all of
>> these static regions are defined in bootinfo.reserved_mem, it is
>> necessary to add the overlap check of reserved memory regions in Xen,
>> because such check will help user to identify the misconfiguration in
>> the device tree at the early stage of boot time.
>>
>> Currently we have 3 types of static region, namely (1) static memory,
>> (2) static heap, (3) static shared memory. (1) and (2) are parsed by
>> the function `device_tree_get_meminfo()` and (3) is parsed using its
>> own logic. Therefore, to unify the checking logic for all of these
>> types of static region, this commit firstly introduces a helper
>> `check_reserved_regions_overlap()` to check if an input physical
>> address range is overlapping with the existing reserved memory regions
>> defined in bootinfo. After that, use this helper in
>> `device_tree_get_meminfo()` to do the overlap check of (1) and (2)
>> and replace the original overlap check of (3) with this new helper.
>>
>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> 
> I wonder if the check should only be done #ifdef DEBUG. The idea would
> be that a given static configuration should be validated and corrected
> before going into production. By the time you go in production, it is
> too late to do checks anyway. Especially the panic below.
> 
> Julien, Bertrand, what do you think about this?

The integrator may be a different person (or even a different company) 
than the one building Xen.

So I think, the new check shoudl not be protected by CONFIG_DEBUG.

That said, any output in bootfd will only printed when earlyprintk is 
enabled. I think we should consider to support dynamic early printk. 
Anyway, that's something that doesn't need to be handled in this series.

>  >
>> ---
>>   xen/arch/arm/bootfdt.c           | 13 ++++----
>>   xen/arch/arm/include/asm/setup.h |  2 ++
>>   xen/arch/arm/setup.c             | 52 ++++++++++++++++++++++++++++++++
>>   3 files changed, 60 insertions(+), 7 deletions(-)
>>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index 6014c0f852..b31379b9ac 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -91,6 +91,9 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
>>       for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
>>       {
>>           device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
>> +        if ( mem == &bootinfo.reserved_mem &&
>> +             check_reserved_regions_overlap(start, size) )
>> +            return -EINVAL;
>>           /* Some DT may describe empty bank, ignore them */
>>           if ( !size )
>>               continue;
>> @@ -485,7 +488,9 @@ static int __init process_shm_node(const void *fdt, int node,
>>                   return -EINVAL;
>>               }
>>   
>> -            if ( (end <= mem->bank[i].start) || (paddr >= bank_end) )
>> +            if ( check_reserved_regions_overlap(paddr, size) )
>> +                return -EINVAL;
>> +            else
>>               {
>>                   if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
>>                       continue;
>> @@ -496,12 +501,6 @@ static int __init process_shm_node(const void *fdt, int node,
>>                       return -EINVAL;
>>                   }
>>               }
>> -            else
>> -            {
>> -                printk("fdt: shared memory region overlap with an existing entry %#"PRIpaddr" - %#"PRIpaddr"\n",
>> -                        mem->bank[i].start, bank_end);
>> -                return -EINVAL;
>> -            }
>>           }
>>       }
>>   
>> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
>> index fdbf68aadc..6a9f88ecbb 100644
>> --- a/xen/arch/arm/include/asm/setup.h
>> +++ b/xen/arch/arm/include/asm/setup.h
>> @@ -143,6 +143,8 @@ void fw_unreserved_regions(paddr_t s, paddr_t e,
>>   size_t boot_fdt_info(const void *fdt, paddr_t paddr);
>>   const char *boot_fdt_cmdline(const void *fdt);
>>   
>> +int check_reserved_regions_overlap(paddr_t region_start, paddr_t region_size);
>> +
>>   struct bootmodule *add_boot_module(bootmodule_kind kind,
>>                                      paddr_t start, paddr_t size, bool domU);
>>   struct bootmodule *boot_module_find_by_kind(bootmodule_kind kind);
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index 4395640019..94d232605e 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -270,6 +270,42 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
>>       cb(s, e);
>>   }
>>   
>> +static int __init overlap_check(void *bootinfo_type,
>> +                                paddr_t region_start, paddr_t region_end)
>> +{
>> +    unsigned int i, num = 0;
>> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
>> +    char *type_str = "NONAME";
>> +
>> +    if ( bootinfo_type == &bootinfo.reserved_mem )
>> +    {
>> +        num = bootinfo.reserved_mem.nr_banks;
>> +        type_str = "reserved_mem";
>> +    }
>> +    else
>> +        panic("Invalid bootinfo type passed to overlap check\n");
>> +
>> +    for ( i = 0; i < num; i++ )
>> +    {
>> +        if ( bootinfo_type == &bootinfo.reserved_mem )
>> +        {
>> +            bank_start = bootinfo.reserved_mem.bank[i].start;
>> +            bank_end = bank_start + bootinfo.reserved_mem.bank[i].size;
>> +        }
>> +
>> +        if ( region_end <= bank_start || region_start >= bank_end )
>> +            continue;
>> +        else
>> +        {
>> +            printk("%s: Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n",
>> +                   type_str, region_start, region_end, i, bank_start, bank_end);
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
> 
> As much as I dislike MACROs in general I think this function should be
> written as a MACRO so that we can write it once for all use cases. The
> below in not compiled and not tested, just for explanation purposes.
> Look how much simpler the code becomes.

I agree the duplication is not nice. But it is not clear to me why a 
static inline function cannot be used.
> 
> #define overlap_check(bootinfo,     \
>                        num,          \
>                        region_start, \
>                        region_end)   \
> ({  \
>      unsigned int i, ret; \
>      paddr_t bank_start = INVALID_PADDR, bank_end = 0; \
>      \
>      for ( i = 0; i < num; i++ ) \
>      { \
>          bank_start = bootinfo->start; \
>          bank_end = bank_start + bootinfo->size; \
>      \
>          if ( region_end <= bank_start || region_start >= bank_end ) \
>              continue; \
>          else \
>          { \
>              printk("Region %#"PRIpaddr" - %#"PRIpaddr" overlapping with bank[%u] %#"PRIpaddr" - %#"PRIpaddr"\n", \
>                     region_start, region_end, i, bank_start, bank_end); \
>              ret = -EINVAL; \
>              break; \
>          } \
>      } \
>      \
>      retval = 0; \
>      retval;\
> })
> 
> 
> And the caller:
> 
> check_reserved_regions_overlap(&bootinfo.reserved_mem,
>                                 bootinfo.reserved_mem.nr_banks,
>                                 start, size);

Cheers,

-- 
Julien Grall

