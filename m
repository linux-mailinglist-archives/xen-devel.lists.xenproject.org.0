Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6391D352D
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 17:34:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZFr5-0006zR-Rp; Thu, 14 May 2020 15:33:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZFr4-0006zL-EQ
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 15:33:02 +0000
X-Inumbo-ID: 31c35f90-95f8-11ea-b07b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31c35f90-95f8-11ea-b07b-bc764e2007e4;
 Thu, 14 May 2020 15:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589470381;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=tJ6JoekXk7uvOZSQJxLdc5GU5d7Rhd+CLgHwfEMBLZQ=;
 b=S9FSGu9yRWRtS6tyrrttEEblHlSTjcEcZtqOZW/0u4JkGqru2t8VP6Z5
 LqUhgU3LaGs9O3m4r6m3YOTt2VcQ1b2U+7BxAkdNRm8ThtFEc0icVzT1O
 haDJnPFA5IGqwe8KN13BN2sKN1Dx8cEBbiq05DaGrGD+VxaViY8yekVvn Q=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: Lv+p62IM9QtP7W9HeJwaYiEIKl6Er0ymhz3vSPL5xJ78DTo2XKTm2dZh2edV6qVMvw3/ZBIRx3
 4yt9nZfFL3vSHU0Dm0eoUJuGXflaBYdu1//KmplXHtSB7b6dsfYqWM/jxZ1O624Ksj/oxfwj2u
 lM8aKY/Fg7QmJ3Z8Eq57h/+7aUJf8R0zqvocoazsPZAH1AmbKFQ1dG4N70FAJUe3jS2dOgqJP6
 OqB1J3dmFZzqJT9lr99eMmkshihOHAR28s/T8LEYruiczAA5fOeH2IKc95llrmgeFnSdR93T/S
 sLc=
X-SBRS: 2.7
X-MesageID: 17808368
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17808368"
Date: Thu, 14 May 2020 17:32:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: retrieve and log CPU frequency information
Message-ID: <20200514153252.GE54375@Air-de-Roger>
References: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
 <20200514131021.GB54375@Air-de-Roger>
 <2e9c7c05-e42c-52d4-f48c-9ecc8b14a1a7@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e9c7c05-e42c-52d4-f48c-9ecc8b14a1a7@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Thu, May 14, 2020 at 03:38:18PM +0200, Jan Beulich wrote:
> On 14.05.2020 15:10, Roger Pau Monné wrote:
> > On Wed, Apr 15, 2020 at 01:55:24PM +0200, Jan Beulich wrote:
> >> While from just a single Skylake system it is already clear that we
> >> can't base any of our logic on CPUID leaf 15 [1] (leaf 16 is
> >> documented to be used for display purposes only anyway), logging this
> >> information may still give us some reference in case of problems as well
> >> as for future work. Additionally on the AMD side it is unclear whether
> >> the deviation between reported and measured frequencies is because of us
> >> not doing well, or because of nominal and actual frequencies being quite
> >> far apart.
> > 
> > Can you add some reference to the AMD implementation? I've looked at
> > the PMs and haven't been able to find a description of some of the
> > MSRs, like 0xC0010064.
> 
> Take a look at
> 
> https://developer.amd.com/resources/developer-guides-manuals/
> 
> I'm unconvinced a reference needs adding here.

Do you think it would be sensible to introduce some defines for at
least 0xC0010064? (ie: MSR_AMD_PSTATE_DEF_BASE)

I think it would make it easier to find on the manuals.

