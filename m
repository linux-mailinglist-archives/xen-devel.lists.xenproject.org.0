Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C24B1F6D52
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 20:18:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjRkv-0001L1-NK; Thu, 11 Jun 2020 18:16:49 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mIhq=7Y=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jjRku-0001Kw-I8
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 18:16:48 +0000
X-Inumbo-ID: b64dc00d-ac0f-11ea-b55f-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b64dc00d-ac0f-11ea-b55f-12813bfff9fa;
 Thu, 11 Jun 2020 18:16:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 43F23206DC;
 Thu, 11 Jun 2020 18:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591899406;
 bh=Gdz6NiXCInYBJDguiN2rRw76D0sx81XLpjELCwiZGFo=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=OwT+uJLSBw3vb6HSZLIazuyTT2ue7QAN2a5oPXuFk9HmxA8J10xcrDLNOlwZq07bb
 cdAK/cEgLI03USuBi4zaQw6YtE8MLcikh2ScGnpKoRQ/nsddQqs5ag7sZuU+YsW3Gb
 e8n92kfzV0H2yRkwAmr160N6DC625gRLCW7gT4Us=
Date: Thu, 11 Jun 2020 11:16:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [PATCH 1/2] xen/arm: Convert runstate address during hypcall
In-Reply-To: <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2006111055360.2815@sstabellini-ThinkPad-T480s>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
 <8b450dddb2c855225c97741dce66453a80b9add2.1591806713.git.bertrand.marquis@arm.com>
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

