Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C934B7F13
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 05:01:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273654.468903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKBVI-0003Sw-Pm; Wed, 16 Feb 2022 04:01:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273654.468903; Wed, 16 Feb 2022 04:01:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKBVI-0003QU-MY; Wed, 16 Feb 2022 04:01:20 +0000
Received: by outflank-mailman (input) for mailman id 273654;
 Wed, 16 Feb 2022 04:01:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gZM=S7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nKBVI-0003QO-0F
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 04:01:20 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16d2ad0e-8edd-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 05:01:18 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 599DDCE2422;
 Wed, 16 Feb 2022 04:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BE83C004E1;
 Wed, 16 Feb 2022 04:01:13 +0000 (UTC)
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
X-Inumbo-ID: 16d2ad0e-8edd-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644984073;
	bh=aLnkCMNhpAZFVqWPI81tWpFZcIhwIeUbovv+xTHVwGo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dO/BEeEFgfogH9UTPoJZdcDy3gi+pr63hn5ynj+MfpufCEquMcnj16y2V13YMshp4
	 3vV50qTF1SCpXkcV7UGGezhiUtg5UdAL6fmdktV08+YLw7L4oMizm3zneI9bU8o23+
	 lpqXMANhln+sM8qoM1P18NwHSv221VzU6GFStKUQLAA5LU+ixTFM/boNEqe/dE4Mvl
	 8ukrG6qsyQdDFPqE+xSuwJqbdBVFJhPYdAtcTYSx1jMDktIBsEjF09Q+pnKuDKRYId
	 Waq33NCl7yjslMKOD5EGmu9NbCvbnw34xARYBiYCTAT2aQI3IFkzR8qzNsc13a6MOn
	 EvzxB9sGnZrew==
