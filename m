Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DD915B91
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 03:22:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.747137.1154464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLurb-00072y-In; Tue, 25 Jun 2024 01:20:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 747137.1154464; Tue, 25 Jun 2024 01:20:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLurb-00070f-FK; Tue, 25 Jun 2024 01:20:51 +0000
Received: by outflank-mailman (input) for mailman id 747137;
 Tue, 25 Jun 2024 01:20:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AHgq=N3=linux.intel.com=baolu.lu@srs-se1.protection.inumbo.net>)
 id 1sLurZ-00070Z-JB
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 01:20:50 +0000
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24d509cb-3291-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 03:20:46 +0200 (CEST)
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 18:20:43 -0700
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by fmviesa004.fm.intel.com with ESMTP; 24 Jun 2024 18:20:41 -0700
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
X-Inumbo-ID: 24d509cb-3291-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719278447; x=1750814447;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=U6XAiC13vaXq5UsI3E92/M07+WJrfK31lsjb3JRY1ps=;
  b=HxsCqosVo7/Bv3GJ+JkDMDorFQ6ZoZOKzXjOMqfyvJRG0vzZo0nLyuFi
   YIfq85+w/hYJRddT7uZdN2ecFlic36LjijKvaCrqSXmJduIPZOQ43WXbA
   FRNR2PN5Py1wJYWY5qlJKTJJhPoiI/k42jLOJ7tjtZq5IvvsusUXKbMpI
   GMVq4uCjY5agim68FDR6T1ss8nzJLey2RDOWYtsfFUEGktdcI0ryCTJQ8
   3ekxbSHPKEO9sZcb/LJkf6qLDYcsdAUaGaCHrTYqsw996JEGG40Yfk0YZ
   kFRSFofGktCxqLuUTMST8imJLOeKdP10IXxXjFkXtGU1+67/uY4x4p6sk
   A==;
X-CSE-ConnectionGUID: EK2jTyhhQJ6syTRx+iad7A==
X-CSE-MsgGUID: gblRdE4aTaWZNd2coKeIPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="33812925"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="33812925"
X-CSE-ConnectionGUID: 2MUKm378QzWdCxybgJGdZA==
X-CSE-MsgGUID: NAxNJ6sbTpmExBVHbHA4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; 
   d="scan'208";a="48019532"
Message-ID: <adac26cc-0d9e-4413-a0b7-c1d6929b9543@linux.intel.com>
Date: Tue, 25 Jun 2024 09:18:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH] iommu/xen: Add Xen PV-IOMMU driver
To: Robin Murphy <robin.murphy@arm.com>, Teddy Astie
 <teddy.astie@vates.tech>, Jason Gunthorpe <jgg@ziepe.ca>
References: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech>
 <20240619163000.GK791043@ziepe.ca>
 <750967b7-252f-4523-872f-64b79358c97c@vates.tech>
 <4ba90f86-fd14-4d2a-b7a0-c3eaab243565@linux.intel.com>
 <4c941977-868a-4bd0-9c57-eb58255d95bf@arm.com>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <4c941977-868a-4bd0-9c57-eb58255d95bf@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/24 7:09 PM, Robin Murphy wrote:
> On 2024-06-23 4:21 am, Baolu Lu wrote:
>> On 6/21/24 11:09 PM, Teddy Astie wrote:
>>> Le 19/06/2024 à 18:30, Jason Gunthorpe a écrit :
>>>> On Thu, Jun 13, 2024 at 01:50:22PM +0000, Teddy Astie wrote:
>>>>
>>>>> +struct iommu_domain *xen_iommu_domain_alloc(unsigned type)
>>>>> +{
>>>>> +    struct xen_iommu_domain *domain;
>>>>> +    u16 ctx_no;
>>>>> +    int ret;
>>>>> +
>>>>> +    if (type & IOMMU_DOMAIN_IDENTITY) {
>>>>> +        /* use default domain */
>>>>> +        ctx_no = 0;
>>>> Please use the new ops, domain_alloc_paging and the static identity 
>>>> domain.
>>> Yes, in the v2, I will use this newer interface.
>>>
>>> I have a question on this new interface : is it valid to not have a
>>> identity domain (and "default domain" being blocking); well in the
>>> current implementation it doesn't really matter, but at some point, we
>>> may want to allow not having it (thus making this driver mandatory).
>>
>> It's valid to not have an identity domain if "default domain being
>> blocking" means a paging domain with no mappings.
>>
>> In the iommu driver's iommu_ops::def_domain_type callback, just always
>> return IOMMU_DOMAIN_DMA, which indicates that the iommu driver doesn't
>> support identity translation.
> 
> That's not necessary - if neither ops->identity_domain nor 
> ops->domain_alloc(IOMMU_DOMAIN_IDENTITY) gives a valid domain then we 
> fall back to IOMMU_DOMAIN_DMA anyway.

Yes. That's true.

Best regards,
baolu

