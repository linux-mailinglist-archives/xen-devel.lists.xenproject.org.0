Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A17A9A7856A
	for <lists+xen-devel@lfdr.de>; Wed,  2 Apr 2025 02:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.935000.1336527 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlaJ-0004pz-3T; Wed, 02 Apr 2025 00:03:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 935000.1336527; Wed, 02 Apr 2025 00:03:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzlaJ-0004oP-0Z; Wed, 02 Apr 2025 00:03:59 +0000
Received: by outflank-mailman (input) for mailman id 935000;
 Wed, 02 Apr 2025 00:03:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YWck=WU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tzlaG-0004oJ-Pj
 for xen-devel@lists.xenproject.org; Wed, 02 Apr 2025 00:03:56 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6ddef03-0f55-11f0-9ffb-bf95429c2676;
 Wed, 02 Apr 2025 02:03:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4040B61129;
 Wed,  2 Apr 2025 00:03:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B01C4CEE4;
 Wed,  2 Apr 2025 00:03:50 +0000 (UTC)
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
X-Inumbo-ID: f6ddef03-0f55-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743552232;
	bh=jT/+pCeWK8jt5gV1YwLnACokaY0EoUF0vSAd9cxvZwU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FtsBGhVSz406sBEBKBZGM5p0RkhZAcUxtosbc3I6r03khjN3jEyWNj87i24Qv5hR7
	 DClGoubpnRnCachofzK+cv5KPRtGQMwL/83zLm+w18qZ6o+hZKHFmTtmFS9g8PcWDC
	 CqzY8MV0vSQHDrGmr06STz3S0zHr+AwomrCVFpTaPLOqgBS/K5VUr0e3Wq9Fl8T8SZ
	 rkKdqvTChQ23Atch+FQPbTxb16zGg44OTnCIyzWxZF5LYrEMvBeym5VqJH0fSHmBmy
	 x/XaXmDTIZBfTxfP8lGesNC8FB5PvWosnzfMuR9XfxJQPX5NWvv0Lqv7eiTKU1geD+
	 ZPiSUZ3aOT1Qw==
Date: Tue, 1 Apr 2025 17:03:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Jason Andryuk <jason.andryuk@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v2 6/6] xen/arm: Add capabilities to dom0less
In-Reply-To: <20250331214321.205331-7-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2504011654320.3098208@ubuntu-linux-20-04-desktop>
References: <20250331214321.205331-1-jason.andryuk@amd.com> <20250331214321.205331-7-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 31 Mar 2025, Jason Andryuk wrote:
> Add capabilities property to dom0less to allow building a
> disaggregated system.  Only a single hardware domain and single xenstore
> domain can be specified.  Multiple control domains are possible.
> 
> Introduce bootfdt.h to contain these constants.
> 
> When using the hardware or xenstore capabilities, adjust the grant and
> event channel limits similar to dom0.
> 
> For a hardware domain, require an IOMMU and disallow specifying a vpl011
> console or nr_spis.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> v2:
> Fix comment style
> Make DOMAIN_CAPS_* unsigned
> Remove forced directmap & iommu
> Require iommu with use of hardware domain
> Limit to a single xenstore domain
> 
> There is overlap with hyperlaunch.  The numeric values are the same.
> Hyperlaunch doesn't expose the values in a public header as done here.
> Is this to be expected for dom0less?  It seems most of dom0less isn't in
> a header, but just in docs.
> 
> Hyperlaunch uses BUILD_CAPS_, but I chose DOMAIN_CAPS_ since there are
> domain-level capabilities.
> 
> Only a single xenstore and hardware domain make sense.  Hardware domain
> receiving all hardware can only have a single domain.
> 
> For Xenstore, the logic latches the single xs_domid and uses that for
> all domains.  Also, only a single domain can register for VIRQ_DOM_EXC.
> ---
>  docs/misc/arm/device-tree/booting.txt | 11 ++++++++
>  xen/arch/arm/dom0less-build.c         | 39 +++++++++++++++++++++++++++
>  xen/arch/arm/domain.c                 |  3 ++-
>  xen/include/public/bootfdt.h          | 31 +++++++++++++++++++++
>  4 files changed, 83 insertions(+), 1 deletion(-)
>  create mode 100644 xen/include/public/bootfdt.h
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index ac781c9cc8..490c792ddf 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -167,6 +167,17 @@ with the following properties:
>      Refer to docs/misc/cache_coloring.rst for syntax. This option is applicable
>      only to Arm64 guests.
>  
> +- capabilities
> +    Optional.  A bit field of domain capabilities for a disaggregated

Please reword as:

Optional.  A 32-bit integer representing a bit field...

That is because there is no native bit field type in device tree.



