Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419A8CD5DB
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:32:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728567.1133527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9UL-0007fF-V5; Thu, 23 May 2024 14:32:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728567.1133527; Thu, 23 May 2024 14:32:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9UL-0007cJ-SM; Thu, 23 May 2024 14:32:13 +0000
Received: by outflank-mailman (input) for mailman id 728567;
 Thu, 23 May 2024 14:32:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqPc=M2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sA9UJ-0007av-OO
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:32:11 +0000
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [2607:f8b0:4864:20::834])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3cbdf6be-1911-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:32:10 +0200 (CEST)
Received: by mail-qt1-x834.google.com with SMTP id
 d75a77b69052e-43fa6d92b4eso7109651cf.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:32:10 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ab8c7faf00sm10495786d6.62.2024.05.23.07.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 07:32:08 -0700 (PDT)
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
X-Inumbo-ID: 3cbdf6be-1911-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716474729; x=1717079529; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BeJ6ug4ojY5nqhiZ/esNITNBOQraTn4chWVUPnRXkFg=;
        b=fTzQWyY6chvY12SQeLLLLT1d6+Rbi5to0F9wecs2fUmeDTR/fyrZOD1C2O+eR7TU5c
         YgsVSsyU7a9WfOfAB4XJt5VsRuKUZvDkpGAjEAiuwrFYTrea/EIMes5NI6rxn8aIqJR6
         orKmcN2QYrtgY/Q4tKqeJzBV0Qj+qdZ9++7IY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716474729; x=1717079529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeJ6ug4ojY5nqhiZ/esNITNBOQraTn4chWVUPnRXkFg=;
        b=ViJnIxL/fQrko5mmZST1d/0kBoC4MzBRwttz3iOKki/nx0PxUcbfvQvKFz8JA9yTZi
         G4Youw6etRv2fhSnlMEMbKgHboJ9CaeDhCPQ4UEO7Q251FrDL7CCV3ZLnYi96Hifo0rA
         heZbalfxOArZlq+VavGhsdOjNR9BWEH+OyKJtWkP2tzYHSBZkWOd+bPYGf3aycWwK3dR
         5AcYy91QhF4EWAkTntb+pDmNbkQh/lu+0dMWAmKrCnjogYAeAREeGUxDpSy09G2xNyhs
         qjBPxvCuoosqHoRPQmFxJoYqRLOVDRwwdj78OZqKkHbZozqg78I7D3gfuhYHkmhYm7sH
         VU6A==
X-Gm-Message-State: AOJu0YzTia7UH3XzDWubADfMiV3i4QiSbs/51FGjSVSalvYwPf77EVkL
	sbsAyERjk03N+tWQwrw0HeB1koF0G2WGV/RdLzsIIJlmTb2e3OPKty7OVfy5P58=
X-Google-Smtp-Source: AGHT+IFn+85uiEkgIEBgCzqCK7wWA6y/WRfGtkj5izqKSQl2/Ukj7jAhgKxd9BH+w+fI77QnRPUmiQ==
X-Received: by 2002:a05:6214:e46:b0:6a1:55de:7a23 with SMTP id 6a1803df08f44-6ab8f328394mr44128656d6.6.1716474728984;
        Thu, 23 May 2024 07:32:08 -0700 (PDT)
Date: Thu, 23 May 2024 16:32:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/8] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
Message-ID: <Zk9TZhe-WSNrnlPD@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <4095f31a88589ced2b620e8ebbb84cdc2fae8914.1715102098.git.alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4095f31a88589ced2b620e8ebbb84cdc2fae8914.1715102098.git.alejandro.vallejo@cloud.com>

