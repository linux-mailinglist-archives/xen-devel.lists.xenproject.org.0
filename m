Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A9C8CE4C3
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 13:15:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729406.1134590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAStS-0002uW-4D; Fri, 24 May 2024 11:15:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729406.1134590; Fri, 24 May 2024 11:15:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAStS-0002rS-1Y; Fri, 24 May 2024 11:15:26 +0000
Received: by outflank-mailman (input) for mailman id 729406;
 Fri, 24 May 2024 11:15:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LySr=M3=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sAStQ-0002rJ-Bi
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 11:15:24 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9e550e1-19be-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 13:15:23 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4202ca70270so36382055e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 04:15:23 -0700 (PDT)
Received: from localhost ([213.195.114.223]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4210897c66esm17816325e9.26.2024.05.24.04.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 May 2024 04:15:22 -0700 (PDT)
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
X-Inumbo-ID: e9e550e1-19be-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1716549323; x=1717154123; darn=lists.xenproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yt0ufe3+7IhTAuIyCHiiU+nbTX+TPtsjdalzDA21Zmw=;
        b=puhLmWxt7lsaFd98Knt5vTczwRjw1R6wH518L8ssBR9B7dBhysZFRQQ/ltiiQVNwJZ
         otjvxPi8Vp7DDOWivujQcIu2liy7yvTZb34fILwmEC9N5Y+oTNIo9qbX6zSYR2zHV/hV
         02KwvREXd6NRf80jfU44AXSjcr3YWU6EjMOEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716549323; x=1717154123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yt0ufe3+7IhTAuIyCHiiU+nbTX+TPtsjdalzDA21Zmw=;
        b=XwFiC2O9ndsFC9J3f1bBDYkl8YFLJLElB2jXV6PEE+CDkTHD6Y6VFCotM9UimJL+93
         Fxq8ZYMB6Pa5fTCz/q/9k/qWWa3VxsOpwfHLYDNIFYr2ah17EHJf+xkCDnvcuLAQhIlX
         Jyn/bcDQQmjNkTwhMNv26JtCf5u0qMWMHGclIUyPIHq12rTzfEEoAxydnK5Z9NGSeGyQ
         MoHuEIa9UKmLO1kHx8tdI1945ULA4u1Zsy1rlXQGuMInxioqoSrb6CqJHuJcXCv8iQhV
         rXfauC6JAS1oTV1oIP3bdC4AgH7w/ETluEGXUqydMJp7WJQGwVvF8s1KHCQHGeOqvi4P
         LkMw==
X-Gm-Message-State: AOJu0Yx2Scey38l9NwYnIphiTbf4+ahoehfMf7594pVCUPIDKDnCDuqe
	HAY5/xOHcQECW/fy1xYyvphqKpxyhpbZZF4D4owy4t83X4Qemj3jtLcouXoTuVM=
X-Google-Smtp-Source: AGHT+IGzBm2+zUjErnX1Wm++atYMIRi6N1NeXAdIXKNmYaztjiAvuQLNEYbrl0qpRiHv9WrAuf/RWw==
X-Received: by 2002:a05:600c:3509:b0:41f:e7e6:7f27 with SMTP id 5b1f17b1804b1-42108a99f23mr18518045e9.26.1716549322693;
        Fri, 24 May 2024 04:15:22 -0700 (PDT)
Date: Fri, 24 May 2024 13:15:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 1/8] xen/x86: Add initial x2APIC ID to the per-vLAPIC
 save area
Message-ID: <ZlB2yZNkZ07_wVAC@macbook>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <4095f31a88589ced2b620e8ebbb84cdc2fae8914.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9TZhe-WSNrnlPD@macbook>
 <dbd87d6b-c19a-48cc-8838-32b958da980d@cloud.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dbd87d6b-c19a-48cc-8838-32b958da980d@cloud.com>

On Fri, May 24, 2024 at 11:58:44AM +0100, Alejandro Vallejo wrote:
> On 23/05/2024 15:32, Roger Pau Monné wrote:
> >>      case 0xb:
> >> -        /*
> >> -         * In principle, this leaf is Intel-only.  In practice, it is tightly
> >> -         * coupled with x2apic, and we offer an x2apic-capable APIC emulation
> >> -         * to guests on AMD hardware as well.
> >> -         *
> >> -         * TODO: Rework topology logic.
> >> -         */
> >> -        if ( p->basic.x2apic )
> >> +        /* Don't expose topology information to PV guests */
> > 
> > Not sure whether we want to keep part of the comment about exposing
> > x2APIC to guests even when x2APIC is not present in the host.  I think
> > this code has changed and the comment is kind of stale now.
> 
> The comment is definitely stale. Nowadays x2APIC is fully supported by
> AMD, as is leaf 0xb. The fact we emulate the x2APIC seems hardly
> relevant in a CPUID leaf about topology. I could keep a note showing...
> 
>     /* Exposed alongside x2apic, as it's tightly coupled with it */
> 
> ... although that's directly implied by the conditional.

Yeah, I haven't gone through the history of this file, but I bet at
some point before the introduction of CPUID policies we leaked (part
of) the host CPUID contents in here.

It's also no longer true that the leaf is Intel only.

I fine either adding your newly proposed comment, or leaving it as-is.

