Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309E9A87E5D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 13:05:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.949699.1346174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HcS-0008F9-PT; Mon, 14 Apr 2025 11:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 949699.1346174; Mon, 14 Apr 2025 11:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4HcS-0008Dg-Lo; Mon, 14 Apr 2025 11:04:52 +0000
Received: by outflank-mailman (input) for mailman id 949699;
 Mon, 14 Apr 2025 11:04:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4HcR-0008DZ-A3
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 11:04:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4HcQ-00Eo8v-2p;
 Mon, 14 Apr 2025 11:04:50 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4HcQ-00D037-1G;
 Mon, 14 Apr 2025 11:04:50 +0000
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
	bh=0gP/shSGUpzC8drtdlKzLA6kHVprm2PhBn6p+p9W21k=; b=3439mjXWgc/dY7lKo5aOXAJA7y
	70gTd0gw2hEtN7Vn2y4hMyFvWYm2yVpbSJhSFYdVa8lC28dhz9XUbnQwDZPwnhXpB/KXpEkDjs0S0
	HBEy/9X37gxDOEV3I3GVha84FSKnHbccYnkaZH1LKyNWjPtf+yzODB4lMhvO0czEARH0=;
Message-ID: <44f897c3-1ff4-43cb-b0d6-ae8a84a386e6@xen.org>
Date: Mon, 14 Apr 2025 20:04:44 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm: vgic: Add the ability to trigger MSIs from
 the Hypervisor
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1744621166.git.mykyta_poturai@epam.com>
 <3dba1b51984f24e36d5fbd81396ab7dd53d8ac95.1744621166.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3dba1b51984f24e36d5fbd81396ab7dd53d8ac95.1744621166.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/04/2025 18:51, Mykyta Poturai wrote:
> From: Mykyta Poturai <Mykyta_Poturai@epam.com>
> 
> Add the vgic_its_trigger_msi() function to the vgic interface. This
> function allows to inject MSIs from the Hypervisor to the guest.
> Which is useful for userspace PCI backend drivers.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> v1->v2:
> * replace -1 with -ENOENT
> * reduce guest memory access in vgic_its_trigger_msi
> ---
>   xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
>   xen/arch/arm/vgic-v3-its.c      | 19 +++++++++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index e309dca1ad..3d8e3a8343 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -318,6 +318,17 @@ extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int ir
>   extern void vgic_check_inflight_irqs_pending(struct vcpu *v,
>                                                unsigned int rank, uint32_t r);
>   
> +#ifdef CONFIG_HAS_ITS
> +int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
> +                                u32 devid, u32 eventid);
> +#else
> +static inline int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
> +                                u32 devid, u32 eventid)
> +{
> +    return -EOPNOTSUPP;
> +}
> +#endif /* CONFIG_HAS_ITS */
> +
>   #endif /* !CONFIG_NEW_VGIC */
>   
>   /*** Common VGIC functions used by Xen arch code ****/
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index c65c1dbf52..be5bfe0d21 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1484,6 +1484,25 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>       return 0;
>   }
>   
> +int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
> +                                u32 devid, u32 eventid)

Looking at how this is used in the next patch, you are assuming that 
devid == sbdf. However, given there is no support for guest vITS yet, I 
don't think we took a decision on whether the device ID match the SBDF.

This goes back to what I wrote in the cover letter. It seems that there 
are more work needed to be merged before this series.

Also coding style: we use uint32_t in newer code.

> +{
> +    struct pending_irq *pend;
> +    unsigned int vcpu_id;
> +
> +    pend = gicv3_its_get_event_pending_irq(d,doorbell_address, devid, eventid);

A couple of questions:

  1. What prevents pending_irq to be freed behind our back?
  2. Going back to my point about the missing guest ITS support, it is 
unclear how virtual device will work and whether we want QEMU to inject 
interrupts which belongs to a physical device.

coding style: Missing space before the comma.

> +    if ( !pend )
> +        return -ENOENT;
> +
> +    vcpu_id = ACCESS_ONCE(pend->lpi_vcpu_id);
> +    if ( vcpu_id >= d->max_vcpus )
> +          return -ENOENT;
> +
> +    vgic_inject_irq(d, d->vcpu[vcpu_id], pend->irq, true);
> +
> +    return 0;
> +}
> +
>   unsigned int vgic_v3_its_count(const struct domain *d)
>   {
>       struct host_its *hw_its;

Cheers,

-- 
Julien Grall


