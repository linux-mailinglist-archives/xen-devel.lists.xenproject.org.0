Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB39D466A53
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 20:17:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236943.410936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msrZh-0007Y9-ML; Thu, 02 Dec 2021 19:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236943.410936; Thu, 02 Dec 2021 19:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msrZh-0007WF-I3; Thu, 02 Dec 2021 19:16:57 +0000
Received: by outflank-mailman (input) for mailman id 236943;
 Thu, 02 Dec 2021 19:16:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vx2B=QT=srcf.net=amc96@srs-se1.protection.inumbo.net>)
 id 1msrZg-0007W9-7e
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 19:16:56 +0000
Received: from ppsw-42.csi.cam.ac.uk (ppsw-42.csi.cam.ac.uk [131.111.8.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68c888ec-53a4-11ec-b1df-f38ee3fbfdf7;
 Thu, 02 Dec 2021 20:16:54 +0100 (CET)
Received: from hades.srcf.societies.cam.ac.uk ([131.111.179.67]:35002)
 by ppsw-42.csi.cam.ac.uk (ppsw.cam.ac.uk [131.111.8.138]:25)
 with esmtps (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
 id 1msrZd-000IdJ-8e (Exim 4.95) (return-path <amc96@srcf.net>);
 Thu, 02 Dec 2021 19:16:53 +0000
Received: from [192.168.1.10] (host-92-12-61-86.as13285.net [92.12.61.86])
 (Authenticated sender: amc96)
 by hades.srcf.societies.cam.ac.uk (Postfix) with ESMTPSA id 77F811FC68;
 Thu,  2 Dec 2021 19:16:53 +0000 (GMT)
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
X-Inumbo-ID: 68c888ec-53a4-11ec-b1df-f38ee3fbfdf7
X-Cam-AntiVirus: no malware found
X-Cam-ScannerInfo: https://help.uis.cam.ac.uk/email-scanner-virus
Message-ID: <09a1961b-2647-f25e-f028-9e398fa2c83e@srcf.net>
Date: Thu, 2 Dec 2021 19:16:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Paul Durrant <paul@xen.org>
References: <957f067b-9fe1-2350-4266-51982f09d3a9@suse.com>
 <f66b6403-13dd-cb05-7411-20efd7364b08@suse.com>
 <Yac7uLaQ1+YdCqtW@Air-de-Roger>
 <fd5ff1e0-88f0-3fba-4573-b007afdbb3a5@suse.com>
 <YadPLZqfN2pu5SeG@Air-de-Roger>
 <8b2c09f5-1f64-9754-17a4-936f1e496a82@suse.com>
 <YajiQeaPx7KcL0Tw@Air-de-Roger>
 <49991d39-f976-af50-b203-152564fa458e@suse.com>
From: Andrew Cooper <amc96@srcf.net>
Subject: Re: [PATCH v2 06/18] IOMMU/x86: restrict IO-APIC mappings for PV Dom0
In-Reply-To: <49991d39-f976-af50-b203-152564fa458e@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2021 15:28, Jan Beulich wrote:
> On 02.12.2021 16:12, Roger Pau Monné wrote:
>> On Wed, Dec 01, 2021 at 12:45:12PM +0100, Jan Beulich wrote:
>>> On 01.12.2021 11:32, Roger Pau Monné wrote:
>>>> On Wed, Dec 01, 2021 at 10:27:21AM +0100, Jan Beulich wrote:
>>>>> On 01.12.2021 10:09, Roger Pau Monné wrote:
>>>>>> On Fri, Sep 24, 2021 at 11:46:57AM +0200, Jan Beulich wrote:
>>>>>>> @@ -267,44 +267,60 @@ static bool __hwdom_init hwdom_iommu_map
>>>>>>>       * that fall in unusable ranges for PV Dom0.
>>>>>>>       */
>>>>>>>      if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
>>>>>>> -        return false;
>>>>>>> +        return 0;
>>>>>>>  
>>>>>>>      switch ( type = page_get_ram_type(mfn) )
>>>>>>>      {
>>>>>>>      case RAM_TYPE_UNUSABLE:
>>>>>>> -        return false;
>>>>>>> +        return 0;
>>>>>>>  
>>>>>>>      case RAM_TYPE_CONVENTIONAL:
>>>>>>>          if ( iommu_hwdom_strict )
>>>>>>> -            return false;
>>>>>>> +            return 0;
>>>>>>>          break;
>>>>>>>  
>>>>>>>      default:
>>>>>>>          if ( type & RAM_TYPE_RESERVED )
>>>>>>>          {
>>>>>>>              if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
>>>>>>> -                return false;
>>>>>>> +                perms = 0;
>>>>>>>          }
>>>>>>> -        else if ( is_hvm_domain(d) || !iommu_hwdom_inclusive || pfn > max_pfn )
>>>>>>> -            return false;
>>>>>>> +        else if ( is_hvm_domain(d) )
>>>>>>> +            return 0;
>>>>>>> +        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
>>>>>>> +            perms = 0;
>>>>>> I'm confused about the reason to set perms = 0 instead of just
>>>>>> returning here. AFAICT perms won't be set to any other value below,
>>>>>> so you might as well just return 0.
>>>>> This is so that ...
>>>>>
>>>>>>>      }
>>>>>>>  
>>>>>>>      /* Check that it doesn't overlap with the Interrupt Address Range. */
>>>>>>>      if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
>>>>>>> -        return false;
>>>>>>> +        return 0;
>>>>>>>      /* ... or the IO-APIC */
>>>>>>> -    for ( i = 0; has_vioapic(d) && i < d->arch.hvm.nr_vioapics; i++ )
>>>>>>> -        if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
>>>>>>> -            return false;
>>>>>>> +    if ( has_vioapic(d) )
>>>>>>> +    {
>>>>>>> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
>>>>>>> +            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
>>>>>>> +                return 0;
>>>>>>> +    }
>>>>>>> +    else if ( is_pv_domain(d) )
>>>>>>> +    {
>>>>>>> +        /*
>>>>>>> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
>>>>>>> +         * ones there, so it should also have such established for IOMMUs.
>>>>>>> +         */
>>>>>>> +        for ( i = 0; i < nr_ioapics; i++ )
>>>>>>> +            if ( pfn == PFN_DOWN(mp_ioapics[i].mpc_apicaddr) )
>>>>>>> +                return rangeset_contains_singleton(mmio_ro_ranges, pfn)
>>>>>>> +                       ? IOMMUF_readable : 0;
>>>>>>> +    }
>>>>> ... this return, as per the comment, takes precedence over returning
>>>>> zero.
>>>> I see. This is because you want to map those in the IOMMU page tables
>>>> even if the IO-APIC ranges are outside of a reserved region.
>>>>
>>>> I have to admit this is kind of weird, because the purpose of this
>>>> function is to add mappings for all memory below 4G, and/or for all
>>>> reserved regions.
>>> Well, that was what it started out as. The purpose here is to be consistent
>>> about IO-APICs: Either have them all mapped, or none of them. Since we map
>>> them in the CPU page tables and since Andrew asked for the two mappings to
>>> be consistent, this is the only way to satisfy the requests. Personally I'd
>>> be okay with not mapping IO-APICs here (but then regardless of whether they
>>> are covered by a reserved region).
>> I'm unsure of the best way to deal with this, it seems like both
>> the CPU and the IOMMU page tables would never be equal for PV dom0,
>> because we have no intention to map the MSI-X tables in RO mode in the
>> IOMMU page tables.
>>
>> I'm not really opposed to having the IO-APIC mapped RO in the IOMMU
>> page tables, but I also don't see much benefit of doing it unless we
>> have a user-case for it. The IO-APIC handling in PV is already
>> different from native, so I would be fine if we add a comment noting
>> that while the IO-APIC is mappable to the CPU page tables as RO it's
>> not present in the IOMMU page tables (and then adjust hwdom_iommu_map
>> to prevent it's mapping).
> Andrew, you did request both mappings to get in sync - thoughts?

Lets step back to first principles.

On real hardware, there is no such thing as read-only-ness of the
physical address space.  Anything like that is a device which accepts
and discards writes.

It's not clear what a real hardware platform would do in this scenario,
but from reading some of the platform docs, I suspect the System Address
Decoder would provide a symmetric view of the hardware address space,
but this doesn't mean that UBOX would tolerate memory accesses uniformly
from all sources.  Also, there's nothing to say that all platforms
behave the same.


For HVM with shared-pt, the CPU and IOMMU mappings really are
identical.  The IOMMU really will get a read-only mapping of real MMCFG,
and holes for fully-emulated devices, which would suffer a IOMMU fault
if targetted.

For HVM without shared-pt, the translations are mostly kept in sync, but
the permissions in the CPU mappings may be reduced for e.g. logdirty
reasons.

For PV guests, things are mostly like the HVM shared-pt case, except
we've got the real IO-APICs mapped read-only, and no fully-emulated devices.


Putting the real IO-APICs in the IOMMU is about as short sighted as
letting the PV guest see them to begin with, but there is nothing
fundamentally wrong with letting a PV guest do a DMA read of the
IO-APIC, seeing as we let it do a CPU read.  (And whether the platform
will even allow it, is a different matter.)


However, it is really important for there to not be a load of special
casing (all undocumented, naturally) keeping the CPU and IOMMU views
different.  It is an error that the views were ever different
(translation wise), and the only legitimate permission difference I can
think of is to support logdirty mode for migration.  (Introspection
protection for device-enabled VMs will be left as an exercise to
whomever first wants to use it.)

Making the guest physical address space view consistent between the CPU
and device is a "because its obviously the correct thing to do" issue. 
Deciding "well it makes no sense for you to have an IO mapping of $FOO"
is a matter of policy that Xen has no legitimate right to be enforcing.

~Andrew

