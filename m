Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88BCC64E968
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 11:23:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464348.722714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67sS-0007sR-7t; Fri, 16 Dec 2022 10:23:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464348.722714; Fri, 16 Dec 2022 10:23:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p67sS-0007pX-5J; Fri, 16 Dec 2022 10:23:40 +0000
Received: by outflank-mailman (input) for mailman id 464348;
 Fri, 16 Dec 2022 10:23:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p67sQ-0007pR-EF
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 10:23:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67sQ-0008S5-2b; Fri, 16 Dec 2022 10:23:38 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p67sP-0001Up-Sk; Fri, 16 Dec 2022 10:23:38 +0000
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
	bh=jVvl2gUL1Q0fej6T7k6tRIZLzgk8Hl/KnJKEkJQ80/8=; b=2tpGELCVGzVXzV8XGZ/EqwJI8R
	jPipcE6p1B5g9qtHADzEoUQXGO3OLGu4mcQE8wbYbjh+SmUwxrVx2ReT5Jh9yy2RNrgHHp55Bvafp
	RBhtVqQ8YrYf+HTxAf+Bm0RMcWZIEiaYuMd4etSi+QaPgyfDv0Lf4xNnkLl5RNFXsUuA=;
Message-ID: <45f897bc-3700-d3f0-4f4b-43598c0b8560@xen.org>
Date: Fri, 16 Dec 2022 10:23:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [XEN v1 8/9] xen/arm: Other adaptations required to support 32bit
 paddr
Content-Language: en-US
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-9-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221215193245.48314-9-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Each adaptations are distinct, so I would prefer if they are in in 
separate patch.

This will also make clear which components you touched because I would 
be surprised if this is really the only place where we need adaptation. 
Maybe that's because you didn't compile everything (which is fine).

On 15/12/2022 19:32, Ayan Kumar Halder wrote:
> 1. Supersections are supported only for paddr greater than 32 bits.

Two questions:
  * Can you outline why we can't keep the code around?
  * Can you give a pointer to the Arm Arm that says supersection is not 
supported?

> 2. Use 0 wherever physical addresses are right shifted for 32 bit > 3. Use PRIx64 to print u64
It would be good to explain that the current use was buggy because we 
are printing a PTE and not a physical address.

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/guest_walk.c          | 2 ++
>   xen/arch/arm/mm.c                  | 2 +-
>   xen/drivers/passthrough/arm/smmu.c | 5 +++++
>   3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/guest_walk.c b/xen/arch/arm/guest_walk.c
> index 43d3215304..4384068285 100644
> --- a/xen/arch/arm/guest_walk.c
> +++ b/xen/arch/arm/guest_walk.c
> @@ -149,6 +149,7 @@ static bool guest_walk_sd(const struct vcpu *v,
>               mask = (1ULL << L1DESC_SECTION_SHIFT) - 1;
>               *ipa = ((paddr_t)pte.sec.base << L1DESC_SECTION_SHIFT) | (gva & mask);
>           }
> +#ifndef CONFIG_ARM_PA_32

A "malicious" guest can still set that bit. So now, you will return from 
guest_walk_sd() with 'ipa' not set at all.

If this is effectively not supported, then we should return 'false' 
rather than claiming the translation was successful.

>           else /* Supersection */
>           {
>               mask = (1ULL << L1DESC_SUPERSECTION_SHIFT) - 1;
> @@ -157,6 +158,7 @@ static bool guest_walk_sd(const struct vcpu *v,
>               *ipa |= (paddr_t)(pte.supersec.extbase1) << L1DESC_SUPERSECTION_EXT_BASE1_SHIFT;
>               *ipa |= (paddr_t)(pte.supersec.extbase2) << L1DESC_SUPERSECTION_EXT_BASE2_SHIFT;
>           }
> +#endif
>   
>           /* Set permissions so that the caller can check the flags by herself. */
>           if ( !pte.sec.ro )
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index be939fb106..3bc9894008 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -229,7 +229,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>   
>           pte = mapping[offsets[level]];
>   
> -        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
> +        printk("%s[0x%03x] = 0x%"PRIx64"\n",
>                  level_strs[level], offsets[level], pte.bits);
>   
>           if ( level == 3 || !pte.walk.valid || !pte.walk.table )
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 5ae180a4cc..522a478ccf 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1184,7 +1184,12 @@ static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain)
>   
>   	reg = (p2maddr & ((1ULL << 32) - 1));
>   	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_LO);
> +
> +#ifndef CONFIG_ARM_PA_32
>   	reg = (p2maddr >> 32);
> +#else
> +	reg = 0;
> +#endif

I think it would be better if we implement writeq(). This will also 
avoid the now strange ((1ULL << 32) - 1) when p2maddr is a paddr_t.

>   	if (stage1)
>   		reg |= ARM_SMMU_CB_ASID(cfg) << TTBRn_HI_ASID_SHIFT;
>   	writel_relaxed(reg, cb_base + ARM_SMMU_CB_TTBR0_HI);

Cheers,

-- 
Julien Grall

