Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7D5AB64CC
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 09:47:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983971.1370143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6pf-0006kt-TV; Wed, 14 May 2025 07:47:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983971.1370143; Wed, 14 May 2025 07:47:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uF6pf-0006iV-Ql; Wed, 14 May 2025 07:47:15 +0000
Received: by outflank-mailman (input) for mailman id 983971;
 Wed, 14 May 2025 07:47:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uF6pe-0006iM-2I
 for xen-devel@lists.xenproject.org; Wed, 14 May 2025 07:47:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6pd-008Gh4-2a;
 Wed, 14 May 2025 07:47:13 +0000
Received: from [2a02:8012:3a1:0:51a6:3d91:4273:769]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uF6pd-00EMS5-0Q;
 Wed, 14 May 2025 07:47:13 +0000
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
	bh=/078umx2RcIJo6GXPagYmwwWL++os7oP3MDUW2NSR5o=; b=Pu76PZ+2W7k8ZCzOqUBtC/5dCu
	zdwe9P4eGZdN6tYUCMXmGbVgValHXg3MSxglzaF74YYYxOKNMDp4xpQ/dpgakdSzHcRVqHHJT9B7C
	DbfFLCctr3GCMiJnt51QN2ITExNEHtAHGemWhjrhdo7LL22PdtWqmBVMNN+j1pLXAOXs=;
Message-ID: <73d064d2-1358-4e5d-9d7d-740a22a711ba@xen.org>
Date: Wed, 14 May 2025 08:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] xen/arm: fix math in add_ext_regions
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
 <20250508132040.532898-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250508132040.532898-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 08/05/2025 14:20, Stewart Hildebrand wrote:
> In commit f37a59813979, the arguments to add_ext_regions() were switched
> from addresses to frame numbers. add_ext_regions() converts the frame
> numbers back to addresses, but the end address (e) is rounded down to
> page size alignment. The logic to calculate the size assumes e points to
> the last address, not page, effectively leading to the region size being
> erroneously calculated to be 2M smaller than the actual size of the
> region.
> 
> Fix by adding 1 to the frame number before converting back to address.
> 
> Fixes: f37a59813979 ("xen/arm: domain_build: Track unallocated pages using the frame number")
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Acked-by: Michal Orzel <michal.orzel@amd.com>
> ---
> v1->v2:
> * add Michal's A-b
> ---
>   xen/arch/arm/domain_build.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index df29619c4007..2f2b021dec3e 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -761,7 +761,7 @@ int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
>       struct membanks *ext_regions = data;
>       paddr_t start, size;
>       paddr_t s = pfn_to_paddr(s_gfn);
> -    paddr_t e = pfn_to_paddr(e_gfn);
> +    paddr_t e = pfn_to_paddr(e_gfn + 1) - 1;

I noticed this patch. While reading the function, I noticed this would 
result to some confusing code:


     if ( start > e )
         return 0;

     [...]

     /*
      * e is actually "end-1" because it is called by rangeset functions
      * which are inclusive of the last address.
      */
     e += 1;
     size = (e - start) & ~(SZ_2M - 1);

So substract 1, but then re-add after. Is there any reason we didn't 
adjust the rest of the code?

Cheers,

-- 
Julien Grall


