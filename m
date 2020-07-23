Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC2C22B510
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 19:40:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jyfCR-0001Ta-Vd; Thu, 23 Jul 2020 17:40:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=64jQ=BC=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1jyfCQ-0001Pt-Ce
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 17:40:06 +0000
X-Inumbo-ID: 8a5c92b2-cd0b-11ea-8761-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.81])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 8a5c92b2-cd0b-11ea-8761-bc764e2007e4;
 Thu, 23 Jul 2020 17:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595526003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=JQQuv+xfMQyARaKSLnM372u/UvVcsk6Xh9qk8GAU3yE=;
 b=ZZgPuZIdS0HIo+8XiLgpLworvWxc9THkhnItM7RICiMZCbSZHmRUlIPxoIqhDt6a7Xep9C
 iRhz0YkzVUWwqvohGv/rxr62BoHDFeBvRfahT1/P2915heJbwo8PMKX6ELb1JhQo+C/Fgw
 49+4mqIVkGW/UA5daCl6dJwdINyzTKQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-hY77vW-TO3KITW_4eGbbpA-1; Thu, 23 Jul 2020 13:39:59 -0400
X-MC-Unique: hY77vW-TO3KITW_4eGbbpA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B145F800685;
 Thu, 23 Jul 2020 17:39:57 +0000 (UTC)
