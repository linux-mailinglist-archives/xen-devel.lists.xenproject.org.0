Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB0C4B3796
	for <lists+xen-devel@lfdr.de>; Sat, 12 Feb 2022 20:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.270852.465187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIxsM-0002WC-GE; Sat, 12 Feb 2022 19:16:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 270852.465187; Sat, 12 Feb 2022 19:16:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nIxsM-0002TW-Cy; Sat, 12 Feb 2022 19:16:06 +0000
Received: by outflank-mailman (input) for mailman id 270852;
 Sat, 12 Feb 2022 19:16:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nIxsK-0002TQ-N1
 for xen-devel@lists.xenproject.org; Sat, 12 Feb 2022 19:16:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIxsK-00032M-Cz; Sat, 12 Feb 2022 19:16:04 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nIxsK-0002Lw-7r; Sat, 12 Feb 2022 19:16:04 +0000
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
	bh=Hbwq3ZWfNkA9pT9T5LtDOIXrdpYQXja8mm6vhDOaPDE=; b=lLn+rqvSSyqpn5HnlOgrdkATgr
	+w3z21HyLYntVUsONmi+TH3zG86eDwwsQQiBvGyVTNgmMt3dgLPhdFfJNWn/klpWdDMvQ/av0ETO8
	3mH1K6jmMkAqhtOikcEZ/OX0tyYiNpA2C2KpKbC9bscviR1kHO6xPpvSujCHq2HSDOLc=;
Message-ID: <6513ab57-3b7c-56b6-b89d-41a5545b64a4@xen.org>
Date: Sat, 12 Feb 2022 19:16:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH RFCv2 14/15] xen/arm: mm: Rework setup_xenheap_mappings()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com,
 Penny.Zheng@arm.com, Bertrand.Marquis@arm.com,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <jgrall@amazon.com>
References: <20210425201318.15447-1-julien@xen.org>
 <20210425201318.15447-15-julien@xen.org>
 <alpine.DEB.2.21.2105141646340.14426@sstabellini-ThinkPad-T480s>
 <8cda6d2d-7f3c-fef6-c534-2fadabed1bad@xen.org>
 <alpine.DEB.2.21.2105171738320.14426@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.21.2105171738320.14426@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Sorry for the late answering. I finally picked up that series again and 
now preparing a new version.

On 18/05/2021 01:50, Stefano Stabellini wrote:
> On Sat, 15 May 2021, Julien Grall wrote:
>> Hi,
>>
>> On 15/05/2021 00:51, Stefano Stabellini wrote:
>>> On Sun, 25 Apr 2021, Julien Grall wrote:
>>>> From: Julien Grall <julien.grall@arm.com>
>>>>
>>>> A few issues have been reported with setup_xenheap_mappings() over the
>>>> last couple of years. The main ones are:
>>>>       - It will break on platform supporting more than 512GB of RAM
>>>>         because the memory allocated by the boot allocator is not yet
>>>>         mapped.
>>>>       - Aligning all the regions to 1GB may lead to unexpected result
>>>>         because we may alias non-cacheable region (such as device or
>>>> reserved
>>>>         regions).
>>>>
>>>> map_pages_to_xen() was recently reworked to allow superpage mappings and
>>>> deal with the use of page-tables before they are mapped.
>>>>
>>>> Most of the code in setup_xenheap_mappings() is now replaced with a
>>>> single call to map_pages_to_xen().
>>>>
>>>> This also require to re-order the steps setup_mm() so the regions are
>>>> given to the boot allocator first and then we setup the xenheap
>>>> mappings.
>>>
>>> I know this is paranoia but doesn't this introduce a requirement on the
>>> size of the first bank in bootinfo.mem.bank[] ?
>>>
>>> It should be at least 8KB?
>>
>> AFAIK, the current requirement is 4KB because of the 1GB mapping. Long term,
>> it would be 8KB.
>>
>>>
>>> I know it is unlikely but it is theoretically possible to have a first
>>> bank of just 1KB.
>>
>> All the page allocators are working at the page granularity level. I am not
>> entirely sure whether the current Xen would ignore the region or break.
>>
>> Note that setup_xenheap_mappings() is taking a base MFN and a number of pages
>> to map. So this doesn't look to be a new problem here.
> 
> Yeah... the example of the first bank being 1KB is wrong because, like
> you wrote, it wouldn't work before your patches either, and probably it
> will never work.
> 
> Maybe a better example is a first bank of 4KB exactly.

I have done more testing with the 1GB alignment dropped. The 
restrictions are a bit more complicated.

Not all the memory in a bank will go to the boot allocator. This can 
happen if the memory were have already been allocated for other purpose 
(e.g. modules, reserved area...).

So the region needs enough free memory to be able to map the entire 
region. The amount needed will depend on the size of the region.

So I will split the loop in two separate loops. The first loop will add 
all available pages to the boot allocator. The second loop will actually 
do the mapping.

Cheers,

-- 
Julien Grall

