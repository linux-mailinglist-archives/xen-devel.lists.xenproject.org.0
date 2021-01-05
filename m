Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDBB2EAF84
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 16:57:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62063.109645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwohN-0001yn-Qi; Tue, 05 Jan 2021 15:56:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62063.109645; Tue, 05 Jan 2021 15:56:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwohN-0001yO-N6; Tue, 05 Jan 2021 15:56:41 +0000
Received: by outflank-mailman (input) for mailman id 62063;
 Tue, 05 Jan 2021 15:56:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwohM-0001yJ-2x
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 15:56:40 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e87ee307-039b-4809-bc86-f1d4d01d5d0c;
 Tue, 05 Jan 2021 15:56:39 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 39D47AD87;
 Tue,  5 Jan 2021 15:56:38 +0000 (UTC)
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
X-Inumbo-ID: e87ee307-039b-4809-bc86-f1d4d01d5d0c
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609862198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6U/TmlhD4KsDTad2NjBhGK5wMDuorPp0X9wKlzCEnBo=;
	b=VCa1V4aEEKJAaqr8xLd9CK79pTaJS5FqB+33ap9UDuY+PfAXm+DTC8AzN1u3qN6TWHF/v6
	0uYNQskE1S4fN8BS2lKWPtvQ+TyQ2ZD+0DoKzmbUbpC91GIgJLudW/2eT3HdhczxVqKDPG
	k4SKA0J299MEYJpmB8c9kedu1oaXZRQ=
Subject: Re: [PATCH 1/4] xen/dmalloc: Introduce dmalloc() APIs
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20201223163442.8840-1-andrew.cooper3@citrix.com>
 <20201223163442.8840-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dffe4e97-e428-3785-7067-2ea19e9e34af@suse.com>
Date: Tue, 5 Jan 2021 16:56:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201223163442.8840-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 23.12.2020 17:34, Andrew Cooper wrote:
> RFC:
>  * This probably wants to be less fatal in release builds

I'm not even convinced this wants to be a panic() in debug builds.

>  * In an ideal world, we'd also want to count the total number of bytes
>    allocated from the xmalloc heap, which would be interesting to print in the
>    'q' debugkey.  However, that data is fairly invasive to obtain.

Unless we used an xmem_pool rather than the new interface being
a thin layer around xmalloc(). (This would then also provide
better locality of the allocations, i.e. different domains
wouldn't share allocations from the same page.) And even without
doing so, adding a function to retrieve the actual size
shouldn't be all that difficult - internally xmalloc_tlsf.c
knows the size, after all, for e.g. xrealloc() to work right.

> --- /dev/null
> +++ b/xen/include/xen/dmalloc.h
> @@ -0,0 +1,29 @@
> +#ifndef XEN_DMALLOC_H
> +#define XEN_DMALLOC_H
> +
> +#include <xen/types.h>
> +
> +struct domain;
> +
> +#define dzalloc_array(d, _type, _num)                                   \

While I realize I'll get bashed again, the inconsistency of using
(or not) leading underscores is too odd to not comment upon. I
don't see what use they are here, irrespective of my general view
on the topic.

> +    ((_type *)_dzalloc_array(d, sizeof(_type), __alignof__(_type), _num))
> +
> +
> +void dfree(struct domain *d, void *ptr);

May I ask to avoid double blank lines?

> +#define DFREE(d, p)                             \
> +    do {                                        \
> +        dfree(d, p);                            \
> +        (p) = NULL;                             \
> +    } while ( 0 )
> +
> +
> +void *_dzalloc(struct domain *d, size_t size, size_t align);
> +
> +static inline void *_dzalloc_array(struct domain *d, size_t size,
> +                                   size_t align, size_t num)
> +{
> +    return _dzalloc(d, size * num, align);

No protection at all against the multiplication overflowing?

Jan

