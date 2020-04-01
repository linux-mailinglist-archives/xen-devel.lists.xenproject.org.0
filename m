Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5F119A7F8
	for <lists+xen-devel@lfdr.de>; Wed,  1 Apr 2020 10:56:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJZ7e-0001NV-LA; Wed, 01 Apr 2020 08:53:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=46oD=5R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJZ7d-0001NQ-7G
 for xen-devel@lists.xenproject.org; Wed, 01 Apr 2020 08:53:17 +0000
X-Inumbo-ID: 3a3738e6-73f6-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3a3738e6-73f6-11ea-b4f4-bc764e2007e4;
 Wed, 01 Apr 2020 08:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IWjjmTTTCsj04XURSsMtNB/kMpu+iwDcayN0PjCPOAw=; b=SfYVwS88Re8U6lg/b9IRwMIR9p
 g9gcP6+d2PHB8xIYo+WcCoLzCu7hCpWOaZIOsWjdxdW62PTls/h6zjwJOvEEQrA0DoRkbYOnsWKQz
 YabYQJiYslgfsBYsrVp9PWTAYv2WnhOwR4X5Sa+NyK2WFYNKSpkkz3RKtbvz+uybib3g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJZ7Z-0006FX-JX; Wed, 01 Apr 2020 08:53:13 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJZ7Z-0007jb-Bj; Wed, 01 Apr 2020 08:53:13 +0000
Subject: Re: [PATCH 1/8] xen/guest_access: Harden copy_to_guest_offset to
 prevent const dest operand
To: Jan Beulich <jbeulich@suse.com>
References: <20200330192157.1335-1-julien@xen.org>
 <20200330192157.1335-2-julien@xen.org>
 <33a36f0e-5adb-b8af-445c-bab765c84589@suse.com>
 <b5f7037a-5253-b5f2-d5b7-1b90d19021c2@xen.org>
 <2ce142db-dd2d-4ef2-ee18-9d67d491e400@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b5bf5a16-042b-3ca4-d9af-cb7c890ff8f1@xen.org>
Date: Wed, 1 Apr 2020 09:53:10 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <2ce142db-dd2d-4ef2-ee18-9d67d491e400@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

Hi Jan,

On 01/04/2020 07:48, Jan Beulich wrote:
> On 31.03.2020 21:13, Julien Grall wrote:
>> On 31/03/2020 08:26, Jan Beulich wrote:
>>> On 30.03.2020 21:21, Julien Grall wrote:
>>>> From: Julien Grall <jgrall@amazon.com>
>>>>
>>>> At the moment, copy_to_guest_offset() will allow the hypervisor to copy
>>>> data to guest handle marked const.
>>>>
>>>> Thankfully, no users of the helper will do that. Rather than hoping this
>>>> can be caught during review, harden copy_to_guest_offset() so the build
>>>> will fail if such users are introduced.
>>>
>>> But there are other implications you break:
>>>
>>>> --- a/xen/include/asm-arm/guest_access.h
>>>> +++ b/xen/include/asm-arm/guest_access.h
>>>> @@ -126,7 +126,7 @@ int access_guest_memory_by_ipa(struct domain *d, paddr_t ipa, void *buf,
>>>>      #define __copy_to_guest_offset(hnd, off, ptr, nr) ({    \
>>>>        const typeof(*(ptr)) *_s = (ptr);                   \
>>>> -    char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
>>>> +    typeof(*((hnd).p)) *_d = (hnd).p;                   \
>>>>        ((void)((hnd).p == (ptr)));                         \
>>>>        __raw_copy_to_guest(_d+(off), _s, sizeof(*_s)*(nr));\
>>>
>>> Until this change, it is "ptr" which all sizes get derived from,
>>> i.e. it is the internally used type rather than the handle type
>>> which controls this. I'm sure we use this in a few places, to
>>> copy to e.g. a handle derived from "void". Compatibility of types
>>> (disallowing other than void) is checked by the comparison on the
>>> line immediately after the line you change. Yes "_d+(off)" right
>>> above here then changes its result. I consider it pretty likely
>>> you'd notice this issue once you go beyond just build testing.
>>
>> I missed that part. To be honest, it feels wrong to me to have
>> "off" != 0 and use a void type for the handle. Would it make
>> sense to forbid it?
> 
> I don't think so - the idea (aiui) has always been for the Xen
> internal object's type to control what gets copied, and hence a
> void handle is to be fine for both copy-in and copy-out.
> 
>> As a side node, I have updated __copy_to_guest_offset() but
>> forgot to update copy_to_guest_offset(). I will look to apply
>> the modifications we agree on both side.
> 
> Ah, sure.
> 
>>> To address this, I guess we need to find an expression along the
>>> lines of that comparison, which does not cause any code to be
>>> generated, but which verifies the properties we care about. The
>>> line you change should be left alone, from all I can tell right
>>> now.
>>
>> I am not aware of any way before C11 to check if a variable is
>> const or not. If we wanted to keep allow void type the handle
>> then a possible approach would be:
>>
>> #define copy_to_guest_offset(hnd, off, ptr, nr) ({              \
>>      const typeof(*(ptr)) *_s = (ptr);                           \
>>      typeof(*((hnd).p)) *_d = (hnd).p;                           \
>>      size_t mul = (sizeof(*(hnd).p) > 1) ? 1 : sizeof (*_s);     \
>>      ((void)((hnd).p == (ptr)));                                 \
>>      raw_copy_to_guest(_d + (off) * mul, _s, sizeof(*_s)*(nr));  \
>> })
>>
>> I don't particularly like it but I could not come up with better so far.
> 
> Not very nice indeed, and the conditional expression - at the
> first glance being the wrong way round - seems outright
> confusing to me.

It is the correct way. If the handle is a void (sizeof(*(hnd).p) == 1), 
then we need to know the size of the Xen buffer so we can compute the 
offset correctly. Otherwise, as we have the correct type, we can apply 
the offset directly and let the compiler do the math for us.

> I'll try to find time to experiment some with
> this as well, since unless we can find a reasonably neat
> solution here, I'm inclined to suggest to leave this as it is
> now.

It is difficult to catch the hypervisor who errorneously write to 
"const" handler. So I would not like a statu-quo.

A slightly uglier version (with more comments) is going to be better 
than what we currently have.

Cheers,

-- 
Julien Grall

