Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C332DDF46
	for <lists+xen-devel@lfdr.de>; Fri, 18 Dec 2020 08:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.56359.98661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqAap-0004ZQ-LF; Fri, 18 Dec 2020 07:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 56359.98661; Fri, 18 Dec 2020 07:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kqAap-0004Z3-I7; Fri, 18 Dec 2020 07:54:27 +0000
Received: by outflank-mailman (input) for mailman id 56359;
 Fri, 18 Dec 2020 07:54:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ets7=FW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kqAao-0004Yy-8I
 for xen-devel@lists.xenproject.org; Fri, 18 Dec 2020 07:54:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fd94bf8d-de5a-4167-8949-bc3abb46295f;
 Fri, 18 Dec 2020 07:54:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7EFD3ABC6;
 Fri, 18 Dec 2020 07:54:24 +0000 (UTC)
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
X-Inumbo-ID: fd94bf8d-de5a-4167-8949-bc3abb46295f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1608278064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j2oPksEdP+W0vsc0Lz5K3lyisXlh30EIFwehvRxFRRA=;
	b=drcMJH3ryPImsGSO4xhQ06CxBLhXqLXckaSalstab49D4TqdXUobtL7rpjH7aJyXxF2T8o
	3ebi4vffH/9dgrCvioCWL+qhIP0uOMUrVrwcW0UX6jp6TkUqg7/y3OQFAf6RvbKbxSpg+O
	OQbhJxgSlM4xTbDDFWdOddcqJi7Zdbc=
Subject: Re: [PATCH] xen: Rework WARN_ON() to return whether a warning was
 triggered
To: Stefano Stabellini <sstabellini@kernel.org>
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <81ea6132-b8b6-90b9-2c5c-9ca89ee6c0d0@suse.com>
Date: Fri, 18 Dec 2020 08:54:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2012171553340.4040@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.12.2020 00:54, Stefano Stabellini wrote:
> On Tue, 15 Dec 2020, Jan Beulich wrote:
>> On 15.12.2020 14:19, Julien Grall wrote:
>>> On 15/12/2020 11:46, Jan Beulich wrote:
>>>> On 15.12.2020 12:26, Julien Grall wrote:
>>>>> --- a/xen/include/xen/lib.h
>>>>> +++ b/xen/include/xen/lib.h
>>>>> @@ -23,7 +23,13 @@
>>>>>   #include <asm/bug.h>
>>>>>   
>>>>>   #define BUG_ON(p)  do { if (unlikely(p)) BUG();  } while (0)
>>>>> -#define WARN_ON(p) do { if (unlikely(p)) WARN(); } while (0)
>>>>> +#define WARN_ON(p)  ({                  \
>>>>> +    bool __ret_warn_on = (p);           \
>>>>
>>>> Please can you avoid leading underscores here?
>>>
>>> I can.
>>>
>>>>
>>>>> +                                        \
>>>>> +    if ( unlikely(__ret_warn_on) )      \
>>>>> +        WARN();                         \
>>>>> +    unlikely(__ret_warn_on);            \
>>>>> +})
>>>>
>>>> Is this latter unlikely() having any effect? So far I thought it
>>>> would need to be immediately inside a control construct or be an
>>>> operand to && or ||.
>>>
>>> The unlikely() is directly taken from the Linux implementation.
>>>
>>> My guess is the compiler is still able to use the information for the 
>>> branch prediction in the case of:
>>>
>>> if ( WARN_ON(...) )
>>
>> Maybe. Or maybe not. I don't suppose the Linux commit introducing
>> it clarifies this?
> 
> I did a bit of digging but it looks like the unlikely has been there
> forever. I'd just keep it as is.

I'm afraid I don't view this as a reason to inherit code unchanged.
If it was introduced with a clear indication that compilers can
recognize it despite the somewhat unusual placement, then fine. But
likely() / unlikely() quite often get put in more or less blindly -
see the not uncommon unlikely(a && b) style of uses, which don't
typically have the intended effect and would instead need to be
unlikely(a) && unlikely(b) [assuming each condition alone is indeed
deemed unlikely], unless compilers have learned to guess/infer
what's meant between when I last looked at this and now.

Jan

