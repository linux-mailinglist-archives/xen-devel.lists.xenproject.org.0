Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF8E1D30B9
	for <lists+xen-devel@lfdr.de>; Thu, 14 May 2020 15:11:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZDdu-0001J9-Up; Thu, 14 May 2020 13:11:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=otfA=64=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZDds-0001J0-VM
 for xen-devel@lists.xenproject.org; Thu, 14 May 2020 13:11:17 +0000
X-Inumbo-ID: 640fe202-95e4-11ea-ae69-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 640fe202-95e4-11ea-ae69-bc764e2007e4;
 Thu, 14 May 2020 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589461875;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=sdqEqzAUQyRIahzgAP6WBKjocHkR4BpmKUfYcI0d+So=;
 b=Cp1UrEhHuEGqD4O+ZQn+49yQ81xw/lopvS81rUC/XbLB9y3LP/UMi235
 vbcalR74k2yN0OAeJEQhV9IH1tNmY5F30Blyk6/pQFeQLQ23Aev4tyiFL
 6rDgbDUXcmpBHf6o1co7tcaZxZITFr/QWKDJQOF9EQGHqgTluauVhiwmC M=;
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
IronPort-SDR: BDavbFFcUIq33r8dWqq31/q9Y/izuR6GJ/BlZ/wxyIpe/Cvr1H8/rWTItd6HJm/oz7bAHEe7zU
 kSqe9KUc7Ivh5FNRvu31piWUNUZHEuDiKH4INJ+p7PmcIOJhKrTa7CFTPEo2wlbPU8l8oUyI2y
 2PEGabnkvhUr07iQdyrZUN/GDQBjRSWQS0nRp30HQDf+w0bd6BfvNxu6aQvRIAbmq9kYKelHJr
 +3BeQg7R7iuYY5MaoJP9ZinFVZ+nC8Hw1ThkhQEnXnGUP+eziVp6tiCYsO9IdN80mwGbk+b4qb
 qJA=
X-SBRS: 2.7
X-MesageID: 17790673
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,391,1583211600"; d="scan'208";a="17790673"
Date: Thu, 14 May 2020 15:10:21 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: retrieve and log CPU frequency information
Message-ID: <20200514131021.GB54375@Air-de-Roger>
References: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
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

On Wed, Apr 15, 2020 at 01:55:24PM +0200, Jan Beulich wrote:
> While from just a single Skylake system it is already clear that we
> can't base any of our logic on CPUID leaf 15 [1] (leaf 16 is
> documented to be used for display purposes only anyway), logging this
> information may still give us some reference in case of problems as well
> as for future work. Additionally on the AMD side it is unclear whether
> the deviation between reported and measured frequencies is because of us
> not doing well, or because of nominal and actual frequencies being quite
> far apart.

Can you add some reference to the AMD implementation? I've looked at
the PMs and haven't been able to find a description of some of the
MSRs, like 0xC0010064.

