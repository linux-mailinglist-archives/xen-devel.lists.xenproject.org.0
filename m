Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B6B4EF07A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 16:34:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297435.506699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naILl-0004wN-Cn; Fri, 01 Apr 2022 14:34:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297435.506699; Fri, 01 Apr 2022 14:34:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naILl-0004tQ-9X; Fri, 01 Apr 2022 14:34:05 +0000
Received: by outflank-mailman (input) for mailman id 297435;
 Fri, 01 Apr 2022 14:34:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1naILj-0004tC-SW
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 14:34:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naILj-00071X-Dm; Fri, 01 Apr 2022 14:34:03 +0000
Received: from [54.239.6.189] (helo=[192.168.18.123])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1naILj-0007hi-7r; Fri, 01 Apr 2022 14:34:03 +0000
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
	bh=QckjSnYtWxN8aKK8n0KmmGy+s/oafD5tWXX4ou/4je0=; b=tIrJv9FI4fYh6Q2ulBa0bM7JId
	bTHsT1qznJa+GsntZSLqmytQtIsnybZjTmxMTiwntgu2CpzoPyhxU8Rw7+J4GzWtqwbzOfkdmHc39
	avoo3GIQ2+P1GGdLox9M9gGzyB8myKwDcRMcO7uphA/5VGV4vBbvUKhRvPhcyjnDXlA8=;
Message-ID: <6b93c6c9-1afe-8ae9-ad7c-227ecff5cb53@xen.org>
Date: Fri, 1 Apr 2022 15:34:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v4 2/9] xen/arm: implement domU extended regions
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2203311735380.2910984@ubuntu-linux-20-04-desktop>
 <20220401003847.38393-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220401003847.38393-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 01/04/2022 01:38, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> Implement extended regions for dom0less domUs. The implementation is
> based on the libxl implementation.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/domain_build.c | 42 ++++++++++++++++++++++++++++++++++---
>   1 file changed, 39 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8be01678de..b6189b935d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1324,6 +1324,35 @@ out:
>       return res;
>   }
>   
> +#define ALIGN_UP_TO_2MB(x)   (((x) + MB(2) - 1) & (~(MB(2) - 1)))

I think this is the same as ROUNDUP(x, SZ_2M).

> +

> +static int __init find_domU_holes(const struct kernel_info *kinfo,
> +                                  struct meminfo *ext_regions)
> +{
> +    unsigned int i;
> +    uint64_t bankend[GUEST_RAM_BANKS];

Looking, you only seem to use one bankend at the time. So why do you 
need to store all the bankend?

This should also be s/uint64_t/paddr_t/. Same for two other instances below.

> +    const uint64_t bankbase[] = GUEST_RAM_BANK_BASES;
> +    const uint64_t banksize[] = GUEST_RAM_BANK_SIZES;
> +
> +    for ( i = 0; i < GUEST_RAM_BANKS; i++ )
> +    {
> +        ext_regions->bank[ext_regions->nr_banks].start =

The code would be easier to read if you define a local variable ext_bank 
that points to &(ext_regions->bank[ext_regions->nr_banks]).

> +            ALIGN_UP_TO_2MB(bankbase[i] + kinfo->mem.bank[i].size);
> +
> +        bankend[i] = ~0ULL >> (64 - p2m_ipa_bits);
> +        bankend[i] = min(bankend[i], bankbase[i] + banksize[i] - 1); > +        if (bankend[i] > ext_regions->bank[ext_regions->nr_banks].start)

Coding style:

if ( ... )

> +            ext_regions->bank[ext_regions->nr_banks].size =
> +                bankend[i] - ext_regions->bank[ext_regions->nr_banks].start + 1;

This is one of the line that could greatly benefits from the local 
variable I suggested above. It would look like:

ext_bank->size = bankend[i] - ext_bank->start + 1;

> +
> +        /* 64MB is the minimum size of an extended region */
> +        if ( ext_regions->bank[ext_regions->nr_banks].size < MB(64) )
> +            continue;
> +        ext_regions->nr_banks++;
> +    }

NIT: We tend to add a newline before the last return.

> +    return 0;

find_memory_holes() and find_unallocated_memory() will return an error 
if there are no banks allocated. I think we should do the same here at 
least for consistency.

In which case, the check should be moved in make_hypervisor_node().

> +}
> +
>   static int __init make_hypervisor_node(struct domain *d,
>                                          const struct kernel_info *kinfo,
>                                          int addrcells, int sizecells)
> @@ -1374,10 +1403,17 @@ static int __init make_hypervisor_node(struct domain *d,
>           if ( !ext_regions )
>               return -ENOMEM;
>   
> -        if ( !is_iommu_enabled(d) )
> -            res = find_unallocated_memory(kinfo, ext_regions);
> +        if ( is_domain_direct_mapped(d) )

I believe the code in the 'if' part would work properly for a dom0 that 
is not direct mapped (e.g. in the cache coloring case).

If it doesn't, I think we need...

> +        {
> +            if ( !is_iommu_enabled(d) )
> +                res = find_unallocated_memory(kinfo, ext_regions);
> +            else
> +                res = find_memory_holes(kinfo, ext_regions);
> +        }
>           else
> -            res = find_memory_holes(kinfo, ext_regions);
> +        {

... and ASSERT() here so we the person that will introduce non direct 
mapped dom0 can easily notice before the domain get corrupted.

> +            res = find_domU_holes(kinfo, ext_regions);
> +        }
>   
>           if ( res )
>               printk(XENLOG_WARNING "Failed to allocate extended regions\n");

This printk() and the others in the function should print the domain.

Cheers,

-- 
Julien Grall