On Thu, 11 Jun 2020, Bertrand Marquis wrote:
> At the moment on Arm, a Linux guest running with KTPI enabled will
> cause the following error when a context switch happens in user mode:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va 0xffffff837ebe0cd0
> 
> This patch is modifying the register runstate area handling on arm to
> convert the guest address during the hypercall. During runtime context
> switches the area is mapped to update the guest runstate copy.
> The patch is also removing the initial copy which was done during the
> hypercall handling as this is done on the current core when the context
> is restore to go back to guest execution on arm.
> 
> As a consequence if the register runstate hypercall is called on one
> vcpu for an other vcpu, the area will not be updated until the vcpu
> will be executed (on arm only).
> 
> On x86, the behaviour is not modified, the address conversion is done
> during the context switch and the area is updated fully during the
> hypercall.
> inline functions in headers could not be used as the architecture
> domain.h is included before the global domain.h making it impossible
> to use the struct vcpu inside the architecture header.
> This should not have any performance impact as the hypercall is only
> called once per vcpu usually.
> 
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
> ---
>  xen/arch/arm/domain.c        | 109 +++++++++++++++++++++++++++++------
>  xen/arch/x86/domain.c        |  30 +++++++++-
>  xen/arch/x86/x86_64/domain.c |   4 +-
>  xen/common/domain.c          |  19 ++----
>  xen/include/asm-arm/domain.h |   8 +++
>  xen/include/asm-x86/domain.h |  16 +++++
>  xen/include/xen/domain.h     |   4 ++
>  xen/include/xen/sched.h      |  16 +----
>  8 files changed, 153 insertions(+), 53 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 31169326b2..739059234f 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -19,6 +19,7 @@
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  #include <xen/wait.h>
> +#include <xen/domain_page.h>
>  
>  #include <asm/alternative.h>
>  #include <asm/cpuerrata.h>
> @@ -275,36 +276,104 @@ static void ctxt_switch_to(struct vcpu *n)
>      virt_timer_restore(n);
>  }
>  
> -/* Update per-VCPU guest runstate shared memory area (if registered). */
> -static void update_runstate_area(struct vcpu *v)
> +void arch_cleanup_runstate_guest(struct vcpu *v)
>  {
> -    void __user *guest_handle = NULL;
> -    struct vcpu_runstate_info runstate;
> +    spin_lock(&v->arch.runstate_guest.lock);
>  
> -    if ( guest_handle_is_null(runstate_guest(v)) )
> -        return;
> +    /* cleanup previous page if any */
> +    if ( v->arch.runstate_guest.page )
> +    {
> +        put_page_and_type(v->arch.runstate_guest.page);
> +        v->arch.runstate_guest.page = NULL;
> +        v->arch.runstate_guest.offset = 0;
> +    }
>  
> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> +    spin_unlock(&v->arch.runstate_guest.lock);
> +}
>  
> -    if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +int arch_setup_runstate_guest(struct vcpu *v,
> +                            struct vcpu_register_runstate_memory_area area)
> +{
> +    struct page_info *page;
> +    unsigned offset;
> +
> +    spin_lock(&v->arch.runstate_guest.lock);
> +
> +    /* cleanup previous page if any */
> +    if ( v->arch.runstate_guest.page )
>      {
> -        guest_handle = &v->runstate_guest.p->state_entry_time + 1;
> -        guest_handle--;
> -        runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> -        smp_wmb();
> +        put_page_and_type(v->arch.runstate_guest.page);
> +        v->arch.runstate_guest.page = NULL;
> +        v->arch.runstate_guest.offset = 0;
> +    }
> +
> +    offset = ((vaddr_t)area.addr.v) & ~PAGE_MASK;
> +    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
> +    {
> +        spin_unlock(&v->arch.runstate_guest.lock);
> +        gprintk(XENLOG_DEBUG, "Runstate is crossing pages\n");
> +        return -EINVAL;
> +    }
> +
> +    /* provided address must be aligned to a 64bit */
> +    if ( offset % alignof(struct vcpu_runstate_info) )
> +    {
> +        spin_unlock(&v->arch.runstate_guest.lock);
> +        gprintk(XENLOG_DEBUG, "Runstate pointer is not aligned\n");
> +        return -EINVAL;
> +    }
> +
> +    page = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
> +    if ( !page )
> +    {
> +        spin_unlock(&v->arch.runstate_guest.lock);
> +        gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");

I would make all these XENLOG_WARNING or XENLOG_ERR, they are errors
after all. This last one I'd say "Could not map runstate point" and also
print the address.


> +        return -EINVAL;
>      }
>  
> -    __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    v->arch.runstate_guest.page = page;
> +    v->arch.runstate_guest.offset = offset;
> +
> +    spin_unlock(&v->arch.runstate_guest.lock);
> +
> +    return 0;
> +}
> +
> +
> +/* Update per-VCPU guest runstate shared memory area (if registered). */
> +static void update_runstate_area(struct vcpu *v)
> +{
> +    struct vcpu_runstate_info *guest_runstate;
> +    void *p;
> +
> +    spin_lock(&v->arch.runstate_guest.lock);
>  
> -    if ( guest_handle )
> +    if ( v->arch.runstate_guest.page )
>      {
> -        runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +        p = __map_domain_page(v->arch.runstate_guest.page);
> +        guest_runstate = p + v->arch.runstate_guest.offset;
> +
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +            v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> +            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;

I think that this write to guest_runstate should use write_atomic or
another atomic write operation.


> +            smp_wmb();
> +        }
> +
> +        memcpy(guest_runstate, &v->runstate, sizeof(v->runstate));
>          smp_wmb();
> -        __raw_copy_to_guest(guest_handle,
> -                            (void *)(&runstate.state_entry_time + 1) - 1, 1);
> +
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +            v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +            guest_runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;

same here


> +            smp_wmb();
> +        }
> +
> +        unmap_domain_page(p);
>      }
> +
> +    spin_unlock(&v->arch.runstate_guest.lock);
>  }
>  
>  static void schedule_tail(struct vcpu *prev)
> @@ -560,6 +629,8 @@ int arch_vcpu_create(struct vcpu *v)
>      v->arch.saved_context.sp = (register_t)v->arch.cpu_info;
>      v->arch.saved_context.pc = (register_t)continue_new_vcpu;
>  
> +    spin_lock_init(&v->arch.runstate_guest.lock);
> +
>      /* Idle VCPUs don't need the rest of this setup */
>      if ( is_idle_vcpu(v) )
>          return rc;
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index fee6c3931a..32bbed87d5 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1642,6 +1642,30 @@ void paravirt_ctxt_switch_to(struct vcpu *v)
>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
>  }
>  
> +int arch_setup_runstate_guest(struct vcpu *v,
> +                             struct vcpu_register_runstate_memory_area area)
> +{
> +    struct vcpu_runstate_info runstate;
> +
> +    runstate_guest(v) = area.addr.h;
> +
> +    if ( v == current )
> +    {
> +        __copy_to_guest(runstate_guest(v), &v->runstate, 1);
> +    }
> +    else
> +    {
> +        vcpu_runstate_get(v, &runstate);
> +        __copy_to_guest(runstate_guest(v), &runstate, 1);
> +    }
> +    return 0;
> +}
> +
> +void arch_cleanup_runstate_guest(struct vcpu *v)
> +{
> +    set_xen_guest_handle(runstate_guest(v), NULL);
> +}
> +
>  /* Update per-VCPU guest runstate shared memory area (if registered). */
>  bool update_runstate_area(struct vcpu *v)
>  {
> @@ -1660,8 +1684,8 @@ bool update_runstate_area(struct vcpu *v)
>      if ( VM_ASSIST(v->domain, runstate_update_flag) )
>      {
>          guest_handle = has_32bit_shinfo(v->domain)
> -            ? &v->runstate_guest.compat.p->state_entry_time + 1
> -            : &v->runstate_guest.native.p->state_entry_time + 1;
> +            ? &v->arch.runstate_guest.compat.p->state_entry_time + 1
> +            : &v->arch.runstate_guest.native.p->state_entry_time + 1;
>          guest_handle--;
>          runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
>          __raw_copy_to_guest(guest_handle,
> @@ -1674,7 +1698,7 @@ bool update_runstate_area(struct vcpu *v)
>          struct compat_vcpu_runstate_info info;
>  
>          XLAT_vcpu_runstate_info(&info, &runstate);
> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
> +        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
>          rc = true;
>      }
>      else
> diff --git a/xen/arch/x86/x86_64/domain.c b/xen/arch/x86/x86_64/domain.c
> index c46dccc25a..b879e8dd2c 100644
> --- a/xen/arch/x86/x86_64/domain.c
> +++ b/xen/arch/x86/x86_64/domain.c
> @@ -36,7 +36,7 @@ arch_compat_vcpu_op(
>              break;
>  
>          rc = 0;
> -        guest_from_compat_handle(v->runstate_guest.compat, area.addr.h);
> +        guest_from_compat_handle(v->arch.runstate_guest.compat, area.addr.h);
>  
>          if ( v == current )
>          {
> @@ -49,7 +49,7 @@ arch_compat_vcpu_op(
>              vcpu_runstate_get(v, &runstate);
>              XLAT_vcpu_runstate_info(&info, &runstate);
>          }
> -        __copy_to_guest(v->runstate_guest.compat, &info, 1);
> +        __copy_to_guest(v->arch.runstate_guest.compat, &info, 1);
>  
>          break;
>      }
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7cc9526139..0ca6bf4dbc 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -727,7 +727,10 @@ int domain_kill(struct domain *d)
>          if ( cpupool_move_domain(d, cpupool0) )
>              return -ERESTART;
>          for_each_vcpu ( d, v )
> +        {
> +            arch_cleanup_runstate_guest(v);
>              unmap_vcpu_info(v);
> +        }
>          d->is_dying = DOMDYING_dead;
>          /* Mem event cleanup has to go here because the rings 
>           * have to be put before we call put_domain. */
> @@ -1167,7 +1170,7 @@ int domain_soft_reset(struct domain *d)
>  
>      for_each_vcpu ( d, v )
>      {
> -        set_xen_guest_handle(runstate_guest(v), NULL);
> +        arch_cleanup_runstate_guest(v);
>          unmap_vcpu_info(v);
>      }
>  
> @@ -1484,7 +1487,6 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case VCPUOP_register_runstate_memory_area:
>      {
>          struct vcpu_register_runstate_memory_area area;
> -        struct vcpu_runstate_info runstate;
>  
>          rc = -EFAULT;
>          if ( copy_from_guest(&area, arg, 1) )
> @@ -1493,18 +1495,7 @@ long do_vcpu_op(int cmd, unsigned int vcpuid, XEN_GUEST_HANDLE_PARAM(void) arg)
>          if ( !guest_handle_okay(area.addr.h, 1) )
>              break;
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
> +        rc = arch_setup_runstate_guest(v, area);
>  
>          break;
>      }
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 4e2f582006..3a7f53e13d 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -11,6 +11,7 @@
>  #include <asm/vgic.h>
>  #include <asm/vpl011.h>
>  #include <public/hvm/params.h>
> +#include <public/vcpu.h>
>  #include <xen/serial.h>
>  #include <xen/rbtree.h>
>  
> @@ -206,6 +207,13 @@ struct arch_vcpu
>       */
>      bool need_flush_to_ram;
>  
> +    /* runstate guest info */
> +    struct {
> +        struct page_info *page;  /* guest page */
> +        unsigned         offset; /* offset in page */
> +        spinlock_t       lock;   /* lock to access page */
> +    } runstate_guest;
> +
>  }  __cacheline_aligned;
>  
>  void vcpu_show_execution_state(struct vcpu *);
> diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
> index e8cee3d5e5..f917b48cb8 100644
> --- a/xen/include/asm-x86/domain.h
> +++ b/xen/include/asm-x86/domain.h
> @@ -11,6 +11,11 @@
>  #include <asm/x86_emulate.h>
>  #include <public/vcpu.h>
>  #include <public/hvm/hvm_info_table.h>
> +#ifdef CONFIG_COMPAT
> +#include <compat/vcpu.h>
> +DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
> +#endif
> +
>  
>  #define has_32bit_shinfo(d)    ((d)->arch.has_32bit_shinfo)
>  
> @@ -626,6 +631,17 @@ struct arch_vcpu
>      struct {
>          bool next_interrupt_enabled;
>      } monitor;
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
>  };
>  
>  struct guest_memory_policy
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 7e51d361de..d5d73ce997 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -63,6 +63,10 @@ void arch_vcpu_destroy(struct vcpu *v);
>  int map_vcpu_info(struct vcpu *v, unsigned long gfn, unsigned offset);
>  void unmap_vcpu_info(struct vcpu *v);
>  
> +int arch_setup_runstate_guest(struct vcpu *v,
> +                            struct vcpu_register_runstate_memory_area area);

NIT: code style, the indentation is off


> +void arch_cleanup_runstate_guest(struct vcpu *v);
> +
>  int arch_domain_create(struct domain *d,
>                         struct xen_domctl_createdomain *config);
>  
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ac53519d7f..fac030fb83 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -29,11 +29,6 @@
>  #include <public/vcpu.h>
>  #include <public/event_channel.h>
>  
> -#ifdef CONFIG_COMPAT
> -#include <compat/vcpu.h>
> -DEFINE_XEN_GUEST_HANDLE(vcpu_runstate_info_compat_t);
> -#endif
> -
>  /*
>   * Stats
>   *
> @@ -166,16 +161,7 @@ struct vcpu
>      struct sched_unit *sched_unit;
>  
>      struct vcpu_runstate_info runstate;
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
>      unsigned int     new_state;
>  
>      /* Has the FPU been initialised? */
> -- 
> 2.17.1
> 

