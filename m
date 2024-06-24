Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02CF9156DE
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 21:02:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746884.1154144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLowc-0002EE-Jv; Mon, 24 Jun 2024 19:01:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746884.1154144; Mon, 24 Jun 2024 19:01:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLowc-0002BK-Gv; Mon, 24 Jun 2024 19:01:38 +0000
Received: by outflank-mailman (input) for mailman id 746884;
 Mon, 24 Jun 2024 17:36:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pKqu=N2=linux.microsoft.com=eahariha@srs-se1.protection.inumbo.net>)
 id 1sLnbz-0006W6-RE
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 17:36:15 +0000
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 410d92e4-3250-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 19:36:14 +0200 (CEST)
Received: from [192.168.49.54] (c-73-118-245-227.hsd1.wa.comcast.net
 [73.118.245.227])
 by linux.microsoft.com (Postfix) with ESMTPSA id EC03920B7001;
 Mon, 24 Jun 2024 10:36:12 -0700 (PDT)
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
X-Inumbo-ID: 410d92e4-3250-11ef-90a3-e314d9c70b13
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EC03920B7001
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1719250573;
	bh=eyV8+Wg7rnqJN5ZB9yu5wi+VOQhkLpSVFBwuzs99BlA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=VVCfWIl7rgyeYeV8qIBFhuEhQtA9/ytKRfyRl/4eY4ANSsdOSMWk2mdcUDzvdZmAe
	 4GO6WjN3LwG820PLck1snRRlElpxqRpeCd3Rm3dT7S93RgHw/IxDmLU514kEfk1qlM
	 342hnCK2Z3orW9MBS5LKS1er7VB5BKCVvhhoPL7I=
Message-ID: <900edf8a-885c-4bf3-84bd-5e7b165a1ed7@linux.microsoft.com>
Date: Mon, 24 Jun 2024 10:36:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, Robin Murphy <robin.murphy@arm.com>,
 xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH v2] iommu/xen: Add Xen PV-IOMMU driver
To: Jason Gunthorpe <jgg@ziepe.ca>, Teddy Astie <teddy.astie@vates.tech>
References: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech>
 <da3ec316-b001-4711-b323-70af3e6bb014@arm.com>
 <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech>
 <20240624163254.GT791043@ziepe.ca>
Content-Language: en-US
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <20240624163254.GT791043@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jason,

On 6/24/2024 9:32 AM, Jason Gunthorpe wrote:
> On Mon, Jun 24, 2024 at 02:36:45PM +0000, Teddy Astie wrote:
>>>> +bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
>>>> +{
>>>> +    switch (cap) {
>>>> +    case IOMMU_CAP_CACHE_COHERENCY:
>>>> +        return true;
>>>
>>> Will the PV-IOMMU only ever be exposed on hardware where that really is
>>> always true?
>>>
>>
>> On the hypervisor side, the PV-IOMMU interface always implicitely flush
>> the IOMMU hardware on map/unmap operation, so at the end of the
>> hypercall, the cache should be always coherent IMO.
> 
> Cache coherency is a property of the underlying IOMMU HW and reflects
> the ability to prevent generating transactions that would bypass the
> cache.
> 
> On AMD and Intel IOMMU HW this maps to a bit in their PTEs that must
> always be set to claim this capability.
> 
> No ARM SMMU supports it yet.
> 

Unrelated to this patch: Both the arm-smmu and arm-smmu-v3 drivers claim
this capability if the device tree/IORT table have the corresponding flags.

I read through DEN0049 to determine what are the knock-on effects, or
equivalently the requirements to set those flags in the IORT, but came
up empty. Could you help with what I'm missing to resolve the apparent
contradiction between your statement and the code?

Thanks,
Easwar

