Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8F47F347A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 18:05:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638061.994323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UBH-0001bI-Up; Tue, 21 Nov 2023 17:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638061.994323; Tue, 21 Nov 2023 17:04:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5UBH-0001ZW-S0; Tue, 21 Nov 2023 17:04:59 +0000
Received: by outflank-mailman (input) for mailman id 638061;
 Tue, 21 Nov 2023 17:04:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r5UBG-0001ZK-5f
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 17:04:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5UBF-0006sv-QP; Tue, 21 Nov 2023 17:04:57 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.19.28]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5UBF-0001xS-Jw; Tue, 21 Nov 2023 17:04:57 +0000
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
	bh=Q3pbh1ynVW28rGqHUo+qRU7/t2557DH/xid4lvFVKJ8=; b=tjLKgboCUrQWOBHkjlIpXnWzoP
	i0F5gGt2QtUAEEfkuulKv6fytt4N451Upa86/3yDtxNFWPyyQexBXtz/Ylg9bIaSreAQtVnr16i59
	WIQm8U0pzVfPrRSi2mJaK6HvoscXcUmuq/9Zja9ysx7Pu26ZR6+sO/sqqRx6E751hcds=;
Message-ID: <20135dd2-d36e-4c83-bdb6-b987174f18f2@xen.org>
Date: Tue, 21 Nov 2023 17:04:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] xen/arm64: head: Move earlyprintk 'hex' string to
 .rodata.str
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
 <20231121094516.24714-2-michal.orzel@amd.com>
 <cbe5470e-2017-4c4f-bd32-987da72aaf44@xen.org>
 <5b4ac8af-98a6-4757-9946-d520baa6a2a7@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5b4ac8af-98a6-4757-9946-d520baa6a2a7@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/11/2023 17:00, Michal Orzel wrote:
> Hi Julien,

Hi,

> On 21/11/2023 17:09, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 21/11/2023 09:45, Michal Orzel wrote:
>>> At the moment, the 'hex' string is placed right after the 'putn'
>>> function in the .text section. This is because of the limited range
>>> (+/- 1MB) of PC relative 'adr' instruction 'putn' uses. Modify it to use
>>> 'adr_l' instead (range extended to +/- 4GB) and move the string to
>>> .rodata.str. This way all the earlyprintk messages will be part of .rodata
>>> and the behavior will be consistent with what we already do on arm32.
>>
>> This will be correct today, but I am actually thinking to move 'hex' to
>> .rodata.idmap so it can be used while we are on the 1:1 mapping and/or
>> temporary mapping.
> So you are planning on extending your series to also cover arm64?

It is not in my soonish plan. But you are arguing that this patch is for 
consistency with arm32. This will not be after my series.

And I would not change arm64 just for consistency because I don't view 
it as necessary. The boot code is already not the same.

Cheers,

-- 
Julien Grall

