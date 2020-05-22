Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1611DE1C7
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 10:28:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc31p-0007EF-JN; Fri, 22 May 2020 08:27:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=L400=7E=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jc31n-0007EA-IG
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 08:27:39 +0000
X-Inumbo-ID: 18489e90-9c06-11ea-b9cf-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18489e90-9c06-11ea-b9cf-bc764e2007e4;
 Fri, 22 May 2020 08:27:38 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: kfeIehtZkrHh3ta2CPMWx7GsDMwDQeFOdAfi2v6OfaLvj7307kdp+22g3VDGdm9FRRO/16oS+P
 UeCkPNuS1wiHfdaEnVDLS4rdYDBPmRmwUEV5xhCMSWwdFG1aYi1lFOAKv9jcnUX7SDmYrIhKXP
 6LvHqUYvakrkK06WERmSWMlQYjbfpwxBNyQHnz9oQ8XMHvPL7Nzg08J6mmWWWCsYRJNwvCjWds
 fQOLrtKwTiU5mvmsN9Jsnfn6g+qEzZjov34Sw7An+/TQwKHJy7IcDQKGewZkt/H4H9xK4Tq03/
 cig=
X-SBRS: 2.7
X-MesageID: 18154315
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,421,1583211600"; d="scan'208";a="18154315"
Date: Fri, 22 May 2020 10:27:28 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Tamas K Lengyel <tamas.lengyel@intel.com>
Subject: Re: [PATCH for-4.14 1/2] x86/mem_sharing: Prohibit interrupt
 injection for forks
Message-ID: <20200522082728.GT54375@Air-de-Roger>
References: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <7666b5bba73a1410446789a0c4ea908376da3487.1590101479.git.tamas.lengyel@intel.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Tamas
 K Lengyel <tamas@tklengyel.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 21, 2020 at 03:53:22PM -0700, Tamas K Lengyel wrote:
> When running shallow forks without device models it may be undesirable for Xen
> to inject interrupts. With Windows forks we have observed the kernel going into
> infinite loops when trying to process such interrupts. By disabling interrupt
> injection the fuzzer can exercise the target code without interference.

Could you add some more information about why windows goes into
infinite loops? Is it trying to access MMIO regions of emulated
devices and getting ~0 out of them instead of the expected data and
that causes it to loop indefinitely?

> Signed-off-by: Tamas K Lengyel <tamas.lengyel@intel.com>
> ---
>  xen/arch/x86/hvm/vmx/intr.c      | 4 ++++
>  xen/arch/x86/mm/mem_sharing.c    | 6 +++++-
>  xen/include/asm-x86/hvm/domain.h | 2 ++
>  xen/include/public/memory.h      | 1 +
>  4 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
> index 000e14af49..3814795e3f 100644
> --- a/xen/arch/x86/hvm/vmx/intr.c
> +++ b/xen/arch/x86/hvm/vmx/intr.c

I think you are missing the AMD side of this change? A similar
adjustment should be done to svm_intr_assist, or else it should be
noted in the commit message the reason this is Intel only.

> @@ -256,6 +256,10 @@ void vmx_intr_assist(void)
>      if ( unlikely(v->arch.vm_event) && v->arch.vm_event->sync_event )
>          return;
>  
> +    /* Block event injection for VM fork if requested */
> +    if ( unlikely(v->domain->arch.hvm.mem_sharing.prohibit_interrupts) )
> +        return;
> +
>      /* Crank the handle on interrupt state. */
>      pt_vector = pt_update_irq(v);
>  
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.c
> index 7271e5c90b..7352fce866 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -2106,7 +2106,8 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>          rc = -EINVAL;
>          if ( mso.u.fork.pad )
>              goto out;
> -        if ( mso.u.fork.flags & ~XENMEM_FORK_WITH_IOMMU_ALLOWED )
> +        if ( mso.u.fork.flags & ~(XENMEM_FORK_WITH_IOMMU_ALLOWED |
> +                                  XENMEM_FORK_PROHIBIT_INTERRUPTS) )


Nit: I would move the XENMEM_FORK_ option ORing to a newline, so that
you don't have to use a whole line every time a new option is used.
Ie:

        if ( mso.u.fork.flags &
             ~(XENMEM_FORK_WITH_IOMMU_ALLOWED | XENMEM_FORK_BLOCK_INTERRUPTS) )


>              goto out;
>  
>          rc = rcu_lock_live_remote_domain_by_id(mso.u.fork.parent_domain,
> @@ -2134,6 +2135,9 @@ int mem_sharing_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_sharing_op_t) arg)
>              rc = hypercall_create_continuation(__HYPERVISOR_memory_op,
>                                                 "lh", XENMEM_sharing_op,
>                                                 arg);
> +        else if ( !rc && (mso.u.fork.flags & XENMEM_FORK_PROHIBIT_INTERRUPTS) )
> +            d->arch.hvm.mem_sharing.prohibit_interrupts = true;
> +
>          rcu_unlock_domain(pd);
>          break;
>      }
> diff --git a/xen/include/asm-x86/hvm/domain.h b/xen/include/asm-x86/hvm/domain.h
> index 95fe18cddc..e114f818d3 100644
> --- a/xen/include/asm-x86/hvm/domain.h
> +++ b/xen/include/asm-x86/hvm/domain.h
> @@ -74,6 +74,8 @@ struct mem_sharing_domain
>       * to resume the search.
>       */
>      unsigned long next_shared_gfn_to_relinquish;
> +
> +    bool prohibit_interrupts;

Nit: I would prefer block_interrupts, prohibit seems very formal to
me, but I'm not a native speaker, so feel free to ignore this
suggestion.

>  };
>  #endif
>  
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index dbd35305df..fe2e6caa68 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -537,6 +537,7 @@ struct xen_mem_sharing_op {
>          struct mem_sharing_op_fork {      /* OP_FORK */
>              domid_t parent_domain;        /* IN: parent's domain id */
>  #define XENMEM_FORK_WITH_IOMMU_ALLOWED (1u << 0)
> +#define XENMEM_FORK_PROHIBIT_INTERRUPTS (1u << 1)

FWIW, I would also use BLOCK here instead of PROHIBIT.

Thanks, Roger.

