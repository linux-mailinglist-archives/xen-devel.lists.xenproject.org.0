Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 382686D10F5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 23:40:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516898.801766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phzzq-0005Iz-FJ; Thu, 30 Mar 2023 21:39:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516898.801766; Thu, 30 Mar 2023 21:39:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phzzq-0005H8-CX; Thu, 30 Mar 2023 21:39:50 +0000
Received: by outflank-mailman (input) for mailman id 516898;
 Thu, 30 Mar 2023 21:39:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phzzo-0005H2-K5
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 21:39:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzzo-0003Mq-2q; Thu, 30 Mar 2023 21:39:48 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzzn-0004M9-So; Thu, 30 Mar 2023 21:39:47 +0000
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
	bh=Lx8CLIoPc+LHQUQ6lLnLEpmlefRXvABATUFOcJlXwH8=; b=CYgZ+DBhDyEJTZ03E2b/0FgmLe
	SBxZoG3ftX9/kfa0nGyi8LE/zGnv3gBj87HGQVyOze7zrTDRcTqLfVv9KYixifdRVsbEXQuBFoQRz
	xzXGb1Ywrlgo4RgHNOPd187K+oyh7rmVCXp5v5gk7zC2f6xr89tKIfLEVA5/Zv2JIa/s=;
Message-ID: <2b7eb980-e3f8-c029-ca01-44709a294b2f@xen.org>
Date: Thu, 30 Mar 2023 22:39:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 10/11] xen/arm: p2m: Use the pa_range_info table to
 support Arm_32 and Arm_64
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-11-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230321140357.24094-11-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan:

Title: Shouldn't you remove the _ or use uppercase?

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
> Restructure the code so that one can use pa_range_info[] table for both
> ARM_32 as well as ARM_64. >
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
> Changes from -
> 
> v3 - 1. New patch introduced in v4.
> 2. Restructure the code such that pa_range_info[] is used both by ARM_32 as
> well as ARM_64.
> 
>   xen/arch/arm/p2m.c | 28 +++++++++++++++-------------
>   1 file changed, 15 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 948f199d84..f34b6e6f11 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -2265,22 +2265,16 @@ void __init setup_virt_paging(void)
>       /* Setup Stage 2 address translation */
>       register_t val = VTCR_RES1|VTCR_SH0_IS|VTCR_ORGN0_WBWA|VTCR_IRGN0_WBWA;
>   
> -#ifdef CONFIG_ARM_32
> -    if ( p2m_ipa_bits < 40 )
> -        panic("P2M: Not able to support %u-bit IPA at the moment\n",
> -              p2m_ipa_bits);
> -
> -    printk("P2M: 40-bit IPA\n");
> -    p2m_ipa_bits = 40;
> -    val |= VTCR_T0SZ(0x18); /* 40 bit IPA */
> -    val |= VTCR_SL0(0x1); /* P2M starts at first level */
> -#else /* CONFIG_ARM_64 */
>       static const struct {
>           unsigned int pabits; /* Physical Address Size */
>           unsigned int t0sz;   /* Desired T0SZ, minimum in comment */
>           unsigned int root_order; /* Page order of the root of the p2m */
>           unsigned int sl0;    /* Desired SL0, maximum in comment */
>       } pa_range_info[] __initconst = {
> +#ifdef CONFIG_ARM_32
> +        [0] = { 40,      24/*24*/,  1,          1 },
> +        [1] = { 0 } /* Invalid */
> +#else
>           /* T0SZ minimum and SL0 maximum from ARM DDI 0487H.a Table D5-6 */
>           /*      PA size, t0sz(min), root-order, sl0(max) */
>           [0] = { 32,      32/*32*/,  0,          1 },
> @@ -2291,11 +2285,13 @@ void __init setup_virt_paging(void)
>           [5] = { 48,      16/*16*/,  0,          2 },
>           [6] = { 52,      12/*12*/,  4,          2 },
>           [7] = { 0 }  /* Invalid */
> +#endif
>       };
>   
>       unsigned int i;
>       unsigned int pa_range = 0x10; /* Larger than any possible value */
>   
> +#ifdef CONFIG_ARM_64
>       /*
>        * Restrict "p2m_ipa_bits" if needed. As P2M table is always configured
>        * with IPA bits == PA bits, compare against "pabits".
> @@ -2309,6 +2305,9 @@ void __init setup_virt_paging(void)
>        */
>       if ( system_cpuinfo.mm64.vmid_bits == MM64_VMID_16_BITS_SUPPORT )
>           max_vmid = MAX_VMID_16_BIT;
> +#else
> +    p2m_ipa_bits = PADDR_BITS;
> +#endif
>   
>       /* Choose suitable "pa_range" according to the resulted "p2m_ipa_bits". */
>       for ( i = 0; i < ARRAY_SIZE(pa_range_info); i++ )
> @@ -2324,14 +2323,13 @@ void __init setup_virt_paging(void)
>       if ( pa_range >= ARRAY_SIZE(pa_range_info) || !pa_range_info[pa_range].pabits )
>           panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", pa_range);
>   
> -    val |= VTCR_PS(pa_range);
> +#ifdef CONFIG_ARM_64
>       val |= VTCR_TG0_4K;
> +    val |= VTCR_PS(pa_range);
Why is this moved rather than adding #ifdef a line before?

>   
>       /* Set the VS bit only if 16 bit VMID is supported. */
>       if ( MAX_VMID == MAX_VMID_16_BIT )
>           val |= VTCR_VS;
> -    val |= VTCR_SL0(pa_range_info[pa_range].sl0);
> -    val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
>   
>       p2m_root_order = pa_range_info[pa_range].root_order;
>       p2m_root_level = 2 - pa_range_info[pa_range].sl0;
> @@ -2342,6 +2340,10 @@ void __init setup_virt_paging(void)
>              pa_range_info[pa_range].pabits,
>              ( MAX_VMID == MAX_VMID_16_BIT ) ? 16 : 8);
>   #endif
> +
> +    val |= VTCR_SL0(pa_range_info[pa_range].sl0);
> +    val |= VTCR_T0SZ(pa_range_info[pa_range].t0sz);
> +
>       printk("P2M: %d levels with order-%d root, VTCR 0x%"PRIregister"\n",
>              4 - P2M_ROOT_LEVEL, P2M_ROOT_ORDER, val);
>   

Cheers,

-- 
Julien Grall

