Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185768D669
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 13:25:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491062.760011 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPN2F-0006m6-KG; Tue, 07 Feb 2023 12:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491062.760011; Tue, 07 Feb 2023 12:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPN2F-0006j3-HT; Tue, 07 Feb 2023 12:25:19 +0000
Received: by outflank-mailman (input) for mailman id 491062;
 Tue, 07 Feb 2023 12:25:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPN2D-0006ix-W2
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 12:25:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPN2D-0000fV-7O; Tue, 07 Feb 2023 12:25:17 +0000
Received: from [54.239.6.184] (helo=[192.168.19.254])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPN2D-000827-0f; Tue, 07 Feb 2023 12:25:17 +0000
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
	bh=oRKxtklRriJfGpyyw3SWVXtexrI5aDfH8hx9UnXSOQo=; b=YEZic+YqEAcpH08jzHNLItnIFl
	VhMXxRMjsqq7ZOszl0mzQY32/i1/zpQ8BcTLajCYLmuPViXvHexFiUyyFKI1TQx7yqilMZ5G9+QrI
	xOZR15k1chfJUKQVrVNptBOuJaVf2YF20iS1xOzsnijidaj72f3apXLjA3H6trkQ0uH4=;
Message-ID: <43562da4-53a1-df7a-dcf3-2af62a95f42d@xen.org>
Date: Tue, 7 Feb 2023 12:25:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v3 1/2] xen/device_tree: fix Eclair findings for MISRA C
 2012 Rule 20.7
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20230203190908.211541-1-burzalodowa@gmail.com>
 <20230203190908.211541-2-burzalodowa@gmail.com>
 <F9BF9B83-7889-4D51-B0B3-09950071AB75@arm.com>
 <63d81215-fd4a-e2f2-e145-3ee115b7df14@xen.org>
 <a8056218-34d6-71b2-8034-42dcf6f37a1b@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a8056218-34d6-71b2-8034-42dcf6f37a1b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/02/2023 10:46, Xenia Ragiadakou wrote:
> 
> On 2/7/23 12:39, Julien Grall wrote:
>> Hi,
>>
>> On 07/02/2023 10:23, Luca Fancellu wrote:
>>>
>>>
>>>> On 3 Feb 2023, at 19:09, Xenia Ragiadakou <burzalodowa@gmail.com> 
>>>> wrote:
>>>>
>>>
>>> I’m not really a supporter of empty commit message, but it’s up to 
>>> the maintainer :)
>>
>> +1. In this case a brief summary of the rule would be handy for those 
>> that are not well-versed with MISRA.
>>
>> This can be dealt on commit if you propose a new commit message.
> 
> I 'm refrained from stating the rule as is because it is strict and it 
> is not applied as is.

I am a bit confused with this statement. From misra/..., we are 
supporting rule 20.7. So why aren't applying it strictly?

And if it is not applied as-is, shouldn't we document the violation (if 
any)?

> 
> "Add parentheses around macro parameters when the precedence and 
> associativity of the performed operators can lead to unintended order of 
> evaluation."
> 
> Is this ok?

I am OK with this. Is there any ID from Eclair that could be used to 
track each error (and so we can confirm they have disappeared)?

Cheers,

-- 
Julien Grall

