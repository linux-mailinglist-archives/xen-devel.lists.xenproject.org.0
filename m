Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FBC2C28ED
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 15:03:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.36420.68323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYu4-0002CZ-K1; Tue, 24 Nov 2020 14:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 36420.68323; Tue, 24 Nov 2020 14:02:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khYu4-0002CA-G1; Tue, 24 Nov 2020 14:02:44 +0000
Received: by outflank-mailman (input) for mailman id 36420;
 Tue, 24 Nov 2020 14:02:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khYu3-0002C5-0n
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:02:43 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c518264a-cfcf-4971-9965-fddcfc553829;
 Tue, 24 Nov 2020 14:02:41 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CE6F7AD1E;
 Tue, 24 Nov 2020 14:02:40 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=nkWz=E6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khYu3-0002C5-0n
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 14:02:43 +0000
X-Inumbo-ID: c518264a-cfcf-4971-9965-fddcfc553829
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c518264a-cfcf-4971-9965-fddcfc553829;
	Tue, 24 Nov 2020 14:02:41 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606226560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=indIEahDfkT1LZzfP/mZPyUegRln11c4qOlELh8is6Y=;
	b=TqNCnQdBClekdG42HfuFy1uWlet99PX4hV3F3kWlME8aziceMfAdOidEUz5xYlp+xmRW9R
	4WdOj62txLL1k5UrsWzuACO+MbKqGQkJnDbmztTvNEpL5grgUhsbJguddWVg0/H0ZWWnOs
	sjD1tR3Xd5M7ZEHncSXNKRJX0WvFS/8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CE6F7AD1E;
	Tue, 24 Nov 2020 14:02:40 +0000 (UTC)
Subject: Re: [PATCH v7 3/3] xen/events: rework fifo queue locking
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201124070106.26854-1-jgross@suse.com>
 <20201124070106.26854-4-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c627b42b-1e1f-b83a-2db8-b9e5fa5dce10@suse.com>
