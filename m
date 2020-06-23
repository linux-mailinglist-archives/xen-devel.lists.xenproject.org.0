Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 309CF205162
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jun 2020 13:55:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jnhVm-0003Q5-VE; Tue, 23 Jun 2020 11:54:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b0dP=AE=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jnhVl-0003Q0-MN
 for xen-devel@lists.xenproject.org; Tue, 23 Jun 2020 11:54:45 +0000
X-Inumbo-ID: 54144e50-b548-11ea-b7bb-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 54144e50-b548-11ea-b7bb-bc764e2007e4;
 Tue, 23 Jun 2020 11:54:44 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: XLlSU3pQl/MYc3+tBCe+j5CH+37hOvj+Tqpn0x2eRM8qQ0rwGEFzaTcTLB2PJYWqIygcJMa4mW
 y46DI6dvgeGSbdwqsyBVkDADzqDAR9ZqruxlE9MTuGKhD6zVQzY5MLiXWpF4slRHFRp62p+0/u
 C2WnuFXbn9Pcydrl9QSQ/+2eCKazZLFdujFzFa3n3eynK8ggPBiNOeYMhsChGgaXHZ6X9A3jA6
 a3LWoeiwa4g+CIFuUid2SXLvVjAr5oVqj0rJNm6SPsT863Y+f8DAKIuislEkl3YjqLCxJ4bU59
 VhA=
X-SBRS: 2.7
X-MesageID: 20927654
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,271,1589256000"; d="scan'208";a="20927654"
Subject: Re: [PATCH v3 4/7] x86/vmx: add do_vmtrace_op
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 <xen-devel@lists.xenproject.org>
References: <1617453791.11443328.1592849168658.JavaMail.zimbra@cert.pl>
 <97440747.11443782.1592849498089.JavaMail.zimbra@cert.pl>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <250cd39e-aa51-5397-93f9-b863e4f51269@citrix.com>
Date: Tue, 23 Jun 2020 12:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <97440747.11443782.1592849498089.JavaMail.zimbra@cert.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
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
 Grall <julien@xen.org>, Jun
 Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.lengyel@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22/06/2020 19:11, Michał Leszczyński wrote:
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 5bb47583b3..5899df52c3 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -58,6 +58,7 @@
>  #include <asm/monitor.h>
>  #include <asm/hvm/emulate.h>
>  #include <asm/hvm/hvm.h>
> +#include <asm/hvm/vmx/vmx.h>

You cannot include this header file, because...

