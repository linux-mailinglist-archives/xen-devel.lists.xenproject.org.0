Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 744E419A5A4
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 08:50:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJXAr-00070g-Mq; Wed, 01 Apr 2020 06:48:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1qDs=5R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJXAq-00070a-Dl
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 06:48:28 +0000
X-Inumbo-ID: c9220a7b-73e4-11ea-ba7a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c9220a7b-73e4-11ea-ba7a-12813bfff9fa;
 Wed, 01 Apr 2020 06:48:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 65B45AAC7;
 Wed,  1 Apr 2020 06:48:26 +0000 (UTC)
Subject: Re: [PATCH 1/8] xen/guest_access: Harden copy_to_guest_offset to
 prevent const dest operand
To: Julien Grall <julien@xen.org>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-2-julien@xen.org>
 <33a36f0e-5adb-b8af-445c-bab765c84589@suse.com>
 <b5f7037a-5253-b5f2-d5b7-1b90d19021c2@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ce142db-dd2d-4ef2-ee18-9d67d491e400@suse.com>
Date: Wed, 1 Apr 2020 08:48:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b5f7037a-5253-b5f2-d5b7-1b90d19021c2@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
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
 dfaggioli@suse.com, xen-devel@lists.xenproject.org,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 21:13, Julien Grall wrote:
> On 31/03/2020 08:26, Jan Beulich wrote:
>> On 30.03.2020 21:21, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, copy_to_guest_offset() will allow the hypervisor to copy
>>> data to guest handle marked const.
>>>
>>> Thankfully, no users of the helper will do that. Rather than hoping this
>>> can be caught during review, harden copy_to_guest_offset() so the build
>>> will fail if such users are introduced.
>>
>> But there are other implications you break:
>>
>>> --- a/xen/include/asm-arm/guest_access.h
>>> +++ b/xen/include/asm-arm/guest_access.h
>>> @@ -126,7 +126,7 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
>>>     #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
>>>       const typeof(*(ptr)) *_s = (ptr);                   \
>>> -    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
>>> +    typeof(*((hnd).p)) *_d = (hnd).p;                   \
>>>       ((void)((hnd).p == (ptr)));                         \
>>>       __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
>>
>> Until this change, it is "ptr" which all sizes get derived from,
>> i.e. it is the internally used type rather than the handle type
>> which controls this. I'm sure we use this in a few places, to
>> copy to e.g. a handle derived from "void". Compatibility of types
>> (disallowing other than void) is checked by the comparison on the
>> line immediately after the line you change. Yes "_d+(off)" right
>> above here then changes its result. I consider it pretty likely
>> you'd notice this issue once you go beyond just build testing.
> 
> I missed that part. To be honest, it feels wrong to me to have
> "off" != 0 and use a void type for the handle. Would it make
> sense to forbid it?

I don't think so - the idea (aiui) has always been for the Xen
internal object's type to control what gets copied, and hence a
void handle is to be fine for both copy-in and copy-out.

> As a side node, I have updated __copy_to_guest_offset() but
> forgot to update copy_to_guest_offset(). I will look to apply
> the modifications we agree on both side.

Ah, sure.

>> To address this, I guess we need to find an expression along the
>> lines of that comparison, which does not cause any code to be
>> generated, but which verifies the properties we care about. The
>> line you change should be left alone, from all I can tell right
>> now.
> 
> I am not aware of any way before C11 to check if a variable is
> const or not. If we wanted to keep allow void type the handle
> then a possible approach would be:
> 
> #define copy_to_guest_offset(hnd, off, ptr, nr) ({              \
>     const typeof(*(ptr)) *_s = (ptr);                           \
>     typeof(*((hnd).p)) *_d = (hnd).p;                           \
>     size_t mul = (sizeof(*(hnd).p) > 1) ? 1 : sizeof (*_s);     \
>     ((void)((hnd).p == (ptr)));                                 \
>     raw_copy_to_guest(_d + (off) * mul, _s, sizeof(*_s)*(nr));  \
> })
> 
> I don't particularly like it but I could not come up with better so far.

Not very nice indeed, and the conditional expression - at the
first glance being the wrong way round - seems outright
confusing to me. I'll try to find time to experiment some with
this as well, since unless we can find a reasonably neat
solution here, I'm inclined to suggest to leave this as it is
now.

Jan

