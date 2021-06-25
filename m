Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68C3B4A5D
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jun 2021 00:01:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147435.271779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwtsd-0000Zh-Ae; Fri, 25 Jun 2021 22:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147435.271779; Fri, 25 Jun 2021 22:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwtsd-0000WU-7K; Fri, 25 Jun 2021 22:00:55 +0000
Received: by outflank-mailman (input) for mailman id 147435;
 Fri, 25 Jun 2021 22:00:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=l36E=LT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lwtsb-0000WO-V2
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 22:00:53 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d4c80d5c-e5d2-4ac5-95f9-713034929a81;
 Fri, 25 Jun 2021 22:00:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9766461613;
 Fri, 25 Jun 2021 22:00:52 +0000 (UTC)
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
X-Inumbo-ID: d4c80d5c-e5d2-4ac5-95f9-713034929a81
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1624658452;
	bh=yyBnq+tOA8an6SOV7Jwguf55yjHun4npbbcJ7i3Wqp4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aiN5qkoQFOqoqiG4h/rMfdEE8q+TcHeX67n4DoJSdOiSvL/abXc00LxU7fLFBVDky
	 VQ+JqFAV9JZGw4LYIGrlaIrIj+qYvzWkxYs08NBfkSsbnCef+qQwDWrURCwpe6OT2E
	 o66DTUv4GqRr2FSRaTQkFkWdxgwKz7CtJlvHwEy4bVK+Id1QLGwMw6oeUbGN/G9pUi
	 gSOMlvx+pgeta1ErPY6+hVrTjPZta7LHhAsLmEthLAdIo07obmNHAEysGKd0woAyF/
	 k8lWbSQWwoTRo3iTRztXQSlTtmEohhg5JywOowJEXHc9B/8hJp0YZjzIseDhE8UcxR
	 M86Lit7efG3Ig==
Date: Fri, 25 Jun 2021 15:00:51 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: smmuv1: Set privileged attr to 'default'
In-Reply-To: <c6c5e3deb97200baefb75d06ec934d2c6ee5eb62.1624546852.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2106251500400.24906@sstabellini-ThinkPad-T480s>
References: <612e7f61c19e60019bb7829888342fda95fd36be.1624546532.git.rahul.singh@arm.com> <c6c5e3deb97200baefb75d06ec934d2c6ee5eb62.1624546852.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 25 Jun 2021, Rahul Singh wrote:
> Backport commit e19898077cfb642fe151ba22981e795c74d9e114
> "iommu/arm-smmu: Set privileged attribute to 'default' instead of
> 'unprivileged'"
> 
> Original commit message:
>     Currently the driver sets all the device transactions privileges
>     to UNPRIVILEGED, but there are cases where the iommu masters wants
>     to isolate privileged supervisor and unprivileged user.
>     So don't override the privileged setting to unprivileged, instead
>     set it to default as incoming and let it be controlled by the
>     pagetable settings.
> 
>     Acked-by: Will Deacon <will.deacon@arm.com>
>     Signed-off-by: Sricharan R <sricharan@codeaurora.org>
>     Signed-off-by: Will Deacon <will.deacon@arm.com>
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>


Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/passthrough/arm/smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 1a68c2ab3b..d9a3a0cbf6 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1566,7 +1566,7 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
>  			continue;
>  
>  		s2cr[idx].type = type ;
> -		s2cr[idx].privcfg = S2CR_PRIVCFG_UNPRIV;
> +		s2cr[idx].privcfg = S2CR_PRIVCFG_DEFAULT;
>  		s2cr[idx].cbndx = cbndx;
>  		arm_smmu_write_s2cr(smmu, idx);
>  	}
> -- 
> 2.17.1
> 

