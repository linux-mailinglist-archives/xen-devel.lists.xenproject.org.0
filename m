Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 480C42CB1B6
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 01:53:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42380.76185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkGOO-0005tM-Hq; Wed, 02 Dec 2020 00:53:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42380.76185; Wed, 02 Dec 2020 00:53:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkGOO-0005sx-Em; Wed, 02 Dec 2020 00:53:12 +0000
Received: by outflank-mailman (input) for mailman id 42380;
 Wed, 02 Dec 2020 00:53:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GudV=FG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kkGOM-0005sr-Vi
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 00:53:11 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f26849cc-d071-499e-b574-868124b061c6;
 Wed, 02 Dec 2020 00:53:10 +0000 (UTC)
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
X-Inumbo-ID: f26849cc-d071-499e-b574-868124b061c6
Date: Tue, 1 Dec 2020 16:53:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606870389;
	bh=OmOkv6OlLSNdNNR7uZFMySdRTYxoaJ1PrG4gWM3K9yU=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=TUFYlXdbdyn4TqOfEdrBpfaSLAPkw/4p0N7+qZDSDr/nUDvq4EOFpZulc5ZoRcX3c
	 xEb9vdgwaTD+UeoR9Q5KBrm7KtHAWqYfIAl4kssJkW7tDge5oJl8ZvaVVq5mShfjpI
	 vGUf2DfjlqBYLS6pyZZ4p32PKY/6vIp1FbxsT7X0=
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 6/8] xen/arm: Remove support for Stage-1 translation
 on SMMUv3.
In-Reply-To: <29d40e76341983b175250b71e7b7a290895effd0.1606406359.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2012011645170.1100@sstabellini-ThinkPad-T480s>
References: <cover.1606406359.git.rahul.singh@arm.com> <29d40e76341983b175250b71e7b7a290895effd0.1606406359.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 26 Nov 2020, Rahul Singh wrote:
> Linux SMMUv3 driver supports both Stage-1 and Stage-2 translations.
> As of now only Stage-2 translation support has been tested.
> 
> Once Stage-1 translation support is tested this patch can be added.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

[...]


> @@ -1871,19 +1476,9 @@ static int arm_smmu_domain_finalise(struct iommu_domain *domain,
>  	}
>  
>  	/* Restrict the stage to what we can actually support */
> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S1))
> -		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> -	if (!(smmu->features & ARM_SMMU_FEAT_TRANS_S2))
> -		smmu_domain->stage = ARM_SMMU_DOMAIN_S1;
> +	smmu_domain->stage = ARM_SMMU_DOMAIN_S2;

It would be good to add an helpful error message if
ARM_SMMU_FEAT_TRANS_S2 is missing.


>  	switch (smmu_domain->stage) {
> -	case ARM_SMMU_DOMAIN_S1:
> -		ias = (smmu->features & ARM_SMMU_FEAT_VAX) ? 52 : 48;
> -		ias = min_t(unsigned long, ias, VA_BITS);
> -		oas = smmu->ias;
> -		fmt = ARM_64_LPAE_S1;
> -		finalise_stage_fn = arm_smmu_domain_finalise_s1;
> -		break;
>  	case ARM_SMMU_DOMAIN_NESTED:
>  	case ARM_SMMU_DOMAIN_S2:
>  		ias = smmu->ias;

