Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4B586D70D
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 23:53:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687436.1070884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpH7-0007gf-03; Thu, 29 Feb 2024 22:53:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687436.1070884; Thu, 29 Feb 2024 22:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfpH6-0007df-Tl; Thu, 29 Feb 2024 22:53:12 +0000
Received: by outflank-mailman (input) for mailman id 687436;
 Thu, 29 Feb 2024 22:53:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nI6L=KG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rfpH5-0007dZ-Ha
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 22:53:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4e8cebce-d755-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 23:53:09 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 28C6161197;
 Thu, 29 Feb 2024 22:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20759C433C7;
 Thu, 29 Feb 2024 22:53:06 +0000 (UTC)
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
X-Inumbo-ID: 4e8cebce-d755-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709247187;
	bh=NVZDVOMLAvwc6g/HzbqmjqBYrtUoqn5EaPnD89cGTr0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=rj37OqQNLti3RD2T/wtUKfFq9C6jUZ17fp9mDmSplXm8OKsFVlF9iJkkQXce5Z+ya
	 EXnW8Gmrh7CjVeRFXBOovYhsjJCEJQb1y65N822DFT7nVVVbIVO5s5wju4rJVtN65d
	 kMbaVF7ztQOSDHwKOk4bo8vPwigi+7O7ceW1yNAKu7TAslJKf09Dfk/riJP1uKh1h6
	 iViMlT5yUZvd3uXanuVy+y6lXPYxcOXWum5jhvKRbDXWreScJIDd0ij2uqptHsxkQo
	 F9U6GYYh85RKIfqx+H+2w9NHYGlfZZIq1dW6OeJzOu+a9JB4FRoBFaYerFKGNX/9p8
	 UeoNRQlvkaXiw==
Date: Thu, 29 Feb 2024 14:53:04 -0800 (PST)
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
Message-ID: <alpine.DEB.2.22.394.2402291451390.853156@ubuntu-linux-20-04-desktop>
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

this is OK


> @@ -627,7 +627,7 @@ struct arm_smmu_master_cfg {
>  };
>  #define INVALID_SMENDX			-1
>  #define for_each_cfg_sme(cfg, i, idx, num) \
> -	for (i = 0; idx = cfg->smendx[i], i < num; ++i)
> +	for (i = 0; idx = (cfg)->smendx[i], (i) < (num); ++(i))

The first i = 0 is missing parentheses?
Also idx misses parentheses?

