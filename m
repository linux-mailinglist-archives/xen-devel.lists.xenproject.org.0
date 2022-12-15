Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F36C64E39E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 23:08:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463920.722213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5wOn-0006BV-2y; Thu, 15 Dec 2022 22:08:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463920.722213; Thu, 15 Dec 2022 22:08:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5wOm-00068o-Vg; Thu, 15 Dec 2022 22:08:16 +0000
Received: by outflank-mailman (input) for mailman id 463920;
 Thu, 15 Dec 2022 22:08:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5wOl-00068i-G7
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 22:08:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5wOk-0007la-Vt; Thu, 15 Dec 2022 22:08:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5wOk-0005xo-Ky; Thu, 15 Dec 2022 22:08:14 +0000
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
	bh=km8HMaf+h/G4giMciMUYyrczOwZGRlbTrGWh24VKxUE=; b=6jQZZbybZoihbku2nDPWaMkAys
	8HuJiiuQY7RNr4ki9TPabvnC5h6YUG6fN46fQA0Q0yaKXVHuLPtEsb+1tjoU9DW/9UVKJYZerRbkn
	Des/zvB4/9KS9bGri/2Jqlxv4TMNk8JMl1LjrA0wlehkIsH8G7JQbCscOyWZLWVuZqoc=;
Message-ID: <1d39868b-bafb-bce7-c8bb-1c4a3ea48398@xen.org>
Date: Thu, 15 Dec 2022 22:08:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [XEN v1 7/9] xen/arm: Restrict zeroeth_table_offset for ARM_64
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-8-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20221215193245.48314-8-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/12/2022 19:32, Ayan Kumar Halder wrote:
> zeroeth_table_offset is not accessed for ARM_32.

Right, but what is the problem with keep it? With your proposal we need 
to duplicate the macro DECLARE_OFFSETS() which is not great.

So you want to provide a more compelling reason to have the duplication.

> This is a left over of the following commit

I am not sure why you are saying this is a left-over.

DECLARE_OFFSETS was introduced in 2019 so...

> 
> "
> commit 5fa6e9abfb11
> Author: Ian Campbell <ian.campbell@citrix.com>
> Date:   Thu Sep 18 01:09:48 2014 +0100


... 5 years after there.

> 
>      xen: arm: Implement variable levels in dump_pt_walk
> "
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> ---
>   xen/arch/arm/include/asm/lpae.h | 10 ++++++++++
>   xen/arch/arm/mm.c               |  4 ++++
>   2 files changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
> index 3fdd5d0de2..35769debf9 100644
> --- a/xen/arch/arm/include/asm/lpae.h
> +++ b/xen/arch/arm/include/asm/lpae.h
> @@ -161,6 +161,7 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>   #define lpae_set_mfn(pte, mfn)  ((pte).walk.base = mfn_x(mfn))
>   
>   /* Generate an array @var containing the offset for each level from @addr */
> +#ifdef CONFIG_ARM_64
>   #define DECLARE_OFFSETS(var, addr)          \
>       const unsigned int var[4] = {           \
>           zeroeth_table_offset(addr),         \
> @@ -168,6 +169,15 @@ static inline bool lpae_is_superpage(lpae_t pte, unsigned int level)
>           second_table_offset(addr),          \
>           third_table_offset(addr)            \
>       }
> +#else
> +#define DECLARE_OFFSETS(var, addr)          \
> +    const unsigned int var[4] = {           \
> +        0,                                  \
> +        first_table_offset(addr),           \
> +        second_table_offset(addr),          \
> +        third_table_offset(addr)            \
> +    }
> +#endif
>   
>   /*
>    * Standard entry type that we'll use to build Xen's own pagetables.
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 630175276f..be939fb106 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -184,7 +184,11 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>       static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
>       const mfn_t root_mfn = maddr_to_mfn(ttbr);
>       const unsigned int offsets[4] = {
> +#ifdef CONFIG_ARM_64
>           zeroeth_table_offset(addr),
> +#else
> +        0,
> +#endif
>           first_table_offset(addr),
>           second_table_offset(addr),
>           third_table_offset(addr)

Please use DECLARE_OFFSETS() here.

Cheers,

-- 
Julien Grall

