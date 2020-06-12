Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB3201F7337
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 06:51:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjbfB-0006jj-0z; Fri, 12 Jun 2020 04:51:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjbf9-0006jd-SU
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 04:51:31 +0000
X-Inumbo-ID: 62026562-ac68-11ea-b5a2-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 62026562-ac68-11ea-b5a2-12813bfff9fa;
 Fri, 12 Jun 2020 04:51:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 02E51AE07;
 Fri, 12 Jun 2020 04:51:33 +0000 (UTC)
Subject: Re: [RFC PATCH v1 3/6] sched, credit2: improve scheduler fairness
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-4-volodymyr_babchuk@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <bb7c8689-d247-0d28-088b-4774ebcdc345@suse.com>
Date: Fri, 12 Jun 2020 06:51:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612002205.174295-4-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.20 02:22, Volodymyr Babchuk wrote:
> Now we can make corrections for scheduling unit run time, based on
> data gathered in previous patches. This includes time spent in IRQ
> handlers and time spent for hypervisor housekeeping tasks. Those time
> spans needs to be deduced from a total run time.
> 
> This patch adds sched_get_time_correction() function which returns
> time correction value. This value should be subtracted by a scheduler
> implementation from a total vCPU/shced_unit run time.
> 
> TODO: Make the corresponding changes to all other schedulers.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/common/sched/core.c    | 23 +++++++++++++++++++++++
>   xen/common/sched/credit2.c |  2 +-
>   xen/common/sched/private.h | 10 ++++++++++
>   3 files changed, 34 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index d597811fef..a7294ff5c3 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -974,6 +974,29 @@ void vcpu_end_hyp_task(struct vcpu *v)
>   #ifndef NDEBUG
>       v->in_hyp_task = false;
>   #endif
> +
> +s_time_t sched_get_time_correction(struct sched_unit *u)
> +{
> +    unsigned long flags;
> +    int irq, hyp;

Using "irq" for a time value is misleading IMO.

> +
> +    while ( true )
> +    {
> +        irq = atomic_read(&u->irq_time);
> +        if ( likely( irq == atomic_cmpxchg(&u->irq_time, irq, 0)) )
> +            break;
> +    }

Just use atomic_xchg()?

> +
> +    while ( true )
> +    {
> +        hyp = atomic_read(&u->hyp_time);
> +        if ( likely( hyp == atomic_cmpxchg(&u->hyp_time, hyp, 0)) )
> +            break;
> +    }
> +
> +    return irq + hyp;

Ah, I didn't look into this patch until now.

You can replace my comments about overflow of an int for patches 1 and 2
with:

   Please modify the comment about not overflowing hinting to the value
   being reset when making scheduling decisions.

And this (of course) needs to be handled in all other schedulers, too.


Juergen

