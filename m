Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4131C27661B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 03:57:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLGVW-00082p-BI; Thu, 24 Sep 2020 01:57:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dHx=DB=linux.alibaba.com=richard.weiyang@srs-us1.protection.inumbo.net>)
 id 1kLGVV-00082k-7a
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 01:57:13 +0000
X-Inumbo-ID: a1ac3287-b352-4fe6-9416-e6bc393e96b2
Received: from out30-130.freemail.mail.aliyun.com (unknown [115.124.30.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a1ac3287-b352-4fe6-9416-e6bc393e96b2;
 Thu, 24 Sep 2020 01:57:09 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R231e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=richard.weiyang@linux.alibaba.com; NM=1; PH=DS; RN=21; SR=0;
 TI=SMTPD_---0U9uuGE7_1600912620; 
Received: from localhost(mailfrom:richard.weiyang@linux.alibaba.com
 fp:SMTPD_---0U9uuGE7_1600912620) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 24 Sep 2020 09:57:01 +0800
Date: Thu, 24 Sep 2020 09:57:00 +0800
From: Wei Yang <richard.weiyang@linux.alibaba.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: David Hildenbrand <david@redhat.com>, osalvador@suse.de,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 Dave Hansen <dave.hansen@intel.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Scott Cheloha <cheloha@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Wei Yang <richard.weiyang@linux.alibaba.com>
Subject: Re: [PATCH RFC 0/4] mm: place pages to the freelist tail when onling
 and undoing isolation
Message-ID: <20200924015700.GA3145@L-31X9LVDL-1304.local>
References: <5c0910c2cd0d9d351e509392a45552fb@suse.de>
 <DAC9E747-BDDF-41B6-A89B-604880DD7543@redhat.com>
 <67928cbd-950a-3279-bf9b-29b04c87728b@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <67928cbd-950a-3279-bf9b-29b04c87728b@suse.cz>
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
Reply-To: Wei Yang <richard.weiyang@linux.alibaba.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Wed, Sep 23, 2020 at 04:31:25PM +0200, Vlastimil Babka wrote:
>On 9/16/20 9:31 PM, David Hildenbrand wrote:
>> 
>> 
>>> Am 16.09.2020 um 20:50 schrieb osalvador@suse.de:
>>> 
>>> ﻿On 2020-09-16 20:34, David Hildenbrand wrote:
>>>> When adding separate memory blocks via add_memory*() and onlining them
>>>> immediately, the metadata (especially the memmap) of the next block will be
>>>> placed onto one of the just added+onlined block. This creates a chain
>>>> of unmovable allocations: If the last memory block cannot get
>>>> offlined+removed() so will all dependant ones. We directly have unmovable
>>>> allocations all over the place.
>>>> This can be observed quite easily using virtio-mem, however, it can also
>>>> be observed when using DIMMs. The freshly onlined pages will usually be
>>>> placed to the head of the freelists, meaning they will be allocated next,
>>>> turning the just-added memory usually immediately un-removable. The
>>>> fresh pages are cold, prefering to allocate others (that might be hot)
>>>> also feels to be the natural thing to do.
>>>> It also applies to the hyper-v balloon xen-balloon, and ppc64 dlpar: when
>>>> adding separate, successive memory blocks, each memory block will have
>>>> unmovable allocations on them - for example gigantic pages will fail to
>>>> allocate.
>>>> While the ZONE_NORMAL doesn't provide any guarantees that memory can get
>>>> offlined+removed again (any kind of fragmentation with unmovable
>>>> allocations is possible), there are many scenarios (hotplugging a lot of
>>>> memory, running workload, hotunplug some memory/as much as possible) where
>>>> we can offline+remove quite a lot with this patchset.
>>> 
>>> Hi David,
>>> 
>> 
>> Hi Oscar.
>> 
>>> I did not read through the patchset yet, so sorry if the question is nonsense, but is this not trying to fix the same issue the vmemmap patches did? [1]
>> 
>> Not nonesense at all. It only helps to some degree, though. It solves the dependencies due to the memmap. However, it‘s not completely ideal, especially for single memory blocks.
>> 
>> With single memory blocks (virtio-mem, xen-balloon, hv balloon, ppc dlpar) you still have unmovable (vmemmap chunks) all over the physical address space. Consider the gigantic page example after hotplug. You directly fragmented all hotplugged memory.
>> 
>> Of course, there might be (less extreme) dependencies due page tables for the identity mapping, extended struct pages and similar.
>> 
>> Having that said, there are other benefits when preferring other memory over just hotplugged memory. Think about adding+onlining memory during boot (dimms under QEMU, virtio-mem), once the system is up you will have most (all) of that memory completely untouched.
>> 
>> So while vmemmap on hotplugged memory would tackle some part of the issue, there are cases where this approach is better, and there are even benefits when combining both.
>
>I see the point, but I don't think the head/tail mechanism is great for this. It
>might sort of work, but with other interfering activity there are no guarantees
>and it relies on a subtle implementation detail. There are better mechanisms
>possible I think, such as preparing a larger MIGRATE_UNMOVABLE area in the
>existing memory before we allocate those long-term management structures. Or
>onlining a bunch of blocks as zone_movable first and only later convert to
>zone_normal in a controlled way when existing normal zone becomes depeted?
>

To be honest, David's approach is easy to understand for me.

And I don't see some negative effect.

>I guess it's an issue that the e.g. 128M block onlines are so disconnected from
>each other it's hard to employ a strategy that works best for e.g. a whole bunch
>of GB onlined at once. But I noticed some effort towards new API, so maybe that
>will be solved there too?
>
>> Thanks!
>> 
>> David
>> 
>>> 
>>> I was about to give it a new respin now that thw hwpoison stuff has been settled.
>>> 
>>> [1] https://patchwork.kernel.org/cover/11059175/
>>> 
>> 

-- 
Wei Yang
Help you, Help me

