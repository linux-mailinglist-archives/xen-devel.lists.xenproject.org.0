Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 988332746BB
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 18:33:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKlEn-00052r-JK; Tue, 22 Sep 2020 16:33:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dLPN=C7=lst.de=hch@srs-us1.protection.inumbo.net>)
 id 1kKlEl-00052a-Sx
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 16:33:51 +0000
X-Inumbo-ID: deb65202-0a37-4e5f-b2e9-4f82eaac8cdd
Received: from verein.lst.de (unknown [213.95.11.211])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id deb65202-0a37-4e5f-b2e9-4f82eaac8cdd;
 Tue, 22 Sep 2020 16:33:49 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DF8FD67373; Tue, 22 Sep 2020 18:33:46 +0200 (CEST)
Date: Tue, 22 Sep 2020 18:33:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-mm@kvack.org,
 Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Andrew Morton <akpm@linux-foundation.org>,
 intel-gfx@lists.freedesktop.org, Nitin Gupta <ngupta@vflare.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
Message-ID: <20200922163346.GA1701@lst.de>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-4-hch@lst.de>
 <20200921191157.GX32101@casper.infradead.org> <20200922062249.GA30831@lst.de>
 <43d10588-2033-038b-14e4-9f41cd622d7b@linux.intel.com>
 <20200922143141.GA26637@lst.de>
 <e429c3e6-2143-f51a-4c1c-c1470076ad3e@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e429c3e6-2143-f51a-4c1c-c1470076ad3e@linux.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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

On Tue, Sep 22, 2020 at 05:13:45PM +0100, Tvrtko Ursulin wrote:
>>   void *shmem_pin_map(struct file *file)
>>   {
>> -	const size_t n_pte = shmem_npte(file);
>> -	pte_t *stack[32], **ptes, **mem;
>
> Chris can comment how much he'd miss the 32 page stack shortcut.

I'd like to see a profile that claim that kmalloc matters in a
path that does a vmap and reads pages through the page cache.
Especially when the kmalloc saves doing another page cache lookup
on the free side.

> Is there something in vmap() preventing us from freeing the pages array 
> here? I can't spot anything that is holding on to the pointer. Or it was 
> just a sketch before you realized we could walk the vm_area?
>
> Also, I may be totally misunderstanding something, but I think you need to 
> assign area->pages manually so shmem_unpin_map can access it below.

We need area->pages to hold the pages for the free side.  That being
said the patch I posted is broken because it never assigned to that.
As said it was a sketch.  This is the patch I just rebooted into on
my Laptop:

http://git.infradead.org/users/hch/misc.git/commitdiff/048522dfa26b6667adfb0371ff530dc263abe829

it needs extra prep patches from the series:

http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/alloc_vm_area

>>   	mapping_clear_unevictable(file->f_mapping);
>> -	__shmem_unpin_map(file, ptr, shmem_npte(file));
>> +	for (i = 0; i < shmem_npages(file); i++)
>> +		put_page(area->pages[i]);
>> +	kvfree(area->pages);
>> +	vunmap(ptr);
>
> Is the verdict from mm experts that we can't use vfree due __free_pages vs 
> put_page differences?

Switched to vfree now.

> Could we get from ptes to pages, so that we don't have to keep the 
> area->pages array allocated for the duration of the pin?

We could do vmalloc_to_page, but that is fairly expensive (not as bad
as reading from the page cache..).  Are you really worried about the
allocation?

