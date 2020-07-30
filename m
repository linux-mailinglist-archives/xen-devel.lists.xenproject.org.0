Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F41233A03
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 22:51:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k1FVX-0001fU-5z; Thu, 30 Jul 2020 20:50:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=IK5u=BJ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k1FVV-0001fP-JP
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 20:50:29 +0000
X-Inumbo-ID: 4c06c55a-d2a6-11ea-ab30-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4c06c55a-d2a6-11ea-ab30-12813bfff9fa;
 Thu, 30 Jul 2020 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hx/PHRINzFmUMkk9n1BpAtmiK86SlTkkpXHqaNb2uaM=; b=nRc3Z8A1YpHRF8/NQU243/2OYT
 KqGhtxGDUW2fGYSV/gy9pHtygqwpFDdeWuaInS3Ey4tBguNFoMoxJw81p/RdBNqs8Bz+tzUUt6nOX
 k44n6LUWqSeYjChlXmTtdXDXmK/sZBq3LI26qlx0UbiMWHBRrjzHtG+kpG7bwbjqk7eo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1FVO-0002h6-1y; Thu, 30 Jul 2020 20:50:22 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k1FVN-0007sn-Gt; Thu, 30 Jul 2020 20:50:21 +0000
Subject: Re: [PATCH v3] xen/arm: Convert runstate address during hypcall
To: Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
References: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f48f81d5-589e-3f75-1044-583114bf497e@xen.org>
Date: Thu, 30 Jul 2020 21:50:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <3911d221ce9ed73611b93aa437b9ca227d6aa201.1596099067.git.bertrand.marquis@arm.com>
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 nd@arm.com, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Bertrand,

To avoid extra work on your side, I would recommend to wait a bit before 
sending a new version. It would be good to at least settle the 
conversation in v2 regarding the approach taken.

On 30/07/2020 11:24, Bertrand Marquis wrote:
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

To echo what Jan said on the previous version, this is a change in a 
stable ABI and therefore may break existing guest. FAOD, I agree in 
principle with the idea. However, we want to explain why breaking the 
ABI is the *only* viable solution.

 From my understanding, it is not possible to fix without an ABI 
breakage because the hypervisor doesn't know when the guest will switch 
back from userspace to kernel space. The risk is the information 
provided by the runstate wouldn't contain accurate information and could 
affect how the guest handle stolen time.

Additionally there are a few issues with the current interface:
    1) It is assuming the virtual address cannot be re-used by the 
userspace. Thanksfully Linux have a split address space. But this may 
change with KPTI in place.
    2) When update the page-tables, the guest has to go through an 
invalid mapping. So the translation may fail at any point.

IOW, the existing interface can lead to random memory corruption and 
inacurracy of the stolen time.

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

This is not clear whether the virtual address refer to the current vCPU 
or the vCPU you register the runstate for. From the past discussion, I 
think you refer to the former. It would be good to clarify.

Additionally, all the new restrictions should be documented in the 
public interface. So an OS developper can find the differences between 
the architectures.

To answer Jan's concern, we certainly don't know all the guest OSes 
existing, however we also need to balance the benefit for a large 
majority of the users.

 From previous discussion, the current approach was deemed to be 
acceptable on Arm and, AFAICT, also x86 (see [1]).

TBH, I would rather see the approach to be common. For that, we would an 
agreement from Andrew and Jan in the approach here. Meanwhile, I think 
this is the best approach to address the concern from Arm users.

