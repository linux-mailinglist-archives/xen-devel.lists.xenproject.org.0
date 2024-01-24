Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B50383A834
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 12:42:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670961.1044075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbdX-0000XW-Hr; Wed, 24 Jan 2024 11:41:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670961.1044075; Wed, 24 Jan 2024 11:41:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSbdX-0000Uv-F7; Wed, 24 Jan 2024 11:41:43 +0000
Received: by outflank-mailman (input) for mailman id 670961;
 Wed, 24 Jan 2024 11:41:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rSbdV-0000Td-Mu
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 11:41:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSbdV-00038F-6A; Wed, 24 Jan 2024 11:41:41 +0000
Received: from [15.248.2.233] (helo=[10.24.67.33])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rSbdU-0007Bl-U9; Wed, 24 Jan 2024 11:41:41 +0000
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
	bh=JbdnSJN23Uz8HwFPiRoM3GL3kCU+LLlrS81Z6u8HWC0=; b=47MTzOaroJ/3I1Ss+5pvN4wkKz
	JYBm4YttMbk1Dab61W2wIQhVyBvVRU52II9ab+vr0n/Qe7jjgtqQAhCMNt5Ahvdupd3qh7xNzTX2K
	NippIs/3SJ+sblL1s1217eDJ3OChqM9iwxkSzcNbnm1eQZBqRfzXwhVHkaXuK+9hSQ+g=;
Message-ID: <56da4008-f0a5-437f-b3ff-50220ea50c81@xen.org>
Date: Wed, 24 Jan 2024 11:41:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm: vgic: Add the ability to trigger MSIs from the
 Hypervisor
Content-Language: en-GB
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1705066642.git.mykyta_poturai@epam.com>
 <e109a4092d80a825256d26a8e56dbb5a2ae6d04e.1705066642.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <e109a4092d80a825256d26a8e56dbb5a2ae6d04e.1705066642.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/01/2024 10:01, Mykyta Poturai wrote:
> Add the vgic_its_trigger_msi() function to the vgic interface. This
> function allows to inject MSIs from the Hypervisor to the guest.
> Which is useful for userspace PCI backend drivers.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>   xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
>   xen/arch/arm/vgic-v3-its.c      | 35 +++++++++++++++++++++++++++++++++
>   2 files changed, 46 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 922779ce14..4695743848 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -317,6 +317,17 @@ extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int ir
>   extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
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
> index 70b5aeb822..683a378f6e 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1484,6 +1484,41 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>       return 0;
>   }
>   
> +int vgic_its_trigger_msi(struct domain *d, paddr_t doorbell_address,
> +                                u32 devid, u32 eventid)
> +{
> +    struct vcpu *vcpu;
> +    struct virt_its *pos, *temp;
> +    struct virt_its *its = NULL;
> +    uint32_t vlpi;
> +    bool ret;
> +
> +    list_for_each_entry_safe( pos, temp, &d->arch.vgic.vits_list, vits_list )
> +    {
> +        if ( pos->doorbell_address == doorbell_address )
> +        {
> +            its = pos;
> +            break;
> +        }
> +    }
> +
> +    if ( !its )
> +        return -EINVAL;
> +
> +    spin_lock(&its->its_lock);
> +    ret = read_itte(its, devid, eventid, &vcpu, &vlpi);
> +    spin_unlock(&its->its_lock);
> +    if ( !ret )
> +        return -1;
> +
> +    if ( vlpi == INVALID_LPI )
> +        return -1;

Reading the code, I think you want to use get_event_pending_irq(). This 
will return the associated pending_irq. Then you can...

> +
> +    vgic_vcpu_inject_lpi(its->d, vlpi);

... open-code vgic_vcpu_inject_lpi(). This would avoid access the guest 
memory (done by read_itte) and reduce to just one lookup (today you are 
doing two: read_itte() and irq_to_pending()).

Cheers,

-- 
Julien Grall

