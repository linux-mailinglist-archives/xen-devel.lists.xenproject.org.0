Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F01A35DC4
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 13:39:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888770.1298069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiuxu-00084U-Fx; Fri, 14 Feb 2025 12:38:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888770.1298069; Fri, 14 Feb 2025 12:38:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiuxu-00081O-D2; Fri, 14 Feb 2025 12:38:42 +0000
Received: by outflank-mailman (input) for mailman id 888770;
 Fri, 14 Feb 2025 12:38:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zro/=VF=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tiuxs-00081I-3n
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 12:38:40 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c47a724-ead0-11ef-9896-31a8f345e629;
 Fri, 14 Feb 2025 13:38:36 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5de56ff9851so3599149a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 14 Feb 2025 04:38:36 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba533bf360sm335970166b.174.2025.02.14.04.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2025 04:38:35 -0800 (PST)
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
X-Inumbo-ID: 9c47a724-ead0-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739536716; x=1740141516; darn=lists.xenproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F5Akx1+bG4cnZCHP0De2YnEN6YxNY8oe6BB7TQyplWU=;
        b=DdA0SbSu5vCJcRSyHWDzbAh4ASMbvONF3Zf7jBqg0TqJSJ7Y2K4GvsHEVWJr2Itjj/
         MQvzzwJyz9hAvdnQ/uUBX9IclaL18IYl+GtXFlapgOh3ylqoFwHSzLvbPjQRdP05WgMI
         tKfOlm9KlF69UXizpXujSmAu6o6Rw4tVnIWIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739536716; x=1740141516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5Akx1+bG4cnZCHP0De2YnEN6YxNY8oe6BB7TQyplWU=;
        b=Cu6hXZG6GdxFdaWlZjeKcaB1Xg3IacZVlfUf22Yk45VRBGJwIaJ7asy0a34AvgWS77
         QNQ8eNxstmto23JVDq3GF4+OhkM+pLaL9cgWPIa5A83hHi9aCeN8C4Jrn4YderpZVnXT
         NN1PeNfudm9rTmZ68zCQoCjQn5aD8iOyZzo29X/QOCM2QTkaVjHxMj4qSFm3iQYYBHqS
         jWvVtX48lQLuFck2ocVdsvIX8k219kaKwCmw6/2iGgNZDNzYA9uSvoRxIZH4r48xFpSX
         RcsqO6DHYk97NnF25IydxabyxbI6gSi0XPypkhfAsTTgN45XE56xQjSt5+3mkgc3HJXz
         t6Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW4WdH6UFQ9mFSqo0sLlgjxqEHXPmcWxKikYD0NfqQsm5uydz3++ph1UKtmzVkzZ/DSigOG4nvA7tM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy1Nd2tN513l5j9Ku4xErHYU+46OTp6bBdrlQXBdtL7PB/9ATBc
	V9kd+T5Bm0iVf42S4IqCvzFBB4J+YlDy/kK04S4nLB8bFCeL+twZ4OP8j/5pyEY=
X-Gm-Gg: ASbGnctHlSnjkg5qqqgD0tlTNPKEhXHVjcfMZ66uuHDr9VRL7FfXK6fHU/cNw17cnKz
	1t5IMfslsNOz2phP5fZyVWqE7byABLSHAs2wR/kZDvFHW/yxygMMxftMbERPUaL1s8pCniEubhW
	nEsP9CGd4Z2V2kOpTNGYJDL+yWv69BT6JfZcEjXn+8cUUQBFT+8h4f1x3TwWopZDCD1Uh6YVhEr
	px2NZIwDdz8gQFLRkffOGt/Tc6DUWkCbbObKq94ItYYY0URZB6Td6nYmuhtZHpfLtRhn9/QQ5NN
	Dl9661ebFuu/KfRiRkVV
X-Google-Smtp-Source: AGHT+IGHYsjWMYaVmkmwyMLT19LVbyGhxle1lJRM+WR5y8m0fr8gSuzuSmFR5uflsAL4/mpI9Z3Sdw==
X-Received: by 2002:a17:906:3956:b0:aba:5e4d:c8e0 with SMTP id a640c23a62f3a-aba5e4dccd8mr393634666b.30.1739536716200;
        Fri, 14 Feb 2025 04:38:36 -0800 (PST)
Date: Fri, 14 Feb 2025 13:38:34 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/dom0: attempt to fixup p2m page-faults for PVH
 dom0
Message-ID: <Z685StmNlL2d8iQT@macbook.local>
References: <20250214092928.28932-1-roger.pau@citrix.com>
 <20250214092928.28932-3-roger.pau@citrix.com>
 <a5c763da-c38c-465d-afac-08785cd733ef@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a5c763da-c38c-465d-afac-08785cd733ef@suse.com>

On Fri, Feb 14, 2025 at 12:53:01PM +0100, Jan Beulich wrote:
> On 14.02.2025 10:29, Roger Pau Monne wrote:
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -822,7 +822,8 @@ Specify the bit width of the DMA heap.
> >  
> >  ### dom0
> >      = List of [ pv | pvh, shadow=<bool>, verbose=<bool>,
> > -                cpuid-faulting=<bool>, msr-relaxed=<bool> ] (x86)
> > +                cpuid-faulting=<bool>, msr-relaxed=<bool>,
> > +                pf-fixup=<bool> ] (x86)
> >  
> >      = List of [ sve=<integer> ] (Arm64)
> >  
> > @@ -883,6 +884,19 @@ Controls for how dom0 is constructed on x86 systems.
> >  
> >      If using this option is necessary to fix an issue, please report a bug.
> >  
> > +*   The `pf-fixup` boolean is only applicable when using a PVH dom0 and
> > +    defaults to false.
> > +
> > +    When running dom0 in PVH mode the dom0 kernel has no way to map MMIO
> > +    regions into the p2m, such mode relies on Xen dom0 builder populating
> > +    the p2m with all MMIO regions that dom0 should access.  However Xen
> > +    doesn't have a complete picture of the host memory map, due to not
> > +    being able to process ACPI dynamic tables.
> > +
> > +    The `pf-fixup` option allows Xen to attempt to add missing MMIO regions
> > +    to the p2m in response to page-faults generated by dom0 trying to access
> > +    unpopulated entries in the p2m.
> 
> I wonder if this is to implementation focused for a command line option doc.
> In particular the multiple uses of "p2m" are standing out in this regard.

