Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D336864B4CA
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 13:07:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460630.718568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p543s-000345-SD; Tue, 13 Dec 2022 12:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460630.718568; Tue, 13 Dec 2022 12:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p543s-00031f-Or; Tue, 13 Dec 2022 12:07:04 +0000
Received: by outflank-mailman (input) for mailman id 460630;
 Tue, 13 Dec 2022 12:07:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p543r-00031Z-1J
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 12:07:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p543q-0006Ym-2E; Tue, 13 Dec 2022 12:07:02 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.2.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p543p-00076w-R5; Tue, 13 Dec 2022 12:07:01 +0000
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
	bh=Hu4EfwXLcNlxg6e1/LqOnYigKgPtwaiGx3G+DRC4bvU=; b=bxj6OtTyTb/3GhE9F1gtU0DlTn
	XS6LwgnztmkJHaAopGQM2eMHgaZ8hQkoM3MQv87Kg8wlgesalIGFp+B0shH8yEpAWii1py9pQWxJg
	b8lUq0lRNub4SzElTYu8AuhWlhiA/Ahqy/18zAXoprKSNDqoj8Tpxz1R49ignqLxzc+Q=;
Message-ID: <520abcb0-0edd-bb09-f3a2-bb3d96c569b3@xen.org>
Date: Tue, 13 Dec 2022 12:06:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 2/2] NUMA: replace phys_to_nid()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <471bd202-7bf0-81be-e8a5-780ea5975a70@suse.com>
 <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <670b7017-4a6e-fa9e-9d65-65013bd4ad80@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 13/12/2022 11:38, Jan Beulich wrote:
> All callers convert frame numbers (perhaps in turn derived from struct
> page_info pointers) to an address, just for the function to convert it
> back to a frame number (as the first step of paddr_to_pdx()). Replace
> the function by mfn_to_nid() plus a page_to_nid() wrapper macro. Replace
> call sites by the respectively most suitable one.
> 
> While there also introduce a !NUMA stub, eliminating the need for Arm
> (and potentially other ports) to carry one individually.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> At the top of free_heap_pages() mfn_to_nid() could also be used, since
> the MFN is calculated immediately ahead. The choice of using
> page_to_nid() (for now at least) was with the earlier patch's RFC in
> mind, addressing of which may require to make mfn_to_nid() do weaker
> checking than page_to_nid().

I haven't looked in details at the previous patch. However, I don't like 
the idea of making mfn_to_nid() do weaker checking because this could 
easily confuse the reader/developper.

If you want to use weaker check, then it would be better if a separate 
helper is provided with a name reflecting its purpose.

> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -671,15 +671,15 @@ static void cf_check dump_numa(unsigned
>   
>       for_each_online_node ( i )
>       {
> -        paddr_t pa = pfn_to_paddr(node_start_pfn(i) + 1);
> +        mfn_t mfn = _mfn(node_start_pfn(i) + 1);
>   
>           printk("NODE%u start->%lu size->%lu free->%lu\n",
>                  i, node_start_pfn(i), node_spanned_pages(i),
>                  avail_node_heap_pages(i));
> -        /* Sanity check phys_to_nid() */
> -        if ( phys_to_nid(pa) != i )
> -            printk("phys_to_nid(%"PRIpaddr") -> %d should be %u\n",
> -                   pa, phys_to_nid(pa), i);
> +        /* Sanity check mfn_to_nid() */
> +        if ( node_spanned_pages(i) && mfn_to_nid(mfn) != i )


 From the commit message, I would have expected that we would only 
replace phys_to_nid() with either mfn_to_nid() or page_to_nid(). 
However, here you added node_spanned_pages(). Can you explain why?

Cheers,

-- 
Julien Grall

