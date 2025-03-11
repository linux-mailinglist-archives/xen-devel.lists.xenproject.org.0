Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F227A5D155
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 22:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909282.1316256 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6mU-0006uT-EM; Tue, 11 Mar 2025 21:04:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909282.1316256; Tue, 11 Mar 2025 21:04:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts6mU-0006sK-Bi; Tue, 11 Mar 2025 21:04:54 +0000
Received: by outflank-mailman (input) for mailman id 909282;
 Tue, 11 Mar 2025 21:04:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ts6mS-0006sE-Sh
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 21:04:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts6mR-00Ej3W-2q;
 Tue, 11 Mar 2025 21:04:51 +0000
Received: from [2a02:8012:3a1:0:9c08:78f4:b949:88f8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1ts6mR-004o92-1R;
 Tue, 11 Mar 2025 21:04:51 +0000
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
	bh=PYXnjgz4McCAUig7ZhfLuoXt1YKitv9oUoVZEcCChnw=; b=RH/MELDni5v2YlY1PgvsKW0GY0
	Sg7EQf0p7BKPl2jHttA0H0nhSIx9RZLqkroguezXAm0Q0vhd6C1wedmwWUkkKRJtj7GE7jLG0UGeb
	XfIYP8+XfSD6n+SxEOOU3OIKHdW1nhYMzmZHq3C5y1WjgUOuSpnRZZwVIYl/EeZ9yodA=;
Message-ID: <0d0ed573-d810-4e78-9a12-985e9150c107@xen.org>
Date: Tue, 11 Mar 2025 21:04:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/16] xen/arm: add watchdog domain suspend/resume helpers
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>, Dario Faggioli
 <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <gwd@xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Mirela Simonovic <mirela.simonovic@aggios.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykyta Poturai <mykyta_poturai@epam.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
 <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <15604985aae5333670467a84cccbaaa403a10000.1741164138.git.xakep.amatop@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 05/03/2025 09:11, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> This patch implements suspend/resume helpers for the watchdog.
> While a domain is suspended its watchdogs must be paused. Otherwise,
> if the domain stays in the suspend state for a longer period of time
> compared to the watchdog period, the domain would be shutdown on resume.
> Proper solution to this problem is to stop (suspend) the watchdog timers
> after the domain suspends and to restart (resume) the watchdog timers
> before the domain resumes. The suspend/resume of watchdog timers is done
> in Xen and is invisible to the guests.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in v3:
> - cover the code with CONFIG_SYSTEM_SUSPEND
> 
> Changes in v2:
> - drop suspended field from timer structure
> - drop the call of watchdog_domain_resume from ctxt_switch_to
> ---
>   xen/common/sched/core.c | 39 +++++++++++++++++++++++++++++++++++++++
>   xen/include/xen/sched.h |  9 +++++++++
>   2 files changed, 48 insertions(+)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index b1c6b6b9fa..6c2231826a 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -1605,6 +1605,45 @@ void watchdog_domain_destroy(struct domain *d)
>           kill_timer(&d->watchdog_timer[i].timer);
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND

The config option is Arm specific, yet this is common code. As x86, 
already suspend/resume, then shouldn't the config option be common?

But more importantly, why do we need to save/restore the watchdogs for 
Arm but not x86? Is this a latent issue or design choice?

> +
> +void watchdog_domain_suspend(struct domain *d)
> +{
> +    unsigned int i;
> +
> +    spin_lock(&d->watchdog_lock);
> +
> +    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> +    {
> +        if ( test_bit(i, &d->watchdog_inuse_map) )
> +        {
> +            stop_timer(&d->watchdog_timer[i].timer);
> +        }
> +    }
> +
> +    spin_unlock(&d->watchdog_lock);
> +}
> +
> +void watchdog_domain_resume(struct domain *d)
> +{
> +    unsigned int i;
> +
> +    spin_lock(&d->watchdog_lock);
> +
> +    for ( i = 0; i < NR_DOMAIN_WATCHDOG_TIMERS; i++ )
> +    {
> +        if ( test_bit(i, &d->watchdog_inuse_map) )
> +        {
> +            set_timer(&d->watchdog_timer[i].timer,
> +                      NOW() + SECONDS(d->watchdog_timer[i].timeout));
> +        }
> +    }
> +
> +    spin_unlock(&d->watchdog_lock);
> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   /*
>    * Pin a vcpu temporarily to a specific CPU (or restore old pinning state if
>    * cpu is NR_CPUS).
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index d0d10612ce..caab4aad93 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1109,6 +1109,15 @@ void scheduler_disable(void);
>   void watchdog_domain_init(struct domain *d);
>   void watchdog_domain_destroy(struct domain *d);
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +/*
> + * Suspend/resume watchdogs of domain (while the domain is suspended its
> + * watchdogs should be on pause)
> + */
> +void watchdog_domain_suspend(struct domain *d);
> +void watchdog_domain_resume(struct domain *d);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   /*
>    * Use this check when the following are both true:
>    *  - Using this feature or interface requires full access to the hardware

Cheers,

-- 
Julien Grall


