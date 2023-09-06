Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB57932E7
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:29:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595938.929632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgQS-0000j1-CY; Wed, 06 Sep 2023 00:29:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595938.929632; Wed, 06 Sep 2023 00:29:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgQS-0000fe-9S; Wed, 06 Sep 2023 00:29:44 +0000
Received: by outflank-mailman (input) for mailman id 595938;
 Wed, 06 Sep 2023 00:29:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgQQ-0000fT-EH
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:29:42 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 77b8c3ce-4c4c-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 02:29:41 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 08A5660EE9;
 Wed,  6 Sep 2023 00:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3D11C433C8;
 Wed,  6 Sep 2023 00:29:38 +0000 (UTC)
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
X-Inumbo-ID: 77b8c3ce-4c4c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693960179;
	bh=jNulyxO2TVUnYxpacu+NxB/vJ8JD69XG3eZPbh71uKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=LsqcVwf9nf6fYU0y51j5sa568wWi3BZW0iv4fHUDwyGHUZnUXH1Ac/ScM2ZcQj8zk
	 uSdUin68hUe0jrYi/KpeVtYe2mMJIISaBCmAqxiiJGi/cz3j/03+syr7FXs9hF54PL
	 CaNvXd2Ua/5/3LbRsvqGAiZeNjMpHVWQtY+n2PlEQ1N3VImkDwpsUFKEonmTCDZfVI
	 I12q2ZKP7j+HiEPTsFLO9mZNCTTrt/WkQyirxOGi6uZCc1zCPdLTpN24GbdmC4cZly
	 jNcfQf6fc+0OQDvealntQkxcAGRhto2F+MaYIt0CjFDYjZJXUrPWfMU8ebFV2ATsJ2
	 nLiGz5FEul9ig==
Date: Tue, 5 Sep 2023 17:29:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, michal.orzel@amd.com, 
    sstabellini@kernel.org
Subject: Re: [XEN][PATCH v11 10/20] xen/iommu: protect iommu_add_dt_device()
 with dtdevs_lock
In-Reply-To: <20230901045947.32351-11-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051729200.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-11-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Vikram Garhwal wrote:
> Protect iommu_add_dt_device() with dtdevs_lock to prevent concurrent access
> to add/remove/assign/deassign.
> With addition of dynamic programming feature(follow-up patches in this series),
> this function can be concurrently accessed by dynamic node add/remove using
> device tree overlays.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes from v7:
>         Update commit message and fix indent.
> ---
> ---
>  xen/drivers/passthrough/device_tree.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index a7d86a20a0..687c61e7da 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -147,6 +147,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>      if ( dev_iommu_fwspec_get(dev) )
>          return 0;
>  
> +    spin_lock(&dtdevs_lock);
> +
>      /*
>       * According to the Documentation/devicetree/bindings/iommu/iommu.txt
>       * from Linux.
> @@ -159,7 +161,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
>           * these callback implemented.
>           */
>          if ( !ops->add_device || !ops->dt_xlate )
> -            return -EINVAL;
> +        {
> +            rc = -EINVAL;
> +            goto fail;
> +        }
>  
>          if ( !dt_device_is_available(iommu_spec.np) )
>              break;
> @@ -190,6 +195,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>      if ( rc < 0 )
>          iommu_fwspec_free(dev);
>  
> + fail:
> +    spin_unlock(&dtdevs_lock);
>      return rc;
>  }
>  
> -- 
> 2.17.1
> 

