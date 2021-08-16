Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3131A3EDC70
	for <lists+xen-devel@lfdr.de>; Mon, 16 Aug 2021 19:33:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167457.305663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFgUW-0003O4-1w; Mon, 16 Aug 2021 17:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167457.305663; Mon, 16 Aug 2021 17:33:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFgUV-0003M2-Tg; Mon, 16 Aug 2021 17:33:39 +0000
Received: by outflank-mailman (input) for mailman id 167457;
 Mon, 16 Aug 2021 17:33:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mFgUU-0003Lu-OS
 for xen-devel@lists.xenproject.org; Mon, 16 Aug 2021 17:33:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mFgUU-0002L3-Hr; Mon, 16 Aug 2021 17:33:38 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mFgUU-00013c-By; Mon, 16 Aug 2021 17:33:38 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=+DETZw/kDc+vhi56Itl5outY6kEM3xQCySiZNRkQnjE=; b=PaWgJf8nNSeEwPpZVUgNxgVC2w
	XOVu2OyhAiLKM906dqYooz1aFq5bJmGYzoxALfRyq7UbSPG+5pMamD9vonqEKp3YfV9jZPVjn2QsT
	NeEXB59Xv+tGa2oSHjY46rL+nfsec3Cw46pZRmv/aCKcUE13YLQHjLBVM2m5aUOXcbcw=;
Subject: Re: [PATCH V4 03/10] xen/arm: handle static memory in
 dt_unreserved_regions
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
 <20210728102758.3269446-4-penny.zheng@arm.com>
 <c861b7c0-e894-61d0-8b29-77c1753661ee@xen.org>
 <VE1PR08MB5215A60D3603AA8D48128F67F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ccbccca1-2397-c3dc-6e81-7873c9a28d1e@xen.org>
Date: Mon, 16 Aug 2021 18:33:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215A60D3603AA8D48128F67F7FD9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 16/08/2021 07:00, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Wednesday, August 11, 2021 9:48 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>
>> Subject: Re: [PATCH V4 03/10] xen/arm: handle static memory in
>> dt_unreserved_regions
>>
>> Hi Penny,
>>
>> On 28/07/2021 11:27, Penny Zheng wrote:
>>> static memory regions overlap with memory nodes. The overlapping
>>> memory is reserved-memory and should be handled accordingly:
>>> dt_unreserved_regions should skip these regions the same way they are
>>> already skipping mem-reserved regions.
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/arch/arm/setup.c | 47 ++++++++++++++++++++++++++++----------------
>>>    1 file changed, 30 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c index
>>> 63a908e325..f569134317 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -200,6 +200,13 @@ static void __init dt_unreserved_regions(paddr_t s,
>> paddr_t e,
>>>                                             int first)
>>>    {
>>>        int i, nr = fdt_num_mem_rsv(device_tree_flattened);
>>> +    /*
>>> +     * There are two types of reserved memory stored in bootinfo, one
>> defines
>>> +     * in /reserved-memory node, the other refers to domain on static
>> allocation
>>> +     * through "xen,static-mem" property.
>>> +     */
>>> +    int nr_rsv_type = 2, t = 0, prev_nr;
>>> +    struct meminfo *rsv_type[2] = {&bootinfo.reserved_mem,
>>> + &bootinfo.static_mem};
>>
>> Looking at the rest of the series, it doesn't look like there is a real benefits to
>> have the static memory and reserved memory in separate arrays as they are
>> walked only a few times and they are both meant to be small. In fact, I think
>> this code is lot more difficult to read.
>>
>> So it would be best to merge the two arrays in one. We can add a flag in the
>> structure to differentiate between "static" and "reserved" memory.
>>
> 
> How about adding a "static" flag in "struct meminfo" to tell. See the below example:
> "
> struct meminfo {
>      int nr_banks;
>      struct membank bank[NR_MEM_BANKS];
>      bool static;  /* whether memory is reserved as static memory. */
> };
> "
> 
> And I will delete "struct meminfo static_mem" array, all "static" and "reserved" memory
> will be stored in one "struct meminfo reserved_mem" array.

Did you intend to suggest to add the new member in struct membank rather 
than struct meminfo?

If not, then I don't understand how this would help have the static and 
reserved region in a single array and avoid the extra loop you added.

Cheers,

-- 
Julien Grall

