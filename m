Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B75233DDFDE
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 21:13:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163168.298959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAdMh-00061T-6s; Mon, 02 Aug 2021 19:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163168.298959; Mon, 02 Aug 2021 19:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAdMh-0005yj-39; Mon, 02 Aug 2021 19:12:43 +0000
Received: by outflank-mailman (input) for mailman id 163168;
 Mon, 02 Aug 2021 19:12:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0dAX=MZ=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mAdMf-0005yd-N6
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 19:12:41 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 153b0ae1-fd3c-4dc7-b465-5f28117f3f00;
 Mon, 02 Aug 2021 19:12:40 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id h9so25216600ljq.8
 for <xen-devel@lists.xenproject.org>; Mon, 02 Aug 2021 12:12:39 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b42sm641146lfv.135.2021.08.02.12.12.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Aug 2021 12:12:38 -0700 (PDT)
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
X-Inumbo-ID: 153b0ae1-fd3c-4dc7-b465-5f28117f3f00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=4dn6Oh88Hfe5a8YSjhOlqz2zbl/Xwz+PPUmrkp5aF+Y=;
        b=g8fzRyv+wFS/DdOzu/cqeIHfoXBMo0Rs/UhKVbICN/HXi7S5O72T8J/roDx/GXAlRH
         /GHV6qHAKKkAlCq/SZIKWR67YCUb/mtyE732TL3CcvXQGnoCeEr/so3psa/vk6AUZ8yp
         9sqtc/LOWvyR5OKg/5GZcPW5pkye3nTclw/YeMjv/lTSAH7gGzTQ1MockAqsjiiNgG5e
         0tFYbbcod6EuD5t8gpjjgtgOFyYJofm5T0a5ryBk+i5BdnT+VZ1f91FYqUTxdzCEaVQ6
         SMU82FphAZRa9bEUsSct6fPa++65laP5pPUNyvexratZjuQLL/abh+cLvkwQ6qHXbDZc
         LYLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=4dn6Oh88Hfe5a8YSjhOlqz2zbl/Xwz+PPUmrkp5aF+Y=;
        b=jyNo7Q6Vrnr/6CoI9H1mJzMncOT6a4QjF7LMdOQxd3drjzF5KZJpeq3mh1RQJX6siC
         WSFZkeMSoUOJfGBHkITY/fi740ZQJhBxH5yVg0w8mJRNDXLI/SXgjNt0L/2PLcAvygO+
         1Sh2zxQ9hIsu3hQDLZggbybW3ikPOnmCHXtYmL1XABfPGw3laTsnwwihzT8BLYED9bcY
         0PBkdbD1dvXcmvPVYguVmXhpQNNeasx5PgTDWyDuvWWx2tcdtax+Heru3g63lvk3bZEe
         ZeHstUqQ7c6NCfsJrV+zQLjlPsJpHODylncpUF/uolUwPaI+oDL8gjdPp2v4z86BI8Mc
         ZXtw==
X-Gm-Message-State: AOAM5327M0/CAyIylefJqY4UBP+odbjWfkrubuTCy5RMYqFe59GkGaUV
	7ZVJesKAcXxz5RFdAt1aAOA=
X-Google-Smtp-Source: ABdhPJwQGJuTC4lyrrUMj9xu+tYVql77lGQRGjF+MtAVyvnyXZEMDC8fODh3IcDj3tyW/em/CFVwiQ==
X-Received: by 2002:a2e:a315:: with SMTP id l21mr12088222lje.359.1627931558832;
        Mon, 02 Aug 2021 12:12:38 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
 <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <f6b2e6c6-bf58-960f-4a09-f05ebcf1f566@gmail.com>
Date: Mon, 2 Aug 2021 22:12:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2107301630510.10122@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Stefano,


Thank you for the comments and ideas.


