Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D48790EA23
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 13:56:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743713.1150672 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtuu-0006jk-6G; Wed, 19 Jun 2024 11:55:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743713.1150672; Wed, 19 Jun 2024 11:55:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJtuu-0006hz-3R; Wed, 19 Jun 2024 11:55:56 +0000
Received: by outflank-mailman (input) for mailman id 743713;
 Wed, 19 Jun 2024 11:55:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sJtus-0006hp-CB
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 11:55:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJtus-0002BY-1E; Wed, 19 Jun 2024 11:55:54 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sJtur-0002mN-Rm; Wed, 19 Jun 2024 11:55:53 +0000
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
	bh=bbJoz8TGW9TgcOVF8vrqpPTN2DwFiD5nhzK1T3jLmzU=; b=1d83U0tUalBNNtHxMVlvNwUkOr
	40qt5llSYyv73qVngg1Bq1NxJl8jtxyL5PABm1ygjFAg1P/k8lk90kRYUYEAe9TI/ahv9ILKJwnpu
	SaLfgB6bp/NtIJvMqoQUF6RXD++gzCG5GnT2jYlGFzbXiVGaFbj62euze3GRQYzqU0T4=;
Message-ID: <82790448-dd2f-4299-ae3d-938080ee5e19@xen.org>
Date: Wed, 19 Jun 2024 12:55:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240619064652.18266-1-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240619064652.18266-1-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 19/06/2024 07:46, Michal Orzel wrote:
> Building Xen with CONFIG_STATIC_SHM=y results in a build failure:
> 
> arch/arm/static-shmem.c: In function 'process_shm':
> arch/arm/static-shmem.c:327:41: error: 'gbase' may be used uninitialized [-Werror=maybe-uninitialized]
>    327 |         if ( is_domain_direct_mapped(d) && (pbase != gbase) )
> arch/arm/static-shmem.c:305:17: note: 'gbase' was declared here
>    305 |         paddr_t gbase, pbase, psize;
> 
> This is because the commit cb1ddafdc573 adds a check referencing
> gbase/pbase variables which were not yet assigned a value. Fix it.
> 
> Fixes: cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem should be direct-mapped for direct-mapped domains")
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Rationale for 4.19: this patch fixes a build failure reported by CI:
> https://gitlab.com/xen-project/xen/-/jobs/7131807878
> ---
>   xen/arch/arm/static-shmem.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
> index c434b96e6204..cd48d2896b7e 100644
> --- a/xen/arch/arm/static-shmem.c
> +++ b/xen/arch/arm/static-shmem.c
> @@ -324,12 +324,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>               printk("%pd: static shared memory bank not found: '%s'", d, shm_id);
>               return -ENOENT;
>           }
> -        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
> -        {
> -            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
> -                   d, pbase, gbase);
> -            return -EINVAL;
> -        }
>   
>           pbase = boot_shm_bank->start;
>           psize = boot_shm_bank->size;
> @@ -353,6 +347,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>               /* guest phys address is after host phys address */
>               gbase = dt_read_paddr(cells + addr_cells, addr_cells);
>   
> +            if ( is_domain_direct_mapped(d) && (pbase != gbase) )
> +            {
> +                printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
> +                       d, pbase, gbase);
> +                return -EINVAL;
> +            }
> +

Before this patch, the check was globally. I guess the intention was it 
covers the two part of the "if". But now, you only have it in when 
"paddr" is specified in the DT.

 From a brief look at the code, I can't figure out why we don't need a 
similar check on the else path. Is this because it is guarantee that 
will be paddr == gaddr?

Cheers,

-- 
Julien Grall

