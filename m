Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DB4B01018
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 02:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1039985.1411485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua1Q7-0001jp-8B; Fri, 11 Jul 2025 00:15:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1039985.1411485; Fri, 11 Jul 2025 00:15:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua1Q7-0001hn-5Z; Fri, 11 Jul 2025 00:15:19 +0000
Received: by outflank-mailman (input) for mailman id 1039985;
 Fri, 11 Jul 2025 00:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4LlY=ZY=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ua1Q6-0001hh-Av
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 00:15:18 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d860b30-5dec-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 02:15:16 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 17FFF5C594C;
 Fri, 11 Jul 2025 00:15:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD620C4CEE3;
 Fri, 11 Jul 2025 00:15:10 +0000 (UTC)
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
X-Inumbo-ID: 1d860b30-5dec-11f0-a318-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752192912;
	bh=j6vT980h4vE01NOXbIlxXpe0lrDKB4Oo5BwZ4TQ4tZc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fXtL0tUYntmkh4gsEiB1R+xx1D4qU65Eyz9V7xXbDpjwav3+Kd46FE9uNqJrzq6sM
	 KYkM+RwiUIcuWsK7zXPWmvtPcDuM6ts8uK/E7qtx+PCimB8IAb15CiA1dHnT1BqC5L
	 B3xCE+RbR4AptepTV3A3RT6Xii7mlAJnxRAZYYCQlAjMExXyDy59j8f/Qm6O40hy7B
	 9UnRMsT2Yks8UJLCEjLXL7KpG0v8U/yKnJjLn/1Py3bxCLQboTgc7T60l0xKMCF00w
	 XBQNqX7FcHRp2im5728WAwvjGBANbmacioC0xVt8YywyNMKF4peiOYj8UIj0PPt/vx
	 TcoP51HzK5p1A==
Date: Thu, 10 Jul 2025 17:15:08 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Rahul Singh <rahul.singh@arm.com>
Subject: Re: [XEN PATCH] xen/arm: address violation of MISRA C Rule 10.1
In-Reply-To: <d92cf08a64d8197a1d1a45f901e59183105d3da5.1752183472.git.dmytro_prokopchuk1@epam.com>
Message-ID: <alpine.DEB.2.22.394.2507101715030.605088@ubuntu-linux-20-04-desktop>
References: <d92cf08a64d8197a1d1a45f901e59183105d3da5.1752183472.git.dmytro_prokopchuk1@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Jul 2025, Dmytro Prokopchuk1 wrote:
> Rule 10.1: Operands shall not be of an
> inappropriate essential type
> 
> The following are non-compliant:
> - unary minus on unsigned type;
> - boolean used as a numeric value.
> 
> Replace unary '-' operator with multiplying by '-1L' or '-1LL'.
> Replace numeric constant '-1UL' with '~0UL'.
> Replace numeric constant '-1ULL' with '~0ULL'.
> Cast boolean to numeric value.
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
>  xen/arch/arm/gic-vgic.c               | 2 +-
>  xen/common/memory.c                   | 2 +-
>  xen/common/page_alloc.c               | 6 +++---
>  xen/common/time.c                     | 2 +-
>  xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
>  xen/lib/strtol.c                      | 2 +-
>  xen/lib/strtoll.c                     | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
> index ea48c5375a..a35f33c5f2 100644
> --- a/xen/arch/arm/gic-vgic.c
> +++ b/xen/arch/arm/gic-vgic.c
> @@ -17,7 +17,7 @@
>  #include <asm/vgic.h>
>  
>  #define lr_all_full()                                           \
> -    (this_cpu(lr_mask) == (-1ULL >> (64 - gic_get_nr_lrs())))
> +    (this_cpu(lr_mask) == (~0ULL >> (64 - gic_get_nr_lrs())))

I understand this change, I think it is good



>  #undef GIC_DEBUG
>  
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 46620ed825..96086704cb 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -773,7 +773,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
>  
>                  nrspin_lock(&d->page_alloc_lock);
>                  drop_dom_ref = (dec_count &&
> -                                !domain_adjust_tot_pages(d, -dec_count));
> +                                !domain_adjust_tot_pages(d, (-1L) * dec_count));

