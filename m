Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1F3742F47
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 23:08:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557113.870194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEysc-00078I-Gj; Thu, 29 Jun 2023 21:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557113.870194; Thu, 29 Jun 2023 21:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEysc-00076X-Dh; Thu, 29 Jun 2023 21:08:42 +0000
Received: by outflank-mailman (input) for mailman id 557113;
 Thu, 29 Jun 2023 21:08:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEysb-00076R-0A
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 21:08:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEysa-0007v2-Dh; Thu, 29 Jun 2023 21:08:40 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEysa-0002ts-8H; Thu, 29 Jun 2023 21:08:40 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=fiAKhT1fH/qFrwzsnUK+NDax6jxQNRCLLty7wtuVUy0=; b=muf3P47z0zXF9c86Zj/e7gyLFy
	ouqmpvdGyhiI4P5fQifjltRrndOzH7hajbwrVlPHbjvedHnl/o9VlZqA0P0w5OSuCkGHArRPTN1cO
	gOIUMpQx0uJgEwF4SjG0U8pB60an+MdW05PFwqJUjp81OZuqqHhURVJbkKtK1gqpyx3Q=;
Message-ID: <49bf12fb-8c71-40d9-a40b-ddcfa24356df@xen.org>
Date: Thu, 29 Jun 2023 22:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/arm: grant-table: Correct the prototype of the arch
 helpers
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, michal.orzel@amd.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, federico.serafini@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230629210150.69525-1-julien@xen.org>
In-Reply-To: <20230629210150.69525-1-julien@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry I forgot to CC Bertrand and Stefano.


On 29/06/2023 22:01, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> Both the stub and the x86 prototypes for replace_grant_host_mapping()
> and create_grant_host_mapping() will define the first parameter (and
> third for the former) as uint64_t. Yet Arm will define it as
> 'unsigned long'.
> 
> While there are no differences for 64-bit, for 32-bit it means
> that the address should be truncated as 32-bit guest could support
> up to 40-bit addresses.
> 
> So replace 'unsigned long' with 'uint64_t' for the first parameter
> (and third parameter for replace_grant_host_mapping()).
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> ---
> 
> Cc: federico.serafini@bugseng.com
> ---
>   xen/arch/arm/include/asm/grant_table.h | 6 +++---
>   xen/arch/arm/mm.c                      | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/grant_table.h b/xen/arch/arm/include/asm/grant_table.h
> index f2d115b97d8b..d3c518a926b9 100644
> --- a/xen/arch/arm/include/asm/grant_table.h
> +++ b/xen/arch/arm/include/asm/grant_table.h
> @@ -36,10 +36,10 @@ static inline bool gnttab_release_host_mappings(const struct domain *d)
>       return true;
>   }
>   
> -int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> +int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>                                 unsigned int flags, unsigned int cache_flags);
> -int replace_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> -                               unsigned long new_gpaddr, unsigned int flags);
> +int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
> +                               uint64_t new_gpaddr, unsigned int flags);
>   
>   /*
>    * The region used by Xen on the memory will never be mapped in DOM0
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0a3e1f3b64b6..53773368d036 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1579,7 +1579,7 @@ void put_page_type(struct page_info *page)
>       return;
>   }
>   
> -int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> +int create_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
>                                 unsigned int flags, unsigned int cache_flags)
>   {
>       int rc;
> @@ -1600,8 +1600,8 @@ int create_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
>           return GNTST_okay;
>   }
>   
> -int replace_grant_host_mapping(unsigned long gpaddr, mfn_t frame,
> -                               unsigned long new_gpaddr, unsigned int flags)
> +int replace_grant_host_mapping(uint64_t gpaddr, mfn_t frame,
> +                               uint64_t new_gpaddr, unsigned int flags)
>   {
>       gfn_t gfn = gaddr_to_gfn(gpaddr);
>       struct domain *d = current->domain;

-- 
Julien Grall

