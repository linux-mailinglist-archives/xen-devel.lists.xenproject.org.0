Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CE7321904
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 14:37:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88050.165406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBOm-0003wJ-Oc; Mon, 22 Feb 2021 13:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88050.165406; Mon, 22 Feb 2021 13:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEBOm-0003vw-LG; Mon, 22 Feb 2021 13:37:16 +0000
Received: by outflank-mailman (input) for mailman id 88050;
 Mon, 22 Feb 2021 13:37:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lEBOl-0003vr-Bx
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 13:37:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEBOj-0000gx-IT; Mon, 22 Feb 2021 13:37:13 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEBOj-0001yN-9W; Mon, 22 Feb 2021 13:37:13 +0000
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
	bh=n/6qo3FbQGuHJxi+92hPDUzmYPEfFgLFqs9z12dsc3g=; b=1iAx2yWkM7luovKAPJxO89KN46
	gR/EXvpMNyVOi76xLuEhhaWKyrhIDtcnBCSIYd3dMQdqOFfmh9gBDTGP/Tk6AVY0D5NyYtvtHAJnj
	1vz1xK6lCWB7Sf8QXiSJ6oAnLOue/AOrgkfc/SoTI1JaJxUO4mKxAQfKKrZewOmF1T/I=;
Subject: Re: [PATCH for-next] xen/arm: mm: flush_page_to_ram() only need to
 clean to PoC
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210220175413.14640-1-julien@xen.org>
 <FC521246-BD88-4D8C-82B7-6C3EFC8B00D0@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <45cd6455-3ad0-f052-65d8-37adb658f003@xen.org>
Date: Mon, 22 Feb 2021 13:37:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <FC521246-BD88-4D8C-82B7-6C3EFC8B00D0@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 22/02/2021 11:58, Bertrand Marquis wrote:
> Hi Julien,
> 
>> On 20 Feb 2021, at 17:54, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, flush_page_to_ram() is both cleaning and invalidate to
>> PoC the page. However, the cache line can be speculated and pull in the
>> cache right after as it is part of the direct map.
> 
> If we go further through this logic maybe all calls to
> clean_and_invalidate_dcache_va_range could be transformed in a
> clean_dcache_va_range.

Likely yes. But I need to go through them one by one to confirm this is 
fine to do it (it also depends on the caching attributes used). I have 
sent this one in advance because this was discussed as part of XSA-364.

> 
>>
>> So it is pointless to try to invalidate the line in the data cache.
>>
> 
> But what about processors which would not speculate ?
> 
> Do you expect any performance optimization here ?

When invalidating a line, you effectively remove it from the cache. If 
the page is going to be access a bit after, then you will have to load 
from the memory (or another cache).

With this change, you would only need to re-fetch the line if it wasn't 
evicted by the time it is accessed.

The line would be clean, so I would expect the eviction to have less an 
impact over re-fetching the memory.

> 
> If so it might be good to explain it as I am not quite sure I get it.

This change is less about performance and more about unnecessary work.

The processor is likely going to be more clever than the developper and 
the exact numbers will vary depending on how the processor decide to 
manage the cache.

In general, we should avoid interferring too much with the cache without 
a good reason to do it.

How about the following commit message:

"
At the moment, flush_page_to_ram() is both cleaning and invalidate to
PoC the page.

The goal of flush_page_to_ram() is to prevent corruption when the guest 
has disabled the cache (the cache line may be dirty) and read the guest 
to read previous content.

Per this defintion, the invalidating the line is not necessary. So 
invalidating the cache is unnecessary. In fact, it may be 
counter-productive as the line may be (speculatively) accessed a bit 
after. So this will incurr an expensive access to the memory.

More generally, we should avoid interferring too much with cache. 
Therefore, flush_page_to_ram() is updated to only clean to PoC the page.

The performance impact of this change will depend on your 
workload/processor.
"

-- 
Julien Grall

