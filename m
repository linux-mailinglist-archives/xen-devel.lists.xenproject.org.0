Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DF51CF146
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 11:14:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYQyi-0007s7-Hs; Tue, 12 May 2020 09:13:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pTU5=62=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jYQyh-0007s2-Dg
 for xen-devel@lists.xenproject.org; Tue, 12 May 2020 09:13:31 +0000
X-Inumbo-ID: d8840a38-9430-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8840a38-9430-11ea-b07b-bc764e2007e4;
 Tue, 12 May 2020 09:13:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CFD8EAC6C;
 Tue, 12 May 2020 09:13:31 +0000 (UTC)
Subject: Re: [PATCH 1/2] xen/xenbus: avoid large structs and arrays on the
 stack
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com
References: <20200511073151.19043-1-jgross@suse.com>
 <20200511073151.19043-2-jgross@suse.com>
 <965e1d65-3a0c-3a71-ca58-2b5c04f98bce@oracle.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <aa93722b-100a-c750-cf51-bcaf9defbd03@suse.com>
Date: Tue, 12 May 2020 11:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <965e1d65-3a0c-3a71-ca58-2b5c04f98bce@oracle.com>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 11.05.20 20:01, Boris Ostrovsky wrote:
> On 5/11/20 3:31 AM, Juergen Gross wrote:
>>   
>>   static int xenbus_map_ring_valloc_hvm(struct xenbus_device *dev,
> 
> 
> I wonder whether we can drop valloc/vfree from xenbus_ring_ops' names.

I can do that.

> 
> 
>> +				      struct map_ring_valloc *info,
>>   				      grant_ref_t *gnt_ref,
>>   				      unsigned int nr_grefs,
>>   				      void **vaddr)
>>   {
>> -	struct xenbus_map_node *node;
>> +	struct xenbus_map_node *node = info->node;
>>   	int err;
>>   	void *addr;
>>   	bool leaked = false;
>> -	struct map_ring_valloc_hvm info = {
>> -		.idx = 0,
>> -	};
>>   	unsigned int nr_pages = XENBUS_PAGES(nr_grefs);
>>   
>> -	if (nr_grefs > XENBUS_MAX_RING_GRANTS)
>> -		return -EINVAL;
>> -
>> -	*vaddr = NULL;
>> -
>> -	node = kzalloc(sizeof(*node), GFP_KERNEL);
>> -	if (!node)
>> -		return -ENOMEM;
>> -
>>   	err = alloc_xenballooned_pages(nr_pages, node->hvm.pages);
>>   	if (err)
>>   		goto out_err;
>>   
>>   	gnttab_foreach_grant(node->hvm.pages, nr_grefs,
>>   			     xenbus_map_ring_setup_grant_hvm,
>> -			     &info);
>> +			     info);
>>   
>>   	err = __xenbus_map_ring(dev, gnt_ref, nr_grefs, node->handles,
>> -				info.phys_addrs, GNTMAP_host_map, &leaked);
>> +				info, GNTMAP_host_map, &leaked);
>>   	node->nr_handles = nr_grefs;
>>   
>>   	if (err)
>> @@ -641,11 +654,13 @@ static int xenbus_map_ring_valloc_hvm(struct xenbus_device *dev,
>>   	spin_unlock(&xenbus_valloc_lock);
>>   
>>   	*vaddr = addr;
>> +	info->node = NULL;
> 
> 
> Is this so that xenbus_map_ring_valloc() doesn't free it accidentally?

Yes.


Juergen


