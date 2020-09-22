Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BA4273D39
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 10:24:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKdau-0005Eh-Mq; Tue, 22 Sep 2020 08:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no0J=C7=linux.intel.com=tvrtko.ursulin@srs-us1.protection.inumbo.net>)
 id 1kKdat-0005Ec-Bl
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 08:24:11 +0000
X-Inumbo-ID: f71db207-1279-4876-9395-e2c1b4b92b7f
Received: from mga17.intel.com (unknown [192.55.52.151])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f71db207-1279-4876-9395-e2c1b4b92b7f;
 Tue, 22 Sep 2020 08:24:09 +0000 (UTC)
IronPort-SDR: Kj+O8oIU7Ny8VDw5csaeZIH1HfqpObmptfVf2O86PMeGDg/NC+ayL8tPlwohec4zkJyP3jZw3o
 UMvE2BkxQslg==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="140563440"
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="140563440"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 01:24:08 -0700
IronPort-SDR: hYPYeshgQ9gLbxA+nGdC2UUT7a+sUMfvmmOdnILx1oZilih/OM+HLuWniJZ+KnDxCiUxxvah+K
 LMJGx+/weQGQ==
X-IronPort-AV: E=Sophos;i="5.77,290,1596524400"; d="scan'208";a="454404248"
Received: from atroib-mobl2.ger.corp.intel.com (HELO [10.214.238.184])
 ([10.214.238.184])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2020 01:24:02 -0700
Subject: Re: [Intel-gfx] [PATCH 3/6] drm/i915: use vmap in shmem_pin_map
To: Christoph Hellwig <hch@lst.de>, Matthew Wilcox <willy@infradead.org>
Cc: Juergen Gross <jgross@suse.com>,
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
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <43d10588-2033-038b-14e4-9f41cd622d7b@linux.intel.com>
Date: Tue, 22 Sep 2020 09:23:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200922062249.GA30831@lst.de>
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


On 22/09/2020 07:22, Christoph Hellwig wrote:
> On Mon, Sep 21, 2020 at 08:11:57PM +0100, Matthew Wilcox wrote:
>> This is awkward.  I'd like it if we had a vfree() variant which called
>> put_page() instead of __free_pages().  I'd like it even more if we
>> used release_pages() instead of our own loop that called put_page().
> 
> Note that we don't need a new vfree variant, we can do this manually if
> we want, take a look at kernel/dma/remap.c.  But I thought this code
> intentionally doesn't want to do that to avoid locking in the memory
> for the pages array.  Maybe the i915 maintainers can clarify.

+ Chris & Matt who were involved with this part of i915.

If I understood this sub-thread correctly, iterating and freeing the 
pages via the vmapped ptes, so no need for a
shmem_read_mapping_page_gfp loop in shmem_unpin_map looks plausible to me.

I did not get the reference to kernel/dma/remap.c though, and also not 
sure how to do the error unwind path in shmem_pin_map at which point the 
allocated vm area hasn't been fully populated yet. Hand-roll the loop 
walking vm area struct in there?

Regards,

Tvrtko

