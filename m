Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB582770DD
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 14:24:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLQGx-0008R5-R0; Thu, 24 Sep 2020 12:22:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IAAV=DB=linux.intel.com=tvrtko.ursulin@srs-us1.protection.inumbo.net>)
 id 1kLQGw-0008R0-Go
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 12:22:50 +0000
X-Inumbo-ID: 9bf8f109-929c-4ae0-8ce7-6427b4ec8cf3
Received: from mga18.intel.com (unknown [134.134.136.126])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9bf8f109-929c-4ae0-8ce7-6427b4ec8cf3;
 Thu, 24 Sep 2020 12:22:48 +0000 (UTC)
IronPort-SDR: Li8atQXTvMHDIaQRxclHL+tSzlDXLoldKvzC0lP06pJmq2sWGzMxZvDimt320NXEaRVv7jCevX
 ltj6ZbIdJ1dw==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148946676"
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="148946676"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 05:22:47 -0700
IronPort-SDR: yIaT7aSfYZLzy7NAr4/+/fx09KzEzHT9W6js9dSXcbin5XmBb1ZJrTzhIomLZahY1XxX9OeT67
 NyrfUrRrFMnA==
X-IronPort-AV: E=Sophos;i="5.77,297,1596524400"; d="scan'208";a="455327432"
Received: from dsmahang-mobl2.ger.corp.intel.com (HELO [10.252.48.167])
 ([10.252.48.167])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2020 05:22:44 -0700
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
 <1a421e7f-6255-c534-5403-715c2e809bd0@linux.intel.com>
 <20200923144455.GA15036@lst.de>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <17f81582-f087-aeac-c06a-4cd1a5457fbb@linux.intel.com>
Date: Thu, 24 Sep 2020 13:22:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200923144455.GA15036@lst.de>
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


On 23/09/2020 15:44, Christoph Hellwig wrote:
> On Wed, Sep 23, 2020 at 02:58:43PM +0100, Tvrtko Ursulin wrote:
>>>> Series did not get a CI run from our side because of a different base so I
>>>> don't know if you would like to have a run there? If so you would need to
>>>> rebase against git://anongit.freedesktop.org/drm-tip drm-tip and you could
>>>> even send a series to intel-gfx-trybot@lists.freedesktop.org, suppressing
>>>> cc, to check it out without sending a copy to the real mailing list.
>>>
>>> It doesn't seem like I can post to any freedesktop list, as I always
>>> get rejection messages.  But I'll happily prepare a branch if one
>>> of you an feed it into your CI.
>>
>> That's fine, just ping me and I will forward it for testing, thanks!
> 
>      git://git.infradead.org/users/hch/misc.git i915-vmap-wip
> 
> Gitweb:
> 
>      http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/i915-vmap-wip
> 
> note that this includes a new commit to clean up one of the recent
> commits in the code.

CI says series looks good from the i915 perspective (*).

I don't know how will you handle it logistically, but when you have 
final version I am happy to re-read and r-b the i915 patches.


Regards,

Tvrtko

*)
https://patchwork.freedesktop.org/series/82051/

