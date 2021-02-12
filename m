Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B73319F95
	for <lists+xen-devel@lfdr.de>; Fri, 12 Feb 2021 14:16:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.84263.157962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAYIU-0003Ws-Lm; Fri, 12 Feb 2021 13:15:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 84263.157962; Fri, 12 Feb 2021 13:15:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lAYIU-0003WT-IC; Fri, 12 Feb 2021 13:15:46 +0000
Received: by outflank-mailman (input) for mailman id 84263;
 Fri, 12 Feb 2021 13:15:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aDps=HO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lAYIT-0003WN-Iz
 for xen-devel@lists.xenproject.org; Fri, 12 Feb 2021 13:15:45 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 42ccefeb-8b8b-4181-9233-f87b4f09eaad;
 Fri, 12 Feb 2021 13:15:44 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C3362AC90;
 Fri, 12 Feb 2021 13:15:43 +0000 (UTC)
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
X-Inumbo-ID: 42ccefeb-8b8b-4181-9233-f87b4f09eaad
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1613135743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MedWXEGnoEv2qf7wr3/ey/o1lNQKGa50cAPo9p6v26k=;
	b=VhzsJugKsQ0gaYJ3hqKqTNlEruYn3LAWHXlBKWrapSvYeTF8VYFGdBcmJ/hLhHBJD5utsz
	LRi3caHomWKNd0X+/7vU4rIsjAJCn/wAX1VsQUPP2KZDx1EzpMbhuDKxpNJg52Xj4DAdC0
	pd6tSyIwTDd1gxhMnRqzWFrhsb5ALRM=
Subject: Re: [PATCH 04/17] x86/PV: harden guest memory accesses against
 speculative abuse
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Tim Deegan <tim@xen.org>, George Dunlap <george.dunlap@citrix.com>
References: <4f1975a9-bdd9-f556-9db5-eb6c428f258f@suse.com>
 <5da0c123-3b90-97e8-e1e5-10286be38ce7@suse.com>
 <YCZbToiL3+Ji3y48@Air-de-Roger>
 <ece2bf60-4154-756d-df5a-1f55170f9451@suse.com>
 <YCZ8YB+Y/HyHNOPm@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9f680f3e-78a5-e2d2-b1f1-8426ebc9613e@suse.com>
Date: Fri, 12 Feb 2021 14:15:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YCZ8YB+Y/HyHNOPm@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.02.2021 14:02, Roger Pau Monné wrote:
> On Fri, Feb 12, 2021 at 01:48:43PM +0100, Jan Beulich wrote:
>> On 12.02.2021 11:41, Roger Pau Monné wrote:
>>> On Thu, Jan 14, 2021 at 04:04:57PM +0100, Jan Beulich wrote:
>>>> --- a/xen/include/asm-x86/asm-defns.h
>>>> +++ b/xen/include/asm-x86/asm-defns.h
>>>> @@ -44,3 +44,16 @@
>>>>  .macro INDIRECT_JMP arg:req
>>>>      INDIRECT_BRANCH jmp \arg
>>>>  .endm
>>>> +
>>>> +.macro guest_access_mask_ptr ptr:req, scratch1:req, scratch2:req
>>>> +#if defined(CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS)
>>>> +    mov $(HYPERVISOR_VIRT_END - 1), \scratch1
>>>> +    mov $~0, \scratch2
>>>> +    cmp \ptr, \scratch1
>>>> +    rcr $1, \scratch2
>>>> +    and \scratch2, \ptr
>>>
>>> If my understanding is correct, that's equivalent to:
>>>
>>> ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
>>>
>>> It might be helpful to add this as a comment, to clarify the indented
>>> functionality of the assembly bit.
>>>
>>> I wonder if the C code above can generate any jumps? As you pointed
>>> out, we already use something similar in array_index_mask_nospec and
>>> that's fine to do in C.
>>
>> Note how array_index_mask_nospec() gets away without any use of
>> relational operators. They're what poses the risk of getting
>> translated to branches. (Quite likely the compiler wouldn't use
>> any in the case here, as the code can easily get away without,
>> but we don't want to chance it. Afaict it would instead use a
>> 3rd scratch register, so register pressure might still lead to
>> using a branch instead in some exceptional case.)
> 
> I see, it's not easy to build such construct without using any
> relational operator. Would you mind adding the C equivalent next to
> assembly chunk?

Sure:

    /*
     * Here we want
     *
     * ptr &= ~0ull >> (ptr < HYPERVISOR_VIRT_END);
     *
     * but guaranteed without any conditional branches (hence in assembly).
     */

> I don't think I have further comments:
> 
> Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks much!

Jan

