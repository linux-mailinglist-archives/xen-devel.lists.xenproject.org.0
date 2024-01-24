Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 639A6839E1F
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 02:17:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.670659.1043585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSRtM-0005bQ-46; Wed, 24 Jan 2024 01:17:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 670659.1043585; Wed, 24 Jan 2024 01:17:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rSRtM-0005Yo-16; Wed, 24 Jan 2024 01:17:24 +0000
Received: by outflank-mailman (input) for mailman id 670659;
 Wed, 24 Jan 2024 01:17:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qnut=JC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rSRtK-0005Yi-S7
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 01:17:22 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 51ad05ff-ba56-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 02:17:20 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C7E4E61F7D;
 Wed, 24 Jan 2024 01:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B0BC433C7;
 Wed, 24 Jan 2024 01:17:17 +0000 (UTC)
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
X-Inumbo-ID: 51ad05ff-ba56-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706059038;
	bh=+W5Aghprh/IH0QAMRy5KejpIyrubW8g1iC9sRiYhGs4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=qGzJ2hTkt7Xmnpkx8mNuIY+pdxY3yHSeNTqNZrMEili8NiGC5Yef+VydaLWi43Xb2
	 j687eTPCBVMw1wj6UCAzNbKZRDxna2XKHfk4MiApeeu2HRSJG8v68JxcUC07/ZrQVG
	 HSWzYiN6eoKLMsW5YOX1W4iR9DWu8Mb/AqTUkhE+oWotAfyGXNJpoANeQL++yPhrpV
	 7ln0wSzggu8eqBo5bqpXyA3czhlIWuXLZb+Lis8DQ+QDE2QKbedWwmciZq0kofhYfM
	 ivI+nZKu27sx0c1mxRteb7MzNbSvm9AOgMrF7UJI9Y/giG7EufLalx1nHOBqapQsDg
	 vtxGuGhzRkF8Q==
Date: Tue, 23 Jan 2024 17:17:16 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH 1/2] arm: vgic: Add the ability to trigger MSIs from the
 Hypervisor
In-Reply-To: <e109a4092d80a825256d26a8e56dbb5a2ae6d04e.1705066642.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2401231711160.2287888@ubuntu-linux-20-04-desktop>
References: <cover.1705066642.git.mykyta_poturai@epam.com> <e109a4092d80a825256d26a8e56dbb5a2ae6d04e.1705066642.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 14 Jan 2024, Mykyta Poturai wrote:
> Add the vgic_its_trigger_msi() function to the vgic interface. This
> function allows to inject MSIs from the Hypervisor to the guest.
> Which is useful for userspace PCI backend drivers.
> 
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
>  xen/arch/arm/include/asm/vgic.h | 11 +++++++++++
>  xen/arch/arm/vgic-v3-its.c      | 35 +++++++++++++++++++++++++++++++++
>  2 files changed, 46 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/vgic.h b/xen/arch/arm/include/asm/vgic.h
> index 922779ce14..4695743848 100644
> --- a/xen/arch/arm/include/asm/vgic.h
> +++ b/xen/arch/arm/include/asm/vgic.h
> @@ -317,6 +317,17 @@ extern bool vgic_migrate_irq(struct vcpu *old, struct vcpu *new, unsigned int ir
>  extern void vgic_check_inflight_irqs_pending(struct domain *d, struct vcpu *v,
>                                               unsigned int rank, uint32_t r);
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
>  #endif /* !CONFIG_NEW_VGIC */
>  
>  /*** Common VGIC functions used by Xen arch code ****/
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 70b5aeb822..683a378f6e 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -1484,6 +1484,41 @@ static int vgic_v3_its_init_virtual(struct domain *d, paddr_t guest_addr,
>      return 0;
>  }
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

We need a better error code, maybe EINVAL or ENOENT ?

Other than that, it looks OK


> +    vgic_vcpu_inject_lpi(its->d, vlpi);
> +
> +    return 0;
> +}
> +
>  unsigned int vgic_v3_its_count(const struct domain *d)
>  {
>      struct host_its *hw_its;
> -- 
> 2.34.1
> 

