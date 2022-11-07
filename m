Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CBC61F0EC
	for <lists+xen-devel@lfdr.de>; Mon,  7 Nov 2022 11:38:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.439269.693300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzWP-0008Pp-Mi; Mon, 07 Nov 2022 10:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 439269.693300; Mon, 07 Nov 2022 10:38:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1orzWP-0008Ni-Jp; Mon, 07 Nov 2022 10:38:29 +0000
Received: by outflank-mailman (input) for mailman id 439269;
 Mon, 07 Nov 2022 10:38:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1orzWN-0008NY-Dp
 for xen-devel@lists.xenproject.org; Mon, 07 Nov 2022 10:38:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orzWN-0003SS-5m; Mon, 07 Nov 2022 10:38:27 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.25.99]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1orzWM-0005Ea-VQ; Mon, 07 Nov 2022 10:38:27 +0000
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
	bh=CjDHon73BsRSXakSbHTZIDCG7dfaAB2TnKv77f0UnnA=; b=4Y8yhCkx0RPsz3G13bwcFLGYU8
	O+PgOpsUlqGTjXWIl5IUqvP7i5TfiD6Aq5ShIvJuRfdkTU6UUL7410cHFeLg76d+h8CAhevbXbpWn
	iNG/r6fII7+EYEI97VgYXvYZ0RruO1mmvajVvPFtGA2QuMpP+z9qUZGywX/LSU0q6Mhs=;
Message-ID: <09e0dfa1-0167-a4b2-63cf-5cf8619fa417@xen.org>
Date: Mon, 7 Nov 2022 10:38:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 10/11] xen/arm64: introduce helpers for MPU
 enable/disable
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-11-wei.chen@arm.com>
 <54d6e747-c791-c321-3c75-87613393d789@xen.org>
 <AM0PR08MB45308C4FF75C1D1B6605DC95F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB45308C4FF75C1D1B6605DC95F73C9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/11/2022 09:57, Penny Zheng wrote:
> Hi Julien

Hi Penny,

> 
>> -----Original Message-----
>> From: Xen-devel <xen-devel-bounces@lists.xenproject.org> On Behalf Of
>> Julien Grall
>> Sent: Monday, November 7, 2022 4:56 AM
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
>> Cc: nd <nd@arm.com>; Penny Zheng <Penny.Zheng@arm.com>; Stefano
>> Stabellini <sstabellini@kernel.org>; Bertrand Marquis
>> <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v6 10/11] xen/arm64: introduce helpers for MPU
>> enable/disable
>>
>> Hi Wei,
>>
>> On 04/11/2022 10:07, Wei Chen wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> We need some helpers for Xen to enable/disable MPU in boot-time and
>>> runtime. For MPU enable helper, we know that it's an essential
>>> requirement of MPU system. But for MPU disable, we need to use it for
>>> some special situations. For example, in the progress of tranferring
>>> from boot-time to runtime, we need to update the MPU protection
>>> regions configuration, but we can't modify an MPU protection region if
>>> there is some data accessed by Xen. But in boot-time all of Xen text,
>>> data and BSS are in one MPU protection region, if Xen want to update
>>> this protection region, above restriction will be triggered.
>>
>> This raises the following question: Why can't we create the split regions right
>> now?
>>
> 
> The reason why we are not creating the split regions right now is that we
> are trying to go the same path MMU goes. 

The MMU code is going to change pretty soon (see [1] for some ground 
work). The runtime page-tables for CPU0 will be created in assembly code 
and never switched after (aside when using cache coloring).

Although, I don't think I will apply the proper permissions in assembly 
(this is a bit trickier than with the MPU).

> Then we could reuse as much
> same interfaces as we could, in order to not leave #ifdef CONFIG_HAS_MPU
> all over the place.
Do you have a list of those interfaces that would require #ifdef?

> 
>> In particular, disabling the MMU/Cache is fairly risky because you need to
>> ensure that anything in the cache you care about have been written back to
>> the RAM).
>>
> 
> Hope I could understand your concern totally, you are worrying about stale info left in
> the cache, even if it's always 1:1 mapping on the MPU system, memory attributes could
> be different before and after?

No. I am more concerned about...

> So it is never enough that we only flush the variables which we will use during the disabling
> time, it should be everything in the cache...:/

... this. We don't only need to flush before they are accessed but also 
after if they are modified.

It is possible to do it correctly, but it requires to be very careful. 
So if we can avoid disabling the cache/MPU then it will be a lot better.

> 
> Since in current design, there are two time points in boot time where we will disable
> MPU/Cache to configure MPU.
> 
> One is in setup_mm, here, we will map XEN components by components, each MPU memory
> region for a different component.
> The other is near the end of boot time, we will reorg the whole MPU memory region layout
> before going runtime, and we will keep unchanging regions in the front and flexible ones in the rear.

You should not need any reorg if you map the boot-only section towards 
in the higher slot index (or just after the fixed ones).

Cheers,

[1] 20221022150422.17707-1-julien@xen.org

-- 
Julien Grall

