Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85222201020
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 17:30:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmIy6-00043C-Fm; Fri, 19 Jun 2020 15:30:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z6Go=AA=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jmIy5-000437-Fw
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 15:30:13 +0000
X-Inumbo-ID: c395f878-b241-11ea-b7bb-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c395f878-b241-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 15:30:11 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 9f90II21qK+ghf7yClbc14NQ8KaWgHAf8nxsOQECCPKGd6LjoVJphzKjCip9bxNnGX6rzplLam
 Hfvsf1q5DtfF5Lfa4LiRPRoScPRFnJ8mg+bgpf8Uk8JbLxl9n/Ujix52fnsZphEdCLmG8c6fSL
 J6zc8cC4VnXfOsHz7B6HiflL3RBrtB63W+zAB8n61M0D1tAHVTjryeA+KzVfAxgDR8ugoqizKY
 mYW3foiALHMS9udoqBz2rz+KSsqSdG5gRauMxY1aWyrCWt4kjEPolyIrgEnFgsO8jYG6ohWiqB
 mHk=
X-SBRS: 2.7
X-MesageID: 20782841
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,255,1589256000"; d="scan'208";a="20782841"
Date: Fri, 19 Jun 2020 17:30:03 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: =?utf-8?Q?Micha=C5=82_Leszczy=C5=84ski?= <michal.leszczynski@cert.pl>
Subject: Re: [PATCH v2 4/7] x86/vmx: add do_vmtrace_op
Message-ID: <20200619153003.GB735@Air-de-Roger>
References: <122238637.9820857.1592523264685.JavaMail.zimbra@cert.pl>
 <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1005194077.9820950.1592523663199.JavaMail.zimbra@cert.pl>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, "Kang, Luwei" <luwei.kang@intel.com>,
 Jan Beulich <jbeulich@suse.com>, Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 19, 2020 at 01:41:03AM +0200, Michał Leszczyński wrote:
> Provide an interface for privileged domains to manage
> external IPT monitoring. Guest IPT state will be preserved
> across vmentry/vmexit using ipt_state structure.

Thanks! I have some comments below, some of them are cosmetic coding
style issues. Sorry the Xen coding style is quite different from other
projects, and it takes a bit to get used to.

> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>  xen/arch/x86/hvm/hvm.c             | 167 +++++++++++++++++++++++++++++
>  xen/arch/x86/hvm/vmx/vmx.c         |  24 +++++
>  xen/arch/x86/mm.c                  |  37 +++++++
>  xen/common/domain.c                |   1 +
>  xen/include/asm-x86/hvm/vmx/vmcs.h |  16 +++
>  xen/include/public/hvm/hvm_op.h    |  23 ++++
>  xen/include/public/hvm/params.h    |   5 +-
>  xen/include/public/memory.h        |   1 +
>  xen/include/xen/sched.h            |   3 +
>  9 files changed, 276 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
> index 5bb47583b3..145ad053d2 100644
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -1612,6 +1612,24 @@ int hvm_vcpu_initialise(struct vcpu *v)
>      return rc;
>  }
>  
> +void hvm_vmtrace_destroy(struct vcpu *v)
> +{
> +    unsigned int i;
> +    struct page_info *pg;
> +    struct ipt_state *ipt = v->arch.hvm.vmx.ipt_state;
> +    mfn_t buf_mfn = ipt->output_base >> PAGE_SHIFT;

Does this build? I think you are missing a _mfn(...) here?

> +    size_t buf_size = ipt->output_mask.size + 1;
> +
> +    xfree(ipt);
> +    v->arch.hvm.vmx.ipt_state = NULL;
> +
> +    for ( i = 0; i < (buf_size >> PAGE_SHIFT); i++ )
> +    {
> +        pg = mfn_to_page(_mfn(mfn_add(buf_mfn, i)));
> +        free_domheap_page(pg);

There's no need for the loop, just use free_domheap_pages and free the
whole allocated area at once. Also you can use maddr_to_page to get
the page from output_base.

> +    }
> +}
> +
>  void hvm_vcpu_destroy(struct vcpu *v)
>  {
>      viridian_vcpu_deinit(v);
> @@ -1631,6 +1649,8 @@ void hvm_vcpu_destroy(struct vcpu *v)
>      vlapic_destroy(v);
>  
>      hvm_vcpu_cacheattr_destroy(v);
> +
> +    hvm_vmtrace_destroy(v);
>  }
>  
>  void hvm_vcpu_down(struct vcpu *v)
> @@ -4066,6 +4086,51 @@ static int hvmop_set_evtchn_upcall_vector(
>      return 0;
>  }
>  
> +static int hvm_set_vmtrace_pt_size(struct domain *d, uint64_t value)

