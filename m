Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C318A3D963E
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 21:54:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161789.296914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8pcU-0003oA-WC; Wed, 28 Jul 2021 19:53:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161789.296914; Wed, 28 Jul 2021 19:53:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8pcU-0003ld-SO; Wed, 28 Jul 2021 19:53:34 +0000
Received: by outflank-mailman (input) for mailman id 161789;
 Wed, 28 Jul 2021 19:53:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m8pcT-0003lX-Hi
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 19:53:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8pcM-00008E-CT; Wed, 28 Jul 2021 19:53:26 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m8pcM-0003X9-59; Wed, 28 Jul 2021 19:53:26 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=q6+SfKiqHcZjDQbkJ38XBm0Pn6LUf3twKQ8u/fdEoDQ=; b=bRejpFjYzFEjyEJ9yIFy/DcxVC
	GEI5LcCJInC3fl2GGCZQ+tNKvGp2JJfq3N+qygRgB7FbBuEEC42Agd5XN3YJogCx72HHHYYZxTRta
	wYQBs2U2LLY1fM4KTzF3teUUShbAzulOAdreGiwJFX11RT5okCV6AO4SnecLrJoQ4MU4=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
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
From: Julien Grall <julien@xen.org>
Message-ID: <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
Date: Wed, 28 Jul 2021 20:53:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 28/07/2021 20:00, Andrew Cooper wrote:
> On 28/07/2021 18:27, Julien Grall wrote:
>> Hi Andrew,
>>
>> On 28/07/2021 18:19, Andrew Cooper wrote:
>>> On 28/07/2021 17:18, Oleksandr Tyshchenko wrote:
>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>
>>>> Add XENMEM_get_unallocated_space hypercall which purpose is to
>>>> query hypervisor to find regions of guest physical address space
>>>> which are unused and can be used to create grant/foreign mappings
>>>> instead of wasting real pages from the domain memory for
>>>> establishing these mappings. The problem with the current Linux
>>>> on Xen on Arm behaviour is if we want to map some guest memory
>>>> regions in advance or to perform cache mappings in the backend
>>>> we might run out of memory in the host (see XSA-300).
>>>> This of course, depends on the both host and guest memory sizes.
>>>>
>>>> The "unallocated space" can't be figured out precisely by
>>>> the domain on Arm without hypervisor involvement:
>>>> - not all device I/O regions are known by the time domain starts
>>>>     creating grant/foreign mappings
>>>> - the Dom0 is not aware of memory regions used for the identity
>>>>     mappings needed for the PV drivers to work
>>>> In both cases we might end up re-using these regions by
>>>> a mistake. So, the hypervisor which maintains the P2M for the domain
>>>> is in the best position to provide "unallocated space".
>>>
>>> I'm afraid this does not improve the situation.
>>>
>>> If a guest follows the advice from XENMEM_get_unallocated_space, and
>>> subsequently a new IO or identity region appears, everything will
>>> explode, because the "safe area" wasn't actually safe.
>>>
>>> The safe range *must* be chosen by the toolstack, because nothing else
>>> can do it safely or correctly.
>>
>> The problem is how do you size it? In particular, a backend may map
>> multiple time the same page (for instance if the page is granted twice).
> 
> The number of mapped grants is limited by the size of the maptrack table
> in Xen, which is a toolstack input to the domaincreate hypercall.
> Therefore, the amount of space required is known and bounded.
> 
> There are a handful of other frames required in the current ABI (shared
> info, vcpu info, etc).
> 
> The areas where things do become fuzzy is things like foreign mappings,
> acquire_resource, etc for the control domain, which are effectively
> unbounded from the domain's point of view.
> 
> For those, its entirely fine to say "here 128G of safe mapping space" or
> so.  Even the quantity of mapping dom0 can make is limited by the shadow
> memory pool and the number of pagetables Xen is willing to expend on the
> second stage translation tables.

FWIW, on Arm, we don't have shadow memory pool.

Anyway, it should be possible to give a 128GB "safe range" and let Xen 
deal with it.

> 
>>
>>>
>>> Once a safe range (or ranges) has been chosen, any subsequent action
>>> which overlaps with the ranges must be rejected, as it will violate the
>>> guarantees provided.
>>>
>>> Furthermore, the ranges should be made available to the guest via normal
>>> memory map means.  On x86, this is via the E820 table, and on ARM I
>>> presume the DTB.  There is no need for a new hypercall.
>>
>> Device-Tree only works if you have a guest using it. How about ACPI?
> 
> ACPI inherits E820 from x86 (its a trivial format), and UEFI was also
> based on it.
> 
> But whichever...  All firmware interfaces have a memory map.

This will be UEFI memory map. However, I am a bit confused how we can 
tell the OS the region will be used for grant/foreign mapping. Is it 
possible to reserved a new type?

> 
>> To me the hypercall solution at least:
>>    1) Avoid to have to define the region on every single firmware table
> 
> There is only ever one.

Why? I could forsee an interest to use the host memory map and therefore 
we may need to find a few holes for safe regions to use.

> 
>>    2) Allow to easily extend after the guest run
> 
> The safe ranges can't be changed (safely).  This is the same problem as
> needing to know things like your PCI apertures ahead of time, or where
> the DIMM hotplug regions are.
> 
> Having the guest physmap be actually dynamic is the cause of so many
> bugs (inc security) and misfeatures in Xen.  Guests cannot and do no
> cope with things being fully dynamic, because that's not how real
> hardware works.  What you get is layers and layers of breakage on top of
> each other, rather than a working system.

I would not call it "fully dynamic". Xen can easily know whether a 
region has ever be allocated before. So long the region has never been 
allocated, then it should be fine. In fact...

> 
> The size of mapping space is a limit, just like maxphysaddr, or the PCI
> apertures, or MMCFG space, etc.  You can make it large by default (as it
> doesn't consume resource when not being used), but any guest OS isn't
> going to tolerate it morphing during runtime.
... I believe the OS may be not aware of the hotplug region until it is 
actually used.

Anyway, I suggested this approach a few months ago to Oleksandr (see 
[1]) which BTW you were CCed on ;). My take was that Xen knows about the 
unallocated space and therefore can make an informed decision without 
having to allocate insanely large region.

Now if you think that's fine (IIRC Stefano had a preference for that as 
well). Then we can use the firmware table (assuming we can solve the 
ACPI question).

At the end of the day, this is not really the interesting bit of the 
problem. What matter if the OS part where hopefully Linux will be able 
to use normally the RAM. We may even be able to fix XSA-300!

Cheers,

[1] <YJ3jlGSxs60Io+dp@mattapan.m5p.com>

-- 
Julien Grall

