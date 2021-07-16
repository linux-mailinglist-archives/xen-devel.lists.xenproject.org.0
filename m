Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 166663CB74D
	for <lists+xen-devel@lfdr.de>; Fri, 16 Jul 2021 14:19:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.157152.290062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4MoY-0007nX-CO; Fri, 16 Jul 2021 12:19:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 157152.290062; Fri, 16 Jul 2021 12:19:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m4MoY-0007lS-9U; Fri, 16 Jul 2021 12:19:34 +0000
Received: by outflank-mailman (input) for mailman id 157152;
 Fri, 16 Jul 2021 12:19:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OMQp=MI=arm.com=robin.murphy@srs-us1.protection.inumbo.net>)
 id 1m4MoW-0007lM-Ni
 for xen-devel@lists.xenproject.org; Fri, 16 Jul 2021 12:19:32 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d3373b79-8114-44fe-951f-3b05d3e96735;
 Fri, 16 Jul 2021 12:19:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08358D6E;
 Fri, 16 Jul 2021 05:19:31 -0700 (PDT)
Received: from [10.57.36.240] (unknown [10.57.36.240])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF0533F774;
 Fri, 16 Jul 2021 05:19:28 -0700 (PDT)
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
X-Inumbo-ID: d3373b79-8114-44fe-951f-3b05d3e96735
Subject: Re: [PATCH v1 16/16] dma-mapping: Disallow .map_sg operations from
 returning zero on error
To: Christoph Hellwig <hch@lst.de>, Logan Gunthorpe <logang@deltatee.com>
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Martin Oliveira
 <martin.oliveira@eideticom.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, Stephen Bates <sbates@raithlin.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20210715164544.6827-1-logang@deltatee.com>
 <20210715164544.6827-17-logang@deltatee.com> <20210716063332.GD13345@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <21b7f2f1-ccac-4567-6933-a258dcad7099@arm.com>
Date: Fri, 16 Jul 2021 13:19:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210716063332.GD13345@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2021-07-16 07:33, Christoph Hellwig wrote:
> On Thu, Jul 15, 2021 at 10:45:44AM -0600, Logan Gunthorpe wrote:
>> @@ -194,6 +194,8 @@ static int __dma_map_sg_attrs(struct device *dev, struct scatterlist *sg,
>>   	else
>>   		ents = ops->map_sg(dev, sg, nents, dir, attrs);
>>   
>> +	WARN_ON_ONCE(ents == 0);
> 
> Turns this into a negative error code while we're at it, just to keep
> the callers sane?

Right, by this point returning the 0 would pass through 
dma_map_sg_attrs() OK, but AFAICS dma_map_sgtable() would now get 
confused and return success but with sgt->nents = 0. Coercing it to an 
error code (which dma_map_sg_attrs() would then just change right back) 
seems sensible for the sake of easy robustness.

Robin.

