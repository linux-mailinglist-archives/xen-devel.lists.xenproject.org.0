Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 086FA3796E4
	for <lists+xen-devel@lfdr.de>; Mon, 10 May 2021 20:16:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.125461.236173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgARA-0003xO-KT; Mon, 10 May 2021 18:15:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 125461.236173; Mon, 10 May 2021 18:15:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lgARA-0003uh-HS; Mon, 10 May 2021 18:15:24 +0000
Received: by outflank-mailman (input) for mailman id 125461;
 Mon, 10 May 2021 18:15:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lgAR9-0003ub-Dg
 for xen-devel@lists.xenproject.org; Mon, 10 May 2021 18:15:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgAR5-000343-IE; Mon, 10 May 2021 18:15:19 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lgAR5-00056p-BN; Mon, 10 May 2021 18:15:19 +0000
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
	bh=U5oB8mfFZLEuy5Yg/E0zgF4iSW40BPLFycfVFKKLR18=; b=bOJV5SmQ0O2K2VSbIDK/2BxZ2Q
	hA+OjDCuSuM4X73YxfSLnzK4PkvUYT13yWt3F9Kp4L/luL4z544C+SikxjoGEzsAhlfyw5WbInzbj
	BoLURVvENjwaKuMRzgEPeOb3k9kixOubpH6Ut322sIfARM84GOZ8pWvwuCQcPyNHUdZw=;
Subject: Re: Regression when booting 5.15 as dom0 on arm64 (WAS: Re:
 [linux-linus test] 161829: regressions - FAIL)
To: Christoph Hellwig <hch@lst.de>
Cc: f.fainelli@gmail.com, Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 linux-kernel@vger.kernel.org,
 osstest service owner <osstest-admin@xenproject.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 iommu@lists.linux-foundation.org
References: <osstest-161829-mainreport@xen.org>
 <4ea1e89f-a7a0-7664-470c-b3cf773a1031@xen.org> <20210510084057.GA933@lst.de>
From: Julien Grall <julien@xen.org>
Message-ID: <8b851596-acf7-9d3b-b08a-848cae5adada@xen.org>
Date: Mon, 10 May 2021 19:15:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210510084057.GA933@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Christoph,

On 10/05/2021 09:40, Christoph Hellwig wrote:
> On Sat, May 08, 2021 at 12:32:37AM +0100, Julien Grall wrote:
>> The pointer dereferenced seems to suggest that the swiotlb hasn't been
>> allocated. From what I can tell, this may be because swiotlb_force is set
>> to SWIOTLB_NO_FORCE, we will still enable the swiotlb when running on top
>> of Xen.
>>
>> I am not entirely sure what would be the correct fix. Any opinions?
> 
> Can you try something like the patch below (not even compile tested, but
> the intent should be obvious?
> 
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 16a2b2b1c54d..7671bc153fb1 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -44,6 +44,8 @@
>   #include <asm/tlb.h>
>   #include <asm/alternative.h>
>   
> +#include <xen/arm/swiotlb-xen.h>
> +
>   /*
>    * We need to be able to catch inadvertent references to memstart_addr
>    * that occur (potentially in generic code) before arm64_memblock_init()
> @@ -482,7 +484,7 @@ void __init mem_init(void)
>   	if (swiotlb_force == SWIOTLB_FORCE ||
>   	    max_pfn > PFN_DOWN(arm64_dma_phys_limit))
>   		swiotlb_init(1);
> -	else
> +	else if (!IS_ENABLED(CONFIG_XEN) || !xen_swiotlb_detect())
>   		swiotlb_force = SWIOTLB_NO_FORCE;
>   
>   	set_max_mapnr(max_pfn - PHYS_PFN_OFFSET);

I have applied the patch on top of 5.13-rc1 and can confirm I am able to 
boot dom0. Are you going to submit the patch?

Thank you for your help!

Best regards,

-- 
Julien Grall