Hm, let me try to change p2m with 'dom0 physical memory map' or similar.

> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -286,6 +286,10 @@ int __init parse_arch_dom0_param(const char *s, const char *e)
> >          opt_dom0_cpuid_faulting = val;
> >      else if ( (val = parse_boolean("msr-relaxed", s, e)) >= 0 )
> >          opt_dom0_msr_relaxed = val;
> > +#ifdef CONFIG_HVM
> > +    else if ( (val = parse_boolean("pf-fixup", s, e)) >= 0 )
> > +        opt_dom0_pf_fixup = val;
> > +#endif
> >      else
> >          return -EINVAL;
> 
> I fear the scope of these sub-options is getting increasingly confusing.
> opt_dom0_msr_relaxed is what its name says - specific to Dom0.
> opt_dom0_cpuid_faulting, otoh, is a control domain option (i.e. also
> applicable to a [hypothetical?] late ctrldom). Now you add an option
> that's applicable to the hardware domain, i.e. also coverting late-hwdom.

It's kind of a mixed bag, but ATM I would leave it as-is because it's
likely easier for users to find the options if they are grouped
together.  WE can always add more fine grained options if there's a
desired for them.

> > --- a/xen/arch/x86/hvm/emulate.c
> > +++ b/xen/arch/x86/hvm/emulate.c
> > @@ -338,8 +338,38 @@ static int hvmemul_do_io(
> >          if ( !s )
> >          {
> >              if ( is_mmio && is_hardware_domain(currd) )
> > -                gdprintk(XENLOG_DEBUG, "unhandled memory %s to %#lx size %u\n",
> > -                         dir ? "read" : "write", addr, size);
> > +            {
> > +                /*
> > +                 * PVH dom0 is likely missing MMIO mappings on the p2m, due to
> > +                 * the incomplete information Xen has about the memory layout.
> > +                 *
> > +                 * Either print a message to note dom0 attempted to access an
> > +                 * unpopulated GPA, or try to fixup the p2m by creating an
> > +                 * identity mapping for the faulting GPA.
> > +                 */
> > +                if ( opt_dom0_pf_fixup )
> > +                {
> > +                    int inner_rc = hvm_hwdom_fixup_p2m(addr);
> 
> Why not use rc, as we do elsewhere in the function?

hvm_hwdom_fixup_p2m() returns an errno, while rc in this context
contains X86EMUL_ values.  I could indeed re-use rc, it just felt
wrong to mix different error address spaces on the same variable.

> > --- a/xen/arch/x86/hvm/hvm.c
> > +++ b/xen/arch/x86/hvm/hvm.c
> > @@ -13,6 +13,7 @@
> >  #include <xen/lib.h>
> >  #include <xen/trace.h>
> >  #include <xen/sched.h>
> > +#include <xen/iocap.h>
> >  #include <xen/irq.h>
> >  #include <xen/softirq.h>
> >  #include <xen/domain.h>
> > @@ -5458,6 +5459,36 @@ int hvm_copy_context_and_params(struct domain *dst, struct domain *src)
> >      return rc;
> >  }
> >  
> > +bool __ro_after_init opt_dom0_pf_fixup;
> > +int hvm_hwdom_fixup_p2m(paddr_t addr)
> 
> The placement here looks odd to me. Why not as static function in emulate.c?
> Or alternatively why not as p2m_hwdom_fixup() in mm/p2m.c?

I don't have a strong opinion, if you are fine with it a static
function in emulate.c might be the best then.

> > +{
> > +    unsigned long gfn = paddr_to_pfn(addr);
> > +    struct domain *currd = current->domain;
> > +    p2m_type_t type;
> > +    mfn_t mfn;
> > +    int rc;
> > +
> > +    ASSERT(is_hardware_domain(currd));
> > +    ASSERT(!altp2m_active(currd));
> > +
> > +    /*
> > +     * Fixups are only applied for MMIO holes, and rely on the hardware domain
> > +     * having identity mappings for non RAM regions (gfn == mfn).
> > +     */
> > +    if ( !iomem_access_permitted(currd, gfn, gfn) ||
> > +         !is_memory_hole(_mfn(gfn), _mfn(gfn)) )
> > +        return -EPERM;
> > +
> > +    mfn = get_gfn(currd, gfn, &type);
> > +    if ( !mfn_eq(mfn, INVALID_MFN) || !p2m_is_hole(type) )
> > +        rc = mfn_eq(mfn, _mfn(gfn)) ? 0 : -EEXIST;
> 
> I understand this is to cover the case where two vCPU-s access the same GFN
> at about the same time. However, the "success" log message at the call site
> being debug-only means we may be silently hiding bugs in release builds, if
> e.g. we get here despite the GFN having had an identity mapping already for
> ages.

Possibly, but what would be your suggestion to fix this?  I will think
about it, but I can't immediately see a solution that's not simply to
make the message printed by the caller to be gprintk() instead of
gdprintk() so catch such bugs.  Would you agree to that?

Thanks, Roger.