On 31.07.21 02:57, Stefano Stabellini wrote:
> On Fri, 30 Jul 2021, Oleksandr wrote:
>> Hi Andrew, Julien.
>>
>>
>> @Andrew, I think that arguments you provided in your first answer (why the
>> proposed solution is a potentially racy and not a safe) are valid and
>> reasonable.
>> Thanks for the feedback.
>>
>>
>> On 28.07.21 22:53, Julien Grall wrote:
>>>
>>> On 28/07/2021 20:00, Andrew Cooper wrote:
>>>> On 28/07/2021 18:27, Julien Grall wrote:
>>>>> Hi Andrew,
>>>>>
>>>>> On 28/07/2021 18:19, Andrew Cooper wrote:
>>>>>> On 28/07/2021 17:18, Oleksandr Tyshchenko wrote:
>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>>
>>>>>>> Add XENMEM_get_unallocated_space hypercall which purpose is to
>>>>>>> query hypervisor to find regions of guest physical address space
>>>>>>> which are unused and can be used to create grant/foreign mappings
>>>>>>> instead of wasting real pages from the domain memory for
>>>>>>> establishing these mappings. The problem with the current Linux
>>>>>>> on Xen on Arm behaviour is if we want to map some guest memory
>>>>>>> regions in advance or to perform cache mappings in the backend
>>>>>>> we might run out of memory in the host (see XSA-300).
>>>>>>> This of course, depends on the both host and guest memory sizes.
>>>>>>>
>>>>>>> The "unallocated space" can't be figured out precisely by
>>>>>>> the domain on Arm without hypervisor involvement:
>>>>>>> - not all device I/O regions are known by the time domain starts
>>>>>>>      creating grant/foreign mappings
>>>>>>> - the Dom0 is not aware of memory regions used for the identity
>>>>>>>      mappings needed for the PV drivers to work
>>>>>>> In both cases we might end up re-using these regions by
>>>>>>> a mistake. So, the hypervisor which maintains the P2M for the domain
>>>>>>> is in the best position to provide "unallocated space".
>>>>>> I'm afraid this does not improve the situation.
>>>>>>
>>>>>> If a guest follows the advice from XENMEM_get_unallocated_space, and
>>>>>> subsequently a new IO or identity region appears, everything will
>>>>>> explode, because the "safe area" wasn't actually safe.
>>>>>>
>>>>>> The safe range *must* be chosen by the toolstack, because nothing else
>>>>>> can do it safely or correctly.
>>>>> The problem is how do you size it? In particular, a backend may map
>>>>> multiple time the same page (for instance if the page is granted twice).
>>>> The number of mapped grants is limited by the size of the maptrack table
>>>> in Xen, which is a toolstack input to the domaincreate hypercall.
>>>> Therefore, the amount of space required is known and bounded.
>>>>
>>>> There are a handful of other frames required in the current ABI (shared
>>>> info, vcpu info, etc).
>>>>
>>>> The areas where things do become fuzzy is things like foreign mappings,
>>>> acquire_resource, etc for the control domain, which are effectively
>>>> unbounded from the domain's point of view.
>>>>
>>>> For those, its entirely fine to say "here 128G of safe mapping space" or
>>>> so.  Even the quantity of mapping dom0 can make is limited by the shadow
>>>> memory pool and the number of pagetables Xen is willing to expend on the
>>>> second stage translation tables.
>>> FWIW, on Arm, we don't have shadow memory pool.
>>>
>>> Anyway, it should be possible to give a 128GB "safe range" and let Xen deal
>>> with it.
>>>
>>>>>> Once a safe range (or ranges) has been chosen, any subsequent action
>>>>>> which overlaps with the ranges must be rejected, as it will violate
>>>>>> the
>>>>>> guarantees provided.
>>>>>>
>>>>>> Furthermore, the ranges should be made available to the guest via
>>>>>> normal
>>>>>> memory map means.  On x86, this is via the E820 table, and on ARM I
>>>>>> presume the DTB.  There is no need for a new hypercall.
>>>>> Device-Tree only works if you have a guest using it. How about ACPI?
>>>> ACPI inherits E820 from x86 (its a trivial format), and UEFI was also
>>>> based on it.
>>>>
>>>> But whichever...  All firmware interfaces have a memory map.
>>> This will be UEFI memory map. However, I am a bit confused how we can tell
>>> the OS the region will be used for grant/foreign mapping. Is it possible to
>>> reserved a new type?
>>>
>>>>> To me the hypercall solution at least:
>>>>>     1) Avoid to have to define the region on every single firmware table
>>>> There is only ever one.
>>> Why? I could forsee an interest to use the host memory map and therefore we
>>> may need to find a few holes for safe regions to use.
>>>
>>>>>     2) Allow to easily extend after the guest run
>>>> The safe ranges can't be changed (safely).  This is the same problem as
>>>> needing to know things like your PCI apertures ahead of time, or where
>>>> the DIMM hotplug regions are.
>>>>
>>>> Having the guest physmap be actually dynamic is the cause of so many
>>>> bugs (inc security) and misfeatures in Xen.  Guests cannot and do no
>>>> cope with things being fully dynamic, because that's not how real
>>>> hardware works.  What you get is layers and layers of breakage on top of
>>>> each other, rather than a working system.
>>> I would not call it "fully dynamic". Xen can easily know whether a region
>>> has ever be allocated before. So long the region has never been allocated,
>>> then it should be fine. In fact...
>>>
>>>> The size of mapping space is a limit, just like maxphysaddr, or the PCI
>>>> apertures, or MMCFG space, etc.  You can make it large by default (as it
>>>> doesn't consume resource when not being used), but any guest OS isn't
>>>> going to tolerate it morphing during runtime.
>>> ... I believe the OS may be not aware of the hotplug region until it is
>>> actually used.
>>>
>>> Anyway, I suggested this approach a few months ago to Oleksandr (see [1])
>>> which BTW you were CCed on ;). My take was that Xen knows about the
>>> unallocated space and therefore can make an informed decision without having
>>> to allocate insanely large region.
>>>
>>> Now if you think that's fine (IIRC Stefano had a preference for that as
>>> well). Then we can use the firmware table (assuming we can solve the ACPI
>>> question).
>>
>> Well, if new hypercall and, what is more, "the querying hypervisor at runtime
>> to find unused space" model itself is not welcome, I am ok, let's try to
>> create a working system,
>> may we please find a common ground to move this forward (at least on Arm for
>> now, the foreign mapping is the most important question).
>>
>> I got the proposed idea in general, but I haven't connected all dots yet, some
>> points need clarification.
>>
>> 1. The safe range must be defined/allocated in advance and must remain const
>> during the runtime. The safe range must be chosen by the toolstack.
>> [For the initial implementation we can start with some large value (128GB) as
>> discussed above]
>>
>> Questions:
>>
>> - Do we need to inform Xen about that range (via domain_create hypercall,
>> etc)?
>> - What will be in charge of guaranteeing the safety of that range at runtime
>> (reject new mapping requests with possible overlaps, etc), Xen, toolstack or
>> both?
>> - Where that range should be located in guest address space, should that range
>> be the same for all domains (how GUEST_GNTTAB_BASE(SIZE) for example)
>> or it should be calculated based on actual guest_ram_base(size) for a
>> particular domain?
>> - What about a safe range the Dom0 can use itself? Xen should choose it for
>> Dom0 the same way how toolstack chooses it for other domains, correct?
> Brainstorming an idea to answer some of these questions.
>
> Xen needs to be able to choose a safe range without the toolstack's help
> at least for dom0 and dom0less guests.

