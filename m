Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 163CD66DB6F
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 11:47:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479313.743085 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHjU9-0007jj-Ro; Tue, 17 Jan 2023 10:46:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479313.743085; Tue, 17 Jan 2023 10:46:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHjU9-0007hp-Ok; Tue, 17 Jan 2023 10:46:33 +0000
Received: by outflank-mailman (input) for mailman id 479313;
 Tue, 17 Jan 2023 10:46:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pHjU8-0007hj-Nk
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 10:46:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHjU8-0005CS-Co; Tue, 17 Jan 2023 10:46:32 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.7.198]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pHjU8-0007zF-73; Tue, 17 Jan 2023 10:46:32 +0000
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
	bh=6KEtVoU3lW6w66inOomDSldMryZOzLz213eeQ86N4+U=; b=iYdpw3PtsCoxYfGiq6zVLspOw0
	qAZMtYlm5aN4Xa3PLQFuCG/0HunVx3APslJSrTGg3kgnq5DFcMdTe4v4qwlmebXmvwh6ssI43LHq+
	tIoKgGFzD3qKN8F6So6lqvJm2S/FAVLUkYQ+OC3ikno3We6QaB3TkPRlWiDE23ZsKDPs=;
Message-ID: <98cc04e5-b7e0-b19a-7d4e-3054ad662466@xen.org>
Date: Tue, 17 Jan 2023 10:46:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <20230116144106.12544-2-michal.orzel@amd.com>
 <72fd8c47-d654-91d0-993c-97f2d0542cff@xen.org>
 <96964034-53b0-c391-6be1-fa5fff6842e1@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <96964034-53b0-c391-6be1-fa5fff6842e1@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 17/01/2023 09:50, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 17/01/2023 10:35, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> It is not clear to me why this was sent In-reply-to the other patch. If
>> they are meant to form a series, then this should have a cover letter +
>> each patch should be numbered.
>>
>> If they are truly separate, then please don't thread them.
> They were meant to be separated. I will form a series for v2 to make the commiting easier.

This is only two patches. So I would be OK if you send them separately 
as well. So pick what you prefer.

Cheers,

-- 
Julien Grall

