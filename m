Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CB1670DFB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 00:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480014.744165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvhg-0003qT-HQ; Tue, 17 Jan 2023 23:49:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480014.744165; Tue, 17 Jan 2023 23:49:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHvhg-0003nE-Dv; Tue, 17 Jan 2023 23:49:20 +0000
Received: by outflank-mailman (input) for mailman id 480014;
 Tue, 17 Jan 2023 23:49:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHvhf-0003n8-7d
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 23:49:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHvhf-0007Tn-0P; Tue, 17 Jan 2023 23:49:19 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHvhe-0004C2-Rn; Tue, 17 Jan 2023 23:49:18 +0000
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
	bh=GmKGGz/kAkBzBcQfubJ9rBng+6oHr9IVOCK8rMVVnTs=; b=6tzmBDNsjaCju8v4G7kX1fzjVQ
	5NiXqQle5to/o6HGdvax8IlcM5fzkE18YFHEXKgJzAonmOgSrdrepnjE+662Tw7u11D2GaquSylpW
	lP6fNWeV+YULLfRdbQ7EuKQSpcW4AmxzvUb8KDMAaPr+QWfgJKMuPsSoafoTUylOvkN0=;
Message-ID: <09e4c2ef-eddf-e798-573b-68744a061d68@xen.org>
Date: Tue, 17 Jan 2023 23:49:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 08/40] xen/arm: use PA == VA for
 EARLY_UART_VIRTUAL_ADDRESS on Armv-8R
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-9-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-9-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 13/01/2023 05:28, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> There is no VMSA support on Armv8-R AArch64, so we can not map early
> UART to FIXMAP_CONSOLE. Instead, we use PA == VA to define
> EARLY_UART_VIRTUAL_ADDRESS on Armv8-R AArch64.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Your signed-off-by is missing.

> ---
> 1. New patch
> ---
>   xen/arch/arm/include/asm/early_printk.h | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
> index c5149b2976..44a230853f 100644
> --- a/xen/arch/arm/include/asm/early_printk.h
> +++ b/xen/arch/arm/include/asm/early_printk.h
> @@ -15,10 +15,22 @@
>   
>   #ifdef CONFIG_EARLY_PRINTK
>   
> +#ifdef CONFIG_ARM_V8R

Shouldn't this be CONFIG_HAS_MPU?

> +
> +/*
> + * For Armv-8r, there is not VMSA support in EL2, so we use VA == PA

s/not/no/

> + * for EARLY_UART_VIRTUAL_ADDRESS. > + */
> +#define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
> +
> +#else
> +
>   /* need to add the uart address offset in page to the fixmap address */
>   #define EARLY_UART_VIRTUAL_ADDRESS \
>       (FIXMAP_ADDR(FIXMAP_CONSOLE) + (CONFIG_EARLY_UART_BASE_ADDRESS & ~PAGE_MASK))
>   
> +#endif /* CONFIG_ARM_V8R */
> +
>   #endif /* !CONFIG_EARLY_PRINTK */
>   
>   #endif

Cheers,

-- 
Julien Grall

