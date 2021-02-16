Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5259031CCF0
	for <lists+xen-devel@lfdr.de>; Tue, 16 Feb 2021 16:31:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.85872.160707 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2Hy-0004EB-UQ; Tue, 16 Feb 2021 15:29:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 85872.160707; Tue, 16 Feb 2021 15:29:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lC2Hy-0004Dm-RH; Tue, 16 Feb 2021 15:29:22 +0000
Received: by outflank-mailman (input) for mailman id 85872;
 Tue, 16 Feb 2021 15:29:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+CYm=HS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lC2Hw-0004Dg-V6
 for xen-devel@lists.xenproject.org; Tue, 16 Feb 2021 15:29:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bcd36bae-9c04-4e6a-b0e2-4cc19cba6bb1;
 Tue, 16 Feb 2021 15:29:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C43B7AE87;
 Tue, 16 Feb 2021 15:29:17 +0000 (UTC)
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
X-Inumbo-ID: bcd36bae-9c04-4e6a-b0e2-4cc19cba6bb1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613489357; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wMIMMImt700WSdImEdH1Sc2CYLw5jnB37NAWri3bCHA=;
	b=FgjKl5X2iZ2IiuV/v2Ego+3rl/9DOb8TbyhTZimQntujCSI4e13qGMK1Ny+E85zyuaqiVi
	n1L/waVO2GLlUz+D1iPZZdDzZ7BQ1woqY+e5vofyTSQ8XmG/VsCLbZthwcN2eNjV3nYufm
	xgpSxzuREtpn4wTD7atOTggkTdhs30o=
Subject: Re: [PATCH DO NOT APPLY] docs: Document allocator properties and the
 rubric for using them
To: George Dunlap <george.dunlap@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210216102839.1801667-1-george.dunlap@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b225be0f-3eed-426e-8829-6e7c57cd7635@suse.com>
Date: Tue, 16 Feb 2021 16:29:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210216102839.1801667-1-george.dunlap@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 16.02.2021 11:28, George Dunlap wrote:
> --- /dev/null
> +++ b/docs/hypervisor-guide/memory-allocation-functions.rst
> @@ -0,0 +1,118 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Xenheap memory allocation functions
> +===================================
> +
> +In general Xen contains two pools (or "heaps") of memory: the *xen
> +heap* and the *dom heap*.  Please see the comment at the top of
> +``xen/common/page_alloc.c`` for the canonical explanation.
> +
> +This document describes the various functions available to allocate
> +memory from the xen heap: their properties and rules for when they should be
> +used.

Irrespective of your subsequent indication of you disliking the
proposal (which I understand only affects the guidelines further
down anyway) I'd like to point out that vmalloc() does not
allocate from the Xen heap. Therefore a benefit of always
recommending use of xvmalloc() would be that the function could
fall back to vmalloc() (and hence the larger domain heap) when
xmalloc() failed.

> +TLDR guidelines
> +---------------
> +
> +* By default, ``xvmalloc`` (or its helper cognates) should be used
> +  unless you know you have specific properties that need to be met.
> +
> +* If you need memory which needs to be physically contiguous, and may
> +  be larger than ``PAGE_SIZE``...
> +  
> +  - ...and is order 2, use ``alloc_xenheap_pages``.
> +    
> +  - ...and is not order 2, use ``xmalloc`` (or its helper cognates)..

ITYM "an exact power of 2 number of pages"?

> +* If you don't need memory to be physically contiguous, and know the
> +  allocation will always be larger than ``PAGE_SIZE``, you may use
> +  ``vmalloc`` (or one of its helper cognates).
> +
> +* If you know that allocation will always be less than ``PAGE_SIZE``,
> +  you may use ``xmalloc``.

As per Julien's and your own replies, this wants to be "minimum
possible page size", which of course depends on where in the
tree the piece of code is to live. (It would be "maximum
possible page size" in the earlier paragraph.)

> +Properties of various allocation functions
> +------------------------------------------
> +
> +Ultimately, the underlying allocator for all of these functions is
> +``alloc_xenheap_pages``.  They differ on several different properties:
> +
> +1. What underlying allocation sizes are.  This in turn has an effect
> +   on:
> +
> +   - How much memory is wasted when requested size doesn't match
> +
> +   - How such allocations are affected by memory fragmentation
> +
> +   - How such allocations affect memory fragmentation
> +
> +2. Whether the underlying pages are physically contiguous
> +
> +3. Whether allocation and deallocation require the cost of mapping and
> +   unmapping
> +
> +``alloc_xenheap_pages`` will allocate a physically contiguous set of
> +pages on orders of 2.  No mapping or unmapping is done.

That's the case today, but meant to change rather sooner than later
(when the 1:1 map disappears).

Jan

