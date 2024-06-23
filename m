Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA09913782
	for <lists+xen-devel@lfdr.de>; Sun, 23 Jun 2024 05:25:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745965.1152972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLDps-0008Gt-DT; Sun, 23 Jun 2024 03:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745965.1152972; Sun, 23 Jun 2024 03:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLDps-0008Ez-Al; Sun, 23 Jun 2024 03:24:12 +0000
Received: by outflank-mailman (input) for mailman id 745965;
 Sun, 23 Jun 2024 03:24:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OXD4=NZ=linux.intel.com=baolu.lu@srs-se1.protection.inumbo.net>)
 id 1sLDpr-0008Et-7I
 for xen-devel@lists.xenproject.org; Sun, 23 Jun 2024 03:24:11 +0000
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0b44ecd7-3110-11ef-90a3-e314d9c70b13;
 Sun, 23 Jun 2024 05:24:07 +0200 (CEST)
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2024 20:24:04 -0700
Received: from unknown (HELO [10.239.159.127]) ([10.239.159.127])
 by orviesa008.jf.intel.com with ESMTP; 22 Jun 2024 20:24:01 -0700
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
X-Inumbo-ID: 0b44ecd7-3110-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719113047; x=1750649047;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZQAdAA6fO1mYmX4GbtwmVh2Kj57oeksFj2+YVnS3DHk=;
  b=g5d6BAMCgsF74xcFut6BaWMtpgktBY6pRjDHLDgLWf6gmaskp/SKcKVs
   hirnFUik82Uabj5kjUVVw5m397uY7Mq7uV6Zyg6ehLus9ZqrRt77TYOOo
   j5UorjJ83s4T1Pig8k9ri9TH2TgApZt40NmNFLFq3G7NA12090o1fzNtq
   4dbHOTG1GmgylXqkarYdKdXq/9ziv0D/+ZchG8zJbeo8qaA2J6xe3GIzE
   Oc4CGkzCIxlm0o5+ZM5uCkK0hWWVHD8y3DCrVWY68SYNGzTqH8RjAX3iw
   d/2897/iduiImIPgEbH27V6DXU2iHa2oK7T3R7UCynjFIViRCmI/jD5s8
   Q==;
X-CSE-ConnectionGUID: /n+ML786QM25UiqQ9GaZ0g==
X-CSE-MsgGUID: /qXqPECRRvKc+CVw/1n+XA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16249329"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="16249329"
X-CSE-ConnectionGUID: mGbhDtelQlS7Rw2zRNd/mQ==
X-CSE-MsgGUID: ACHECqE7SMuKm7SiobHzuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="43643808"
Message-ID: <4ba90f86-fd14-4d2a-b7a0-c3eaab243565@linux.intel.com>
Date: Sun, 23 Jun 2024 11:21:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: baolu.lu@linux.intel.com, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH] iommu/xen: Add Xen PV-IOMMU driver
To: Teddy Astie <teddy.astie@vates.tech>, Jason Gunthorpe <jgg@ziepe.ca>
References: <fe36b8d36ed3bc01c78901bdf7b87a71cb1adaad.1718286176.git.teddy.astie@vates.tech>
 <20240619163000.GK791043@ziepe.ca>
 <750967b7-252f-4523-872f-64b79358c97c@vates.tech>
Content-Language: en-US
From: Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <750967b7-252f-4523-872f-64b79358c97c@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/21/24 11:09 PM, Teddy Astie wrote:
> Le 19/06/2024 à 18:30, Jason Gunthorpe a écrit :
>> On Thu, Jun 13, 2024 at 01:50:22PM +0000, Teddy Astie wrote:
>>
>>> +struct iommu_domain *xen_iommu_domain_alloc(unsigned type)
>>> +{
>>> +	struct xen_iommu_domain *domain;
>>> +	u16 ctx_no;
>>> +	int ret;
>>> +
>>> +	if (type & IOMMU_DOMAIN_IDENTITY) {
>>> +		/* use default domain */
>>> +		ctx_no = 0;
>> Please use the new ops, domain_alloc_paging and the static identity domain.
> Yes, in the v2, I will use this newer interface.
> 
> I have a question on this new interface : is it valid to not have a
> identity domain (and "default domain" being blocking); well in the
> current implementation it doesn't really matter, but at some point, we
> may want to allow not having it (thus making this driver mandatory).

It's valid to not have an identity domain if "default domain being
blocking" means a paging domain with no mappings.

In the iommu driver's iommu_ops::def_domain_type callback, just always
return IOMMU_DOMAIN_DMA, which indicates that the iommu driver doesn't
support identity translation.

Best regards,
baolu

