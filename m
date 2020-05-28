Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 983031E67DC
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 18:55:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeLmx-0002go-UB; Thu, 28 May 2020 16:53:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eoT6=7K=xen.org=roger@srs-us1.protection.inumbo.net>)
 id 1jeLmw-0002gj-UC
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 16:53:51 +0000
X-Inumbo-ID: cd8945e6-a103-11ea-8993-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd8945e6-a103-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 16:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID
 :Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID
 :Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
 Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe
 :List-Post:List-Owner:List-Archive;
 bh=V7w820wa1+fEiEUXpJ2LH8gb1KqjGKuhDd50Xd/mjHU=; b=0TrSdihaJKFYQvsCtP/BitCr8o
 9bP145ncNzi1/fz+2KxzW7JDhd2lYc920mjqP8srn8vR/QQtISxnQvb2/XCr0MnKCVxTSJ4noaje9
 Rl158TF3y4+dBTF9L9w/9O2/yboPztuJvgjDHTtryItG8ari0az+IlwAfTLPHF5uXE5E=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeLmu-0000ea-Id; Thu, 28 May 2020 16:53:48 +0000
Received: from [93.176.191.173] (helo=localhost)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <roger@xen.org>)
 id 1jeLmt-0002EI-Ua; Thu, 28 May 2020 16:53:48 +0000
