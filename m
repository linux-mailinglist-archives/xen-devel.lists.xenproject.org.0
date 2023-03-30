Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9D86D10EC
	for <lists+xen-devel@lfdr.de>; Thu, 30 Mar 2023 23:34:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516895.801756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phzuI-0004fc-QX; Thu, 30 Mar 2023 21:34:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516895.801756; Thu, 30 Mar 2023 21:34:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phzuI-0004cq-NT; Thu, 30 Mar 2023 21:34:06 +0000
Received: by outflank-mailman (input) for mailman id 516895;
 Thu, 30 Mar 2023 21:34:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1phzuH-0004ck-Fi
 for xen-devel@lists.xenproject.org; Thu, 30 Mar 2023 21:34:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzuG-0003Aj-Vv; Thu, 30 Mar 2023 21:34:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1phzuG-00044Y-Of; Thu, 30 Mar 2023 21:34:04 +0000
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
	bh=g6jKfMlR3xj6B5fnmWjCX7uvOE/PmharSAcD9GAXHNs=; b=1DTtP4tefkIu/wSN8FDmdo6Q+n
	30dJhAaKNZ+4lzOZA9nXPgCXGaG6j+meWZHcSYYDSwpyd4h21XCgypwbQUib85gCMolayLTvHz2Eg
	fJgMYi/6H7ZXaLvMEW9/5mk8xYIVfEUELvZM7OG+xQdWIQI3XJmuMe12cemdetgnlSa4=;
Message-ID: <cf65c4cb-ff3f-f8a3-28ec-abb1ea765468@xen.org>
Date: Thu, 30 Mar 2023 22:34:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [XEN v4 09/11] xen/arm: Restrict zeroeth_table_offset for ARM_64
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-10-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230321140357.24094-10-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 21/03/2023 14:03, Ayan Kumar Halder wrote:
> When 32 bit physical addresses are used (ie ARM_PA_32=y),
> "va >> ZEROETH_SHIFT" causes an overflow.
> Also, there is no zeroeth level page table on Arm 32-bit.
> 
> Also took the opportunity to clean up dump_pt_walk(). One could use
> DECLARE_OFFSETS() macro instead of declaring the declaring an array
> of page table offsets.
> 
> Acked-by: Julien Grall <jgrall@amazon.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

This should be re-ordered so the signed-off-by tag is first.

> ---
> Changes from -
> 
> v1 - Removed the duplicate declaration for DECLARE_OFFSETS.
> 
> v2 - 1. Reworded the commit message.
> 2. Use CONFIG_ARM_PA_32 to restrict zeroeth_table_offset.
> 
> v3 - 1. Added R-b and Ack.
> 
>   xen/arch/arm/include/asm/lpae.h | 4 ++++
>   xen/arch/arm/mm.c               | 7 +------
>   2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index 3fdd5d0de2..0d40388f93 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -259,7 +259,11 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
>   #define first_table_offset(va)  TABLE_OFFSET(first_linear_offset(va))
>   #define second_table_offset(va) TABLE_OFFSET(second_linear_offset(va))
>   #define third_table_offset(va)  TABLE_OFFSET(third_linear_offset(va))
> +#ifdef CONFIG_ARM_PA_BITS_32

I know I already acked this patch. However, looking at the previous 
patch, you are using CONFIG_PHYS_ADDR_T_32 but here you are using 
CONFIG_ARM_PA_BITS_32.

It is not fully clear to me why you differ in the #ifdef approach. Can 
you clarify?

> +#define zeroeth_table_offset(va)  0
> +#else
>   #define zeroeth_table_offset(va)  TABLE_OFFSET(zeroeth_linear_offset(va))
> +#endif
>   
>   /*
>    * Macros to define page-tables:
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index d8b43ef38c..41e0896b0f 100644
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

