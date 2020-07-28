Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E735A231224
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jul 2020 21:05:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k0Uto-0004mB-B6; Tue, 28 Jul 2020 19:04:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=o87v=BH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k0Utn-0004m6-5o
 for xen-devel@lists.xenproject.org; Tue, 28 Jul 2020 19:04:27 +0000
X-Inumbo-ID: 2741c956-d105-11ea-a925-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2741c956-d105-11ea-a925-12813bfff9fa;
 Tue, 28 Jul 2020 19:04:25 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62AF522C9E;
 Tue, 28 Jul 2020 19:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595963064;
 bh=YFQxmi5He0aDdYwkXuovzDD7FsIUx1MG20jPnRJI0fo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=wRi4h7oV6D05WDvmsw9f63RzEm6Hc0cDWlINpRvh2oyIxmENkrGJP54eij5VCZzE7
 DMG9xNRQy7uzWFggfVtZRdvr1uEU0t8/tJPE45kCN3YZ+7eeQqxt6D1ESdqsuH2gvS
 JHWAqJXw2fryiVSVr6lhheo9gMTVL7LUXjzIBmSc=
Date: Tue, 28 Jul 2020 12:04:23 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH v2] xen/arm: Convert runstate address during hypcall
In-Reply-To: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2007281153110.646@sstabellini-ThinkPad-T480s>
References: <4647a019c7b42d40d3c2f5b0a3685954bea7f982.1595948219.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 28 Jul 2020, Bertrand Marquis wrote:
> At the moment on Arm, a Linux guest running with KTPI enabled will
> cause the following error when a context switch happens in user mode:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> 
> The error is caused by the virtual address for the runstate area
> registered by the guest only being accessible when the guest is running
> in kernel space when KPTI is enabled.
> 
> To solve this issue, this patch is doing the translation from virtual
> address to physical address during the hypercall and mapping the
> required pages using vmap. This is removing the conversion from virtual
> to physical address during the context switch which is solving the
> problem with KPTI.
> 
> This is done only on arm architecture, the behaviour on x86 is not
> modified by this patch and the address conversion is done as before
> during each context switch.
> 
> This is introducing several limitations in comparison to the previous
> behaviour (on arm only):
> - if the guest is remapping the area at a different physical address Xen
> will continue to update the area at the previous physical address. As
> the area is in kernel space and usually defined as a global variable this
> is something which is believed not to happen. If this is required by a
> guest, it will have to call the hypercall with the new area (even if it
> is at the same virtual address).
> - the area needs to be mapped during the hypercall. For the same reasons
> as for the previous case, even if the area is registered for a different
> vcpu. It is believed that registering an area using a virtual address
> unmapped is not something done.
> 
> inline functions in headers could not be used as the architecture
> domain.h is included before the global domain.h making it impossible
> to use the struct vcpu inside the architecture header.
> This should not have any performance impact as the hypercall is only
> called once per vcpu usually.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   Changes in v2
>     - use vmap to map the pages during the hypercall.
>     - reintroduce initial copy during hypercall.
> 
> ---
>  xen/arch/arm/domain.c        | 160 +++++++++++++++++++++++++++++++----
>  xen/arch/x86/domain.c        |  30 ++++++-
>  xen/arch/x86/x86_64/domain.c |   4 +-
>  xen/common/domain.c          |  19 ++---
>  xen/include/asm-arm/domain.h |   9 ++
>  xen/include/asm-x86/domain.h |  16 ++++
>  xen/include/xen/domain.h     |   5 ++
>  xen/include/xen/sched.h      |  16 +---
>  8 files changed, 207 insertions(+), 52 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 31169326b2..c595438bd9 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -19,6 +19,7 @@
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
> +#include <xen/vmap.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/cpuerrata.h>
> @@ -275,36 +276,157 @@ static void ctxt_switch_to(struct vcpu *n)
>      virt_timer_restore(n);
>  }
>  
> -/* Update per-VCPU guest runstate shared memory area (if registered). */
> -static void update_runstate_area(struct vcpu *v)
> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
> +{
> +    if ( v->arch.runstate_guest )
> +    {
> +        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_MASK));
> +
> +        put_page(v->arch.runstate_guest_page[0]);
> +
> +        if ( v->arch.runstate_guest_page[1] )
> +        {
> +            put_page(v->arch.runstate_guest_page[1]);
> +        }
> +        v->arch.runstate_guest = NULL;
> +    }
> +}
> +
> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
>  {
> -    void __user *guest_handle = NULL;
> +    spin_lock(&v->arch.runstate_guest_lock);
> +
> +    cleanup_runstate_vcpu_locked(v);
> +
> +    spin_unlock(&v->arch.runstate_guest_lock);
> +}
> +
> +static int setup_runstate_vcpu_locked(struct vcpu *v, vaddr_t vaddr)
> +{
> +    unsigned int offset;
> +    mfn_t mfn[2];
> +    struct page_info *page;
> +    unsigned int numpages;
>      struct vcpu_runstate_info runstate;
> +    void *p;
>  
> -    if ( guest_handle_is_null(runstate_guest(v)) )
> -        return;
> +    /* user can pass a NULL address to unregister a previous area */
> +    if ( vaddr == 0 )
> +        return 0;
>  
> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> +    offset = vaddr & ~PAGE_MASK;
>  
> -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +    /* provided address must be aligned to a 64bit */
> +    if ( offset % alignof(struct vcpu_runstate_info) )
>      {
> -        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
> -        guest_handle--;
> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> -        smp_wmb();
> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
> +                "Invalid offset\n", vaddr);
> +        return -EINVAL;
> +    }
> +
> +    page = get_page_from_gva(v, vaddr, GV2M_WRITE);
> +    if ( !page )
> +    {
> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
> +                "Page is not mapped\n", vaddr);
> +        return -EINVAL;
> +    }
> +    mfn[0] = page_to_mfn(page);
> +    v->arch.runstate_guest_page[0] = page;
> +
> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
> +    {
> +        /* guest area is crossing pages */
> +        page = get_page_from_gva(v, vaddr + PAGE_SIZE, GV2M_WRITE);
> +        if ( !page )
> +        {
> +            put_page(v->arch.runstate_guest_page[0]);
> +            gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
> +                    "2nd Page is not mapped\n", vaddr);
> +            return -EINVAL;
> +        }
> +        mfn[1] = page_to_mfn(page);
> +        v->arch.runstate_guest_page[1] = page;
> +        numpages = 2;
> +    }
> +    else
> +    {
> +        v->arch.runstate_guest_page[1] = NULL;
> +        numpages = 1;
> +    }
> +
> +    p = vmap(mfn, numpages);
> +    if ( !p )
> +    {
> +        put_page(v->arch.runstate_guest_page[0]);
> +        if ( numpages == 2 )
> +            put_page(v->arch.runstate_guest_page[1]);
> +
> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
> +                "vmap error\n", vaddr);
> +        return -EINVAL;
>      }
>  
> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    v->arch.runstate_guest = p + offset;
>  
> -    if ( guest_handle )
> +    if (v == current)
>      {
> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
> +    }
> +    else
> +    {
> +        vcpu_runstate_get(v, &runstate);
> +        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate));
> +    }
> +
> +    return 0;
> +}


