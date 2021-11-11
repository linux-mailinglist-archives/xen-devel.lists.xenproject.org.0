Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BE944D604
	for <lists+xen-devel@lfdr.de>; Thu, 11 Nov 2021 12:43:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.224729.388197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml8U8-0008Fk-Ld; Thu, 11 Nov 2021 11:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 224729.388197; Thu, 11 Nov 2021 11:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ml8U8-0008Da-IB; Thu, 11 Nov 2021 11:43:16 +0000
Received: by outflank-mailman (input) for mailman id 224729;
 Thu, 11 Nov 2021 11:43:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ml8U7-0008DU-E6
 for xen-devel@lists.xenproject.org; Thu, 11 Nov 2021 11:43:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ml8U6-0004GA-1x; Thu, 11 Nov 2021 11:43:14 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.21.213]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ml8U5-0001aV-SB; Thu, 11 Nov 2021 11:43:13 +0000
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
	bh=ZuWVDoOdOiJFiaRhufmMNcjGTdGC24An1UDrj3+lMFU=; b=tSj5mKdX2V2nhgaglqSR4GN1F3
	Zt4epjyIMPJcYb0jNnqmKIS+AL8tAJF7E35NCRIqsY9GrN4QWV0YpCsuhlatike5zJjzIhXonhrxt
	hh1NWppA4Ib341T40vaXXpLj9iZRj/W///pG4Y1MprIvGnPDG38/u/clS3Wpl/az9lVI=;
Message-ID: <095e16e5-312d-61e5-e61f-4e026affad8d@xen.org>
Date: Thu, 11 Nov 2021 11:43:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH v2 for-4.16] xen/arm: allocate_bank_memory: don't create
 memory banks of size zero
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, oleksandr_tyshchenko@epam.com,
 iwj@xenproject.org, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20211110205555.945026-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211110205555.945026-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 10/11/2021 20:55, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> allocate_bank_memory can be called with a tot_size of zero, as an
> example see the implementation of allocate_memory which can call
> allocate_bank_memory with a tot_size of zero for the second memory bank.
> 
> If tot_size == 0, don't create an empty memory bank, just return
> immediately without error. Otherwise a zero-size memory bank will be
> added to the domain device tree.
> 
> Note that Linux is known to be able to cope with zero-size memory banks,
> and Xen more recently gained the ability to do so as well (5a37207df520
> "xen/arm: bootfdt: Ignore empty memory bank"). However, there might be
> other non-Linux OSes that are not able to cope with empty memory banks
> as well as Linux (and now Xen). It would be more robust to avoid
> zero-size memory banks unless required.
> 
> Moreover, the code to find empty address regions in make_hypervisor_node
> in Xen is not able to cope with empty memory banks today and would
> result in a Xen crash. This is only a latent bug because
> make_hypervisor_node is only called for Dom0 at present and
> allocate_memory is only called for DomU at the moment. (But if
> make_hypervisor_node was to be called for a DomU, then the Xen crash
> would become manifest.)

As also mentionned by Oleksandr, I don't think make_hypervisor_node() 
could work as-is for DomU because we are not re-using the host memory 
layout (yet). Instead, we would need a logic similar to the one we use 
in libxl.

That said, it makes easier to reason if all the memory banks are non-zero.

> 
> Fixes: f2931b4233ec ("xen/arm: introduce allocate_memory")
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes in v2:
> - improve commit message
> - add in-code comment
> 
> In regards to inclusion in 4.16.
> 
> If we don't fix this issue in 4.16, default usage of Xen+Linux won't be
> affected.
> 
> However:
> - Non-Linux OSes that cannot cope with zero-size memory banks could
>    error out. I am not aware of any but there are so many out there in
>    embedded it is impossible to tell.

I agree this is the main concern. Although, this not a new bug has been 
present for 3 years now.

> - downstream Xen calling make_hypervisor_node for DomUs will crash

For this and ...

> - future Xen calling make_hypervisor_node for DomUs will have to make
>    sure to fix this anyway

... this see above.

> 
> If we commit the patch in 4.16, we fix these issue. This patch is only 2
> lines of code and very easy to review. The risk is extremely low. >
> Difficult to say what mistakes could have been made in analysis and
> preparation because it is a trivial if-zero-return patch, which is
> likely to fix latent bugs rather than introducing instability.
> 
> ---
>   xen/arch/arm/domain_build.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9e92b640cd..fe38a7c73c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -395,6 +395,14 @@ static bool __init allocate_bank_memory(struct domain *d,
>       struct membank *bank;
>       unsigned int max_order = ~0;
>   
> +    /*
> +     * allocate_bank_memory can be called with a tot_size of zero for
> +     * the second memory bank. It is not an error and we can safely
> +     * avoid creating a zero-size memory bank.
> +     */
> +    if ( tot_size == 0 )
> +        return true;
> +
>       bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
>       bank->start = gfn_to_gaddr(sgfn);
>       bank->size = tot_size;
> 

-- 
Julien Grall

