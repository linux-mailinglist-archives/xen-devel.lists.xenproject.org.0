Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C926926C87D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 20:51:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIcVz-0002Cj-2l; Wed, 16 Sep 2020 18:50:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PRfW=CZ=suse.de=osalvador@srs-us1.protection.inumbo.net>)
 id 1kIcVx-0002BU-Ip
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 18:50:45 +0000
X-Inumbo-ID: 3f970732-a93a-455f-9315-c892a9f42fa4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3f970732-a93a-455f-9315-c892a9f42fa4;
 Wed, 16 Sep 2020 18:50:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4D40AF6D;
 Wed, 16 Sep 2020 18:50:58 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 16 Sep 2020 20:50:41 +0200
From: osalvador@suse.de
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-hyperv@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>, Dave Hansen
 <dave.hansen@intel.com>, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Mel Gorman <mgorman@techsingularity.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Scott Cheloha <cheloha@linux.ibm.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Vlastimil Babka
 <vbabka@suse.cz>, Wei Liu <wei.liu@kernel.org>, Wei Yang
 <richard.weiyang@linux.alibaba.com>
Subject: Re: [PATCH RFC 0/4] mm: place pages to the freelist tail when onling
 and undoing isolation
In-Reply-To: <20200916183411.64756-1-david@redhat.com>
References: <20200916183411.64756-1-david@redhat.com>
User-Agent: Roundcube Webmail
Message-ID: <5c0910c2cd0d9d351e509392a45552fb@suse.de>
X-Sender: osalvador@suse.de
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-09-16 20:34, David Hildenbrand wrote:
> When adding separate memory blocks via add_memory*() and onlining them
> immediately, the metadata (especially the memmap) of the next block 
> will be
> placed onto one of the just added+onlined block. This creates a chain
> of unmovable allocations: If the last memory block cannot get
> offlined+removed() so will all dependant ones. We directly have 
> unmovable
> allocations all over the place.
> 
> This can be observed quite easily using virtio-mem, however, it can 
> also
> be observed when using DIMMs. The freshly onlined pages will usually be
> placed to the head of the freelists, meaning they will be allocated 
> next,
> turning the just-added memory usually immediately un-removable. The
> fresh pages are cold, prefering to allocate others (that might be hot)
> also feels to be the natural thing to do.
> 
> It also applies to the hyper-v balloon xen-balloon, and ppc64 dlpar: 
> when
> adding separate, successive memory blocks, each memory block will have
> unmovable allocations on them - for example gigantic pages will fail to
> allocate.
> 
> While the ZONE_NORMAL doesn't provide any guarantees that memory can 
> get
> offlined+removed again (any kind of fragmentation with unmovable
> allocations is possible), there are many scenarios (hotplugging a lot 
> of
> memory, running workload, hotunplug some memory/as much as possible) 
> where
> we can offline+remove quite a lot with this patchset.

Hi David,

I did not read through the patchset yet, so sorry if the question is 
nonsense, but is this not trying to fix the same issue the vmemmap 
patches did? [1]

I was about to give it a new respin now that thw hwpoison stuff has been 
settled.

[1] https://patchwork.kernel.org/cover/11059175/
> 

