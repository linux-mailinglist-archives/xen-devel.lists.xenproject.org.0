Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E67211FBCC5
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 19:24:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlFJa-0004eL-VW; Tue, 16 Jun 2020 17:24:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AL9H=75=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlFJZ-0004eG-4F
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 17:24:01 +0000
X-Inumbo-ID: 2a2e0f7e-aff6-11ea-b7bb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2a2e0f7e-aff6-11ea-b7bb-bc764e2007e4;
 Tue, 16 Jun 2020 17:23:59 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ovqahp/+ZMcWeBRg7wcNi3fXc481L0avOVehRt+XTY65K7oaca2TUrlpHAParKuRy2pIo2gkDC
 CeG7y6B2IqGBSKhGZu/QVCp9JE2GF0zwvMDC3rS2gPcdt1GWNVJp/OkeD+PrnU9HSFGKv0iUUv
 uSDefTgNyIw5Y0hzOIabKvccw/RlcZ//xJNCTueE4BNMh1vdZBprwj6j2MkBaRrYeZWNhRZ0PW
 pE8gm/hFV5nRe8TaaXLHjYhfS5ZRkMJcu1j4XJQ730/eAB5UbPHVweOAMUCB/D9iEENim4F+1m
 sug=
X-SBRS: 2.7
X-MesageID: 20539254
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,518,1583211600"; d="scan'208";a="20539254"
Date: Tue, 16 Jun 2020 19:23:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v1 4/7] x86/vmx: add do_vmtrace_op
Message-ID: <20200616172352.GT735@Air-de-Roger>
References: <1548605014.8764792.1592320576239.JavaMail.zimbra@cert.pl>
 <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34833328.8766172.1592320926648.JavaMail.zimbra@cert.pl>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, Jun 16, 2020 at 05:22:06PM +0200, Michał Leszczyński wrote:
> Provide an interface for privileged domains to manage
> external IPT monitoring.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>

Thanks for the patch! I have some questions below which require your
input.

> ---
>  xen/arch/x86/hvm/hvm.c          | 170 ++++++++++++++++++++++++++++++++
>  xen/include/public/hvm/hvm_op.h |  27 +++++
>  2 files changed, 197 insertions(+)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 5bb47583b3..9292caebe0 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -4949,6 +4949,172 @@ static int compat_altp2m_op(
>      return rc;
>  }
>  
> +static int do_vmtrace_op(
> +    XEN_GUEST_HANDLE_PARAM(void) arg)

No need for the newline, this can fit on a single line.

> +{
> +    struct xen_hvm_vmtrace_op a;
> +    struct domain *d = NULL;

I don't think you need to init d to NULL (at least by looking at the
current code below).

> +    int rc = -EFAULT;

No need to init rc.

> +    int i;

unsigned since it's used as a loop counter.

> +    struct vcpu *v;
> +    void* buf;

Nit: '*' should be prepended to the variable name.

> +    uint32_t buf_size;

size_t

> +    uint32_t buf_order;

Order is generally fine using unsigned int, no need to use a
specifically sized type.

> +    uint64_t buf_mfn;

Could this use the mfn type?

