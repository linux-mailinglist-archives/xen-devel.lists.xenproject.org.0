Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C05608BB7
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 12:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428194.678109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omBsk-0005wj-W0; Sat, 22 Oct 2022 10:37:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428194.678109; Sat, 22 Oct 2022 10:37:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omBsk-0005tK-TD; Sat, 22 Oct 2022 10:37:34 +0000
Received: by outflank-mailman (input) for mailman id 428194;
 Sat, 22 Oct 2022 10:37:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omBsj-0005tE-Ik
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 10:37:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omBsj-0000ni-6Z; Sat, 22 Oct 2022 10:37:33 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omBsj-00074K-1F; Sat, 22 Oct 2022 10:37:33 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=2CduYiqWsULcvnkxSKtwhciMIeBevBYKrPQA75rigkE=; b=rRkciWRoR+G6uGMhmJMSMVimEt
	PePxpoqTgEcN09LupVS00wRZYqfINGbmyZlNyjl50SWuzrjnghuj9Edrn7DnSM51qzZYGXS4pdgfK
	DMINF3G3TLZAaaHr3gM10aOz7vIpJDdGcI/thgkHFvv9PMuDoi1gGLupXJMjP/y9EKcE=;
Message-ID: <d784a0e7-c9c4-a87d-2aee-ac6554c61b26@xen.org>
Date: Sat, 22 Oct 2022 11:37:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-6-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 05/12] Arm: GICv3: Emulate GICR_PENDBASER and
 GICR_PROPBASER on AArch32
In-Reply-To: <20221021153128.44226-6-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

Title: To me, it reads as if you provide a brand new code for emulating 
the registers. However, below, you are only fixing the code. So how about:

"xen/arm: gicv3: Fix GICR_{PENDBASER, PROPBASER} emulation on 32-bit host"

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> 'unsigned long long' is defined as 64 bit across both aarch32 and aarch64.
> So, use 'ULL' for 64 bit word instead of UL which is 32 bits for aarch32.
> GICR_PENDBASER and GICR_PROPBASER both are 64 bit registers.
> 
> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
> ---
>   xen/arch/arm/include/asm/gic_v3_defs.h | 16 ++++++++--------
>   xen/arch/arm/vgic-v3.c                 |  6 ++++--
>   2 files changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 728e28d5e5..48a1bc401e 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -134,15 +134,15 @@
>   
>   #define GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT         56
>   #define GICR_PROPBASER_OUTER_CACHEABILITY_MASK               \
> -        (7UL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
> +        (7ULL << GICR_PROPBASER_OUTER_CACHEABILITY_SHIFT)
>   #define GICR_PROPBASER_SHAREABILITY_SHIFT               10
>   #define GICR_PROPBASER_SHAREABILITY_MASK                     \
> -        (3UL << GICR_PROPBASER_SHAREABILITY_SHIFT)
> +        (3ULL << GICR_PROPBASER_SHAREABILITY_SHIFT)
>   #define GICR_PROPBASER_INNER_CACHEABILITY_SHIFT         7
>   #define GICR_PROPBASER_INNER_CACHEABILITY_MASK               \
> -        (7UL << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT)
> +        (7ULL << GICR_PROPBASER_INNER_CACHEABILITY_SHIFT)
>   #define GICR_PROPBASER_RES0_MASK                             \
> -        (GENMASK(63, 59) | GENMASK(55, 52) | GENMASK(6, 5))
> +        (GENMASK_ULL(63, 59) | GENMASK_ULL(55, 52) | GENMASK_ULL(6, 5))
>   
>   #define GICR_PENDBASER_SHAREABILITY_SHIFT               10
>   #define GICR_PENDBASER_INNER_CACHEABILITY_SHIFT         7
> @@ -152,11 +152,11 @@
>   #define GICR_PENDBASER_INNER_CACHEABILITY_MASK               \
>   	(7UL << GICR_PENDBASER_INNER_CACHEABILITY_SHIFT)
>   #define GICR_PENDBASER_OUTER_CACHEABILITY_MASK               \
> -        (7UL << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT)
> -#define GICR_PENDBASER_PTZ                              BIT(62, UL)
> +        (7ULL << GICR_PENDBASER_OUTER_CACHEABILITY_SHIFT)
> +#define GICR_PENDBASER_PTZ                              BIT(62, ULL)
>   #define GICR_PENDBASER_RES0_MASK                             \
> -        (BIT(63, UL) | GENMASK(61, 59) | GENMASK(55, 52) |  \
> -         GENMASK(15, 12) | GENMASK(6, 0))
> +        (BIT(63, ULL) | GENMASK_ULL(61, 59) | GENMASK_ULL(55, 52) |  \
> +         GENMASK_ULL(15, 12) | GENMASK_ULL(6, 0))rer
>   
>   #define DEFAULT_PMR_VALUE            0xff
>   
> diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
> index d86b41a39f..9f31360f56 100644
> --- a/xen/arch/arm/vgic-v3.c
> +++ b/xen/arch/arm/vgic-v3.c
> @@ -254,14 +254,16 @@ static int __vgic_v3_rdistr_rd_mmio_read(struct vcpu *v, mmio_info_t *info,
>       case VREG64(GICR_PENDBASER):
>       {
>           unsigned long flags;
> +        uint64_t value;
>   
>           if ( !v->domain->arch.vgic.has_its )
>               goto read_as_zero_64;
>           if ( !vgic_reg64_check_access(dabt) ) goto bad_width;
>   
>           spin_lock_irqsave(&v->arch.vgic.lock, flags);
> -        *r = vreg_reg64_extract(v->arch.vgic.rdist_pendbase, info);
> -        *r &= ~GICR_PENDBASER_PTZ;       /* WO, reads as 0 */
> +        value = v->arch.vgic.rdist_pendbase;
> +        value &= ~GICR_PENDBASER_PTZ;    /* WO, reads as 0 */
> +        *r = vreg_reg64_extract(value, info);

The commit message suggests the code would only be replacing "UL" with 
"ULL". But here, you are doing more than that. The code is re-order so 
PTZ is cleared before extracting the value.

I agree the existing code was wrong if the guest was using 32-bit access 
and your new approach is correct. Can you split the change in a separate 
patch? (Please add a Fixes tag as well).

>           spin_unlock_irqrestore(&v->arch.vgic.lock, flags);
>           return 1;
>       }

Cheers,

-- 
Julien Grall