On Wed, May 08, 2024 at 01:39:20PM +0100, Alejandro Vallejo wrote:
> This allows the initial x2APIC ID to be sent on the migration stream. The
> hardcoded mapping x2apic_id=2*vcpu_id is maintained for the time being.
> Given the vlapic data is zero-extended on restore, fix up migrations from
> hosts without the field by setting it to the old convention if zero.
> 
> x2APIC IDs are calculated from the CPU policy where the guest topology is
> defined. For the time being, the function simply returns the old
> relationship, but will eventually return results consistent with the
> topology.
> 
> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> ---
> v2:
>   * Removed usage of SET_xAPIC_ID().
>   * Restored previous logic when exposing leaf 0xb, and gate it for HVM only.
>   * Rewrote comment in lapic_load_fixup, including the implicit assumption.
>   * Moved vlapic_cpu_policy_changed() into hvm_cpuid_policy_changed())
>   * const-ified policy in vlapic_cpu_policy_changed()
> ---
>  xen/arch/x86/cpuid.c                   | 15 ++++---------
>  xen/arch/x86/hvm/vlapic.c              | 30 ++++++++++++++++++++++++--
>  xen/arch/x86/include/asm/hvm/hvm.h     |  1 +
>  xen/arch/x86/include/asm/hvm/vlapic.h  |  2 ++
>  xen/include/public/arch-x86/hvm/save.h |  2 ++
>  xen/include/xen/lib/x86/cpu-policy.h   |  9 ++++++++
>  xen/lib/x86/policy.c                   | 11 ++++++++++
>  7 files changed, 57 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> index 7a38e032146a..242c21ec5bb6 100644
> --- a/xen/arch/x86/cpuid.c
> +++ b/xen/arch/x86/cpuid.c
> @@ -139,10 +139,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>          const struct cpu_user_regs *regs;
>  
>      case 0x1:
> -        /* TODO: Rework topology logic. */
>          res->b &= 0x00ffffffu;
>          if ( is_hvm_domain(d) )
> -            res->b |= (v->vcpu_id * 2) << 24;
> +            res->b |= vlapic_x2apic_id(vcpu_vlapic(v)) << 24;
>  
>          /* TODO: Rework vPMU control in terms of toolstack choices. */
>          if ( vpmu_available(v) &&
> @@ -311,19 +310,13 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
>          break;
>  
>      case 0xb:
> -        /*
> -         * In principle, this leaf is Intel-only.  In practice, it is tightly
> -         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
> -         * to guests on AMD hardware as well.
> -         *
> -         * TODO: Rework topology logic.
> -         */
> -        if ( p->basic.x2apic )
> +        /* Don't expose topology information to PV guests */

Not sure whether we want to keep part of the comment about exposing
x2APIC to guests even when x2APIC is not present in the host.  I think
this code has changed and the comment is kind of stale now.

> +        if ( is_hvm_domain(d) && p->basic.x2apic )
>          {
>              *(uint8_t *)&res->c = subleaf;
>  
>              /* Fix the x2APIC identifier. */
> -            res->d = v->vcpu_id * 2;
> +            res->d = vlapic_x2apic_id(vcpu_vlapic(v));
>          }
>          break;
>  
> diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> index 05072a21bf38..61a96474006b 100644
> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -1069,7 +1069,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
>  static void set_x2apic_id(struct vlapic *vlapic)
>  {
>      const struct vcpu *v = vlapic_vcpu(vlapic);
> -    uint32_t apic_id = v->vcpu_id * 2;
> +    uint32_t apic_id = vlapic->hw.x2apic_id;
>      uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
>  
>      /*
> @@ -1083,6 +1083,22 @@ static void set_x2apic_id(struct vlapic *vlapic)
>      vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
>  }
>  
> +void vlapic_cpu_policy_changed(struct vcpu *v)
> +{
> +    struct vlapic *vlapic = vcpu_vlapic(v);
> +    const struct cpu_policy *cp = v->domain->arch.cpu_policy;
> +
> +    /*
> +     * Don't override the initial x2APIC ID if we have migrated it or
> +     * if the domain doesn't have vLAPIC at all.
> +     */
> +    if ( !has_vlapic(v->domain) || vlapic->loaded.hw )
> +        return;
> +
> +    vlapic->hw.x2apic_id = x86_x2apic_id_from_vcpu_id(cp, v->vcpu_id);
> +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));

Nit: in case we decide to start APICs in x2APIC mode, might be good to
take this into account here and use vlapic_x2apic_mode(vlapic) to
select whether SET_xAPIC_ID() needs to be used or not:

    vlapic_set_reg(vlapic, APIC_ID,
        vlapic_x2apic_mode(vlapic) ? vlapic->hw.x2apic_id
	                           : SET_xAPIC_ID(vlapic->hw.x2apic_id));

Or similar.

