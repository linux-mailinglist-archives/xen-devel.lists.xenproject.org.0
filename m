Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB6538A188
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:32:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130841.244863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljf2O-0001Ri-6u; Thu, 20 May 2021 09:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130841.244863; Thu, 20 May 2021 09:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljf2O-0001Ox-3q; Thu, 20 May 2021 09:32:16 +0000
Received: by outflank-mailman (input) for mailman id 130841;
 Thu, 20 May 2021 09:32:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3HBq=KP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ljf2M-0001Or-K2
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:32:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 330c381a-872c-4e12-a4fd-8b77eee0aacd;
 Thu, 20 May 2021 09:32:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DEC22AD05;
 Thu, 20 May 2021 09:32:12 +0000 (UTC)
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
X-Inumbo-ID: 330c381a-872c-4e12-a4fd-8b77eee0aacd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621503133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hwuztHQr2Kb8ZQYj6qaMQveg8GSd7xgfZc3Cy1tcmsw=;
	b=dw0VRgAqBUHLJCEJXV0544dTD0M/JWe7DZo2yLbkcZjpKg6Pp/s7ady1Pnlv9TUhdHMKJQ
	0Fy0YmqUWJ0KlhuwXVpgMjqb+IRzyIex4TcNIm2IdjSpEe+tNjuhpP8cVf0CVbDzlgbb80
	1Gu+d1CbxLRToVMIDcgGnu9Z5uv+LxI=
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
 <f9776245-0a33-4cb8-fd5a-f7be8ab38b78@suse.com>
 <VE1PR08MB52152D4CD1542D0B35CF95CDF72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1a3b3024-5955-3c94-3af3-fd20e0d37a73@suse.com>
Date: Thu, 20 May 2021 11:32:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB52152D4CD1542D0B35CF95CDF72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.05.2021 11:04, Penny Zheng wrote:
> Hi Jan
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Tuesday, May 18, 2021 6:43 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; julien@xen.org
>> Subject: Re: [PATCH 04/10] xen/arm: static memory initialization
>>
>> On 18.05.2021 11:51, Penny Zheng wrote:
>>>> From: Jan Beulich <jbeulich@suse.com>
>>>> Sent: Tuesday, May 18, 2021 3:16 PM
>>>>
>>>> On 18.05.2021 07:21, Penny Zheng wrote:
>>>>> This patch introduces static memory initialization, during system
>>>>> RAM boot
>>>> up.
>>>>>
>>>>> New func init_staticmem_pages is the equivalent of init_heap_pages,
>>>>> responsible for static memory initialization.
>>>>>
>>>>> Helper func free_staticmem_pages is the equivalent of
>>>>> free_heap_pages, to free nr_pfns pages of static memory.
>>>>> For each page, it includes the following steps:
>>>>> 1. change page state from in-use(also initialization state) to free
>>>>> state and grant PGC_reserved.
>>>>> 2. set its owner NULL and make sure this page is not a guest frame
>>>>> any more
>>>>
>>>> But isn't the goal (as per the previous patch) to associate such
>>>> pages with a _specific_ domain?
>>>>
>>>
>>> Free_staticmem_pages are alike free_heap_pages, are not used only for
>> initialization.
>>> Freeing used pages to unused are also included.
>>> Here, setting its owner NULL is to set owner in used field NULL.
>>
>> I'm afraid I still don't understand.
>>
> 
> When initializing heap, xen is using free_heap_pages to do the initialization.
> And also when normal domain get destroyed/rebooted, xen is using free_domheap_pages,
> which calls free_heap_pages to free the pages.
> 
> So here, since free_staticmem_pages is the equivalent of the free_heap_pages for static
> memory, I'm also considering both two scenarios here. And if it is domain get destroyed/rebooted,
> Page state is in inuse state(PGC_inuse), and the page_info.v.inuse.domain is holding the
> domain owner.
> When freeing then, we need to switch the page state to free state(PGC_free) and set its inuse owner to NULL.

Perhaps my confusion comes from your earlier outline missing

3. re-associate the page with the domain (as represented in free
   pages)

The property of "designated for Dom<N>" should never go away, if I
understand the overall proposal correctly.

Jan

