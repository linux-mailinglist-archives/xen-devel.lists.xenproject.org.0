Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FE2B559CD
	for <lists+xen-devel@lfdr.de>; Sat, 13 Sep 2025 01:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1122779.1466281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxCoc-0005Kk-Rn; Fri, 12 Sep 2025 23:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1122779.1466281; Fri, 12 Sep 2025 23:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uxCoc-0005IN-P1; Fri, 12 Sep 2025 23:04:26 +0000
Received: by outflank-mailman (input) for mailman id 1122779;
 Fri, 12 Sep 2025 23:04:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uxCoa-0005IH-S1
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 23:04:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxCoa-006frV-0s;
 Fri, 12 Sep 2025 23:04:24 +0000
Received: from [2a02:8012:3a1:0:95d0:d8bb:cf45:58c2]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uxCoa-006G1C-17;
 Fri, 12 Sep 2025 23:04:24 +0000
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
	bh=YEROTMEFMnIIQSzRr4/J7fp4WWdzOAOQxEfLm/Xv528=; b=GO50QwU1AVDoodDkYWVMX/WL42
	cCpwqYo1ukXT1xKJkJd9iAMDJ4K/k3uUiFW6t1ArCvvrm3rIrc3btAYtvF/9E6GEB+hnxawQOTGOA
	aH6sgCcbbS8Xa8cjSRme9CAi8dpJZhe4f+gfO8bTiW1HnMSvJjA0CQmRVPD6+j4a4l1Y=;
Message-ID: <0ac3217d-f3d6-4bac-ac27-0afa6775f03c@xen.org>
Date: Sat, 13 Sep 2025 00:04:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/13] xen/arm: Add suspend and resume timer helpers
Content-Language: en-GB
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mirela Simonovic <mirela.simonovic@aggios.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Saeed Nowshadi <saeed.nowshadi@xilinx.com>,
 Mykola Kvach <mykola_kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <781c8e1b3a4d9b269bfde125072a84baae3f9bb3.1756763487.git.mykola_kvach@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <781c8e1b3a4d9b269bfde125072a84baae3f9bb3.1756763487.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mykola,

On 01/09/2025 23:10, Mykola Kvach wrote:
> From: Mirela Simonovic <mirela.simonovic@aggios.com>
> 
> Timer interrupts must be disabled while the system is suspended to prevent
> spurious wake-ups.

Yet, you don't seem to disable the virtual interrupt. Can you explain why?

> Suspending the timers involves disabling both the EL1
> physical timer and the EL2 hypervisor timer.
I know this is what Arm is naming the timers. But I would rather s/EL1// 
and s/EL2// because the physical timer is also accessible from EL0.

Note that Xen doesn't use or expose the physical timer. So it should 
always be disabled at the point "time_suspend()" is called. I am still 
ok to disable it just in case though.

> Resuming consists of raising
> the TIMER_SOFTIRQ, which prompts the generic timer code to reprogram the
> EL2 timer as needed. Re-enabling of the EL1 timer is left to the entity
> that uses it.
> 
> Introduce a new helper, disable_physical_timers, to encapsulate disabling
> of the physical timers.
> 
> Signed-off-by: Mirela Simonovic <mirela.simonovic@aggios.com>
> Signed-off-by: Saeed Nowshadi <saeed.nowshadi@xilinx.com>
> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
> Changes in V4:
>    - Rephrased comment and commit message for better clarity
>    - Created separate function for disabling physical timers
> 
> Changes in V3:
>    - time_suspend and time_resume are now conditionally compiled
>      under CONFIG_SYSTEM_SUSPEND
> ---
>   xen/arch/arm/include/asm/time.h |  5 +++++
>   xen/arch/arm/time.c             | 38 +++++++++++++++++++++++++++------
>   2 files changed, 37 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
> index 49ad8c1a6d..f4fd0c6af5 100644
> --- a/xen/arch/arm/include/asm/time.h
> +++ b/xen/arch/arm/include/asm/time.h
> @@ -108,6 +108,11 @@ void preinit_xen_time(void);
>   
>   void force_update_vcpu_system_time(struct vcpu *v);
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +void time_suspend(void);
> +void time_resume(void);
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   #endif /* __ARM_TIME_H__ */
>   /*
>    * Local variables:
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index e74d30d258..ad984fdfdd 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -303,6 +303,14 @@ static void check_timer_irq_cfg(unsigned int irq, const char *which)
>              "WARNING: %s-timer IRQ%u is not level triggered.\n", which, irq);
>   }
>   
> +/* Disable physical timers for EL1 and EL2 on the current CPU */

The name of the times are "physical timer" and "hypervisor timer".

> +static inline void disable_physical_timers(void)

"Physical is a bit misleading" in this context. All the 3 timers 
(virtual, physical, hypervisor) are physical timers. My preference would 
be to name this function disable_timers() (assuming you also need to 
disable the virtual timer).

> +{
> +    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
> +    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
> +    isb();
> +}
> +
>   /* Set up the timer interrupt on this CPU */
>   void init_timer_interrupt(void)
>   {
> @@ -310,9 +318,7 @@ void init_timer_interrupt(void)
>       WRITE_SYSREG64(0, CNTVOFF_EL2);     /* No VM-specific offset */
>       /* Do not let the VMs program the physical timer, only read the physical counter */
>       WRITE_SYSREG(CNTHCTL_EL2_EL1PCTEN, CNTHCTL_EL2);
> -    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Physical timer disabled */
> -    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Hypervisor's timer disabled */
> -    isb();
> +    disable_physical_timers();
>   
>       request_irq(timer_irq[TIMER_HYP_PPI], 0, htimer_interrupt,
>                   "hyptimer", NULL);
> @@ -330,9 +336,7 @@ void init_timer_interrupt(void)
>    */
>   static void deinit_timer_interrupt(void)
>   {
> -    WRITE_SYSREG(0, CNTP_CTL_EL0);    /* Disable physical timer */
> -    WRITE_SYSREG(0, CNTHP_CTL_EL2);   /* Disable hypervisor's timer */
> -    isb();
> +    disable_physical_timers();
>   
>       release_irq(timer_irq[TIMER_HYP_PPI], NULL);
>       release_irq(timer_irq[TIMER_VIRT_PPI], NULL);
> @@ -372,6 +376,28 @@ void domain_set_time_offset(struct domain *d, int64_t time_offset_seconds)
>       /* XXX update guest visible wallclock time */
>   }
>   
> +#ifdef CONFIG_SYSTEM_SUSPEND
> +
> +void time_suspend(void)
> +{
> +    disable_physical_timers();
> +}
> +
> +void time_resume(void)
> +{
> +    /*
> +     * Raising the timer softirq triggers generic code to call reprogram_timer
> +     * with the correct timeout (not known here).
> +     *
> +     * No further action is needed to restore timekeeping after power down,
> +     * since the system counter is unaffected. See ARM DDI 0487 L.a, D12.1.2
> +     * "The system counter must be implemented in an always-on power domain."
> +     */
> +    raise_softirq(TIMER_SOFTIRQ);

I think we should add a comment about the physical timer.

> +}
> +
> +#endif /* CONFIG_SYSTEM_SUSPEND */
> +
>   static int cpu_time_callback(struct notifier_block *nfb,
>                                unsigned long action,
>                                void *hcpu)Cheers,

-- 
Julien Grall