No need for the hvm_ prefix since it's a local function, and then I
would name it:

vmtrace_alloc_buffers(struct domain *d, uint64_t size)

I would name the variable size, so it's purpose it's clearer.

> +{
> +    void *buf;
> +    unsigned int buf_order;
> +    struct page_info *pg;
> +    struct ipt_state *ipt;
> +    struct vcpu *v;
> +
> +    if ( value < PAGE_SIZE ||
> +         value > GB(4) ||
> +         ( value & (value - 1) ) ) {

Extra spaces, and no need to place each condition on a new line as
long as you don't exceed the 80 character limit. Also thee opening
brace should be on a newline:

    if ( value < PAGE_SIZE || value > GB(4) || (value & (value - 1)) )
    {


> +        /* we don't accept trace buffer size smaller than single page
> +         * and the upper bound is defined as 4GB in the specification */

Comment style is wrong, according to CODING_STYLE this should be:

        /*
	 * We don't accept trace buffer size smaller than single page
         * and the upper bound is defined as 4GB in the specification.
	 */

Since you mention the limitations of the buffer size, I would also
mention that size must be a power of 2.

> +        return -EINVAL;
> +    }
> +
> +    for_each_vcpu ( d, v )
> +    {
> +        buf_order = get_order_from_bytes(value);

There's no need for the buf_order variable, just place the call inside
alloc_domheap_pages.

> +        pg = alloc_domheap_pages(d, buf_order, MEMF_no_refcount);

You can define the variable here:

struct page_info *pg = alloc_domheap_pages(d, get_order_from_bytes(value),
                                           MEMF_no_refcount);

ipt variable can also be defined here to reduce it's scope.

> +
> +        if ( !pg )
> +            return -EFAULT;

-ENOMEM

> +
> +        buf = page_to_virt(pg);

Why do you need buf?

You seem to get the virtual address of the page(s) just to use it in
virt_to_mfn, but you can directly use page_to_maddr and remove the buf
variable (and the shift done below).

> +
> +        if ( vmx_add_host_load_msr(v, MSR_RTIT_CTL, 0) )
> +            return -EFAULT;

You leak the pg allocation here...

> +
> +        ipt = xmalloc(struct ipt_state);

If you use xzalloc you can avoid setting the fields to 0 below.

> +
> +        if ( !ipt )
> +            return -EFAULT;

... and here in the failure paths. This should be -ENOMEM also.

> +
> +        ipt->output_base = virt_to_mfn(buf) << PAGE_SHIFT;
> +        ipt->output_mask.raw = value - 1;
> +        ipt->status = 0;
> +        ipt->active = 0;
> +
> +        v->arch.hvm.vmx.ipt_state = ipt;
> +    }
> +
> +    return 0;
> +}
> +
>  static int hvm_allow_set_param(struct domain *d,
>                                 uint32_t index,
>                                 uint64_t new_value)
> @@ -4127,6 +4192,7 @@ static int hvm_allow_set_param(struct domain *d,
>      case HVM_PARAM_NR_IOREQ_SERVER_PAGES:
>      case HVM_PARAM_ALTP2M:
>      case HVM_PARAM_MCA_CAP:
> +    case HVM_PARAM_VMTRACE_PT_SIZE:
>          if ( value != 0 && new_value != value )
>              rc = -EEXIST;
>          break;
> @@ -4328,6 +4394,9 @@ static int hvm_set_param(struct domain *d, uint32_t index, uint64_t value)
>      case HVM_PARAM_MCA_CAP:
>          rc = vmce_enable_mca_cap(d, value);
>          break;
> +    case HVM_PARAM_VMTRACE_PT_SIZE:
> +        rc = hvm_set_vmtrace_pt_size(d, value);
> +        break;
>      }
>  
>      if ( !rc )
> @@ -4949,6 +5018,100 @@ static int compat_altp2m_op(
>      return rc;
>  }
>  
> +static int do_vmtrace_op(XEN_GUEST_HANDLE_PARAM(void) arg)
> +{
> +    struct xen_hvm_vmtrace_op a;
> +    struct domain *d;
> +    int rc;
> +    struct vcpu *v;
> +    struct ipt_state *ipt;
> +
> +    if ( !hvm_pt_supported() )
> +        return -EOPNOTSUPP;
> +
> +    if ( copy_from_guest(&a, arg, 1) )
> +        return -EFAULT;
> +
> +    if ( a.version != HVMOP_VMTRACE_INTERFACE_VERSION )
> +        return -EINVAL;
> +
> +    d = rcu_lock_domain_by_any_id(a.domain);
> +    spin_lock(&d->vmtrace_lock);

This must be moved after you have checked d is not NULL.

> +
> +    if ( d == NULL )
> +        return -ESRCH;
> +
> +    if ( !is_hvm_domain(d) )

You don't need to hold vmtrace_lock to check this...

> +    {
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    domain_pause(d);

Do you really need to pause the whole domain, or just the vcpu you are
avoid to modify the parameters?

Also for HVMOP_vmtrace_ipt_get_offset there's no need to pause
anything?

> +
> +    if ( a.vcpu >= d->max_vcpus )

... neither this. I think you can reduce the locked section a bit.

> +    {
> +        rc = -EINVAL;
> +        goto out;
> +    }
> +
> +    v = d->vcpu[a.vcpu];
> +    ipt = v->arch.hvm.vmx.ipt_state;
> +
> +    if ( !ipt )
> +    {
> +        /*
> +	 * PT must be first initialized upon domain creation.
> +	 */

You have a couple of hard tab in the lines above. Also single line
comments are /* ... */.

> +        rc = -EINVAL;
> +        goto out;
> +    }
> +
> +    switch ( a.cmd )
> +    {
> +    case HVMOP_vmtrace_ipt_enable:
> +        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL,
> +                               RTIT_CTL_TRACEEN | RTIT_CTL_OS |
> +                               RTIT_CTL_USR | RTIT_CTL_BRANCH_EN) )
> +        {
> +            rc = -EFAULT;

vmx_add_guest_msr already returns a valid error code, please don't
replace it with -EFAULT unconditionally (here and below).

> +            goto out;
> +        }
> +
> +        ipt->active = 1;
> +        break;

Please add an empty newline after break;.

> +    case HVMOP_vmtrace_ipt_disable:
> +        if ( vmx_add_guest_msr(v, MSR_RTIT_CTL, 0) )
> +        {
> +            rc = -EFAULT;
> +            goto out;
> +        }
> +
> +        ipt->active = 0;
> +        break;
> +    case HVMOP_vmtrace_ipt_get_offset:
> +        a.offset = ipt->output_mask.offset;
> +        break;
> +    default:
> +        rc = -EOPNOTSUPP;
> +        goto out;
> +    }
> +
> +    rc = -EFAULT;
> +    if ( __copy_to_guest(arg, &a, 1) )
> +      goto out;
> +    rc = 0;
> +
> + out:
> +    domain_unpause(d);
> +    spin_unlock(&d->vmtrace_lock);
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
> @@ -5101,6 +5264,10 @@ long do_hvm_op(unsigned long op, XEN_GUEST_HANDLE_PARAM(void) arg)
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
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index ab19d9424e..51f0046483 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -508,11 +508,25 @@ static void vmx_restore_host_msrs(void)
>  
>  static void vmx_save_guest_msrs(struct vcpu *v)
>  {
> +    uint64_t rtit_ctl;
> +
>      /*
>       * We cannot cache SHADOW_GS_BASE while the VCPU runs, as it can
>       * be updated at any time via SWAPGS, which we cannot trap.
>       */
>      v->arch.hvm.vmx.shadow_gs = rdgsshadow();
> +
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state && v->arch.hvm.vmx.ipt_state->active) )
> +    {
> +        smp_rmb();

If this barrier is required I think it warrants a comment about why
it's needed.

> +        rdmsrl(MSR_RTIT_CTL, rtit_ctl);
> +
> +        if ( rtit_ctl & RTIT_CTL_TRACEEN )
> +            BUG();

BUG_ON(rtit_ctl & RTIT_CTL_TRACEEN);

> +
> +        rdmsrl(MSR_RTIT_STATUS, v->arch.hvm.vmx.ipt_state->status);
> +        rdmsrl(MSR_RTIT_OUTPUT_MASK, v->arch.hvm.vmx.ipt_state->output_mask.raw);
> +    }
>  }
>  
>  static void vmx_restore_guest_msrs(struct vcpu *v)
> @@ -524,6 +538,16 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
>  
>      if ( cpu_has_msr_tsc_aux )
>          wrmsr_tsc_aux(v->arch.msrs->tsc_aux);
> +
> +    if ( unlikely(v->arch.hvm.vmx.ipt_state && v->arch.hvm.vmx.ipt_state->active) )