> 
> >> --- a/xen/arch/x86/cpu/intel.c
> >> +++ b/xen/arch/x86/cpu/intel.c
> >> @@ -378,6 +378,72 @@ static void init_intel(struct cpuinfo_x8
> >>  	     ( c->cpuid_level >= 0x00000006 ) &&
> >>  	     ( cpuid_eax(0x00000006) & (1u<<2) ) )
> >>  		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
> >> +
> > 
> > I would split this into a separate helper, ie: intel_log_freq. That
> > will allow you to exit early and reduce some of the indentation IMO.
> 
> Can do; splitting this for AMD/Hygon however was merely to
> facilitate using it for both vendors, though.
> 
> >> +    if ( (opt_cpu_info && !(c->apicid & (c->x86_num_siblings - 1))) ||
> >> +         c == &boot_cpu_data )
> >> +    {
> >> +        unsigned int eax, ebx, ecx, edx;
> >> +        uint64_t msrval;
> >> +
> >> +        if ( c->cpuid_level >= 0x15 )
> >> +        {
> >> +            cpuid(0x15, &eax, &ebx, &ecx, &edx);
> >> +            if ( ecx && ebx && eax )
> >> +            {
> >> +                unsigned long long val = ecx;
> >> +
> >> +                val *= ebx;
> >> +                do_div(val, eax);
> >> +                printk("CPU%u: TSC: %uMHz * %u / %u = %LuMHz\n",
> >> +                       smp_processor_id(), ecx, ebx, eax, val);
> >> +            }
> >> +            else if ( ecx | eax | ebx )
> >> +            {
> >> +                printk("CPU%u: TSC:", smp_processor_id());
> >> +                if ( ecx )
> >> +                    printk(" core: %uMHz", ecx);
> >> +                if ( ebx && eax )
> >> +                    printk(" ratio: %u / %u", ebx, eax);
> >> +                printk("\n");
> >> +            }
> >> +        }
> >> +
> >> +        if ( c->cpuid_level >= 0x16 )
> >> +        {
> >> +            cpuid(0x16, &eax, &ebx, &ecx, &edx);
> >> +            if ( ecx | eax | ebx )
> >> +            {
> >> +                printk("CPU%u:", smp_processor_id());
> >> +                if ( ecx )
> >> +                    printk(" bus: %uMHz", ecx);
> >> +                if ( eax )
> >> +                    printk(" base: %uMHz", eax);
> >> +                if ( ebx )
> >> +                    printk(" max: %uMHz", ebx);
> >> +                printk("\n");
> >> +            }
> >> +        }
> >> +
> >> +        if ( !rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) &&
> >> +             (uint8_t)(msrval >> 8) )
> > 
> > I would introduce a mask for it would be cleaner, since you use it
> > here and below (and would avoid the casting to uint8_t.
> 
> To avoid the casts (also below) I could introduce local variables.
> I specifically wanted to avoid MASK_EXTR() such that the rest of the
> calculations in
> 
>             if ( (uint8_t)(msrval >> 40) )
>                 printk("%u..", (factor * (uint8_t)(msrval >> 40) + 50) / 100);
>             printk("%u MHz\n", (factor * (uint8_t)(msrval >> 8) + 50) / 100);
> 
> can be done as 32-bit arithmetic.

Might be cleaner with the local variables.

> >> +        {
> >> +            unsigned int factor = 10000;
> >> +
> >> +            if ( c->x86 == 6 )
> >> +                switch ( c->x86_model )
> >> +                {
> >> +                case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
> >> +                case 0x25: case 0x2c: case 0x2f: /* Westmere */
> >> +                    factor = 13333;
> > 
> > The SDM lists ratio * 100MHz without any notes, why are those models
> > different, is this some errata?
> 
> Did you go through the MSR lists for the various models? It's there
> where I found this anomaly, not in any spec updates.

My bad, I was looking at the Atom table I think, and didn't realize
they where multiple tables instead of a single table with different
notes for models.

> 
> >> +                    break;
> >> +                }
> >> +
> >> +            printk("CPU%u: ", smp_processor_id());
> >> +            if ( (uint8_t)(msrval >> 40) )
> >> +                printk("%u..", (factor * (uint8_t)(msrval >> 40) + 50) / 100);
> >> +            printk("%u MHz\n", (factor * (uint8_t)(msrval >> 8) + 50) / 100);
> > 
> > Since you are calculating using Hz, should you use an unsigned long
> > factor to prevent capping at 4GHz?
> 
> Hmm, the calculation looks to be in units of 10kHz, until the division
> by 100. I don't think we'd cap at 4GHz this way.

Oh yes, sorry, it's kHz, not Hz.

> 
> >> --- a/xen/include/asm-x86/msr.h
> >> +++ b/xen/include/asm-x86/msr.h
> >> @@ -40,8 +40,8 @@ static inline void wrmsrl(unsigned int m
> >>  
> >>  /* rdmsr with exception handling */
> >>  #define rdmsr_safe(msr,val) ({\
> >> -    int _rc; \
> >> -    uint32_t lo, hi; \
> >> +    int rc_; \
> >> +    uint32_t lo_, hi_; \
> >>      __asm__ __volatile__( \
> >>          "1: rdmsr\n2:\n" \
> >>          ".section .fixup,\"ax\"\n" \
> >> @@ -49,15 +49,15 @@ static inline void wrmsrl(unsigned int m
> >>          "   movl %5,%2\n; jmp 2b\n" \
> >>          ".previous\n" \
> >>          _ASM_EXTABLE(1b, 3b) \
> >> -        : "=a" (lo), "=d" (hi), "=&r" (_rc) \
> >> +        : "=a" (lo_), "=d" (hi_), "=&r" (rc_) \
> >>          : "c" (msr), "2" (0), "i" (-EFAULT)); \
> >> -    val = lo | ((uint64_t)hi << 32); \
> >> -    _rc; })
> >> +    val = lo_ | ((uint64_t)hi_ << 32); \
> >> +    rc_; })
> > 
> > Since you are changing the local variable names, I would just switch
> > rdmsr_safe to a static inline, and drop the underlines. I don't see a
> > reason this has to stay as a macro.
> 
> Well, all callers would need to be changed to pass the address of
> the variable to store the value read into. That's quite a bit of
> code churn, and hence nothing I'd want to do in this patch.

Oh, right, didn't realize it's a macro for that reason.

Thanks, Roger.

