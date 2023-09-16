Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CD27A2E69
	for <lists+xen-devel@lfdr.de>; Sat, 16 Sep 2023 09:51:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603531.940559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhQ4m-0002SZ-LF; Sat, 16 Sep 2023 07:50:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603531.940559; Sat, 16 Sep 2023 07:50:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhQ4m-0002Pb-IO; Sat, 16 Sep 2023 07:50:48 +0000
Received: by outflank-mailman (input) for mailman id 603531;
 Sat, 16 Sep 2023 07:50:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uw=FA=gmail.com=jinoh.kang.kr@srs-se1.protection.inumbo.net>)
 id 1qhQ4l-0002PV-47
 for xen-devel@lists.xenproject.org; Sat, 16 Sep 2023 07:50:47 +0000
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [2607:f8b0:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be0b07df-5465-11ee-8788-cb3800f73035;
 Sat, 16 Sep 2023 09:50:45 +0200 (CEST)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3a81154c5f5so1771865b6e.1
 for <xen-devel@lists.xenproject.org>; Sat, 16 Sep 2023 00:50:45 -0700 (PDT)
Received: from [10.137.0.57] ([14.33.99.107]) by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056569f7cbd2sm3732786pge.37.2023.09.16.00.50.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 16 Sep 2023 00:50:44 -0700 (PDT)
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
X-Inumbo-ID: be0b07df-5465-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694850644; x=1695455444; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+9HVghx9ih1sHhqli6LaK+YDMl9UC6o0yeyHYFRKJn4=;
        b=depBcUHxgXlhOi/KmmNkSuGZSEsjWCKlk/4VaNlbMa1MHuawzGKRHzbNRUVOe7k9Nk
         9GZFBURQdL65ri17ch8FNAvutyeWXRynJ5BSE5KHoIncE6+lADLNsBDIM3tlWEIIYZTk
         jvmjqsk3zUoXDb/0lDjcM2RDrDD/ALcQQC/xo4B7bWHfUkoty5pmMXnwNJc8lU5RyRys
         SaAMoKPXOMX//+bh+l6zXWyN06UulQLBWdUYZygi5H0IyZxgmfeTSuEX1EDgH4ManQ2b
         oY4qSJ6vGahlbd2YuwT9XDJd+DiSRJbImX2a8DUDSqj1w9UwkVVRpdYhsEXDuVb6Aq7N
         f2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694850644; x=1695455444;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+9HVghx9ih1sHhqli6LaK+YDMl9UC6o0yeyHYFRKJn4=;
        b=lYb02wx2MhA1BXHmi4F7+Oo6fdyhoTnp+99mQDht3LS8A73nr2iNpFQbLCHxaxUoRW
         1oJd0cu3S7jNgXwCSs94XFFEUPUXNBVEz+hd53h7gg/KhAWV8p3J4OMH7Qb4wJpIRGdS
         CSbm5VUqYXoOrwaEXcVc5dxocwG675CkqfpB9cybhgZat9ANRVKSiSkbtTRb8/RaaXgC
         w2GFlgnv7ZYEV/XCkr/M6loIaagDW6W9kQpgxCOxC3+6gAUUP5w/JYj2Ld1WKHVcB2Lj
         QoNAyVdo+EB8b3hl7KlrCtsqdEc78VNLcsOtn+dvJ34xetgXz7tOsQIS8llkBYH9PkJW
         D7FA==
X-Gm-Message-State: AOJu0YwMTliU1xLdwgAcYcmABCU3nSxSbGFFcPHDLPtl6MnobQlraY98
	qgdc8CPri5r23gKnwZv5GeU=
X-Google-Smtp-Source: AGHT+IE1UGOCVG4WAxdVRLHa2rTvAC9Wx0ucPP6e57fIixwLOx/bAnVffeT1e/497mCPTIOxXJrwQQ==
X-Received: by 2002:a05:6808:2806:b0:3a9:9f9d:90ed with SMTP id et6-20020a056808280600b003a99f9d90edmr3891841oib.23.1694850644563;
        Sat, 16 Sep 2023 00:50:44 -0700 (PDT)
Message-ID: <0aee121e-a2ac-1c6c-be33-59d842419708@gmail.com>
Date: Sat, 16 Sep 2023 16:50:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230915203628.837732-1-andrew.cooper3@citrix.com>
 <20230915203628.837732-8-andrew.cooper3@citrix.com>
From: Jinoh Kang <jinoh.kang.kr@gmail.com>
Subject: Re: [PATCH 7/7] x86/pv: Rewrite %dr6 handling
In-Reply-To: <20230915203628.837732-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 9/16/23 05:36, Andrew Cooper wrote:
> All #DB exceptions result in an update of %dr6, but this isn't handled
> properly by Xen for any guest type.
> 
> Remove all ad-hoc dr6 handling, leaving it to pv_inject_event() in most cases
> and using the new x86_merge_dr6() helper.
> 
> In do_debug(), swap the dr6 to pending_dbg in order to operate entirely with
> positive polarity.  Among other things, this helps spot RTM/BLD in the
> diagnostic message.
> 
> Drop the unconditional v->arch.dr6 adjustment.  pv_inject_event() performs the
> adjustment in the common case, but retain the prior behaviour if a debugger is
> attached.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Jinoh Kang <jinoh.kang.kr@gmail.com>
> 
> v2:
>  * Split pieces out into an earlier patch.
>  * Extend do_debug() to use pending_dbg entirely, rather than have the same
>    variable used with different polarity at different times.
> ---
>  xen/arch/x86/pv/emul-priv-op.c  |  5 +----
>  xen/arch/x86/pv/emulate.c       |  9 +++++++--
>  xen/arch/x86/pv/ro-page-fault.c |  4 ++--
>  xen/arch/x86/pv/traps.c         | 17 +++++++++++++----
>  xen/arch/x86/traps.c            | 23 +++++++++++------------
>  5 files changed, 34 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> index 2f73ed0682e1..fe2011f28e34 100644
> --- a/xen/arch/x86/pv/emul-priv-op.c
> +++ b/xen/arch/x86/pv/emul-priv-op.c
> @@ -1364,10 +1364,7 @@ int pv_emulate_privileged_op(struct cpu_user_regs *regs)
>          ASSERT(!curr->arch.pv.trap_bounce.flags);
>  
>          if ( ctxt.ctxt.retire.pending_dbg )
> -        {
> -            curr->arch.dr6 |= ctxt.ctxt.retire.pending_dbg | DR_STATUS_RESERVED_ONE;
> -            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
> -        }
> +            pv_inject_DB(ctxt.ctxt.retire.pending_dbg);
>  
>          /* fall through */
>      case X86EMUL_RETRY:
> diff --git a/xen/arch/x86/pv/emulate.c b/xen/arch/x86/pv/emulate.c
> index e7a1c0a2cc4f..29425a0a00ec 100644
> --- a/xen/arch/x86/pv/emulate.c
> +++ b/xen/arch/x86/pv/emulate.c
> @@ -71,10 +71,15 @@ void pv_emul_instruction_done(struct cpu_user_regs *regs, unsigned long rip)
>  {
>      regs->rip = rip;
>      regs->eflags &= ~X86_EFLAGS_RF;
> +
>      if ( regs->eflags & X86_EFLAGS_TF )
>      {
> -        current->arch.dr6 |= DR_STEP | DR_STATUS_RESERVED_ONE;
> -        pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
> +        /*
> +         * TODO, this should generally use TF from the start of the
> +         * instruction.  It's only a latent bug for now, as this path isn't
> +         * used for any instruction which modifies eflags.
> +         */
> +        pv_inject_DB(X86_DR6_BS);
>      }
>  }
>  
> diff --git a/xen/arch/x86/pv/ro-page-fault.c b/xen/arch/x86/pv/ro-page-fault.c
> index cad28ef928ad..f6bb33556e72 100644
> --- a/xen/arch/x86/pv/ro-page-fault.c
> +++ b/xen/arch/x86/pv/ro-page-fault.c
> @@ -389,8 +389,8 @@ int pv_ro_page_fault(unsigned long addr, struct cpu_user_regs *regs)
>  
>          /* Fallthrough */
>      case X86EMUL_OKAY:
> -        if ( ctxt.retire.singlestep )
> -            pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
> +        if ( ctxt.retire.pending_dbg )
> +            pv_inject_DB(ctxt.retire.pending_dbg);
>  
>          /* Fallthrough */
>      case X86EMUL_RETRY:
> diff --git a/xen/arch/x86/pv/traps.c b/xen/arch/x86/pv/traps.c
> index 74f333da7e1c..553b04bca956 100644
> --- a/xen/arch/x86/pv/traps.c
> +++ b/xen/arch/x86/pv/traps.c
> @@ -13,6 +13,7 @@
>  #include <xen/softirq.h>
>  
>  #include <asm/pv/trace.h>
> +#include <asm/debugreg.h>
>  #include <asm/shared.h>
>  #include <asm/traps.h>
>  #include <irq_vectors.h>
> @@ -50,9 +51,9 @@ void pv_inject_event(const struct x86_event *event)
>      tb->cs    = ti->cs;
>      tb->eip   = ti->address;
>  
> -    if ( event->type == X86_EVENTTYPE_HW_EXCEPTION &&
> -         vector == X86_EXC_PF )
> +    switch ( vector | -(event->type == X86_EVENTTYPE_SW_INTERRUPT) )
>      {
> +    case X86_EXC_PF:
>          curr->arch.pv.ctrlreg[2] = event->cr2;
>          arch_set_cr2(curr, event->cr2);
>  
> @@ -62,9 +63,17 @@ void pv_inject_event(const struct x86_event *event)
>              error_code |= PFEC_user_mode;
>  
>          trace_pv_page_fault(event->cr2, error_code);
> -    }
> -    else
> +        break;
> +
> +    case X86_EXC_DB:
> +        curr->arch.dr6 = x86_merge_dr6(curr->domain->arch.cpu_policy,
> +                                       curr->arch.dr6, event->pending_dbg);
> +        /* Fallthrough */
> +
> +    default:
>          trace_pv_trap(vector, regs->rip, use_error_code, error_code);
> +        break;
> +    }
>  
>      if ( use_error_code )
>      {
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index dead728ce329..447edc827b3a 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1887,11 +1887,11 @@ void do_device_not_available(struct cpu_user_regs *regs)
>  /* SAF-1-safe */
>  void do_debug(struct cpu_user_regs *regs)
>  {
> -    unsigned long dr6;
> +    unsigned long pending_dbg;
>      struct vcpu *v = current;
>  
> -    /* Stash dr6 as early as possible. */
> -    dr6 = read_debugreg(6);
> +    /* Stash dr6 as early as possible, operating with positive polarity. */
> +    pending_dbg = read_debugreg(6) ^ X86_DR6_DEFAULT;

We don't reset DR6 after reading it, and there is no guarantee that the PV guest
will reset it either, so it doesn't match PENDING_DBG exactly IIRC.

On the other hand, nothing will probably care about its double-accumulating
quirk except perhaps monitor users.

Do we want to document that, shadow DR6 for PV (which seems a little overkill
if we don't trap DR6 access from PV already), or just live with that?

>  
>      /*
>       * At the time of writing (March 2018), on the subject of %dr6:
> @@ -1963,13 +1963,13 @@ void do_debug(struct cpu_user_regs *regs)
>           * If however we do, safety measures need to be enacted.  Use a big
>           * hammer and clear all debug settings.
>           */
> -        if ( dr6 & (DR_TRAP3 | DR_TRAP2 | DR_TRAP1 | DR_TRAP0) )
> +        if ( pending_dbg & X86_DR6_BP_MASK )
>          {
>              unsigned int bp, dr7 = read_debugreg(7);
>  
>              for ( bp = 0; bp < 4; ++bp )
>              {
> -                if ( (dr6 & (1u << bp)) && /* Breakpoint triggered? */
> +                if ( (pending_dbg & (1u << bp)) && /* Breakpoint triggered? */
>                       (dr7 & (3u << (bp * DR_ENABLE_SIZE))) && /* Enabled? */
>                       ((dr7 & (3u << ((bp * DR_CONTROL_SIZE) + /* Insn? */
>                                       DR_CONTROL_SHIFT))) == DR_RW_EXECUTE) )
> @@ -1990,24 +1990,23 @@ void do_debug(struct cpu_user_regs *regs)
>           * so ensure the message is ratelimited.
>           */
>          gprintk(XENLOG_WARNING,
> -                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, dr6 %lx\n",
> +                "Hit #DB in Xen context: %04x:%p [%ps], stk %04x:%p, pending_dbg %lx\n",
>                  regs->cs, _p(regs->rip), _p(regs->rip),
> -                regs->ss, _p(regs->rsp), dr6);
> +                regs->ss, _p(regs->rsp), pending_dbg);
>  
>          return;
>      }
>  
> -    /* Save debug status register where guest OS can peek at it */
> -    v->arch.dr6 |= (dr6 & ~X86_DR6_DEFAULT);
> -    v->arch.dr6 &= (dr6 | ~X86_DR6_DEFAULT);
> -
>      if ( guest_kernel_mode(v, regs) && v->domain->debugger_attached )
>      {
> +        /* Save debug status register where gdbsx can peek at it */
> +        v->arch.dr6 = x86_merge_dr6(v->domain->arch.cpu_policy,
> +                                    v->arch.dr6, pending_dbg);
>          domain_pause_for_debugger();
>          return;
>      }
>  
> -    pv_inject_hw_exception(X86_EXC_DB, X86_EVENT_NO_EC);
> +    pv_inject_DB(pending_dbg);
>  }
>  
>  /* SAF-1-safe */

-- 
Sincerely,
Jinoh Kang