Received: from [10.36.114.90] (ovpn-114-90.ams2.redhat.com [10.36.114.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DC86E71D00;
 Thu, 23 Jul 2020 17:39:55 +0000 (UTC)
Subject: Re: [PATCH 3/3] memory: introduce an option to force onlining of
 hotplug memory
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
References: <20200723084523.42109-1-roger.pau@citrix.com>
 <20200723084523.42109-4-roger.pau@citrix.com>
 <21490d49-b2cf-a398-0609-8010bdb0b004@redhat.com>
 <20200723122300.GD7191@Air-de-Roger>
 <e94d9556-f615-bbe2-07d2-08958969ee5f@redhat.com>
 <20200723135930.GH7191@Air-de-Roger>
 <82b131f4-8f50-cd49-65cf-9a87d51b5555@suse.com>
 <20200723162256.GI7191@Air-de-Roger>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <4ff380e9-4b16-4cd0-7753-c2b89bd8ac6b@redhat.com>
Date: Thu, 23 Jul 2020 19:39:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200723162256.GI7191@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.07.20 18:22, Roger Pau Monné wrote:
> On Thu, Jul 23, 2020 at 05:10:03PM +0200, Jürgen Groß wrote:
>> On 23.07.20 15:59, Roger Pau Monné wrote:
>>> On Thu, Jul 23, 2020 at 03:22:49PM +0200, David Hildenbrand wrote:
>>>> On 23.07.20 14:23, Roger Pau Monné wrote:
>>>>> On Thu, Jul 23, 2020 at 01:37:03PM +0200, David Hildenbrand wrote:
>>>>>> On 23.07.20 10:45, Roger Pau Monne wrote:
>>>>>>> Add an extra option to add_memory_resource that overrides the memory
>>>>>>> hotplug online behavior in order to force onlining of memory from
>>>>>>> add_memory_resource unconditionally.
>>>>>>>
>>>>>>> This is required for the Xen balloon driver, that must run the
>>>>>>> online page callback in order to correctly process the newly added
>>>>>>> memory region, note this is an unpopulated region that is used by Linux
>>>>>>> to either hotplug RAM or to map foreign pages from other domains, and
>>>>>>> hence memory hotplug when running on Xen can be used even without the
>>>>>>> user explicitly requesting it, as part of the normal operations of the
>>>>>>> OS when attempting to map memory from a different domain.
>>>>>>>
>>>>>>> Setting a different default value of memhp_default_online_type when
>>>>>>> attaching the balloon driver is not a robust solution, as the user (or
>>>>>>> distro init scripts) could still change it and thus break the Xen
>>>>>>> balloon driver.
>>>>>>
>>>>>> I think we discussed this a couple of times before (even triggered by my
>>>>>> request), and this is responsibility of user space to configure. Usually
>>>>>> distros have udev rules to online memory automatically. Especially, user
>>>>>> space should eb able to configure *how* to online memory.
>>>>>
>>>>> Note (as per the commit message) that in the specific case I'm
>>>>> referring to the memory hotplugged by the Xen balloon driver will be
>>>>> an unpopulated range to be used internally by certain Xen subsystems,
>>>>> like the xen-blkback or the privcmd drivers. The addition of such
>>>>> blocks of (unpopulated) memory can happen without the user explicitly
>>>>> requesting it, and hence not even aware such hotplug process is taking
>>>>> place. To be clear: no actual RAM will be added to the system.
>>>>
>>>> Okay, but there is also the case where XEN will actually hotplug memory
>>>> using this same handler IIRC (at least I've read papers about it). Both
>>>> are using the same handler, correct?
>>>
>>> Yes, it's used by this dual purpose, which I have to admit I don't
>>> like that much either.
>>>
>>> One set of pages should be clearly used for RAM memory hotplug, and
>>> the other to map foreign pages that are not related to memory hotplug,
>>> it's just that we happen to need a physical region with backing struct
>>> pages.
>>>
>>>>>
>>>>>> It's the admin/distro responsibility to configure this properly. In case
>>>>>> this doesn't happen (or as you say, users change it), bad luck.
>>>>>>
>>>>>> E.g., virtio-mem takes care to not add more memory in case it is not
>>>>>> getting onlined. I remember hyper-v has similar code to at least wait a
>>>>>> bit for memory to get onlined.
>>>>>
>>>>> I don't think VirtIO or Hyper-V use the hotplug system in the same way
>>>>> as Xen, as said this is done to add unpopulated memory regions that
>>>>> will be used to map foreign memory (from other domains) by Xen drivers
>>>>> on the system.
>>>>
>>>> Indeed, if the memory is never exposed to the buddy (and all you need is
>>>> struct pages +  a kernel virtual mapping), I wonder if
>>>> memremap/ZONE_DEVICE is what you want?
>>>
>>> I'm certainly not familiar with the Linux memory subsystem, but if
>>> that gets us a backing struct page and a kernel mapping then I would
>>> say yes.
>>>
>>>> Then you won't have user-visible
>>>> memory blocks created with unclear online semantics, partially involving
>>>> the buddy.
>>>
>>> Seems like a fine solution.
>>>
>>> Juergen: would you be OK to use a separate page-list for
>>> alloc_xenballooned_pages on HVM/PVH using the logic described by
>>> David?
>>>
>>> I guess I would leave PV as-is, since it already has this reserved
>>> region to map foreign pages.
>>
>> I would really like a common solution, especially as it would enable
>> pv driver domains to use that feature, too.
> 
> I think PV is much more easy on that regard, as it doesn't have MMIO
> holes except when using PCI passthrough, and in that case it's
> trivial to identify those.
> 
> However on HVM/PVH this is not so trivial. I'm certainly not opposing
> to a solution that covers both, but ATM I would really like to get
> something working for PVH dom0, or else it's not usable on Linux IMO.
> 
>> And finding a region for this memory zone in PVH dom0 should be common
>> with PV dom0 after all. We don't want to collide with either PCI space
>> or hotplug memory.
> 
> Right, we could use the native memory map for that on dom0, and maybe
> create a custom resource for the Xen balloon driver instead of
> allocating from iomem_resource?
> 
> DomUs are more tricky as a guest has no idea where mappings can be
> safely placed, maybe we will have to resort to iomem_resource in that
> case, as I don't see much other option due to the lack of information
> from Xen.
> 
> I also think that ZONE_DEVICE will need some adjustments, for once the
> types in memory_type don't seem to be suitable for Xen, as they are
> either specific to DAX or PCI. I gave a try at using allocate_resource
> plus memremap_pages but that didn't seem to fly, I will need to
> investigate further.
> 
> Maybe we can resort to something even simpler than memremap_pages? I
> certainly have very little idea of how this is supposed to be used,
> but dev_pagemap seems overly complex for what we are trying to
> achieve.

Yeah, might require some code churn. It just feels wrong to involve
buddy concepts (e.g., onlining pages, calling memory notifiers, exposing
memory block devices) and introducing hacks (forced onlining) just to
get a memmap+identity mapping+iomem resource. I think reserving such a
region during boot as suggested is the easiest approach, but I am
*absolutely* not an expert on all these XEN-specific things :)

-- 
Thanks,

David / dhildenb


