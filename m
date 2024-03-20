Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF4F880EAB
	for <lists+xen-devel@lfdr.de>; Wed, 20 Mar 2024 10:34:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695834.1086012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmsKS-0007JO-GS; Wed, 20 Mar 2024 09:33:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695834.1086012; Wed, 20 Mar 2024 09:33:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmsKS-0007Hd-CI; Wed, 20 Mar 2024 09:33:48 +0000
Received: by outflank-mailman (input) for mailman id 695834;
 Wed, 20 Mar 2024 09:33:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x+RR=K2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rmsKR-0007F4-2C
 for xen-devel@lists.xenproject.org; Wed, 20 Mar 2024 09:33:47 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f29a2a36-e69c-11ee-afdd-a90da7624cb6;
 Wed, 20 Mar 2024 10:33:45 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4146a1b6faaso6670155e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 20 Mar 2024 02:33:45 -0700 (PDT)
Received: from localhost ([85.31.135.62]) by smtp.gmail.com with ESMTPSA id
 r6-20020a05600c458600b00414108a1c55sm1633524wmo.16.2024.03.20.02.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Mar 2024 02:33:44 -0700 (PDT)
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
X-Inumbo-ID: f29a2a36-e69c-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1710927225; x=1711532025; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wov1slZmbAp2f5O4vnIaKKCu7WrBwjq873GuLyRqoUE=;
        b=M2Fls556LqEh/KZrvlmVKQToe/4m8vuM8g47jJXp+krieaD6oYKmecppSs3nIxduJZ
         /w7q+OGoDPw4SF5jL8hMwbfTjzX9osL+eCq0OBeBvOvotbxRWA0B3LFj6XEaUMxDwvvY
         tVVh6pQvF5aGLuC2p24W59bC1zWkhOMuVglmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710927225; x=1711532025;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wov1slZmbAp2f5O4vnIaKKCu7WrBwjq873GuLyRqoUE=;
        b=Zp7H9WD40Y7xH/XFTsiU/eMq781bR5yiYjmsJDLQFSydhKMAu08GiP7rKfXt3p+VjC
         qLoNEuF6z161ha4BgjRZE8MLqRoggWFcHnSjVD6Jowb0kgm4V8MG+GeE2nesQ1S07plq
         3jKq/i5P8U+t2+1+faGpA7MdVRtpTIL0ai8DPsW/FlHN3pU5NwK9G35BfJVGC6jpFdhg
         npWff1p83qdxxHNbr9acpyNaj0Y7detAEzvZ0lP0WgB4PKfr7wDgfr2xfSUCOWX1Yla0
         45RszyMXmxH8HWQECF8KMrnC4Va+RwU1yJr9H0OwGub9alWNs3s9XIucxu/lcpMT9U7k
         4UgA==
X-Gm-Message-State: AOJu0YzQ1tXTvQkWfCf+lNqJgC6PK8TsdS0WcBMCzTl6mSh0MEpsyS21
	/3lJ/jyQAtd1ANXmVSqk+7ObindnXKO9GiAkBgzUgiPW3PA7xHbkuw1pOR6Rm6PB9ByrFIPbMbW
	H
X-Google-Smtp-Source: AGHT+IHmeLMTZJTuYf9kzj3bgxYVhI7NxlzoTIh7tpNJDxxjLgypfIG+JmENcZu22KjN7cm3QrAuIg==
X-Received: by 2002:a05:600c:314b:b0:413:7f3:8d5 with SMTP id h11-20020a05600c314b00b0041307f308d5mr11538791wmo.0.1710927224911;
        Wed, 20 Mar 2024 02:33:44 -0700 (PDT)
Date: Wed, 20 Mar 2024 10:33:43 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/6] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
Message-ID: <Zfqtd96XoXXDkXdW@macbook>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-2-alejandro.vallejo@cloud.com>
 <Zfm7U7XMzbR6D1qN@macbook>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zfm7U7XMzbR6D1qN@macbook>

