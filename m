Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C67DC599716
	for <lists+xen-devel@lfdr.de>; Fri, 19 Aug 2022 10:25:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.390126.627369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxJR-0001oi-5m; Fri, 19 Aug 2022 08:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 390126.627369; Fri, 19 Aug 2022 08:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOxJR-0001mp-2i; Fri, 19 Aug 2022 08:25:05 +0000
Received: by outflank-mailman (input) for mailman id 390126;
 Fri, 19 Aug 2022 08:25:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oOxJP-0001mj-F2
 for xen-devel@lists.xenproject.org; Fri, 19 Aug 2022 08:25:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOxJL-0003wN-Tt; Fri, 19 Aug 2022 08:24:59 +0000
Received: from [54.239.6.188] (helo=[192.168.16.114])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oOxJL-00060z-NZ; Fri, 19 Aug 2022 08:24:59 +0000
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
	bh=o56dPTr/D22M97W7BQViEwyWF5tFKkxkadlFNgEq9+g=; b=5hLW4FeHoB2HH4civRtmmA7u7Z
	EAtbOYpCj1CohIqv8in/b3aPtou2QH5eKusrtRKqFSrpI4FeBR4BtWMskC2rP/Ert8lTkLSKsdA5A
	K6/NyqhLLXRZLBhK/0PmOjCTDVOxEsidT1oHNZLaKgsk68IdWPsyh02WOkzmoY+x3GJg=;
Message-ID: <fa02a09b-ee7e-b1aa-d183-377aa18a591f@xen.org>
Date: Fri, 19 Aug 2022 09:24:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH 2/2] Arm32: tidy the memset() macro
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8e5df72f-2ed8-3bec-18ff-3da228ab9ee0@suse.com>
 <80abb94d-67d1-ef71-afbc-4d0bd9d8a557@suse.com>
 <6da837d7-4784-f517-5c24-2bbe6a2af2be@xen.org>
 <1e5496f9-47f1-3cf4-794a-9a840ee7c59f@suse.com>
 <acdebd64-0f0e-b391-271b-0725e4a56c43@xen.org>
 <f0e42732-87fd-396c-5d79-2087666b0eda@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f0e42732-87fd-396c-5d79-2087666b0eda@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/08/2022 09:11, Jan Beulich wrote:
> On 19.08.2022 10:06, Julien Grall wrote:
>> On 19/08/2022 09:02, Jan Beulich wrote:
>>> On 19.08.2022 09:58, Julien Grall wrote:
>>>> On 19/08/2022 08:50, Jan Beulich wrote:
>>>>> - add parentheses where they were missing (MISRA)
>>>>> - make sure to evaluate also v exactly once (MISRA)
>>>>> - remove excess parentheses
>>>>> - rename local variables to not have leading underscores
>>>>> - apply Xen coding style
>>>>
>>>> This code has been taken from Linux. From you write above, I don't see
>>>> any strong reason for us to modify it (even if it is small).
>>>
>>> At least the MISRA issues want addressing, I suppose. Plus I wasn't
>>> able to spot the macro in Linux anymore (nor __memzero()), so to me
>>> there seemed to be little point to consider keeping anything "in sync"
>>> here.
>> I read the last part as we want a re-sync of the code (we haven't done
>> one in the past couple of years).
> 
> I'm afraid I'm now really confused: Which last part? I don't see how
> any of what I have said could be read that way. Quite the opposite:
> By stating that Linux doesn't have this macro anymore, isn't it quite
> clear that there's nothing to re-sync against?
Your view here if we will never re-sync the code. This is incorrect, we 
still want to keep it close so we can benefit from improvement in the 
Linux code. So if you start tweaking the code just for coding style 
purpose, it will just make it more difficult for us (I appreciate this 
is limited here).

In this case, Linux has removed __memzero() is patch ff5fdafc9e97 "ARM: 
8745/1: get rid of __memzero()" because the performance difference with 
memset() was limited. For Xen, I think we should also remove the function.

With that, this patch becomes pointless.

Cheers,

-- 
Julien Grall

