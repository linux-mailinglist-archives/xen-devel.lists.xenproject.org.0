Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABBC3DBCEE
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 18:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162614.298165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9V9E-0005pi-NE; Fri, 30 Jul 2021 16:14:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162614.298165; Fri, 30 Jul 2021 16:14:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9V9E-0005nu-Jj; Fri, 30 Jul 2021 16:14:08 +0000
Received: by outflank-mailman (input) for mailman id 162614;
 Fri, 30 Jul 2021 16:14:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v/MC=MW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1m9V9C-0005no-Eg
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 16:14:06 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7136e444-7e0c-496f-b92d-6ee58dcef811;
 Fri, 30 Jul 2021 16:14:04 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y7so11680112eda.5
 for <xen-devel@lists.xenproject.org>; Fri, 30 Jul 2021 09:14:04 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id mh10sm704059ejb.32.2021.07.30.09.14.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 09:14:03 -0700 (PDT)
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
X-Inumbo-ID: 7136e444-7e0c-496f-b92d-6ee58dcef811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=7ho/jKVLVVep0rtWUMLNDL6VBEO7YmmZllY4MTv0QlQ=;
        b=u9ADuI2TRINpodV+dOjGfho8EiaHVUKsPxsU7VQ7WcZEYnRsGYGq+rZ8HavkLjm4EH
         dCccd6OxknCN3J8V2SlTMUIenxQ89SyM0B6SllPsGiIYL3PdYFV+vdNSb2yBFLGJQGR0
         hZfukF/DiRbfuVaCVjkvYKk8v/QXhcAD8MxMx5cmYltmtzw689onlt1SK7TPbhRZ9ZsO
         idbaZdUMGUo0wn8rY8/lyXoq56qrGXcaM/Glo16Aibkml36+mwSeOYEBnnOB28Lkujba
         9vk97RnFPTjsv3yt3f9pCyOLR9wpVqMFnZWnERl23SqfWKUtE758XjExuKyNy6bk5NkR
         TyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=7ho/jKVLVVep0rtWUMLNDL6VBEO7YmmZllY4MTv0QlQ=;
        b=jHdtmROAIFAIMSfipOWdr37de7HCGS46wSJkR0MDAbDEzg1q7M3Ztv6kZXFcI2rXzZ
         9CHGlwW15y1TbDuaimABXOyiAjrQpKFVCtQbc/PZoPp4jdBjlyZg3zH6jJHk3J1BOqJJ
         Xijg+uT3o7ivfg5g5fIGO5TJMhmh/hMbkiwe9HQ8YCM3jWJYLfUa0RaxhcW5hGhV+8r4
         B+4xUYBdfvr2xjqmzHHPfE7NDCK2l5W0pBycjneg5fLu/TXxzNoMTHPaS497n27anHce
         E2cYfHhLrgRxfKFEIr+PZLIMMCGQstA2wtfmh/WnTgaDVdLKsNPkZWUAwU3KwUeABidf
         Y/Tg==
X-Gm-Message-State: AOAM5313OoYxUJxx2jvYmA8t3o8Rg+VS6GsfwyVTijlvY8nHuE85lj6H
	YEHpHCMa2d+igvyKN8XmJ0g=
X-Google-Smtp-Source: ABdhPJzXsNrOXCRMasmnNswBWQm6LQKGpk1fFqnudeLNfU98fwAZBX689DR8zqd218ilnYLljQ7Ufw==
X-Received: by 2002:a05:6402:cb9:: with SMTP id cn25mr3907167edb.271.1627661643470;
        Fri, 30 Jul 2021 09:14:03 -0700 (PDT)
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <6a633f4e-13e0-4a2b-cf6e-35ef90ae977c@gmail.com>
Date: Fri, 30 Jul 2021 19:13:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Andrew, Julien.


@Andrew, I think that arguments you provided in your first answer (why 
the proposed solution is a potentially racy and not a safe) are valid 
and reasonable.
Thanks for the feedback.