> >> +}
> >> +
> >>  int guest_wrmsr_apic_base(struct vcpu *v, uint64_t val)
> >>  {
> >>      const struct cpu_policy *cp = v->domain->arch.cpu_policy;
Le> >> @@ -1449,7 +1465,7 @@ void vlapic_reset(struct vlapic *vlapic)
> >>      if ( v->vcpu_id == 0 )
> >>          vlapic->hw.apic_base_msr |= APIC_BASE_BSP;
> >>  
> >> -    vlapic_set_reg(vlapic, APIC_ID, (v->vcpu_id * 2) << 24);
> >> +    vlapic_set_reg(vlapic, APIC_ID, SET_xAPIC_ID(vlapic->hw.x2apic_id));
> >>      vlapic_do_init(vlapic);
> >>  }
> >>  
> >> @@ -1514,6 +1530,16 @@ static void lapic_load_fixup(struct vlapic *vlapic)
> >>      const struct vcpu *v = vlapic_vcpu(vlapic);
> >>      uint32_t good_ldr = x2apic_ldr_from_id(vlapic->loaded.id);
> >>  
> >> +    /*
> >> +     * Loading record without hw.x2apic_id in the save stream, calculate using
> >> +     * the traditional "vcpu_id * 2" relation. There's an implicit assumption
> >> +     * that vCPU0 always has x2APIC0, which is true for the old relation, and
> >> +     * still holds under the new x2APIC generation algorithm. While that case
> >> +     * goes through the conditional it's benign because it still maps to zero.
> >> +     */
> >> +    if ( !vlapic->hw.x2apic_id )
> >> +        vlapic->hw.x2apic_id = v->vcpu_id * 2;
> >> +
> >>      /* Skip fixups on xAPIC mode, or if the x2APIC LDR is already correct */
> >>      if ( !vlapic_x2apic_mode(vlapic) ||
> >>           (vlapic->loaded.ldr == good_ldr) )
> >> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
> >> index 0c9e6f15645d..e1f0585d75a9 100644
> >> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> >> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> >> @@ -448,6 +448,7 @@ static inline void hvm_update_guest_efer(struct vcpu *v)
> >>  static inline void hvm_cpuid_policy_changed(struct vcpu *v)
> >>  {
> >>      alternative_vcall(hvm_funcs.cpuid_policy_changed, v);
> >> +    vlapic_cpu_policy_changed(v);
> > 
> > Note sure whether this call would better be placed in
> > cpu_policy_updated() inside the is_hvm_vcpu() conditional branch.
> > 
> > hvm_cpuid_policy_changed() &c are just wrappers around the hvm_funcs
> > hooks, pulling vlapic functions in there is likely to complicate the
> > header dependencies in the long term.
> > 
> 
> That's how it was in v1 and I moved it in v2 answering one of Jan's
> feedback points.
> 
> I don't mind either way.

Oh (goes and reads Jan's reply to v1) I see.  Let's leave it as-is
then.

> 
> >>  }
> >>  
> >>  static inline void hvm_set_tsc_offset(struct vcpu *v, uint64_t offset,
> >> diff --git a/xen/arch/x86/include/asm/hvm/vlapic.h b/xen/arch/x86/include/asm/hvm/vlapic.h
> >> index 88ef94524339..e8d41313abd3 100644
> >> --- a/xen/arch/x86/include/asm/hvm/vlapic.h
> >> +++ b/xen/arch/x86/include/asm/hvm/vlapic.h
> >> @@ -44,6 +44,7 @@
> >>  #define vlapic_xapic_mode(vlapic)                               \
> >>      (!vlapic_hw_disabled(vlapic) && \
> >>       !((vlapic)->hw.apic_base_msr & APIC_BASE_EXTD))
> >> +#define vlapic_x2apic_id(vlapic) ((vlapic)->hw.x2apic_id)
> >>  
> >>  /*
> >>   * Generic APIC bitmap vector update & search routines.
> >> @@ -107,6 +108,7 @@ int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool force_ack);
> >>  
> >>  int  vlapic_init(struct vcpu *v);
> >>  void vlapic_destroy(struct vcpu *v);
> >> +void vlapic_cpu_policy_changed(struct vcpu *v);
> >>  
> >>  void vlapic_reset(struct vlapic *vlapic);
> >>  
> >> diff --git a/xen/include/public/arch-x86/hvm/save.h b/xen/include/public/arch-x86/hvm/save.h
> >> index 7ecacadde165..1c2ec669ffc9 100644
> >> --- a/xen/include/public/arch-x86/hvm/save.h
> >> +++ b/xen/include/public/arch-x86/hvm/save.h
> >> @@ -394,6 +394,8 @@ struct hvm_hw_lapic {
> >>      uint32_t             disabled; /* VLAPIC_xx_DISABLED */
> >>      uint32_t             timer_divisor;
> >>      uint64_t             tdt_msr;
> >> +    uint32_t             x2apic_id;
> >> +    uint32_t             rsvd_zero;
> > 
> > I think Jan requested for this field to be checked to be 0 for
> > incoming migrations, yet I don't see such check added.
> > 
> 
> It's on the next patch, when the checks are moved into the check hook.
> Doing it all as part of the same patch seemed dirty. I guess I can
> invert them.

Yeah, sorry, realized later.  I think the introduction of the lapic
record checking wants to be the first patch in the series, so that
when you introduce the field here you can check it's zero.

Thanks, Roger.

