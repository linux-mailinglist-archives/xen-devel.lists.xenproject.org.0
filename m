Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C72A669499
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 11:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477195.739799 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHaj-00021Y-4D; Fri, 13 Jan 2023 10:47:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477195.739799; Fri, 13 Jan 2023 10:47:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGHaj-0001y8-0m; Fri, 13 Jan 2023 10:47:21 +0000
Received: by outflank-mailman (input) for mailman id 477195;
 Fri, 13 Jan 2023 10:47:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGHah-0001wP-Co
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 10:47:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGHah-0007ja-2d; Fri, 13 Jan 2023 10:47:19 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGHag-0006pR-Rx; Fri, 13 Jan 2023 10:47:18 +0000
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
	bh=ilTuiZWtxXIivaigHd1bbnuUetdYbfKeHsMzi0wizV4=; b=Myhhjgh9dcLWpoJ/jz5dA2t9hr
	HMYB2U9+q0UjvzaPfbndv8MgKPC7C9WBGv8FKVDBdmDyegLbucagsfD4HnlKkDzR8uY8HfhG3Z+bH
	NpohIu9NSt8nh6Cc5Zb7GG0QK98LLIeDmpVc6xL6JZksWo7dw/IXI1ITdib18htKl04U=;
Message-ID: <66db4978-3f2c-b46f-48d5-0607e849deef@xen.org>
Date: Fri, 13 Jan 2023 10:47:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v4 06/14] xen/arm32: head: Replace "ldr rX, =<label>" with
 "mov_w rX, <label>"
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113101136.479-1-julien@xen.org>
 <20230113101136.479-7-julien@xen.org>
 <092f9d85-954c-281a-8738-de82f90be248@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <092f9d85-954c-281a-8738-de82f90be248@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13/01/2023 10:45, Michal Orzel wrote:
> 
> 
> On 13/01/2023 11:11, Julien Grall wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> "ldr rX, =<label>" is used to load a value from the literal pool. This
>> implies a memory access.
>>
>> This can be avoided by using the macro mov_w which encode the value in
>> the immediate of two instructions.
>>
>> So replace all "ldr rX, =<label>" with "mov_w rX, <label>".
>>
>> No functional changes intended.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>
>> ----
>>      Changes in v4:
>>          * Add Stefano's reviewed-by tag
>>          * Add missing space
>>          * Add Michal's reviewed-by tag
> It looks like you forgot to add it, so to make b4 happy:

Ah yes. Sorry.

> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks! I also forgot to replace the "----" with "---" before sending 
:/. I am not planning to respin the series just for that.

Cheers,

-- 
Julien Grall

