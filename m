Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EA697F35FB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 19:32:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638117.994434 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5VWc-0005Gi-FM; Tue, 21 Nov 2023 18:31:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638117.994434; Tue, 21 Nov 2023 18:31:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5VWc-0005Et-CP; Tue, 21 Nov 2023 18:31:06 +0000
Received: by outflank-mailman (input) for mailman id 638117;
 Tue, 21 Nov 2023 18:31:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r5VWa-0005En-P4
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 18:31:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5VWa-0000Em-FG; Tue, 21 Nov 2023 18:31:04 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.19.28]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r5VWa-0005mx-9r; Tue, 21 Nov 2023 18:31:04 +0000
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
	bh=dAeXztvdqzvcGf6i9FOl4XsvwVvp792FM2N/z5bpMdQ=; b=JQ8bWr9MYfmbIDH7wDcCWqBHN7
	kQwF7rzU0qJ2mdoN0rcfF4J5w30jeYDP0MoZmnPVL9Qsa3Wvjt60iYSzsT9XARGK/H+AkzJI8YHcD
	cBoFEwM9jfJrpw6zAK1uO85muuviMQNYJKEusDxNDsV6bzuRJsac9ezXUO56gG6boIvY=;
Message-ID: <fa76ef0e-7150-4dab-a4ca-f8d42addc228@xen.org>
Date: Tue, 21 Nov 2023 18:31:02 +0000
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
 <20135dd2-d36e-4c83-bdb6-b987174f18f2@xen.org>
 <609e34d9-654b-4dcd-8be7-15aa10fe3a25@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <609e34d9-654b-4dcd-8be7-15aa10fe3a25@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 21/11/2023 17:18, Michal Orzel wrote:
> 
> 
> On 21/11/2023 18:04, Julien Grall wrote:
>>
>>
>> On 21/11/2023 17:00, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>> On 21/11/2023 17:09, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 21/11/2023 09:45, Michal Orzel wrote:
>>>>> At the moment, the 'hex' string is placed right after the 'putn'
>>>>> function in the .text section. This is because of the limited range
>>>>> (+/- 1MB) of PC relative 'adr' instruction 'putn' uses. Modify it to use
>>>>> 'adr_l' instead (range extended to +/- 4GB) and move the string to
>>>>> .rodata.str. This way all the earlyprintk messages will be part of .rodata
>>>>> and the behavior will be consistent with what we already do on arm32.
>>>>
>>>> This will be correct today, but I am actually thinking to move 'hex' to
>>>> .rodata.idmap so it can be used while we are on the 1:1 mapping and/or
>>>> temporary mapping.
>>> So you are planning on extending your series to also cover arm64?
>>
>> It is not in my soonish plan. But you are arguing that this patch is for
>> consistency with arm32. This will not be after my series.
> Hmm, consistency was not the only reason for sending this patch. It's a beneficial side effect
> given that putn implementations are very similar on arm32/arm64. 
> Are you saying that
> moving a string that is const from .text to .rodata is not a good change?

.rodata is better but I would rather prefer if this is moved to 
.rodata.idmap directly.

> 
>>
>> And I would not change arm64 just for consistency because I don't view
>> it as necessary. The boot code is already not the same.
> I don't recall trying to make the entire boot code consistent. But if there are parts that
> are almost identical, I think symmetry is welcomed. It helps reading the code, at least for me.

If you want symmetry, then I am happy to switch to .rodata.idmap. But I 
would rather not first move to .rodata and then in a month time switch 
to .rodata.idmap.

Cheers,

-- 
Julien Grall

