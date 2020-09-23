Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C0927593E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Sep 2020 15:59:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kL5IN-0003fW-65; Wed, 23 Sep 2020 13:58:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/b84=DA=linux.intel.com=tvrtko.ursulin@srs-us1.protection.inumbo.net>)
 id 1kL5IL-0003fR-W0
 for xen-devel@lists.xenproject.org; Wed, 23 Sep 2020 13:58:54 +0000
X-Inumbo-ID: ae931d00-3bec-4cfe-a5f9-2f6660f4e500
Received: from mga02.intel.com (unknown [134.134.136.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ae931d00-3bec-4cfe-a5f9-2f6660f4e500;
 Wed, 23 Sep 2020 13:58:52 +0000 (UTC)
IronPort-SDR: fR7q1lwIYLekKicdGOT3ouddbcFVj6Niqj6JErnjw2Qbih1xE3fHLT7CeN7EFSmFEZjxY5Zc/h
 okG/6CNnZRUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9752"; a="148544792"
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="148544792"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:58:51 -0700
IronPort-SDR: DOZNQUTwNmS6CdTEWIoW9qi7Sh22K+ola1js+j+Vn7PmZQGNyFPiXcYUQXMNKslnCfCP8vR0bU
 ku9o4NuN7J+w==
X-IronPort-AV: E=Sophos;i="5.77,293,1596524400"; d="scan'208";a="486449272"
Received: from yymichae-mobl.ger.corp.intel.com (HELO [10.214.208.219])
 ([10.214.208.219])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2020 06:58:46 -0700
Subject: Re: [Intel-gfx] [PATCH 4/6] drm/i915: use vmap in i915_gem_object_map
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 intel-gfx@lists.freedesktop.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, Minchan Kim <minchan@kernel.org>,
 dri-devel@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Nitin Gupta <ngupta@vflare.org>
References: <20200918163724.2511-1-hch@lst.de>
 <20200918163724.2511-5-hch@lst.de>
 <9b5d40af-7378-9e68-ca51-73b2148287f3@linux.intel.com>
 <20200923134117.GB9893@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <1a421e7f-6255-c534-5403-715c2e809bd0@linux.intel.com>
Date: Wed, 23 Sep 2020 14:58:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923134117.GB9893@lst.de>
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


On 23/09/2020 14:41, Christoph Hellwig wrote:
> On Wed, Sep 23, 2020 at 10:52:33AM +0100, Tvrtko Ursulin wrote:
>>
>> On 18/09/2020 17:37, Christoph Hellwig wrote:
>>> i915_gem_object_map implements fairly low-level vmap functionality in
>>> a driver.  Split it into two helpers, one for remapping kernel memory
>>> which can use vmap, and one for I/O memory that uses vmap_pfn.
>>>
>>> The only practical difference is that alloc_vm_area prefeaults the
>>> vmalloc area PTEs, which doesn't seem to be required here for the
>>> kernel memory case (and could be added to vmap using a flag if actually
>>> required).
>>
>> Patch looks good to me.
>>
>> Series did not get a CI run from our side because of a different base so I
>> don't know if you would like to have a run there? If so you would need to
>> rebase against git://anongit.freedesktop.org/drm-tip drm-tip and you could
>> even send a series to intel-gfx-trybot@lists.freedesktop.org, suppressing
>> cc, to check it out without sending a copy to the real mailing list.
> 
> It doesn't seem like I can post to any freedesktop list, as I always
> get rejection messages.  But I'll happily prepare a branch if one
> of you an feed it into your CI.

That's fine, just ping me and I will forward it for testing, thanks!

Regards,

Tvrtko

