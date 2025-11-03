Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2FBC2AD75
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 10:48:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155268.1484775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFr9u-0008Uo-6Y; Mon, 03 Nov 2025 09:47:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155268.1484775; Mon, 03 Nov 2025 09:47:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vFr9u-0008TA-3R; Mon, 03 Nov 2025 09:47:30 +0000
Received: by outflank-mailman (input) for mailman id 1155268;
 Mon, 03 Nov 2025 09:47:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OKl+=5L=bounce.vates.tech=bounce-md_30504962.69087a2d.v1-64c37cfd18c34ef0b0fb52b8aa63f257@srs-se1.protection.inumbo.net>)
 id 1vFr9s-0008T4-Kk
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 09:47:28 +0000
Received: from mail132-29.atl131.mandrillapp.com
 (mail132-29.atl131.mandrillapp.com [198.2.132.29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a8b6cac-b89a-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 10:47:26 +0100 (CET)
Received: from pmta09.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail132-29.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4d0RZj10rmz7lmGdt
 for <xen-devel@lists.xenproject.org>; Mon,  3 Nov 2025 09:47:25 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 64c37cfd18c34ef0b0fb52b8aa63f257; Mon, 03 Nov 2025 09:47:25 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1a8b6cac-b89a-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1762163245; x=1762433245;
	bh=e34REhW2FOr9i00JivW7lM7owZg4u88m1CVJlKKPKtI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=rW5Btdh4nxeTL2CtHNJRn2Q+i1kLMQQPgHA6wCPQYp5cShkhVFwxZBGcogpBBhK2w
	 HhqFhGZmCiZlNotZdAqbMezxFkgxUHShTA2Xfl2tl39XeoR+kRifp16wzW4RRHM0hX
	 MFNz3J29ZKe8Ssj6PkQR1Xe2St4c8wAvUGx3kGo2HABNT2x2qymlVWcLKqEDv8I/Yw
	 y8zclKrExGEW70sWOSEG8VSWNn4T1VJZsQu7iW+R4qlUiuvtIcMPXpx+yMvjrb4oEb
	 NFihUT7eS9oe5dlPrhl5JqjMuiyOlQpq4BmYN5yiJ9e9VEZFnn8Y7hBUlDsysy91LA
	 AMHC8Qc1QN4eQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1762163245; x=1762423745; i=teddy.astie@vates.tech;
	bh=e34REhW2FOr9i00JivW7lM7owZg4u88m1CVJlKKPKtI=;
	h=From:Subject:Message-Id:To:Cc:References:In-Reply-To:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=NTqBzYUVe9OzWLkB4yaKbvb27MhUVRqCeihU9RwhDCsa6tD50UnhpTEa+N4rDPh2l
	 nDWYS6sDOFyDd2Fp0AN3D15GcYSuNa56HotuFKcisEY56hsHtN1T7pCsl6AbkFHYdQ
	 Pv7NTI6LTeJRGehKSRYAc7SKE+u/lVGVd9WvNwTbTZJm4mhA1xFukwJ6WfUboI56vo
	 ENGveCNq/1mJuV8VnB0C5dOBU5+x9bS2RRtpgfzeZdO9GgVzi5bxM1lhUIxd/j1Lo4
	 DkzRVBm1eAPAdDWCEVaIsAzHI6gETf804ZXmP7ybXqGRdQu+UHRpZL10x4yj8bz0Io
	 4nupH2bLDImxQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?Re:=20[XEN][PATCH]=20xen:=20make=20VMTRACE=20support=20optional?=
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1762163243064
Message-Id: <aab7824b-4485-41f4-8ad6-572ffa0ca4f3@vates.tech>
To: "Grygorii Strashko" <grygorii_strashko@epam.com>, xen-devel@lists.xenproject.org
Cc: "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Tamas K Lengyel" <tamas@tklengyel.com>, "Alexandru Isaila" <aisaila@bitdefender.com>, "Petre Pircalabu" <ppircalabu@bitdefender.com>, "Penny Zheng" <Penny.Zheng@amd.com>
References: <20251031212005.1338212-1-grygorii_strashko@epam.com>
In-Reply-To: <20251031212005.1338212-1-grygorii_strashko@epam.com>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.64c37cfd18c34ef0b0fb52b8aa63f257?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251103:md
Date: Mon, 03 Nov 2025 09:47:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Le 31/10/2025 =C3=A0 22:24, Grygorii Strashko a =C3=A9crit=C2=A0:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
> The VMTRACE feature depends on Platform/Arch HW and code support and now
> can be used only on x86 HVM with Intel VT-x (INTEL_VMX) enabled.
> This makes VMTRACE support optional by introducing two Kconfig options:
> - CONFIG_HAS_VMTRACE which allows Platform/Arch to advertise VMTRACE
> support readiness
> - CONFIG_VMTRACE to enable/disable the feature.
> 

I like the idea of making it optional since it's only used in specific 
contexts.

> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
> Based on top of patch "domain: adjust soft-reset arch dependency" [1]
> 
> [1] https://patchwork.kernel.org/project/xen-devel/patch/c9c8c9c6-a155-49=
86-bf77-5766cdcd6024@suse.com/
> 
>   xen/Kconfig.debug                       | 15 +++++++++++++++
>   xen/arch/x86/domctl.c                   |  4 ++++
>   xen/arch/x86/hvm/Kconfig                |  1 +
>   xen/arch/x86/hvm/vmx/vmcs.c             |  2 ++
>   xen/arch/x86/hvm/vmx/vmx.c              | 10 ++++++++++
>   xen/arch/x86/include/asm/guest-msr.h    |  2 ++
>   xen/arch/x86/include/asm/hvm/hvm.h      |  9 +++++++++
>   xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  2 ++
>   xen/arch/x86/mm/mem_sharing.c           |  2 ++
>   xen/arch/x86/vm_event.c                 |  6 ++++--
>   xen/common/domain.c                     | 10 ++++++++++
>   xen/common/memory.c                     |  6 ++++++
>   xen/common/vm_event.c                   |  3 ++-
>   xen/include/xen/domain.h                |  4 ++++
>   xen/include/xen/sched.h                 |  4 ++++
>   15 files changed, 77 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/Kconfig.debug b/xen/Kconfig.debug
> index d900d926c555..70ec4f0d14a5 100644
> --- a/xen/Kconfig.debug
> +++ b/xen/Kconfig.debug
> @@ -155,4 +155,19 @@ config DEBUG_INFO
>   =09  "make install-xen" for installing xen.efi, stripping needs to be
>   =09  done outside the Xen build environment).
>   
> +config HAS_VMTRACE
> +    bool
> +
> +config VMTRACE
> +    bool "HW VM tracing support"
> +    depends on HAS_VMTRACE
> +    default y
> +    help
> +      Enables HW VM tracing support which allows to configure HW process=
or
> +      features (vmtrace_op) to enable capturing information about softwa=
re
> +      execution using dedicated hardware facilities with minimal interfe=
rence
> +      to the software being traced. The trace date can be retrieved usin=
g buffer
> +      shared between Xen and domain
> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
> +
>   endmenu
> diff --git a/xen/arch/x86/domctl.c b/xen/arch/x86/domctl.c
> index 6153e3c07e2d..d9521808dcba 100644
> --- a/xen/arch/x86/domctl.c
> +++ b/xen/arch/x86/domctl.c
> @@ -154,6 +154,7 @@ void arch_get_domain_info(const struct domain *d,
>   static int do_vmtrace_op(struct domain *d, struct xen_domctl_vmtrace_op=
 *op,
>                            XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>   {
> +#ifdef CONFIG_VMTRACE
>       struct vcpu *v;
>       int rc;
>   
> @@ -198,6 +199,9 @@ static int do_vmtrace_op(struct domain *d, struct xen=
_domctl_vmtrace_op *op,
>       vcpu_unpause(v);
>   
>       return rc;
> +#else
> +    return -EOPNOTSUPP;
> +#endif
>   }
>   
>   #define MAX_IOPORTS 0x10000
> diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
> index c1a131d1851a..c017a77fffe0 100644
> --- a/xen/arch/x86/hvm/Kconfig
> +++ b/xen/arch/x86/hvm/Kconfig
> @@ -29,6 +29,7 @@ config INTEL_VMX
>   =09bool "Intel VT-x" if EXPERT
>   =09default INTEL
>   =09select ARCH_VCPU_IOREQ_COMPLETION
> +=09select HAS_VMTRACE
>   =09help
>   =09  Enables virtual machine extensions on platforms that implement the
>   =09  Intel Virtualization Technology (Intel VT-x).
> diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
> index ab8b1c87ec0f..3728a9140223 100644
> --- a/xen/arch/x86/hvm/vmx/vmcs.c
> +++ b/xen/arch/x86/hvm/vmx/vmcs.c
> @@ -300,6 +300,7 @@ static int vmx_init_vmcs_config(bool bsp)
>       rdmsrl(MSR_IA32_VMX_MISC, _vmx_misc_cap);
>   
>       /* Check whether IPT is supported in VMX operation. */
> +#ifdef CONFIG_VMTRACE
>       if ( bsp )
>           vmtrace_available =3D cpu_has_proc_trace &&
>                               (_vmx_misc_cap & VMX_MISC_PROC_TRACE);
> @@ -310,6 +311,7 @@ static int vmx_init_vmcs_config(bool bsp)
>                  smp_processor_id());
>           return -EINVAL;
>       }
> +#endif
>   
>       if ( caps.cpu_based_exec_control & CPU_BASED_ACTIVATE_SECONDARY_CON=
TROLS )
>       {
> diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
> index b65981077295..f1588cd90b2d 100644
> --- a/xen/arch/x86/hvm/vmx/vmx.c
> +++ b/xen/arch/x86/hvm/vmx/vmx.c
> @@ -622,6 +622,7 @@ static void cf_check domain_creation_finished(struct =
domain *d)
>   
>   static void vmx_init_ipt(struct vcpu *v)
>   {
> +#ifdef CONFIG_VMTRACE
>       unsigned int size =3D v->domain->vmtrace_size;
>   
>       if ( !size )
> @@ -632,6 +633,7 @@ static void vmx_init_ipt(struct vcpu *v)
>       ASSERT(size >=3D PAGE_SIZE && (size & (size - 1)) =3D=3D 0);
>   
>       v->arch.msrs->rtit.output_limit =3D size - 1;
> +#endif
>   }
>   
>   static int cf_check vmx_vcpu_initialise(struct vcpu *v)
> @@ -724,11 +726,13 @@ static void vmx_save_guest_msrs(struct vcpu *v)
>        */
>       v->arch.hvm.vmx.shadow_gs =3D read_gs_shadow();
>   
> +#ifdef CONFIG_VMTRACE
>       if ( v->arch.hvm.vmx.ipt_active )
>       {
>           rdmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
>           rdmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
>       }
> +#endif
>   
>       if ( cp->feat.pks )
>           msrs->pkrs =3D rdpkrs_and_cache();
> @@ -747,12 +751,14 @@ static void vmx_restore_guest_msrs(struct vcpu *v)
>       if ( cpu_has_msr_tsc_aux )
>           wrmsr_tsc_aux(msrs->tsc_aux);
>   
> +#ifdef CONFIG_VMTRACE
>       if ( v->arch.hvm.vmx.ipt_active )
>       {
>           wrmsrl(MSR_RTIT_OUTPUT_BASE, page_to_maddr(v->vmtrace.pg));
>           wrmsrl(MSR_RTIT_OUTPUT_MASK, msrs->rtit.output_mask);
>           wrmsrl(MSR_RTIT_STATUS, msrs->rtit.status);
>       }
> +#endif
>   
>       if ( cp->feat.pks )
>           wrpkrs(msrs->pkrs);
> @@ -2626,6 +2632,7 @@ static bool cf_check vmx_get_pending_event(
>       return true;
>   }
>   
> +#ifdef CONFIG_VMTRACE
>   /*
>    * We only let vmtrace agents see and modify a subset of bits in MSR_RT=
IT_CTL.
>    * These all pertain to data-emitted into the trace buffer(s).  Must no=
t
> @@ -2768,6 +2775,7 @@ static int cf_check vmtrace_reset(struct vcpu *v)
>       v->arch.msrs->rtit.status =3D 0;
>       return 0;
>   }
> +#endif
>   
>   static uint64_t cf_check vmx_get_reg(struct vcpu *v, unsigned int reg)
>   {
> @@ -2940,11 +2948,13 @@ static struct hvm_function_table __initdata_cf_cl=
obber vmx_function_table =3D {
>       .altp2m_vcpu_emulate_ve =3D vmx_vcpu_emulate_ve,
>       .altp2m_vcpu_emulate_vmfunc =3D vmx_vcpu_emulate_vmfunc,
>   #endif
> +#ifdef CONFIG_VMTRACE
>       .vmtrace_control =3D vmtrace_control,
>       .vmtrace_output_position =3D vmtrace_output_position,
>       .vmtrace_set_option =3D vmtrace_set_option,
>       .vmtrace_get_option =3D vmtrace_get_option,
>       .vmtrace_reset =3D vmtrace_reset,
> +#endif
>   
>       .get_reg =3D vmx_get_reg,
>       .set_reg =3D vmx_set_reg,
> diff --git a/xen/arch/x86/include/asm/guest-msr.h b/xen/arch/x86/include/=
asm/guest-msr.h
> index 5f0cb0a93995..702f47fe1e16 100644
> --- a/xen/arch/x86/include/asm/guest-msr.h
> +++ b/xen/arch/x86/include/asm/guest-msr.h
> @@ -50,6 +50,7 @@ struct vcpu_msrs
>           };
>       } misc_features_enables;
>   
> +#ifdef CONFIG_VMTRACE
>       /*
>        * 0x00000560 ... 57x - MSR_RTIT_*
>        *
> @@ -81,6 +82,7 @@ struct vcpu_msrs
>               };
>           };
>       } rtit;
> +#endif
>   
>       /*
>        * 0x000006e1 - MSR_PKRS - Protection Key Supervisor.
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/as=
m/hvm/hvm.h
> index 7412256a2dab..728b9624522f 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -234,12 +234,14 @@ struct hvm_function_table {
>       int (*altp2m_vcpu_emulate_vmfunc)(const struct cpu_user_regs *regs)=
;
>   #endif
>   
> +#ifdef CONFIG_VMTRACE
>       /* vmtrace */
>       int (*vmtrace_control)(struct vcpu *v, bool enable, bool reset);
>       int (*vmtrace_output_position)(struct vcpu *v, uint64_t *pos);
>       int (*vmtrace_set_option)(struct vcpu *v, uint64_t key, uint64_t va=
lue);
>       int (*vmtrace_get_option)(struct vcpu *v, uint64_t key, uint64_t *v=
alue);
>       int (*vmtrace_reset)(struct vcpu *v);
> +#endif
>   
>       uint64_t (*get_reg)(struct vcpu *v, unsigned int reg);
>       void (*set_reg)(struct vcpu *v, unsigned int reg, uint64_t val);
> @@ -738,6 +740,7 @@ static inline bool altp2m_vcpu_emulate_ve(struct vcpu=
 *v)
>   bool altp2m_vcpu_emulate_ve(struct vcpu *v);
>   #endif /* CONFIG_ALTP2M */
>   
> +#ifdef CONFIG_VMTRACE
>   static inline int hvm_vmtrace_control(struct vcpu *v, bool enable, bool=
 reset)
>   {
>       if ( hvm_funcs.vmtrace_control )
> @@ -780,6 +783,12 @@ static inline int hvm_vmtrace_reset(struct vcpu *v)
>   
>       return -EOPNOTSUPP;
>   }
> +#else
> +static inline int hvm_vmtrace_reset(struct vcpu *v)
> +{
> +    return 0;
> +}
> +#endif
>   
>   /*
>    * Accessors for registers which have per-guest-type or per-vendor loca=
tions
> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/inclu=
de/asm/hvm/vmx/vmcs.h
> index 8ff7c8045fc6..d28a2682e9df 100644
> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> @@ -155,7 +155,9 @@ struct vmx_vcpu {
>       bool                 ept_spurious_misconfig;
>   
>       /* Processor Trace configured and enabled for the vcpu. */
> +#ifdef CONFIG_VMTRACE
>       bool                 ipt_active;
> +#endif
>   
>       /* Is the guest in real mode? */
>       uint8_t              vmx_realmode;
> diff --git a/xen/arch/x86/mm/mem_sharing.c b/xen/arch/x86/mm/mem_sharing.=
c
> index 4787b2796479..074f1b2562b3 100644
> --- a/xen/arch/x86/mm/mem_sharing.c
> +++ b/xen/arch/x86/mm/mem_sharing.c
> @@ -1888,7 +1888,9 @@ static int fork(struct domain *cd, struct domain *d=
)
>           domain_pause(d);
>           cd->max_pages =3D d->max_pages;
>           *cd->arch.cpu_policy =3D *d->arch.cpu_policy;
> +#ifdef CONFIG_VMTRACE
>           cd->vmtrace_size =3D d->vmtrace_size;
> +#endif
>           cd->parent =3D d;
>       }
>   
> diff --git a/xen/arch/x86/vm_event.c b/xen/arch/x86/vm_event.c
> index fc349270b9c5..f4c8696ce54e 100644
> --- a/xen/arch/x86/vm_event.c
> +++ b/xen/arch/x86/vm_event.c
> @@ -253,7 +253,9 @@ void vm_event_fill_regs(vm_event_request_t *req)
>       req->data.regs.x86.shadow_gs =3D ctxt.shadow_gs;
>       req->data.regs.x86.dr6 =3D ctxt.dr6;
>   
> +#ifdef CONFIG_VMTRACE
>       if ( hvm_vmtrace_output_position(curr, &req->data.regs.x86.vmtrace_=
pos) !=3D 1 )
> +#endif
>           req->data.regs.x86.vmtrace_pos =3D ~0;

This if-def looks very oddly placed.

>   #endif
>   }
> @@ -303,12 +305,12 @@ void vm_event_emulate_check(struct vcpu *v, vm_even=
t_response_t *rsp)
>   #endif
>   }
>   
> +#ifdef CONFIG_VMTRACE
>   void vm_event_reset_vmtrace(struct vcpu *v)
>   {
> -#ifdef CONFIG_HVM
>       hvm_vmtrace_reset(v);
> -#endif
>   }
> +#endif
>   
>   /*
>    * Local variables:
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 7dcd466e5a12..2be6ee03d004 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -136,7 +136,9 @@ struct vcpu *idle_vcpu[NR_CPUS] __read_mostly;
>   
>   vcpu_info_t dummy_vcpu_info;
>   
> +#ifdef CONFIG_VMTRACE
>   bool __read_mostly vmtrace_available;
> +#endif
>   
>   bool __read_mostly vpmu_is_available;
>   
> @@ -318,6 +320,7 @@ static void vcpu_info_reset(struct vcpu *v)
>   
>   static void vmtrace_free_buffer(struct vcpu *v)
>   {
> +#ifdef CONFIG_VMTRACE
>       const struct domain *d =3D v->domain;
>       struct page_info *pg =3D v->vmtrace.pg;
>       unsigned int i;
> @@ -332,10 +335,12 @@ static void vmtrace_free_buffer(struct vcpu *v)
>           put_page_alloc_ref(&pg[i]);
>           put_page_and_type(&pg[i]);
>       }
> +#endif
>   }
>   
>   static int vmtrace_alloc_buffer(struct vcpu *v)
>   {
> +#ifdef CONFIG_VMTRACE
>       struct domain *d =3D v->domain;
>       struct page_info *pg;
>       unsigned int i;
> @@ -377,6 +382,9 @@ static int vmtrace_alloc_buffer(struct vcpu *v)
>       }
>   
>       return -ENODATA;
> +#else
> +    return 0;
> +#endif
>   }
>   
>   /*
> @@ -825,7 +833,9 @@ struct domain *domain_create(domid_t domid,
>           ASSERT(!config->altp2m.nr);
>   #endif
>   
> +#ifdef CONFIG_VMTRACE
>           d->vmtrace_size =3D config->vmtrace_size;
> +#endif
>       }
>   
>       /* Sort out our idea of is_control_domain(). */
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 3688e6dd5032..66dc7f7a0a41 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1155,8 +1155,10 @@ static unsigned int resource_max_frames(const stru=
ct domain *d,
>       case XENMEM_resource_ioreq_server:
>           return ioreq_server_max_frames(d);
>   
> +#ifdef CONFIG_VMTRACE
>       case XENMEM_resource_vmtrace_buf:
>           return d->vmtrace_size >> PAGE_SHIFT;
> +#endif
>   
>       default:
>           return 0;
> @@ -1198,6 +1200,7 @@ static int acquire_ioreq_server(struct domain *d,
>   #endif
>   }
>   
> +#ifdef CONFIG_VMTRACE
>   static int acquire_vmtrace_buf(
>       struct domain *d, unsigned int id, unsigned int frame,
>       unsigned int nr_frames, xen_pfn_t mfn_list[])
> @@ -1220,6 +1223,7 @@ static int acquire_vmtrace_buf(
>   
>       return nr_frames;
>   }
> +#endif
>   

Given that vmtrace feature is fairly isolated in VMX code, wouldn't it 
be better to move all vmtrace related functions (including vmx_init_ipt) 
in a separate vmtrace.c file and make such file gated behind 
CONFIG_VMTRACE ?

>   /*
>    * Returns -errno on error, or positive in the range [1, nr_frames] on
> @@ -1238,8 +1242,10 @@ static int _acquire_resource(
>       case XENMEM_resource_ioreq_server:
>           return acquire_ioreq_server(d, id, frame, nr_frames, mfn_list);
>   
> +#ifdef CONFIG_VMTRACE
>       case XENMEM_resource_vmtrace_buf:
>           return acquire_vmtrace_buf(d, id, frame, nr_frames, mfn_list);
> +#endif
>   
>       default:
>           ASSERT_UNREACHABLE();
> diff --git a/xen/common/vm_event.c b/xen/common/vm_event.c
> index b2787c010890..cf0258223f50 100644
> --- a/xen/common/vm_event.c
> +++ b/xen/common/vm_event.c
> @@ -441,7 +441,8 @@ static int vm_event_resume(struct domain *d, struct v=
m_event_domain *ved)
>               if ( rsp.flags & VM_EVENT_FLAG_GET_NEXT_INTERRUPT )
>                   vm_event_monitor_next_interrupt(v);
>   
> -            if ( rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE )
> +            if ( IS_ENABLED(CONFIG_VMTRACE) &&
> +                 (rsp.flags & VM_EVENT_FLAG_RESET_VMTRACE) )
>                   vm_event_reset_vmtrace(v);
>   
>               if ( rsp.flags & VM_EVENT_FLAG_VCPU_PAUSED )
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 8aab05ae93c8..aa86a9f46022 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -191,7 +191,11 @@ void vnuma_destroy(struct vnuma_info *vnuma);
>   static inline void vnuma_destroy(struct vnuma_info *vnuma) { ASSERT(!vn=
uma); }
>   #endif
>   
> +#ifdef CONFIG_VMTRACE
>   extern bool vmtrace_available;
> +#else
> +#define vmtrace_available false
> +#endif
>   
>   extern bool vpmu_is_available;
>   
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 02bdc256ce37..dcd8647e0d36 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -300,9 +300,11 @@ struct vcpu
>       /* vPCI per-vCPU area, used to store data for long running operatio=
ns. */
>       struct vpci_vcpu vpci;
>   
> +#ifdef CONFIG_VMTRACE
>       struct {
>           struct page_info *pg; /* One contiguous allocation of d->vmtrac=
e_size */
>       } vmtrace;
> +#endif
>   
>       struct arch_vcpu arch;
>   
> @@ -623,7 +625,9 @@ struct domain
>       unsigned int nr_altp2m;    /* Number of altp2m tables. */
>   #endif
>   
> +#ifdef CONFIG_VMTRACE
>       unsigned int vmtrace_size; /* Buffer size in bytes, or 0 to disable=
. */
> +#endif
>   
>   #ifdef CONFIG_ARGO
>       /* Argo interdomain communication support */



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



