Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4431644DF9
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 22:30:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455592.713105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fVJ-0006Vh-Bq; Tue, 06 Dec 2022 21:29:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455592.713105; Tue, 06 Dec 2022 21:29:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2fVJ-0006SG-8S; Tue, 06 Dec 2022 21:29:29 +0000
Received: by outflank-mailman (input) for mailman id 455592;
 Tue, 06 Dec 2022 21:29:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p2fVI-0006SA-DT
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 21:29:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2fVH-0002uU-So; Tue, 06 Dec 2022 21:29:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p2fVH-0002kq-ND; Tue, 06 Dec 2022 21:29:27 +0000
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
	bh=bsp1/+MJYkE/neZ1p03WojXRQ3KHa1ZGrnGe2ZZmTOA=; b=R8Zx4PCDPF8ZYsXHsDfzsvC6TJ
	/mNVukyPa47AfuXUSKFw4ERWDeMvAArxJXqKRE4SUgxdhhsO+T/Dr9wfA04j5aqgvV2NJLI/QFQ0l
	nqXULwcaywm9jzCSnReqsb5hgNJYgE2oqfXTJPeV9JbW8KE1oIn4KOZeZDf4sOTe3jEY=;
Message-ID: <f26c3bc2-1bc5-b33d-9922-74c5b829feb2@xen.org>
Date: Tue, 6 Dec 2022 21:29:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 11/19] xen/arm: Suspend/resume timer interrupt generation
To: Mykyta Poturai <Mykyta_Poturai@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>
References: <cover.1665137247.git.mykyta_poturai@epam.com>
 <63e5551cc906d8603abfbe9596403fdd8107c849.1665137247.git.mykyta_poturai@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <63e5551cc906d8603abfbe9596403fdd8107c849.1665137247.git.mykyta_poturai@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2022 11:32, Mykyta Poturai wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> Timer interrupts have to be disabled while the system is in suspend.
> Otherwise, a timer interrupt would fire and wake-up the system.
> Suspending the timer interrupts consists of disabling physical EL1
> and EL2 timers. The resume consists only of raising timer softirq,
> which will trigger the generic timer code to reprogram the EL2 timer
> as needed. Enabling of EL1 physical timer will be triggered by an
> entity which uses it.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> ---
>   xen/arch/arm/suspend.c     |  4 ++++
>   xen/arch/arm/time.c        | 22 ++++++++++++++++++++++
>   xen/include/asm-arm/time.h |  3 +++
>   3 files changed, 29 insertions(+)
> 
> diff --git a/xen/arch/arm/suspend.c b/xen/arch/arm/suspend.c
> index b94a6df86d..05c43ce502 100644
> --- a/xen/arch/arm/suspend.c
> +++ b/xen/arch/arm/suspend.c
> @@ -151,6 +151,8 @@ static long system_suspend(void *data)
>           goto resume_nonboot_cpus;
>       }
>   
> +    time_suspend();
> +
>       local_irq_save(flags);
>       status = gic_suspend();
>       if ( status )
> @@ -166,6 +168,8 @@ static long system_suspend(void *data)
>   resume_irqs:
>       local_irq_restore(flags);
>   
> +    time_resume();
> +
>   resume_nonboot_cpus:
>       rcu_barrier();
>       enable_nonboot_cpus();
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index dec53b5f7d..ca54bcfe68 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -363,6 +363,28 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
>       /* XXX update guest visible wallclock time */
>   }
>   
> +void time_suspend(void)
> +{
> +    /* Disable physical EL1 timer */
> +    WRITE_SYSREG(0, CNTP_CTL_EL0);
> +
> +    /* Disable hypervisor's timer */
> +    WRITE_SYSREG(0, CNTHP_CTL_EL2);
> +    isb();
> +}
> +
> +void time_resume(void)
> +{
> +    /*
> +     * Raising timer softirq will trigger generic timer code to reprogram_timer
> +     * with the correct timeout value (which is not known here). There is no
> +     * need to do anything else in order to recover the time keeping from power
> +     * down, because the system counter is not affected by the power down (it
> +     * resides out of the ARM's cluster in an always-on part of the SoC).
> +     */

Can you point me to the section in the Arm Arm stating the system 
counter is in an always-on part of the SoC?

> +    raise_softirq(TIMER_SOFTIRQ);

My expectation is that the time_resume() would closely match the x86 
version (aside the arch specific part). I can't see the raise_softirq(). 
So why do we need it here?

Also, there is a missing call to do_settime() and update_vcpu_system_time().

> +}
> +
>   static int cpu_time_callback(struct notifier_block *nfb,
>                                unsigned long action,
>                                void *hcpu)
> diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
> index 4b401c1110..ded93b490a 100644
> --- a/xen/include/asm-arm/time.h
> +++ b/xen/include/asm-arm/time.h
> @@ -107,6 +107,9 @@ void preinit_xen_time(void);
>   
>   void force_update_vcpu_system_time(struct vcpu *v);
>   
> +void time_suspend(void);
> +void time_resume(void);
> +
>   #endif /* __ARM_TIME_H__ */
>   /*
>    * Local variables:

Cheers,

-- 
Julien Grall

