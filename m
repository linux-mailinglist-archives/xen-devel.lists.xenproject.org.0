Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5326F21098A
	for <lists+xen-devel@lfdr.de>; Wed,  1 Jul 2020 12:39:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jqa8V-0003Hl-VW; Wed, 01 Jul 2020 10:38:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4aC=AM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jqa8U-0003Hd-0R
 for xen-devel@lists.xenproject.org; Wed, 01 Jul 2020 10:38:38 +0000
X-Inumbo-ID: 04b53f50-bb87-11ea-86eb-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 04b53f50-bb87-11ea-86eb-12813bfff9fa;
 Wed, 01 Jul 2020 10:38:36 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: R2TE0un+zsVHMM+MRn8fHq2WYJYqL4pXQHDlZu6k9kDazEQHlilYmW2SlcIQbCfPbiAthqkmIN
 6JKe84TTzgUzizHFDgj+kEj0f+CvXNkofeQit5omhtd7byFhMCivICwTvX/FJ4hi7htH5Oyt7I
 ACIEfTu/C9piTRzcU1vWfyBYCUHD6Bxb7FqxBGgspn+D73h2sqvI/NjBQ3m6P/pkk8gYSVa9Ex
 /Ql//GNfuNxQI/BiT3KcW//OWjgCEZGXStfc1ESnRyAJq4uBwzEPhC0WF0O6zx5S7LM8doyQg7
 O70=
X-SBRS: 2.7
X-MesageID: 21692216
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,299,1589256000"; d="scan'208";a="21692216"
Date: Wed, 1 Jul 2020 12:38:29 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v4 05/10] common/domain: allocate vmtrace_pt_buffer
Message-ID: <20200701103829.GR735@Air-de-Roger>
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <0e02c97054da6e367f740ab8d2574e2d255553c8.1593519420.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0e02c97054da6e367f740ab8d2574e2d255553c8.1593519420.git.michal.leszczynski@cert.pl>
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
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 tamas.lengyel@intel.com, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, luwei.kang@intel.com,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 30, 2020 at 02:33:48PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allocate processor trace buffer for each vCPU when the domain
> is created, deallocate trace buffers on domain destruction.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/domain.c        | 11 +++++++++++
>  xen/common/domain.c          | 32 ++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/domain.h |  4 ++++
>  xen/include/xen/sched.h      |  4 ++++
>  4 files changed, 51 insertions(+)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index fee6c3931a..0d79fd390c 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2199,6 +2199,17 @@ int domain_relinquish_resources(struct domain *d)
>                  altp2m_vcpu_disable_ve(v);
>          }
>  
> +        for_each_vcpu ( d, v )
> +        {
> +            if ( !v->arch.vmtrace.pt_buf )
> +                continue;
> +
> +            vmtrace_destroy_pt(v);
> +
> +            free_domheap_pages(v->arch.vmtrace.pt_buf,
> +                get_order_from_bytes(v->domain->vmtrace_pt_size));
> +        }
> +
>          if ( is_pv_domain(d) )
>          {
>              for_each_vcpu ( d, v )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 27dcfbac8c..8513659ef8 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -137,6 +137,31 @@ static void vcpu_destroy(struct vcpu *v)
>      free_vcpu_struct(v);
>  }
>  
> +static int vmtrace_alloc_buffers(struct vcpu *v)
> +{
> +    struct page_info *pg;
> +    uint64_t size = v->domain->vmtrace_pt_size;

IMO you would be better by just storing an order here (like it's
passed from the toolstack), that would avoid the checks and conversion
to an order. Also vmtrace_pt_size could be of type unsigned int
instead of uint64_t.

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
> +    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
> +                             MEMF_no_refcount);
> +
> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    v->arch.vmtrace.pt_buf = pg;

You can assign to pt_buf directly IMO, no need for the pg local
variable.

> +    return 0;
> +}
> +
>  struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>  {
>      struct vcpu *v;
> @@ -162,6 +187,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      v->vcpu_id = vcpu_id;
>      v->dirty_cpu = VCPU_CPU_CLEAN;
>  
> +    if ( d->vmtrace_pt_size && vmtrace_alloc_buffers(v) != 0 )
> +        return NULL;

You are leaking the allocated v here, see other error paths below in
the function.

> +
>      spin_lock_init(&v->virq_lock);
>  
>      tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
> @@ -188,6 +216,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      if ( arch_vcpu_create(v) != 0 )
>          goto fail_sched;
>  
> +    if ( d->vmtrace_pt_size && vmtrace_init_pt(v) != 0 )
> +        goto fail_sched;
> +
>      d->vcpu[vcpu_id] = v;
>      if ( vcpu_id != 0 )
>      {
> @@ -422,6 +453,7 @@ struct domain *domain_create(domid_t domid,
>      d->shutdown_code = SHUTDOWN_CODE_INVALID;
>  
>      spin_lock_init(&d->pbuf_lock);
> +    spin_lock_init(&d->vmtrace_lock);
>  
>      rwlock_init(&d->vnuma_rwlock);
>  
> diff --git a/xen/include/asm-x86/domain.h b/xen/include/asm-x86/domain.h
> index 6fd94c2e14..b01c107f5c 100644
> --- a/xen/include/asm-x86/domain.h
> +++ b/xen/include/asm-x86/domain.h
> @@ -627,6 +627,10 @@ struct arch_vcpu
>      struct {
>          bool next_interrupt_enabled;
>      } monitor;
> +
> +    struct {
> +        struct page_info *pt_buf;
> +    } vmtrace;
>  };
>  
>  struct guest_memory_policy
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

Does this need to be per domain or rather per-vcpu? It's hard to tell
because there's no user of it in the patch.

Thanks, Roger.

