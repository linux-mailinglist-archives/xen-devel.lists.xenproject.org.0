Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9610022B31C
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 18:04:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jydhL-0000l9-5C; Thu, 23 Jul 2020 16:03:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xWck=BC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jydhK-0000l4-22
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 16:03:54 +0000
X-Inumbo-ID: 1a036372-ccfe-11ea-a2c8-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1a036372-ccfe-11ea-a2c8-12813bfff9fa;
 Thu, 23 Jul 2020 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1595520233;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=EvxeNc47Aj2ifX7I2dOEp/A9QT4H2xQ/u9lwoz5shzI=;
 b=Ik9Htv1Rn4W3lK12SIcVa4z2xYhzG5yEF7ipih+nX4EsdFor5mDF3vNp
 O+/VkZf86n3l74phBQsGxlF0UsCzRYg/Q1JcFCuJHzzzw+SLp99BGfDLr
 dsYLzHtZHFY5xpjmZDTfbPSvzklIhX6vzvaj+0QNrwrwiOVNcgrbiCxz/ U=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: n9UugflWA/BE40d8h8v7T+t8Hk1PRLHxDefttB491tL3qzQz3blSONoIq24jbkc/6Wnn0r8rBU
 XFHH8vvUaGjTEdO/ipfRj37LAZhDf9pbv6oUTkGuIyngH+RK9dyfF9tk2uYHnmxSWpTXoa7asc
 IBXjTlfQNJ/KhIAyoELwzVB14fs1Vz5O378JuSI6x4xoewXdIcNpfbGrFnN8gjSndsCQUQ7ugn
 YZEXeyeQRDOq82nNDfUvVnaeW3j6P0U07RuAPj70IcRn4ncCgk1QVJ3TTv391AQZEHGbukVhpD
 oEo=
X-SBRS: 2.7
X-MesageID: 23390074
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,387,1589256000"; d="scan'208";a="23390074"
Subject: Re: [PATCH 3/3] memory: introduce an option to force onlining of
 hotplug memory
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, David Hildenbrand
 <david@redhat.com>
References: <20200723084523.42109-1-roger.pau@citrix.com>
 <20200723084523.42109-4-roger.pau@citrix.com>
 <21490d49-b2cf-a398-0609-8010bdb0b004@redhat.com>
 <20200723122300.GD7191@Air-de-Roger>
 <e94d9556-f615-bbe2-07d2-08958969ee5f@redhat.com>
 <20200723135930.GH7191@Air-de-Roger>
 <82b131f4-8f50-cd49-65cf-9a87d51b5555@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <e3fd0281-128f-d885-0657-62ae6bce27c8@citrix.com>
