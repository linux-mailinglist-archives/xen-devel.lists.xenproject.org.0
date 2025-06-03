Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 705B1ACC33A
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jun 2025 11:36:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1004134.1383787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMO4b-0006PD-9y; Tue, 03 Jun 2025 09:36:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1004134.1383787; Tue, 03 Jun 2025 09:36:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uMO4b-0006Mq-6d; Tue, 03 Jun 2025 09:36:45 +0000
Received: by outflank-mailman (input) for mailman id 1004134;
 Tue, 03 Jun 2025 09:36:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uMO4a-0006Mk-1S
 for xen-devel@lists.xenproject.org; Tue, 03 Jun 2025 09:36:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMO4Z-0008hT-1I;
 Tue, 03 Jun 2025 09:36:43 +0000
Received: from [15.248.2.27] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uMO4Z-004HHp-28;
 Tue, 03 Jun 2025 09:36:43 +0000
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
	bh=DkijHugA+INbBoxV3J52WjLjHR6B+AnfqsRfYep582w=; b=ifxtjq3tjLra1ow/iREYhJKdnY
	YkKATISr2Tsm75gDM3HN4Mot/La9VCnNvs0kvE283VnNkB3ebjxrsl2ihdRIyIUpMEcenNf5JmI4f
	7VHsdVnLbaymH/ASOoav6/i8IqUNPXMrpyJ9u3emu1Up0cX3zFQo11OfFFMOqYCjXSPM=;
Message-ID: <b0e9ef87-e786-4237-bcc1-14058a2236a9@xen.org>
Date: Tue, 3 Jun 2025 10:36:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] xen/arm: Add way to disable traps on accesses to
 unmapped addresses
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com,
 edgar.iglesias@amd.com, Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20250530134559.1434255-1-edgar.iglesias@gmail.com>
 <20250530134559.1434255-2-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250530134559.1434255-2-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 30/05/2025 14:45, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add a per-domain way to optionally disable traps for accesses
> to unmapped addresses.
> 
> The domain flag is general but it's only implemented for ARM for now.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   tools/libs/light/libxl_arm.c  |  3 +++
>   xen/arch/arm/dom0less-build.c |  3 +++
>   xen/arch/arm/domain.c         |  3 ++-
>   xen/arch/arm/domain_build.c   |  3 ++-
>   xen/arch/arm/io.c             | 37 +++++++++++++++++++++++++++++++++--
>   xen/common/domain.c           |  3 ++-
>   xen/include/public/domctl.h   |  4 +++-
>   7 files changed, 50 insertions(+), 6 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index 75c811053c..9530996e72 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -233,6 +233,9 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
>           config->arch.sve_vl = d_config->b_info.arch_arm.sve_vl / 128U;
>       }
>   
> +    /* Trap accesses to unmapped areas. */
> +    config->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> +
>       return 0;
>   }
>   
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index a49764f0ad..a4e0a33632 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -343,6 +343,9 @@ void __init arch_create_domUs(struct dt_device_node *node,
>           panic("'sve' property found, but CONFIG_ARM64_SVE not selected\n");
>   #endif
>       }
> +
> +    /* Trap accesses to unmapped areas. */
> +    d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
>   }
>   
>   int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 45aeb8bddc..be58a23dd7 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -612,7 +612,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>       unsigned int max_vcpus;
>       unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>       unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
> -                                   XEN_DOMCTL_CDF_xs_domain );
> +                                   XEN_DOMCTL_CDF_xs_domain |
> +                                   XEN_DOMCTL_CDF_trap_unmapped_accesses );

Just to double check, doesn't this mean the flag will be allowed on x86? 
If so, shouldn't we reject it in an arch?

Cheers,

-- 
Julien Grall


