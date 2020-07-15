Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40722115F
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 17:44:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvjZd-0006dO-L5; Wed, 15 Jul 2020 15:43:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=osgb=A2=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jvjZc-0006dJ-9R
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 15:43:56 +0000
X-Inumbo-ID: fd095db4-c6b1-11ea-9405-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd095db4-c6b1-11ea-9405-12813bfff9fa;
 Wed, 15 Jul 2020 15:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1594827835;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=eFX4X3Du+yMs4sKTHGETgVtzJC47K3y4UNn5g7DdCp0=;
 b=cfQac7w6Dmw1G4MWMdJSFflbnCx2NuACQr2IU+Vx7T56kNKuDSzdwdz3
 sZpsV2yJ8AMy0EqUo10eFsjgL+fO45qpsza2xxdGXnEN71oR3gCkKgrzs
 dLfinjUX7IQQWsNzm8EEWzKlC/2PCiUcB+qLm2r5VkUb2Kyp9fyPA3ubu k=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: zy1S6SxYV46G6qHME/eZ5AvW8W/1oZddLztwLx1MC9IYuBS3xlCEDhynA9X6XTlDbvu5sgAgwQ
 9CJDCC59sW24r/apdt47HNeeubJT2RjfbpfkZuP3i0oaO60P4PwNHkDGM9Q9aBgOeU4cBy1o2g
 3tMXh5jj7Q1SqfNrkA1tzehLQ5ureRV43Yk53p68fgCC2/4UGZTTi7/90+7mO2gsusGO5EVAqN
 6BMSJB/fN4dW+JJj9ktn2aMBCUD4s868hqJW81VZuASYJBiJ0WkaDNhuzTZwZ+mXn7CbCOVnCC
 wqA=
X-SBRS: 2.7
X-MesageID: 22445449
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,355,1589256000"; d="scan'208";a="22445449"
Date: Wed, 15 Jul 2020 17:43:47 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v6 06/11] x86/hvm: processor trace interface in HVM
Message-ID: <20200715154347.GD7191@Air-de-Roger>
References: <cover.1594150543.git.michal.leszczynski@cert.pl>
 <1916e06793ffaaa70c471bcd6bcf168597793bd5.1594150543.git.michal.leszczynski@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1916e06793ffaaa70c471bcd6bcf168597793bd5.1594150543.git.michal.leszczynski@cert.pl>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
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

