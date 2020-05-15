Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FB91D4919
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 11:09:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZWKG-0005IH-6O; Fri, 15 May 2020 09:08:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7uuJ=65=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jZWKE-0005IC-Oz
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 09:08:14 +0000
X-Inumbo-ID: 99bd3dd0-968b-11ea-a533-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 99bd3dd0-968b-11ea-a533-12813bfff9fa;
 Fri, 15 May 2020 09:08:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6927EB195;
 Fri, 15 May 2020 09:08:13 +0000 (UTC)
Subject: Re: [PATCH] x86: retrieve and log CPU frequency information
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
 <20200515083204.GM54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b672f753-cffd-def9-35bb-0d1314b682ba@suse.com>
Date: Fri, 15 May 2020 11:08:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200515083204.GM54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 15.05.2020 10:32, Roger Pau Monné wrote:
> On Wed, Apr 15, 2020 at 01:55:24PM +0200, Jan Beulich wrote:
>> While from just a single Skylake system it is already clear that we
>> can't base any of our logic on CPUID leaf 15 [1] (leaf 16 is
>> documented to be used for display purposes only anyway), logging this
>> information may still give us some reference in case of problems as well
>> as for future work. Additionally on the AMD side it is unclear whether
>> the deviation between reported and measured frequencies is because of us
>> not doing well, or because of nominal and actual frequencies being quite
>> far apart.
>>
>> The chosen variable naming in amd_log_freq() has pointed out a naming
>> problem in rdmsr_safe(), which is being taken care of at the same time.
>> Symmetrically wrmsr_safe(), being an inline function, also gets an
>> unnecessary underscore dropped from one of its local variables.
>>
>> [1] With a core crystal clock of 24MHz and a ratio of 216/2, the
>>     reported frequency nevertheless is 2600MHz, rather than the to be
>>     expected (and calibrated by both us and Linux) 2592MHz.
>>
>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, but please clarify whether this is with or without the
two suggested changes (breaking out intel_log_freq() and introducing
local variables for (uint8_t)(msrval >> NN)), or whether you
mean to leave it to me whether to make them. And if I'm to make the
change, whether you'd trust me to not screw up things, i.e. whether
I can keep you R-b in that case.

> I have one question below about P-state limits.
> 
>> ---
>> TBD: The node ID retrieval using extended leaf 1E implies it won't work
>>      on older hardware (pre-Fam15 I think). Besides the Node ID MSR,
>>      which doesn't get advertised on my Fam10 box (and it's zero on all
>>      processors despite there being two nodes as per the PCI device
>>      map), and which isn't even documented for Fam11, Fam12, and Fam14,
>>      I didn't find any other means to retrieve the node ID a CPU is
>>      associated with - the NodeId register in PCI config space depends
>>      on one already knowing the node ID for doing the access, as the
>>      device to be used is a function of the node ID.
> 
> I there a real chance of the boost states being different between
> nodes?

Probably not, but doing things properly would still have been
nice.

> Won't Xen explode elsewhere due to possibly diverging features
> between nodes?

For many features - yes, but for boost states being different I
don't think it would.

>> --- a/xen/arch/x86/cpu/amd.c
>> +++ b/xen/arch/x86/cpu/amd.c
>> @@ -532,6 +532,102 @@ static void amd_get_topology(struct cpui
>>                                                            : c->cpu_core_id);
>>  }
>>  
>> +void amd_log_freq(const struct cpuinfo_x86 *c)
>> +{
>> +	unsigned int idx = 0, h;
>> +	uint64_t hi, lo, val;
>> +
>> +	if (c->x86 < 0x10 || c->x86 > 0x19 ||
>> +	    (c != &boot_cpu_data &&
>> +	     (!opt_cpu_info || (c->apicid & (c->x86_num_siblings - 1)))))
>> +		return;
>> +
>> +	if (c->x86 < 0x17) {
>> +		unsigned int node = 0;
>> +		uint64_t nbcfg;
>> +
>> +		/*
>> +		 * Make an attempt at determining the node ID, but assume
>> +		 * symmetric setup (using node 0) if this fails.
>> +		 */
>> +		if (c->extended_cpuid_level >= 0x8000001e &&
>> +		    cpu_has(c, X86_FEATURE_TOPOEXT)) {
>> +			node = cpuid_ecx(0x8000001e) & 0xff;
>> +			if (node > 7)
>> +				node = 0;
>> +		} else if (cpu_has(c, X86_FEATURE_NODEID_MSR)) {
>> +			rdmsrl(0xC001100C, val);
>> +			node = val & 7;
>> +		}
>> +
>> +		/*
>> +		 * Enable (and use) Extended Config Space accesses, as we
>> +		 * can't be certain that MCFG is available here during boot.
>> +		 */
>> +		rdmsrl(MSR_AMD64_NB_CFG, nbcfg);
>> +		wrmsrl(MSR_AMD64_NB_CFG,
>> +		       nbcfg | (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT));
>> +#define PCI_ECS_ADDRESS(sbdf, reg) \
>> +    (0x80000000 | ((sbdf).bdf << 8) | ((reg) & 0xfc) | (((reg) & 0xf00) << 16))
>> +
>> +		for ( ; ; ) {
>> +			pci_sbdf_t sbdf = PCI_SBDF(0, 0, 0x18 | node, 4);
>> +
>> +			switch (pci_conf_read32(sbdf, PCI_VENDOR_ID)) {
>> +			case 0x00000000:
>> +			case 0xffffffff:
>> +				/* No device at this SBDF. */
>> +				if (!node)
>> +					break;
>> +				node = 0;
>> +				continue;
>> +
>> +			default:
>> +				/*
>> +				 * Core Performance Boost Control, family
>> +				 * dependent up to 3 bits starting at bit 2.
> 
> 
> I would add:
> 
> "Note that boot states operate at a frequency above the base one, and
> thus need to be accounted for in order to correctly fetch the nominal
> frequency of the processor."

Done.

>> +				 */
>> +				switch (c->x86) {
>> +				case 0x10: idx = 1; break;
>> +				case 0x12: idx = 7; break;
>> +				case 0x14: idx = 7; break;
>> +				case 0x15: idx = 7; break;
>> +				case 0x16: idx = 7; break;
>> +				}
>> +				idx &= pci_conf_read(PCI_ECS_ADDRESS(sbdf,
>> +				                                     0x15c),
>> +				                     0, 4) >> 2;
>> +				break;
>> +			}
>> +			break;
>> +		}
>> +
>> +#undef PCI_ECS_ADDRESS
>> +		wrmsrl(MSR_AMD64_NB_CFG, nbcfg);
>> +	}
>> +
>> +	lo = 0; /* gcc may not recognize the loop having at least 5 iterations */
>> +	for (h = c->x86 == 0x10 ? 5 : 8; h--; )
>> +		if (!rdmsr_safe(0xC0010064 + h, lo) && (lo >> 63))
>> +			break;
>> +	if (!(lo >> 63))
>> +		return;
> 
> Should you also take the P-state limit here into account (from MSR
> 0xC0010061)?
> 
> I assume the firmware could set a minimum P-state higher than the
> possible ones present in the list of P-states, effectively preventing
> switching to lowest-performance P-states?

We're not after permitted P-states here - these would matter only if
we were meaning to alter the current P-state by direct MSR accesses.
Here we're only after logging capabilities (and the P-state limits
can, aiui, in principle also change at runtime).

Jan

