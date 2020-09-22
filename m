Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1B4274737
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 19:05:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKlil-00080A-61; Tue, 22 Sep 2020 17:04:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no0J=C7=linux.intel.com=tvrtko.ursulin@srs-us1.protection.inumbo.net>)
 id 1kKlik-000805-NG
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 17:04:50 +0000
X-Inumbo-ID: 2ab6e0b3-13b2-4a1c-8f64-434686c94c0b
Received: from mga04.intel.com (unknown [192.55.52.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ab6e0b3-13b2-4a1c-8f64-434686c94c0b;
 Tue, 22 Sep 2020 17:04:48 +0000 (UTC)
IronPort-SDR: mRiak4WLSsx6zDQq69u7iaLM45uBmIMuYmfuSrfl/ZhR0o9omm52q7EpZyWsN/9VaFKbBMdhRq
 sHCHz3qIsjpA==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="158043619"
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="158043619"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 10:04:47 -0700
IronPort-SDR: pDr7f0tvI2tkaSrmro3ZOlGNzDsLFUlZA0Y2mT+eov61oD3VbMWAcbZ9JV/I+/GzNzMjkvUYD3
 Fddbwl4KcUrw==
X-IronPort-AV: E=Sophos;i="5.77,291,1596524400"; d="scan'208";a="454564080"
Received: from atroib-mobl2.ger.corp.intel.com (HELO [10.214.238.184])
 ([10.214.238.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 10:04:40 -0700
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
To: Christoph Hellwig <hch@lst.de>
Cc: Matthew Wilcox <willy@infradead.org>, Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>, intel-gfx@lists.freedesktop.org,
 Nitin Gupta <ngupta@vflare.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org> <20200922062249.GA30831@lst.de>
 <43d10588-2033-038b-14e4-9f41cd622d7b@linux.intel.com>
 <20200922143141.GA26637@lst.de>
 <e429c3e6-2143-f51a-4c1c-c1470076ad3e@linux.intel.com>
 <20200922163346.GA1701@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <1b05b9d6-a14c-85cd-0728-d0d40c9ff84b@linux.intel.com>
Date: Tue, 22 Sep 2020 18:04:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922163346.GA1701@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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


On 22/09/2020 17:33, Christoph Hellwig wrote:
> On Tue, Sep 22, 2020 at 05:13:45PM +0100, Tvrtko Ursulin wrote:
>>>    void *shmem_pin_map(struct file *file)
>>>    {
>>> -	const size_t n_pte = shmem_npte(file);
>>> -	pte_t *stack[32], **ptes, **mem;
>>
>> Chris can comment how much he'd miss the 32 page stack shortcut.
> 
> I'd like to see a profile that claim that kmalloc matters in a
> path that does a vmap and reads pages through the page cache.
> Especially when the kmalloc saves doing another page cache lookup
> on the free side.

Only reason I can come up with now is if mapping side is on a latency 
sensitive path, while un-mapping is lazy/delayed so can be more costly. 
Then fast map and extra cost on unmap may make sense.

It more applies to the other i915 patch, which implements a much more 
used API, but whether or not we can demonstrate any difference in the 
perf profiles I couldn't tell you without trying to collect some.

>> Is there something in vmap() preventing us from freeing the pages array
>> here? I can't spot anything that is holding on to the pointer. Or it was
>> just a sketch before you realized we could walk the vm_area?
>>
>> Also, I may be totally misunderstanding something, but I think you need to
>> assign area->pages manually so shmem_unpin_map can access it below.
> 
> We need area->pages to hold the pages for the free side.  That being
> said the patch I posted is broken because it never assigned to that.
> As said it was a sketch.  This is the patch I just rebooted into on
> my Laptop:
> 
> http://git.infradead.org/users/hch/misc.git/commitdiff/048522dfa26b6667adfb0371ff530dc263abe829
> 
> it needs extra prep patches from the series:
> 
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/alloc_vm_area
> 
>>>    	mapping_clear_unevictable(file->f_mapping);
>>> -	__shmem_unpin_map(file, ptr, shmem_npte(file));
>>> +	for (i = 0; i < shmem_npages(file); i++)
>>> +		put_page(area->pages[i]);
>>> +	kvfree(area->pages);
>>> +	vunmap(ptr);
>>
>> Is the verdict from mm experts that we can't use vfree due __free_pages vs
>> put_page differences?
> 
> Switched to vfree now.
> 
>> Could we get from ptes to pages, so that we don't have to keep the
>> area->pages array allocated for the duration of the pin?
> 
> We could do vmalloc_to_page, but that is fairly expensive (not as bad
> as reading from the page cache..).  Are you really worried about the
> allocation?

Not so much given how we don't even use shmem_pin_map outside selftests.

If we start using it I expect it will be for tiny objects anyway. Only 
if they end up being pinned for the lifetime of the driver, it may be a 
pointless waste of memory compared to the downsides of vmalloc_to_page. 
But we can revisit this particular edge case optimization if the need 
arises.

I'll look at your other i915 patch tomorrow.

Regards,

Tvrtko

