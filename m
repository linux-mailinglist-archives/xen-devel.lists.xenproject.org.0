Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 578B25ABB18
	for <lists+xen-devel@lfdr.de>; Sat,  3 Sep 2022 01:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397956.638690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUFuS-0003aD-PC; Fri, 02 Sep 2022 23:17:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397956.638690; Fri, 02 Sep 2022 23:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oUFuS-0003XB-MI; Fri, 02 Sep 2022 23:17:12 +0000
Received: by outflank-mailman (input) for mailman id 397956;
 Fri, 02 Sep 2022 23:17:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WoFT=ZF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oUFuR-0003X5-A5
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 23:17:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5dbe5ce5-2b15-11ed-934f-f50d60e1c1bd;
 Sat, 03 Sep 2022 01:17:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 55D0261F93;
 Fri,  2 Sep 2022 23:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E25AC433D6;
 Fri,  2 Sep 2022 23:17:07 +0000 (UTC)
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
X-Inumbo-ID: 5dbe5ce5-2b15-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662160627;
	bh=R/leICqXMaRFl4+rtbRuInm1Ze9Hvu1lK1dELb6O9ZQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Xi5WAFPt2G+jaBzAdQiaJD+BXIxBO3yvGVIEvlpEMk1/dyP/OQ63q4amSvVU1cZx3
	 QRqtJ9ns3F0sCO5fasrPPFZFcZoxiyj0/YcNMcsAUecDvCbITQdWM+7g6Zwbxwf7Ip
	 F9P3AlEPP2UTlUhH9M6ORSywH+w0xUCkIuhZOusrum9sxvXLRwTFSU/H4xmu7qqTkl
	 y8PZ+phvuzsof9EVkYKl/aibeMwNcV6nXebNtmckfAhSMw3yJ3eaQvvRz5nCrZL1pS
	 M9lTMZBJcpbRqEE6u2ZYBu5GKiDpt3US8gd2v3fPoTIARRFESTyH5ZeuYflj6nWbXX
	 e119bMBF6+hdA==
Date: Fri, 2 Sep 2022 16:17:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Robin Murphy <robin.murphy@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 05/10] xen/arm: smmuv3: Remove the page 1 fixup
In-Reply-To: <5f6f8233ee5c27082aec27dfc06c6f600f0c5d55.1662123432.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209021616560.3931@ubuntu-linux-20-04-desktop>
References: <cover.1662123432.git.rahul.singh@arm.com> <5f6f8233ee5c27082aec27dfc06c6f600f0c5d55.1662123432.git.rahul.singh@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 2 Sep 2022, Rahul Singh wrote:
> From: Robin Murphy <robin.murphy@arm.com>
> 
> Backport Linux commit 86d2d9214880. This is the clean backport without
> any changes.
> 
> Since we now keep track of page 1 via a separate pointer that
> already encapsulates aliasing to page 0 as necessary, we can remove
> the clunky fixup routine and simply use the relevant bases directly.
> The current architecture spec (IHI0070D.a) defines
> SMMU_{EVENTQ,PRIQ}_{PROD,CONS} as offsets relative to page 1, so the
> cleanup represents a little bit of convergence as well as just
> lines of code saved.
> 
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> Origin: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 86d2d9214880
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v2:
>  - fix commit msg.
> ---
>  xen/drivers/passthrough/arm/smmu-v3.c | 42 ++++++++++-----------------
>  xen/drivers/passthrough/arm/smmu-v3.h |  8 ++---
>  2 files changed, 20 insertions(+), 30 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 85ad066266..f5485a8a1c 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -235,15 +235,6 @@ static struct arm_smmu_option_prop arm_smmu_options[] = {
>  	{ 0, NULL},
>  };
>  
> -static inline void __iomem *arm_smmu_page1_fixup(unsigned long offset,
> -						 struct arm_smmu_device *smmu)
> -{
> -	if (offset > SZ_64K)
> -		return smmu->page1 + offset - SZ_64K;
> -
> -	return smmu->base + offset;
> -}
> -
>  static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
>  {
>  	return container_of(dom, struct arm_smmu_domain, domain);
> @@ -1578,6 +1569,7 @@ static int arm_smmu_dt_xlate(struct device *dev,
>  /* Probing and initialisation functions */
>  static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  				   struct arm_smmu_queue *q,
> +				   void __iomem *page,
>  				   unsigned long prod_off,
>  				   unsigned long cons_off,
>  				   size_t dwords, const char *name)
> @@ -1606,8 +1598,8 @@ static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>  			 1 << q->llq.max_n_shift, name);
>  	}
>  
> -	q->prod_reg	= arm_smmu_page1_fixup(prod_off, smmu);
> -	q->cons_reg	= arm_smmu_page1_fixup(cons_off, smmu);
> +	q->prod_reg	= page + prod_off;
> +	q->cons_reg	= page + prod_off;

In the original patch it was:

-	q->prod_reg	= arm_smmu_page1_fixup(prod_off, smmu);
-	q->cons_reg	= arm_smmu_page1_fixup(cons_off, smmu);
+	q->prod_reg	= page + prod_off;
+	q->cons_reg	= page + cons_off;

Specifically the second line seems to be wrong here?

