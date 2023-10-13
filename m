Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8DC7C8D12
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 20:32:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616877.959190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMws-000611-IN; Fri, 13 Oct 2023 18:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616877.959190; Fri, 13 Oct 2023 18:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrMws-0005yz-FK; Fri, 13 Oct 2023 18:31:46 +0000
Received: by outflank-mailman (input) for mailman id 616877;
 Fri, 13 Oct 2023 18:31:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrMwr-0005yt-50
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 18:31:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrMwq-00010k-RP; Fri, 13 Oct 2023 18:31:44 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrMwq-0000uN-KI; Fri, 13 Oct 2023 18:31:44 +0000
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
	bh=6MNT+GGqRULTHK5ZgOIVYu/snTBl6s7nR/Bnap603p4=; b=Tb4iPSH/XkKr6jXJAmViVU3mKC
	PhvTUkZCa59xMrZzuD/R/We8HAEtKXQO5foGinh8iPDFtHfBUcB+Ch7db85jrmEvZSz/CaErrax/J
	5RHphinQ3vxZS+7rm4PwLDDXljPqBXrOE4WCJ+3a+3eplPxspgZX5VKpteVmgCOLwCl0=;
Message-ID: <527635ac-88b4-4a98-b5b6-1bc2d8600377@xen.org>
Date: Fri, 13 Oct 2023 19:31:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 8/8] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20231009010313.3668423-1-Henry.Wang@arm.com>
 <20231009010313.3668423-9-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231009010313.3668423-9-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

some more remarks.

On 09/10/2023 02:03, Henry Wang wrote:
> +/*
> + * Invalidate all entries in the root page-tables. This is
> + * useful to get fault on entry and do an action.
> + *
> + * p2m_invalid_root() should not be called when the P2M is shared with
> + * the IOMMU because it will cause IOMMU fault.
> + */
> +void p2m_invalidate_root(struct p2m_domain *p2m)

I think this function doesn't make sense for the MPU. What would invalidate?

The only caller outside of the file is in 
arch_domain_creation_finished(). This was used for set/way emulation 
which I believe will be difficult to implement efficiently for the MPU 
(see my other reply to this patch).

So I would consider to move arch_domain_creation_finished() in mmu/p2m.c 
or creating a new function p2m_domain_creation_finished() which is 
called from arch_domain_creation_finished().


[...]

> +/*
> + * Clean & invalidate RAM associated to the guest vCPU.
> + *
> + * The function can only work with the current vCPU and should be called
> + * with IRQ enabled as the vCPU could get preempted.
> + */
> +void p2m_flush_vm(struct vcpu *v)
I believe an implementation of p2m_flush_vm() would be quite expensive 
for the MPU. It would be better to not emulate set/way for now.

It would also feel a bit odd to leave it unimplemented and called from 
check_for_vcpu_work(). So maybe we want to rename it. I don't have a 
goood name suggestion though. Bertrand, Stefano?

> +{
> +    struct p2m_domain *p2m = p2m_get_hostp2m(v->domain);
> +    int rc;
> +    gfn_t start = _gfn(0);
> +
> +    ASSERT(v == current);
> +    ASSERT(local_irq_is_enabled());
> +    ASSERT(v->arch.need_flush_to_ram);
> +
> +    do
> +    {
> +        rc = p2m_cache_flush_range(v->domain, &start, _gfn(ULONG_MAX));
> +        if ( rc == -ERESTART )
> +            do_softirq();
> +    } while ( rc == -ERESTART );
> +
> +    if ( rc != 0 )
> +        gprintk(XENLOG_WARNING,
> +                "P2M has not been correctly cleaned (rc = %d)\n",
> +                rc);
> +
> +    /*
> +     * Invalidate the p2m to track which page was modified by the guest
> +     * between call of p2m_flush_vm().
> +     */
> +    p2m_invalidate_root(p2m);
> +
> +    v->arch.need_flush_to_ram = false;
> +}
> +
> +/* VTCR value to be configured by all CPUs. Set only once by the boot CPU */
> +static register_t __read_mostly vtcr;
> +
> +void setup_virt_paging_one(void *data)
> +{
> +    WRITE_SYSREG(vtcr, VTCR_EL2);
> +
> +    /*
> +     * ARM64_WORKAROUND_AT_SPECULATE: We want to keep the TLBs free from
> +     * entries related to EL1/EL0 translation regime until a guest vCPU
> +     * is running. For that, we need to set-up VTTBR to point to an empty
> +     * page-table and turn on stage-2 translation. The TLB entries
> +     * associated with EL1/EL0 translation regime will also be flushed in case
> +     * an AT instruction was speculated before hand.
> +     */
> +    if ( cpus_have_cap(ARM64_WORKAROUND_AT_SPECULATE) )
> +    {
> +        WRITE_SYSREG64(generate_vttbr(INVALID_VMID, empty_root_mfn), VTTBR_EL2);
> +        WRITE_SYSREG(READ_SYSREG(HCR_EL2) | HCR_VM, HCR_EL2);
> +        isb();
> +
> +        flush_all_guests_tlb_local();
> +    }
> +}


[...]

-- 
Julien Grall

