Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 115C32F5E71
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 11:15:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66914.119051 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzzdr-0000aw-FU; Thu, 14 Jan 2021 10:14:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66914.119051; Thu, 14 Jan 2021 10:14:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzzdr-0000aT-Ai; Thu, 14 Jan 2021 10:14:11 +0000
Received: by outflank-mailman (input) for mailman id 66914;
 Thu, 14 Jan 2021 10:14:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzzdp-0000aO-6A
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 10:14:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 55b402f2-c130-4238-b54d-30abc4276664;
 Thu, 14 Jan 2021 10:14:07 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DD3C9B1C4;
 Thu, 14 Jan 2021 10:14:06 +0000 (UTC)
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
X-Inumbo-ID: 55b402f2-c130-4238-b54d-30abc4276664
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610619247; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mIZCDGLdDSuP4wC/X+yxyEoO5S79CSCdzw5XFt0XewU=;
	b=hk4o4hACxbCU2h4un9LgtUT2YCINVrRYPpIxSGubilCUB2nIljXl2YqPn3quvPMfKS5s77
	xTcxVAGOBjR2ftvdwJiELfdaYJMRs7Ee7P1AYRjZ4bvo94eEJwkTetv77ZI/2syd0V+eQ1
	9pPVgytsXPnbof8u3x3bS89MJq0qLYw=
Subject: Re: [PATCH 1/4] xen/dmalloc: Introduce dmalloc() APIs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-2-andrew.cooper3@citrix.com>
 <dffe4e97-e428-3785-7067-2ea19e9e34af@suse.com>
 <1cdbec15-4932-7a64-d45a-6cddb2b67e87@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fe88ce5f-7185-2a0b-67fb-c0344ef59683@suse.com>
Date: Thu, 14 Jan 2021 11:14:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <1cdbec15-4932-7a64-d45a-6cddb2b67e87@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 14.01.2021 00:16, Andrew Cooper wrote:
> On 05/01/2021 15:56, Jan Beulich wrote:
>> On 23.12.2020 17:34, Andrew Cooper wrote:
>>> RFC:
>>>  * This probably wants to be less fatal in release builds
>> I'm not even convinced this wants to be a panic() in debug builds.
> 
> Any memory leak spotted by this is an XSA, except in the narrow case of
> being due exclusively to a weird and non-default order of hypercalls.
> 
> It absolutely needs to be something fatal in debug builds, for avoid
> going unnoticed by testing.

This is a perfectly valid position to take, but I'm afraid once
again isn't the only possible one. Since I do routinely look at
logs, I'm personally in favor of avoiding crashing the host
even for debug builds. The more that I've had pretty bad fallout
from crashes in the past, due to (afaict) bugs in a file system
driver in Linux that persisted over a longer period of time.

>  Patch 4 is my proposed solution for this,
> which will hopefully prevent bugs from escaping staging.
> 
> For release builds, a real memory leak is less bad behaviour than taking
> the host down, but it certainly shouldn't shouldn't go unnoticed.

Of course - it absolutely needs logging.

>>>  * In an ideal world, we'd also want to count the total number of bytes
>>>    allocated from the xmalloc heap, which would be interesting to print in the
>>>    'q' debugkey.  However, that data is fairly invasive to obtain.
>> Unless we used an xmem_pool rather than the new interface being
>> a thin layer around xmalloc(). (This would then also provide
>> better locality of the allocations, i.e. different domains
>> wouldn't share allocations from the same page.)
> 
> I'm not sure if using a separate memory pool is a clear cut improvement.

Neither am I, but it's an option to at least consider.

> For an attacker which has a corruption primitive, a single shared pool
> will reduce the chance of the exploit being stable across different
> systems.  Improved locality of allocations is an advantage from the
> attackers point of view, but the proper way to combat that is with a
> real randomised heap allocator.
> 
> Sharing within the same page isn't an issue, so long as we respect a
> cache line minimum allocation size.
> 
> More importantly however, until we know exactly how much memory we're
> talking about here, switching to a per-domain pool might be a massive
> waste.  The xmalloc() allocations are in the noise compared to RAM, and
> might only be a small multiple of the pool metadata to begin with.
> 
>> And even without doing so, adding a function to retrieve the actual size
>> shouldn't be all that difficult - internally xmalloc_tlsf.c
>> knows the size, after all, for e.g. xrealloc() to work right.
> 
> Yeah - the internals of the pool can calculate this.  I was considering
> doing just this, but wasn't sure how exposing an API for this would go down.
> 
> For maximum flexibility, it would be my preferred way forward.

I don't seen an issue with exposing such an API, so long as it's
made clear what purposes we want to permit it to be used for.

>>> +#define DFREE(d, p)                             \
>>> +    do {                                        \
>>> +        dfree(d, p);                            \
>>> +        (p) = NULL;                             \
>>> +    } while ( 0 )
>>> +
>>> +
>>> +void *_dzalloc(struct domain *d, size_t size, size_t align);
>>> +
>>> +static inline void *_dzalloc_array(struct domain *d, size_t size,
>>> +                                   size_t align, size_t num)
>>> +{
>>> +    return _dzalloc(d, size * num, align);
>> No protection at all against the multiplication overflowing?
> 
> Well - xmalloc doesn't have any either.  But yes - both want some
> compiler-aided overflow detection, rather than messing around with
> arbitrary limits pretending to be an overflow check.

You did suggest this previously, for xmalloc(). And I did look
into doing so, but either ran into some issue or simply didn't
see the point, considering the code we already have. Yes, the
use of UINT_MAX may seem somewhat arbitrary. We could make this
less arbitrary by deriving from MAX_ORDER instead, or by adding
a suitable BUILD_BUG_ON(UINT_MAX < ...). After all there's no
point even just trying allocations exceeding MAX_ORDER.

The reason for my comment was that the functions here are
specifically _not_ a simple copy of their xmalloc()
counterparts.

Jan

