Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C19EF1C3967
	for <lists+xen-devel@lfdr.de>; Mon,  4 May 2020 14:31:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jVaEk-00082I-UE; Mon, 04 May 2020 12:30:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NHsq=6S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jVaEi-00082C-Sa
 for xen-devel@lists.xenproject.org; Mon, 04 May 2020 12:30:16 +0000
X-Inumbo-ID: 018df5e4-8e03-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 018df5e4-8e03-11ea-ae69-bc764e2007e4;
 Mon, 04 May 2020 12:30:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0B642ABD0;
 Mon,  4 May 2020 12:30:15 +0000 (UTC)
Subject: Re: [PATCH] x86/hvm: allow for more fine grained assisted flush
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200430091725.80656-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <56d86cd8-9c0b-fe85-fa2f-5b5a9cf89cef@suse.com>
Date: Mon, 4 May 2020 14:30:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430091725.80656-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 30.04.2020 11:17, Roger Pau Monne wrote:
> Improve the assisted flush by expanding the interface and allowing for
> more fine grained TLB flushes to be issued using the HVMOP_flush_tlbs
> hypercall. Support for such advanced flushes is signaled in CPUID
> using the XEN_HVM_CPUID_ADVANCED_FLUSH flag.
> 
> The new features make use of the NULL parameter so far passed in the
> hypercall in order to convey extra data to perform more selective
> flushes: a virtual address, an order field, a flags field and finally a
> vCPU bitmap. Note that not all features are implemented as part of
> this patch, but are already added to the interface in order to avoid
> having to introduce yet a new CPUID flag when the new features are
> added.
> 
> The feature currently implemented is the usage of a guest provided
> vCPU bitmap in order to signal which vCPUs require a TLB flush,
> instead of assuming all vCPUs must be flushed. Note that not
> implementing the rest of the features just make the flush less
> efficient, but it's still correct and safe.

A risk of not supporting these right away is that guest bugs may go
unnoticed for quite some time. Just as a remark, not as a request
to do the implementation right away.

> --- a/xen/arch/x86/guest/xen/xen.c
> +++ b/xen/arch/x86/guest/xen/xen.c
> @@ -326,7 +326,27 @@ static void __init e820_fixup(struct e820map *e820)
>  
>  static int flush_tlb(const cpumask_t *mask, const void *va, unsigned int flags)
>  {
> -    return xen_hypercall_hvm_op(HVMOP_flush_tlbs, NULL);
> +    xen_hvm_flush_tlbs_t op = {
> +        .va = (unsigned long)va,
> +        .order = (flags - 1) & FLUSH_ORDER_MASK,

I consider such an expression as reasonable to use when there's a
single, central place (in flushtlb.c). For uses elsewhere (and
then better mirrored to the original place) I think we want to
have a macro inverting FLUSH_ORDER(), e.g. FLUSH_GET_ORDER().

> +        .flags = ((flags & FLUSH_TLB_GLOBAL) ? HVMOP_flush_global : 0) |
> +                 ((flags & FLUSH_VA_VALID) ? HVMOP_flush_va_valid : 0),
> +        .mask_size = BITS_TO_LONGS(nr_cpu_ids),
> +    };
> +    static int8_t __read_mostly advanced_flush = -1;
> +
> +    if ( advanced_flush == -1 )
> +    {
> +        uint32_t eax, ebx, ecx, edx;
> +
> +        ASSERT(xen_cpuid_base);
> +        cpuid(xen_cpuid_base + 4, &eax, &ebx, &ecx, &edx);
> +        advanced_flush = (eax & XEN_HVM_CPUID_ADVANCED_FLUSH) ? 1 : 0;

Use the more conventional (in our code base) !! here? Also use
cpuid_eax(), to avoid several dead locals?

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4011,17 +4011,42 @@ static void hvm_s3_resume(struct domain *d)
>      }
>  }
>  
> -static bool always_flush(void *ctxt, struct vcpu *v)
> +static bool flush_check(void *mask, struct vcpu *v)

const twice?

