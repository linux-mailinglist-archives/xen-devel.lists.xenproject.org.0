Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301831B2C9
	for <lists+xen-devel@lfdr.de>; Sun, 14 Feb 2021 22:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85013.159325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBP2S-0003AB-Fh; Sun, 14 Feb 2021 21:34:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85013.159325; Sun, 14 Feb 2021 21:34:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lBP2S-00039o-C0; Sun, 14 Feb 2021 21:34:44 +0000
Received: by outflank-mailman (input) for mailman id 85013;
 Sun, 14 Feb 2021 21:34:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lBP2Q-00039j-Eu
 for xen-devel@lists.xenproject.org; Sun, 14 Feb 2021 21:34:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBP2H-00039D-1g; Sun, 14 Feb 2021 21:34:33 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lBP2G-0008FF-Pr; Sun, 14 Feb 2021 21:34:32 +0000
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
	bh=sr90ghnrrGFMQJUJbkuM9kxkBCV/fRb8wi8FFVB7UVM=; b=zYsYKWf6svYxuu2NL22bZxT/Ki
	lWJTcTuHslPksK7qPqnxkie4ebX1D1ya7QT4OZX3xO0iYKAn+GNR+CLRzAyCVlTJcgxXjka4p3ijV
	X28cbCzHUG8LUdXlGxuGd0XUvOAZrdLuVW0hJt7Ro21kji+Nwi8ZZPg1kTL68MNE2ouI=;
Subject: Re: [PATCH v2 3/8] xen/events: avoid handling the same event on two
 cpus at the same time
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210211101616.13788-1-jgross@suse.com>
 <20210211101616.13788-4-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eed12192-a740-e767-1762-828c75de66ce@xen.org>
Date: Sun, 14 Feb 2021 21:34:31 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210211101616.13788-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 11/02/2021 10:16, Juergen Gross wrote:
> When changing the cpu affinity of an event it can happen today that
> (with some unlucky timing) the same event will be handled on the old
> and the new cpu at the same time.
> 
> Avoid that by adding an "event active" flag to the per-event data and
> call the handler only if this flag isn't set.
> 
> Reported-by: Julien Grall <julien@xen.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---
>   drivers/xen/events/events_base.c | 19 +++++++++++++++----
>   1 file changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
> index e157e7506830..f7e22330dcef 100644
> --- a/drivers/xen/events/events_base.c
> +++ b/drivers/xen/events/events_base.c
> @@ -102,6 +102,7 @@ struct irq_info {
>   #define EVT_MASK_REASON_EXPLICIT	0x01
>   #define EVT_MASK_REASON_TEMPORARY	0x02
>   #define EVT_MASK_REASON_EOI_PENDING	0x04
> +	u8 is_active;		/* Is event just being handled? */
>   	unsigned irq;
>   	evtchn_port_t evtchn;   /* event channel */
>   	unsigned short cpu;     /* cpu bound */
> @@ -622,6 +623,7 @@ static void xen_irq_lateeoi_locked(struct irq_info *info, bool spurious)
>   	}
>   
>   	info->eoi_time = 0;
> +	smp_store_release(&info->is_active, 0);
>   	do_unmask(info, EVT_MASK_REASON_EOI_PENDING);
>   }
>   
> @@ -809,13 +811,15 @@ static void pirq_query_unmask(int irq)
>   
>   static void eoi_pirq(struct irq_data *data)
>   {
> -	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
> +	struct irq_info *info = info_for_irq(data->irq);
> +	evtchn_port_t evtchn = info ? info->evtchn : 0;
>   	struct physdev_eoi eoi = { .irq = pirq_from_irq(data->irq) };
>   	int rc = 0;
>   
>   	if (!VALID_EVTCHN(evtchn))
>   		return;
>   
> +	smp_store_release(&info->is_active, 0);

Would you mind to explain why you are using the release semantics?

It is also not clear to me if there are any expected ordering between 
clearing is_active and clearing the pending bit.

>   	clear_evtchn(evtchn);


The 2 lines here seems to be a common pattern in this patch. So I would 
suggest to create a new helper.

>   
>   	if (pirq_needs_eoi(data->irq)) {
> @@ -1640,6 +1644,8 @@ void handle_irq_for_port(evtchn_port_t port, struct evtchn_loop_ctrl *ctrl)
>   	}
>   
>   	info = info_for_irq(irq);
> +	if (xchg_acquire(&info->is_active, 1))
> +		return;
>   
>   	if (ctrl->defer_eoi) {
>   		info->eoi_cpu = smp_processor_id();
> @@ -1823,11 +1829,13 @@ static void disable_dynirq(struct irq_data *data)
>   
>   static void ack_dynirq(struct irq_data *data)
>   {
> -	evtchn_port_t evtchn = evtchn_from_irq(data->irq);
> +	struct irq_info *info = info_for_irq(data->irq);
> +	evtchn_port_t evtchn = info ? info->evtchn : 0;
>   
>   	if (!VALID_EVTCHN(evtchn))
>   		return;
>   
> +	smp_store_release(&info->is_active, 0);
>   	clear_evtchn(evtchn);
>   }
>   
> @@ -1969,10 +1977,13 @@ static void restore_cpu_ipis(unsigned int cpu)
>   /* Clear an irq's pending state, in preparation for polling on it */
>   void xen_clear_irq_pending(int irq)
>   {
> -	evtchn_port_t evtchn = evtchn_from_irq(irq);
> +	struct irq_info *info = info_for_irq(irq);
> +	evtchn_port_t evtchn = info ? info->evtchn : 0;
>   
> -	if (VALID_EVTCHN(evtchn))
> +	if (VALID_EVTCHN(evtchn)) {
> +		smp_store_release(&info->is_active, 0);
>   		clear_evtchn(evtchn);
> +	}
>   }
>   EXPORT_SYMBOL(xen_clear_irq_pending);
>   void xen_set_irq_pending(int irq)
> 

-- 
Julien Grall

