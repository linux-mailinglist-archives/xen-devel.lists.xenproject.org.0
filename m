Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08534CD6C
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 11:57:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.102904.196439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQodo-0006X8-Ft; Mon, 29 Mar 2021 09:57:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 102904.196439; Mon, 29 Mar 2021 09:57:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQodo-0006Wj-Cm; Mon, 29 Mar 2021 09:57:00 +0000
Received: by outflank-mailman (input) for mailman id 102904;
 Mon, 29 Mar 2021 09:56:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQodm-0006We-TQ
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 09:56:58 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 71d49137-e3ee-413f-a418-ffc3d32b1a08;
 Mon, 29 Mar 2021 09:56:57 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1CD8DB458;
 Mon, 29 Mar 2021 09:56:56 +0000 (UTC)
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
X-Inumbo-ID: 71d49137-e3ee-413f-a418-ffc3d32b1a08
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617011816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VR1iVy6u40PBqoLa2t7L3HKx1ALmz/o0fg2m/ck6hA=;
	b=rMiR1K9INUEPbsUxHknwcnK1ISmeVkHc6wP3DXT25m2mtTHP2T7HSxJMROjR1VfHmGnK59
	38vIIQYHLCMs2VTyd86kb5e/JSAgszHhApt/98IIiqLrWGfq/3+TH8EcH5Ff4hJJ5h+CLc
	DApiCNtu+T47WV4wVqrDjZJXkRf2nKE=
Subject: Re: [PATCH v2] x86/vpt: Do not take pt_migrate rwlock in some cases
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>, roger.pau@citrix.com
Cc: andrew.cooper3@citrix.com, wl@xen.org, stephen.s.brennan@oracle.com,
 iwj@xenproject.org, xen-devel@lists.xenproject.org
References: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82868938-bf57-25c2-38f6-1ec8e9c92362@suse.com>
Date: Mon, 29 Mar 2021 11:56:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1616809866-30837-1-git-send-email-boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.03.2021 02:51, Boris Ostrovsky wrote:
> Commit 8e76aef72820 ("x86/vpt: fix race when migrating timers between
> vCPUs") addressed XSA-336 by introducing a per-domain rwlock that was
> intended to protect periodic timer during VCPU migration. Since such
> migration is an infrequent event no performance impact was expected.
> 
> Unfortunately this turned out not to be the case: on a fairly large
> guest (92 VCPUs) we've observed as much as 40% TPCC performance
> regression with some guest kernels. Further investigation pointed to
> pt_migrate read lock taken in pt_update_irq() as the largest contributor
> to this regression. With large number of VCPUs and large number of VMEXITs
> (from where pt_update_irq() is always called) the update of an atomic in
> read_lock() is thought to be the main cause.
> 
> Stephen Brennan analyzed locking pattern and classified lock users as
> follows:
> 
> 1. Functions which read (maybe write) all periodic_time instances
> attached to a particular vCPU. These are functions which use pt_vcpu_lock()
> after the commit, such as pt_restore_timer(), pt_save_timer(), etc.
> 2. Functions which want to modify a particular periodic_time object.
> These guys lock whichever vCPU the periodic_time is attached to, but
> since the vCPU could be modified without holding any lock, they are
> vulnerable to the bug. Functions in this group use pt_lock(), such as
> pt_timer_fn() or destroy_periodic_time().
> 3. Functions which not only want to modify the periodic_time, but also
> would like to modify the =vcpu= fields. These are create_periodic_time()
> or pt_adjust_vcpu(). They create the locking imbalance bug for group 2,
> but we can't simply hold 2 vcpu locks due to the deadlock risk.
> 
> Roger Monné then pointed out that group 1 functions don't really need
> to hold the pt_migrate rwlock and that group 3 should be hardened by
> holding appropriate vcpu's tm_lock when adding or deleting a timer
> from its list.

I'm struggling some with the latter aspect: Is this to mean there is
something wrong right now? Or does "harden" really mean "just to be
on the safe side" here? In the latter case I'm not really certain we
should add such extra locking, in particular if any of this might be
on a frequently executed code path. Leaving respective comments there
instead might be an option.

> @@ -543,8 +554,10 @@ void create_periodic_time(
>      pt->cb = cb;
>      pt->priv = data;
>  
> +    pt_vcpu_lock(pt->vcpu);
>      pt->on_list = 1;
>      list_add(&pt->list, &v->arch.hvm.tm_list);
> +    pt_vcpu_unlock(pt->vcpu);

I think it would be better (not just code generation wise) to use v
here.

> @@ -580,13 +593,22 @@ static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
>          return;
>  
>      write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
> +
> +    pt_vcpu_lock(pt->vcpu);
> +    if ( pt->on_list )
> +        list_del(&pt->list);
> +    pt_vcpu_unlock(pt->vcpu);

While these two obviously can't use v, ...

>      pt->vcpu = v;
> +
> +    pt_vcpu_lock(pt->vcpu);
>      if ( pt->on_list )
>      {
> -        list_del(&pt->list);
>          list_add(&pt->list, &v->arch.hvm.tm_list);
>          migrate_timer(&pt->timer, v->processor);
>      }
> +    pt_vcpu_unlock(pt->vcpu);

... these two again could (and imo should), and ...

>      write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);

... really this and its counterpart better would do so, too (albeit
perhaps in a separate patch).

While I see that pt_adjust_global_vcpu_target() (the only caller of
pt_adjust_vcpu()) already avoids calling here when the vcpu there
doesn't really change, I also think that with all this extra locking
the function now would better short-circuit the case of
pt->vcpu == v upon entry (or more precisely once the write lock was
acquired).

> --- a/xen/include/asm-x86/hvm/vpt.h
> +++ b/xen/include/asm-x86/hvm/vpt.h
> @@ -129,10 +129,10 @@ struct pl_time {    /* platform time */
>      struct HPETState vhpet;
>      struct PMTState  vpmt;
>      /*
> -     * rwlock to prevent periodic_time vCPU migration. Take the lock in read
> -     * mode in order to prevent the vcpu field of periodic_time from changing.
> -     * Lock must be taken in write mode when changes to the vcpu field are
> -     * performed, as it allows exclusive access to all the timers of a domain.
> +     * Functions which want to modify the vcpu field of the vpt need to
> +     * hold the global lock (pt_migrate) in write mode together with the
> +     * per-vcpu locks of the lists being modified. Note that two vcpu
> +     * locks cannot be held at the same time to avoid a deadlock.
>       */
>      rwlock_t pt_migrate;

It looks to me as if some information got lost here, most notably the
scope of the write lock and (somewhat related) what holding the lock
in read mode protects against.

Jan

