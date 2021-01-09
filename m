Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDB02EFCCD
	for <lists+xen-devel@lfdr.de>; Sat,  9 Jan 2021 02:45:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63958.113399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3JK-0008RU-3c; Sat, 09 Jan 2021 01:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63958.113399; Sat, 09 Jan 2021 01:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ky3JK-0008R3-0D; Sat, 09 Jan 2021 01:44:58 +0000
Received: by outflank-mailman (input) for mailman id 63958;
 Sat, 09 Jan 2021 01:44:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KEI1=GM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1ky3JI-0008QN-Pj
 for xen-devel@lists.xenproject.org; Sat, 09 Jan 2021 01:44:56 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3c8f33f0-5935-4864-8aee-d3c7aa76c862;
 Sat, 09 Jan 2021 01:44:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C488023A1E;
 Sat,  9 Jan 2021 01:44:54 +0000 (UTC)
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
X-Inumbo-ID: 3c8f33f0-5935-4864-8aee-d3c7aa76c862
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610156695;
	bh=LImtzh9L+28t8QGrCbjyYBQCHWo+LgWSdBK2ulvYEAo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CiXsavEH/8i6wAV8OzF3M2PI9PJ6AtbZZTlks7nyyFgzJdE2hFvb/NGYDH+Q0b+fv
	 q68fMyVLqGIGjAvAiT+D8hTv8A33lw5Il7jsHfRuwmRJBnkxW2TMcLISpqPtgsOIkq
	 If2cT/AL9T2IZ/OlFizeKa5zROJqgIOYHBA15XnRWW633m1YFVpQH6Vb1XXHuwSYBN
	 cAnUJMsMoJ2bFusWI5OWhX0pDqTsXVahFlQHw+70yRxNs9n2Yat64bUhB5fZ1aNwNw
	 PmpyF4C283ZvtfuviM1yYY85uPVQkfxnQoDaOfb3NDdaQAR5+PV7EA4nPg2j/RrPrN
	 5nSFcdJI1WmWQ==
Date: Fri, 8 Jan 2021 17:44:54 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v4 09/11] xen/arm: smmuv3: Use fallthrough
 pseudo-keyword
In-Reply-To: <36f9a1e88eea2f2c4cc413688c7210583a3433fe.1610115608.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2101081640190.26153@sstabellini-ThinkPad-T480s>
References: <cover.1610115608.git.rahul.singh@arm.com> <36f9a1e88eea2f2c4cc413688c7210583a3433fe.1610115608.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 8 Jan 2021, Rahul Singh wrote:
> Merge the patch from linux to use fallthrough pseudo-keyword.
> 
> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1]. Also, remove unnecessary
> fall-through markings when it is the case.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in V4:
>  - This patch is introduce in this verison.
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

The fallthrough keyword is unnecessary here because of default, right?


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

