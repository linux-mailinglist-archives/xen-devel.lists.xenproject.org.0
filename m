Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A28932FDA39
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jan 2021 20:57:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71732.128701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jb3-00027d-7o; Wed, 20 Jan 2021 19:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71732.128701; Wed, 20 Jan 2021 19:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Jb3-00027E-4g; Wed, 20 Jan 2021 19:56:53 +0000
Received: by outflank-mailman (input) for mailman id 71732;
 Wed, 20 Jan 2021 19:56:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0VeX=GX=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l2Jb1-000279-Lx
 for xen-devel@lists.xenproject.org; Wed, 20 Jan 2021 19:56:51 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e0682eff-c1f9-4764-8d31-a236027004ec;
 Wed, 20 Jan 2021 19:56:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A73012343E;
 Wed, 20 Jan 2021 19:56:49 +0000 (UTC)
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
X-Inumbo-ID: e0682eff-c1f9-4764-8d31-a236027004ec
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611172610;
	bh=PPsE1PNc6ro+lfHP+Fy8znBu6Qo9KnM1gYSYJbNdlog=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Zp3x2J4L3eP8BgtVsgKg4qH7XO5lxinNHbbO6+8kE+T7X8RF25PCdW1uBQ9WSWlNP
	 IrD+rwzdwP3BCgrhYRzoPThMtFoMX1m8Ta8sYLxeAwfqJMVJdgHZlasHacwNfNYvg5
	 zV+xLFj+kaD8xjaQGajjMUWsuP+xb1b5nx22T5mkuqvZeP/ftKFxVOzyiMGgy4t7of
	 rP+PG0RwfY73k3XAzJIeUcENACinKY+0H7K8uCQ2aw48Hgf94cTIG/YoUdv1rTuzUg
	 BDbawiPT1CYURlfJDntBuEuGjpErywn4f05YfWYOhygxsFzNpvJrjjOlWuwHfkiTtS
	 H/ciNrpuQvV3g==
Date: Wed, 20 Jan 2021 11:56:48 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 08/10] xen/arm: smmuv3: Use fallthrough
 pseudo-keyword
In-Reply-To: <c392bcf9f3a4d22b0e67240d52498c719ff3a3a6.1611153615.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101201156410.14528@sstabellini-ThinkPad-T480s>
References: <cover.1611153615.git.rahul.singh@arm.com> <c392bcf9f3a4d22b0e67240d52498c719ff3a3a6.1611153615.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Jan 2021, Rahul Singh wrote:
> Backport commit df561f6688fef775baa341a0f5d960becd248b11
> "treewide: Use fallthrough pseudo-keyword" from Linux kernel.
> 
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes since v3:
>  - This patch is introduce in this version.
> Changes since v4:
>  - Add more information about the merged patch in commit message.
> ---
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 5ce14850b4..f5f8b4c981 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -932,7 +932,6 @@ static void arm_smmu_cmdq_skip_err(struct arm_smmu_device *smmu)
>  		 */
>  		return;
>  	case CMDQ_ERR_CERROR_ILL_IDX:
> -		/* Fallthrough */
>  	default:
>  		break;
>  	}
> @@ -2488,7 +2487,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
>  	case IDR0_STALL_MODEL_FORCE:
>  		smmu->features |= ARM_SMMU_FEAT_STALL_FORCE;
> -		/* Fallthrough */
> +		fallthrough;
>  	case IDR0_STALL_MODEL_STALL:
>  		smmu->features |= ARM_SMMU_FEAT_STALLS;
>  	}
> @@ -2505,7 +2504,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	switch (FIELD_GET(IDR0_TTF, reg)) {
>  	case IDR0_TTF_AARCH32_64:
>  		smmu->ias = 40;
> -		/* Fallthrough */
> +		fallthrough;
>  	case IDR0_TTF_AARCH64:
>  		break;
>  	default:
> @@ -2589,7 +2588,7 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	default:
>  		dev_info(smmu->dev,
>  			"unknown output address size. Truncating to 48-bit\n");
> -		/* Fallthrough */
> +		fallthrough;
>  	case IDR5_OAS_48_BIT:
>  		smmu->oas = 48;
>  	}
> -- 
> 2.17.1
> 

