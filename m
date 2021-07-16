Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9BB3CBA6D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 18:18:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157639.290324 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4QXR-0004s6-SK; Fri, 16 Jul 2021 16:18:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157639.290324; Fri, 16 Jul 2021 16:18:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4QXR-0004pj-OE; Fri, 16 Jul 2021 16:18:09 +0000
Received: by outflank-mailman (input) for mailman id 157639;
 Fri, 16 Jul 2021 16:18:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S0q/=MI=deltatee.com=logang@srs-us1.protection.inumbo.net>)
 id 1m4QXQ-0004pb-8g
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 16:18:08 +0000
Received: from ale.deltatee.com (unknown [204.191.154.188])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ff9ffa4d-ba3b-4830-a398-3f12860cce1f;
 Fri, 16 Jul 2021 16:18:07 +0000 (UTC)
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.92)
 (envelope-from <logang@deltatee.com>)
 id 1m4QXJ-0003ky-3C; Fri, 16 Jul 2021 10:18:01 -0600
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
X-Inumbo-ID: ff9ffa4d-ba3b-4830-a398-3f12860cce1f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=deltatee.com; s=20200525; h=Subject:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:content-disposition;
	bh=BnhY0izzSFVDQcuht2cro6XvHSIBnnpJHK/4w8E4yWs=; b=lHiHBr9UmxsphzyuJXXrFvFkXJ
	nHnU2Aad+t4uXkXpqnoYYQXL8s0VDrTpcUrSa7MBf3lHNc8SwA72FIyA0EFnNsLaMjuY1HyVFc4eY
	86UCMlrgVGkMX16Elm46rVT3dMTeEwZNCX1a+CjIpwSiCKZgO96vmX56LfZWgzS5j7bcdiascYBT7
	QpZUtkyACvD3Bob5Y0jFlifJMDasY0nH1O+2FuN7wP4IsecNoMeLFw+7g7lmwXVQFM8ujekY7qsib
	a39261ZQjmb8njie60hE0kfk/jWrRkVOwj7hryYFQZ5ncmwJY+tyhtISQB4927wPhvb2n8G328kwr
	zFWziVNw==;
To: Christoph Hellwig <hch@lst.de>
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-parisc@vger.kernel.org,
 xen-devel@lists.xenproject.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Stephen Bates <sbates@raithlin.com>,
 Martin Oliveira <martin.oliveira@eideticom.com>
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715164544.6827-17-logang@deltatee.com> <20210716063332.GD13345@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <82c0f8d8-9050-dcf7-d68d-93691878a6dd@deltatee.com>
Date: Fri, 16 Jul 2021 10:17:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716063332.GD13345@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: martin.oliveira@eideticom.com, sbates@raithlin.com, robin.murphy@arm.com, m.szyprowski@samsung.com, xen-devel@lists.xenproject.org, linux-parisc@vger.kernel.org, iommu@lists.linux-foundation.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-ia64@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	NICE_REPLY_A autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v1 16/16] dma-mapping: Disallow .map_sg operations from
 returning zero on error
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)



On 2021-07-16 12:33 a.m., Christoph Hellwig wrote:
> On Thu, Jul 15, 2021 at 10:45:44AM -0600, Logan Gunthorpe wrote:
>> @@ -194,6 +194,8 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
>>  	else
>>  		ents = ops->map_sg(dev, sg, nents, dir, attrs);
>>  
>> +	WARN_ON_ONCE(ents == 0);
> 
> Turns this into a negative error code while we're at it, just to keep
> the callers sane?
> 

Sure thing. All the feedback makes sense, we'll fix it up and send a v2
in due course.

Thanks,

Logan

