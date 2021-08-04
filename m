Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626DA3E09ED
	for <lists+xen-devel@lfdr.de>; Wed,  4 Aug 2021 23:16:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.164041.300238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBOEv-0005qj-M3; Wed, 04 Aug 2021 21:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 164041.300238; Wed, 04 Aug 2021 21:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mBOEv-0005ng-I9; Wed, 04 Aug 2021 21:15:49 +0000
Received: by outflank-mailman (input) for mailman id 164041;
 Wed, 04 Aug 2021 21:15:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mBOEu-0005na-CV
 for xen-devel@lists.xenproject.org; Wed, 04 Aug 2021 21:15:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mBOEr-0008Bt-Oe; Wed, 04 Aug 2021 21:15:45 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mBOEr-0006xg-Iv; Wed, 04 Aug 2021 21:15:45 +0000
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
	bh=VCxxqvHm/wQmtCY4W5Wt26CsUtdHlgnZurRu1gjewwQ=; b=sAssqme6cuM6CnuBYjY1wBgJjc
	6iSkW0xbnKcSj4K0QrOyMBil9XftHMzPIyqskl0vmdPvkrK100piNHgq4LCX6BAA5Z16RjfRF+4WF
	Z6hQBVk53yd/07LuyzabSIuR4FsvugJ6YgDrxj6AYHPc+jaQB/06bG3keepI4+DrXDjU=;
Subject: Re: [PATCH v3] xen/arm: Do not invalidate the P2M when the PT is
 shared with the IOMMU
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com,
 Bertrand.Marquis@arm.com, Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20210804205707.5092-1-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <4f944483-7253-4287-bdaf-9aeb29a8cad5@xen.org>
Date: Wed, 4 Aug 2021 22:15:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804205707.5092-1-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 04/08/2021 21:57, Stefano Stabellini wrote:
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
> Add a check in p2m_set_way_flush: if a set/way instruction is used
> and iommu_use_hap_pt returns true, rather than failing with obscure
> IOMMU faults, inject an undef exception straight away into the guest,
> and print a verbose error message to explain the problem.
> 
> Also add an ASSERT in p2m_invalidate_root to make sure we don't
> inadvertently stumble across this problem again in the future.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

> 
> ---
> 
> Changes in v3:
> - shorten in-code comment
> - return on a newline in p2m_set_way_flush
> 
> Changes in v2:
> - improve commit message
> - improve in-code comment in p2m.c
> - move the warning and undef injection to p2m_set_way_flush
> - use gprintk instead of gdprintk
> ---
>   xen/arch/arm/arm64/vsysreg.c |  2 +-
>   xen/arch/arm/p2m.c           | 17 ++++++++++++++++-
>   xen/arch/arm/vcpreg.c        |  2 +-
>   xen/include/asm-arm/p2m.h    |  4 +++-
>   4 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
> index caf17174b8..887266dd46 100644
> --- a/xen/arch/arm/arm64/vsysreg.c
> +++ b/xen/arch/arm/arm64/vsysreg.c
> @@ -106,7 +106,7 @@ void do_sysreg(struct cpu_user_regs *regs,
>       case HSR_SYSREG_DCCSW:
>       case HSR_SYSREG_DCCISW:
>           if ( !hsr.sysreg.read )
> -            p2m_set_way_flush(current);
> +            p2m_set_way_flush(current, regs, hsr);
>           break;
>   
>       /*
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index d414c4feb9..eff9a105e7 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -11,6 +11,7 @@
>   #include <asm/flushtlb.h>
>   #include <asm/guest_walk.h>
>   #include <asm/page.h>
> +#include <asm/traps.h>
>   
>   #define MAX_VMID_8_BIT  (1UL << 8)
>   #define MAX_VMID_16_BIT (1UL << 16)
> @@ -1166,11 +1167,16 @@ static void p2m_invalidate_table(struct p2m_domain *p2m, mfn_t mfn)
>   /*
>    * Invalidate all entries in the root page-tables. This is
>    * useful to get fault on entry and do an action.
> + *
> + * p2m_invalid_root() should not be called when the P2M is shared with
> + * the IOMMU because it will cause IOMMU fault.
>    */
>   void p2m_invalidate_root(struct p2m_domain *p2m)
>   {
>       unsigned int i;
>   
> +    ASSERT(!iommu_use_hap_pt(p2m->domain));
> +
>       p2m_write_lock(p2m);
>   
>       for ( i = 0; i < P2M_ROOT_LEVEL; i++ )
> @@ -1815,11 +1821,20 @@ void p2m_flush_vm(struct vcpu *v)
>    *
>    *  - Once the caches are enabled, we stop trapping VM ops.
>    */
> -void p2m_set_way_flush(struct vcpu *v)
> +void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
> +                       const union hsr hsr)
>   {
>       /* This function can only work with the current vCPU. */
>       ASSERT(v == current);
>   
> +    if ( iommu_use_hap_pt(current->domain) )
> +    {
> +        gprintk(XENLOG_ERR,
> +                "The cache should be flushed by VA rather than by set/way.\n");
> +        inject_undef_exception(regs, hsr);
> +        return;
> +    }
> +
>       if ( !(v->arch.hcr_el2 & HCR_TVM) )
>       {
>           v->arch.need_flush_to_ram = true;
> diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
> index e3ce56d875..33259c4194 100644
> --- a/xen/arch/arm/vcpreg.c
> +++ b/xen/arch/arm/vcpreg.c
> @@ -232,7 +232,7 @@ void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr)
>       case HSR_CPREG32(DCCSW):
>       case HSR_CPREG32(DCCISW):
>           if ( !cp32.read )
> -            p2m_set_way_flush(current);
> +            p2m_set_way_flush(current, regs, hsr);
>           break;
>   
>       /*
> diff --git a/xen/include/asm-arm/p2m.h b/xen/include/asm-arm/p2m.h
> index 4f8b3b0ec7..6a2108398f 100644
> --- a/xen/include/asm-arm/p2m.h
> +++ b/xen/include/asm-arm/p2m.h
> @@ -7,6 +7,7 @@
>   #include <xen/mem_access.h>
>   
>   #include <asm/current.h>
> +#include <asm/hsr.h>
>   
>   #define paddr_bits PADDR_BITS
>   
> @@ -272,7 +273,8 @@ void p2m_invalidate_root(struct p2m_domain *p2m);
>    */
>   int p2m_cache_flush_range(struct domain *d, gfn_t *pstart, gfn_t end);
>   
> -void p2m_set_way_flush(struct vcpu *v);
> +void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
> +                       const union hsr hsr);
>   
>   void p2m_toggle_cache(struct vcpu *v, bool was_enabled);
>   
> 

Cheers,

-- 
Julien Grall

