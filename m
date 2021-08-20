Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A65BA3F28DA
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 11:08:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169342.309319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0VS-0002OH-AY; Fri, 20 Aug 2021 09:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169342.309319; Fri, 20 Aug 2021 09:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH0VS-0002Ly-7M; Fri, 20 Aug 2021 09:08:06 +0000
Received: by outflank-mailman (input) for mailman id 169342;
 Fri, 20 Aug 2021 09:08:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH0VR-0002Lo-Bg
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 09:08:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH0VO-0006Gc-Is; Fri, 20 Aug 2021 09:08:02 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH0VO-0005TA-C8; Fri, 20 Aug 2021 09:08:02 +0000
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
	bh=z0iw15Og9n7XcRJquqxl1KPORQdT7JCtTHcvrbbge7Y=; b=p65TDD07uDbgeLQkiSWtkefg9G
	cq1BqRa6lGbkxK9hbTI5pBE05NUefbTxvEZ1TU0DSP2Iddmz7EXllqT5LBoR4LKjp9At6h+wLxXRr
	uY/c3QyZ7fGbL23pUa7Jq8DDHJpEoFk+uiJ1VfMXmXl/OdnTvy9o9+OI/zRlsOozzexw=;
Subject: Re: [PATCH v2 1/4] public: Add page related definitions for accessing
 guests memory
To: Costin Lupu <costin.lupu@cs.pub.ro>, Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1629395092.git.costin.lupu@cs.pub.ro>
 <1d9338102d2013addfabc0cf9275ef156fd5080f.1629395092.git.costin.lupu@cs.pub.ro>
 <69747133-3d42-4179-2606-12b1d1a9c8a6@suse.com>
 <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
From: Julien Grall <julien@xen.org>
Message-ID: <a2d0be78-f53e-a100-838a-5af2a8ef1459@xen.org>
Date: Fri, 20 Aug 2021 10:08:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c942c080-183a-ddb2-f523-dd3354f5b4a0@cs.pub.ro>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

Replying to a single e-mail for simplicity.

On 20/08/2021 08:44, Costin Lupu wrote:
> On 8/20/21 9:52 AM, Jan Beulich wrote:
>>> --- /dev/null
>>> +++ b/xen/include/public/page.h
>>> @@ -0,0 +1,36 @@
>>> +/******************************************************************************
>>> + * page.h
>>> + *
>>> + * Page definitions for accessing guests memory
>>> + *
>>> + * Permission is hereby granted, free of charge, to any person obtaining a copy
>>> + * of this software and associated documentation files (the "Software"), to
>>> + * deal in the Software without restriction, including without limitation the
>>> + * rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
>>> + * sell copies of the Software, and to permit persons to whom the Software is
>>> + * furnished to do so, subject to the following conditions:
>>> + *
>>> + * The above copyright notice and this permission notice shall be included in
>>> + * all copies or substantial portions of the Software.
>>> + *
>>> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>>> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>>> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>>> + * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>>> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
>>> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
>>> + * DEALINGS IN THE SOFTWARE.
>>> + *
>>> + * Copyright (c) 2021, Costin Lupu
>>> + */
>>> +
>>> +#ifndef __XEN_PUBLIC_PAGE_H__
>>> +#define __XEN_PUBLIC_PAGE_H__
>>> +
>>> +#include "xen.h"
>>> +
>>> +#define XEN_PAGE_SHIFT           12
>>> +#define XEN_PAGE_SIZE            (xen_mk_long(1) << XEN_PAGE_SHIFT)

This will use UL whereas on Arm a page frame should always be 64-bit 
regardless the bitness. Shouldn't this be converted to use xen_ulong_t 
instead?

>>> +#define XEN_PAGE_MASK            (~(XEN_PAGE_SIZE - 1))
>>
>> You went too far here, I'm afraid: In reply to v1 I did say "The latter
>> two, being identical ..." - XEN_PAGE_SHIFT ought to continue to be a
>> per-arch constant, even if right now it is the same for Arm and x86.
>>
> 
> Alright, now I got it.
> 
>> Thinking of which - with exposing this as a stable ABI (not just the
>> abstraction, but the specific values and the fact that they're
>> invariable become part of the stable ABI this way), what is the plan
>> for supporting 64k(?) page size on Arm in the future? At that point
>> you _cannot_ simply remove or replace the #define you add here. As
>> the immediate need is by the tool stack, enclosing in

I would like to get support for 64KB and 16KB pages in Xen (we already 
support in guests). But there is not much we can do with the current ABI 
as guests assume this is 4KB (that would break if Xen was using 64KB).

>>
>> #if defined(__XEN__) || defined(__XEN_TOOLS__)
>>
>> might be an option, with the downside of having stable libraries
>> (foreignmemory and gnttab) depend on an unstable hypervisor interface
>> (again). I can't seem to be able to think of anything better ...
I am not sure why you write (again) here. The two libraries always 
assumed the hypervisor was using 4KB page granularity. But until 
recently it was also assuming that the OS page granularity matched.

Our stable ABI has not been designed with multiple page granularity in 
mind. We could introduce a hypercall to query the page size used by the 
ABI. But then, I don't think we have the full picture of how this is 
going to pan out (I haven't try to use another page size on Xen yet).

I think we have three choices here:
   1) Stick with the existing definition in the tools
   2) Move the definition in the public headers and only expose them to 
the tools.
   3) Query the page size via a new hypervisor

As I wrote above, 3) is going to take some time to get it right. So the 
question here is whether 2) is temporarily better than 1).

I think it is because it at least clarify a long standing question on 
what is the granularity of page in the ABI.

Cheers,

-- 
Julien Grall

