Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383A3876D2
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 12:43:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129057.242264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixCI-0001nq-IN; Tue, 18 May 2021 10:43:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129057.242264; Tue, 18 May 2021 10:43:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lixCI-0001km-FD; Tue, 18 May 2021 10:43:34 +0000
Received: by outflank-mailman (input) for mailman id 129057;
 Tue, 18 May 2021 10:43:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tO0P=KN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lixCG-0001kT-MH
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 10:43:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a4bca774-b1c5-43c8-8709-c448521a2227;
 Tue, 18 May 2021 10:43:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D851AFCF;
 Tue, 18 May 2021 10:43:30 +0000 (UTC)
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
X-Inumbo-ID: a4bca774-b1c5-43c8-8709-c448521a2227
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621334610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PSANzXWlZkynQMwMKqGA1cWX6aVeLV4RM+53ftRNKvo=;
	b=AiAgQIROb/1CwM/eoQmSkx+ZNMguD0ks/EdhGBVK+klQuUV988RAbNduB+95j1LDhaMFh2
	vSonqw7M67rZrettEj+8SsvguIiAGLzh7gZfHOoC5CRgxSE4ywqmx9gffrJ18yNHhZGE7u
	eFG5Q+/guycki4m2Or3tv4K/8mP8BPE=
Subject: Re: [PATCH 04/10] xen/arm: static memory initialization
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-5-penny.zheng@arm.com>
 <dbffa647-37e2-93b6-4041-a1344aeb1837@suse.com>
 <VE1PR08MB5215E7203960F535BC857F5CF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <f9776245-0a33-4cb8-fd5a-f7be8ab38b78@suse.com>
Date: Tue, 18 May 2021 12:43:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215E7203960F535BC857F5CF72C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.05.2021 11:51, Penny Zheng wrote:
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 18, 2021 3:16 PM
>>
>> On 18.05.2021 07:21, Penny Zheng wrote:
>>> This patch introduces static memory initialization, during system RAM boot
>> up.
>>>
>>> New func init_staticmem_pages is the equivalent of init_heap_pages,
>>> responsible for static memory initialization.
>>>
>>> Helper func free_staticmem_pages is the equivalent of free_heap_pages,
>>> to free nr_pfns pages of static memory.
>>> For each page, it includes the following steps:
>>> 1. change page state from in-use(also initialization state) to free
>>> state and grant PGC_reserved.
>>> 2. set its owner NULL and make sure this page is not a guest frame any
>>> more
>>
>> But isn't the goal (as per the previous patch) to associate such pages with a
>> _specific_ domain?
>>
> 
> Free_staticmem_pages are alike free_heap_pages, are not used only for initialization.
> Freeing used pages to unused are also included.
> Here, setting its owner NULL is to set owner in used field NULL.

I'm afraid I still don't understand.

> Still, I need to add more explanation here.

Yes please.

>>> @@ -1512,6 +1515,49 @@ static void free_heap_pages(
>>>      spin_unlock(&heap_lock);
>>>  }
>>>
>>> +/* Equivalent of free_heap_pages to free nr_pfns pages of static
>>> +memory. */ static void free_staticmem_pages(struct page_info *pg,
>> unsigned long nr_pfns,
>>> +                                 bool need_scrub)
>>
>> Right now this function gets called only from an __init one. Unless it is
>> intended to gain further callers, it should be marked __init itself then.
>> Otherwise it should be made sure that other architectures don't include this
>> (dead there) code.
>>
> 
> Sure, I'll add __init. Thx.

Didn't I see a 2nd call to the function later in the series? That
one doesn't permit the function to be __init, iirc.

Jan