>  #include <asm/hvm/vpt.h>
>  #include <asm/hvm/support.h>
>  #include <asm/hvm/cacheattr.h>
> @@ -606,6 +607,57 @@ static int hvm_print_line(
>      return X86EMUL_OKAY;
>  }
>  
> +static int vmtrace_alloc_buffers(struct vcpu *v, uint64_t size)
> +{
> +    struct page_info *pg;
> +    struct pt_state *pt;
> +
> +    if ( size < PAGE_SIZE || size > GB(4) || (size & (size - 1)) )
> +    {
> +        /*
> +         * We don't accept trace buffer size smaller than single page
> +         * and the upper bound is defined as 4GB in the specification.
> +         * The buffer size must be also a power of 2.
> +         */
> +        return -EINVAL;
> +    }
> +
> +    if ( vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
> +        return -EFAULT;

... this will explode on AMD hardware, as will ...

> +
> +    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
> +                             MEMF_no_refcount);
> +
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    pt = xzalloc(struct pt_state);
> +
> +    if ( !pt )
> +        return -ENOMEM;
> +
> +    pt->output_base = page_to_maddr(pg);
> +    pt->output_mask.raw = size - 1;
> +
> +    v->arch.hvm.vmx.pt_state = pt;

... this.  Both by reaching into the wrong half of the vmx/svm union. 
(Also for the acquire resource in mm.c)

> @@ -5101,6 +5265,10 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
>          break;
>  
> +    case HVMOP_vmtrace:
> +        rc = do_vmtrace_op(arg);
> +        break;

In my feedback on v1, I specifically recommended domctl, because hvmop
is incompatible with a future expansion to PV guests.

> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 59bdc28c89..054892befe 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -92,6 +92,7 @@ struct xen_domctl_createdomain {
>      uint32_t max_evtchn_port;
>      int32_t max_grant_frames;
>      int32_t max_maptrack_frames;
> +    uint64_t vmtrace_pt_size;

For now, we have very limited space (128 bytes total) for this
structure.  This will change in the future with the tools ABI changes,
but uint64_t is total overkill.

Julien/Stefano: For ARM CoreSight, are the trace buffers required to be
a power of two size, and/or is this a reasonable implementation
restriction you'd be willing to live with?

If so, we can get away with a uint8_t vmtrace_order, using 0 for
"nothing", 1 for 8k, 2 for 16k etc.  (This does rule out allocating a 4k
buffer, but shifting the number scheme to be order-1 is a no-go
complexity wise, and the only other alternative is an explicit CDF flag
for vmtrace).

> diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
> index 0a91bfa749..22f6185e01 100644
> --- a/xen/include/public/hvm/params.h
> +++ b/xen/include/public/hvm/params.h
> @@ -300,6 +300,6 @@
>  #define XEN_HVM_MCA_CAP_LMCE   (xen_mk_ullong(1) << 0)
>  #define XEN_HVM_MCA_CAP_MASK   XEN_HVM_MCA_CAP_LMCE
>  
> -#define HVM_NR_PARAMS 39
> +#define HVM_NR_PARAMS 40

This hunk is now stale, and can be dropped.

>  
>  #endif /* __XEN_PUBLIC_HVM_PARAMS_H__ */
> diff --git a/xen/include/public/memory.h b/xen/include/public/memory.h
> index dbd35305df..f823c784c3 100644
> --- a/xen/include/public/memory.h
> +++ b/xen/include/public/memory.h
> @@ -620,6 +620,7 @@ struct xen_mem_acquire_resource {
>  
>  #define XENMEM_resource_ioreq_server 0
>  #define XENMEM_resource_grant_table 1
> +#define XENMEM_resource_vmtrace_buf 2
>  
>      /*
>       * IN - a type-specific resource identifier, which must be zero
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index ac53519d7f..48f0a61bbd 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -457,6 +457,10 @@ struct domain
>      unsigned    pbuf_idx;
>      spinlock_t  pbuf_lock;
>  
> +    /* Used by vmtrace features */
> +    spinlock_t  vmtrace_lock;
> +    uint64_t    vmtrace_pt_size;

Overall, the moving parts of this series needs to split out into rather
more patches.

First, in patch 3, the hvm_funcs.pt_supported isn't the place for that
to live.  You want a global "bool vmtrace_supported" in common/domain.c
which vmx_init_vmcs_config() sets, and the ARM code can set in the
future when CoreSight is added.

Next, you want a patch in isolation which adds vmtrace_pt_size (or
whatever it ends up being) to createdomain, where all
allocation/deallocation logic lives in common/domain.c.  The spinlock
(if its needed, but I don't think it is) wants initialising early in
domain_create(), alongside d->pbuf_lock, and you also need an extra
clause in sanitise_domain_config() which rejects a vmtrace setting if
vmtrace isn't supported.  You'll need to put the struct page_info *
pointer to the memory allocation in struct vcpu, and adjust the vcpu
create/destroy logic appropriately.

Next, you want a patch doing the acquire resource logic for userspace to
map the buffers.

Next, you want a patch to introduce a domctl with the various runtime
enable/disable settings which were in an hvmop here.

Next, you want a patch to do the VMX plumbing, both at create, and runtime.

This ought to lay the logic out in a way which is extendable to x86 PV
guests and ARM CoreSight, and oughtn't to explode when creating guests
on non-Intel hardware.

Thanks,

~Andrew