Completely agree.


> Could we just have Xen choose the
> safe range for all domains?

As I understand, the region info (base, size) should be known to whoever 
generates firmware tables (DTB) for the domain in order to insert that 
range.
So, in case if Xen chooses that range, it should be queried by the 
toolstack anyway (either by new domctl or extending existing one which 
context would fit).
This adds some complexity.


>
> Could it be just as simple as choosing a range 1GB-aligned above
> whatever is the highest address previously allocated for memory, MMIO,
> whatever?
Probably, we could choose a range above max mapped gpfn at the domain 
creation time.
Currently, we are dealing with platform devices only on Arm and all IO 
are known in advance, so no new IO are expected at runtime.
But, what to do when hotplug comes into play (and new conflicting IO 
might just appear)? On the other side, we might be faced with the same 
problem,
if we used a predefined static range. With both options (calculated and 
predefined range) we would need to deny any new conflicting mapping.


>
> We could also have the toolstack provide the info but I wonder if we can
> get away without it.

I may not see all pitfalls here, but it seems that having the same 
predefined range for all domains would simplify things.
On Arm we have the following:

#define GUEST_RAM1_BASE   xen_mk_ullong(0x0200000000) /* 1016GB of RAM @ 
8GB */
#define GUEST_RAM1_SIZE   xen_mk_ullong(0xfe00000000)