Date: Thu, 23 Jul 2020 17:03:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <82b131f4-8f50-cd49-65cf-9a87d51b5555@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On 23/07/2020 16:10, Jürgen Groß wrote:
> On 23.07.20 15:59, Roger Pau Monné wrote:
>> On Thu, Jul 23, 2020 at 03:22:49PM +0200, David Hildenbrand wrote:
>>> On 23.07.20 14:23, Roger Pau Monné wrote:
>>>> On Thu, Jul 23, 2020 at 01:37:03PM +0200, David Hildenbrand wrote:
>>>>> On 23.07.20 10:45, Roger Pau Monne wrote:
>>>>>> Add an extra option to add_memory_resource that overrides the memory
>>>>>> hotplug online behavior in order to force onlining of memory from
>>>>>> add_memory_resource unconditionally.
>>>>>>
>>>>>> This is required for the Xen balloon driver, that must run the
>>>>>> online page callback in order to correctly process the newly added
>>>>>> memory region, note this is an unpopulated region that is used by
>>>>>> Linux
>>>>>> to either hotplug RAM or to map foreign pages from other domains,
>>>>>> and
>>>>>> hence memory hotplug when running on Xen can be used even without
>>>>>> the
>>>>>> user explicitly requesting it, as part of the normal operations
>>>>>> of the
>>>>>> OS when attempting to map memory from a different domain.
>>>>>>
>>>>>> Setting a different default value of memhp_default_online_type when
>>>>>> attaching the balloon driver is not a robust solution, as the
>>>>>> user (or
>>>>>> distro init scripts) could still change it and thus break the Xen
>>>>>> balloon driver.
>>>>>
>>>>> I think we discussed this a couple of times before (even triggered
>>>>> by my
>>>>> request), and this is responsibility of user space to configure.
>>>>> Usually
>>>>> distros have udev rules to online memory automatically.
>>>>> Especially, user
>>>>> space should eb able to configure *how* to online memory.
>>>>
>>>> Note (as per the commit message) that in the specific case I'm
>>>> referring to the memory hotplugged by the Xen balloon driver will be
>>>> an unpopulated range to be used internally by certain Xen subsystems,
>>>> like the xen-blkback or the privcmd drivers. The addition of such
>>>> blocks of (unpopulated) memory can happen without the user explicitly
>>>> requesting it, and hence not even aware such hotplug process is taking
>>>> place. To be clear: no actual RAM will be added to the system.
>>>
>>> Okay, but there is also the case where XEN will actually hotplug memory
>>> using this same handler IIRC (at least I've read papers about it). Both
>>> are using the same handler, correct?
>>
>> Yes, it's used by this dual purpose, which I have to admit I don't
>> like that much either.
>>
>> One set of pages should be clearly used for RAM memory hotplug, and
>> the other to map foreign pages that are not related to memory hotplug,
>> it's just that we happen to need a physical region with backing struct
>> pages.
>>
>>>>
>>>>> It's the admin/distro responsibility to configure this properly.
>>>>> In case
>>>>> this doesn't happen (or as you say, users change it), bad luck.
>>>>>
>>>>> E.g., virtio-mem takes care to not add more memory in case it is not
>>>>> getting onlined. I remember hyper-v has similar code to at least
>>>>> wait a
>>>>> bit for memory to get onlined.
>>>>
>>>> I don't think VirtIO or Hyper-V use the hotplug system in the same way
>>>> as Xen, as said this is done to add unpopulated memory regions that
>>>> will be used to map foreign memory (from other domains) by Xen drivers
>>>> on the system.
>>>
>>> Indeed, if the memory is never exposed to the buddy (and all you
>>> need is
>>> struct pages +  a kernel virtual mapping), I wonder if
>>> memremap/ZONE_DEVICE is what you want?
>>
>> I'm certainly not familiar with the Linux memory subsystem, but if
>> that gets us a backing struct page and a kernel mapping then I would
>> say yes.
>>
>>> Then you won't have user-visible
>>> memory blocks created with unclear online semantics, partially
>>> involving
>>> the buddy.
>>
>> Seems like a fine solution.
>>
>> Juergen: would you be OK to use a separate page-list for
>> alloc_xenballooned_pages on HVM/PVH using the logic described by
>> David?
>>
>> I guess I would leave PV as-is, since it already has this reserved
>> region to map foreign pages.
>
> I would really like a common solution, especially as it would enable
> pv driver domains to use that feature, too.
>
> And finding a region for this memory zone in PVH dom0 should be common
> with PV dom0 after all. We don't want to collide with either PCI space
> or hotplug memory.

While I agree with goal here, these are two very different things, due
to the completely different nature of PV and HVM/PVH guests.

HVM/PVH guests have a concrete guest physical address space.  Linux
needs to pick some gfn's to use which aren't used by anything else (and
Xen's behaviour of not providing any help here is deeply unhelpful, and
needs fixing), and get struct page_info's for them.

PV is totally different.  Linux still needs page_info's for them, but
there is no concept of a guest physical address space.  You can
literally gain access to foreign mappings or grant maps by asking Xen to
modify a PTE.  For convenience with the core code, Linux tries to map
this concept back into a 1:1 pfn space, but it is quite fictitious.

~Andrew

