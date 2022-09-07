Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 549F75B01F2
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 12:31:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401155.642873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsKe-0004ii-E0; Wed, 07 Sep 2022 10:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401155.642873; Wed, 07 Sep 2022 10:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsKe-0004gU-BG; Wed, 07 Sep 2022 10:30:56 +0000
Received: by outflank-mailman (input) for mailman id 401155;
 Wed, 07 Sep 2022 10:30:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVsKc-0004gO-OZ
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:30:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVsKc-0002op-AX; Wed, 07 Sep 2022 10:30:54 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVsKc-0002cs-3x; Wed, 07 Sep 2022 10:30:54 +0000
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
	bh=UAp7HeEYfSyYusbbBQzfswaxv4okyGm87qW7bYLU1WE=; b=Ke9stc7cIEd2fA1Vk0XP2R0QY+
	jG7pson4PyI1Xp8pIwIv/qsciSVw/h+AV9iWr6hn10J2jMgbplwx4Ch29gobzuKt5aL6dqE6aPv58
	RyhqIUi/nwOA8TAHgK/CtN8BIfsZNA2E7dqE8fyxA/XzBlxm8J5EBZqe3mkPItT32BcA=;
Message-ID: <9234b0da-01c6-dafc-8e62-c7e497f8f146@xen.org>
Date: Wed, 7 Sep 2022 11:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 3/4] xen/arm: mm: Rename xenheap_* variable to
 directmap_*
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-4-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220907083643.20152-4-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 07/09/2022 09:36, Henry Wang wrote:
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 7f5b317d3e..4a70ed2986 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -132,12 +132,12 @@ uint64_t init_ttbr;
>   static paddr_t phys_offset;
>   
>   /* Limits of the Xen heap */
> -mfn_t xenheap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
> -mfn_t xenheap_mfn_end __read_mostly;
> -vaddr_t xenheap_virt_end __read_mostly;
> +mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
> +mfn_t directmap_mfn_end __read_mostly;
> +vaddr_t directmap_virt_end __read_mostly;
>   #ifdef CONFIG_ARM_64
> -vaddr_t xenheap_virt_start __read_mostly;
> -unsigned long xenheap_base_pdx __read_mostly;
> +vaddr_t directmap_virt_start __read_mostly;
> +unsigned long directmap_base_pdx __read_mostly;
>   #endif
>   
>   unsigned long frametable_base_pdx __read_mostly;
> @@ -609,7 +609,7 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,

I think the function also want to be renamed to match the code below.

>           panic("Unable to setup the xenheap mappings.\n");

Likely, I think this wants to be s/xenheap/directmap/

>   
>       /* Record where the xenheap is, for translation routines. */

Same here because you set directmap_virt_end.

> -    xenheap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
> +    directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;

I would be OK to keep "XENHEAP_*" for now.

>   }
>   #else /* CONFIG_ARM_64 */
>   void __init setup_xenheap_mappings(unsigned long base_mfn,
> @@ -618,12 +618,12 @@ void __init setup_xenheap_mappings(unsigned long base_mfn,
>       int rc;
>   
>       /* First call sets the xenheap physical and virtual offset. */

s/xenheap/directmap/ I haven't looked if there are other instances in 
the function.

Cheers,

-- 
Julien Grall