...but I don't understand this? It looks like it would also break 10.1
and/or 10.3 as well?

I would rather use casts if needed, which wouldn't change the behavior
but would highlight the unsigned->signed conversion, making it more
visible:

    !domain_adjust_tot_pages(d, -(int)dec_count));


>                  nrspin_unlock(&d->page_alloc_lock);
>  
>                  if ( drop_dom_ref )
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index 8f93a4c354..da8dddf934 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -691,7 +691,7 @@ size_param("low_mem_virq_limit", opt_low_mem_virq);
>  /* Thresholds to control hysteresis. In pages */
>  /* When memory grows above this threshold, reset hysteresis.
>   * -1 initially to not reset until at least one virq issued. */
> -static unsigned long low_mem_virq_high      = -1UL;
> +static unsigned long low_mem_virq_high      = ~0UL;
>  /* Threshold at which we issue virq */
>  static unsigned long low_mem_virq_th        = 0;
>  /* Original threshold after all checks completed */
> @@ -710,7 +710,7 @@ static void __init setup_low_mem_virq(void)
>       * to ever trigger. */
>      if ( opt_low_mem_virq == 0 )
>      {
> -        low_mem_virq_th = -1UL;
> +        low_mem_virq_th = ~0UL;
>          return;
>      }
>  
> @@ -778,7 +778,7 @@ static void check_low_mem_virq(void)
>          low_mem_virq_th_order++;
>          low_mem_virq_th = 1UL << low_mem_virq_th_order;
>          if ( low_mem_virq_th == low_mem_virq_orig )
> -            low_mem_virq_high = -1UL;
> +            low_mem_virq_high = ~0UL;
>          else
>              low_mem_virq_high = 1UL << (low_mem_virq_th_order + 2);
>      }
> diff --git a/xen/common/time.c b/xen/common/time.c
> index 92f7b72464..a6eda82f8d 100644
> --- a/xen/common/time.c
> +++ b/xen/common/time.c
> @@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
>      }
>      tbuf.tm_year = y - 1900;
>      tbuf.tm_yday = days;
> -    ip = (const unsigned short int *)__mon_lengths[__isleap(y)];
> +    ip = (const unsigned short int *)__mon_lengths[(int)__isleap(y)];

__isleap return bool and we deviated bool conversions in logical
operations but not here, so I understand why this is needed. OK.


>      for ( y = 0; days >= ip[y]; ++y )
>          days -= ip[y];
>      tbuf.tm_mon = y;
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index df16235057..4058b18f2c 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -315,7 +315,7 @@ static int queue_poll_cons(struct arm_smmu_queue *q, bool sync, bool wfe)
>  
>  	while (queue_sync_cons_in(q),
>  	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
> -		if ((NOW() > timeout) > 0)
> +		if (NOW() > timeout)
>  			return -ETIMEDOUT;
>  
>  		if (wfe) {
> diff --git a/xen/lib/strtol.c b/xen/lib/strtol.c
> index 30dca779cf..5f9d691727 100644
> --- a/xen/lib/strtol.c
> +++ b/xen/lib/strtol.c
> @@ -13,7 +13,7 @@
>  long simple_strtol(const char *cp, const char **endp, unsigned int base)
>  {
>      if ( *cp == '-' )
> -        return -simple_strtoul(cp + 1, endp, base);
> +        return (-1L) * simple_strtoul(cp + 1, endp, base);
>      return simple_strtoul(cp, endp, base);
>  }
>  
> diff --git a/xen/lib/strtoll.c b/xen/lib/strtoll.c
> index 5d23fd80e8..e87007eddd 100644
> --- a/xen/lib/strtoll.c
> +++ b/xen/lib/strtoll.c
> @@ -13,7 +13,7 @@
>  long long simple_strtoll(const char *cp, const char **endp, unsigned int base)
>  {
>      if ( *cp == '-' )
> -        return -simple_strtoull(cp + 1, endp, base);
> +        return (-1LL) * simple_strtoull(cp + 1, endp, base);
>      return simple_strtoull(cp, endp, base);
>  }
>  
> -- 
> 2.43.0
> 

