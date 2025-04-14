Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C182A8801E
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 14:12:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950050.1346484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ifd-00089S-Cx; Mon, 14 Apr 2025 12:12:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950050.1346484; Mon, 14 Apr 2025 12:12:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4Ifd-00087m-9d; Mon, 14 Apr 2025 12:12:13 +0000
Received: by outflank-mailman (input) for mailman id 950050;
 Mon, 14 Apr 2025 12:12:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1u4Ifc-00087f-3I
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 12:12:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4Ifb-00Epy6-2e;
 Mon, 14 Apr 2025 12:12:11 +0000
Received: from [143.198.24.140] (helo=[100.81.22.8])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1u4Ifb-00DKyC-1O;
 Mon, 14 Apr 2025 12:12:11 +0000
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
	bh=d/ombLP1E1s+LgCWkSj5TbfMyRGdVPCmWTVbtvpBtPw=; b=rTn7hUIsUSfAcECGPNQCLrUnod
	5uD+66bViJtqk6VHY+B+PhQ11s1mchysg0fksCGaDUPZTCEOsfUIKfvbfgdgBlg9PpQM7BXaVtu2t
	oFDs1fOONGuJvdEvhQXzZVPb1br3XENmDJm2GLqyXx3qxGdDo3sbH0jIVxETn5WlnnnM=;
Message-ID: <923a2fc0-4eeb-4e09-a56d-7471a56fe3bf@xen.org>
Date: Mon, 14 Apr 2025 21:12:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] arm/mpu: Implement setup_mpu for MPU system
Content-Language: en-GB
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250411145655.140667-1-luca.fancellu@arm.com>
 <20250411145655.140667-8-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250411145655.140667-8-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

On 11/04/2025 23:56, Luca Fancellu wrote:
> Implement the function setup_mpu that will logically track the MPU
> regions defined by hardware registers, start introducing data
> structures and functions to track the status from the C world.
> 
> The xen_mpumap_mask bitmap is used to track which MPU region are
> enabled at runtime.
> 
> This function is called from setup_mm() which full implementation
> will be provided in a later stage.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> v3 changes:
>   - Moved PRENR_MASK define to common.
> ---
> ---
>   xen/arch/arm/include/asm/mpu.h |  2 ++
>   xen/arch/arm/mpu/mm.c          | 49 +++++++++++++++++++++++++++++++++-
>   2 files changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
> index eba5086cde97..77d0566f9780 100644
> --- a/xen/arch/arm/include/asm/mpu.h
> +++ b/xen/arch/arm/include/asm/mpu.h
> @@ -20,6 +20,8 @@
>   #define NUM_MPU_REGIONS_MASK    (NUM_MPU_REGIONS - 1)
>   #define MAX_MPU_REGIONS         NUM_MPU_REGIONS_MASK
>   
> +#define PRENR_MASK  GENMASK(31, 0)
> +
>   /* Access permission attributes. */
>   /* Read/Write at EL2, No Access at EL1/EL0. */
>   #define AP_RW_EL2 0x0
> diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
> index 635d1f5a2ba0..e0a40489a7fc 100644
> --- a/xen/arch/arm/mpu/mm.c
> +++ b/xen/arch/arm/mpu/mm.c
> @@ -14,6 +14,17 @@
>   
>   struct page_info *frame_table;
>   
> +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
 > +uint8_t __ro_after_init max_xen_mpumap;

Are this variable and ...

> +
> +/*
> + * Bitmap xen_mpumap_mask is to record the usage of EL2 MPU memory regions.
> + * Bit 0 represents MPU memory region 0, bit 1 represents MPU memory
> + * region 1, ..., and so on.
> + * If a MPU memory region gets enabled, set the according bit to 1.
> + */
> +DECLARE_BITMAP(xen_mpumap_mask, MAX_MPU_REGIONS);

... this one meant to be global? If yes, then they need to have a 
declaration in the header. If not, then you want to add 'static'.

 > +
>   /* EL2 Xen MPU memory region mapping table. */
>   pr_t xen_mpumap[MAX_MPU_REGIONS];
>   
> @@ -222,9 +233,45 @@ pr_t pr_of_xenaddr(paddr_t base, paddr_t limit, unsigned attr)
>       return region;
>   }
>   
> +/*
> + * The code in this function needs to track the regions programmed in
> + * arm64/mpu/head.S
> + */
> +static void __init setup_mpu(void)
> +{
> +    register_t prenr;
> +    unsigned int i = 0;
> +
> +    /*
> +     * MPUIR_EL2.Region[0:7] identifies the number of regions supported by
> +     * the EL2 MPU.
> +     */
> +    max_xen_mpumap = (uint8_t)(READ_SYSREG(MPUIR_EL2) & NUM_MPU_REGIONS_MASK);
> +
> +    /* PRENR_EL2 has the N bit set if the N region is enabled, N < 32 */
> +    prenr = (READ_SYSREG(PRENR_EL2) & PRENR_MASK);
> +
> +    /*
> +     * Set the bitfield for regions enabled in assembly boot-time.
> +     * This code works under the assumption that the code in head.S has
> +     * allocated and enabled regions below 32 (N < 32).
> +     
This is a bit fragile. I think it would be better if the bitmap is set 
by head.S as we add the regions. Same for ...

> +    while ( prenr > 0 )
> +    {
> +        if (prenr & 0x1)
> +        {
> +            set_bit(i, xen_mpumap_mask);
> +            read_protection_region(&xen_mpumap[i], i);

... xen_mpumap.

> +        }
> +
> +        prenr >>= 1;
> +        i++;
> +    }
> +}
> +
>   void __init setup_mm(void)
>   {
> -    BUG_ON("unimplemented");
> +    setup_mpu();
 >   }>
>   int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)

Cheers,


-- 
Julien Grall