On 28.07.21 22:53, Julien Grall wrote:
>
>
> On 28/07/2021 20:00, Andrew Cooper wrote:
>> On 28/07/2021 18:27, Julien Grall wrote:
>>> Hi Andrew,
>>>
>>> On 28/07/2021 18:19, Andrew Cooper wrote:
>>>> On 28/07/2021 17:18, Oleksandr Tyshchenko wrote:
>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>
>>>>> Add XENMEM_get_unallocated_space hypercall which purpose is to
>>>>> query hypervisor to find regions of guest physical address space
>>>>> which are unused and can be used to create grant/foreign mappings
>>>>> instead of wasting real pages from the domain memory for
>>>>> establishing these mappings. The problem with the current Linux
>>>>> on Xen on Arm behaviour is if we want to map some guest memory
>>>>> regions in advance or to perform cache mappings in the backend
>>>>> we might run out of memory in the host (see XSA-300).
>>>>> This of course, depends on the both host and guest memory sizes.
>>>>>
>>>>> The "unallocated space" can't be figured out precisely by
>>>>> the domain on Arm without hypervisor involvement:
>>>>> - not all device I/O regions are known by the time domain starts
>>>>>     creating grant/foreign mappings
>>>>> - the Dom0 is not aware of memory regions used for the identity
>>>>>     mappings needed for the PV drivers to work
>>>>> In both cases we might end up re-using these regions by
>>>>> a mistake. So, the hypervisor which maintains the P2M for the domain
>>>>> is in the best position to provide "unallocated space".
>>>>
>>>> I'm afraid this does not improve the situation.
>>>>
>>>> If a guest follows the advice from XENMEM_get_unallocated_space, and
>>>> subsequently a new IO or identity region appears, everything will
>>>> explode, because the "safe area" wasn't actually safe.
>>>>
>>>> The safe range *must* be chosen by the toolstack, because nothing else
>>>> can do it safely or correctly.
>>>
>>> The problem is how do you size it? In particular, a backend may map
>>> multiple time the same page (for instance if the page is granted 
>>> twice).
>>
>> The number of mapped grants is limited by the size of the maptrack table
>> in Xen, which is a toolstack input to the domaincreate hypercall.
>> Therefore, the amount of space required is known and bounded.
>>
>> There are a handful of other frames required in the current ABI (shared
>> info, vcpu info, etc).
>>
>> The areas where things do become fuzzy is things like foreign mappings,
>> acquire_resource, etc for the control domain, which are effectively
>> unbounded from the domain's point of view.
>>
>> For those, its entirely fine to say "here 128G of safe mapping space" or
>> so.  Even the quantity of mapping dom0 can make is limited by the shadow
>> memory pool and the number of pagetables Xen is willing to expend on the
>> second stage translation tables.
>
> FWIW, on Arm, we don't have shadow memory pool.
>
> Anyway, it should be possible to give a 128GB "safe range" and let Xen 
> deal with it.
>
>>
>>>
>>>>
>>>> Once a safe range (or ranges) has been chosen, any subsequent action
>>>> which overlaps with the ranges must be rejected, as it will violate 
>>>> the
>>>> guarantees provided.
>>>>
>>>> Furthermore, the ranges should be made available to the guest via 
>>>> normal
>>>> memory map means.  On x86, this is via the E820 table, and on ARM I
>>>> presume the DTB.  There is no need for a new hypercall.
>>>
>>> Device-Tree only works if you have a guest using it. How about ACPI?
>>
>> ACPI inherits E820 from x86 (its a trivial format), and UEFI was also
>> based on it.
>>
>> But whichever...  All firmware interfaces have a memory map.
>
> This will be UEFI memory map. However, I am a bit confused how we can 
> tell the OS the region will be used for grant/foreign mapping. Is it 
> possible to reserved a new type?
>
>>
>>> To me the hypercall solution at least:
>>>    1) Avoid to have to define the region on every single firmware table
>>
>> There is only ever one.
>
> Why? I could forsee an interest to use the host memory map and 
> therefore we may need to find a few holes for safe regions to use.
>
>>
>>>    2) Allow to easily extend after the guest run
>>
>> The safe ranges can't be changed (safely).  This is the same problem as
>> needing to know things like your PCI apertures ahead of time, or where
>> the DIMM hotplug regions are.
>>
>> Having the guest physmap be actually dynamic is the cause of so many
>> bugs (inc security) and misfeatures in Xen.  Guests cannot and do no
>> cope with things being fully dynamic, because that's not how real
>> hardware works.  What you get is layers and layers of breakage on top of
>> each other, rather than a working system.
>
> I would not call it "fully dynamic". Xen can easily know whether a 
> region has ever be allocated before. So long the region has never been 
> allocated, then it should be fine. In fact...
>
>>
>> The size of mapping space is a limit, just like maxphysaddr, or the PCI
>> apertures, or MMCFG space, etc.  You can make it large by default (as it
>> doesn't consume resource when not being used), but any guest OS isn't
>> going to tolerate it morphing during runtime.
> ... I believe the OS may be not aware of the hotplug region until it 
> is actually used.
>
> Anyway, I suggested this approach a few months ago to Oleksandr (see 
> [1]) which BTW you were CCed on ;). My take was that Xen knows about 
> the unallocated space and therefore can make an informed decision 
> without having to allocate insanely large region.
>
> Now if you think that's fine (IIRC Stefano had a preference for that 
> as well). Then we can use the firmware table (assuming we can solve 
> the ACPI question).


Well, if new hypercall and, what is more, "the querying hypervisor at 
runtime to find unused space" model itself is not welcome, I am ok, 
let's try to create a working system,
may we please find a common ground to move this forward (at least on Arm 
for now, the foreign mapping is the most important question).

I got the proposed idea in general, but I haven't connected all dots 
yet, some points need clarification.

1. The safe range must be defined/allocated in advance and must remain 
const during the runtime. The safe range must be chosen by the toolstack.
[For the initial implementation we can start with some large value 
(128GB) as discussed above]

Questions:

- Do we need to inform Xen about that range (via domain_create 
hypercall, etc)?
- What will be in charge of guaranteeing the safety of that range at 
runtime (reject new mapping requests with possible overlaps, etc), Xen, 
toolstack or both?
- Where that range should be located in guest address space, should that 
range be the same for all domains (how GUEST_GNTTAB_BASE(SIZE) for example)
or it should be calculated based on actual guest_ram_base(size) for a 
particular domain?
- What about a safe range the Dom0 can use itself? Xen should choose it 
for Dom0 the same way how toolstack chooses it for other domains, correct?

2. The safe range must be provided to domain using the firmware table.
[We can start with the DTB and leave ACPI unimplemented for now, 
assuming we will be able to solve open questions as discussed above]

Questions:

- Do we need distinguish between foreign and grant mappings at the 
domain side at all? Can the same safe range be used for all types of 
mapping?
- How will domain recognize what range can be used for foreign/grant 
mappings? Do we need to introduce new device-tree bindings for 
describing the range
or it is possible to re-use current bindings (expand the "reg" property 
under "hypervisor" node, currently it contains gnttab region)?


>
> At the end of the day, this is not really the interesting bit of the 
> problem. What matter if the OS part where hopefully Linux will be able 
> to use normally the RAM. We may even be able to fix XSA-300!
>
> Cheers,
>
> [1] <YJ3jlGSxs60Io+dp@mattapan.m5p.com>
>
-- 
Regards,

Oleksandr Tyshchenko


