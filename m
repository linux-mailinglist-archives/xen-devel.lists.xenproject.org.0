Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA72B3C6FFE
	for <lists+xen-devel@lfdr.de>; Tue, 13 Jul 2021 13:53:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.155338.286761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Gyg-0008BT-0j; Tue, 13 Jul 2021 11:53:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 155338.286761; Tue, 13 Jul 2021 11:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3Gyf-00088u-To; Tue, 13 Jul 2021 11:53:29 +0000
Received: by outflank-mailman (input) for mailman id 155338;
 Tue, 13 Jul 2021 11:53:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m3Gye-00088m-9r
 for xen-devel@lists.xenproject.org; Tue, 13 Jul 2021 11:53:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3Gyc-0004Nm-Qf; Tue, 13 Jul 2021 11:53:26 +0000
Received: from [54.239.6.178] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m3Gyc-0003LA-KL; Tue, 13 Jul 2021 11:53:26 +0000
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
	bh=qFWzMrAnFLTbg5OYti62kn+1gygCOpsd0IbV7p4VS+8=; b=2Sf3Kw0W5dUWz8tqmqF8fYf1ot
	cJ1z1u5F1mW8lY+QN7ApEHIczNc0t1c77Pp1wCjXcDdpb0G0dQFWPfizjwjZMuOkIeRSaWxrKtr99
	gm3UtaDJ6Bkv8l3bhP/Tyr3sB5m/bCAClmqqFnzzsnXXAh8ar50IFlmFf7crtAOQICeA=;
Subject: Re: [PATCH] stubdom: foreignmemory: Fix build after 0dbb4be739c5
To: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross
 <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210713092019.7379-1-julien@xen.org>
 <0698e4b1-8fb9-919e-e9a2-1b135a808e3e@suse.com>
 <d84bb0ca-ff51-2def-3826-c0a921ec1835@citrix.com>
 <fb6cc1b7-37b4-1819-6f6f-ebf96aefe00e@xen.org>
 <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3505f2da-4c41-f5ca-d775-814d038d5bad@xen.org>
Date: Tue, 13 Jul 2021 12:53:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <756ba923-17a6-0889-cc7e-bcd43a5eb258@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 13/07/2021 12:23, Andrew Cooper wrote:
> On 13/07/2021 12:21, Julien Grall wrote:
>> Hi Andrew,
>>
>> On 13/07/2021 10:35, Andrew Cooper wrote:
>>> On 13/07/2021 10:27, Juergen Gross wrote:
>>>> On 13.07.21 11:20, Julien Grall wrote:
>>>>> From: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> Commit 0dbb4be739c5 add the inclusion of xenctrl.h from private.h and
>>>>> wreck the build in an interesting way:
>>>>>
>>>>> In file included from xen/stubdom/include/xen/domctl.h:39:0,
>>>>>                     from xen/tools/include/xenctrl.h:36,
>>>>>                     from private.h:4,
>>>>>                     from minios.c:29:
>>>>> xen/include/public/memory.h:407:5: error: expected
>>>>> specifier-qualifier-list before ‘XEN_GUEST_HANDLE_64’
>>>>>         XEN_GUEST_HANDLE_64(const_uint8) buffer;
>>>>>         ^~~~~~~~~~~~~~~~~~~
>>>>>
>>>>> This is happening because xenctrl.h defines __XEN_TOOLS__ and
>>>>> therefore
>>>>> the public headers will start to expose the non-stable ABI. However,
>>>>> xen.h has already been included by a mini-OS header before hand. So
>>>>> there is a mismatch in the way the headers are included.
>>>>>
>>>>> For now solve it in a very simple (and gross) way by including
>>>>> xenctrl.h before the mini-os headers.
>>>>>
>>>>> Fixes: 0dbb4be739c5 ("tools/libs/foreignmemory: Fix PAGE_SIZE
>>>>> redefinition error")
>>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>>
>>>>> ---
>>>>>
>>>>> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>
>>>>> I couldn't find a better way with would not result to revert the patch
>>>>> (and break build on some system) or involve a longer rework of the
>>>>> headers.
>>>>
>>>> Just adding a "#define __XEN_TOOLS__" before the #include statements
>>>> doesn't work?
>>>
>>> Not really, no.
>>>
>>> libxenforeignmem has nothing at all to do with any Xen unstable
>>> interfaces.  Including xenctrl.h in the first place was wrong, because
>>> it is an unstable library.  By extension, the use of XC_PAGE_SIZE is
>>> also wrong.
>>
>> Well... Previously we were using PAGE_SIZE which is just plain wrong
>> on Arm.
>>
>> At the moment, we don't have a way to query the page granularity of
>> the hypervisor. But we know it can't change because of the way the
>> current ABI was designed. Hence why using XC_PAGE_SIZE is the best of
>> option we had until we go to ABIv2.
> 
> Still doesn't mean that XC_PAGE_SIZE was ok to use.

Note that I wrote "best of the option". The series has been sitting for 
ages with no-one answering... You could have provided your option back 
then if you thought it wasn't a good use...

> 
> Sounds like the constant needs moving into the Xen public headers, and
> the inclusions of xenctrl.h into stable libraries needs reverting.

This could work. Are you planning to work on it?

Cheers,

-- 
Julien Grall

