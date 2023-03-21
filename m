Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03AF6C37F0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 18:13:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512897.793272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefXe-00069k-7l; Tue, 21 Mar 2023 17:12:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512897.793272; Tue, 21 Mar 2023 17:12:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pefXe-00066q-4b; Tue, 21 Mar 2023 17:12:58 +0000
Received: by outflank-mailman (input) for mailman id 512897;
 Tue, 21 Mar 2023 17:12:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pefXc-00066k-RA
 for xen-devel@lists.xenproject.org; Tue, 21 Mar 2023 17:12:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefXc-0002hU-DT; Tue, 21 Mar 2023 17:12:56 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235] helo=[192.168.4.43])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pefXc-0005EH-7K; Tue, 21 Mar 2023 17:12:56 +0000
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
	bh=AiyGBRpXAIpWpwsb/8jvxqx3RSNKwWNRlHp0b4xxg7U=; b=tq64rLpRTvh33Qx7GcVjacR54k
	+q5eufMJcwxTidX6ey+5boQeIC7Xbhr1toFRSAxCWnOxs2+E0WJnqU9Ez2N/to1aNqqHF0NkuzcBx
	8qUbKYeclRr7JxFpk7NUwZfOAv5q9urBNde2XEHeDFtUyQ91WwDhGrGXRH1AbPRyA6zY=;
Message-ID: <eb17b973-2e2b-d9aa-8e99-a1b28e874919@xen.org>
Date: Tue, 21 Mar 2023 17:12:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v3 2/2] arch/arm: time: Add support for parsing interrupts
 by names
Content-Language: en-US
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>,
 xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, rahul.singh@arm.com,
 Andrei Cherechesu <andrei.cherechesu@nxp.com>
References: <20230313130803.3499098-1-andrei.cherechesu@oss.nxp.com>
 <20230313130803.3499098-3-andrei.cherechesu@oss.nxp.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230313130803.3499098-3-andrei.cherechesu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/03/2023 13:08, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Added support for parsing the ARM generic timer interrupts DT
> node by the "interrupt-names" property, if it is available.
> 
> If not available, the usual parsing based on the expected
> IRQ order is performed.
> 
> Also treated returning 0 as an error case for the
> platform_get_irq() calls, since it is not a valid PPI ID and
> treating it as a valid case would only cause Xen to BUG() later,
> when trying to reserve vIRQ being SGI.
> 
> Added the "hyp-virt" PPI to the timer PPI list, even
> though it's currently not in use. If the "hyp-virt" PPI is
> not found, the hypervisor won't panic.

I know this was already merged. But it would have been nice to explain 
why this is added. As this stands, it looks unnecessary dead code which 
would have been okay if ...

> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> ---
>   xen/arch/arm/include/asm/time.h |  3 ++-
>   xen/arch/arm/time.c             | 26 ++++++++++++++++++++++----
>   2 files changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
> index 4b401c1110..49ad8c1a6d 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -82,7 +82,8 @@ enum timer_ppi
>       TIMER_PHYS_NONSECURE_PPI = 1,
>       TIMER_VIRT_PPI = 2,
>       TIMER_HYP_PPI = 3,
> -    MAX_TIMER_PPI = 4,
> +    TIMER_HYP_VIRT_PPI = 4,
> +    MAX_TIMER_PPI = 5,
>   };
>   
>   /*
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index 433d7be909..0b482d7db3 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -149,15 +149,33 @@ static void __init init_dt_xen_time(void)
>   {
>       int res;
>       unsigned int i;
> +    bool has_names;
> +    static const char * const timer_irq_names[MAX_TIMER_PPI] __initconst = {
> +        [TIMER_PHYS_SECURE_PPI] = "sec-phys",
> +        [TIMER_PHYS_NONSECURE_PPI] = "phys",
> +        [TIMER_VIRT_PPI] = "virt",
> +        [TIMER_HYP_PPI] = "hyp-phys",
> +        [TIMER_HYP_VIRT_PPI] = "hyp-virt",
> +    };
> +
> +    has_names = dt_property_read_bool(timer, "interrupt-names");
>   
>       /* Retrieve all IRQs for the timer */
>       for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
>       {
> -        res = platform_get_irq(timer, i);
> -
> -        if ( res < 0 )
> +        if ( has_names )
> +            res = platform_get_irq_byname(timer, timer_irq_names[i]);
> +        else
> +            res = platform_get_irq(timer, i);
> +
> +        if ( res > 0 )
> +            timer_irq[i] = res;
> +        /*
> +         * Do not panic if "hyp-virt" PPI is not found, since it's not
> +         * currently used.
> +         */
> +        else if ( i != TIMER_HYP_VIRT_PPI )
>               panic("Timer: Unable to retrieve IRQ %u from the device tree\n", i);

... this wasn't necessary.

> -        timer_irq[i] = res;
>       }
>   }
>   

Cheers,

-- 
Julien Grall

