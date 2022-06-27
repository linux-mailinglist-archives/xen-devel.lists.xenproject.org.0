Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0AA55B929
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jun 2022 12:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.356445.584676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5m5y-0005kS-4s; Mon, 27 Jun 2022 10:35:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 356445.584676; Mon, 27 Jun 2022 10:35:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o5m5y-0005ig-1t; Mon, 27 Jun 2022 10:35:54 +0000
Received: by outflank-mailman (input) for mailman id 356445;
 Mon, 27 Jun 2022 10:35:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o5m5x-0005ia-50
 for xen-devel@lists.xenproject.org; Mon, 27 Jun 2022 10:35:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5m5w-0000Ts-Ra; Mon, 27 Jun 2022 10:35:52 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=[192.168.2.226]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o5m5w-0001I9-KE; Mon, 27 Jun 2022 10:35:52 +0000
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
	bh=qI+p55CjaVTHL4lYOgnO2MlGiOjtAI3/EAiuxJ+Z9dY=; b=wml24ks4kmVuC4zoyWeZpJQFLz
	2xJ3hPX7P0sh5S1plEt5HVwKaoEJ3YeWi8O8p4nFOuWZAAikwcm3TGzQVSxVEYApZt802rylZHpe9
	S9hCf/pYee43u9nfCbLYZ6p8sPc8m+SxtP6tVlRHkkmiOT34Wr9nKQnxL/TZ2BJ01+Go=;
Message-ID: <cbb7a231-0f61-7170-3fc4-d4ae55398f3a@xen.org>
Date: Mon, 27 Jun 2022 11:35:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/arm: avoid extra caclulations when setting vtimer in
 context switch
To: Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20220627025809.1985720-1-jiamei.xie@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220627025809.1985720-1-jiamei.xie@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jiami

Title: s/caclulations/calculations/

However, I think the title should mention the overflow rather than the 
extra calculations. The former is more important the latter.

On 27/06/2022 03:58, Jiamei Xie wrote:
> virt_vtimer_save is calculating the new time for the vtimer in:
> "v->arch.virt_timer.cval + v->domain->arch.virt_timer_base.offset
> - boot_count".
> In this formula, "cval + offset" might cause uint64_t overflow.
> Changing it to "v->domain->arch.virt_timer_base.offset - boot_count +
> v->arch.virt_timer.cval" can reduce the possibility of overflow

This read strange to me. We want to remove the overflow completely not 
reducing it. The overflow is completely removed by converting the 
"offset - bount_count" to ns upfront.

AFAICT, the commit message doesn't explain that.

> , and
> "arch.virt_timer_base.offset - boot_count" will be always the same,
> which has been caculated in domain_vtimer_init. Introduce a new field
> vtimer_offset.nanoseconds to store this value for arm in struct
> arch_domain, so we can use it directly and extra caclulations can be
> avoided.
> 
> This patch is enlightened from [1].
> 
> Signed-off-by: Jiamei Xie <jiamei.xie@arm.com>
> 
> [1] https://www.mail-archive.com/xen-devel@lists.xenproject.org/msg123139.htm

This link doesn't work. But I would personally remove it from the commit 
message (or add ---) because it doesn't bring value (this patch looks 
like a v2 to me).

> ---
> xen/arch/arm/include/asm/domain.h | 4 ++++
>   xen/arch/arm/vtimer.c             | 6 ++++--
>   2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index ed63c2b6f9..94fe5b6444 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -73,6 +73,10 @@ struct arch_domain
>           uint64_t offset;
>       } virt_timer_base;
>   
> +    struct {
> +        int64_t nanoseconds;

This should be s_time_t to match the argument of set_timer() and return 
of ticks_to_ns().

> +    } vtimer_offset;

Why are you adding a new structure rather than re-using virt_timer_base?

> +
>       struct vgic_dist vgic;
>   
>       struct vuart {
> diff --git a/xen/arch/arm/vtimer.c b/xen/arch/arm/vtimer.c
> index 6b78fea77d..54161e5fea 100644
> --- a/xen/arch/arm/vtimer.c
> +++ b/xen/arch/arm/vtimer.c
> @@ -64,6 +64,7 @@ int domain_vtimer_init(struct domain *d, struct xen_arch_domainconfig *config)
>   {
>       d->arch.virt_timer_base.offset = get_cycles();
>       d->time_offset.seconds = ticks_to_ns(d->arch.virt_timer_base.offset - boot_count);
> +    d->arch.vtimer_offset.nanoseconds = d->time_offset.seconds;

Hmmm... I find odd to assign a field "nanoseconds" to "seconds". I would 
suggest to re-order so you first set nanoseconds and then set seconds.

This will make more obvious that this is not a mistake and "seconds" 
will be closer to the do_div() below.

>       do_div(d->time_offset.seconds, 1000000000);
>   
>       config->clock_frequency = timer_dt_clock_frequency;
> @@ -144,8 +145,9 @@ void virt_timer_save(struct vcpu *v)
>       if ( (v->arch.virt_timer.ctl & CNTx_CTL_ENABLE) &&
>            !(v->arch.virt_timer.ctl & CNTx_CTL_MASK))
>       {
> -        set_timer(&v->arch.virt_timer.timer, ticks_to_ns(v->arch.virt_timer.cval +
> -                  v->domain->arch.virt_timer_base.offset - boot_count));
> +        set_timer(&v->arch.virt_timer.timer,
> +                  v->domain->arch.vtimer_offset.nanoseconds +
> +                  ticks_to_ns(v->arch.virt_timer.cval));
>       }
>   }
>   

Cheers,

-- 
Julien Grall