> +    struct page_info *pg;
> +
> +    if ( !hvm_ipt_supported() )
> +        return -EOPNOTSUPP;
> +
> +    if ( copy_from_guest(&a, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( a.version != HVMOP_VMTRACE_INTERFACE_VERSION )
> +        return -EINVAL;
> +
> +    switch ( a.cmd )
> +    {
> +    case HVMOP_vmtrace_ipt_enable:
> +    case HVMOP_vmtrace_ipt_disable:
> +    case HVMOP_vmtrace_ipt_get_buf:
> +    case HVMOP_vmtrace_ipt_get_offset:
> +        break;
> +
> +    default:
> +        return -EOPNOTSUPP;
> +    }
> +
> +    d = rcu_lock_domain_by_any_id(a.domain);
> +
> +    if ( d == NULL )
> +        return -ESRCH;
> +
> +    if ( !is_hvm_domain(d) )
> +    {
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    domain_pause(d);
> +
> +    if ( a.vcpu >= d->max_vcpus )
> +    {
> +        rc = -EINVAL;
> +        goto out;
> +    }
> +
> +    v = d->vcpu[a.vcpu];
> +
> +    if ( a.cmd == HVMOP_vmtrace_ipt_enable )

Please use a switch here, you might even consider re-using the switch
from above and moving the domain checks before actually checking the
command field, so that you don't need to perform two switches against
a.cmd.

> +    {
> +        if ( v->arch.hvm.vmx.ipt_state ) {

Coding style, brace should be on newline (there are more below which
I'm not going to comment on).

> +            // already enabled

Comments should use /* ... */, there multiple instances of this below
which I'm not going to comment on, please check CODING_STYLE.

Also, the interface looks racy, I think you are missing a lock to
protect v->arch.hvm.vmx.ipt_state from being freed under your feet if
you issue concurrent calls to the interface.

> +            rc = -EINVAL;
> +            goto out;
> +        }
> +
> +        if ( a.size < PAGE_SIZE || a.size > 1000000 * PAGE_SIZE ) {

You can use GB(4) which is easier to read. Should the size also be a
multiple of a PAGE_SIZE?

> +            // we don't accept trace buffer size smaller than single page
> +            // and the upper bound is defined as 4GB in the specification
> +            rc = -EINVAL;
> +            goto out;
> +	}

Stray tab.

> +
> +        buf_order = get_order_from_bytes(a.size);
> +
> +        if ( (a.size >> PAGE_SHIFT) != (1 << buf_order) ) {

Oh here is the check. I think you can move this with the checks above
by doing a.size & ~PAGE_MASK.

> +            rc = -EINVAL;
> +            goto out;
> +        }
> +
> +        buf = page_to_virt(alloc_domheap_pages(d, buf_order, MEMF_no_refcount));

What if alloc_domheap_pages return NULL?

Since I think you only what the linear address of the page to zero it
I would suggest using clear_domain_page.

> +        buf_size = a.size;
> +
> +        if ( !buf ) {
> +            rc = -EFAULT;
> +            goto out;
> +        }
> +
> +        memset(buf, 0, buf_size);
> +
> +        for ( i = 0; i < (buf_size >> PAGE_SHIFT); i++ ) {
> +            share_xen_page_with_privileged_guests(virt_to_page(buf) + i, SHARE_ro);

This line (and some more below) exceeds 80 characters, please split
it.

> +        }
> +
> +        v->arch.hvm.vmx.ipt_state = xmalloc(struct ipt_state);

You should check that xmalloc has succeeds before trying to access
ipt_state.

> +        v->arch.hvm.vmx.ipt_state->output_base = virt_to_mfn(buf) << PAGE_SHIFT;
> +        v->arch.hvm.vmx.ipt_state->output_mask = buf_size - 1;
> +        v->arch.hvm.vmx.ipt_state->status = 0;
> +        v->arch.hvm.vmx.ipt_state->ctl = RTIT_CTL_TRACEEN | RTIT_CTL_OS | RTIT_CTL_USR | RTIT_CTL_BRANCH_EN;

Shouldn't the user be able to select what tracing should be enabled?

> +    }
> +    else if ( a.cmd == HVMOP_vmtrace_ipt_disable )
> +    {
> +        if ( !v->arch.hvm.vmx.ipt_state ) {
> +            rc = -EINVAL;
> +            goto out;
> +        }
> +
> +        buf_mfn = v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHIFT;
> +        buf_size = ( v->arch.hvm.vmx.ipt_state->output_mask + 1 ) & 0xFFFFFFFFUL;
> +
> +        for ( i = 0; i < (buf_size >> PAGE_SHIFT); i++ )
> +        {
> +            if ( (mfn_to_page(_mfn(buf_mfn + i))->count_info & PGC_count_mask) != 1 )
> +            {
> +                rc = -EBUSY;
> +                goto out;
> +            }
> +        }
> +
> +        xfree(v->arch.hvm.vmx.ipt_state);
> +	v->arch.hvm.vmx.ipt_state = NULL;
> +
> +        for ( i = 0; i < (buf_size >> PAGE_SHIFT); i++ )
> +        {
> +            pg = mfn_to_page(_mfn(buf_mfn + i));
> +            put_page_alloc_ref(pg);
> +            if ( !test_and_clear_bit(_PGC_xen_heap, &pg->count_info) )
> +                ASSERT_UNREACHABLE();
> +            pg->u.inuse.type_info = 0;
> +            page_set_owner(pg, NULL);
> +            free_domheap_page(pg);

Hm, this seems fairly dangerous, what guarantees that the caller is
not going to map the buffer while you are trying to tear it down?

You perform a check before freeing ipt_state, but between the check
and the actual tearing down the domain might have setup mappings to
them.

I wonder, could you expand a bit on why trace buffers are allocated
from domheap memory by Xen?

There are a couple of options here, maybe the caller could provide
it's own buffer, then Xen would take an extra reference to those pages
and setup them to be used as buffers.

Another alternative would be to use domhep memory but not let the
caller map it directly, and instead introduce a hypercall to copy
from the internal Xen buffer into a user-provided one.

How much memory is used on average by those buffers? That would help
decide a model that would best fit the usage.

> +        }
> +    }
> +    else if ( a.cmd == HVMOP_vmtrace_ipt_get_buf )
> +    {
> +        if ( !v->arch.hvm.vmx.ipt_state ) {
> +            rc = -EINVAL;
> +            goto out;
> +        }
> +
> +        a.mfn = v->arch.hvm.vmx.ipt_state->output_base >> PAGE_SHIFT;

This will not work for translated domains, ie: a PVH or HVM domain
won't be able to use this interface since it has no way to request the
mapping of a specific mfn into it's physmap. I think we need to take
this into account when deciding how the interface should be, so that
we don't corner ourselves with a PV only interface.

> +        a.size = (v->arch.hvm.vmx.ipt_state->output_mask + 1) & 0xFFFFFFFFUL;

You can truncate it easier by casting to uint32_t I think.

Or even better, you could put output_mask in a union like:

union {
    uint64_t raw;
    struct {
        uint32_t size;
	uint32_t offset;
    }
}

Then you can avoid the shifting and the castings.

> +    }
> +    else if ( a.cmd == HVMOP_vmtrace_ipt_get_offset )
> +    {
> +        if ( !v->arch.hvm.vmx.ipt_state ) {
> +            rc = -EINVAL;
> +            goto out;
> +        }
> +
> +        a.offset = v->arch.hvm.vmx.ipt_state->output_mask >> 32;
> +    }
> +
> +    rc = -EFAULT;
> +    if ( __copy_to_guest(arg, &a, 1) )
> +      goto out;
> +    rc = 0;
> +
> + out:
> +    smp_wmb();

Why do you need a barrier here?

> +    domain_unpause(d);
> +    rcu_unlock_domain(d);
> +
> +    return rc;
> +}
> +
> +DEFINE_XEN_GUEST_HANDLE(compat_hvm_vmtrace_op_t);
> +
>  static int hvmop_get_mem_type(
>      XEN_GUEST_HANDLE_PARAM(xen_hvm_get_mem_type_t) arg)
>  {
> @@ -5101,6 +5267,10 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
>          rc = current->hcall_compat ? compat_altp2m_op(arg) : do_altp2m_op(arg);
>          break;
>  
> +    case HVMOP_vmtrace:
> +        rc = do_vmtrace_op(arg);
> +        break;
> +
>      default:
>      {
>          gdprintk(XENLOG_DEBUG, "Bad HVM op %ld.\n", op);
> diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
> index 870ec52060..3bbcd54c96 100644
> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -382,6 +382,33 @@ struct xen_hvm_altp2m_op {
>  typedef struct xen_hvm_altp2m_op xen_hvm_altp2m_op_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_hvm_altp2m_op_t);
>  
> +/* HVMOP_vmtrace: Perform VM tracing related operation */
> +#define HVMOP_vmtrace 26
> +
> +#define HVMOP_VMTRACE_INTERFACE_VERSION 0x00000001
> +
> +struct xen_hvm_vmtrace_op {
> +    /* IN variable */
> +    uint32_t version;   /* HVMOP_VMTRACE_INTERFACE_VERSION */
> +    uint32_t cmd;
> +/* Enable/disable external vmtrace for given domain */
> +#define HVMOP_vmtrace_ipt_enable      1
> +#define HVMOP_vmtrace_ipt_disable     2
> +#define HVMOP_vmtrace_ipt_get_buf     3
> +#define HVMOP_vmtrace_ipt_get_offset  4
> +    domid_t domain;

You are missing a padding field here AFAICT.

Roger.

