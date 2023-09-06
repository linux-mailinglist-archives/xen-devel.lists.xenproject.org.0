Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA947932E4
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 02:28:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595932.929621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgOu-00009U-0P; Wed, 06 Sep 2023 00:28:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595932.929621; Wed, 06 Sep 2023 00:28:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdgOt-00006f-U5; Wed, 06 Sep 2023 00:28:07 +0000
Received: by outflank-mailman (input) for mailman id 595932;
 Wed, 06 Sep 2023 00:28:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DwRh=EW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qdgOs-00006Z-RE
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 00:28:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3eb53efe-4c4c-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 02:28:05 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 729FC60EE9;
 Wed,  6 Sep 2023 00:28:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20259C433C7;
 Wed,  6 Sep 2023 00:28:03 +0000 (UTC)
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
X-Inumbo-ID: 3eb53efe-4c4c-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693960083;
	bh=DJqpuFo8h2Mz2UY/Yq0L1CMErw0s+oQmpLr4GuldxoE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=nuAcB43W00gkqLA83YCmM7cXkxsslKHbzTK90hHeNemlSMuBeMerk1+t4HYdMJgcB
	 83P6GFvZZkpGsqEVx9/rELKnS48I2hqPzc0at9rrIqeko2yuxxHPLJQuEFPxW6Cc4B
	 /55HijsimIBeiEu5C1Tft6SLAROY8PDmgO8Goitpguz44EdGqN78XMoBeN7jrx734P
	 E5LpPBMQJiY35qiQFUpcbfCG4AWqm0Lm13X5TUA4SHxuO8jrYTi157eFPMjASN5Q98
	 DtH2G9zotHM9pQWBv90M24K14jss8Wns4KZxiyfHfLUzfZkgq4s2IZIUY5M9GtTmyT
	 wsFInjKzWlMZA==
Date: Tue, 5 Sep 2023 17:28:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Vikram Garhwal <vikram.garhwal@amd.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, michal.orzel@amd.com, 
    sstabellini@kernel.org
Subject: Re: [XEN][PATCH v11 09/20] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
In-Reply-To: <20230901045947.32351-10-vikram.garhwal@amd.com>
Message-ID: <alpine.DEB.2.22.394.2309051727490.6458@ubuntu-linux-20-04-desktop>
References: <20230901045947.32351-1-vikram.garhwal@amd.com> <20230901045947.32351-10-vikram.garhwal@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 31 Aug 2023, Vikram Garhwal wrote:
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_locked().
> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign. Follow-up
> patches in this series introduces node add/remove feature.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>



> ---
> Changes from v10:
>     Move spin_lock before iommu_dt_device_is_assigned_locked() call.
>     Rebase the patch with latest Xen.
> Changes from v9:
>     Make iommu_dt_device_is_assigned_locked() static and delete header.
>     Move dtdevs_lock before iommu_dt_device_is_assigned_locked().
> Changes from v7:
>     Update commit message.
>     Add ASSERT().
> ---
> ---
>  xen/drivers/passthrough/device_tree.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 3c0322c797..a7d86a20a0 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -83,16 +83,16 @@ fail:
>      return rc;
>  }
>  
> -static bool iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +static bool iommu_dt_device_is_assigned_locked(const struct dt_device_node *dev)
>  {
>      bool assigned = false;
>  
> +    ASSERT(spin_is_locked(&dtdevs_lock));
> +
>      if ( !dt_device_is_protected(dev) )
>          return 0;
>  
> -    spin_lock(&dtdevs_lock);
>      assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
>  
>      return assigned;
>  }
> @@ -225,12 +225,16 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>  
>          if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>          {
> -            if ( iommu_dt_device_is_assigned(dev) )
> +            spin_lock(&dtdevs_lock);
> +
> +            if ( iommu_dt_device_is_assigned_locked(dev) )
>              {
>                  printk(XENLOG_G_ERR "%s already assigned.\n",
>                         dt_node_full_name(dev));
>                  ret = -EINVAL;
>              }
> +
> +            spin_unlock(&dtdevs_lock);
>              break;
>          }
>  
> -- 
> 2.17.1
> 

