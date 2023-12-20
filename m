Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 140D381A8A9
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 22:48:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658330.1027451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4Q8-0006na-L8; Wed, 20 Dec 2023 21:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658330.1027451; Wed, 20 Dec 2023 21:48:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rG4Q8-0006kf-IA; Wed, 20 Dec 2023 21:48:04 +0000
Received: by outflank-mailman (input) for mailman id 658330;
 Wed, 20 Dec 2023 21:48:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rG4Q6-0006kG-Oa
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 21:48:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rG4Q5-0007PY-In; Wed, 20 Dec 2023 21:48:01 +0000
Received: from 82-132-213-104.dab.02.net ([82.132.213.104] helo=[172.20.10.6])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rG4Q4-0003Gb-Ua; Wed, 20 Dec 2023 21:48:01 +0000
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
	bh=bXpSqgBRE9o3Kp/I841pnPLSZj9VGWv9uapo6baNv8c=; b=4RjyOlD/7xY6VtLAhkDgV1S5cy
	oPsI8PLYxPUe/xffJblRIJ94cxXoJ8vmKWGSAR+J3q4rOdWtAu4lH2U1qy0Bdlew+EU3gpbOlQDRF
	qbITTPQX8PSuRlrm0GMnypPKFydTau89EFLgzkfRBNViGhP5h6HrsM2vDRir7jVZF38c=;
Message-ID: <2c070584-c44c-4371-9344-9e0497657f1c@xen.org>
Date: Wed, 20 Dec 2023 21:47:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/bug: Complete outstanding TODO
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>,
 Wei Liu <wl@xen.org>, Federico Serafini <federico.serafini@bugseng.com>
References: <20231215181433.1588532-1-andrew.cooper3@citrix.com>
 <20231215181433.1588532-3-andrew.cooper3@citrix.com>
 <139031ab-522c-41d7-b9d7-e9b7d3656555@xen.org>
 <alpine.DEB.2.22.394.2312201053180.685950@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312201053180.685950@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 20/12/2023 18:58, Stefano Stabellini wrote:
> On Fri, 15 Dec 2023, Julien Grall wrote:
>> Hi Andrew,
>>
>> On 15/12/2023 18:14, Andrew Cooper wrote:
>>> Since this TODO was written, BUILD_BUG_ON() has been moved out of xen/lib.h
>>> into xen/macros.h, which has done all the hard work.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: George Dunlap <George.Dunlap@citrix.com>
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Stefano Stabellini <sstabellini@kernel.org>
>>> CC: Wei Liu <wl@xen.org>
>>> CC: Julien Grall <julien@xen.org>
>>> CC: Federico Serafini <federico.serafini@bugseng.com>
>>> ---
>>>    xen/include/xen/bug.h | 16 +++++++---------
>>>    1 file changed, 7 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/xen/include/xen/bug.h b/xen/include/xen/bug.h
>>> index cb5138410ea7..8cca4486a477 100644
>>> --- a/xen/include/xen/bug.h
>>> +++ b/xen/include/xen/bug.h
>>> @@ -20,7 +20,8 @@
>>>    #define BUG_DEBUGGER_TRAP_FATAL(regs) 0
>>>    #endif
>>>    -#include <xen/lib.h>
>>> +#include <xen/macros.h>
>>> +#include <xen/types.h>
>>>      #ifndef BUG_FRAME_STRUCT
>>>    @@ -104,14 +105,11 @@ typedef void bug_fn_t(const struct cpu_user_regs
>>> *regs);
>>>      #ifndef run_in_exception_handler
>>>    -/*
>>> - * TODO: untangle header dependences, break BUILD_BUG_ON() out of
>>> xen/lib.h,
>>> - * and use a real static inline here to get proper type checking of fn().
>>> - */
>>> -#define run_in_exception_handler(fn) do {                   \
>>> -    (void)((fn) == (void (*)(struct cpu_user_regs *))NULL); \
>>> -    BUG_FRAME(BUGFRAME_run_fn, 0, fn, 0, NULL);             \
>>> -} while ( false )
>>> +static void always_inline run_in_exception_handler(
>>> +    void (*fn)(struct cpu_user_regs *regs))
>>
>> Based on the other threads, shouldn't this be using bug_fn_t?
> 
> Unfortunately it doesn't compile:
> 
> common/bug.c: In function ‘do_bug_frame’:
> common/bug.c:72:38: error: passing argument 1 of ‘run_in_exception_handler’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>     72 |             run_in_exception_handler(fn);
>        |                                      ^~
>        |                                      |
>        |                                      void (*)(struct cpu_user_regs *)
> 
> due to the missing const in common/bug.c:72.
> 
> 
> Not to make things more complicated in this patch, I think we should
> take the patch as is as a simple cleanup (and do further cleanups in the
> future):

I was sort of expecting an error and I should have proposed a solution, 
sorry. I don't think we need to go all the way of adding 'const' to all 
the callbacks.

Instead, we can remove the const in the bug_fn_t (I realize this is a 
pre-existing bug for Arm). I understand this is not the way we want to 
go in the longer term, but this would be accurate with the current code 
base.

Today we have a weird situation:

    -> run_in_exception_handler() is called with non-const regs.
    -> On arm, the callback is cast to a const regs
    -> The callback will use a non-const regs

This most likely violate MISRA (I think rule 11.8) in a very subtle way. 
And none of the analyzer would be able to catch it because how we build 
the BUG frame.

So I think for this patch we should drop the const in bug_fn_t for 
consistency. We can then update all the callback to const in a future work.

I would be ok to send a separate patch to update bug_fn_t if this is 
preferred.

Cheers,

-- 
Julien Grall

