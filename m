Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D56BB5587C7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 20:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355151.582639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Rpb-0000Fx-Bm; Thu, 23 Jun 2022 18:45:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355151.582639; Thu, 23 Jun 2022 18:45:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4Rpb-0000Df-8N; Thu, 23 Jun 2022 18:45:31 +0000
Received: by outflank-mailman (input) for mailman id 355151;
 Thu, 23 Jun 2022 18:45:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4RpZ-0000DS-MQ
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:45:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RpZ-0003RI-9B; Thu, 23 Jun 2022 18:45:29 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RpZ-0002m8-3v; Thu, 23 Jun 2022 18:45:29 +0000
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
	bh=68v5wa/HlVOdFYWFpVpw3Kwn3p9rtOYQIlQj2aYg0mY=; b=RXQrG3+9XjLkxjMuZLAlr0KpH+
	rBxKe0nbYW+riStczEXzIDFjDZNV9ce518nFmnEzjgQq0dNmj9QzAiHT9rabTcULZRf6b4YY4S6Ay
	yLLp4qOW3iU7jD1x/6+EHlaIvpWbcISoVrgGH8LhgQJmp1TkCjxQmZonVWDQeNzKFtTA=;
Message-ID: <20ff7145-b561-b080-29ea-08583da140a4@xen.org>
Date: Thu, 23 Jun 2022 19:45:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] xen/common: device_tree: Fix MISRA C 2012 Rule 8.7
 violation
To: Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: xen-devel@lists.xenproject.org
References: <20220622151557.545880-1-burzalodowa@gmail.com>
 <alpine.DEB.2.22.394.2206221231260.2157383@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2206221231260.2157383@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 22/06/2022 20:31, Stefano Stabellini wrote:
> On Wed, 22 Jun 2022, Xenia Ragiadakou wrote:
>> The function __dt_n_size_cells() is referenced only in device_tree.c.
>> Change the linkage of the function from external to internal by adding
>> the storage-class specifier static to the function definition.
>>
>> This patch aims to resolve indirectly a MISRA C 2012 Rule 8.4 violation
>> warning.
>>
>> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Committed.

Cheers,

> 
> 
>> ---
>>   xen/common/device_tree.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>> index 0e8798bd24..6c9712ab7b 100644
>> --- a/xen/common/device_tree.c
>> +++ b/xen/common/device_tree.c
>> @@ -496,7 +496,7 @@ static int __dt_n_addr_cells(const struct dt_device_node *np, bool_t parent)
>>       return DT_ROOT_NODE_ADDR_CELLS_DEFAULT;
>>   }
>>   
>> -int __dt_n_size_cells(const struct dt_device_node *np, bool_t parent)
>> +static int __dt_n_size_cells(const struct dt_device_node *np, bool_t parent)
>>   {
>>       const __be32 *ip;
>>   
>> -- 
>> 2.34.1
>>

-- 
Julien Grall

