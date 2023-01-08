Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B920A6614D7
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 12:45:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473123.733593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEU6H-0002I2-9y; Sun, 08 Jan 2023 11:44:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473123.733593; Sun, 08 Jan 2023 11:44:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEU6H-0002Eb-7B; Sun, 08 Jan 2023 11:44:29 +0000
Received: by outflank-mailman (input) for mailman id 473123;
 Sun, 08 Jan 2023 11:44:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEU6F-0002EV-S2
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 11:44:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEU6F-0004sj-Il; Sun, 08 Jan 2023 11:44:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEU6F-0002Uv-E1; Sun, 08 Jan 2023 11:44:27 +0000
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
	bh=6nVFpbwrs3F1UgLekW7AzPCT/IBWSWbJmXStwI/E5gg=; b=y1oHWd5NlqzrPTG8Lbg4tF4aRh
	nLFsuZEaoxiYhgxDoycVIqVIhV/xCCh+tkI5P28QbBAtFvFJ5XX6Z63brsjP5BYkjp/vhzvc8MvDe
	mU3cI+Y/r9S07lhpF7KEZ0oa/35CqQdvmDKF2/XHbINQp0JUxt0qWVTkDk+i7i9pKDp8=;
Message-ID: <dd5b93c3-51d1-40ad-88b4-5bbd54633651@xen.org>
Date: Sun, 8 Jan 2023 11:44:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-2-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 01/13] xen/arm: re-arrange the static shared memory
 region
In-Reply-To: <20221115025235.1378931-2-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/11/2022 02:52, Penny Zheng wrote:
> This commit re-arranges the static shared memory regions into a separate array
> shm_meminfo. And static shared memory region now would have its own structure
> 'shm_membank' to hold all shm-related members, like shm_id, etc, and a pointer
> to the normal memory bank 'membank'. This will avoid continuing to grow
> 'membank'.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/bootfdt.c            | 40 +++++++++++++++++++------------
>   xen/arch/arm/domain_build.c       | 35 ++++++++++++++++-----------
>   xen/arch/arm/include/asm/kernel.h |  2 +-
>   xen/arch/arm/include/asm/setup.h  | 16 +++++++++----
>   4 files changed, 59 insertions(+), 34 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 6014c0f852..ccf281cd37 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -384,6 +384,7 @@ static int __init process_shm_node(const void *fdt, int node,
>       const __be32 *cell;
>       paddr_t paddr, gaddr, size;
>       struct meminfo *mem = &bootinfo.reserved_mem;

After this patch, 'mem' is barely going to be used. So I would recommend 
to remove it or restrict the scope.

This will make easier to confirm that most of the use of 'mem' have been 
replaced with 'shm_mem' and reduce the risk of confusion between the two 
(the name are quite similar).

[...]

> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index bd30d3798c..c0fd13f6ed 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -757,20 +757,20 @@ static int __init acquire_nr_borrower_domain(struct domain *d,
>   {
>       unsigned int bank;
>   
> -    /* Iterate reserved memory to find requested shm bank. */
> -    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
> +    /* Iterate static shared memory to find requested shm bank. */
> +    for ( bank = 0 ; bank < bootinfo.shm_mem.nr_banks; bank++ )
>       {
> -        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
> -        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
> +        paddr_t bank_start = bootinfo.shm_mem.bank[bank].membank->start;
> +        paddr_t bank_size = bootinfo.shm_mem.bank[bank].membank->size;

I was expecting a "if (type == MEMBANK_STATIC_DOMAIN) ..."  to be 
removed. But it looks like there was none. I guess that was a mistake in 
the existing code?

>   
>           if ( (pbase == bank_start) && (psize == bank_size) )
>               break;
>       }
>   
> -    if ( bank == bootinfo.reserved_mem.nr_banks )
> +    if ( bank == bootinfo.shm_mem.nr_banks )
>           return -ENOENT;
>   
> -    *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
> +    *nr_borrowers = bootinfo.shm_mem.bank[bank].nr_shm_borrowers;
>   
>       return 0;
>   }
> @@ -907,11 +907,18 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
>                                               paddr_t start, paddr_t size,
>                                               const char *shm_id)
>   {
> +    struct membank *membank;
> +
>       if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
>           return -ENOMEM;
>   
> -    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
> -    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
> +    membank = xmalloc_bytes(sizeof(struct membank));

You allocate memory but never free it. However, I think it would be 
better to avoid the dynamic allocation. So I would consider to not use 
the structure shm_membank and instead create a specific one for the 
domain construction.

> +    if ( membank == NULL )
> +        return -ENOMEM;
> +
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank = membank;
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank->start = start;
> +    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].membank->size = size;

The last two could be replaced with:

membank->start = start;
membank->size = size;

This would make the code more readable. Also, while you are modifying 
the code, I would consider to introduce a local variable that points to
kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].

[...]

>   struct meminfo {
> @@ -61,6 +57,17 @@ struct meminfo {
>       struct membank bank[NR_MEM_BANKS];
>   };
>   
> +struct shm_membank {
> +    char shm_id[MAX_SHM_ID_LENGTH];
> +    unsigned int nr_shm_borrowers;
> +    struct membank *membank;

After the change I suggest above, I would expect that the field of 
membank will not be updated. So I would add const here.

Cheers,

-- 
Julien Grall

