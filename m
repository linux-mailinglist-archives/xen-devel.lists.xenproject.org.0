Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C50531D4858
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 10:34:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZVlR-0002GW-Mx; Fri, 15 May 2020 08:32:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZVlQ-0002GR-8P
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 08:32:16 +0000
X-Inumbo-ID: 94217238-9686-11ea-a530-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 94217238-9686-11ea-a530-12813bfff9fa;
 Fri, 15 May 2020 08:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589531536;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=1FcibkN+M9mk9H4hXwPg7huENntptjJlMYcxLwCtNx0=;
 b=SLrojQb9Uztf5sLxYVOI6mhPi8OqC6h3v6R2UeSS08AUsGUew6TQMEOT
 U1/y8GAtNI3w5Yr083q8srw5ReiOjN9I98C7r18k329/olRIGAiKGldkN
 8PtdQ/Lelx0l16ctTizxjYCU9WftA+dWOwxw+HAxklY6mhLuO97UtB3Qv Y=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: RP73nD2P38KqDXAbnDCinD/6RlKzcuqt8jzFRCz1/iRWV0ps+AjZJ9KNcXouWUbgMORajhSMHu
 XoukeKNXLr+1so2yYf1TEgr8ZqLyWzOfcdWDyoDclOtqKQj+rd1yl19hOxQ1k+Jg+MaOZ425II
 ILfpa4bZ57vFJxYDGuzSYPf/4iiBOnVrx0AEiPR+Pnc5woFeNMpwaCwxyBcnHRQTN87WSn1kzk
 9uII24o8/sAbgxzG3H4NdyXBE2FKx6kTz4/oISBoow592VujmnYHnlnm1WItoGjG2Jn5LYROQx
 dqo=
X-SBRS: 2.7
X-MesageID: 17600240
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,394,1583211600"; d="scan'208";a="17600240"
Date: Fri, 15 May 2020 10:32:04 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] x86: retrieve and log CPU frequency information
Message-ID: <20200515083204.GM54375@Air-de-Roger>
References: <1fd091d2-30e2-0691-0485-3f5142bd457f@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
> 
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

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I have one question below about P-state limits.

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

I there a real chance of the boost states being different between
nodes? Won't Xen explode elsewhere due to possibly diverging features
between nodes?

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


I would add:

"Note that boot states operate at a frequency above the base one, and
thus need to be accounted for in order to correctly fetch the nominal
frequency of the processor."

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

Should you also take the P-state limit here into account (from MSR
0xC0010061)?

I assume the firmware could set a minimum P-state higher than the
possible ones present in the list of P-states, effectively preventing
switching to lowest-performance P-states?

The rest LGTM, Thanks.

