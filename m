Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551DD31B2B5
	for <lists+xen-devel@lfdr.de>; Sun, 14 Feb 2021 22:19:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85009.159314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBOmK-0001PA-2N; Sun, 14 Feb 2021 21:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85009.159314; Sun, 14 Feb 2021 21:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBOmJ-0001Ol-VN; Sun, 14 Feb 2021 21:18:03 +0000
Received: by outflank-mailman (input) for mailman id 85009;
 Sun, 14 Feb 2021 21:18:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBOmI-0001Og-3n
 for xen-devel@lists.xenproject.org; Sun, 14 Feb 2021 21:18:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBOmF-0002tO-Rd; Sun, 14 Feb 2021 21:17:59 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBOmF-0006vA-Ir; Sun, 14 Feb 2021 21:17:59 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=/QYTDglDUzmSr9H0s41Nh/i0d4YrXWxPDKOebpqx8dE=; b=NcY8RSnZ3LKaGcib3T0HtChLhF
	M1sLaMxJGp/Kp2l4MeydJBd2feanETtRQcVu06AuiG4/2zW30vwcvB+BBKHyQJrkYanE817356IgL
	8AoJUiKNh+Lp/4nQUrIV37x4O/nhjAkAEWpn2K/Ca8ELj/RVIL+ETmjzuONRlMF2jgK0=;
Subject: Re: [PATCH v2 1/8] xen/events: reset affinity of 2-level event when
 tearing it down
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, stable@vger.kernel.org
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-2-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2abf73b0-ec8d-8e9a-665a-1adc47972fe7@xen.org>
Date: Sun, 14 Feb 2021 21:17:57 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211101616.13788-2-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 11/02/2021 10:16, Juergen Gross wrote:
> When creating a new event channel with 2-level events the affinity
> needs to be reset initially in order to avoid using an old affinity
> from earlier usage of the event channel port. So when tearing an event
> channel down reset all affinity bits.
> 
> The same applies to the affinity when onlining a vcpu: all old
> affinity settings for this vcpu must be reset. As percpu events get
> initialized before the percpu event channel hook is called,
> resetting of the affinities happens after offlining a vcpu (this is
> working, as initial percpu memory is zeroed out).
> 
> Cc: stable@vger.kernel.org
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> V2:
> - reset affinity when tearing down the event (Julien Grall)
> ---
>   drivers/xen/events/events_2l.c       | 15 +++++++++++++++
>   drivers/xen/events/events_base.c     |  1 +
>   drivers/xen/events/events_internal.h |  8 ++++++++
>   3 files changed, 24 insertions(+)
> 
> diff --git a/drivers/xen/events/events_2l.c b/drivers/xen/events/events_2l.c
> index da87f3a1e351..a7f413c5c190 100644
> --- a/drivers/xen/events/events_2l.c
> +++ b/drivers/xen/events/events_2l.c
> @@ -47,6 +47,11 @@ static unsigned evtchn_2l_max_channels(void)
>   	return EVTCHN_2L_NR_CHANNELS;
>   }
>   
> +static void evtchn_2l_remove(evtchn_port_t evtchn, unsigned int cpu)
> +{
> +	clear_bit(evtchn, BM(per_cpu(cpu_evtchn_mask, cpu)));
> +}
> +
>   static void evtchn_2l_bind_to_cpu(evtchn_port_t evtchn, unsigned int cpu,
>   				  unsigned int old_cpu)
>   {
> @@ -355,9 +360,18 @@ static void evtchn_2l_resume(void)
>   				EVTCHN_2L_NR_CHANNELS/BITS_PER_EVTCHN_WORD);
>   }
>   
> +static int evtchn_2l_percpu_deinit(unsigned int cpu)
> +{
> +	memset(per_cpu(cpu_evtchn_mask, cpu), 0, sizeof(xen_ulong_t) *
> +			EVTCHN_2L_NR_CHANNELS/BITS_PER_EVTCHN_WORD);
> +
> +	return 0;
> +}
> +
>   static const struct evtchn_ops evtchn_ops_2l = {
>   	.max_channels      = evtchn_2l_max_channels,
>   	.nr_channels       = evtchn_2l_max_channels,
> +	.remove            = evtchn_2l_remove,
>   	.bind_to_cpu       = evtchn_2l_bind_to_cpu,
>   	.clear_pending     = evtchn_2l_clear_pending,
>   	.set_pending       = evtchn_2l_set_pending,
> @@ -367,6 +381,7 @@ static const struct evtchn_ops evtchn_ops_2l = {
>   	.unmask            = evtchn_2l_unmask,
>   	.handle_events     = evtchn_2l_handle_events,
>   	.resume	           = evtchn_2l_resume,
> +	.percpu_deinit     = evtchn_2l_percpu_deinit,
>   };
>   
>   void __init xen_evtchn_2l_init(void)
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index e850f79351cb..6c539db81f8f 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -368,6 +368,7 @@ static int xen_irq_info_pirq_setup(unsigned irq,
>   static void xen_irq_info_cleanup(struct irq_info *info)
>   {
>   	set_evtchn_to_irq(info->evtchn, -1);
> +	xen_evtchn_port_remove(info->evtchn, info->cpu);
>   	info->evtchn = 0;
>   	channels_on_cpu_dec(info);
>   }
> diff --git a/drivers/xen/events/events_internal.h b/drivers/xen/events/events_internal.h
> index 0a97c0549db7..18a4090d0709 100644
> --- a/drivers/xen/events/events_internal.h
> +++ b/drivers/xen/events/events_internal.h
> @@ -14,6 +14,7 @@ struct evtchn_ops {
>   	unsigned (*nr_channels)(void);
>   
>   	int (*setup)(evtchn_port_t port);
> +	void (*remove)(evtchn_port_t port, unsigned int cpu);
>   	void (*bind_to_cpu)(evtchn_port_t evtchn, unsigned int cpu,
>   			    unsigned int old_cpu);
>   
> @@ -54,6 +55,13 @@ static inline int xen_evtchn_port_setup(evtchn_port_t evtchn)
>   	return 0;
>   }
>   
> +static inline void xen_evtchn_port_remove(evtchn_port_t evtchn,
> +					  unsigned int cpu)
> +{
> +	if (evtchn_ops->remove)
> +		evtchn_ops->remove(evtchn, cpu);
> +}
> +
>   static inline void xen_evtchn_port_bind_to_cpu(evtchn_port_t evtchn,
>   					       unsigned int cpu,
>   					       unsigned int old_cpu)
> 

-- 
Julien Grall

