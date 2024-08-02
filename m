Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E36945EC9
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 15:38:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.771207.1181779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsUG-0008OR-Tq; Fri, 02 Aug 2024 13:38:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 771207.1181779; Fri, 02 Aug 2024 13:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZsUG-0008MA-Qz; Fri, 02 Aug 2024 13:38:28 +0000
Received: by outflank-mailman (input) for mailman id 771207;
 Fri, 02 Aug 2024 13:38:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sZsUF-0008M4-Cp
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 13:38:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sZsUB-0006IU-Oe; Fri, 02 Aug 2024 13:38:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sZsUB-0004kg-IV; Fri, 02 Aug 2024 13:38:23 +0000
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
	bh=0Mnt8qb6UUrag6u8E+Ls9M3d32DHCKoh+4f+CmWSTiw=; b=HS7mzkHP5yHFAQ3VmIwaVH3Eu4
	Nf50FgEPVHbBEMypfkFRBcjpNdjmCloSMWVs/cFUv//Jw7kqaAU1hpCmlnmLowc+o23QlRF/LSLfk
	OBiZvBEeRww15RORpSXOCl7EThD8s2ZMM7jeQ0OEkFl34HbIg4W0O00imwBOjl98DB5U=;
Message-ID: <3e6340a5-1eea-4784-96c1-980419a3755d@xen.org>
Date: Fri, 2 Aug 2024 14:38:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] xen: arm: Enclose access to EL2 MMU specific
 registers under CONFIG_MMU
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
 <20240802121443.1531693-5-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240802121443.1531693-5-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/08/2024 13:14, Ayan Kumar Halder wrote:
> All the EL2 MMU specific registers are enclosed within CONFIG_MMU.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/traps.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
> index aac6c599f8..766aacee77 100644
> --- a/xen/arch/arm/traps.c
> +++ b/xen/arch/arm/traps.c
> @@ -919,12 +919,14 @@ static void _show_registers(const struct cpu_user_regs *regs,
>   #endif
>       }
>       printk("  VTCR_EL2: %"PRIregister"\n", READ_SYSREG(VTCR_EL2));
> -    printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);

Can you #ifdef the field vttrb_el2 if it is not meant to be used?

>       printk("\n");
>   
>       printk(" SCTLR_EL2: %"PRIregister"\n", READ_SYSREG(SCTLR_EL2));
>       printk("   HCR_EL2: %"PRIregister"\n", READ_SYSREG(HCR_EL2));
> +#ifdef CONFIG_MMU
> +    printk(" VTTBR_EL2: %016"PRIx64"\n", ctxt->vttbr_el2);

VTCR_EL2 and VTTBR_EL2 needs to be read together. So I would prefer the 
printk is not moved.

>       printk(" TTBR0_EL2: %016"PRIx64"\n", READ_SYSREG64(TTBR0_EL2));
> +#endif
 >       printk("\n");>       printk("   ESR_EL2: %"PRIregister"\n", 
regs->hsr);
>       printk(" HPFAR_EL2: %"PRIregister"\n", READ_SYSREG(HPFAR_EL2));
> @@ -956,7 +958,9 @@ void show_registers(const struct cpu_user_regs *regs)
>       if ( guest_mode(regs) && is_32bit_domain(current->domain) )
>           ctxt.ifsr32_el2 = READ_SYSREG(IFSR32_EL2);
>   #endif
> +#ifdef CONFIG_MMU
>       ctxt.vttbr_el2 = READ_SYSREG64(VTTBR_EL2);
> +#endif
>   
>       _show_registers(regs, &ctxt, guest_mode(regs), current);
>   }

Cheers,

-- 
Julien Grall