On Tue, Mar 19, 2024 at 05:20:35PM +0100, Roger Pau Monné wrote:
> On Tue, Jan 09, 2024 at 03:38:29PM +0000, Alejandro Vallejo wrote:
> > This allows the initial x2APIC ID to be sent on the migration stream. The
> > hardcoded mapping x2apic_id=2*vcpu_id is maintained for the time being.
> > Given the vlapic data is zero-extended on restore, fix up migrations from
> > hosts without the field by setting it to the old convention if zero.
> > 
> > x2APIC IDs are calculated from the CPU policy where the guest topology is
> > defined. For the time being, the function simply returns the old
> > relationship, but will eventually return results consistent with the
> > topology.
> > 
> > Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> > ---
> >  xen/arch/x86/cpuid.c                   | 20 ++++---------------
> >  xen/arch/x86/domain.c                  |  3 +++
> >  xen/arch/x86/hvm/vlapic.c              | 27 ++++++++++++++++++++++++--
> >  xen/arch/x86/include/asm/hvm/vlapic.h  |  2 ++
> >  xen/include/public/arch-x86/hvm/save.h |  2 ++
> >  xen/include/xen/lib/x86/cpu-policy.h   |  9 +++++++++
> >  xen/lib/x86/policy.c                   | 11 +++++++++++
> >  7 files changed, 56 insertions(+), 18 deletions(-)
> > 
> > diff --git a/xen/arch/x86/cpuid.c b/xen/arch/x86/cpuid.c
> > index 7290a979c6..6e259785d0 100644
> > --- a/xen/arch/x86/cpuid.c
> > +++ b/xen/arch/x86/cpuid.c
> > @@ -139,10 +139,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
> >          const struct cpu_user_regs *regs;
> >  
> >      case 0x1:
> > -        /* TODO: Rework topology logic. */
> >          res->b &= 0x00ffffffu;
> >          if ( is_hvm_domain(d) )
> > -            res->b |= (v->vcpu_id * 2) << 24;
> > +            res->b |= SET_xAPIC_ID(vlapic_x2apic_id(vcpu_vlapic(v)));
> 
> SET_xAPIC_ID() was intended to be used with the APIC_ID register,
> which also shifts the ID.  Not sure it's logically correct to use
> here, even if functionally equivalent (as is shifts left by 24).
> 
> >  
> >          /* TODO: Rework vPMU control in terms of toolstack choices. */
> >          if ( vpmu_available(v) &&
> > @@ -311,20 +310,9 @@ void guest_cpuid(const struct vcpu *v, uint32_t leaf,
> >          break;
> >  
> >      case 0xb:
> > -        /*
> > -         * In principle, this leaf is Intel-only.  In practice, it is tightly
> > -         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
> > -         * to guests on AMD hardware as well.
> > -         *
> > -         * TODO: Rework topology logic.
> > -         */
> > -        if ( p->basic.x2apic )
> > -        {
> > -            *(uint8_t *)&res->c = subleaf;
> > -
> > -            /* Fix the x2APIC identifier. */
> > -            res->d = v->vcpu_id * 2;
> > -        }
> > +        /* ecx != 0 if the subleaf is implemented */
> > +        if ( res->c && p->basic.x2apic )
> > +            res->d = vlapic_x2apic_id(vcpu_vlapic(v));
> 
> This needs to be protected so it's reachable by HVM guests only,
> otherwise you will dereference v->arch.hvm.vlapic on a PV vCPU if it
> happens to have p->basic.x2apic set.
> 
> Why not just return the x2apic_id field from the cpu_policy object?
> (topo.subleaf[X].x2apic_id)

Scratch that, the cpu policy is per-domain, not per-vcpu, and hence
cannot hold the x{,2}apic IDs.

> Also, I'm not sure I get why the setting of res->d is gated on res->c
> != 0, won't res->c be 0 when the guest %ecx is 0, yet %edx must be
> valid for all %ecx inputs, the SDM states:
> 
> "The EDX output of leaf 0BH is always valid and does not vary with
> input value in ECX."
> 
> I think you need to keep the previous logic that doesn't gate setting
> ->d on anything other than p->basic.x2apic.
> 
> >          break;
> >  
> >      case XSTATE_CPUID:
> > diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> > index 8a31d18f69..e0c7ed8d5d 100644
> > --- a/xen/arch/x86/domain.c
> > +++ b/xen/arch/x86/domain.c
> > @@ -288,7 +288,10 @@ void update_guest_memory_policy(struct vcpu *v,
> >  static void cpu_policy_updated(struct vcpu *v)
> >  {
> >      if ( is_hvm_vcpu(v) )
> > +    {
> >          hvm_cpuid_policy_changed(v);
> > +        vlapic_cpu_policy_changed(v);
> > +    }
> >  }
> >  
> >  void domain_cpu_policy_changed(struct domain *d)
> > diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
> > index cdb69d9742..f500d66543 100644
> > --- a/xen/arch/x86/hvm/vlapic.c
> > +++ b/xen/arch/x86/hvm/vlapic.c
> > @@ -1069,7 +1069,7 @@ static uint32_t x2apic_ldr_from_id(uint32_t id)
> >  static void set_x2apic_id(struct vlapic *vlapic)
> >  {
> >      const struct vcpu *v = vlapic_vcpu(vlapic);
> > -    uint32_t apic_id = v->vcpu_id * 2;
> > +    uint32_t apic_id = vlapic->hw.x2apic_id;
> >      uint32_t apic_ldr = x2apic_ldr_from_id(apic_id);
> >  
> >      /*
> > @@ -1083,6 +1083,22 @@ static void set_x2apic_id(struct vlapic *vlapic)
> >      vlapic_set_reg(vlapic, APIC_LDR, apic_ldr);
> >  }
> >  
> > +void vlapic_cpu_policy_changed(struct vcpu *v)
> > +{
> > +    struct vlapic *vlapic = vcpu_vlapic(v);
> > +    struct cpu_policy *cp = v->domain->arch.cpu_policy;
> > +
> > +    /*
> > +     * Don't override the initial x2APIC ID if we have migrated it or
> > +     * if the domain doesn't have vLAPIC at all.
> > +     */
> > +    if ( !has_vlapic(v->domain) || vlapic->loaded.hw )
> > +        return;
> > +
> > +    vlapic->hw.x2apic_id = x86_x2apic_id_from_vcpu_id(cp, v->vcpu_id);
> > +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
> > +}
> > +
> >  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> >  {
> >      const struct cpu_policy *cp = v->domain->arch.cpu_policy;
> > @@ -1449,7 +1465,7 @@ void vlapic_reset(struct vlapic *vlapic)
> >      if ( v->vcpu_id == 0 )
> >          vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
> >  
> > -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> > +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
> >      vlapic_do_init(vlapic);
> >  }
> >  
> > @@ -1514,6 +1530,13 @@ static void lapic_load_fixup(struct vlapic *vlapic)
> >      const struct vcpu *v = vlapic_vcpu(vlapic);
> >      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
> >  
> > +    /*
> > +     * Guest with hardcoded assumptions about x2apic_id <-> vcpu_id
> > +     * mappings. Recreate the mapping it used to have in old host.
> 
> Wouldn't it be more appropriate to state "Loading record without
> hw.x2apic_id in the save stream, calculate using the vcpu_id * 2
> relation" or some such.
> 
> Current comment makes it looks like the guest has some kind of
> restriction with this relation, but that's just an internal Xen
> limitation.
> 
> > +     */
> > +    if ( !vlapic->hw.x2apic_id )
> > +        vlapic->hw.x2apic_id = v->vcpu_id * 2;
> > +
> >      /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
> >      if ( !vlapic_x2apic_mode(vlapic) ||
> >           (vlapic->loaded.ldr == good_ldr) )
> > diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
> > index 88ef945243..e8d41313ab 100644
> > --- a/xen/arch/x86/include/asm/hvm/vlapic.h
> > +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
> > @@ -44,6 +44,7 @@
> >  #define vlapic_xapic_mode(vlapic)                               \
> >      (!vlapic_hw_disabled(vlapic) && \
> >       !((vlapic)->hw.apic_base_msr & APIC_BASE_EXTD))
> > +#define vlapic_x2apic_id(vlapic) ((vlapic)->hw.x2apic_id)
> >  
> >  /*
> >   * Generic APIC bitmap vector update & search routines.
> > @@ -107,6 +108,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack);
> >  
> >  int  vlapic_init(struct vcpu *v);
> >  void vlapic_destroy(struct vcpu *v);
> > +void vlapic_cpu_policy_changed(struct vcpu *v);
> >  
> >  void vlapic_reset(struct vlapic *vlapic);
> >  
> > diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
> > index 7ecacadde1..1c2ec669ff 100644
> > --- a/xen/include/public/arch-x86/hvm/save.h
> > +++ b/xen/include/public/arch-x86/hvm/save.h
> > @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
> >      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
> >      uint32_t             timer_divisor;
> >      uint64_t             tdt_msr;
> > +    uint32_t             x2apic_id;
> > +    uint32_t             rsvd_zero;
> 
> Do we really to add a new field, couldn't we get the lapic IDs from
> the cpu_policy?

Since getting from the cpu_policy is not possible, what about getting
it from the registers itself?  It's already present in hvm_hw_lapic_regs.

Regards, Roger.

