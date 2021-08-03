Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0BA63DF7B9
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 00:20:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163622.299684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mB2lC-0007lH-Th; Tue, 03 Aug 2021 22:19:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163622.299684; Tue, 03 Aug 2021 22:19:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mB2lC-0007jT-Qe; Tue, 03 Aug 2021 22:19:42 +0000
Received: by outflank-mailman (input) for mailman id 163622;
 Tue, 03 Aug 2021 22:19:40 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mB2lA-0007jN-Rx
 for xen-devel@lists.xenproject.org; Tue, 03 Aug 2021 22:19:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mB2l9-0004HR-5t; Tue, 03 Aug 2021 22:19:39 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mB2l8-0000iw-Vy; Tue, 03 Aug 2021 22:19:39 +0000
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
	bh=tjJ6wrHdInFjrJFz47z1dc8BV0wlJP4b3y1Y/9u6RX8=; b=R0aYSBs0432QSIh00sTMAB1L6x
	MmZn2K5nILFlaLaDFW64JorTUIpmgf/Xn4HvxTd7QMT/Tz6Bxj+b8bEHWGTJPC5p3iBSf6T0uwar2
	8YmLeS7fINOezyZjG/Pqxo/pQdrcY+J60Cc6C2BUo/8dit8cHWQGZO2Hf3ofYEVVQSMI=;
Subject: Re: [PATCH] do not p2m_invalidate_root when iommu_use_hap_pt
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 Bertrand.Marquis@arm.com
References: <alpine.DEB.2.21.2108031419500.19737@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <ff5e9e5a-287d-127c-1d39-57c31564e9b3@xen.org>
Date: Tue, 3 Aug 2021 23:19:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2108031419500.19737@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

Title: How about:

"xen/arm: Do not invalidate the P2M when the PT is shared with the IOMMU"

On 03/08/2021 22:37, Stefano Stabellini wrote:
> Set/Way flushes never work correctly in a virtualized environment.
> 
> Our current implementation is based on clearing the valid bit in the p2m
> pagetable to track guest memory accesses. This technique doesn't work
> when the IOMMU is enabled for the domain and the pagetable is shared
> between IOMMU and MMU because it triggers IOMMU faults.
> 
> Specifically, p2m_invalidate_root causes IOMMU faults if
> iommu_use_hap_pt returns true for the domain.
> 
> Add a check in vsysreg.c and vcpreg.c: if a set/way instruction is used
> and iommu_use_hap_pt returns true, rather than failing with obscure
> IOMMU faults, inject an undef exception straight away into the guest,
> and print a verbose error message to explain the problem.
> 
> Also add an ASSERT in p2m_invalidate_root to make sure we don't
> inadvertently stumble across this problem again in the future.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> 
> This patch is an improvement over the IOMMU faults. I don't know if we
> want to give users an option to get past these errors for development
> and debugging.
> 
> We could add a Xen command line option to make Xen ignore Set/Way
> instructions (do nothing on trap). Or we could add an option to avoid
> trapping Set/Way instructions altogether (remove HCR_TSW).
> 
> Both workarounds are obviously not correct and could lead to memory
> corruptions (the former) or bad interference between guests (the latter).

My answer is similar to when you suggested to not trap the SMCs for all 
the domains. Yes, it may allow a domain to boot but such option will not 
do a favor to anyone because more weird behavior may happen.

If there is a will to handle set/way when device is assigned, then we 
need to add support for unsharing the page-tables or figure out a 
different way to emulate set/way.

> Either way, we can start with this patch.
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index caf17174b8..125a9281fc 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -105,6 +105,13 @@ void do_sysreg(struct cpu_user_regs *regs,
>       case HSR_SYSREG_DCISW:
>       case HSR_SYSREG_DCCSW:
>       case HSR_SYSREG_DCCISW:
> +        if ( iommu_use_hap_pt(current->domain) )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "d%u uses set/way cache flushes with the IOMMU on. It cannot work. Replace set/way instructions with dc [ci]vac and retry. Injecting exception into the guest now.\n",

This line would be far too long to print on the serial. I think you want 
to add a few newline here.

> +                     current->domain->domain_id);

Please use %pd.

> +            return inject_undef_exception(regs, hsr);
> +        }

I would prefer if the undef is added in p2m_set_way_flush(). This will 
avoid the duplication between the cpreg and sysreg code.

>           if ( !hsr.sysreg.read )
>               p2m_set_way_flush(current);
>           break;
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index d414c4feb9..240913d5ac 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1171,6 +1171,9 @@ void p2m_invalidate_root(struct p2m_domain *p2m)
>   {
>       unsigned int i;
>   
> +    /* Clearing the valid bit causes IOMMU faults. */

How about moving this comment on top of the function and writing:

"p2m_invalid_root() should not be called when the P2M is shared with the 
IOMMU because it will cause IOMMU fault."

So one doesn't  need to read the invalidation to understand that the 
function should not be called when the P2M is shared with the IOMMU.

> +    ASSERT(!iommu_use_hap_pt(p2m->domain)); > +
>       p2m_write_lock(p2m);
>   
>       for ( i = 0; i < P2M_ROOT_LEVEL; i++ )
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index e3ce56d875..04b68f6901 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -231,6 +231,13 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>       case HSR_CPREG32(DCISW):
>       case HSR_CPREG32(DCCSW):
>       case HSR_CPREG32(DCCISW):
> +        if ( iommu_use_hap_pt(current->domain) )
> +        {
> +            gdprintk(XENLOG_ERR,
> +                     "d%u uses set/way cache flushes with the IOMMU on. It cannot work. Replace set/way instructions with dc [ci]vac and retry. Injecting exception into the guest now.\n",
> +                     current->domain->domain_id);
> +            return inject_undef_exception(regs, hsr);
> +        }
>           if ( !cp32.read )
>               p2m_set_way_flush(current);
>           break;
> 

Cheers,

-- 
Julien Grall

