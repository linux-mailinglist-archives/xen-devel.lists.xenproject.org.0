Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B1A1E69D0
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 20:55:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeNfy-0004bJ-MP; Thu, 28 May 2020 18:54:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lRPh=7K=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jeNfx-0004bE-FO
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 18:54:45 +0000
X-Inumbo-ID: b13060ee-a114-11ea-a827-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b13060ee-a114-11ea-a827-12813bfff9fa;
 Thu, 28 May 2020 18:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jbYElpDc+CL4tGj/CNC+Ad3XGfI0bHxW5iLGicuCWRk=; b=w+LcBQgbe5nc4WTjlUE0jEoR1m
 AA2dNJGR5f6nEhBLsT0+cr8AOOzNg7xTZmjz6GkdndVswFECe6Q1LTXk79dpaI0swWrsvFAYT7X4q
 gYFM9hnQ3B+PqN6/86oPLJLD7frO1IcChIge2iuYntaomaatPYNEbsNDMVaA7BLfTpkg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeNfr-0003CD-4q; Thu, 28 May 2020 18:54:39 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jeNfq-0001ET-Og; Thu, 28 May 2020 18:54:39 +0000
Subject: Re: [RFC PATCH 1/1] xen: Use a global mapping for runstate
To: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <cover.1590675919.git.bertrand.marquis@arm.com>
 <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e63a83a1-7d71-9cc5-517a-275e17880e2b@xen.org>
Date: Thu, 28 May 2020 19:54:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <03e7cd740922bfbaa479f22d81d9de06f718a305.1590675919.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "paul@xen.org" <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Xia, Hongyan" <hongyxia@amazon.com>,
 Jan Beulich <jbeulich@suse.com>, nd@arm.com,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

Thank you for the patch.

On 28/05/2020 16:25, Bertrand Marquis wrote:
> At the moment on Arm, a Linux guest running with KTPI enabled will
> cause the following error when a context switch happens in user mode:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> 
> This patch is modifying runstate handling to map the area given by the
> guest inside Xen during the hypercall.
> This is removing the guest virtual to physical conversion during context
> switches which removes the bug

It would be good to spell out that a virtual address is not stable. So 
relying on it is wrong.

> and improve performance by preventing to
> walk page tables during context switches.

With Secret free hypervisor in mind, I would like to suggest to 
map/unmap the runstate during context switch.

The cost should be minimal when there is a direct map (i.e on Arm64 and 
x86) and still provide better performance on Arm32.

The change should be minimal compare to the current approach but this 
could be taken care separately if you don't have time.

> 
> --
> In the current status, this patch is only working on Arm and needs to
> be fixed on X86 (see #error on domain.c for missing get_page_from_gva).
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>   xen/arch/arm/domain.c   | 32 +++++++++-------
>   xen/arch/x86/domain.c   | 51 ++++++++++++++-----------
>   xen/common/domain.c     | 84 ++++++++++++++++++++++++++++++++++-------
>   xen/include/xen/sched.h | 11 ++++--
>   4 files changed, 124 insertions(+), 54 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 31169326b2..799b0e0103 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -278,33 +278,37 @@ static void ctxt_switch_to(struct vcpu *n)
>   /* Update per-VCPU guest runstate shared memory area (if registered). */
>   static void update_runstate_area(struct vcpu *v)
>   {
> -    void __user *guest_handle = NULL;
> -    struct vcpu_runstate_info runstate;
> +    struct vcpu_runstate_info *runstate;
>   
> -    if ( guest_handle_is_null(runstate_guest(v)) )
> +    /* XXX why do we accept not to block here */
> +    if ( !spin_trylock(&v->runstate_guest_lock) )
>           return;
>   
> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> +    runstate = runstate_guest(v);
> +
> +    if (runstate == NULL)
> +    {
> +        spin_unlock(&v->runstate_guest_lock);
> +        return;
> +    }
>   
>       if ( VM_ASSIST(v->domain, runstate_update_flag) )
>       {
> -        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
> -        guest_handle--;
> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +        runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
>           smp_wmb();

Because you set v->runstate.state_entry_time below, the placement of the 
barrier seems a bit odd.

I would suggest to update v->runstate.state_entry_time first and then 
update runstate->state_entry_time.

> +        v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>       }
>   
> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    memcpy(runstate, &v->runstate, sizeof(v->runstate));
>   
> -    if ( guest_handle )
> +    if ( VM_ASSIST(v->domain, runstate_update_flag) )
>       {
> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +        runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
>           smp_wmb();

You want to update runstate->state_entry_time after the barrier not before.

>   static void _update_runstate_area(struct vcpu *v)
>   {
> +    /* XXX: this should be removed */
>       if ( !update_runstate_area(v) && is_pv_vcpu(v) &&
>            !(v->arch.flags & TF_kernel_mode) )
>           v->arch.pv.need_update_runstate_area = 1;
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7cc9526139..acc6f90ba3 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -161,6 +161,7 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>       v->dirty_cpu = VCPU_CPU_CLEAN;
>   
>       spin_lock_init(&v->virq_lock);
> +    spin_lock_init(&v->runstate_guest_lock);
>   
>       tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
>   
> @@ -691,6 +692,66 @@ int rcu_lock_live_remote_domain_by_id(domid_t dom, struct domain **d)
>       return 0;
>   }
>   
> +static void  unmap_runstate_area(struct vcpu *v, unsigned int lock)

NIT: There is an extra space after void

Also, AFAICT, the lock is only taking two values. Please switch to a bool.

> +{
> +    mfn_t mfn;
> +
> +    if ( ! runstate_guest(v) )

NIT: We don't usually put a space after !.

But shouldn't this be checked within the lock?


> +        return;
> +
> +    if (lock)

NIT: if ( ... )

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

Ditto.

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

This is a change in behavior for the guest. If we are going forward with 
this, this will want a separate patch with its own explanation why this 
is done.

> +
> +#ifdef CONFIG_ARM
> +    page = get_page_from_gva(v, area->addr.p, GV2M_WRITE);

A guest is allowed to setup the runstate for a different vCPU than the 
current one. This will lead to get_page_from_gva() to fail as the 
function cannot yet work with a vCPU other than current.

AFAICT, there is no restriction on when the runstate hypercall can be 
called. So this can even be called before the vCPU is brought up.

I was going to suggest to use the current vCPU for translating the 
address. However, it would be reasonable for an OS to use the same 
virtual address for all the vCPUs assuming the page-tables are different 
per vCPU.

Recent Linux are using a per-cpu area, so the virtual address should be 
different for each vCPU. But I don't know how the other OSes works. 
Roger should be able to help for FreeBSD at least.

I have CCed Paul for the Windows drivers.

If we decide to introduce some restriction then they should be explained 
in the commit message and also documented in the public header (we have 
been pretty bad at documenting change in the past!).

Cheers,

-- 
Julien Grall

