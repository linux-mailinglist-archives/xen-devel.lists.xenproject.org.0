Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A526B3BC853
	for <lists+xen-devel@lfdr.de>; Tue,  6 Jul 2021 11:10:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.150936.279018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0h5f-0002pZ-An; Tue, 06 Jul 2021 09:10:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 150936.279018; Tue, 06 Jul 2021 09:10:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m0h5f-0002lP-6a; Tue, 06 Jul 2021 09:10:03 +0000
Received: by outflank-mailman (input) for mailman id 150936;
 Tue, 06 Jul 2021 09:10:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m0h5d-0002Zy-Sy
 for xen-devel@lists.xenproject.org; Tue, 06 Jul 2021 09:10:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0h5c-0005UP-SE; Tue, 06 Jul 2021 09:10:00 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m0h5c-0006uS-MN; Tue, 06 Jul 2021 09:10:00 +0000
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
	bh=siiuXVQqIQWHbriIZQJUsmg1oLf98wYSl07cDf2tO9k=; b=TuUGhiFJBSd/WbGBI5ZkTGKiHD
	yZ3ABq7FrOmXZiVVdo6lsseLqQIilULDm0g5EVLY6EaRTAjH253MRl9LmZJIzLkZcA12mVNWxcigK
	NCotsZaj2zBT6OW/cvqgsWUUN9ThfdNvtFHPWbb/SieBPTGxczJOebZ+76TnS/6jVq0E=;
Subject: Re: [PATCH 4/9] xen/arm: static memory initialization
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-5-penny.zheng@arm.com>
 <1c6530bf-a362-0993-c4c5-953ee2afb1bf@xen.org>
 <VE1PR08MB5215D076B85A22DD9991B64CF71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f4836b6e-cbb3-ef9d-1d15-a6ec75d985d2@xen.org>
Date: Tue, 6 Jul 2021 10:09:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215D076B85A22DD9991B64CF71C9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 05/07/2021 08:28, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, July 1, 2021 2:10 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>
>> Subject: Re: [PATCH 4/9] xen/arm: static memory initialization
>>
>> Hi Penny,
>>
>> On 07/06/2021 03:43, Penny Zheng wrote:
>>> This patch introduces static memory initialization, during system RAM boot
>> up.
>>
>> The word "RAM" looks spurious.
>>
> 
> Thx. I check the "spurious" in dictionary, it means fake? So I will leave "during system boot up"
> here.

Yes, this reads better.

>>> 2. scrub the page in need synchronously.
>>
>> Can you explain why this is necessary?
>>
> 
> Since I'm borrowing the logic in free_heap_pages, I'm also trying to cover all the scenarios here like it does.
> So I assume that free_staticmem_page will not only be used on initialization, but also when destroying/rebooting the domain.
> On these cases, it is necessary to scrub the page, ig.

I wasn't asking about scrubbing specifically but instead why it is 
synchronous. Sorry for the confusion.

Cheers,

-- 
Julien Grall

