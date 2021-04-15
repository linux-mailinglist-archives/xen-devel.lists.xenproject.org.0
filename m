Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDF8360CEA
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:56:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111347.212982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3PM-0004Nf-Ga; Thu, 15 Apr 2021 14:55:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111347.212982; Thu, 15 Apr 2021 14:55:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3PM-0004NG-CO; Thu, 15 Apr 2021 14:55:52 +0000
Received: by outflank-mailman (input) for mailman id 111347;
 Thu, 15 Apr 2021 14:55:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lX3PK-0004NA-UW
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:55:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX3PJ-00020U-UP; Thu, 15 Apr 2021 14:55:49 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lX3PJ-0000Vy-Ln; Thu, 15 Apr 2021 14:55:49 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=g0oeXqtScPDkBsnqkFi22FqfWRL9wdHvI2x2GPtJMJM=; b=ZwA4k6vyILnRixKnG44D9mTQBv
	ZSHH2W2UI+gT6jwgozM+FWa+xZCHqYjTNVdUAB2bmSnaADbxX7yMwX4ffHDHv2LfPxo0ZIeIkjsM4
	glll/8gCylRRbU5ZQOQ5nVdHi+QXZ+E6JKOYfmeR5HClLwuF/gall+lS77u7mISNXyRw=;
Subject: Re: [PATCH v3 12/15] unxz: replace INIT{,DATA} and STATIC
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2db91183-a7de-0c43-2fef-feb3523ed19b@suse.com>
 <4e0a0db2-db34-a738-2f5e-1d5cd2c37e19@suse.com>
 <c52c9670-d87e-79f9-0104-e6e074419c31@xen.org>
 <a9adf993-0f2d-acb1-b671-7b8c3b15b4d8@suse.com>
 <eaf819a8-985f-d33f-902d-58320c99a8d8@xen.org>
 <1a3f4d72-d57a-dde3-fb46-c91508f09b2a@suse.com>
 <3642f590-e3b9-ce65-7dce-04681dbfb02f@xen.org>
 <a76656e4-1b19-df2f-aba0-e7b26b3ab968@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ffbe985e-c8a7-331c-cb6d-6f4621b5c71c@xen.org>
Date: Thu, 15 Apr 2021 15:55:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <a76656e4-1b19-df2f-aba0-e7b26b3ab968@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/04/2021 15:28, Jan Beulich wrote:
> On 15.04.2021 16:24, Julien Grall wrote:
>>
>>
>> On 15/04/2021 15:22, Jan Beulich wrote:
>>> On 15.04.2021 16:18, Julien Grall wrote:
>>>>
>>>>
>>>> On 15/04/2021 15:16, Jan Beulich wrote:
>>>>> On 15.04.2021 13:58, Julien Grall wrote:
>>>>>> On 26/01/2021 09:52, Jan Beulich wrote:
>>>>>>> --- a/xen/common/decompress.h
>>>>>>> +++ b/xen/common/decompress.h
>>>>>>> @@ -9,7 +9,6 @@
>>>>>>>      
>>>>>>>      #define STATIC static
>>>>>>>      #define INIT __init
>>>>>>> -#define INITDATA __initdata
>>>>>>>      
>>>>>>>      #define malloc xmalloc_bytes
>>>>>>>      #define free xfree
>>>>>>> @@ -21,7 +20,6 @@
>>>>>>>      
>>>>>>>      #define STATIC static
>>>>>>>      #define INIT
>>>>>>> -#define INITDATA
>>>>>>
>>>>>> Shouldn't the two changes be part of patch #14?
>>>>>
>>>>> One could do it that way, sure, but the last uses are gone here,
>>>>> and hence I wanted to get rid of this one item right away.
>>>>
>>>> AFAICT, the same is true for STATIC and INIT. So it doesn't sense to not
>>>> be consistent in the way you treat them.
>>>
>>> No, further uses of STATIC and INIT get dropped by later patches.
>>
>> I think you misundertood my comment. What I meant is you drop INIT in
>> patch #14 when the last caller was dropped in a previous patch.
> 
> Now this and some other of your comments are getting really nitpicky.

You misundertood my question, so I was clarifying what I meant.

> The end result is the same. I can certainly move removals around
> further, but I think I ought to have some leeway on how exactly I
> achieve an identical end result. Things would be different, I agree,
> if the end result was not suitably consistent.

As I mentionned in patch #14, this is not very different from requesting 
to reshuffle the code. I find a bit surprising you are complaining about 
this...

I guess I could have add NIT in front to make clearer this was only a 
suggestion.

 From your answer, I am assuming this is a no which is fair:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

