Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3962451E2F2
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:17:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323515.545224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn946-00015r-Rj; Sat, 07 May 2022 01:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323515.545224; Sat, 07 May 2022 01:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn946-00011A-NG; Sat, 07 May 2022 01:16:58 +0000
Received: by outflank-mailman (input) for mailman id 323515;
 Sat, 07 May 2022 01:16:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8wy-00045S-RD
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:09:36 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5bf8543f-cda2-11ec-a406-831a346695d4;
 Sat, 07 May 2022 03:09:36 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F3D3461E61;
 Sat,  7 May 2022 01:09:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09109C385A9;
 Sat,  7 May 2022 01:09:33 +0000 (UTC)
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
X-Inumbo-ID: 5bf8543f-cda2-11ec-a406-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885774;
	bh=aA4C8jSkYdAJjgPPvopg2ZqZSMeGrTrWfX/13ovueJk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hAfipu8E7PfevwDKq7eGsQzWAGrUlw55IfqWmCgTUqK+hCOid46uROIebGxuYFm3J
	 6ZFMOVwfhGaWu4TO98jrVjbZqTppdHyYuUZvlGVexChbo/utVyoE++3kl/0Jc51fU5
	 DckWXvc2UOURo9x9RC3krNG0zXiRH2hZ/Tfim5DzycUaBRTILyIwiMVKJzRhCLdvVZ
	 fr1iCS7WypeE00wyHaq8TwhYsXnV7+R+6hvENAPqRiTOrfPrWNR7wXnMJ+w7RrVHmI
	 swYS5UT0S35Q6kVqxjCXY4RJMwT2/1sr2WE6pOpXFfepL+uyYbxvuN37YxDSyzzJty
	 74+ygOJpYJ/TQ==
Date: Fri, 6 May 2022 18:09:33 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 9/9] xen/arm: enable statically shared memory on
 Dom0
In-Reply-To: <20220506072502.2177828-10-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061807290.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-10-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> To add statically shared memory nodes in Dom0, user shall put according
> static shared memory configuration under /chosen node.
> 
> This commit adds shm-processing function process_shm in construct_dom0
> to enable statically shared memory on Dom0.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v2 change:
> - no change
> ---
>  xen/arch/arm/domain_build.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f08606d2c0..9da0a0c88b 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2628,6 +2628,11 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>              if ( res )
>                  return res;
>          }
> +
> +        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
> +                                    d->arch.shm_mem);
> +        if ( res )
> +            return res;
>      }
>  
>      res = fdt_end_node(kinfo->fdt);
> @@ -3639,6 +3644,9 @@ static int __init construct_dom0(struct domain *d)
>  {
>      struct kernel_info kinfo = {};
>      int rc;
> +#ifdef CONFIG_STATIC_SHM
> +    const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
> +#endif
>  
>      /* Sanity! */
>      BUG_ON(d->domain_id != 0);
> @@ -3673,6 +3681,12 @@ static int __init construct_dom0(struct domain *d)
>      allocate_memory_11(d, &kinfo);
>      find_gnttab_region(d, &kinfo);
>  
> +#ifdef CONFIG_STATIC_SHM
> +    rc = process_shm(d, chosen);
> +    if ( rc < 0 )
> +        return rc;
> +#endif
> +
>      /* Map extra GIC MMIO, irqs and other hw stuffs to dom0. */
>      rc = gic_map_hwdom_extra_mappings(d);
>      if ( rc < 0 )
> -- 
> 2.25.1
> 