> +    system.  A traditional dom0 has all all of these capabilities, and a
> +    domU has none of them.
> +
> +    0x1 DOMAIN_CAPS_CONTROL  - A privileged, control domain
> +    0x2 DOMAIN_CAPS_HARDWARE - The hardware domain - there can be only 1
> +    0x4 DOMAIN_CAPS_XENSTORE - The xenstore domain - there can be only 1
> +
> +    The default is no capabilities.
> +
>  - vpl011
>  
>      An empty property to enable/disable a virtual pl011 for the guest to
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index fc515c9852..1cb6c170a7 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -12,6 +12,7 @@
>  #include <xen/sizes.h>
>  #include <xen/vmap.h>
>  
> +#include <public/bootfdt.h>
>  #include <public/io/xs_wire.h>
>  
>  #include <asm/arm64/sve.h>
> @@ -906,6 +907,8 @@ static int __init construct_domU(struct domain *d,
>             d->max_vcpus, mem);
>  
>      kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
> +    if ( kinfo.vpl011 && is_hardware_domain(d) )
> +        panic("hardware domain cannot specify vpl011\n");
>  
>      rc = dt_property_read_string(node, "xen,enhanced", &dom0less_enhanced);
>      if ( rc == -EILSEQ ||
> @@ -1020,6 +1023,40 @@ void __init create_domUs(void)
>          if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>              panic("No more domain IDs available\n");
>  
> +        if ( dt_property_read_u32(node, "capabilities", &val) )
> +        {
> +            if ( val & ~DOMAIN_CAPS_MASK )
> +                panic("Invalid capabilities (%"PRIx32")\n", val);
> +
> +            if ( val & DOMAIN_CAPS_CONTROL )
> +                flags |= CDF_privileged;
> +
> +            if ( val & DOMAIN_CAPS_HARDWARE )
> +            {
> +                if ( hardware_domain )
> +                    panic("Only 1 hardware domain can be specified! (%pd)\n",
> +                           hardware_domain);
> +
> +                if ( !iommu_enabled )
> +                    panic("iommu required for dom0less hardware domain\n");

The panic is OK if "direct-map" is not specified. We need to check for
direct-map before panic'ing.

Other than these two comments it looks good to me.


> +
> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
> +                d_cfg.max_evtchn_port = -1;
> +                flags |= CDF_hardware;
> +                iommu = true;
> +            }
> +
> +            if ( val & DOMAIN_CAPS_XENSTORE )
> +            {
> +                if ( xs_domid != DOMID_INVALID )
> +                    panic("Only 1 xenstore domain can be specified! (%u)\n",
> +                          xs_domid);
> +
> +                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
> +                d_cfg.max_evtchn_port = -1;
> +            }
> +        }
> +
>          if ( dt_find_property(node, "xen,static-mem", NULL) )
>          {
>              if ( llc_coloring_enabled )
> @@ -1082,6 +1119,8 @@ void __init create_domUs(void)
>                  d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
>                                           vpl011_virq - 32 + 1);
>          }
> +        else if ( flags & CDF_hardware )
> +            panic("nr_spis cannot be specified for hardware domain\n");
>  
>          /* Get the optional property domain-cpupool */
>          cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 3ba959f866..dc4b4e84c1 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -608,7 +608,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>  {
>      unsigned int max_vcpus;
>      unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
> -    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
> +    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
> +                                   XEN_DOMCTL_CDF_xs_domain );
>      unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
>  
>      if ( (config->flags & ~flags_optional) != flags_required )
> diff --git a/xen/include/public/bootfdt.h b/xen/include/public/bootfdt.h
> new file mode 100644
> index 0000000000..86c46b42a9
> --- /dev/null
> +++ b/xen/include/public/bootfdt.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Xen Device Tree boot information
> + *
> + * Information for configuring Xen domains created at boot time.
> + */
> +
> +#ifndef __XEN_PUBLIC_BOOTFDT_H__
> +#define __XEN_PUBLIC_BOOTFDT_H__
> +
> +/*
> + * Domain Capabilities specified in the "capabilities" property.  Use of
> + * this property allows splitting up the monolithic dom0 into separate,
> + * less privileged components.  A regular domU has no capabilities
> + * (which is the default if nothing is specified).  A traditional dom0
> + * has all three capabilities.
> + */
> +
> +/* Control/Privileged domain capable of affecting other domains. */
> +#define DOMAIN_CAPS_CONTROL  (1U << 0)
> +/*
> + * Hardware domain controlling physical hardware.  Typically providing
> + * backends to other domains.
> + */
> +#define DOMAIN_CAPS_HARDWARE (1U << 1)
> +/* Xenstore domain. */
> +#define DOMAIN_CAPS_XENSTORE (1U << 2)
> +#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE | \
> +                              DOMAIN_CAPS_XENSTORE)
> +
> +#endif /* __XEN_PUBLIC_BOOTFDT_H__ */
> -- 
> 2.49.0
> 