> 
> inline functions in headers could not be used as the architecture
> domain.h is included before the global domain.h making it impossible
> to use the struct vcpu inside the architecture header.
> This should not have any performance impact as the hypercall is only
> called once per vcpu usually.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> ---
>    Changes in v2
>      - use vmap to map the pages during the hypercall.
>      - reintroduce initial copy during hypercall.
> 
>    Changes in v3
>      - Fix Coding style
>      - Fix vaddr printing on arm32
>      - use write_atomic to modify state_entry_time update bit (only
>      in guest structure as the bit is not used inside Xen copy)
> 
> ---
>   xen/arch/arm/domain.c        | 161 ++++++++++++++++++++++++++++++-----
>   xen/arch/x86/domain.c        |  29 ++++++-
>   xen/arch/x86/x86_64/domain.c |   4 +-
>   xen/common/domain.c          |  19 ++---
>   xen/include/asm-arm/domain.h |   9 ++
>   xen/include/asm-x86/domain.h |  16 ++++
>   xen/include/xen/domain.h     |   5 ++
>   xen/include/xen/sched.h      |  16 +---
>   8 files changed, 206 insertions(+), 53 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 31169326b2..8b36946017 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -19,6 +19,7 @@
>   #include <xen/sched.h>
>   #include <xen/softirq.h>
>   #include <xen/wait.h>
> +#include <xen/vmap.h>
>   
>   #include <asm/alternative.h>
>   #include <asm/cpuerrata.h>
> @@ -275,36 +276,156 @@ static void ctxt_switch_to(struct vcpu *n)
>       virt_timer_restore(n);
>   }
>   
> -/* Update per-VCPU guest runstate shared memory area (if registered). */
> -static void update_runstate_area(struct vcpu *v)
> +static void cleanup_runstate_vcpu_locked(struct vcpu *v)
>   {
> -    void __user *guest_handle = NULL;
> +    if ( v->arch.runstate_guest )
> +    {
> +        vunmap((void *)((unsigned long)v->arch.runstate_guest & PAGE_MASK));
> +
> +        put_page(v->arch.runstate_guest_page[0]);
> +
> +        if ( v->arch.runstate_guest_page[1] )
> +            put_page(v->arch.runstate_guest_page[1]);
> +
> +        v->arch.runstate_guest = NULL;
> +    }
> +}
> +
> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
> +{
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
>       struct vcpu_runstate_info runstate;
> +    void *p;
>   
> -    if ( guest_handle_is_null(runstate_guest(v)) )
> -        return;
> +    /* user can pass a NULL address to unregister a previous area */
> +    if ( vaddr == 0 )
> +        return 0;
> +
> +    offset = vaddr & ~PAGE_MASK;
> +
> +    /* provided address must be aligned to a 64bit */
> +    if ( offset % alignof(struct vcpu_runstate_info) )

This new restriction wants to be explained in the commit message and 
public header.

> +    {
> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
> +                ": Invalid offset\n", vaddr);

We usually enforce 80 character per lines except for format string. So 
it is easier to grep them in the code.

> +        return -EINVAL;
> +    }
> +
> +    page = get_page_from_gva(v, vaddr, GV2M_WRITE);
> +    if ( !page )
> +    {
> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
> +                ": Page is not mapped\n", vaddr);
> +        return -EINVAL;
> +    }
> +
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
> +            gprintk(XENLOG_WARNING,
> +                    "Cannot map runstate pointer at 0x%"PRIvaddr
> +                    ": 2nd Page is not mapped\n", vaddr);
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
>   
> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> +    p = vmap(mfn, numpages);
> +    if ( !p )
> +    {
> +        put_page(v->arch.runstate_guest_page[0]);
> +        if ( numpages == 2 )
> +            put_page(v->arch.runstate_guest_page[1]);
>   
> -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        gprintk(XENLOG_WARNING, "Cannot map runstate pointer at 0x%"PRIvaddr
> +                ": vmap error\n", vaddr);
> +        return -EINVAL;
> +    }
> +
> +    v->arch.runstate_guest = p + offset;
> +
> +    if (v == current)
> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
> +    else
>       {
> -        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
> -        guest_handle--;
> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> -        smp_wmb();
> +        vcpu_runstate_get(v, &runstate);
> +        memcpy(v->arch.runstate_guest, &runstate, sizeof(v->runstate));
>       }
>   
> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    return 0;
> +}
> +
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
>   
> -    if ( guest_handle )
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
>       {
> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> -        smp_wmb();
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> +            write_atomic(&(v->arch.runstate_guest->state_entry_time),
> +                    v->runstate.state_entry_time);

NIT: You want to indent v-> at the same level as the argument from the 
first line.

Also, I think you are missing a smp_wmb() here.

> +        }
> +
> +        memcpy(v->arch.runstate_guest, &v->runstate, sizeof(v->runstate));
> +
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +            /* copy must be done before switching the bit */
> +            smp_wmb();
> +            v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +            write_atomic(&(v->arch.runstate_guest->state_entry_time),
> +                    v->runstate.state_entry_time);

