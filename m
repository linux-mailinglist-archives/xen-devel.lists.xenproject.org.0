Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7906B4056A
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 15:53:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106537.1457201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRRb-0005Bs-Lm; Tue, 02 Sep 2025 13:53:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106537.1457201; Tue, 02 Sep 2025 13:53:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utRRb-00058i-IO; Tue, 02 Sep 2025 13:53:07 +0000
Received: by outflank-mailman (input) for mailman id 1106537;
 Tue, 02 Sep 2025 13:53:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1utRRa-00058c-Gn
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 13:53:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utRRZ-002uVn-2E;
 Tue, 02 Sep 2025 13:53:05 +0000
Received: from [15.248.2.30] (helo=[10.24.67.22])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1utRRZ-00D9CB-2I;
 Tue, 02 Sep 2025 13:53:05 +0000
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
	bh=kcTVl3o3jzR8FQXiFJgeLUrhxG1eraOx7KCpBZrkHzQ=; b=1PB7FwObzUEvRW2d32m8lUzexS
	dNKvCnuSbI/UOcq6/YkzklkxmFkeqckg0bfJq/fmUBv0V7tXg1QuFZzI8jdCiyQ5xeIdPrX1r8+qD
	4Zx1mjRMw2sK3vqTy5GifDmJehCushtBBPbUSn9a3XzRKZQgrkfS7LAnRqj4lV/GUiYc=;
Message-ID: <862df090-cbe2-44e9-8c7a-733f3bfd46ad@xen.org>
Date: Tue, 2 Sep 2025 14:53:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/12] xen/arm: gicv3: modify ICH_LR_PHYSICAL_MASK to
 allow eSPI processing
Content-Language: en-GB
To: Leonid Komarianskyi <Leonid_Komarianskyi@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: "olekstysh@gmail.com" <olekstysh@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1756481577.git.leonid_komarianskyi@epam.com>
 <34b86693e1031a3ec786a38a0510f047c6c708da.1756481577.git.leonid_komarianskyi@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <34b86693e1031a3ec786a38a0510f047c6c708da.1756481577.git.leonid_komarianskyi@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/08/2025 17:06, Leonid Komarianskyi wrote:
> To properly deactivate guest interrupts and allow them to be retriggered
> after the initial trigger, the LR needs to be updated. The current

Why guest specifically? Isn't the problem the same if a physical eSPI is 
routed to dom0? IOW, shouldn't the explaination be:

"To properly deactivate physical eSPI routed to a domain and ..."

> implementation ignores interrupts outside the range specified by the mask
> 0x3FF, which only covers IRQ numbers up to 1023. To enable processing of
> eSPI interrupts, this patch updates the mask to 0x13FF.
> 
> Signed-off-by: Leonid Komarianskyi <leonid_komarianskyi@epam.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> Changes in V5:
> - no changes
> 
> Changes in V4:
> - added reviewed-by from Volodymyr Babchuk
> 
> Changes in V3:
> - no changes
> 
> Changes in V2:
> - remove unnecessary CONFIG_GICV3_ESPI ifdef guard
> ---
>   xen/arch/arm/include/asm/gic_v3_defs.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
> index 3370b4cd52..e70c1a5675 100644
> --- a/xen/arch/arm/include/asm/gic_v3_defs.h
> +++ b/xen/arch/arm/include/asm/gic_v3_defs.h
> @@ -211,7 +211,7 @@
>   #define ICH_LR_VIRTUAL_SHIFT         0
>   #define ICH_LR_CPUID_MASK            0x7
>   #define ICH_LR_CPUID_SHIFT           10
> -#define ICH_LR_PHYSICAL_MASK         0x3ff
> +#define ICH_LR_PHYSICAL_MASK         0x13ff

It took me a while to understand why we are using 0x13ff rather than 
0x1fff. It is because eSPI range is 4096 - 5519. So in theory, it would 
be ok to just add '0x1000'. But I think this is more confusion that it 
is worth. So I would rather prefer if we use 0x1fff as this matches the 
specification.

Cheers,

-- 
Julien Grall


