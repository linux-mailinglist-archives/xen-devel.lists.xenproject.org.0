Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E44EA415ABC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 11:17:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193552.344753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKqN-0000av-E5; Thu, 23 Sep 2021 09:16:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193552.344753; Thu, 23 Sep 2021 09:16:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTKqN-0000Z0-B0; Thu, 23 Sep 2021 09:16:39 +0000
Received: by outflank-mailman (input) for mailman id 193552;
 Thu, 23 Sep 2021 09:16:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTKqL-0000Yu-Rk
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 09:16:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKqK-00044Z-AY; Thu, 23 Sep 2021 09:16:36 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTKqJ-0001SO-Ui; Thu, 23 Sep 2021 09:16:36 +0000
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
	bh=DosqaWJh+KATWTaJjQCJvGRIAS0XWqA62VkXi8Iwe30=; b=YA0BhrGP/0bGeP/mBtleTljDTs
	5okFpj3UHSs2f2pCc9eXvvlNTlTehEJedrVzenLGBZrnLMXTZIYUkdCJwOBH9E099TFyib2a4atii
	Y+/9tU7gESTpXp0xf40RULnG+PMc5mfLiJRpkweQM7wzrGR03RnE1AimtZYHRuEj+xLw=;
Subject: Re: [PATCH RFC 2/4] xen: add bitmap to indicate per-domain state
 changes
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20210914123600.1626-1-jgross@suse.com>
 <20210914123600.1626-3-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <cde0c694-a6be-e7c9-99af-fc5602e85cd7@xen.org>
Date: Thu, 23 Sep 2021 14:16:31 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210914123600.1626-3-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 14/09/2021 17:35, Juergen Gross wrote:
> Add a bitmap with one bit per possible domid indicating the respective
> domain has changed its state (created, deleted, dying, crashed,
> shutdown).
> 
> Registering the VIRQ_DOM_EXC event will result in setting the bits for
> all existing domains and resetting all other bits.
> 
> Resetting a bit will be done in a future patch.
> 
> This information is needed for Xenstore to keep track of all domains.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   xen/common/domain.c        | 22 ++++++++++++++++++++++
>   xen/common/event_channel.c |  2 ++
>   xen/include/xen/sched.h    |  2 ++
>   3 files changed, 26 insertions(+)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 755349b93f..14a427e2ef 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -87,6 +87,22 @@ bool __read_mostly vmtrace_available;
>   /* Unique domain identifier, protected by domctl lock. */
>   static uint64_t unique_id;
>   
> +static DECLARE_BITMAP(dom_state_changed, DOMID_MASK + 1);
> +
> +void domain_reset_states(void)
> +{
> +    struct domain *d;
> +
> +    bitmap_zero(dom_state_changed, DOMID_MASK + 1);
> +
> +    rcu_read_lock(&domlist_read_lock);
> +
> +    for_each_domain ( d )
> +        set_bit(d->domain_id, dom_state_changed);
> +
> +    rcu_read_unlock(&domlist_read_lock);
> +}
> +
>   static void __domain_finalise_shutdown(struct domain *d)
>   {
>       struct vcpu *v;
> @@ -101,6 +117,7 @@ static void __domain_finalise_shutdown(struct domain *d)
>               return;
>   
>       d->is_shut_down = 1;
> +    set_bit(d->domain_id, dom_state_changed);

Looking at the follow-up patch, I think you want a smp_wmb() before 
set_bit() otherwise this could be re-ordered on Arm (set_bit() doesn't 
guarantee any ordering). This is to avoid any issue if the new hypercall 
run concurrently.

>       if ( (d->shutdown_code == SHUTDOWN_suspend) && d->suspend_evtchn )
>           evtchn_send(d, d->suspend_evtchn);
>       else
> @@ -720,6 +737,8 @@ struct domain *domain_create(domid_t domid,
>           rcu_assign_pointer(domain_hash[DOMAIN_HASH(domid)], d);
>           spin_unlock(&domlist_update_lock);
>   
> +        set_bit(d->domain_id, dom_state_changed);

Here you should not need one because spin_unlock() contains one.

> +
>           memcpy(d->handle, config->handle, sizeof(d->handle));
>       }
>   
> @@ -954,6 +973,7 @@ int domain_kill(struct domain *d)
>           /* Mem event cleanup has to go here because the rings
>            * have to be put before we call put_domain. */
>           vm_event_cleanup(d);
> +        set_bit(d->domain_id, dom_state_changed);

You might want an smp_wmb() here as well.

>           put_domain(d);
>           send_global_virq(VIRQ_DOM_EXC);
>           /* fallthrough */
> @@ -1141,6 +1161,8 @@ static void complete_domain_destroy(struct rcu_head *head)
>   
>       xfree(d->vcpu);
>   
> +    set_bit(d->domain_id, dom_state_changed);
> +

I think this wants to be moved *after* _domain_destroy() with an 
smp_wmb() between the two. So you when the bit is set you know the 
domain is dead.

>       _domain_destroy(d);
>   
>       send_global_virq(VIRQ_DOM_EXC);
> diff --git a/xen/common/event_channel.c b/xen/common/event_channel.c
> index da88ad141a..e2a416052b 100644
> --- a/xen/common/event_channel.c
> +++ b/xen/common/event_channel.c
> @@ -1218,6 +1218,8 @@ long do_event_channel_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>           rc = evtchn_bind_virq(&bind_virq, 0);
>           if ( !rc && __copy_to_guest(arg, &bind_virq, 1) )
>               rc = -EFAULT; /* Cleaning up here would be a mess! */
> +        if ( !rc && bind_virq.virq == VIRQ_DOM_EXC )
> +            domain_reset_states();
>           break;
>       }
>   
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index b827c5af8d..2ae26bc50e 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -730,6 +730,8 @@ void domain_resume(struct domain *d);
>   
>   int domain_soft_reset(struct domain *d, bool resuming);
>   
> +void domain_reset_states(void);
> +
>   int vcpu_start_shutdown_deferral(struct vcpu *v);
>   void vcpu_end_shutdown_deferral(struct vcpu *v);
>   
> 

Cheers,

-- 
Julien Grall

