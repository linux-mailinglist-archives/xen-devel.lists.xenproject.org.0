Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9E33F4F59
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 19:17:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170528.311340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIDZM-0004ld-Jd; Mon, 23 Aug 2021 17:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170528.311340; Mon, 23 Aug 2021 17:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIDZM-0004iZ-GR; Mon, 23 Aug 2021 17:17:08 +0000
Received: by outflank-mailman (input) for mailman id 170528;
 Mon, 23 Aug 2021 17:17:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIDZL-0004iT-29
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:17:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIDZG-0007tA-BS; Mon, 23 Aug 2021 17:17:02 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIDZG-0005E2-4T; Mon, 23 Aug 2021 17:17:02 +0000
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
	bh=wEtuQ//vLw5YntL2uLJAc5jvGvoeiL7/YYf+B2y1iuc=; b=rYU0zy1jehX9xQacN+UkQJ2qjH
	xQLl2ziCwE+zyNrrOhC1MyDTf5plUk466NdGh7WlJwlgTmIu/8DUIMGk+GHRrxVdSLyksuoSz001i
	1YxreS+SgeWpIRtYiyTk2DB+M2Fm534Tv1RjnPQ6GFRUKt0hjC/pCEz8q+NhTmXt3/dg=;
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Costin Lupu <costin.lupu@cs.pub.ro>
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
 <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
 <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
 <a2d0be78-f53e-a100-838a-5af2a8ef1459@xen.org>
 <8ed65d58-2547-d4cf-0db7-74a2ab114a71@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6dbe57f9-6355-d584-382f-a06779aa9121@xen.org>
Date: Mon, 23 Aug 2021 18:16:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8ed65d58-2547-d4cf-0db7-74a2ab114a71@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/08/2021 10:26, Jan Beulich wrote:
> On 20.08.2021 11:08, Julien Grall wrote:
>> On 20/08/2021 08:44, Costin Lupu wrote:
>>> On 8/20/21 9:52 AM, Jan Beulich wrote:
>>>>> --- /dev/null
>>>>> +++ b/xen/include/public/page.h
>>>>> @@ -0,0 +1,36 @@
>>>>> +/******************************************************************************
>>>>> + * page.h
>>>>> + *
>>>>> + * Page definitions for accessing guests memory
>>>>> + *
>>>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>>>> + * of this software and associated documentation files (the "Software"), to
>>>>> + * deal in the Software without restriction, including without limitation the
>>>>> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>>>>> + * sell copies of the Software, and to permit persons to whom the Software is
>>>>> + * furnished to do so, subject to the following conditions:
>>>>> + *
>>>>> + * The above copyright notice and this permission notice shall be included in
>>>>> + * all copies or substantial portions of the Software.
>>>>> + *
>>>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>>>>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>>>>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>>>> + * DEALINGS IN THE SOFTWARE.
>>>>> + *
>>>>> + * Copyright (c) 2021, Costin Lupu
>>>>> + */
>>>>> +
>>>>> +#ifndef __XEN_PUBLIC_PAGE_H__
>>>>> +#define __XEN_PUBLIC_PAGE_H__
>>>>> +
>>>>> +#include "xen.h"
>>>>> +
>>>>> +#define XEN_PAGE_SHIFT           12
>>>>> +#define XEN_PAGE_SIZE            (xen_mk_long(1) << XEN_PAGE_SHIFT)
>>
>> This will use UL whereas on Arm a page frame should always be 64-bit
>> regardless the bitness. Shouldn't this be converted to use xen_ulong_t
>> instead?
> 
> As pointed out on v1, XEN_PAGE_SIZE would better not end up as a
> value of signed type, for ...

Did you mean "not end up as a value of **unsigned** type"...

> 
>>>>> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
> 
> ... this to suitably sign-extend to wider types is necessary.

... because, if I am not mistaken, the sign-extension wouldn't happen 
with unsigned type. But then on v1 you wrote:

"Imo the smallest type this should evaluate to is xen_ulong_t"

Which I interpreted as this value should be 64-bit on Arm32. If this not 
what you meant then I am lost.

> 
> Also unless you expect someone to use typeof(XEN_PAGE_SIZE) I'm
> afraid I don't see where the constant being long vs xen_long_t
> (if such existed) might matter.
> Otoh perhaps xen_mk_ulong() would
> better have produced a xen_ulong_t typed values in the first
> place, but I'm afraid we can't alter the existing macro.

We can create a new one.

>> Our stable ABI has not been designed with multiple page granularity in
>> mind. We could introduce a hypercall to query the page size used by the
>> ABI. But then, I don't think we have the full picture of how this is
>> going to pan out (I haven't try to use another page size on Xen yet).
>>
>> I think we have three choices here:
>>     1) Stick with the existing definition in the tools
>>     2) Move the definition in the public headers and only expose them to
>> the tools.
>>     3) Query the page size via a new hypervisor
>>
>> As I wrote above, 3) is going to take some time to get it right. So the
>> question here is whether 2) is temporarily better than 1).
> 
> Because I understand 3) is some way out, and because I think 2) is
> better than 1), I wrote "might be an option" for what you call 2).
> But I could see people (Andrew for example) to take a different
> position and object to such a temporary measure.

I think we need to make a decision so Costin doesn't keep sending 
version on something that can't be merged. What does the others thinks?

Cheers,

-- 
Julien Grall

