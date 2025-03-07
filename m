Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B47A55D3A
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 02:41:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904514.1312397 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMhp-0002sT-Ed; Fri, 07 Mar 2025 01:40:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904514.1312397; Fri, 07 Mar 2025 01:40:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqMhp-0002pK-Aw; Fri, 07 Mar 2025 01:40:53 +0000
Received: by outflank-mailman (input) for mailman id 904514;
 Fri, 07 Mar 2025 01:40:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Nrba=V2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tqMhn-0002pE-Ti
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 01:40:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31617a3a-faf5-11ef-9ab4-95dc52dad729;
 Fri, 07 Mar 2025 02:40:50 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F23435C5B3E;
 Fri,  7 Mar 2025 01:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B024C4CEE9;
 Fri,  7 Mar 2025 01:40:44 +0000 (UTC)
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
X-Inumbo-ID: 31617a3a-faf5-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741311646;
	bh=XjhrAxzmyzOaaKLIf65u4yuTJ+70wcU27Nxbh+rj+HY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LXO0pHXqzg5n5KoaMQjFPrgi2+UFctPGdkwCTGiJb2eX+tjciGxsjry+Yha2HIrv2
	 YccnIAXVt4WVcr1Ngs7qYAWBLEg8ojssEl4SAjDrajPrVsJtEeGkIz5KcFsR9I+WUj
	 pllgZ2n45y0s1ebOMB7YPq2KJyLdW/Ks1ysgs73f/haQZTAgkc+zbk5CJIWIlqBRd3
	 vSQparGUQYnUJEoCTQcujTJlqtJhpLSEY3bZQ1hWSx7rJ6WVM4q1RnpG73of3pefel
	 I3WBiVPgvlyjQuorgJ1hdv4TylOiRHbkDyZoIDHNN+CCLvgsTEYcWmg3c2Vbhrofhs
	 Dd5rgkMumw5FQ==
Date: Thu, 6 Mar 2025 17:40:44 -0800 (PST)
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
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
In-Reply-To: <20250306220343.203047-6-jason.andryuk@amd.com>
Message-ID: <alpine.DEB.2.22.394.2503061738430.2600338@ubuntu-linux-20-04-desktop>
References: <20250306220343.203047-1-jason.andryuk@amd.com> <20250306220343.203047-6-jason.andryuk@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 6 Mar 2025, Jason Andryuk wrote:
> Add capabilities property to dom0less to allow building a
> disaggregated system.
> 
> Introduce bootfdt.h to contain these constants.
> 
> When using the hardware or xenstore capabilities, adjust the grant and
> event channel limits similar to dom0.
> 
> Also for the hardware domain, set directmap and iommu.  This brings its
> configuration in line with a dom0.
> 
> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
> ---
> There is overlap with hyperlaunch.  The numeric values are the same.
> Hyperlaunch doesn't expose the values in a public header as done here.
> Is this to be expected for dom0less?  It seems most of dom0less isn't in
> a header, but just in docs.
> 
> Hyperlaunch uses BUILD_CAPS_, but I chose DOMAIN_CAPS_ since there are
> domain-level capabilities.
> 
> Only a single xenstore and hardware domain make sense.  A check to limit
> to only a single hardware domain is in place - building two breaks.  But
> nothing prevents the dom0less configuration from only having multiple
> xenstore domains.  Each xenstore domain would have slightly more
> permissions, but only the last one would be used.
> ---
>  docs/misc/arm/device-tree/booting.txt | 11 ++++++++++
>  xen/arch/arm/dom0less-build.c         | 29 +++++++++++++++++++++++++++
>  xen/arch/arm/domain.c                 |  3 ++-
>  xen/include/public/bootfdt.h          | 27 +++++++++++++++++++++++++
>  4 files changed, 69 insertions(+), 1 deletion(-)
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
> index 5a7871939b..068bf99294 100644
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
> @@ -994,6 +995,34 @@ void __init create_domUs(void)
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
> +                d_cfg.max_grant_frames = gnttab_dom0_frames();
> +                d_cfg.max_evtchn_port = -1;

max_maptrack_frames = -1 ?


> +                flags |= CDF_hardware;
> +                flags |= CDF_directmap;
> +                iommu = true;
> +            }
> +
> +            if ( val & DOMAIN_CAPS_XENSTORE )
> +            {
> +                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;

shouldn't we take the opportunity to also set XEN_DOMCTL_CDF_xs_domain
in xen/arch/arm/domain_build.c:create_dom0 ?


> +                d_cfg.max_evtchn_port = -1;

Why this one?


> +            }
> +        }
> +
>          if ( dt_find_property(node, "xen,static-mem", NULL) )
>          {
>              if ( llc_coloring_enabled )
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
> index 0000000000..4e87aca8ac
> --- /dev/null
> +++ b/xen/include/public/bootfdt.h
> @@ -0,0 +1,27 @@
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
> +/* Domain Capabilities specified in the "capabilities" property.  Use of
> + * this property allows splitting up the monolithic dom0 into separate,
> + * less privileged components.  A regular domU has no capabilities
> + * (which is the default if nothing is specified).  A traditional dom0
> + * has all three capabilities.*/

The multiline comment coding style is:

/*
 * comment
 * comment
 */


> +/* Control/Privileged domain capable of affecting other domains. */
> +#define DOMAIN_CAPS_CONTROL  (1 << 0)
> +/* Hardware domain controlling physical hardware.  Typically providing
> + * backends to other domains.  */
> +#define DOMAIN_CAPS_HARDWARE (1 << 1)
> +/* Xenstore domain. */
> +#define DOMAIN_CAPS_XENSTORE (1 << 2)
> +#define DOMAIN_CAPS_MASK     (DOMAIN_CAPS_CONTROL | DOMAIN_CAPS_HARDWARE | \
> +                              DOMAIN_CAPS_XENSTORE)
> +
> +#endif /* __XEN_PUBLIC_BOOTFDT_H__ */
> -- 
> 2.48.1
> 

