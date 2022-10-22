Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C55F5608C60
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 13:13:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428222.678172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCR8-000473-Oe; Sat, 22 Oct 2022 11:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428222.678172; Sat, 22 Oct 2022 11:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omCR8-00045D-KP; Sat, 22 Oct 2022 11:13:06 +0000
Received: by outflank-mailman (input) for mailman id 428222;
 Sat, 22 Oct 2022 11:13:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omCR6-000457-OY
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 11:13:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCR6-0001Pq-BT; Sat, 22 Oct 2022 11:13:04 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omCR6-0000OE-5W; Sat, 22 Oct 2022 11:13:04 +0000
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
	bh=MmJ6OPiOh2JUzzqLxy83W312Aw1c00QrFfmDrVzWh/g=; b=VhRCSO1b2LG2548Ydlurc2tsoq
	x4qxkDH0Fj8MXU0ditNWZY1CXQhtyQKdzTZb6ByDhUnPcYr0hSsdx36BqWFmut5fFLYJjjnyu0DAl
	p6BzE8Y4U1bp4AyCLG3Pdkxy5gFJIQJodVGR+Ni9CPaO1r6Bk/8NYibZvfjy7jRRntyk=;
Message-ID: <491953d9-af20-0f9a-429c-c1342efc77d3@xen.org>
Date: Sat, 22 Oct 2022 12:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Ayan Kumar Halder <ayankuma@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-11-ayankuma@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [RFC PATCH v1 10/12] Arm: GICv3: Use ULL instead of UL for 64bits
In-Reply-To: <20221021153128.44226-11-ayankuma@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 21/10/2022 16:31, Ayan Kumar Halder wrote:
> "unsigned long long" is defined as 64 bits on AArch64 and AArch32
> Thus, one should this instead of "unsigned long" which is 32 bits
> on AArch32.
> 
> Also use 'PRIu64' instead of 'lx' to print uint64_t.

This is not quite a simple change of type. Now, the values will be 
printed in decimal rather than hexadecimal. Any particular reason why 
you didn't go with PRIx64?

[...]

> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 87115f8b25..3a24bd4825 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -195,7 +195,7 @@
>   
>   #define ICH_SGI_IRQMODE_SHIFT        40
>   #define ICH_SGI_IRQMODE_MASK         0x1
> -#define ICH_SGI_TARGET_OTHERS        1UL
> +#define ICH_SGI_TARGET_OTHERS        1ULL
>   #define ICH_SGI_TARGET_LIST          0
>   #define ICH_SGI_IRQ_SHIFT            24
>   #define ICH_SGI_IRQ_MASK             0xf
> diff --git a/xen/arch/arm/include/asm/gic_v3_its.h b/xen/arch/arm/include/asm/gic_v3_its.h
> index fae3f6ecef..5ae50b18ea 100644
> --- a/xen/arch/arm/include/asm/gic_v3_its.h
> +++ b/xen/arch/arm/include/asm/gic_v3_its.h
> @@ -38,7 +38,7 @@
>   #define GITS_PIDR2                      GICR_PIDR2
>   
>   /* Register bits */
> -#define GITS_VALID_BIT                  BIT(63, UL)
> +#define GITS_VALID_BIT                  BIT(63, ULL)
>   
>   #define GITS_CTLR_QUIESCENT             BIT(31, UL)
>   #define GITS_CTLR_ENABLE                BIT(0, UL)
> diff --git a/xen/arch/arm/vgic-v3-its.c b/xen/arch/arm/vgic-v3-its.c
> index 58d939b85f..2b7bb17800 100644
> --- a/xen/arch/arm/vgic-v3-its.c
> +++ b/xen/arch/arm/vgic-v3-its.c
> @@ -96,13 +96,13 @@ typedef uint16_t coll_table_entry_t;
>    * in the lowest 5 bits of the word.
>    */
>   typedef uint64_t dev_table_entry_t;
> -#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK(51, 8))
> +#define DEV_TABLE_ITT_ADDR(x) ((x) & GENMASK_ULL(51, 8))
>   #define DEV_TABLE_ITT_SIZE(x) (BIT(((x) & GENMASK(4, 0)) + 1, UL))
>   #define DEV_TABLE_ENTRY(addr, bits)                     \
>           (((addr) & GENMASK(51, 8)) | (((bits) - 1) & GENMASK(4, 0)))
>   
>   #define GITS_BASER_RO_MASK       (GITS_BASER_TYPE_MASK | \
> -                                  (0x1fL << GITS_BASER_ENTRY_SIZE_SHIFT))
> +                                  (0x1fLL << GITS_BASER_ENTRY_SIZE_SHIFT))

While you are modifying it, shouldn't this be ULL?

Cheers,

-- 
Julien Grall