>  {
> -    return true;
> +    return mask ? test_bit(v->vcpu_id, (unsigned long *)mask) : true;

And a 3rd time?

>  }
>  
> -static int hvmop_flush_tlb_all(void)
> +static int hvmop_flush_tlb(XEN_GUEST_HANDLE_PARAM(xen_hvm_flush_tlbs_t) uop)
>  {
> +    xen_hvm_flush_tlbs_t op;

This could move into the more narrow scope below.

> +    DECLARE_BITMAP(mask, HVM_MAX_VCPUS) = { };
> +    bool valid_mask = false;
> +
>      if ( !is_hvm_domain(current->domain) )
>          return -EINVAL;
>  
> -    return paging_flush_tlb(always_flush, NULL) ? 0 : -ERESTART;
> +    if ( !guest_handle_is_null(uop) )
> +    {
> +        if ( copy_from_guest(&op, uop, 1) )
> +            return -EFAULT;
> +
> +        /*
> +         * TODO: implement support for the other features present in
> +         * xen_hvm_flush_tlbs_t: flushing a specific virtual address and not
> +         * flushing global mappings.
> +         */
> +
> +        if ( op.mask_size > ARRAY_SIZE(mask) )
> +            return -EINVAL;

While a proper safeguard for the implementation, this looks rather
arbitrary from the guests's pov: Bits beyond the guest's vCPU count
aren't meaningful anyway. They could be ignored by not copying here,
rather than by never inspecting them in flush_check(). And ignoring
some bits here would then call for this to be done consistently for
all of them, i.e. not returning -EINVAL.

> +        if ( copy_from_guest(mask, op.vcpu_mask, op.mask_size) )
> +            return -EFAULT;
> +
> +        valid_mask = true;
> +    }
> +
> +    return paging_flush_tlb(flush_check, valid_mask ? mask : NULL) ? 0
> +                                                                   : -ERESTART;

Just as a suggestion, this might look a little less odd when wrapped
as

    return paging_flush_tlb(flush_check,
                            valid_mask ? mask : NULL) ? 0 : -ERESTART;

But it's really up to you.

> @@ -5017,7 +5042,7 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>          break;
>  
>      case HVMOP_flush_tlbs:
> -        rc = guest_handle_is_null(arg) ? hvmop_flush_tlb_all() : -EINVAL;
> +        rc = hvmop_flush_tlb(guest_handle_cast(arg, xen_hvm_flush_tlbs_t));

There's nothing to be passed back so maybe you could even cast to a
const handle here?

> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -99,8 +99,29 @@ DEFINE_XEN_GUEST_HANDLE(xen_hvm_set_pci_link_route_t);
>  
>  #endif /* __XEN_INTERFACE_VERSION__ < 0x00040900 */
>  
> -/* Flushes all VCPU TLBs: @arg must be NULL. */
> +/*
> + * Flushes all VCPU TLBs: @arg can be NULL or xen_hvm_flush_tlbs_t.
> + *
> + * Support for passing a xen_hvm_flush_tlbs_t parameter is signaled in CPUID,
> + * see XEN_HVM_CPUID_ADVANCED_FLUSH.
> + */
>  #define HVMOP_flush_tlbs          5
> +struct xen_hvm_flush_tlbs {
> +    /* Virtual address to be flushed. */
> +    uint64_t va;
> +    uint16_t order;
> +    uint16_t flags;
> +/* Flush global mappings. */
> +#define HVMOP_flush_global      (1u << 0)
> +/* VA for the flush has a valid mapping. */
> +#define HVMOP_flush_va_valid    (1u << 1)
> +    /* Number of uint64_t elements in vcpu_mask. */
> +    uint32_t mask_size;
> +    /* Bitmask of vcpus that should be flushed. */
> +    XEN_GUEST_HANDLE(const_uint64) vcpu_mask;

This will make the structure have different size for 64- and 32-bit
callers. Apart from altp2m interfaces there's no precedent of a
handle in the hvmop structures, so I wonder whether this wouldn't
better be replaced, e.g. by having an effectively variable size
array at the end of the struct. Simply forcing suitable padding,
e.g. by using uint64_aligned_t for the first field, won't help, as
this would lead to 32-bit callers not having suitable control over
the upper 32 bits of what Xen will take as the handle. (And of
course right now both uint64_aligned_t and XEN_GUEST_HANDLE_64 are
Xen+tools constructs only.)

Jan

