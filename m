Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D03A56326
	for <lists+xen-devel@lfdr.de>; Fri,  7 Mar 2025 10:02:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904750.1312587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTZy-000653-2S; Fri, 07 Mar 2025 09:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904750.1312587; Fri, 07 Mar 2025 09:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqTZx-00062d-VD; Fri, 07 Mar 2025 09:01:13 +0000
Received: by outflank-mailman (input) for mailman id 904750;
 Fri, 07 Mar 2025 09:01:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tqTZw-00062X-Lz
 for xen-devel@lists.xenproject.org; Fri, 07 Mar 2025 09:01:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqTZw-006tul-0M;
 Fri, 07 Mar 2025 09:01:11 +0000
Received: from [2a02:8012:3a1:0:9517:10f4:44fb:20af]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tqTZv-00C8Qh-1w;
 Fri, 07 Mar 2025 09:01:11 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Gi2H+Z6LnQa9RXh6kXivv8rTJXUPkDXRWWOVXCADnBQ=; b=rNpKUrwe+c4KwTUDTUfXHQsrrE
	NSKXi4EWSJg/Kv4IP0sAVpw8mRVz3xQ4n0ypbTfE+8LAeYDOLae5M4xOlhrpjF31hmActWeiWTBEC
	BvbJi1QdVJybskuWjrqTRf5p4ybgCfQc26S6/mACTNKYX7w9N3dtlvh108wiUatUoGQw=;
Message-ID: <254e38d3-ebc2-4044-9d0f-9be9f652c46c@xen.org>
Date: Fri, 7 Mar 2025 09:01:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/23] xen/arm: Add capabilities to dom0less
Content-Language: en-GB
To: Jason Andryuk <jason.andryuk@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
 <20250306220343.203047-6-jason.andryuk@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250306220343.203047-6-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/03/2025 22:03, Jason Andryuk wrote:
> Add capabilities property to dom0less to allow building a
> disaggregated system.
> 
> Introduce bootfdt.h to contain these constants.
> 
> When using the hardware or xenstore capabilities, adjust the grant and
> event channel limits similar to dom0.
 > > Also for the hardware domain, set directmap and iommu.  This brings its
> configuration in line with a dom0.

Looking the device tree bindings, a user would be allowed to disable 
"passthrough" or even "directmap". This means, we would never be able to 
disable "directmap" for the hardware domain in the future with the 
existing property (this is to avoid break backwards compatibility).

Instead, I think we should check what the user provided and confirm this 
is matching our expectation for an hardware domain.

That said, I am not entirely sure why we should force directmap for the 
HW domain. We are starting from a clean slate, so I think it would be 
better to have by default no directmap and imposing the presence of an 
IOMMU in the system.

Lastly, can you provide an example of what the hardware domain DT node 
would looke like?

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
 > --->   docs/misc/arm/device-tree/booting.txt | 11 ++++++++++
>   xen/arch/arm/dom0less-build.c         | 29 +++++++++++++++++++++++++++
>   xen/arch/arm/domain.c                 |  3 ++-
>   xen/include/public/bootfdt.h          | 27 +++++++++++++++++++++++++
>   4 files changed, 69 insertions(+), 1 deletion(-)
>   create mode 100644 xen/include/public/bootfdt.h
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index ac781c9cc8..490c792ddf 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -167,6 +167,17 @@ with the following properties:
>       Refer to docs/misc/cache_coloring.rst for syntax. This option is applicable
>       only to Arm64 guests.
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
>   - vpl011
>   
>       An empty property to enable/disable a virtual pl011 for the guest to
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 5a7871939b..068bf99294 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -12,6 +12,7 @@
>   #include <xen/sizes.h>
>   #include <xen/vmap.h>
>   
> +#include <public/bootfdt.h>
>   #include <public/io/xs_wire.h>
>   
>   #include <asm/arm64/sve.h>
> @@ -994,6 +995,34 @@ void __init create_domUs(void)
>           if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
>               panic("No more domain IDs available\n");
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

What about d_cfg.arch.nr_spis? Are we expecting the user to pass "nr_spis"?

> +                flags |= CDF_hardware;
> +                flags |= CDF_directmap;
 > +                iommu = true;> +            }
> +
> +            if ( val & DOMAIN_CAPS_XENSTORE )
> +            {
> +                d_cfg.flags |= XEN_DOMCTL_CDF_xs_domain;
> +                d_cfg.max_evtchn_port = -1;
> +            }
> +        }
> +
>           if ( dt_find_property(node, "xen,static-mem", NULL) )
>           {
>               if ( llc_coloring_enabled )
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 3ba959f866..dc4b4e84c1 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -608,7 +608,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>   {
>       unsigned int max_vcpus;
>       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
> -    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu);
> +    unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
> +                                   XEN_DOMCTL_CDF_xs_domain );
>       unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
>   
>       if ( (config->flags & ~flags_optional) != flags_required )
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
> +
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

-- 
Julien Grall