Date: Tue, 24 Nov 2020 15:02:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124070106.26854-4-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 24.11.2020 08:01, Juergen Gross wrote:
> Two cpus entering evtchn_fifo_set_pending() for the same event channel
> can race in case the first one gets interrupted after setting
> EVTCHN_FIFO_PENDING and when the other one manages to set
> EVTCHN_FIFO_LINKED before the first one is testing that bit. This can
> lead to evtchn_check_pollers() being called before the event is put
> properly into the queue, resulting eventually in the guest not seeing
> the event pending and thus blocking forever afterwards.
> 
> Note that commit 5f2df45ead7c1195 ("xen/evtchn: rework per event channel
> lock") made the race just more obvious, while the fifo event channel
> implementation had this race from the beginning when an unmask operation
> was running in parallel with an event channel send operation.

Ah yes, but then also only for inter-domain channels, as it was
only in that case that the "wrong" domain's event lock was held.
IOW there was a much earlier change already where this issue
got widened (when the per-channel locking got introduced). This
then got reduced to the original scope by XSA-343's adding of
locking to evtchn_unmask(). (Not sure how much of this history
wants actually adding here. I'm writing it down not the least to
make sure I have a complete enough picture.)

> For avoiding this race the queue locking in evtchn_fifo_set_pending()
> needs to be reworked to cover the test of EVTCHN_FIFO_PENDING,
> EVTCHN_FIFO_MASKED and EVTCHN_FIFO_LINKED, too.

Perhaps mention the prior possible (and imo more natural)
alternative of taking consistent per-channel locks would have
been an alternative, until they got converted to rw ones?

> Additionally when an
> event channel needs to change queues both queues need to be locked
> initially.

Since this was (afaict) intentionally not the case before, I
think I would want to see a word spent on the "why", perhaps
better in a code comment than here. Even more so that you
delete a respective comment justifying the possible race as
permissible. And I have to admit right now I'm still uncertain
both ways, i.e. I neither have a clear understanding of why it
would have been considered fine the other way around before,
nor why the double locking is strictly needed.

> Fixes: 5f2df45ead7c1195 ("xen/evtchn: rework per event channel lock")
> Fixes: 88910061ec615b2d ("evtchn: add FIFO-based event channel hypercalls and port ops")
> Signed-off-by: Juergen Gross <jgross@suse.com>

I guess at least this one wants a Reported-by.

> @@ -204,6 +175,48 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
>          return;
>      }
>  
> +    for ( try = 0; ; try++ )
> +    {
> +        union evtchn_fifo_lastq lastq;
> +        struct vcpu *old_v;

I think this one can have const added.

> +        lastq.raw = read_atomic(&evtchn->fifo_lastq);
> +        old_v = d->vcpu[lastq.last_vcpu_id];
> +
> +        q = &v->evtchn_fifo->queue[evtchn->priority];
> +        old_q = &old_v->evtchn_fifo->queue[lastq.last_priority];
> +
> +        if ( q <= old_q )
> +        {
> +            spin_lock_irqsave(&q->lock, flags);
> +            if ( q != old_q )
> +                spin_lock(&old_q->lock);
> +        }
> +        else
> +        {
> +            spin_lock_irqsave(&old_q->lock, flags);
> +            spin_lock(&q->lock);
> +        }

Since the vast majority of cases is going to be q == old_q, would
it be worth structuring this like

        if ( q == old_q )
            spin_lock_irqsave(&q->lock, flags);
        else if ( q < old_q )
        {
            spin_lock_irqsave(&q->lock, flags);
            spin_lock(&old_q->lock);
        }
        else
        {
            spin_lock_irqsave(&old_q->lock, flags);
            spin_lock(&q->lock);
        }

saving (on average) half a conditional in this most common
case? (This is specifically different from the double locking in
event_channel.c, where the common case is to have different
entities. In fact double_evtchn_{,un}lock() look to pointlessly
check for chn1 == chn2 - I guess I'll make a patch.)

> +        lastq.raw = read_atomic(&evtchn->fifo_lastq);
> +        old_v = d->vcpu[lastq.last_vcpu_id];
> +        if ( q == &v->evtchn_fifo->queue[evtchn->priority] &&
> +             old_q == &old_v->evtchn_fifo->queue[lastq.last_priority] )
> +            break;
> +
> +        if ( q != old_q )
> +            spin_unlock(&old_q->lock);
> +        spin_unlock_irqrestore(&q->lock, flags);
> +
> +        if ( try == 3 )
> +        {
> +            gprintk(XENLOG_WARNING,
> +                    "dom%d port %d lost event (too many queue changes)\n",
> +                    d->domain_id, evtchn->port);
> +            return;

Originally evtchn_check_pollers() would still have been called
in this case. Wouldn't you better retain this, or else justify
the possibly observable change in behavior?

> @@ -228,22 +239,8 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
>              goto done;
>          }

This if() right above here can, aiui, in principle be moved out
of the surrounding if(), at which point ...

> -        /*
> -         * No locking around getting the queue. This may race with
> -         * changing the priority but we are allowed to signal the
> -         * event once on the old priority.
> -         */
> -        q = &v->evtchn_fifo->queue[evtchn->priority];
> -
> -        old_q = lock_old_queue(d, evtchn, &flags);
> -        if ( !old_q )
> -            goto done;

... with all of this gone ...

>          if ( guest_test_and_set_bit(d, EVTCHN_FIFO_LINKED, word) )
> -        {
> -            spin_unlock_irqrestore(&old_q->lock, flags);
>              goto done;
> -        }

... this could become part of the outer if(), replacing the 2nd
guest_test_bit() there. (Possibly, if deemed worthwhile at all,
to be carried out in a separate follow-on patch, to keep focus
here on the actual goal.)

Jan

