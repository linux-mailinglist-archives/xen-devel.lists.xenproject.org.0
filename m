Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AEAB9297264
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 17:35:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11086.29369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVz5E-00010Q-R4; Fri, 23 Oct 2020 15:34:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11086.29369; Fri, 23 Oct 2020 15:34:24 +0000
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
	id 1kVz5E-000101-O2; Fri, 23 Oct 2020 15:34:24 +0000
Received: by outflank-mailman (input) for mailman id 11086;
 Fri, 23 Oct 2020 15:34:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kVz5D-0000zw-E3
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:34:23 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 773f0138-09e0-42a3-9c7c-9da0025a6e9d;
 Fri, 23 Oct 2020 15:34:22 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 99051AF2D;
 Fri, 23 Oct 2020 15:34:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gNxR=D6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kVz5D-0000zw-E3
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 15:34:23 +0000
X-Inumbo-ID: 773f0138-09e0-42a3-9c7c-9da0025a6e9d
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 773f0138-09e0-42a3-9c7c-9da0025a6e9d;
	Fri, 23 Oct 2020 15:34:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1603467261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VnS3/Hfvrb1x6FATDdrnpzKKnHSYkuOy25LKm1xXJRA=;
	b=XQm8qtFycOmtQ0XPyyraijA3418RFhPyVnA6B5BaV52VMnxh0sdXQEDhpZvH7H0oKMnMef
	HkD2xA2ZXtNpYuHm5bBKuD1F2p3DBTII7MXBMzNx57lpe8m9gDFbSvw/1jLWSS0NzDi8Gz
	g30MmS58rI7EjiVPgzI6Qb72D1xdfnQ=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 99051AF2D;
	Fri, 23 Oct 2020 15:34:21 +0000 (UTC)
Subject: Re: [PATCH v2 10/11] x86/vpt: remove vPT timers per-vCPU lists
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <20200930104108.35969-1-roger.pau@citrix.com>
 <20200930104108.35969-11-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <201eec52-4886-a8f5-3f56-b24ce066b17d@suse.com>
Date: Fri, 23 Oct 2020 17:34:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200930104108.35969-11-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 30.09.2020 12:41, Roger Pau Monne wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1964,7 +1964,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>      vpmu_switch_from(prev);
>      np2m_schedule(NP2M_SCHEDLE_OUT);
>  
> -    if ( is_hvm_domain(prevd) && !list_empty(&prev->arch.hvm.tm_list) )
> +    if ( is_hvm_domain(prevd) )
>          pt_save_timer(prev);

While most of the function goes away, pt_freeze_time() now will get
called in cases it previously wasn't called - is this benign?

> @@ -195,50 +182,20 @@ static void pt_thaw_time(struct vcpu *v)
>  
>  void pt_save_timer(struct vcpu *v)
>  {
> -    struct list_head *head = &v->arch.hvm.tm_list;
> -    struct periodic_time *pt;
> -
> -    if ( v->pause_flags & VPF_blocked )
> -        return;
> -
> -    pt_vcpu_lock(v);
> -
> -    list_for_each_entry ( pt, head, list )
> -        if ( !pt->do_not_freeze )
> -            stop_timer(&pt->timer);
>  
>      pt_freeze_time(v);
> -
> -    pt_vcpu_unlock(v);
>  }
>  
>  void pt_restore_timer(struct vcpu *v)
>  {
> -    struct list_head *head = &v->arch.hvm.tm_list;
> -    struct periodic_time *pt;
> -
> -    pt_vcpu_lock(v);
> -
> -    list_for_each_entry ( pt, head, list )
> -        if ( pt->pending_intr_nr == 0 )
> -            set_timer(&pt->timer, pt->scheduled);
> -
>      pt_thaw_time(v);
> -
> -    pt_vcpu_unlock(v);
>  }

In both functions the single function called also is the only
time it is used anywhere, so I guess the extra layer could be
removed.

> @@ -402,8 +339,7 @@ void create_periodic_time(
>      write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
>  
>      pt->pending_intr_nr = 0;
> -    pt->do_not_freeze = 0;
> -    pt->irq_issued = 0;
> +    pt->masked = false;

I agree here, but ...

> @@ -479,10 +412,8 @@ void destroy_periodic_time(struct periodic_time *pt)
>          return;
>  
>      pt_lock(pt);
> -    if ( pt->on_list )
> -        list_del(&pt->list);
> -    pt->on_list = 0;
>      pt->pending_intr_nr = 0;
> +    pt->masked = false;

... why not "true" here, at the very least for pt_active()'s sake?

> --- a/xen/include/asm-x86/hvm/vpt.h
> +++ b/xen/include/asm-x86/hvm/vpt.h
> @@ -31,13 +31,10 @@
>  typedef void time_cb(struct vcpu *v, void *opaque);
>  
>  struct periodic_time {
> -    struct list_head list;
> -    bool on_list;
>      bool one_shot;
> -    bool do_not_freeze;
> -    bool irq_issued;
>      bool warned_timeout_too_short;
>      bool level;
> +    bool masked;

"masked" aiui doesn't say anything about the present state of a
timer, but about its state the last time an interrupt was
attempted to be injected. If this is right, either a name change
("last_seen_masked" is somewhat longish) might be helpful, but
at the very least I'd like to ask for a comment to this effect.

> @@ -158,7 +153,7 @@ void pt_adjust_global_vcpu_target(struct vcpu *v);
>  void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt);
>  
>  /* Is given periodic timer active? */
> -#define pt_active(pt) ((pt)->on_list || (pt)->pending_intr_nr)
> +#define pt_active(pt) !(pt)->masked

This wants parentheses around it. And why does the right side of the
|| go away?

Jan

