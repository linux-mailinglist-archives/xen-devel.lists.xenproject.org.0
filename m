Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E091B55EA
	for <lists+xen-devel@lfdr.de>; Thu, 23 Apr 2020 09:39:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jRWRB-0001P1-3F; Thu, 23 Apr 2020 07:38:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0dw1=6H=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jRWRA-0001Ow-Hr
 for xen-devel@lists.xenproject.org; Thu, 23 Apr 2020 07:38:20 +0000
X-Inumbo-ID: 66a8667a-8535-11ea-9332-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66a8667a-8535-11ea-9332-12813bfff9fa;
 Thu, 23 Apr 2020 07:38:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id AF758AEF9;
 Thu, 23 Apr 2020 07:38:17 +0000 (UTC)
Subject: Re: [[PATCH v3]] xen/guest_access: Harden *copy_to_guest_offset() to
 prevent const dest operand
To: Julien Grall <julien@xen.org>
References: <20200416112423.25755-1-julien@xen.org>
 <495b74dc-3ee3-ff23-99ce-2fa4a17d57a4@suse.com>
 <6ce4afd3-7f03-1083-1057-ed90876f90e0@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <71bd414c-6d21-97e5-0937-adedf78484b7@suse.com>
Date: Thu, 23 Apr 2020 09:38:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <6ce4afd3-7f03-1083-1057-ed90876f90e0@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 17.04.2020 19:16, Julien Grall wrote:
> On 16/04/2020 13:19, Jan Beulich wrote:
>> On 16.04.2020 13:24, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, *copy_to_guest_offset() will allow the hypervisor to copy
>>> data to guest handle marked const.
>>>
>>> Thankfully, no users of the helper will do that. Rather than hoping this
>>> can be caught during review, harden copy_to_guest_offset() so the build
>>> will fail if such users are introduced.
>>>
>>> There is no easy way to check whether a const is NULL in C99. The
>>> approach used is to introduce an unused variable that is non-const and
>>> assign the handle. If the handle were const, this would fail at build
>>> because without an explicit cast, it is not possible to assign a const
>>> variable to a non-const variable.
>>>
>>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with one further remark:
>>
>>> --- a/xen/include/asm-x86/guest_access.h
>>> +++ b/xen/include/asm-x86/guest_access.h
>>> @@ -87,6 +87,8 @@
>>>   #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
>>>       const typeof(*(ptr)) *_s = (ptr);                   \
>>>       char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
>>> +    /* Check if the handle is not const */              \
>>> +    void *__maybe_unused _t = (hnd).p;                  \
>>
>> Not being a native speaker, to me "if" doesn't look appropriate
>> here. I'd use "that" instead, but you may want to confirm this.
>> Overall then maybe "Check that the handle is not for a const type"?
> 
> I am happy with the new suggestion. I will fixup while comitting it.
> 
> 
> I would also need a review from Stefano here also.

Would you, even under the new rules? In which case it might be
a good idea to Cc him (now done here), also to given him a more
direct means to object. Same would go for the x86 reviewers ...
All of them were Cc-ed on v2. In light of this I can't sensibly
ask that you please commit this patch soon, so that I can put
mine on top, I guess (this was the original intention when
starting to write this reply).

Jan

