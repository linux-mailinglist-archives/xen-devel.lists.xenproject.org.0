Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B18AFD12FD9
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jan 2026 15:05:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1200284.1516269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfIXM-0005iV-4y; Mon, 12 Jan 2026 14:04:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1200284.1516269; Mon, 12 Jan 2026 14:04:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vfIXM-0005gi-26; Mon, 12 Jan 2026 14:04:52 +0000
Received: by outflank-mailman (input) for mailman id 1200284;
 Mon, 12 Jan 2026 14:04:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1vfIXK-0005gW-I9
 for xen-devel@lists.xenproject.org; Mon, 12 Jan 2026 14:04:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vfIXK-0005Zv-1V;
 Mon, 12 Jan 2026 14:04:50 +0000
Received: from [2a02:8012:3a1:0:11a8:e394:f10a:8204]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1vfIXJ-000Gbn-2o;
 Mon, 12 Jan 2026 14:04:49 +0000
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
	bh=dqxSLqwpLb9KqemAnIXZnxtoCwfav7em5Y1hfUHJlnY=; b=wYJajwUttQyp8rlSBaBlrzcGBU
	vbFN2zrt4wsYpVidq/1fw31/QG8zHvOGTO8uxc5SBzx9NaVFkyU0lXw5Q/rxYP0xMOd/ZehQOOspX
	OX9QFxGIM8bskv5a5X3WS1g02DMnAgrchrurHxpA3S3UkXYwHpmlsX+v3m1oUYhbW4K0=;
Message-ID: <c59eabda-3b97-4231-bd90-29326ba8a326@xen.org>
Date: Mon, 12 Jan 2026 14:04:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: ignore spurious interrupts from virtual timer
To: Mykola Kvach <xakep.amatop@gmail.com>, xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <436a0405a9482dadce7f7cdb1e9721ee461f26a7.1768219676.git.mykola_kvach@epam.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <436a0405a9482dadce7f7cdb1e9721ee461f26a7.1768219676.git.mykola_kvach@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 12/01/2026 12:50, Mykola Kvach wrote:
> From: Mykola Kvach <mykola_kvach@epam.com>
> 
> If a spurious virtual timer interrupt occurs (i.e. the interrupt fires
> but CNTV_CTL_EL0 does not report it as pending), Xen masks the virtual
> timer and injects the vtimer IRQ into the guest. For Linux guests, the
> timer interrupt is unmasked only after programming a new CVAL value from
> the timer interrupt handler. When the interrupt is not reported as
> pending, the handler can skip that programming step, leaving the timer
> masked and stalling the affected CPU.

I guess this is happening if Linux is trying to modify CVAL with the 
local interrupt masked?

> 
> This patch mirrors the Linux arm generic timer handler: if the interrupt
> fires but the pending bit is not set, treat it as spurious and ignore it.

Have you considered fixing properly our virtual timer emulation? I know 
this requires more code, but at least we are not adding more 
non-compliant code which requires patching the Guest OS.

IIRC there was a series from Stewart to solve it and it was in pretty 
good shape at the time it was posted.

> 
> This issue is reproducible under heavy load on the R-Car X5H board
> (Cortex-A720AE r0p0).
 > Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
> ---
>   xen/arch/arm/include/asm/perfc_defn.h |  7 ++++---
>   xen/arch/arm/time.c                   | 11 ++++++++++-
>   2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/perfc_defn.h b/xen/arch/arm/include/asm/perfc_defn.h
> index effd25b69e..f83989d95a 100644
> --- a/xen/arch/arm/include/asm/perfc_defn.h
> +++ b/xen/arch/arm/include/asm/perfc_defn.h
> @@ -69,9 +69,10 @@ PERFCOUNTER(ppis,                 "#PPIs")
>   PERFCOUNTER(spis,                 "#SPIs")
>   PERFCOUNTER(guest_irqs,           "#GUEST-IRQS")
>   
> -PERFCOUNTER(hyp_timer_irqs,   "Hypervisor timer interrupts")
> -PERFCOUNTER(virt_timer_irqs,  "Virtual timer interrupts")
> -PERFCOUNTER(maintenance_irqs, "Maintenance interrupts")
> +PERFCOUNTER(hyp_timer_irqs,             "Hypervisor timer interrupts")
> +PERFCOUNTER(virt_timer_irqs,            "Virtual timer interrupts")
> +PERFCOUNTER(virt_timer_spurious_irqs,   "Virtual timer spurious interrupts")
> +PERFCOUNTER(maintenance_irqs,           "Maintenance interrupts")
>   
>   PERFCOUNTER(atomics_guest,    "atomics: guest access")
>   PERFCOUNTER(atomics_guest_paused,   "atomics: guest paused")
> diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
> index cc3fcf47b6..d18d6568bb 100644
> --- a/xen/arch/arm/time.c
> +++ b/xen/arch/arm/time.c
> @@ -258,6 +258,8 @@ static void htimer_interrupt(int irq, void *dev_id)
>   
>   static void vtimer_interrupt(int irq, void *dev_id)
>   {
> +    register_t ctl;
> +
>       /*
>        * Edge-triggered interrupts can be used for the virtual timer. Even
>        * if the timer output signal is masked in the context switch, the
> @@ -271,9 +273,16 @@ static void vtimer_interrupt(int irq, void *dev_id)
>       if ( unlikely(is_idle_vcpu(current)) )
>           return;
>   
> +    ctl = READ_SYSREG(CNTV_CTL_EL0);
> +    if ( unlikely(!(ctl & CNTx_CTL_PENDING)) )

For the others, the Armv8 specification names this field ISTATUS. 
Regardless what I wrote above, the change look alright. Before I ack, 
can you confirm whether you checked other OSes (I am thinking at least 
Zephyr) will also ignore spurious interrupt?

Cheers,

-- 
Julien Grall


