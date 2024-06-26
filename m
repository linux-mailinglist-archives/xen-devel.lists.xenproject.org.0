Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C56079180A2
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 14:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.748793.1156657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMRSb-0003nu-6m; Wed, 26 Jun 2024 12:09:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 748793.1156657; Wed, 26 Jun 2024 12:09:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMRSb-0003lC-3m; Wed, 26 Jun 2024 12:09:13 +0000
Received: by outflank-mailman (input) for mailman id 748793;
 Wed, 26 Jun 2024 12:09:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YERW=N4=arm.com=robin.murphy@srs-se1.protection.inumbo.net>)
 id 1sMRSa-0003l6-0m
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 12:09:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id e41ebfab-33b4-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 14:09:09 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 217C7339;
 Wed, 26 Jun 2024 05:09:33 -0700 (PDT)
Received: from [10.57.74.5] (unknown [10.57.74.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C88973F73B;
 Wed, 26 Jun 2024 05:09:06 -0700 (PDT)
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
X-Inumbo-ID: e41ebfab-33b4-11ef-b4bb-af5377834399
Message-ID: <c4dc539b-a71b-4323-aa31-b97b39c633a8@arm.com>
Date: Wed, 26 Jun 2024 13:09:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] iommu/xen: Add Xen PV-IOMMU driver
To: Teddy Astie <teddy.astie@vates.tech>, xen-devel@lists.xenproject.org,
 iommu@lists.linux.dev
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
References: <24d7ec005e77e4e0127995ba6f4ad16f33737fa5.1718981216.git.teddy.astie@vates.tech>
 <da3ec316-b001-4711-b323-70af3e6bb014@arm.com>
 <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <a04e169d-b38a-43dc-b783-a8af1e1b0468@vates.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2024-06-24 3:36 pm, Teddy Astie wrote:
> Hello Robin,
> Thanks for the thourough review.
> 
>>> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
>>> index 0af39bbbe3a3..242cefac77c9 100644
>>> --- a/drivers/iommu/Kconfig
>>> +++ b/drivers/iommu/Kconfig
>>> @@ -480,6 +480,15 @@ config VIRTIO_IOMMU
>>>          Say Y here if you intend to run this kernel as a guest.
>>> +config XEN_IOMMU
>>> +    bool "Xen IOMMU driver"
>>> +    depends on XEN_DOM0
>>
>> Clearly this depends on X86 as well.
>>
> Well, I don't intend this driver to be X86-only, even though the current
> Xen RFC doesn't support ARM (yet). Unless there is a counter-indication
> for it ?

It's purely practical - even if you drop the asm/iommu.h stuff it would 
still break ARM DOM0 builds due to HYPERVISOR_iommu_op() only being 
defined for x86. And it's better to add a dependency here to make it 
clear what's *currently* supported, than to add dummy code to allow it 
to build for ARM if that's not actually tested or usable yet.

>>> +bool xen_iommu_capable(struct device *dev, enum iommu_cap cap)
>>> +{
>>> +    switch (cap) {
>>> +    case IOMMU_CAP_CACHE_COHERENCY:
>>> +        return true;
>>
>> Will the PV-IOMMU only ever be exposed on hardware where that really is
>> always true?
>>
> 
> On the hypervisor side, the PV-IOMMU interface always implicitely flush
> the IOMMU hardware on map/unmap operation, so at the end of the
> hypercall, the cache should be always coherent IMO.

As Jason already brought up, this is not about TLBs or anything cached 
by the IOMMU itself, it's about the memory type(s) it can create 
mappings with. Returning true here says Xen guarantees it can use a 
cacheable memory type which will let DMA snoop the CPU caches. 
Furthermore, not explicitly handling IOMMU_CACHE in the map_pages op 
then also implies that it will *always* do that, so you couldn't 
actually get an uncached mapping even if you wanted one.

>>> +    while (xen_pg_count) {
>>> +        size_t to_unmap = min(xen_pg_count, max_nr_pages);
>>> +
>>> +        //pr_info("Unmapping %lx-%lx\n", dfn, dfn + to_unmap - 1);
>>> +
>>> +        op.unmap_pages.dfn = dfn;
>>> +        op.unmap_pages.nr_pages = to_unmap;
>>> +
>>> +        ret = HYPERVISOR_iommu_op(&op);
>>> +
>>> +        if (ret)
>>> +            pr_warn("Unmap failure (%lx-%lx)\n", dfn, dfn + to_unmap
>>> - 1);
>>
>> But then how
>>> would it ever happen anyway? Unmap is a domain op, so a domain which
>>> doesn't allow unmapping shouldn't offer it in the first place...
> 
> Unmap failing should be exceptionnal, but is possible e.g with
> transparent superpages (like Xen IOMMU drivers do). Xen drivers folds
> appropriate contiguous mappings into superpages entries to optimize
> memory usage and iotlb. However, if you unmap in the middle of a region
> covered by a superpage entry, this is no longer a valid superpage entry,
> and you need to allocate and fill the lower levels, which is faillible
> if lacking memory.

OK, so in the worst case you could potentially have a partial unmap 
failure if the range crosses a superpage boundary and the end part 
happens to have been folded, and Xen doesn't detect and prepare that 
allocation until it's already unmapped up to the boundary. If that is 
so, does the hypercall interface give any information about partial 
failure, or can any error only be taken to mean that some or all of the 
given range may or may not have be unmapped now?
>> In this case I'd argue that you really *do* want to return short, in the
>> hope of propagating the error back up and letting the caller know the
>> address space is now messed up before things start blowing up even more
>> if they keep going and subsequently try to map new pages into
>> not-actually-unmapped VAs.
> 
> While mapping on top of another mapping is ok for us (it's just going to
> override the previous mapping), I definetely agree that having the
> address space messed up is not good.

Oh, indeed, quietly replacing existing PTEs might help paper over errors 
in this particular instance, but it does then allow *other* cases to go 
wrong in fun and infuriating ways :)

>>> +static struct iommu_domain default_domain = {
>>> +    .ops = &(const struct iommu_domain_ops){
>>> +        .attach_dev = default_domain_attach_dev
>>> +    }
>>> +};
>>
>> Looks like you could make it a static xen_iommu_domain and just use the
>> normal attach callback? Either way please name it something less
>> confusing like xen_iommu_identity_domain - "default" is far too
>> overloaded round here already...
>>
> 
> Yes, although, if in the future, we can have either this domain as
> identity or blocking/paging depending on some upper level configuration.
> Should we have both identity and blocking domains, and only setting the
> relevant one in iommu_ops, or keep this naming.

That's something that can be considered if and when it does happen. For 
now, if it's going to be pre-mapped as an identity domain, then let's 
just treat it as such and keep things straightforward.

>>> +void __exit xen_iommu_fini(void)
>>> +{
>>> +    pr_info("Unregistering Xen IOMMU driver\n");
>>> +
>>> +    iommu_device_unregister(&xen_iommu_device);
>>> +    iommu_device_sysfs_remove(&xen_iommu_device);
>>> +}
>>
>> This is dead code since the Kconfig is only "bool". Either allow it to
>> be an actual module (and make sure that works), or drop the pretence
>> altogether.
>>
> 
> Ok, I though this function was actually a requirement even if it is not
> a module.

No, quite the opposite - even code which is modular doesn't have to 
support removal if it doesn't want to.

Thanks,
Robin.

