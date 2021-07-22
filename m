Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54603D303B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 01:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159888.294035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6iBU-00089A-Ue; Thu, 22 Jul 2021 23:32:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159888.294035; Thu, 22 Jul 2021 23:32:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6iBU-00087E-RV; Thu, 22 Jul 2021 23:32:56 +0000
Received: by outflank-mailman (input) for mailman id 159888;
 Thu, 22 Jul 2021 23:32:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ltuv=MO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1m6iBT-000878-O9
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 23:32:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 232d7166-eb45-11eb-915b-12813bfff9fa;
 Thu, 22 Jul 2021 23:32:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 672F560EB2;
 Thu, 22 Jul 2021 23:32:53 +0000 (UTC)
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
X-Inumbo-ID: 232d7166-eb45-11eb-915b-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626996773;
	bh=HbH3bLjCo5cGJISokqxaORxnMxdNJO6b51G1CARPNks=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=gR7cEN3IXG/ovwHxhW4/hdT+BBMaxtI/n5CE+Yh1WfX7dvXOK0RUY1dCR1a+4lbcc
	 cuRi0mk2rZLvqyXeIHmReSZc7FrsI1DRDnrASrCSL29YoV/2LZ0tXh9/l4wOHZTvcy
	 zRFxQY0t+EeM8/ysm/IOkxtAZ0WVdS0wsykEpJmCZXYK2oA+5GmCwDmctf0el96XIG
	 IqvnsJczD3XsAprvP43YvT9Ulkz7BlmdDREWKuIWrCrFxPW+Vjvc8OQ1oOmOWhiLzb
	 N+47MAFd0+QllRDu8MAqr9p+OG/lVw5mbuxrBkVfNMyV1B2T2TKOrARYEKdKySLdbu
	 i/J5jtDoHt/wA==
Date: Thu, 22 Jul 2021 16:32:52 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com, 
    Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: Re: [PATCH v4 1/3] arm,smmu: switch to using iommu_fwspec
 functions
In-Reply-To: <267ed58b-a63c-3ef4-b244-bab9e2e7f95e@xen.org>
Message-ID: <alpine.DEB.2.21.2107221610270.10122@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2107161657300.3916@sstabellini-ThinkPad-T480s> <20210716235939.9585-1-sstabellini@kernel.org> <267ed58b-a63c-3ef4-b244-bab9e2e7f95e@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 22 Jul 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 17/07/2021 00:59, Stefano Stabellini wrote:
> > diff --git a/xen/drivers/passthrough/device_tree.c
> > b/xen/drivers/passthrough/device_tree.c
> > index 999b831d90..911f82a561 100644
> > --- a/xen/drivers/passthrough/device_tree.c
> > +++ b/xen/drivers/passthrough/device_tree.c
> > @@ -140,8 +140,12 @@ int iommu_add_dt_device(struct dt_device_node *np)
> >       if ( !ops )
> >           return -EINVAL;
> >   +    /*
> > +     * Device already added. It can happen when both iommus and
> > +     * mmu-masters are present.
> > +     */
> 
> This is common code. So I would suggest to write a generic comment to avoid
> any misunderstanding. The one added just after the call in iommu_do_domctl()
> would seem more suitable.

OK, I went with this:

            * Some Device Trees may expose both legacy SMMU and generic
            * IOMMU bindings together. If both are present, the device
            * can be already added.



> >       if ( dev_iommu_fwspec_get(dev) )
> > -        return -EEXIST;
> > +        return 0;
> There are a few things to mention here:
> 
>  1) The change is not explained in the commit message

I will add


>  2) One of the caller was checking -EEXIST. As you dropped the only place
> where -EEXIST should be returned, can you drop the check in the caller?

Good point, yes I think it can be dropped.


> Ideally this should be in a separate patch because this change is not entirely
> related to this patch.

I can do that, I'll send out v5 shortly.

