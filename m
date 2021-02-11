Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D25318961
	for <lists+xen-devel@lfdr.de>; Thu, 11 Feb 2021 12:28:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83852.157013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAA9B-0001YI-V7; Thu, 11 Feb 2021 11:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83852.157013; Thu, 11 Feb 2021 11:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAA9B-0001Xt-Ry; Thu, 11 Feb 2021 11:28:33 +0000
Received: by outflank-mailman (input) for mailman id 83852;
 Thu, 11 Feb 2021 11:28:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cmTu=HN=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAA9A-0001Xo-3L
 for xen-devel@lists.xenproject.org; Thu, 11 Feb 2021 11:28:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a5299d2b-c6cf-4db1-beac-416304f8de35;
 Thu, 11 Feb 2021 11:28:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6DAB1AC69;
 Thu, 11 Feb 2021 11:28:30 +0000 (UTC)
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
X-Inumbo-ID: a5299d2b-c6cf-4db1-beac-416304f8de35
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613042910; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTOKFnqoHp+bZPBlYfCS6cY1sWDsjMvxEoF7gGl4k00=;
	b=ug53fIXUnUqGhfLvYQxvkM+KIOdaEDmQHHDoaualjhQ8Pzy8dbzq8BArpRhz1n044M+co6
	+gZPtq1ydeknpTMvkxrinMIh4bbbNk/ldBTfOQsHlcdpte8zAxlvjqwBm0pVIfyctnx2Ks
	gFqy6+86kGnzlbD7hefEXQQB89viyOs=
Subject: Re: [PATCH 04/17] x86/PV: harden guest memory accesses against
 speculative abuse
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
 <YCK3sH/4EVLzRfZ3@Air-de-Roger>
 <d3b62090-fdb5-068b-93ab-63f8bebc9d2e@suse.com>
 <YCTmzRcZw9JUJkxw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fd0e2d04-97ab-5096-71c3-a031c0b15589@suse.com>
Date: Thu, 11 Feb 2021 12:28:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCTmzRcZw9JUJkxw@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11.02.2021 09:11, Roger Pau Monné wrote:
> On Wed, Feb 10, 2021 at 05:55:52PM +0100, Jan Beulich wrote:
>> On 09.02.2021 17:26, Roger Pau Monné wrote:
>>> On Thu, Jan 14, 2021 at 04:04:57PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/usercopy.c
>>>> +++ b/xen/arch/x86/usercopy.c
>>>> @@ -10,12 +10,19 @@
>>>>  #include <xen/sched.h>
>>>>  #include <asm/uaccess.h>
>>>>  
>>>> -unsigned __copy_to_user_ll(void __user *to, const void *from, unsigned n)
>>>> +#ifndef GUARD
>>>> +# define GUARD UA_KEEP
>>>> +#endif
>>>> +
>>>> +unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
>>>>  {
>>>>      unsigned dummy;
>>>>  
>>>>      stac();
>>>>      asm volatile (
>>>> +        GUARD(
>>>> +        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
>>>
>>> Don't you need to also take 'n' into account here to assert that the
>>> address doesn't end in hypervisor address space? Or that's fine as
>>> speculation wouldn't go that far?
>>
>> Like elsewhere this leverages that the hypervisor VA range starts
>> immediately after the non-canonical hole. I'm unaware of
>> speculation being able to cross over that hole.
>>
>>> I also wonder why this needs to be done in assembly, could you check
>>> the address(es) using C?
>>
>> For this to be efficient (in avoiding speculation) the insn
>> sequence would better not have any conditional jumps. I don't
>> think the compiler can be told so.
> 
> Why not use evaluate_nospec to check the address like we do in other
> places?

Because LFENCE is far heavier than what we do here, which is
effectively a (distant) relative of array_index_nospec().

Jan