Date: Tue, 15 Feb 2022 20:01:13 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 5/5] arm/dom0less: assign dom0less guests to cpupools
In-Reply-To: <20220215101551.23101-6-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2202151847440.43738@ubuntu-linux-20-04-desktop>
References: <20220215101551.23101-1-luca.fancellu@arm.com> <20220215101551.23101-6-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Feb 2022, Luca Fancellu wrote:
> Introduce domain-cpupool property of a xen,domain device tree node,
> that specifies the cpupool device tree handle of a xen,cpupool node
> that identifies a cpupool created at boot time where the guest will
> be assigned on creation.
> 
> Add member to the xen_arch_domainconfig public interface so the
> XEN_DOMCTL_INTERFACE_VERSION version is bumped.
> 
> Update documentation about the property.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  docs/misc/arm/device-tree/booting.txt | 5 +++++
>  xen/arch/arm/domain.c                 | 6 ++++++
>  xen/arch/arm/domain_build.c           | 9 ++++++++-
>  xen/arch/x86/domain.c                 | 6 ++++++
>  xen/common/domain.c                   | 5 ++++-
>  xen/include/public/arch-arm.h         | 2 ++
>  xen/include/public/domctl.h           | 2 +-
>  xen/include/xen/domain.h              | 3 +++
>  8 files changed, 35 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 71895663a4de..0f1f210fa449 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -182,6 +182,11 @@ with the following properties:
>      Both #address-cells and #size-cells need to be specified because
>      both sub-nodes (described shortly) have reg properties.
>  
> +- domain-cpupool
> +
> +    Optional. Handle to a xen,cpupool device tree node that identifies the
> +    cpupool where the guest will be started at boot.
> +
>  Under the "xen,domain" compatible node, one or more sub-nodes are present
>  for the DomU kernel and ramdisk.
>  
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 92a6c509e5c5..be350b28b588 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -788,6 +788,12 @@ fail:
>      return rc;
>  }
>  
> +unsigned int
> +arch_get_domain_cpupool_id(const struct xen_domctl_createdomain *config)
> +{
> +    return config->arch.cpupool_id;
> +}
> +
>  void arch_domain_destroy(struct domain *d)
>  {
>      /* IOMMU page table is shared with P2M, always call
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6931c022a2e8..4f239e756775 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3015,7 +3015,8 @@ static int __init construct_domU(struct domain *d,
>  void __init create_domUs(void)
>  {
>      struct dt_device_node *node;
> -    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
> +    const struct dt_device_node *cpupool_node,
> +                                *chosen = dt_find_node_by_path("/chosen");
>  
>      BUG_ON(chosen == NULL);
>      dt_for_each_child_node(chosen, node)
> @@ -3053,6 +3054,12 @@ void __init create_domUs(void)
>                                           GUEST_VPL011_SPI - 32 + 1);
>          }
>  
> +        /* Get the optional property domain-cpupool */
> +        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
> +        if ( cpupool_node )
> +            dt_property_read_u32(cpupool_node, "cpupool-id",
> +                                 &d_cfg.arch.cpupool_id);

Is this the reason to make "cpupool-id" mandatory in device tree? If so,
I think we can avoid it. Instead, we could:

- generate the cpupool-id in xen/arch/arm/cpupool.c
- keep track of cpupool-id <--> "cpupool name", where "cpupool name"
  is the node name in device tree (sibling node names are unique in
  device tree). (Alternatively we could use the phandle.) We could have
  a __initdata pool_names_map to convert cpupool names to cpupool-ids.
- here retrieve the cpupool_id from the cpupool node name


>          /*
>           * The variable max_init_domid is initialized with zero, so here it's
>           * very important to use the pre-increment operator to call
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index ef1812dc1402..3e3cf88c9c82 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -880,6 +880,12 @@ int arch_domain_create(struct domain *d,
>      return rc;
>  }
>  
> +unsigned int
> +arch_get_domain_cpupool_id(const struct xen_domctl_createdomain *config)
> +{
> +    return 0;
> +}
> +
>  void arch_domain_destroy(struct domain *d)
>  {
>      if ( is_hvm_domain(d) )
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 2048ebad86ff..d42ca8292025 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -665,6 +665,8 @@ struct domain *domain_create(domid_t domid,
>  
>      if ( !is_idle_domain(d) )
>      {
> +        unsigned int domain_cpupool_id;
> +
>          watchdog_domain_init(d);
>          init_status |= INIT_watchdog;
>  
> @@ -698,7 +700,8 @@ struct domain *domain_create(domid_t domid,
>          if ( !d->pbuf )
>              goto fail;
>  
> -        if ( (err = sched_init_domain(d, 0)) != 0 )
> +        domain_cpupool_id = arch_get_domain_cpupool_id(config);
> +        if ( (err = sched_init_domain(d, domain_cpupool_id)) != 0 )
>              goto fail;
>  
>          if ( (err = late_hwdom_init(d)) != 0 )
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 94b31511ddea..2c5d1ea7f01a 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -321,6 +321,8 @@ struct xen_arch_domainconfig {
>      uint16_t tee_type;
>      /* IN */
>      uint32_t nr_spis;
> +    /* IN */
> +    unsigned int cpupool_id;
>      /*
>       * OUT
>       * Based on the property clock-frequency in the DT timer node.
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index b85e6170b0aa..31ec083cb06e 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -38,7 +38,7 @@
>  #include "hvm/save.h"
>  #include "memory.h"
>  
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000014
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
>  
>  /*
>   * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
> diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
> index 160c8dbdab33..fb018871bc17 100644
> --- a/xen/include/xen/domain.h
> +++ b/xen/include/xen/domain.h
> @@ -63,6 +63,9 @@ void unmap_vcpu_info(struct vcpu *v);
>  int arch_domain_create(struct domain *d,
>                         struct xen_domctl_createdomain *config);
>  
> +unsigned int
> +arch_get_domain_cpupool_id(const struct xen_domctl_createdomain *config);
> +
>  void arch_domain_destroy(struct domain *d);
>  
>  void arch_domain_shutdown(struct domain *d);
> -- 
> 2.17.1
> 

