Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF198745A4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 02:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689606.1074751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri2bN-0000Vf-Bc; Thu, 07 Mar 2024 01:31:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689606.1074751; Thu, 07 Mar 2024 01:31:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ri2bN-0000TU-7u; Thu, 07 Mar 2024 01:31:17 +0000
Received: by outflank-mailman (input) for mailman id 689606;
 Thu, 07 Mar 2024 01:31:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nvJe=KN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1ri2bM-0000TO-4L
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 01:31:16 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60a95a80-dc22-11ee-afda-a90da7624cb6;
 Thu, 07 Mar 2024 02:31:12 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 5ABADCE1E7D;
 Thu,  7 Mar 2024 01:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4828C433C7;
 Thu,  7 Mar 2024 01:31:06 +0000 (UTC)
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
X-Inumbo-ID: 60a95a80-dc22-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709775068;
	bh=T5FPfb3bOwQwaxZ89tvSdalPvMidkFRd8A4ARsLFe9M=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Gp7LErzAqZICGdof/gxR2NVw2QFjoj1Ir6prBrFbE07dT2b+RJxLmkyk1VrWSxskJ
	 MvIulL4VXr7p6PfrWgxw1WJh33fr+yGpkw/5VQ+n+Me3OUFp3pEc9q4znD0AktNxsq
	 Q2dFT/O2QraaK0TewO97y9hUyQkm366AwaBc0WTP30vi0/xx6RBjustWXMMtsaPgkX
	 VVQZ0+pJAMmRDwcZfZLtk1S9YXBKWveow5JXmIJM2JP20UXdsyVWfiveIGbdlMuKRv
	 LOuCoVFHT6V3TB9suCWYd6zVzM7uAiAPOahKN5U6yPYwKkgkkEYoZ8E852M493JrMu
	 HTZ1QVfEX9bwg==
Date: Wed, 6 Mar 2024 17:31:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, bertrand.marquis@arm.com, julien@xen.org, 
    Rahul Singh <rahul.singh@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH 06/10] arm/smmu: address some violations of MISRA C
 Rule 20.7
In-Reply-To: <8bbf294d832b973648e84e5d837b1878a84f7645.1709219010.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403061730570.853156@ubuntu-linux-20-04-desktop>
References: <cover.1709219010.git.nicola.vetrini@bugseng.com> <8bbf294d832b973648e84e5d837b1878a84f7645.1709219010.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 29 Feb 2024, Nicola Vetrini wrote:
> MISRA C Rule 20.7 states: "Expressions resulting from the expansion
> of macro parameters shall be enclosed in parentheses". Therefore, some
> macro definitions should gain additional parentheses to ensure that all
> current and future users will be safe with respect to expansions that
> can possibly alter the semantics of the passed-in macro parameter.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/smmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 625ed0e41961..83196057a937 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -242,7 +242,7 @@ struct arm_smmu_xen_device {
>  	struct iommu_group *group;
>  };
>  
> -#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->iommu)
> +#define dev_archdata(dev) ((struct arm_smmu_xen_device *)(dev)->iommu)
>  #define dev_iommu_domain(dev) (dev_archdata(dev)->domain)
>  #define dev_iommu_group(dev) (dev_archdata(dev)->group)
>  
> @@ -627,7 +627,7 @@ struct arm_smmu_master_cfg {
>  };
>  #define INVALID_SMENDX			-1
>  #define for_each_cfg_sme(cfg, i, idx, num) \
> -	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
> +	for (i = 0; idx = (cfg)->smendx[i], (i) < (num); ++(i))
>  
>  struct arm_smmu_master {
>  	struct device_node		*of_node;
> -- 
> 2.34.1
> 

