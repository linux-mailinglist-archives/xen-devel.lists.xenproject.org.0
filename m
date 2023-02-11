Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89468692FF0
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 11:19:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493861.763909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQmxq-0000ss-P7; Sat, 11 Feb 2023 10:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493861.763909; Sat, 11 Feb 2023 10:18:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQmxq-0000pn-Lt; Sat, 11 Feb 2023 10:18:38 +0000
Received: by outflank-mailman (input) for mailman id 493861;
 Sat, 11 Feb 2023 10:18:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQmxo-0000pd-P5
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 10:18:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQmxo-00042h-7g; Sat, 11 Feb 2023 10:18:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQmxo-0004so-18; Sat, 11 Feb 2023 10:18:36 +0000
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
	bh=cVJAihXUdoT1WrjTuvBVuBdjG71ZehDkZkPrX9UT74U=; b=bPTFZ/XdVjU8MoS998gxffCPnY
	epC5u1uBCUCpHTngM+PPoAsDQFgDjOO1C6qTssV4BjLt1msagjRgP1qZa31XFXvcY931spntSqXs4
	7iJmu0xfCwUJRBbPdL2psUSvh6INKouWRIx3itRjgsrtzDzgWMPgHHuIEIDecJe1Ldis=;
Message-ID: <c460a77c-8271-5041-6136-4a24fb57a892@xen.org>
Date: Sat, 11 Feb 2023 10:18:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230208120529.22313-1-ayan.kumar.halder@amd.com>
 <20230208120529.22313-9-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v3 8/9] xen/arm: Restrict zeroeth_table_offset for ARM_64
In-Reply-To: <20230208120529.22313-9-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/02/2023 12:05, Ayan Kumar Halder wrote:
> When 32 bit physical addresses are used (ie ARM_PA_32=y),
> "va >> ZEROETH_SHIFT" causes an overflow.
> Also, there is no zeroeth level page table on Arm 32-bit.
> 
> Also took the opportunity to clean up dump_pt_walk(). One could use
> DECLARE_OFFSETS() macro instead of declaring the declaring an array
> of page table offsets.

Technically this is unrelated to the goal of the patch. So this should 
have been split in a separate patch.

No need to split it this time, but in the future please consider to 
split a patch when a change is unrelated.

In general, I would only consider to bundle clean-up if all the below 
applies:
   1) the patch is not doing code movement
   2) the change is simple (e.g. typo, coding style fix)
   3) the change is in the vicinity of the the rest of code (i.e. it 
would be visible in the diff).

> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> Changes from -
> 
> v1 - Removed the duplicate declaration for DECLARE_OFFSETS.
> 
> v2 - 1. Reworded the commit message.
> 2. Use CONFIG_ARM_PA_32 to restrict zeroeth_table_offset.
> 
>   xen/arch/arm/include/asm/lpae.h | 4 ++++
>   xen/arch/arm/mm.c               | 7 +------
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index 3fdd5d0de2..998edeed6e 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
>   #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
>   #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
>   #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
> +#ifdef CONFIG_ARM_PA_32
> +#define zeroeth_table_offset(va)  0
> +#else
>   #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
> +#endif
>   
>   /*
>    * Macros to define page-tables:
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index b99806af99..44942c6a4f 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -221,12 +221,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>   {
>       static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
>       const mfn_t root_mfn = maddr_to_mfn(ttbr);
> -    const unsigned int offsets[4] = {
> -        zeroeth_table_offset(addr),
> -        first_table_offset(addr),
> -        second_table_offset(addr),
> -        third_table_offset(addr)
> -    };
> +    DECLARE_OFFSETS(offsets, addr);
>       lpae_t pte, *mapping;
>       unsigned int level, root_table;
>   

Cheers,

-- 
Julien Grall