The arm32 build breaks with:

domain.c: In function 'setup_runstate_vcpu_locked':
domain.c:322:9: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'vaddr_t' [-Werror=format=]
         gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
         ^
domain.c:330:9: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'vaddr_t' [-Werror=format=]
         gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
         ^
domain.c:344:13: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'vaddr_t' [-Werror=format=]
             gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
             ^
domain.c:365:9: error: format '%lx' expects argument of type 'long unsigned int', but argument 3 has type 'vaddr_t' [-Werror=format=]
         gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%lx: "
         ^
cc1: all warnings being treated as errors


> +int arch_vcpu_setup_runstate(struct vcpu *v,
> +                             struct vcpu_register_runstate_memory_area area)
> +{
> +    int rc;
> +
> +    spin_lock(&v->arch.runstate_guest_lock);
> +
> +    /* cleanup if we are recalled */
> +    cleanup_runstate_vcpu_locked(v);
> +
> +    rc = setup_runstate_vcpu_locked(v, (vaddr_t)area.addr.v);
> +
> +    spin_unlock(&v->arch.runstate_guest_lock);
> +
> +    return rc;
> +}
> +
> +
> +/* Update per-VCPU guest runstate shared memory area (if registered). */
> +static void update_runstate_area(struct vcpu *v)
> +{
> +    spin_lock(&v->arch.runstate_guest_lock);
> +
> +    if ( v->arch.runstate_guest )
> +    {
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> +            v->arch.runstate_guest->state_entry_time |= XEN_RUNSTATE_UPDATE;

Please use write_atomic (as suggested by Julien here:
https://marc.info/?l=xen-devel&m=159225391619240)


> +            smp_wmb();
> +        }
> +
> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
> +
> +        /* copy must be done before switching the bit */
>          smp_wmb();
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +            v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +            v->arch.runstate_guest->state_entry_time &= ~XEN_RUNSTATE_UPDATE;

and here too

The rest looks OK to me.


> +        }
>      }
> +
> +    spin_unlock(&v->arch.runstate_guest_lock);
>  }
>  
>  static void schedule_tail(struct vcpu *prev)

