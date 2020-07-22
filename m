Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5DC229D7A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 18:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyHuE-0004Fu-8f; Wed, 22 Jul 2020 16:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0kdp=BB=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jyHuD-0004Fp-BJ
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 16:47:45 +0000
X-Inumbo-ID: 10a18b42-cc3b-11ea-8684-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 10a18b42-cc3b-11ea-8684-bc764e2007e4;
 Wed, 22 Jul 2020 16:47:44 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B7525206C1;
 Wed, 22 Jul 2020 16:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595436464;
 bh=fJ4H+s8bnXEuA7qbfhHl8boB7131WZ52qZ7G1ZDicJM=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=TVk4EaBJE1p9iB5Rn/STCvaUhPYCnyeEcaTr9rcJFI5JtiWR43F9CJIszRpb40tZS
 OoZUu0fUFCCqIfMcS2sH8ACTy30eWojmmjl03VmxlqU+B5IMIi9m5f9VCfrDW/zkmI
 UT/q49pmSyA7Tb/f9l68/RKPsoToVZaXSQHRrslg=
Date: Wed, 22 Jul 2020 09:47:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Brian Woods <brian.woods@xilinx.com>
Subject: Re: [RFC v2 1/2] arm,smmu: switch to using iommu_fwspec functions
In-Reply-To: <1595390431-24805-2-git-send-email-brian.woods@xilinx.com>
Message-ID: <alpine.DEB.2.21.2007220938020.17562@sstabellini-ThinkPad-T480s>
References: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
 <1595390431-24805-2-git-send-email-brian.woods@xilinx.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Tue, 21 Jul 2020, Brian Woods wrote:
> Modify the smmu driver so that it uses the iommu_fwspec helper
> functions.  This means both ARM IOMMU drivers will both use the
> iommu_fwspec helper functions.
> 
> Signed-off-by: Brian Woods <brian.woods@xilinx.com>

[...]

> @@ -1924,14 +1924,21 @@ static int arm_smmu_add_device(struct device *dev)
>  			ret = -ENOMEM;
>  			goto out_put_group;
>  		}
> +		cfg->fwspec = kzalloc(sizeof(struct iommu_fwspec), GFP_KERNEL);
> +		if (!cfg->fwspec) {
> +			kfree(cfg);
> +			ret = -ENOMEM;
> +			goto out_put_group;
> +		}
> +		iommu_fwspec_init(dev, smmu->dev);

Normally the fwspec structure is initialized in
xen/drivers/passthrough/device_tree.c:iommu_add_dt_device. However here
we are trying to use it with the legacy bindings, that of course don't
initialize in iommu_add_dt_device because they are different.

So I imagine this is the reason why we have to initialize iommu_fwspec here
indepdendently from iommu_add_dt_device.

However, why are we allocating the struct iommu_fwspec twice?

We are calling kzalloc, then iommu_fwspec_init is calling xzalloc.

Similarly, we are storing the pointer to struct iommu_fwspec in
cfg->fwspec but actually there is already a pointer to struct
iommu_fwspec in struct device (the one set by dev_iommu_fwspec_set.)

Do we actually need both?

