Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6486D915622
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 20:00:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746893.1154123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLnzG-0002M1-6n; Mon, 24 Jun 2024 18:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746893.1154123; Mon, 24 Jun 2024 18:00:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLnzG-0002Jh-46; Mon, 24 Jun 2024 18:00:18 +0000
Received: by outflank-mailman (input) for mailman id 746893;
 Mon, 24 Jun 2024 18:00:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bblz=N2=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1sLnzE-0002JZ-RC
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 18:00:16 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 9bea681d-3253-11ef-90a3-e314d9c70b13;
 Mon, 24 Jun 2024 20:00:15 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DCDBDA7;
 Mon, 24 Jun 2024 11:00:39 -0700 (PDT)
Received: from [10.57.74.124] (unknown [10.57.74.124])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94FA63F73B;
 Mon, 24 Jun 2024 11:00:12 -0700 (PDT)
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
X-Inumbo-ID: 9bea681d-3253-11ef-90a3-e314d9c70b13
Message-ID: <b65e089b-f8b0-4588-adaf-af555ab5781a@arm.com>
Date: Mon, 24 Jun 2024 19:00:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] iommu/xen: Add Xen PV-IOMMU driver
To: Easwar Hariharan <eahariha@linux.microsoft.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org, iommu@lists.linux.dev,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech>
 <da3ec316-b001-4711-b323-70af3e6bb014@arm.com>
 <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech>
 <20240624163254.GT791043@ziepe.ca>
 <900edf8a-885c-4bf3-84bd-5e7b165a1ed7@linux.microsoft.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <900edf8a-885c-4bf3-84bd-5e7b165a1ed7@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-24 6:36 pm, Easwar Hariharan wrote:
> Hi Jason,
> 
> On 6/24/2024 9:32 AM, Jason Gunthorpe wrote:
>> On Mon, Jun 24, 2024 at 02:36:45PM +0000, Teddy Astie wrote:
>>>>> +bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
>>>>> +{
>>>>> +    switch (cap) {
>>>>> +    case IOMMU_CAP_CACHE_COHERENCY:
>>>>> +        return true;
>>>>
>>>> Will the PV-IOMMU only ever be exposed on hardware where that really is
>>>> always true?
>>>>
>>>
>>> On the hypervisor side, the PV-IOMMU interface always implicitely flush
>>> the IOMMU hardware on map/unmap operation, so at the end of the
>>> hypercall, the cache should be always coherent IMO.
>>
>> Cache coherency is a property of the underlying IOMMU HW and reflects
>> the ability to prevent generating transactions that would bypass the
>> cache.
>>
>> On AMD and Intel IOMMU HW this maps to a bit in their PTEs that must
>> always be set to claim this capability.
>>
>> No ARM SMMU supports it yet.
>>
> 
> Unrelated to this patch: Both the arm-smmu and arm-smmu-v3 drivers claim
> this capability if the device tree/IORT table have the corresponding flags.
> 
> I read through DEN0049 to determine what are the knock-on effects, or
> equivalently the requirements to set those flags in the IORT, but came
> up empty. Could you help with what I'm missing to resolve the apparent
> contradiction between your statement and the code?

We did rejig things slightly a while back. The status quo now is that 
IOMMU_CAP_CACHE_COHERENCY mostly covers whether IOMMU mappings can make 
device accesses coherent at all, tied in with the IOMMU_CACHE prot value 
- this is effectively forced for Intel and AMD, while for SMMU we have 
to take a guess, but as commented it's a pretty reasonable assumption 
that if the SMMU's own output for table walks etc. is coherent then its 
translation outputs are likely to be too. The further property of being 
able to then enforce a coherent mapping regardless of what an endpoint 
might try to get around it (PCIe No Snoop etc.) is now under the 
enforce_cache_coherency op - that's what SMMU can't guarantee for now 
due to the IMP-DEF nature of whether S2FWB overrides No Snoop or not.

Thanks,
Robin.

