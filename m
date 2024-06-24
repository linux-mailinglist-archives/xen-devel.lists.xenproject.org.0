Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473E1914819
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 13:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746510.1153585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhZk-0002iU-1s; Mon, 24 Jun 2024 11:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746510.1153585; Mon, 24 Jun 2024 11:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLhZj-0002gJ-VY; Mon, 24 Jun 2024 11:09:31 +0000
Received: by outflank-mailman (input) for mailman id 746510;
 Mon, 24 Jun 2024 11:09:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bblz=N2=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1sLhZi-0002er-8W
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 11:09:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 38d9cd84-321a-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 13:09:28 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1DB2DDA7;
 Mon, 24 Jun 2024 04:09:52 -0700 (PDT)
Received: from [10.57.74.124] (unknown [10.57.74.124])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C7383F73B;
 Mon, 24 Jun 2024 04:09:25 -0700 (PDT)
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
X-Inumbo-ID: 38d9cd84-321a-11ef-90a3-e314d9c70b13
Message-ID: <4c941977-868a-4bd0-9c57-eb58255d95bf@arm.com>
Date: Mon, 24 Jun 2024 12:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] iommu/xen: Add Xen PV-IOMMU driver
To: Baolu Lu <baolu.lu@linux.intel.com>, Teddy Astie
 <teddy.astie@vates.tech>, Jason Gunthorpe <jgg@ziepe.ca>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech>
 <20240619163000.GK791043@ziepe.ca>
 <750967b7-252f-4523-872f-64b79358c97c@vates.tech>
 <4ba90f86-fd14-4d2a-b7a0-c3eaab243565@linux.intel.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <4ba90f86-fd14-4d2a-b7a0-c3eaab243565@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-23 4:21 am, Baolu Lu wrote:
> On 6/21/24 11:09 PM, Teddy Astie wrote:
>> Le 19/06/2024 à 18:30, Jason Gunthorpe a écrit :
>>> On Thu, Jun 13, 2024 at 01:50:22PM +0000, Teddy Astie wrote:
>>>
>>>> +struct iommu_domain *xen_iommu_domain_alloc(unsigned type)
>>>> +{
>>>> +    struct xen_iommu_domain *domain;
>>>> +    u16 ctx_no;
>>>> +    int ret;
>>>> +
>>>> +    if (type & IOMMU_DOMAIN_IDENTITY) {
>>>> +        /* use default domain */
>>>> +        ctx_no = 0;
>>> Please use the new ops, domain_alloc_paging and the static identity 
>>> domain.
>> Yes, in the v2, I will use this newer interface.
>>
>> I have a question on this new interface : is it valid to not have a
>> identity domain (and "default domain" being blocking); well in the
>> current implementation it doesn't really matter, but at some point, we
>> may want to allow not having it (thus making this driver mandatory).
> 
> It's valid to not have an identity domain if "default domain being
> blocking" means a paging domain with no mappings.
> 
> In the iommu driver's iommu_ops::def_domain_type callback, just always
> return IOMMU_DOMAIN_DMA, which indicates that the iommu driver doesn't
> support identity translation.

That's not necessary - if neither ops->identity_domain nor 
ops->domain_alloc(IOMMU_DOMAIN_IDENTITY) gives a valid domain then we 
fall back to IOMMU_DOMAIN_DMA anyway.

Thanks,
Robin.

