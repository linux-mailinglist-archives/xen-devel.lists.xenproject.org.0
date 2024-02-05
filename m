Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56F57849F31
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 17:03:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676371.1052522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Qv-0003GW-3f; Mon, 05 Feb 2024 16:02:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676371.1052522; Mon, 05 Feb 2024 16:02:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX1Qv-0003EU-0P; Mon, 05 Feb 2024 16:02:57 +0000
Received: by outflank-mailman (input) for mailman id 676371;
 Mon, 05 Feb 2024 16:02:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rX1Qt-0003EO-7S
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 16:02:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX1Qs-0001dd-TD; Mon, 05 Feb 2024 16:02:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rX1Qs-0003ua-Nm; Mon, 05 Feb 2024 16:02:54 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=b/0BApgWBiSv/AJ200Ww5kZHybmDRS0Q2pWanwftxhk=; b=yNejvuUVWBwjHh59xbOcVbIuF7
	PY8PwV93SJq1HTMtSiwmtaEiLavAo9RLrNg50T9YXn67ngJxZJhq8w0ALZ6usaSETXiiyqxkm9C3Z
	zY6AgNznbMCoeBZunAhZXWUTgQAW8A3xSVj6Oi0/8y6ochVRO7VS/3YWX2qJ1DMKTsuU=;
Message-ID: <6997ec6f-15a0-4c88-9a96-c7f4f450b2dd@xen.org>
Date: Mon, 5 Feb 2024 16:02:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/bitmap: Even more signed-ness fixes
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: George Dunlap <George.Dunlap@citrix.com>, Jan Beulich
 <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
References: <20240205151413.1919983-1-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240205151413.1919983-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

title: s/x86// as this is common code.

On 05/02/2024 15:14, Andrew Cooper wrote:
> Further to commit 558e84b7ffec ("xen/bitmap: Consistently use unsigned bits
> values"), it turns out that GCC's range analysis isn't good enough to notice
> that 'bits / BITS_PER_LONG' is always within the unsigned range of k.

I would suggest to add the compiler version. This would be helpful if we 
need to revisit this decision in the future. Althougth, I don't expect 
to be the case here (switching the bitmap functions to unsigned is a 
good move and IIRC was discussed during the MISRA meeting).

> 
> As a consequence, it re-sign-extends 'k' when calculating the pointer holding
> 'bitmap[k]' on each loop iteration.  Switch all internal variables to unsigned
> int, which allows for better-still code generation.
> 
> Also clean up the prototypes for __bitmap_{set,clear} and the *_region()
> helpers, along with the internal variables.
> 
> Bloat-o-meter for a random x86 build reports:
>    add/remove: 0/0 grow/shrink: 0/10 up/down: 0/-277 (-277)
> 
> No functional change.

I am not sure about this...

> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

[...]

> -int bitmap_find_free_region(unsigned long *bitmap, int bits, int order)
> +int bitmap_find_free_region(unsigned long *bitmap, unsigned int bits, unsigned int order)
>   {
>   	unsigned long mask;
> -	int pages = 1 << order;
> -	int i;
> +	unsigned int pages = 1 << order;
> +	unsigned int i;

... I think your other patch is fixing a latent bug you introduced here. 
Before hand, if bits was "negative", we would return -ENOMEM. Now if we 
pass 2GB or higher, we would go through the loop.

So I would fold the hunk from common/bitmap.c here.

>   
>   	if(pages > BITS_PER_LONG)
>   		return -EINVAL;

[...]

> -int bitmap_allocate_region(unsigned long *bitmap, int pos, int order)
> +int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos,
> +			   unsigned int order)
>   {
> -	int pages = 1 << order;
> +	unsigned int pages = 1 << order;
>   	unsigned long mask = (1ul << (pages - 1));
> -	int index = pos/BITS_PER_LONG;
> -	int offset = pos - (index * BITS_PER_LONG);
> +	unsigned int index = pos/BITS_PER_LONG; 
NIT: While you modify the line, can you add a space before after / as 
you did above?

Cheers,

-- 
Julien Grall

