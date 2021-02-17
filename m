Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C4831E2FF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Feb 2021 00:24:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86450.162315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCWAe-0000ds-DR; Wed, 17 Feb 2021 23:23:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86450.162315; Wed, 17 Feb 2021 23:23:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCWAe-0000dT-AO; Wed, 17 Feb 2021 23:23:48 +0000
Received: by outflank-mailman (input) for mailman id 86450;
 Wed, 17 Feb 2021 23:23:46 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RvmJ=HT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lCWAc-0000dO-0f
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 23:23:46 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e0655dd7-d175-4ec5-8c17-54cbdc8525ab;
 Wed, 17 Feb 2021 23:23:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBB5F64E2F;
 Wed, 17 Feb 2021 23:23:43 +0000 (UTC)
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
X-Inumbo-ID: e0655dd7-d175-4ec5-8c17-54cbdc8525ab
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613604224;
	bh=3Ac/wfKtJ+Bk7gd+4GzFKr/tjDHTJw1C8Ict01DZ9uE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kzpS3EYt2RCCnxwN4yxk8CQydrGoODH28ShDhoZT1tPrEDpbv4KVa2uxPBq5wYgGB
	 GswV+qA5tSrj1OPSfySugcoQWn2Ae1/qOp5KIvLd49NTWDo2iP+trlE1wMvZg/nP6Q
	 8L/CM738nhX+Cuqy/R74SquOJqYeeV2cudVCYhgpz5YyXryocFlucviKcCU3bWCRqo
	 sAdNQVptOuwgifX+F3FXghYxpFcXYmTFMMlJqlCrnOSLdKkYrqP9Ommu1isbgSOx0Y
	 gRNUtnWJscMD84+uKCdtTb6oklD02TNFd1J74Hh1+sDo88NBH/UYwxLmjZeGqQ9U5a
	 iaA7zCeRDCDRw==
Date: Wed, 17 Feb 2021 15:23:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
cc: Rahul Singh <Rahul.Singh@arm.com>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, iwj@xenproject.org
Subject: Re: [PATCH] xen/arm : smmuv3: Fix to handle multiple StreamIds per
 device.
In-Reply-To: <5145C563-A8AA-41B1-8EBB-B32D1FFC2219@arm.com>
Message-ID: <alpine.DEB.2.21.2102171522420.3234@sstabellini-ThinkPad-T480s>
References: <43de5b58df37d8b8de037cb23c47ab8454caf37c.1613492577.git.rahul.singh@arm.com> <5145C563-A8AA-41B1-8EBB-B32D1FFC2219@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+IanJ

On Wed, 17 Feb 2021, Bertrand Marquis wrote:
> Hi Rahul,
> 
> 
> > On 17 Feb 2021, at 10:05, Rahul Singh <Rahul.Singh@arm.com> wrote:
> > 
> > SMMUv3 driver does not handle multiple StreamId if the master device
> > supports more than one StreamID.
> > 
> > This bug was introduced when the driver was ported from Linux to XEN.
> > dt_device_set_protected(..) should be called from add_device(..) not
> > from the dt_xlate(..).
> > 
> > Move dt_device_set_protected(..) from dt_xlate(..) to add_device().
> > 
> > Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> Thanks a lot, this is fixing issues with multiple stream ids for one device :-)

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> > ---
> > This patch is a candidate for 4.15 as without this patch it is not possible to
> > assign multiple StreamIds to the same device when device is protected behind
> > SMMUv3.

I agree especially considering that the impact is limited to smmu-v3.c.


> > ---
> > xen/drivers/passthrough/arm/smmu-v3.c | 29 ++++++++++-----------------
> > 1 file changed, 11 insertions(+), 18 deletions(-)
> > 
> > diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> > index 914cdc1cf4..53d150cdb6 100644
> > --- a/xen/drivers/passthrough/arm/smmu-v3.c
> > +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> > @@ -2207,24 +2207,6 @@ static int arm_smmu_add_device(u8 devfn, struct device *dev)
> > 	 */
> > 	arm_smmu_enable_pasid(master);
> > 
> > -	return 0;
> > -
> > -err_free_master:
> > -	xfree(master);
> > -	dev_iommu_priv_set(dev, NULL);
> > -	return ret;
> > -}
> > -
> > -static int arm_smmu_dt_xlate(struct device *dev,
> > -				const struct dt_phandle_args *args)
> > -{
> > -	int ret;
> > -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> > -
> > -	ret = iommu_fwspec_add_ids(dev, args->args, 1);
> > -	if (ret)
> > -		return ret;
> > -
> > 	if (dt_device_is_protected(dev_to_dt(dev))) {
> > 		dev_err(dev, "Already added to SMMUv3\n");
> > 		return -EEXIST;
> > @@ -2237,6 +2219,17 @@ static int arm_smmu_dt_xlate(struct device *dev,
> > 			dev_name(fwspec->iommu_dev), fwspec->num_ids);
> > 
> > 	return 0;
> > +
> > +err_free_master:
> > +	xfree(master);
> > +	dev_iommu_priv_set(dev, NULL);
> > +	return ret;
> > +}
> > +
> > +static int arm_smmu_dt_xlate(struct device *dev,
> > +				const struct dt_phandle_args *args)
> > +{
> > +	return iommu_fwspec_add_ids(dev, args->args, 1);
> > }
> > 
> > /* Probing and initialisation functions */
> > -- 
> > 2.17.1
> > 
> 

