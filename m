Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA68AACC7C7
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 15:28:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004456.1384181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRgq-0005cG-Jd; Tue, 03 Jun 2025 13:28:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004456.1384181; Tue, 03 Jun 2025 13:28:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMRgq-0005aB-Fp; Tue, 03 Jun 2025 13:28:28 +0000
Received: by outflank-mailman (input) for mailman id 1004456;
 Tue, 03 Jun 2025 13:28:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMRgo-0005a3-IX
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 13:28:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMRgo-000DDd-0B;
 Tue, 03 Jun 2025 13:28:26 +0000
Received: from [15.248.2.27] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMRgo-005iP7-0l;
 Tue, 03 Jun 2025 13:28:25 +0000
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
	bh=VcHdTJplhFZR3c9y8nV6FDmR2+6su7oR4/sHzBnqvkE=; b=uejBsbj9zqLYEaKSPRqwSkCDsU
	0PYKxyzQR1IYxEImYO8jWxYMu2ubWsnK409+lTWVj8TVL3Aq+nG+BVITj0ze5n05BdB2AWJbSrlmk
	FOMyeu/Dvvxi5YoE8JDd8AUEn7LhdOR3C6sia+3ERoyzvZsj6UDfuXR4xPyGW54/fFAk=;
Message-ID: <f77ff27a-d6c8-4d18-9e90-4fcba693d7d8@xen.org>
Date: Tue, 3 Jun 2025 14:28:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] device-tree: Move Arm's static-memory feature to
 common
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250603100329.149851-1-michal.orzel@amd.com>
 <20250603100329.149851-4-michal.orzel@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250603100329.149851-4-michal.orzel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 03/06/2025 11:03, Michal Orzel wrote:
> This feature is arch agnostic, thus move it to common.
> 
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>

With one remark below:

Acked-by: Julien Grall <jgrall@amazon.com>

[...]

> diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/include/xen/static-memory.h
> similarity index 93%
> rename from xen/arch/arm/include/asm/static-memory.h
> rename to xen/include/xen/static-memory.h
> index a32a3c6553bc..e445aa80578c 100644
> --- a/xen/arch/arm/include/asm/static-memory.h
> +++ b/xen/include/xen/static-memory.h
> @@ -1,13 +1,14 @@
>   /* SPDX-License-Identifier: GPL-2.0-only */
>   
> -#ifndef __ASM_STATIC_MEMORY_H_
> -#define __ASM_STATIC_MEMORY_H_
> +#ifndef XEN_STATIC_MEMORY_H
> +#define XEN_STATIC_MEMORY_H
>   
>   #include <xen/fdt-kernel.h>
> -#include <xen/pfn.h>
>   
>   #ifdef CONFIG_STATIC_MEMORY
>   
> +#include <xen/pfn.h>

This change looks a bit odd in the context of the patch. I guess this is 
moved because the include should not be used if !CONFIG_STATIC_MEMORY? I 
am fine if you want to keep it here. But it would be worth mentioning in 
the commit message.

> +
>   static inline void init_staticmem_bank(const struct membank *bank)
>   {
>       mfn_t bank_start = _mfn(PFN_UP(bank->start));
> @@ -46,7 +47,7 @@ static inline void init_staticmem_pages(void) {};
>   
>   #endif /* CONFIG_STATIC_MEMORY */
>   
> -#endif /* __ASM_STATIC_MEMORY_H_ */
> +#endif /* XEN_STATIC_MEMORY_H */
>   
>   /*
>    * Local variables:

Cheers,

-- 
Julien Grall