Line is too long.

> +    {
> +        wrmsrl(MSR_RTIT_OUTPUT_BASE,
> +            v->arch.hvm.vmx.ipt_state->output_base);
> +        wrmsrl(MSR_RTIT_OUTPUT_MASK,
> +            v->arch.hvm.vmx.ipt_state->output_mask.raw);
> +        wrmsrl(MSR_RTIT_STATUS,
> +            v->arch.hvm.vmx.ipt_state->status);

Can you please align to the start of the parentheses:

        wrmsrl(MSR_RTIT_STATUS,
               v->arch.hvm.vmx.ipt_state->status);

> +    }
>  }
>  
>  void vmx_update_cpu_exec_control(struct vcpu *v)
> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
> index e376fc7e8f..e4658dc27f 100644
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4624,6 +4624,43 @@ int arch_acquire_resource(struct domain *d, unsigned int type,
>          }
>          break;
>      }
> +
> +    case XENMEM_resource_vmtrace_buf:
> +    {
> +        mfn_t mfn;
> +        unsigned int i;
> +        struct ipt_state *ipt;
> +
> +        if ( id >= d->max_vcpus )
> +        {
> +            rc = -EINVAL;

You can just set rc = -EINVAL at the top and then avoid setting it on
every error case.

> +            break;
> +        }
> +
> +        ipt = d->vcpu[id]->arch.hvm.vmx.ipt_state;
> +
> +        if ( !ipt )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        mfn = mfn_x(ipt->output_base >> PAGE_SHIFT);
> +
> +        if (nr_frames > ( ( ipt->output_mask.size + 1 ) >> PAGE_SHIFT ))

Spaces are wrongly positioned. ie:

if ( frame + nr_frames > ((ipt->output_mask.size + 1) >> PAGE_SHIFT) )

> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        rc = 0;
> +        for ( i = 0; i < nr_frames; i++ )

I think you should init i to the the 'frame' field from
xen_mem_acquire_resource, since it's possible to select the offset you
want to map from a resource. You will also need to take it into
account, because IMO that's where I would store the last processed
frame when dealing with continuations.

> +        {
> +            mfn_list[i] = mfn_add(mfn, i);
> +        }
> +
> +        break;
> +    }
>  #endif
>  
>      default:
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7cc9526139..6f6458cd5b 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -414,6 +414,7 @@ struct domain *domain_create(domid_t domid,
>      d->shutdown_code = SHUTDOWN_CODE_INVALID;
>  
>      spin_lock_init(&d->pbuf_lock);
> +    spin_lock_init(&d->vmtrace_lock);
>  
>      rwlock_init(&d->vnuma_rwlock);
>  
> diff --git a/xen/include/asm-x86/hvm/vmx/vmcs.h b/xen/include/asm-x86/hvm/vmx/vmcs.h
> index 4c81093aba..9fc4653777 100644
> --- a/xen/include/asm-x86/hvm/vmx/vmcs.h
> +++ b/xen/include/asm-x86/hvm/vmx/vmcs.h
> @@ -104,6 +104,19 @@ struct pi_blocking_vcpu {
>      spinlock_t           *lock;
>  };
>  
> +struct ipt_state {
> +    uint64_t active;

Could this be a boolean?

> +    uint64_t status;
> +    uint64_t output_base;
> +    union {
> +        uint64_t raw;
> +        struct {
> +            uint32_t size;
> +            uint32_t offset;
> +        };
> +    } output_mask;
> +};
> +
>  struct vmx_vcpu {
>      /* Physical address of VMCS. */
>      paddr_t              vmcs_pa;
> @@ -186,6 +199,9 @@ struct vmx_vcpu {
>       * pCPU and wakeup the related vCPU.
>       */
>      struct pi_blocking_vcpu pi_blocking;
> +
> +    /* State of Intel Processor Trace feature */
> +    struct ipt_state     *ipt_state;
>  };
>  
>  int vmx_create_vmcs(struct vcpu *v);
> diff --git a/xen/include/public/hvm/hvm_op.h b/xen/include/public/hvm/hvm_op.h
> index 870ec52060..8cd0b6ea49 100644
> --- a/xen/include/public/hvm/hvm_op.h
> +++ b/xen/include/public/hvm/hvm_op.h
> @@ -382,6 +382,29 @@ struct xen_hvm_altp2m_op {
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
> +#define HVMOP_vmtrace_ipt_get_offset  3
> +    domid_t domain;
> +    uint32_t vcpu;
> +    uint64_t size;
> +
> +    /* OUT variable */
> +    uint64_t offset;
> +};
> +typedef struct xen_hvm_vmtrace_op xen_hvm_vmtrace_op_t;
> +DEFINE_XEN_GUEST_HANDLE(xen_hvm_vmtrace_op_t);
> +
>  #endif /* __XEN_PUBLIC_HVM_HVM_OP_H__ */
>  
>  /*
> diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
> index 0a91bfa749..adbc7e5d08 100644
> --- a/xen/include/public/hvm/params.h
> +++ b/xen/include/public/hvm/params.h
> @@ -300,6 +300,9 @@
>  #define XEN_HVM_MCA_CAP_LMCE   (xen_mk_ullong(1) << 0)
>  #define XEN_HVM_MCA_CAP_MASK   XEN_HVM_MCA_CAP_LMCE
>  
> -#define HVM_NR_PARAMS 39
> +/* VM trace capabilities */
> +#define HVM_PARAM_VMTRACE_PT_SIZE 39

I think it was recommended that IPT should be set at domain creation,
but using a HVM param still allows you to init this after the domain
has been created. I think it might be best to just add a new field to
xen_domctl_createdomain, as it seems like the interface could also be
helpful for other arches?

Thanks, Roger.

