Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 720BA3F1A68
	for <lists+xen-devel@lfdr.de>; Thu, 19 Aug 2021 15:32:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168808.308241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGi9S-0006Ni-F7; Thu, 19 Aug 2021 13:32:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168808.308241; Thu, 19 Aug 2021 13:32:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGi9S-0006LP-B8; Thu, 19 Aug 2021 13:32:10 +0000
Received: by outflank-mailman (input) for mailman id 168808;
 Thu, 19 Aug 2021 13:32:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mGi9Q-0006KX-R8
 for xen-devel@lists.xenproject.org; Thu, 19 Aug 2021 13:32:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGi9P-00007L-Tz; Thu, 19 Aug 2021 13:32:07 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mGi9P-0000ng-NU; Thu, 19 Aug 2021 13:32:07 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=766B7eloh8o8PjRTj5ns73TBHeTqdbBUvpErsYw4wic=; b=65MDVaxg0YBVBIwgNR8dEPvQs7
	vL4aG+BLLcKHl++PQTZYv/X/ltuxxHh6w57PmFI/Vm5j/+TEaCkoQ9Gzkz6gWIi1suOtHm1JrZP54
	5ecJ/E2ZSY6BAIAmiEWD9ubWjtJm7X95W8eKHCDrTvY8aP9VPlfm1MAMef1shHKQp3FM=;
Subject: Re: [XEN RFC PATCH 05/40] xen/arm: Fix lowmem_bitsize when
 arch_get_dma_bitsize return 0
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-6-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ce78f938-3fda-f7a9-f92b-4a692774b497@xen.org>
Date: Thu, 19 Aug 2021 14:32:05 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-6-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

I guess this patch may be dropped after my comment on patch #4. I will 
comment just on the process.

On 11/08/2021 11:23, Wei Chen wrote:
> From: Hongda Deng <Hongda.Deng@arm.com>
> 
> In previous patch, we make arch_get_dma_bitsize return 0 when
> dma_bitsize and platform->dma_bitsize are not set. But this
> will affect lowmem_bitsize in allocate_memory_11 for domain0.
> Because this function depends lowmem_bitsize to allocate memory
> below 4GB.
> 
> In current code, when arch_get_dma_bitsize return 0, lowmem_bitsize
> will be set to 0. In this case, we will get "No bank has been
> allocated below 0-bit." message while allocating domain0 memory.
> And the lowmem will be set to false.
> 
> This behavior is inconsistent with what allocate_memory_11 done
> before, and doesn't meet this functions requirements. So we
> check arch_get_dma_bitsize's return value before set lowmem_bitsize.
> Avoid setting lowmem_bitsize to 0 by mistake.

In general, we want to avoid breaking bisection within a series. This 
means that this patch should be before patch #4.

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Hongda Deng <Hongda.Deng@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6c86d52781..cf341f349f 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -265,9 +265,18 @@ static void __init allocate_memory_11(struct domain *d,
>       int i;
>   
>       bool lowmem = true;
> -    unsigned int lowmem_bitsize = min(32U, arch_get_dma_bitsize());
> +    unsigned int lowmem_bitsize = arch_get_dma_bitsize();
>       unsigned int bits;
>   
> +    /*
> +       When dma_bitsize and platform->dma_bitsize are not set,
> +       arch_get_dma_bitsize will return 0. That means this system
> +       doesn't need to reserve memory for DMA. But in order to
> +       meet above requirements, we still need to try to allocate
> +       memory below 4GB for Dom0.
> +    */

The coding style for comments is:

/*
  * A
  * B
  */

> +    lowmem_bitsize = lowmem_bitsize ? min(32U, lowmem_bitsize) : 32U;
> +
>       /*
>        * TODO: Implement memory bank allocation when DOM0 is not direct
>        * mapped
> 

Cheers,

-- 
Julien Grall