Now I am wondering, can we limit the GUEST_RAM1_SIZE by 128GB for 
example in order to reserve a range at the end, would this be acceptable?
So, both Xen and toolstack would see that definition and would be able 
to insert a range to the generated DTB, Xen's P2M code would be in 
change of keeping that range in a safe state.

>> 2. The safe range must be provided to domain using the firmware table.
>> [We can start with the DTB and leave ACPI unimplemented for now, assuming we
>> will be able to solve open questions as discussed above]
>>
>> Questions:
>>
>> - Do we need distinguish between foreign and grant mappings at the domain side
>> at all? Can the same safe range be used for all types of mapping?
> This is a good question. I can't think of a reason why we would need to
> distinguish between the two from Xen's point of view. Would it make
> the Linux implementation easier if we distinguished them?
I may mistake, but I don't think it would make the Linux implementation 
easier, both foreign and grants mappings result in same action which is 
xen_alloc_unpopulated_pages (or alloc_xenballooned_pages).
For both mappings the problem with wasting real domain memory on Arm is 
actual at the moment, although with foreign mapping
for the device emulator use case it becomes more evident.



>
>
>> - How will domain recognize what range can be used for foreign/grant mappings?
>> Do we need to introduce new device-tree bindings for describing the range
>> or it is possible to re-use current bindings (expand the "reg" property under
>> "hypervisor" node, currently it contains gnttab region)?
> Do we need a struct page* for the range? We needed it in the past and it
> is the reason why we currenly use ballooned-out pages: they have a
> proper struct page* associated with them. pte_special() caused problems.
> So, continuing with the assumption that we need a struct page*, then the
> range needs to be advertised as "memory" to the DomU (part to of the
> /memory node). But we can reserve the range for foreign/grant-mapping
> use by adding a reserved-memory binding for it. If we go down this
> route, we should add a new binding as I don't think we should reuse
> reserved-memory/xen,shared-memory.txt. It would be very simply to add,
> just follow the model of xen,shared-memory.txt. (Note that just because
> the range is part of the DomU /memory node, it doesn't mean it needs to
> be backed by real memory.)
>
> If we don't need a struct page* then we can do something different using
> bus ranges and/or MMIO regions.

Yes, we need struct page* for the each pfn in the range. But, I think, 
this can be achieved even without describing the range as a part of 
memory/reserved-memory nodes. Fortunately, the Linux ZONE_DEVICE facility
can help with that, actually the "unpopulated-alloc" is based on this 
feature, please see drivers/xen/unpopulated-alloc.c:fill_list()
and 
https://lore.kernel.org/lkml/1627490656-1267-2-git-send-email-olekstysh@gmail.com/ 
for details.


-- 
Regards,

Oleksandr Tyshchenko


