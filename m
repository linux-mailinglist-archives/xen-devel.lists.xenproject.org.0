Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8510122E733
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 10:01:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzy4Q-0006a7-7U; Mon, 27 Jul 2020 08:01:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nbSb=BG=redhat.com=david@srs-us1.protection.inumbo.net>)
 id 1jzy4O-0006a2-Dh
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 08:01:12 +0000
X-Inumbo-ID: 55e2cd86-cfdf-11ea-8a7c-bc764e2007e4
Received: from us-smtp-delivery-1.mimecast.com (unknown [207.211.31.120])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 55e2cd86-cfdf-11ea-8a7c-bc764e2007e4;
 Mon, 27 Jul 2020 08:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595836871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kFPPskvXLtA3OM8boP9HcoOBUPstBcsqpRElLohYglg=;
 b=b2a2FMPdOGRlnUXAP19PMO9Z0WnHkKxhVYosuQ6v5tK/sVYSDgEU243dVzf+2TmQpACDQy
 JgrVlZxPeGe0UFOuszOYd4wq8q9kyTW5cZb9b+8LYLFyMPvhTYn6P2335Qrus4wkbUgV9R
 blHN2tkJtjFu8WXM2/3usHrywCboKN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-233-TfzIlOpdPF6myWxB3Q8wdQ-1; Mon, 27 Jul 2020 04:01:00 -0400
X-MC-Unique: TfzIlOpdPF6myWxB3Q8wdQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 782F41DE2;
 Mon, 27 Jul 2020 08:00:57 +0000 (UTC)
Received: from [10.36.114.48] (ovpn-114-48.ams2.redhat.com [10.36.114.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C535072691;
 Mon, 27 Jul 2020 08:00:46 +0000 (UTC)
Subject: Re: [PATCH v2 4/4] xen: add helpers to allocate unpopulated memory
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau Monne <roger.pau@citrix.com>, linux-kernel@vger.kernel.org
References: <20200724124241.48208-1-roger.pau@citrix.com>
 <20200724124241.48208-5-roger.pau@citrix.com>
 <1778c97f-3a69-8280-141c-879814dd213f@redhat.com>
 <1fd1d29e-5c10-0c29-0628-b79807f81de6@oracle.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
 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
 WNyWQQ==
Organization: Red Hat GmbH
Message-ID: <6bd01b60-2625-c46e-f9ff-95247700a8cc@redhat.com>
Date: Mon, 27 Jul 2020 10:00:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1fd1d29e-5c10-0c29-0628-b79807f81de6@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 David Airlie <airlied@linux.ie>, Yan Yankovskyi <yyankovskyi@gmail.com>,
 dri-devel@lists.freedesktop.org, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Daniel Vetter <daniel@ffwll.ch>,
 xen-devel@lists.xenproject.org, Dan Williams <dan.j.williams@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.07.20 18:36, Boris Ostrovsky wrote:
> On 7/24/20 10:34 AM, David Hildenbrand wrote:
>> CCing Dan
>>
>> On 24.07.20 14:42, Roger Pau Monne wrote:
>>> diff --git a/drivers/xen/unpopulated-alloc.c b/drivers/xen/unpopulated-alloc.c
>>> new file mode 100644
>>> index 000000000000..aaa91cefbbf9
>>> --- /dev/null
>>> +++ b/drivers/xen/unpopulated-alloc.c
>>> @@ -0,0 +1,222 @@
> 
> 
> 
>>> + */
>>> +
>>> +#include <linux/errno.h>
>>> +#include <linux/gfp.h>
>>> +#include <linux/kernel.h>
>>> +#include <linux/mm.h>
>>> +#include <linux/memremap.h>
>>> +#include <linux/slab.h>
>>> +
>>> +#include <asm/page.h>
>>> +
>>> +#include <xen/page.h>
>>> +#include <xen/xen.h>
>>> +
>>> +static DEFINE_MUTEX(lock);
>>> +static LIST_HEAD(list);
>>> +static unsigned int count;
>>> +
>>> +static int fill(unsigned int nr_pages)
> 
> 
> Less generic names? How about  list_lock, pg_list, pg_count,
> fill_pglist()? (But these are bad too, so maybe you can come up with
> something better)
> 
> 
>>> +{
>>> +	struct dev_pagemap *pgmap;
>>> +	void *vaddr;
>>> +	unsigned int i, alloc_pages = round_up(nr_pages, PAGES_PER_SECTION);
>>> +	int nid, ret;
>>> +
>>> +	pgmap = kzalloc(sizeof(*pgmap), GFP_KERNEL);
>>> +	if (!pgmap)
>>> +		return -ENOMEM;
>>> +
>>> +	pgmap->type = MEMORY_DEVICE_DEVDAX;
>>> +	pgmap->res.name = "XEN SCRATCH";
> 
> 
> Typically iomem resources only capitalize first letters.
> 
> 
>>> +	pgmap->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
>>> +
>>> +	ret = allocate_resource(&iomem_resource, &pgmap->res,
>>> +				alloc_pages * PAGE_SIZE, 0, -1,
>>> +				PAGES_PER_SECTION * PAGE_SIZE, NULL, NULL);
> 
> 
> Are we not going to end up with a whole bunch of "Xen scratch" resource
> ranges for each miss in the page list? Or do we expect them to get merged?
> 

AFAIK, no resources will get merged (and it's in the general case not
safe to do). The old approach (add_memory_resource()) will end up with
the same situation ("Xen Scratch" vs. "System RAM") one new resource per
added memory block/section.

FWIW, I am looking into merging selected resources in the context of
virtio-mem _after_ adding succeeded (not directly when adding the
resource to the tree). Interface might look something like

void merge_child_mem_resources(struct resource *parent, const char *name);

So I can, for example, trigger merging of all "System RAM (virtio_mem)"
resources, that are located under a device node (e.g., "virtio0").

I also thought about tagging each mergeable resource via something like
"IORESOURCE_MERGEABLE" - whereby the user agrees that it does not hold
any pointers to such a resource. But I don't see yet a copelling reason
to sacrifice space for a new flag.

So with this in place, this code could call once adding succeeded

merge_child_mem_resources(&iomem_resource, "Xen Scratch");

-- 
Thanks,

David / dhildenb


