Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E0A35F180
	for <lists+xen-devel@lfdr.de>; Wed, 14 Apr 2021 12:29:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.110468.210850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWclL-0000Rk-Ny; Wed, 14 Apr 2021 10:28:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 110468.210850; Wed, 14 Apr 2021 10:28:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWclL-0000RL-L0; Wed, 14 Apr 2021 10:28:47 +0000
Received: by outflank-mailman (input) for mailman id 110468;
 Wed, 14 Apr 2021 10:28:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WBRZ=JL=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWclJ-0000RG-WB
 for xen-devel@lists.xenproject.org; Wed, 14 Apr 2021 10:28:46 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0eab6827-1a23-482f-86a6-a43ad752a571;
 Wed, 14 Apr 2021 10:28:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F2430AF1B;
 Wed, 14 Apr 2021 10:28:43 +0000 (UTC)
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
X-Inumbo-ID: 0eab6827-1a23-482f-86a6-a43ad752a571
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618396124; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vx6yvnljraKb49dLF7QaTMGoGqZ18mU4KgqLll7LCrA=;
	b=ie2vTP0DjM+3mLAnruqP+eKmHUmSedrSRVw2MVJokR72+Gn6Qu5B9pB2k2UafAyEaN8iVC
	wfI0PvxY48/VR5eXSFo9/Pvnwli+XkPk8TCrFyHHSk2HFTYesT2k8SSK4pz0mxQav909hd
	SyXefyngSftc7KgQ7aMfrfXktrcTm3w=
Subject: Re: [PATCH v3 09/11] x86/vpt: switch interrupt injection model
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 xen-devel@lists.xenproject.org
References: <20210331103303.79705-1-roger.pau@citrix.com>
 <20210331103303.79705-10-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3cb01098-887b-c952-1f93-e89c443ba471@suse.com>
Date: Wed, 14 Apr 2021 12:28:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210331103303.79705-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 31.03.2021 12:33, Roger Pau Monne wrote:
> ---
>  xen/arch/x86/hvm/svm/intr.c   |   3 -
>  xen/arch/x86/hvm/vmx/intr.c   |  59 ------
>  xen/arch/x86/hvm/vpt.c        | 334 ++++++++++++++--------------------
>  xen/include/asm-x86/hvm/vpt.h |   5 +-
>  4 files changed, 143 insertions(+), 258 deletions(-)

Nice.

> @@ -285,189 +238,144 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
>              list_del(&pt->list);
>          pt->on_list = false;
>          pt->pending_intr_nr = 0;
> +
> +        return;
>      }
> -    else if ( mode_is(v->domain, one_missed_tick_pending) ||
> -              mode_is(v->domain, no_missed_ticks_pending) )
> +
> +    if ( mode_is(v->domain, one_missed_tick_pending) ||
> +         mode_is(v->domain, no_missed_ticks_pending) )
>      {
> -        pt->last_plt_gtime = hvm_get_guest_time(v);
>          pt_process_missed_ticks(pt);
>          pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
> +    }
> +    else if ( !pt->pending_intr_nr )
> +        pt_process_missed_ticks(pt);

Did you lose a -- here? I.e. does the condition mean to match ...

> +    if ( !pt->pending_intr_nr )
>          set_timer(&pt->timer, pt->scheduled);
> +}
> +
> +static void pt_timer_fn(void *data)
> +{
> +    struct periodic_time *pt = data;
> +    struct vcpu *v;
> +    time_cb *cb = NULL;
> +    void *cb_priv;
> +    unsigned int irq;
> +
> +    pt_lock(pt);
> +
> +    v = pt->vcpu;
> +    irq = pt->irq;
> +
> +    if ( inject_interrupt(pt) )
> +    {
> +        pt->scheduled += pt->period;
> +        pt->do_not_freeze = 0;
> +        cb = pt->cb;
> +        cb_priv = pt->priv;
>      }
>      else
>      {
> -        pt->last_plt_gtime += pt->period;
> -        if ( --pt->pending_intr_nr == 0 )

... this original code? Otherwise I can't see why the condition
guards a pt_process_missed_ticks() invocation.

> @@ -617,20 +556,29 @@ void pt_adjust_global_vcpu_target(struct vcpu *v)
>      write_unlock(&pl_time->vhpet.lock);
>  }
>  
> -
>  static void pt_resume(struct periodic_time *pt)
>  {
> +    struct vcpu *v;
> +    time_cb *cb = NULL;
> +    void *cb_priv;
> +
>      if ( pt->vcpu == NULL )
>          return;
>  
>      pt_lock(pt);
> -    if ( pt->pending_intr_nr && !pt->on_list )
> +    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
>      {
> +        pt->pending_intr_nr--;
> +        cb = pt->cb;
> +        cb_priv = pt->priv;
> +        v = pt->vcpu;
>          pt->on_list = 1;
>          list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
> -        vcpu_kick(pt->vcpu);
>      }
>      pt_unlock(pt);
> +
> +    if ( cb )
> +        cb(v, cb_priv);
>  }

I'm afraid until we raise our supported gcc versions baseline, v and
cb_priv will need an initializer at the top of the function just like
cb.

Jan

