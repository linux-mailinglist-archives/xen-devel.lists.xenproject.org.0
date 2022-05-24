Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 934EB532625
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 11:13:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336458.560782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntQaZ-0002g7-55; Tue, 24 May 2022 09:12:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336458.560782; Tue, 24 May 2022 09:12:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntQaZ-0002eF-1X; Tue, 24 May 2022 09:12:27 +0000
Received: by outflank-mailman (input) for mailman id 336458;
 Tue, 24 May 2022 09:12:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntQaX-0002e9-VA
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 09:12:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntQaX-0004Si-0i; Tue, 24 May 2022 09:12:25 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntQaW-00046J-OZ; Tue, 24 May 2022 09:12:24 +0000
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
	bh=MzH95oDZYTsAKKn6ZcxU+KBX1+vhfMcysbq/pqPhNSg=; b=BEUREnV7mCTYpfMqwwxuOVC6VM
	45T5n6VL8L6bcGemO9rBivv8sy3pUgQQn7FMf6NMT+MqhCxOW7sOm6Cf6YggIYF9j7tGCFVJdDano
	1m1zAZjt37HIoHQ5uedKtWiTzaJALRB+8eZPY4gkiscwe+EsVFrVz+sFftgQXv1ePnpU=;
Message-ID: <83c37d80-50fe-a68a-e0c0-529588b2e842@xen.org>
Date: Tue, 24 May 2022 10:12:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] xen/arm: Remove most of the *_VIRT_END defines
To: Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <jgrall@amazon.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>
References: <20220523194953.70636-1-julien@xen.org>
 <PAXPR08MB74203220E82BEBB49540A7FE9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <21E706F6-0625-489B-AA19-278B58CD3537@arm.com>
 <PAXPR08MB7420EA90EFF303382953327E9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420EA90EFF303382953327E9ED79@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wei,

On 24/05/2022 09:16, Wei Chen wrote:
>>> It seems you prefer to point _end to the address after the end. Even
>>> though we got rid of the macro definition of _END. But we didn't agree
>>> on how to use it. For me, when I first saw
>>> "end = start + LIVEPATCH_VMAP_SIZE" I subconsciously think the -1 is
>>> missing here. I even added a comment, but removed it when I reached
>>> to this line : )
>>> May be it's better to place some code guide for END in code comment
>>> in the SIZE definition, otherwise, we may have different point addresses
>>> of _end functions.
>>
>> I think it is quite common to have size being the actual size and not size
>> -1.
>> END is clearly the last address of the area but SIZE should be the number
>> of bytes in the area so I think Julien here is right.
>>
> 
> Maybe I didn't describe it clearly : )
> I agree with the SIZE that Julien has done. My concern is that, should we
> need a guide line for how to use the SIZE to calculate END

It is not possible to have a guideline at the moment because we are not 
consistent how "END" is defined in Xen.

This is also why I want to get rid of "END" completely. It is more 
difficult (to not say impossible) to interpret (start, size) differently.

As I wrote in the commit message, I haven't yet addressed the common 
part (there work is a lot more consequent). But I wanted at least to 
start to get rid of some and push the use of "end" as far as possible.

> For example, in this patch, Julien is using END=START+SIZE, then END is
> pointing to the address after the end. But for me, I intend to use
> END=START+SIZE-1, because I want the END point to the last address.

Same here.

> 
> Over time, when there are a lot of get_xxx_end functions in the code,
> their actual meanings will be different, just as confusing as the previous
> macro definitions

My plan is to get rid of get_XXX_end completely and instead return 
start, size.

This is only the first part of the work. I need this one start 
reshuffling the memory layout because I want to be able to use (start, 
size) consistently in the layout.

Cheers,

-- 
Julien Grall

