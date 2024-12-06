Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDE49E78C6
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 20:20:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.850421.1264835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJdrt-0006Ec-6X; Fri, 06 Dec 2024 19:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 850421.1264835; Fri, 06 Dec 2024 19:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJdrt-0006Cl-3o; Fri, 06 Dec 2024 19:20:01 +0000
Received: by outflank-mailman (input) for mailman id 850421;
 Fri, 06 Dec 2024 19:19:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tJdrr-0006Cf-Ce
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 19:19:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJdrq-007A2n-2K;
 Fri, 06 Dec 2024 19:19:59 +0000
Received: from [2a02:8012:3a1:0:9908:37eb:1c5c:6583]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tJdrq-00328v-2Z;
 Fri, 06 Dec 2024 19:19:58 +0000
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
	bh=/N0gZ856hyqHnzXfqBWV8x3PA5VqxBkhEMB2LIKtkKs=; b=c3u9XjU1t0UcVKONZtLEELtjtq
	phFVBl9sSBIPrCqs1TKbUd9d11Nm3k0NKMcyeBSZfREsQ0itqE2pOrsx+KZkPyZlwTEkbrPLVadxs
	Gjga+Ci9LE1vVeFrdzxZImDlVAB/Hxx3xAPm43pkv6RHEHjC/dnf60lq6VMgfWqfCCqM=;
Message-ID: <00c7c6ce-f50d-43ac-b411-3e051b9bb582@xen.org>
Date: Fri, 6 Dec 2024 19:19:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] xen/arm: Check for Static Heap feature when
 freeing resources
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Chen <wei.chen@arm.com>
References: <20241203094811.427076-1-luca.fancellu@arm.com>
 <20241203094811.427076-5-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241203094811.427076-5-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 03/12/2024 09:48, Luca Fancellu wrote:
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> index 9664e85ee6c0..8c87649bc88e 100644
> --- a/xen/arch/arm/mmu/setup.c
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -341,8 +341,12 @@ void free_init_memory(void)
>       if ( rc )
>           panic("Unable to remove the init section (rc = %d)\n", rc);
>   
> -    init_domheap_pages(pa, pa + len);
> -    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
> +    if ( !using_static_heap )
> +    {
> +        init_domheap_pages(pa, pa + len);
> +        printk("Freed %ldkB init memory.\n",
> +               (long)(__init_end-__init_begin) >> 10);
> +    }
>   }
>   
>   /**
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2e27af4560a5..22ab342dc8f4 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -206,24 +206,25 @@ void __init discard_initial_modules(void)
>       struct bootmodules *mi = &bootinfo.modules;
>       int i;

Looking at the change below, it seems that discard_initial_modules()
is a NOP for static_heap. Do you forsee any reason where it would be 
different?

If not, then I would prefer if the code would be:

if (static_heap)
   return;

This would reduce the indention in the most common case and also
make easier to review the diff.

The rest of this patch LGTM

>   
> -    for ( i = 0; i < mi->nr_mods; i++ )
> +    if ( !using_static_heap )
>       {
> -        paddr_t s = mi->module[i].start;
> -        paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
> -
> -        if ( mi->module[i].kind == BOOTMOD_XEN )
> -            continue;
> +        for ( i = 0; i < mi->nr_mods; i++ )
> +        {
> +            paddr_t s = mi->module[i].start;
> +            paddr_t e = s + PAGE_ALIGN(mi->module[i].size);
>   
> -        if ( !mfn_valid(maddr_to_mfn(s)) ||
> -             !mfn_valid(maddr_to_mfn(e)) )
> -            continue;
> +            if ( mi->module[i].kind == BOOTMOD_XEN )
> +                continue;
>   
> -        fw_unreserved_regions(s, e, init_domheap_pages, 0);
> -    }
> +            if ( !mfn_valid(maddr_to_mfn(s)) ||
> +                 !mfn_valid(maddr_to_mfn(e)) )
> +                continue;
>   
> -    mi->nr_mods = 0;
> +            fw_unreserved_regions(s, e, init_domheap_pages, 0);
> +        }
>   
> -    remove_early_mappings();
> +        mi->nr_mods = 0;
> +    }
>   }
>   

Cheers,

-- 
Julien Grall