Date: Thu, 28 May 2020 18:53:41 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger@xen.org>
To: Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
Message-ID: <20200528165341.GH1195@Air-de-Roger>
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 28, 2020 at 04:25:31PM +0100, Bertrand Marquis wrote:
> At the moment on Arm, a Linux guest running with KTPI enabled will
> cause the following error when a context switch happens in user mode:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> 
> This patch is modifying runstate handling to map the area given by the
> guest inside Xen during the hypercall.
> This is removing the guest virtual to physical conversion during context
> switches which removes the bug and improve performance by preventing to
> walk page tables during context switches.
> 
> --
> In the current status, this patch is only working on Arm and needs to
> be fixed on X86 (see #error on domain.c for missing get_page_from_gva).
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/domain.c   | 32 +++++++++-------
>  xen/arch/x86/domain.c   | 51 ++++++++++++++-----------
>  xen/common/domain.c     | 84 ++++++++++++++++++++++++++++++++++-------
>  xen/include/xen/sched.h | 11 ++++--
>  4 files changed, 124 insertions(+), 54 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 31169326b2..799b0e0103 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -278,33 +278,37 @@ static void ctxt_switch_to(struct vcpu *n)
>  /* Update per-VCPU guest runstate shared memory area (if registered). */
>  static void update_runstate_area(struct vcpu *v)
>  {
> -    void __user *guest_handle = NULL;
> -    struct vcpu_runstate_info runstate;
> +    struct vcpu_runstate_info *runstate;
>  
> -    if ( guest_handle_is_null(runstate_guest(v)) )
> +    /* XXX why do we accept not to block here */
> +    if ( !spin_trylock(&v->runstate_guest_lock) )

IMO the runstate is not a crucial piece of information, so it's better
to context switch fast.

>          return;
>  
> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> +    runstate = runstate_guest(v);
> +
> +    if (runstate == NULL)

In general we don't explicitly check for NULL, and you could write
this as:

    if ( runstate ) ...

Note the adding spaces between parentheses and the condition. I would
also likely check runstate_guest(v) directly and assign to runstate
afterwards if it's set.

> +    {
> +        spin_unlock(&v->runstate_guest_lock);
> +        return;
> +    }
>  
>      if ( VM_ASSIST(v->domain, runstate_update_flag) )
>      {
> -        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
> -        guest_handle--;
> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +        runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>          smp_wmb();
> +        v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>      }
>  
> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    memcpy(runstate, &v->runstate, sizeof(v->runstate));
>  
> -    if ( guest_handle )
> +    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>      {
> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +        runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>          smp_wmb();

I think you need the barrier before clearing XEN_RUNSTATE_UPDATE from
the guest version of the runstate info, to make sure writes are not
re-ordered and hence that the XEN_RUNSTATE_UPDATE flag in the guest
version is not cleared before the full write has been committed?

> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +        v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>      }
> +
> +    spin_unlock(&v->runstate_guest_lock);
>  }
>  
>  static void schedule_tail(struct vcpu *prev)
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index 6327ba0790..10c6ceb561 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1642,57 +1642,62 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
>  /* Update per-VCPU guest runstate shared memory area (if registered). */
>  bool update_runstate_area(struct vcpu *v)
>  {
> -    bool rc;
>      struct guest_memory_policy policy = { .nested_guest_mode = false };
> -    void __user *guest_handle = NULL;
> -    struct vcpu_runstate_info runstate;
> +    struct vcpu_runstate_info *runstate;
>  
> -    if ( guest_handle_is_null(runstate_guest(v)) )
> +    /* XXX: should we return false ? */
> +    if ( !spin_trylock(&v->runstate_guest_lock) )
>          return true;
>  
> -    update_guest_memory_policy(v, &policy);
> +    runstate = runstate_guest(v);
>  
> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> +    if (runstate == NULL)
> +    {
> +        spin_unlock(&v->runstate_guest_lock);
> +        return true;
> +    }
> +
> +    update_guest_memory_policy(v, &policy);
>  
>      if ( VM_ASSIST(v->domain, runstate_update_flag) )
>      {
> -        guest_handle = has_32bit_shinfo(v->domain)
> -            ? &v->runstate_guest.compat.p->state_entry_time + 1
> -            : &v->runstate_guest.native.p->state_entry_time + 1;
> -        guest_handle--;
> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +        runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>          smp_wmb();
> +        if (has_32bit_shinfo(v->domain))
> +            v->runstate_guest.compat->state_entry_time |= XEN_RUNSTATE_UPDATE;
> +        else
> +            v->runstate_guest.native->state_entry_time |= XEN_RUNSTATE_UPDATE;

I'm confused here, isn't runstate == v->runstate_guest.native at this
point?

I think you want to update v->runstate.state_entry_time here?

>      }
>  
>      if ( has_32bit_shinfo(v->domain) )
>      {
>          struct compat_vcpu_runstate_info info;
> -
>          XLAT_vcpu_runstate_info(&info, &runstate);
> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
> -        rc = true;
> +        memcpy(v->runstate_guest.compat, &info, 1);
>      }
>      else
> -        rc = __copy_to_guest(runstate_guest(v), &runstate, 1) !=
> -             sizeof(runstate);
> +        memcpy(runstate, &v->runstate, sizeof(v->runstate));
>  
> -    if ( guest_handle )
> +    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>      {
> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +        runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>          smp_wmb();
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +        if (has_32bit_shinfo(v->domain))
> +            v->runstate_guest.compat->state_entry_time |= XEN_RUNSTATE_UPDATE;
> +        else
> +            v->runstate_guest.native->state_entry_time |= XEN_RUNSTATE_UPDATE;

Same comment here related to the usage of runstate_guest instead of
runstate.

>      }
>  
> +    spin_unlock(&v->runstate_guest_lock);
> +
>      update_guest_memory_policy(v, &policy);
>  
> -    return rc;
> +    return true;
>  }
>  
>  static void _update_runstate_area(struct vcpu *v)
>  {
> +    /* XXX: this should be removed */
>      if ( !update_runstate_area(v) && is_pv_vcpu(v) &&
>           !(v->arch.flags & TF_kernel_mode) )
>          v->arch.pv.need_update_runstate_area = 1;
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7cc9526139..acc6f90ba3 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -161,6 +161,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      v->dirty_cpu = VCPU_CPU_CLEAN;
>  
>      spin_lock_init(&v->virq_lock);
> +    spin_lock_init(&v->runstate_guest_lock);
>  
>      tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
>  
> @@ -691,6 +692,66 @@ int rcu_lock_live_remote_domain_by_id(domid_t dom, struct domain **d)
>      return 0;
>  }
>  
> +static void  unmap_runstate_area(struct vcpu *v, unsigned int lock)

lock wants to be a bool here.

> +{
> +    mfn_t mfn;
> +
> +    if ( ! runstate_guest(v) )
> +        return;

I think you must check runstate_guest with the lock taken?

> +
> +    if (lock)
> +        spin_lock(&v->runstate_guest_lock);
> +
> +    mfn = domain_page_map_to_mfn(runstate_guest(v));
> +
> +    unmap_domain_page_global((void *)
> +                            ((unsigned long)v->runstate_guest &
> +                             PAGE_MASK));
> +
> +    put_page_and_type(mfn_to_page(mfn));
> +    runstate_guest(v) = NULL;
> +
> +    if (lock)
> +        spin_unlock(&v->runstate_guest_lock);
> +}
> +
> +static int map_runstate_area(struct vcpu *v,
> +                    struct vcpu_register_runstate_memory_area *area)
> +{
> +    unsigned long offset = area->addr.p & ~PAGE_MASK;
> +    void *mapping;
> +    struct page_info *page;
> +    size_t size = sizeof(struct vcpu_runstate_info);
> +
> +    ASSERT(runstate_guest(v) == NULL);
> +
> +    /* do not allow an area crossing 2 pages */
> +    if ( offset > (PAGE_SIZE - size) )
> +        return -EINVAL;

I'm afraid this is not suitable, Linux will BUG if
VCPUOP_register_runstate_memory_area returns an error, and current
Linux code doesn't check that the area doesn't cross a page
boundary. You will need to take a reference to the possible two pages
in that case.

> +
> +#ifdef CONFIG_ARM
> +    page = get_page_from_gva(v, area->addr.p, GV2M_WRITE);
> +#else
> +    /* XXX how to solve this one ? */

We have hvm_translate_get_page which seems similar, will need to look
into this.

> +#error get_page_from_gva is not available on other archs
> +#endif
> +    if ( !page )
> +        return -EINVAL;
> +
> +    mapping = __map_domain_page_global(page);
> +
> +    if ( mapping == NULL )
> +    {
> +        put_page_and_type(page);
> +        return -ENOMEM;
> +    }
> +
> +    runstate_guest(v) = (struct vcpu_runstate_info *)
> +        ((unsigned long)mapping + offset);

There's no need to cast to unsigned long, you can just do pointer
arithmetic on the void * directly. That should also get rid of the
cast to vcpu_runstate_info I think.

> +
> +    return 0;
> +}
> +
>  int domain_kill(struct domain *d)
>  {
>      int rc = 0;
> @@ -727,7 +788,10 @@ int domain_kill(struct domain *d)
>          if ( cpupool_move_domain(d, cpupool0) )
>              return -ERESTART;
>          for_each_vcpu ( d, v )
> +        {
> +            unmap_runstate_area(v, 0);

Why is it not appropriate here to hold the lock? It might not be
technically needed, but still should work?

Thanks, Roger.