On Tue, Jul 07, 2020 at 09:39:45PM +0200, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Implement necessary changes in common code/HVM to support
> processor trace features. Define vmtrace_pt_* API and
> implement trace buffer allocation/deallocation in common
> code.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/domain.c         | 21 +++++++++++++++++++++
>  xen/common/domain.c           | 35 +++++++++++++++++++++++++++++++++++
>  xen/include/asm-x86/hvm/hvm.h | 20 ++++++++++++++++++++
>  xen/include/xen/sched.h       |  4 ++++
>  4 files changed, 80 insertions(+)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index b75017b28b..8ce2ab6b8f 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -2205,6 +2205,27 @@ int domain_relinquish_resources(struct domain *d)
>                  altp2m_vcpu_disable_ve(v);
>          }
>  
> +        for_each_vcpu ( d, v )
> +        {
> +            unsigned int i;
> +            uint64_t nr_pages = v->domain->processor_trace_buf_kb * KB(1);
> +            nr_pages >>= PAGE_SHIFT;

It would be easier as:

unsigned int nr_pages = d->processor_trace_buf_kb / KB(4);

Or maybe:

unsigned int nr_pages = d->processor_trace_buf_kb >> (PAGE_SHIFT - 10);

> +
> +            if ( !v->vmtrace.pt_buf )
> +                continue;
> +
> +            for ( i = 0; i < nr_pages; i++ )
> +            {
> +                struct page_info *pg = mfn_to_page(
> +                    mfn_add(page_to_mfn(v->vmtrace.pt_buf), i));

You can just do:

struct page_info *pg = v->vmtrace.pt_buf[i];

> +
> +                put_page_alloc_ref(pg);
> +                put_page_and_type(pg);
> +            }
> +
> +            v->vmtrace.pt_buf = NULL;
> +        }
> +
>          if ( is_pv_domain(d) )
>          {
>              for_each_vcpu ( d, v )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index e6e8f88da1..193099a2ab 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -137,6 +137,38 @@ static void vcpu_destroy(struct vcpu *v)
>      free_vcpu_struct(v);
>  }
>  
> +static int vmtrace_alloc_buffers(struct vcpu *v)
> +{
> +    unsigned int i;
> +    struct page_info *pg;
> +    uint64_t size = v->domain->processor_trace_buf_kb * KB(1);

Same here, you could just use a number of pages directly and turn size
into 'unsigned int nr_pages', and then use get_order_from_pages
below.

> +
> +    pg = alloc_domheap_pages(v->domain, get_order_from_bytes(size),
> +                             MEMF_no_refcount);
> +

Extra newline.

> +    if ( !pg )
> +        return -ENOMEM;
> +
> +    for ( i = 0; i < (size >> PAGE_SHIFT); i++ )
> +    {
> +        struct page_info *pg_iter = mfn_to_page(
> +            mfn_add(page_to_mfn(pg), i));

Same as above here, just use pg[i],

> +
> +        if ( !get_page_and_type(pg_iter, v->domain, PGT_writable_page) )
> +        {
> +            /*
> +             * The domain can't possibly know about this page yet, so failure
> +             * here is a clear indication of something fishy going on.
> +             */
> +            domain_crash(v->domain);
> +            return -ENODATA;

ENODATA is IMO a weird return code, ENOMEM would likely be better.

What about the pg array of pages, don't you need to free it somehow?
(and likely drop the references to pages before pg[i] on the array)

> +        }
> +    }

Also you seem to assume that size is a power of 2, but I think that's
only guaranteed by the current Intel implementation, and hence other
implementations could have a more lax requirement (or even Intel when
using TOPA).

So you need to free the remaining pages if
(1 << get_order_from_pages(nr_pages)) != nr_pages.

> +
> +    v->vmtrace.pt_buf = pg;
> +    return 0;
> +}
> +
>  struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>  {
>      struct vcpu *v;
> @@ -162,6 +194,9 @@ struct vcpu *vcpu_create(struct domain *d, unsigned int vcpu_id)
>      v->vcpu_id = vcpu_id;
>      v->dirty_cpu = VCPU_CPU_CLEAN;
>  
> +    if ( d->processor_trace_buf_kb && vmtrace_alloc_buffers(v) != 0 )
> +        return NULL;

Don't you need to do some cleanup here in case of failure? AFAICT this
seems to leak the allocated v at least.

>      spin_lock_init(&v->virq_lock);
>  
>      tasklet_init(&v->continue_hypercall_tasklet, NULL, NULL);
> diff --git a/xen/include/asm-x86/hvm/hvm.h b/xen/include/asm-x86/hvm/hvm.h
> index 1eb377dd82..476a216205 100644
> --- a/xen/include/asm-x86/hvm/hvm.h
> +++ b/xen/include/asm-x86/hvm/hvm.h
> @@ -214,6 +214,10 @@ struct hvm_function_table {
>      bool_t (*altp2m_vcpu_emulate_ve)(struct vcpu *v);
>      int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs);
>  
> +    /* vmtrace */
> +    int (*vmtrace_control_pt)(struct vcpu *v, bool enable);
> +    int (*vmtrace_get_pt_offset)(struct vcpu *v, uint64_t *offset, uint64_t *size);
> +
>      /*
>       * Parameters and callbacks for hardware-assisted TSC scaling,
>       * which are valid only when the hardware feature is available.
> @@ -655,6 +659,22 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu *v)
>      return false;
>  }
>  
> +static inline int vmtrace_control_pt(struct vcpu *v, bool enable)
> +{
> +    if ( hvm_funcs.vmtrace_control_pt )
> +        return hvm_funcs.vmtrace_control_pt(v, enable);
> +
> +    return -EOPNOTSUPP;
> +}
> +
> +static inline int vmtrace_get_pt_offset(struct vcpu *v, uint64_t *offset, uint64_t *size)
> +{
> +    if ( hvm_funcs.vmtrace_get_pt_offset )
> +        return hvm_funcs.vmtrace_get_pt_offset(v, offset, size);
> +
> +    return -EOPNOTSUPP;
> +}

I think this API would be better placed together with the VMX
implementation of those functions, introducing it in this patch is
not required since there are no callers?

Thanks.