> The chosen variable naming in amd_log_freq() has pointed out a naming
> problem in rdmsr_safe(), which is being taken care of at the same time.
> Symmetrically wrmsr_safe(), being an inline function, also gets an
> unnecessary underscore dropped from one of its local variables.
> 
> [1] With a core crystal clock of 24MHz and a ratio of 216/2, the
>     reported frequency nevertheless is 2600MHz, rather than the to be
>     expected (and calibrated by both us and Linux) 2592MHz.
> 
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: The node ID retrieval using extended leaf 1E implies it won't work
>      on older hardware (pre-Fam15 I think). Besides the Node ID MSR,
>      which doesn't get advertised on my Fam10 box (and it's zero on all
>      processors despite there being two nodes as per the PCI device
>      map), and which isn't even documented for Fam11, Fam12, and Fam14,
>      I didn't find any other means to retrieve the node ID a CPU is
>      associated with - the NodeId register in PCI config space depends
>      on one already knowing the node ID for doing the access, as the
>      device to be used is a function of the node ID.
> 
> --- a/xen/arch/x86/cpu/amd.c
> +++ b/xen/arch/x86/cpu/amd.c
> @@ -532,6 +532,102 @@ static void amd_get_topology(struct cpui
>                                                            : c->cpu_core_id);
>  }
>  
> +void amd_log_freq(const struct cpuinfo_x86 *c)
> +{
> +	unsigned int idx = 0, h;
> +	uint64_t hi, lo, val;
> +
> +	if (c->x86 < 0x10 || c->x86 > 0x19 ||
> +	    (c != &boot_cpu_data &&
> +	     (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1)))))
> +		return;
> +
> +	if (c->x86 < 0x17) {
> +		unsigned int node = 0;
> +		uint64_t nbcfg;
> +
> +		/*
> +		 * Make an attempt at determining the node ID, but assume
> +		 * symmetric setup (using node 0) if this fails.
> +		 */
> +		if (c->extended_cpuid_level >= 0x8000001e &&
> +		    cpu_has(c, X86_FEATURE_TOPOEXT)) {
> +			node = cpuid_ecx(0x8000001e) & 0xff;
> +			if (node > 7)
> +				node = 0;
> +		} else if (cpu_has(c, X86_FEATURE_NODEID_MSR)) {
> +			rdmsrl(0xC001100C, val);
> +			node = val & 7;
> +		}
> +
> +		/*
> +		 * Enable (and use) Extended Config Space accesses, as we
> +		 * can't be certain that MCFG is available here during boot.
> +		 */
> +		rdmsrl(MSR_AMD64_NB_CFG, nbcfg);
> +		wrmsrl(MSR_AMD64_NB_CFG,
> +		       nbcfg | (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT));
> +#define PCI_ECS_ADDRESS(sbdf, reg) \
> +    (0x80000000 | ((sbdf).bdf << 8) | ((reg) & 0xfc) | (((reg) & 0xf00) << 16))
> +
> +		for ( ; ; ) {
> +			pci_sbdf_t sbdf = PCI_SBDF(0, 0, 0x18 | node, 4);
> +
> +			switch (pci_conf_read32(sbdf, PCI_VENDOR_ID)) {
> +			case 0x00000000:
> +			case 0xffffffff:
> +				/* No device at this SBDF. */
> +				if (!node)
> +					break;
> +				node = 0;
> +				continue;
> +
> +			default:
> +				/*
> +				 * Core Performance Boost Control, family
> +				 * dependent up to 3 bits starting at bit 2.
> +				 */
> +				switch (c->x86) {
> +				case 0x10: idx = 1; break;
> +				case 0x12: idx = 7; break;
> +				case 0x14: idx = 7; break;
> +				case 0x15: idx = 7; break;
> +				case 0x16: idx = 7; break;
> +				}
> +				idx &= pci_conf_read(PCI_ECS_ADDRESS(sbdf,
> +				                                     0x15c),
> +				                     0, 4) >> 2;
> +				break;
> +			}
> +			break;
> +		}
> +
> +#undef PCI_ECS_ADDRESS
> +		wrmsrl(MSR_AMD64_NB_CFG, nbcfg);
> +	}
> +
> +	lo = 0; /* gcc may not recognize the loop having at least 5 iterations */
> +	for (h = c->x86 == 0x10 ? 5 : 8; h--; )
> +		if (!rdmsr_safe(0xC0010064 + h, lo) && (lo >> 63))
> +			break;
> +	if (!(lo >> 63))
> +		return;
> +
> +#define FREQ(v) (c->x86 < 0x17 ? ((((v) & 0x3f) + 0x10) * 100) >> (((v) >> 6) & 7) \
> +		                     : (((v) & 0xff) * 25 * 8) / (((v) >> 8) & 0x3f))
> +	if (idx && idx < h &&
> +	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
> +	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
> +		printk("CPU%u: %lu (%lu..%lu) MHz\n",
> +		       smp_processor_id(), FREQ(val), FREQ(lo), FREQ(hi));
> +	else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63))
> +		printk("CPU%u: %lu..%lu MHz\n",
> +		       smp_processor_id(), FREQ(lo), FREQ(hi));
> +	else
> +		printk("CPU%u: %lu MHz\n", smp_processor_id(), FREQ(lo));
> +#undef FREQ
> +}
> +
>  void early_init_amd(struct cpuinfo_x86 *c)
>  {
>  	if (c == &boot_cpu_data)
> @@ -803,6 +899,8 @@ static void init_amd(struct cpuinfo_x86
>  		disable_c1_ramping();
>  
>  	check_syscfg_dram_mod_en();
> +
> +	amd_log_freq(c);
>  }
>  
>  const struct cpu_dev amd_cpu_dev = {
> --- a/xen/arch/x86/cpu/cpu.h
> +++ b/xen/arch/x86/cpu/cpu.h
> @@ -19,3 +19,4 @@ extern void detect_ht(struct cpuinfo_x86
>  extern bool detect_extended_topology(struct cpuinfo_x86 *c);
>  
>  void early_init_amd(struct cpuinfo_x86 *c);
> +void amd_log_freq(const struct cpuinfo_x86 *c);
> --- a/xen/arch/x86/cpu/hygon.c
> +++ b/xen/arch/x86/cpu/hygon.c
> @@ -99,6 +99,8 @@ static void init_hygon(struct cpuinfo_x8
>  		value |= (1 << 27); /* Enable read-only APERF/MPERF bit */
>  		wrmsrl(MSR_K7_HWCR, value);
>  	}
> +
> +	amd_log_freq(c);
>  }
>  
>  const struct cpu_dev hygon_cpu_dev = {
> --- a/xen/arch/x86/cpu/intel.c
> +++ b/xen/arch/x86/cpu/intel.c
> @@ -378,6 +378,72 @@ static void init_intel(struct cpuinfo_x8
>  	     ( c->cpuid_level >= 0x00000006 ) &&
>  	     ( cpuid_eax(0x00000006) & (1u<<2) ) )
>  		__set_bit(X86_FEATURE_ARAT, c->x86_capability);
> +

I would split this into a separate helper, ie: intel_log_freq. That
will allow you to exit early and reduce some of the indentation IMO.

> +    if ( (opt_cpu_info && !(c->apicid & (c->x86_num_siblings - 1))) ||
> +         c == &boot_cpu_data )
> +    {
> +        unsigned int eax, ebx, ecx, edx;
> +        uint64_t msrval;
> +
> +        if ( c->cpuid_level >= 0x15 )
> +        {
> +            cpuid(0x15, &eax, &ebx, &ecx, &edx);
> +            if ( ecx && ebx && eax )
> +            {
> +                unsigned long long val = ecx;
> +
> +                val *= ebx;
> +                do_div(val, eax);
> +                printk("CPU%u: TSC: %uMHz * %u / %u = %LuMHz\n",
> +                       smp_processor_id(), ecx, ebx, eax, val);
> +            }
> +            else if ( ecx | eax | ebx )
> +            {
> +                printk("CPU%u: TSC:", smp_processor_id());
> +                if ( ecx )
> +                    printk(" core: %uMHz", ecx);
> +                if ( ebx && eax )
> +                    printk(" ratio: %u / %u", ebx, eax);
> +                printk("\n");
> +            }
> +        }
> +
> +        if ( c->cpuid_level >= 0x16 )
> +        {
> +            cpuid(0x16, &eax, &ebx, &ecx, &edx);
> +            if ( ecx | eax | ebx )
> +            {
> +                printk("CPU%u:", smp_processor_id());
> +                if ( ecx )
> +                    printk(" bus: %uMHz", ecx);
> +                if ( eax )
> +                    printk(" base: %uMHz", eax);
> +                if ( ebx )
> +                    printk(" max: %uMHz", ebx);
> +                printk("\n");
> +            }
> +        }
> +
> +        if ( !rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) &&
> +             (uint8_t)(msrval >> 8) )

I would introduce a mask for it would be cleaner, since you use it
here and below (and would avoid the casting to uint8_t.

> +        {
> +            unsigned int factor = 10000;
> +
> +            if ( c->x86 == 6 )
> +                switch ( c->x86_model )
> +                {
> +                case 0x1a: case 0x1e: case 0x1f: case 0x2e: /* Nehalem */
> +                case 0x25: case 0x2c: case 0x2f: /* Westmere */
> +                    factor = 13333;

The SDM lists ratio * 100MHz without any notes, why are those models
different, is this some errata?

> +                    break;
> +                }
> +
> +            printk("CPU%u: ", smp_processor_id());
> +            if ( (uint8_t)(msrval >> 40) )
> +                printk("%u..", (factor * (uint8_t)(msrval >> 40) + 50) / 100);
> +            printk("%u MHz\n", (factor * (uint8_t)(msrval >> 8) + 50) / 100);

Since you are calculating using Hz, should you use an unsigned long
factor to prevent capping at 4GHz?

> +        }
> +    }
>  }
>  
>  const struct cpu_dev intel_cpu_dev = {
> --- a/xen/include/asm-x86/msr.h
> +++ b/xen/include/asm-x86/msr.h
> @@ -40,8 +40,8 @@ static inline void wrmsrl(unsigned int m
>  
>  /* rdmsr with exception handling */
>  #define rdmsr_safe(msr,val) ({\
> -    int _rc; \
> -    uint32_t lo, hi; \
> +    int rc_; \
> +    uint32_t lo_, hi_; \
>      __asm__ __volatile__( \
>          "1: rdmsr\n2:\n" \
>          ".section .fixup,\"ax\"\n" \
> @@ -49,15 +49,15 @@ static inline void wrmsrl(unsigned int m
>          "   movl %5,%2\n; jmp 2b\n" \
>          ".previous\n" \
>          _ASM_EXTABLE(1b, 3b) \
> -        : "=a" (lo), "=d" (hi), "=&r" (_rc) \
> +        : "=a" (lo_), "=d" (hi_), "=&r" (rc_) \
>          : "c" (msr), "2" (0), "i" (-EFAULT)); \
> -    val = lo | ((uint64_t)hi << 32); \
> -    _rc; })
> +    val = lo_ | ((uint64_t)hi_ << 32); \
> +    rc_; })

Since you are changing the local variable names, I would just switch
rdmsr_safe to a static inline, and drop the underlines. I don't see a
reason this has to stay as a macro.

>  
>  /* wrmsr with exception handling */
>  static inline int wrmsr_safe(unsigned int msr, uint64_t val)
>  {
> -    int _rc;
> +    int rc;
>      uint32_t lo, hi;
>      lo = (uint32_t)val;
>      hi = (uint32_t)(val >> 32);

Since you are already playing with this, could you initialize lo and
hi at definition time?

Thanks, Roger.

