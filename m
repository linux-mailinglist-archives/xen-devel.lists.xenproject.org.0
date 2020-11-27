Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD112C6671
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:12:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39272.72109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kidXZ-0006PZ-33; Fri, 27 Nov 2020 13:11:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39272.72109; Fri, 27 Nov 2020 13:11:57 +0000
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
	id 1kidXY-0006PA-WD; Fri, 27 Nov 2020 13:11:57 +0000
Received: by outflank-mailman (input) for mailman id 39272;
 Fri, 27 Nov 2020 13:11:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kidXX-0006P5-Gr
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:11:55 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id edaf4074-d24e-4c8f-b6a7-9a4507984c69;
 Fri, 27 Nov 2020 13:11:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 9C3ABAC23;
 Fri, 27 Nov 2020 13:11:53 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kidXX-0006P5-Gr
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:11:55 +0000
X-Inumbo-ID: edaf4074-d24e-4c8f-b6a7-9a4507984c69
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id edaf4074-d24e-4c8f-b6a7-9a4507984c69;
	Fri, 27 Nov 2020 13:11:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606482713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3v2UGyUuI7U3dO4RaooUybwMo/sdlaSTWY5yUtOWWbc=;
	b=tf2O7SeDJ+FW5H+sJpQ4wTeP9jKZxN3RUoEjTtgO4C43SIyZfF6QjwMYz0fDk7WADL+h2l
	5qiIZIJB+jQyJ1dhB++xydfRPX2YS7NIuffb0pPIwTQLJ52zus2VS7SF1bm7m7z1GSFlpS
	ORNwAIJh8ikDF9g+6T81kHpir+XbXNU=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9C3ABAC23;
	Fri, 27 Nov 2020 13:11:53 +0000 (UTC)
Subject: Re: [PATCH v8 2/3] xen/events: rework fifo queue locking
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201125105122.3650-1-jgross@suse.com>
 <20201125105122.3650-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <68bbc88a-075e-327b-47e1-1dca1f9a3772@suse.com>
Date: Fri, 27 Nov 2020 14:11:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201125105122.3650-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.11.2020 11:51, Juergen Gross wrote:
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

I notice you've altered the Fixes: tag, but you still say "from
the beginning" here.

> Using a spinlock for the per event channel lock is problematic due to
> some paths needing to take the lock are called with interrupts off, so
> the lock would need to disable interrupts, which in turn breaks some
> use cases related to vm events.

This reads as if it got put here by mistake. May I suggest to start
with "Using ... had turned out problematic ..." and then add
something like "Therefore that lock was switched to an rw one"?

> For avoiding this race the queue locking in evtchn_fifo_set_pending()
> needs to be reworked to cover the test of EVTCHN_FIFO_PENDING,
> EVTCHN_FIFO_MASKED and EVTCHN_FIFO_LINKED, too. Additionally when an
> event channel needs to change queues both queues need to be locked
> initially.

"... in order to avoid having a window with no lock held at all"?

> @@ -204,17 +175,67 @@ static void evtchn_fifo_set_pending(struct vcpu *v, struct evtchn *evtchn)
>          return;
>      }
>  
> +    /*
> +     * Lock all queues related to the event channel (in case of a queue change
> +     * this might be two).
> +     * It is mandatory to do that before setting and testing the PENDING bit
> +     * and to hold the current queue lock until the event has put into the

"has been" or "was" I think?

With adjustments along these lines (which I guess could again be
done while committing) or reasons against supplied
Reviewed-by: Jan Beulich <jbeulich@suse.com>

One aspect which I wonder whether it wants adding to the description
is that this change makes a bad situation worse: Back at the time
per-channel locks were added to avoid the bottleneck of the per-
domain event lock. While a per-queue lock's scope at least isn't the
entire domain, their use on the send path still has been preventing
full parallelism here. And this patch widens the lock holding region.
If at least there was a fast path not requiring any locking ...

Jan

