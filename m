Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A628774788C
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 21:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558636.872926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlKC-0005F8-Hp; Tue, 04 Jul 2023 19:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558636.872926; Tue, 04 Jul 2023 19:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGlKC-0005CZ-Eo; Tue, 04 Jul 2023 19:04:32 +0000
Received: by outflank-mailman (input) for mailman id 558636;
 Tue, 04 Jul 2023 19:04:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGlKA-0005CT-IF
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 19:04:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlK9-0008OX-Qc; Tue, 04 Jul 2023 19:04:29 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGlK9-000155-KN; Tue, 04 Jul 2023 19:04:29 +0000
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
	bh=fR3r3e2PTnjvvVPDCXK9R1xFYDK4+kL1uXPL+guGajI=; b=fB4tjsyUgWw7bA08D/WZyAPZxE
	L/Cs17v3vqf6n7mn7bgB8MJa7MvnSsv+iVOStvNjRXGYe9nuuYc6lkVHjfHGR4RIERJCRtYLegEid
	bcQFRZWXFdnzGm4O3+vvKFgrjvPcxOg9vVTX6wel/i690i1eDGG7MeyQUuohjZGUP/48=;
Message-ID: <31aafa59-45a5-59df-c5ff-e429d91851d2@xen.org>
Date: Tue, 4 Jul 2023 20:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 4/7] xen/arm: page: Consolidate write_pte() and clarify
 the documentation
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Luca Fancellu <Luca.Fancellu@arm.com>, Michal Orzel <michal.orzel@amd.com>,
 Henry Wang <Henry.Wang@arm.com>, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230619170115.81398-1-julien@xen.org>
 <20230619170115.81398-5-julien@xen.org>
 <49DB9A64-FB34-4EAB-9E6D-3C445B1790E4@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <49DB9A64-FB34-4EAB-9E6D-3C445B1790E4@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 04/07/2023 16:06, Bertrand Marquis wrote:
>> On 19 Jun 2023, at 19:01, Julien Grall <julien@xen.org> wrote:
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> The implementation of write_pte() is pretty much the same on arm32
>> and arm64. So it would be good to consolidate it as this would help
>> to clarify the requirements when using the helper.
>>
>> Take the opportunity to switch from assembly to call macros. Note there
>> is a difference on arm32 because the option was not specified. But this
>> meant 'sy' (system wide).
>>
>> Futhermore, the requirements for the ISB is incomplete. Per the Arm Arm,
>> (Armv7 DDI406C.d A3.8.3 and Armv8 DDI 0487J.a B2.3.12), DSB will only
>> affect explicit accesses. So an ISB is necessary after DSB to ensure
>> the completion. Having an ISB after each update to the page-tables is
>> probably too much, so let the caller add the instruction when it is
>> convenient.
>>
>> Lastly, the barrier in write_pte() may be too restrictive but I haven't
>> yet find the proper section(s) in the Arm Arm.
> 
> I do not think we will find any proper section for that in the Arm Arm as it
> depends on use cases.
> In ours we might have the page table shared among cores so I think system
> is the way to go.

For SMP systems, like Linux, Xen is assuming that all the cores are in 
the same inner-shareable domain. So 'ish' would be sufficient based on 
just that.

However, I haven't made the change because I am not sure about the 
interaction when the modified entry modified to device memory and we 
have an access after/before.

> 
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