Same remark for the indentation.

> +        }
>       }
> +
> +    spin_unlock(&v->arch.runstate_guest_lock);
>   }
>   
>   static void schedule_tail(struct vcpu *prev)
> @@ -560,6 +681,8 @@ int arch_vcpu_create(struct vcpu *v)
>       v->arch.saved_context.sp = (register_t)v->arch.cpu_info;
>       v->arch.saved_context.pc = (register_t)continue_new_vcpu;
>   
> +    spin_lock_init(&v->arch.runstate_guest_lock);
> +
>       /* Idle VCPUs don't need the rest of this setup */
>       if ( is_idle_vcpu(v) )
>           return rc;
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index fee6c3931a..b9b81e94e5 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1642,6 +1642,29 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
>           wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>   }
>   
> +int arch_vcpu_setup_runstate(struct vcpu *v,
> +                             struct vcpu_register_runstate_memory_area area)
> +{
> +    struct vcpu_runstate_info runstate;
> +
> +    runstate_guest(v) = area.addr.h;
> +
> +    if ( v == current )
> +        __copy_to_guest(runstate_guest(v), &v->runstate, 1);
> +    else
> +    {
> +        vcpu_runstate_get(v, &runstate);
> +        __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    }
> +
> +    return 0;
> +}
> +
> +void arch_vcpu_cleanup_runstate(struct vcpu *v)
> +{
> +    set_xen_guest_handle(runstate_guest(v), NULL);
> +}
> +
>   /* Update per-VCPU guest runstate shared memory area (if registered). */
>   bool update_runstate_area(struct vcpu *v)
>   {
> @@ -1660,8 +1683,8 @@ bool update_runstate_area(struct vcpu *v)
>       if ( VM_ASSIST(v->domain, runstate_update_flag) )
>       {
>           guest_handle = has_32bit_shinfo(v->domain)
> -            ? &v->runstate_guest.compat.p->state_entry_time + 1
> -            : &v->runstate_guest.native.p->state_entry_time + 1;
> +            ? &v->arch.runstate_guest.compat.p->state_entry_time + 1
> +            : &v->arch.runstate_guest.native.p->state_entry_time + 1;
>           guest_handle--;
>           runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>           __raw_copy_to_guest(guest_handle,
> @@ -1674,7 +1697,7 @@ bool update_runstate_area(struct vcpu *v)
>           struct compat_vcpu_runstate_info info;
>   
>           XLAT_vcpu_runstate_info(&info, &runstate);
> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
> +        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
>           rc = true;
>       }
>       else
> diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
> index c46dccc25a..b879e8dd2c 100644
> --- a/xen/arch/x86/x86_64/domain.c
> +++ b/xen/arch/x86/x86_64/domain.c
> @@ -36,7 +36,7 @@ arch_compat_vcpu_op(
>               break;
>   
>           rc = 0;
> -        guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
> +        guest_from_compat_handle(v->arch.runstate_guest.compat, area.addr.h);
>   
>           if ( v == current )
>           {
> @@ -49,7 +49,7 @@ arch_compat_vcpu_op(
>               vcpu_runstate_get(v, &runstate);
>               XLAT_vcpu_runstate_info(&info, &runstate);
>           }
> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
> +        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
>   
>           break;
>       }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index f0f9c62feb..739c6b7b62 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -727,7 +727,10 @@ int domain_kill(struct domain *d)
>           if ( cpupool_move_domain(d, cpupool0) )
>               return -ERESTART;
>           for_each_vcpu ( d, v )
> +        {
> +            arch_vcpu_cleanup_runstate(v);
>               unmap_vcpu_info(v);
> +        }
>           d->is_dying = DOMDYING_dead;
>           /* Mem event cleanup has to go here because the rings
>            * have to be put before we call put_domain. */
> @@ -1167,7 +1170,7 @@ int domain_soft_reset(struct domain *d)
>   
>       for_each_vcpu ( d, v )
>       {
> -        set_xen_guest_handle(runstate_guest(v), NULL);
> +        arch_vcpu_cleanup_runstate(v);
>           unmap_vcpu_info(v);
>       }
>   
> @@ -1494,7 +1497,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>       case VCPUOP_register_runstate_memory_area:
>       {
>           struct vcpu_register_runstate_memory_area area;
> -        struct vcpu_runstate_info runstate;
>   
>           rc = -EFAULT;
>           if ( copy_from_guest(&area, arg, 1) )
> @@ -1503,18 +1505,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>           if ( !guest_handle_okay(area.addr.h, 1) )
>               break;
>   
> -        rc = 0;
> -        runstate_guest(v) = area.addr.h;
> -
> -        if ( v == current )
> -        {
> -            __copy_to_guest(runstate_guest(v), &v->runstate, 1);
> -        }
> -        else
> -        {
> -            vcpu_runstate_get(v, &runstate);
> -            __copy_to_guest(runstate_guest(v), &runstate, 1);
> -        }
> +        rc = arch_vcpu_setup_runstate(v, area);
>   
>           break;
>       }
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 6819a3bf38..2f62c3e8f5 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -204,6 +204,15 @@ struct arch_vcpu
>        */
>       bool need_flush_to_ram;
>   
> +    /* runstate guest lock */
> +    spinlock_t runstate_guest_lock;
> +
> +    /* runstate guest info */
> +    struct vcpu_runstate_info *runstate_guest;
> +
> +    /* runstate pages mapped for runstate_guest */
> +    struct page_info *runstate_guest_page[2];
> +
>   }  __cacheline_aligned;
>   
>   void vcpu_show_execution_state(struct vcpu *);
> diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
> index 635335634d..007ccfbf9f 100644
> --- a/xen/include/asm-x86/domain.h
> +++ b/xen/include/asm-x86/domain.h
> @@ -11,6 +11,11 @@
>   #include <asm/x86_emulate.h>
>   #include <public/vcpu.h>
>   #include <public/hvm/hvm_info_table.h>
> +#ifdef CONFIG_COMPAT
> +#include <compat/vcpu.h>
> +DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
> +#endif
> +
>   
>   #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>   
> @@ -638,6 +643,17 @@ struct arch_vcpu
>       struct {
>           bool next_interrupt_enabled;
>       } monitor;
> +
> +#ifndef CONFIG_COMPAT
> +# define runstate_guest(v) ((v)->arch.runstate_guest)
> +    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest address */
> +#else
> +# define runstate_guest(v) ((v)->arch.runstate_guest.native)
> +    union {
> +        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
> +        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
> +    } runstate_guest;
> +#endif
>   };
>   
>   struct guest_memory_policy
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 7e51d361de..5e8cbba31d 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -5,6 +5,7 @@
>   #include <xen/types.h>
>   
>   #include <public/xen.h>
> +#include <public/vcpu.h>
>   #include <asm/domain.h>
>   #include <asm/numa.h>
>   
> @@ -63,6 +64,10 @@ void arch_vcpu_destroy(struct vcpu *v);
>   int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>   void unmap_vcpu_info(struct vcpu *v);
>   
> +int arch_vcpu_setup_runstate(struct vcpu *v,
> +                             struct vcpu_register_runstate_memory_area area);
> +void arch_vcpu_cleanup_runstate(struct vcpu *v);
> +
>   int arch_domain_create(struct domain *d,
>                          struct xen_domctl_createdomain *config);
>   
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ac53519d7f..fac030fb83 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -29,11 +29,6 @@
>   #include <public/vcpu.h>
>   #include <public/event_channel.h>
>   
> -#ifdef CONFIG_COMPAT
> -#include <compat/vcpu.h>
> -DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
> -#endif
> -
>   /*
>    * Stats
>    *
> @@ -166,16 +161,7 @@ struct vcpu
>       struct sched_unit *sched_unit;
>   
>       struct vcpu_runstate_info runstate;
> -#ifndef CONFIG_COMPAT
> -# define runstate_guest(v) ((v)->runstate_guest)
> -    XEN_GUEST_HANDLE(vcpu_runstate_info_t) runstate_guest; /* guest address */
> -#else
> -# define runstate_guest(v) ((v)->runstate_guest.native)
> -    union {
> -        XEN_GUEST_HANDLE(vcpu_runstate_info_t) native;
> -        XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t) compat;
> -    } runstate_guest; /* guest address */
> -#endif
> +
>       unsigned int     new_state;
>   
>       /* Has the FPU been initialised? */
> 

[1] <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>


-- 
Julien Grall