> +}
> +
>  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
>  {
>      const struct cpu_policy *cp = v->domain->arch.cpu_policy;
> @@ -1449,7 +1465,7 @@ void vlapic_reset(struct vlapic *vlapic)
>      if ( v->vcpu_id == 0 )
>          vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
>  
> -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
>      vlapic_do_init(vlapic);
>  }
>  
> @@ -1514,6 +1530,16 @@ static void lapic_load_fixup(struct vlapic *vlapic)
>      const struct vcpu *v = vlapic_vcpu(vlapic);
>      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
>  
> +    /*
> +     * Loading record without hw.x2apic_id in the save stream, calculate using
> +     * the traditional "vcpu_id * 2" relation. There's an implicit assumption
> +     * that vCPU0 always has x2APIC0, which is true for the old relation, and
> +     * still holds under the new x2APIC generation algorithm. While that case
> +     * goes through the conditional it's benign because it still maps to zero.
> +     */
> +    if ( !vlapic->hw.x2apic_id )
> +        vlapic->hw.x2apic_id = v->vcpu_id * 2;
> +
>      /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
>      if ( !vlapic_x2apic_mode(vlapic) ||
>           (vlapic->loaded.ldr == good_ldr) )
> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> index 0c9e6f15645d..e1f0585d75a9 100644
> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -448,6 +448,7 @@ static inline void hvm_update_guest_efer(struct vcpu *v)
>  static inline void hvm_cpuid_policy_changed(struct vcpu *v)
>  {
>      alternative_vcall(hvm_funcs.cpuid_policy_changed, v);
> +    vlapic_cpu_policy_changed(v);

Note sure whether this call would better be placed in
cpu_policy_updated() inside the is_hvm_vcpu() conditional branch.

hvm_cpuid_policy_changed() &c are just wrappers around the hvm_funcs
hooks, pulling vlapic functions in there is likely to complicate the
header dependencies in the long term.

>  }
>  
>  static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
> diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
> index 88ef94524339..e8d41313abd3 100644
> --- a/xen/arch/x86/include/asm/hvm/vlapic.h
> +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
> @@ -44,6 +44,7 @@
>  #define vlapic_xapic_mode(vlapic)                               \
>      (!vlapic_hw_disabled(vlapic) && \
>       !((vlapic)->hw.apic_base_msr & APIC_BASE_EXTD))
> +#define vlapic_x2apic_id(vlapic) ((vlapic)->hw.x2apic_id)
>  
>  /*
>   * Generic APIC bitmap vector update & search routines.
> @@ -107,6 +108,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack);
>  
>  int  vlapic_init(struct vcpu *v);
>  void vlapic_destroy(struct vcpu *v);
> +void vlapic_cpu_policy_changed(struct vcpu *v);
>  
>  void vlapic_reset(struct vlapic *vlapic);
>  
> diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
> index 7ecacadde165..1c2ec669ffc9 100644
> --- a/xen/include/public/arch-x86/hvm/save.h
> +++ b/xen/include/public/arch-x86/hvm/save.h
> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
>      uint32_t             timer_divisor;
>      uint64_t             tdt_msr;
> +    uint32_t             x2apic_id;
> +    uint32_t             rsvd_zero;

I think Jan requested for this field to be checked to be 0 for
incoming migrations, yet I don't see such check added.

>  };
>  
>  DECLARE_HVM_SAVE_TYPE(LAPIC, 5, struct hvm_hw_lapic);
> diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
> index d5e447e9dc06..392320b9adbe 100644
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -542,6 +542,15 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>                                      const struct cpu_policy *guest,
>                                      struct cpu_policy_errors *err);
>  
> +/**
> + * Calculates the x2APIC ID of a vCPU given a CPU policy
> + *
> + * @param p          CPU policy of the domain.
> + * @param id         vCPU ID of the vCPU.
> + * @returns x2APIC ID of the vCPU.
> + */
> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id);
> +
>  #endif /* !XEN_LIB_X86_POLICIES_H */
>  
>  /*
> diff --git a/xen/lib/x86/policy.c b/xen/lib/x86/policy.c
> index f033d22785be..4cef658feeb8 100644
> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -2,6 +2,17 @@
>  
>  #include <xen/lib/x86/cpu-policy.h>
>  
> +uint32_t x86_x2apic_id_from_vcpu_id(const struct cpu_policy *p, uint32_t id)
> +{
> +    /*
> +     * TODO: Derive x2APIC ID from the topology information inside `p`
> +     *       rather than from vCPU ID. This bodge is a temporary measure
> +     *       until all infra is in place to retrieve or derive the initial
> +     *       x2APIC ID from migrated domains.
> +     */
> +    return vcpu_id * 2;

I don't think this builds?

Note the parameter is plain 'id' not 'vcpu_id'.

Thanks, Roger.

