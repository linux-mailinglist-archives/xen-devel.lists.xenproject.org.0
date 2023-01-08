Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B7E6614DB
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 12:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473130.733603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEUIM-0003pL-EA; Sun, 08 Jan 2023 11:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473130.733603; Sun, 08 Jan 2023 11:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEUIM-0003mX-BL; Sun, 08 Jan 2023 11:56:58 +0000
Received: by outflank-mailman (input) for mailman id 473130;
 Sun, 08 Jan 2023 11:56:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEUIK-0003mQ-W3
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 11:56:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEUIK-0005HT-Jv; Sun, 08 Jan 2023 11:56:56 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEUIK-0002nq-ED; Sun, 08 Jan 2023 11:56:56 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=xeNRan2TYy/Nfh0C3omfZfsutDQU4xaPHcI77DDdhBU=; b=MEn4IcqV0h89DF8dLI+aSo8Wv6
	BxHRvl67ESoLzIvpgOaqjEoWMlx/liUvAShJ1/u5fbbGjNpCYy1opFodqaMimlXa8vp6PbDylTSB5
	3v2XBj9Ski19qoIdyszin30jVyx3LvHRPODgSC6QVPDrG+0I0o+lJAe45QzBiHlvwl8w=;
Message-ID: <670d3b0b-86fc-4673-5a3d-0417b9a002f8@xen.org>
Date: Sun, 8 Jan 2023 11:56:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 02/13] xen/arm: switch to use shm_membank as function
 parameter
In-Reply-To: <20221115025235.1378931-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/11/2022 02:52, Penny Zheng wrote:
> Instead of using multiple function parameters to deliver various shm-related
> info, like host physical address, SHMID, etc, and with the introduction
> of new struct "shm_membank", we could switch to use "shm_membank" as
> function parameter to replace them all, to make codes more clear and
> tidy.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 46 ++++++++++++++++++-------------------
>   1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c0fd13f6ed..d2b9e60b5c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -751,40 +751,31 @@ static void __init assign_static_memory_11(struct domain *d,
>   }
>   
>   #ifdef CONFIG_STATIC_SHM
> -static int __init acquire_nr_borrower_domain(struct domain *d,
> -                                             paddr_t pbase, paddr_t psize,
> -                                             unsigned long *nr_borrowers)
> +static struct shm_membank * __init acquire_shm_membank(const char *shm_id)

You are returning bootinfo. AFAICT, nobody you modify it after it was 
populated. So can this be const?

Also, I think the function wants to be renamed because this is too 
similar to the function acquire_shared_memory_bank().

I would rename it to find_shared_memory_bank().

>   {
>       unsigned int bank;
>   
>       /* Iterate static shared memory to find requested shm bank. */
>       for ( bank = 0 ; bank < bootinfo.shm_mem.nr_banks; bank++ )
> -    {
> -        paddr_t bank_start = bootinfo.shm_mem.bank[bank].membank->start;
> -        paddr_t bank_size = bootinfo.shm_mem.bank[bank].membank->size;
> -
> -        if ( (pbase == bank_start) && (psize == bank_size) )
> +        if ( strcmp(shm_id, bootinfo.shm_mem.bank[bank].shm_id) == 0 )
>               break;
> -    }
>   
>       if ( bank == bootinfo.shm_mem.nr_banks )
> -        return -ENOENT;
> -
> -    *nr_borrowers = bootinfo.shm_mem.bank[bank].nr_shm_borrowers;
> +        return NULL;
>   
> -    return 0;
> +    return &bootinfo.shm_mem.bank[bank];
>   }
>   
>   /*
>    * This function checks whether the static shared memory region is
>    * already allocated to dom_io.
>    */
> -static bool __init is_shm_allocated_to_domio(paddr_t pbase)
> +static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)

AFAICT, the function will not modify shm_membank. So please use const.

>   {
>       struct page_info *page;
>       struct domain *d;
>   
> -    page = maddr_to_page(pbase);
> +    page = maddr_to_page(shm_membank->membank->start);
>       d = page_get_owner_and_reference(page);
>       if ( d == NULL )
>           return false;
> @@ -835,14 +826,17 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>   }
>   
>   static int __init assign_shared_memory(struct domain *d,
> -                                       uint32_t addr_cells, uint32_t size_cells,
> -                                       paddr_t pbase, paddr_t psize,
> +                                       struct shm_membank *shm_membank,

Same here.

>                                          paddr_t gbase)
>   {
>       mfn_t smfn;
>       int ret = 0;
>       unsigned long nr_pages, nr_borrowers, i;
>       struct page_info *page;
> +    paddr_t pbase, psize;
> +
> +    pbase = shm_membank->membank->start;
> +    psize = shm_membank->membank->size;
>   
>       printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
>              d, pbase, pbase + psize);
> @@ -871,9 +865,7 @@ static int __init assign_shared_memory(struct domain *d,
>        * Get the right amount of references per page, which is the number of
>        * borrower domains.
>        */
> -    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
> -    if ( ret )
> -        return ret;
> +    nr_borrowers = shm_membank->nr_shm_borrowers;
>   
>       /*
>        * Instead of letting borrower domain get a page ref, we add as many
> @@ -941,6 +933,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           const char *role_str;
>           const char *shm_id;
>           bool owner_dom_io = true;
> +        struct shm_membank *shm_membank;

same here.

>   
>           if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
>               continue;
> @@ -991,12 +984,20 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           }
>           BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
>   
> +        shm_membank = acquire_shm_membank(shm_id);
> +        if ( !shm_membank )
> +        {
> +            printk("%pd: failed to acquire %s shared memory bank\n",
> +                   d, shm_id);
> +            return -ENOENT;
> +        }
> +
>           /*
>            * DOMID_IO is a fake domain and is not described in the Device-Tree.
>            * Therefore when the owner of the shared region is DOMID_IO, we will
>            * only find the borrowers.
>            */
> -        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
> +        if ( (owner_dom_io && !is_shm_allocated_to_domio(shm_membank)) ||
>                (!owner_dom_io && strcmp(role_str, "owner") == 0) )
>           {
>               /*
> @@ -1004,8 +1005,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                * specified, so they should be assigned to dom_io.
>                */
>               ret = assign_shared_memory(owner_dom_io ? dom_io : d,
> -                                       addr_cells, size_cells,
> -                                       pbase, psize, gbase);
> +                                       shm_membank, gbase);
>               if ( ret )
>                   return ret;
>           }

Cheers,

-- 
Julien Grall

