Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B61862DDF8A
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 09:31:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56386.98716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBAK-00010A-IR; Fri, 18 Dec 2020 08:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56386.98716; Fri, 18 Dec 2020 08:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqBAK-0000zl-FM; Fri, 18 Dec 2020 08:31:08 +0000
Received: by outflank-mailman (input) for mailman id 56386;
 Fri, 18 Dec 2020 08:31:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ets7=FW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kqBAJ-0000zg-IE
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 08:31:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b5e67ab-8141-4541-b11a-b785ec3bc5c2;
 Fri, 18 Dec 2020 08:31:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86ADBACC4;
 Fri, 18 Dec 2020 08:31:05 +0000 (UTC)
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
X-Inumbo-ID: 2b5e67ab-8141-4541-b11a-b785ec3bc5c2
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608280265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PevfJibHyhM1P5bTVcOjupsdgI/avU0PT8NKlUKEqtk=;
	b=NlUt7uXWU8HzOg6zFuNl68+SkTymNK2ynG3lgaEOEYS03BA7tjBU2fIBOCNoVpyKxsK/Fa
	M8Goyt01J3xAk3yBVWUg/Iq5HdtmPVNBkstWc/0fR4BG0uxwhjNpJBPtX4r6xOq8mxE4eT
	2+tjEyBWZ4KpF3IRZ3edrx8B6QJH6nM=
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Julien Grall <julien@xen.org>, bertrand.marquis@arm.com,
 Rahul.Singh@arm.com, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20201215112610.1986-1-julien@xen.org>
 <c5ac88e6-4e06-553d-2996-d2b027acd782@suse.com>
 <04455739-f07f-3da8-f764-33600a9cab6f@xen.org>
 <3f165cf8-88a4-590a-6e86-2435e8a7e554@suse.com>
 <alpine.DEB.2.21.2012171553340.4040@sstabellini-ThinkPad-T480s>
 <81ea6132-b8b6-90b9-2c5c-9ca89ee6c0d0@suse.com>
 <142e7b4d-649d-07d0-26cf-185a434a365c@suse.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <19553beb-db02-c23c-e176-c5c52a5be7ed@suse.com>
Date: Fri, 18 Dec 2020 09:31:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <142e7b4d-649d-07d0-26cf-185a434a365c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 18.12.2020 09:19, Jürgen Groß wrote:
> On 18.12.20 08:54, Jan Beulich wrote:
>> On 18.12.2020 00:54, Stefano Stabellini wrote:
>>> On Tue, 15 Dec 2020, Jan Beulich wrote:
>>>> On 15.12.2020 14:19, Julien Grall wrote:
>>>>> On 15/12/2020 11:46, Jan Beulich wrote:
>>>>>> On 15.12.2020 12:26, Julien Grall wrote:
>>>>>>> --- a/xen/include/xen/lib.h
>>>>>>> +++ b/xen/include/xen/lib.h
>>>>>>> @@ -23,7 +23,13 @@
>>>>>>>    #include <asm/bug.h>
>>>>>>>    
>>>>>>>    #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
>>>>>>> -#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
>>>>>>> +#define WARN_ON(p)  ({                  \
>>>>>>> +    bool __ret_warn_on = (p);           \
>>>>>>
>>>>>> Please can you avoid leading underscores here?
>>>>>
>>>>> I can.
>>>>>
>>>>>>
>>>>>>> +                                        \
>>>>>>> +    if ( unlikely(__ret_warn_on) )      \
>>>>>>> +        WARN();                         \
>>>>>>> +    unlikely(__ret_warn_on);            \
>>>>>>> +})
>>>>>>
>>>>>> Is this latter unlikely() having any effect? So far I thought it
>>>>>> would need to be immediately inside a control construct or be an
>>>>>> operand to && or ||.
>>>>>
>>>>> The unlikely() is directly taken from the Linux implementation.
>>>>>
>>>>> My guess is the compiler is still able to use the information for the
>>>>> branch prediction in the case of:
>>>>>
>>>>> if ( WARN_ON(...) )
>>>>
>>>> Maybe. Or maybe not. I don't suppose the Linux commit introducing
>>>> it clarifies this?
>>>
>>> I did a bit of digging but it looks like the unlikely has been there
>>> forever. I'd just keep it as is.
>>
>> I'm afraid I don't view this as a reason to inherit code unchanged.
>> If it was introduced with a clear indication that compilers can
>> recognize it despite the somewhat unusual placement, then fine. But
>> likely() / unlikely() quite often get put in more or less blindly -
>> see the not uncommon unlikely(a && b) style of uses, which don't
>> typically have the intended effect and would instead need to be
>> unlikely(a) && unlikely(b) [assuming each condition alone is indeed
>> deemed unlikely], unless compilers have learned to guess/infer
>> what's meant between when I last looked at this and now.
> 
> I have made a little experiment and found that the unlikely() at the
> end of a macro is having effect.

Okay, thanks - then my concern vanishes.

Jan

