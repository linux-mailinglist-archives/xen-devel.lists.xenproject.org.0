Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 738F39154DC
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jun 2024 18:57:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746853.1154070 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLn01-0006u2-Uo; Mon, 24 Jun 2024 16:57:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746853.1154070; Mon, 24 Jun 2024 16:57:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLn01-0006ri-RW; Mon, 24 Jun 2024 16:57:01 +0000
Received: by outflank-mailman (input) for mailman id 746853;
 Mon, 24 Jun 2024 16:57:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sLn00-0006rc-4U
 for xen-devel@lists.xenproject.org; Mon, 24 Jun 2024 16:57:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sLmzz-0006HC-P0; Mon, 24 Jun 2024 16:56:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sLmzz-0000JS-GE; Mon, 24 Jun 2024 16:56:59 +0000
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
	bh=EBg4Gh4deymQ7P0TwRKlDP4Es3l4BgPZ6VwfVzcxJJM=; b=082K1kxM8ridkWGss06gim1/wT
	Og7DQRdSZDzmzrSt6nPuCVTuDhzp1jm1qAbPIet6TJTRsfqwycJxZxC97ViI2UcuAqjZdc99BtN14
	7atIuUkATCEiRfNBk3S0ExAmHsY5I5pqbuHx+NQvYknxsKQmV/6ZxUiIsu0yXkOnEtlU=;
Message-ID: <f17200a6-efb5-4775-964c-21e687890f76@xen.org>
Date: Mon, 24 Jun 2024 17:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: request host address to
 be specified for 1:1 domains
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
References: <20240621092205.30602-1-michal.orzel@amd.com>
 <86594fa0-a12d-42fc-ba6c-fe235becf768@xen.org>
 <d69b74ce-13b6-46f1-b2bd-051c913be43a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d69b74ce-13b6-46f1-b2bd-051c913be43a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2024 11:43, Michal Orzel wrote:
> Hi Julien,
> 
> On 24/06/2024 12:22, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 21/06/2024 10:22, Michal Orzel wrote:
>>> As a follow up to commit cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem
>>> should be direct-mapped for direct-mapped domains") add a check to
>>> request that both host and guest physical address must be supplied for
>>> direct mapped domains. Otherwise return an error to prevent unwanted
>>> behavior.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>
>> I would argue that it should be have a fixes tag:
>>
>> Fixes: 988f1c7e1f40 ("xen/arm: static-shmem: fix "gbase/pbase used
>> uninitialized" build failure")
>>
>> Mainly because while you fixed the build, it was missing the check in
>> the "else" part.
>>
>> I am happy to update it on commit if you are ok with the change.
> Yes, I'm fine with it.

Committed.

Cheers,

-- 
Julien Grall

