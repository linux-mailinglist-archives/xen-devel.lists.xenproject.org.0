Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8259119E533
	for <lists+xen-devel@lfdr.de>; Sat,  4 Apr 2020 15:29:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jKirY-0007by-5o; Sat, 04 Apr 2020 13:29:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7qE9=5U=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jKirW-0007bG-Uq
 for xen-devel@lists.xenproject.org; Sat, 04 Apr 2020 13:29:26 +0000
X-Inumbo-ID: 4dc76f14-7678-11ea-be2c-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4dc76f14-7678-11ea-be2c-12813bfff9fa;
 Sat, 04 Apr 2020 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5bL3GFubuOGwDp8XOe3oyzA/8NUs5aknVt/f2hv3X0A=; b=MjQlHGfkcGA04/TOOKmpxakj4A
 gEyM0hXrRgXAEt92a9D+tBfBYVliUmGXbAXB1s3YzMK7eZ9pDJVuOuFgzKn26urXDbfgO2gGv/u9j
 8DQBhI2wW9DmtHp7XlEzoCsApVYYHIcVC4gSxYA11oAB4iQn4o3Z2qwvNfWpBSJVh7/k=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKirV-0000D7-0S; Sat, 04 Apr 2020 13:29:25 +0000
Received: from 54-240-197-236.amazon.com ([54.240.197.236]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jKirU-0000Qb-Ny; Sat, 04 Apr 2020 13:29:24 +0000
Subject: Re: [PATCH] guestcopy: evaluate {,__}copy{,_field}_to_guest*()
 arguments just once
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9918b339-e914-7228-5f8e-86c82090b5bd@suse.com>
 <b07fcc5a-60c1-a831-b4b1-a6de3f82b8b4@xen.org>
 <0c78d386-cb20-51cf-ec2f-4d9345ecf013@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e0af3b99-d1c3-738f-b455-cb5362b4c64e@xen.org>
Date: Sat, 4 Apr 2020 14:29:22 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <0c78d386-cb20-51cf-ec2f-4d9345ecf013@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 02/04/2020 07:20, Jan Beulich wrote:
> On 01.04.2020 23:28, Julien Grall wrote:
>> On 01/04/2020 15:29, Jan Beulich wrote:
>>> There's nothing wrong with having e.g.
>>>
>>>       copy_to_guest(uarg, ptr++, 1);
>>>
>>> yet until now this would increment "ptr" twice.
>>
>> Is there such use in Xen today? I guess not as we would have noticed any issue.
> 
> I'm not aware of any.

I have looked at the existing callers in staging and can't find such 
pattern as well.

> 
>>> --- a/xen/include/asm-arm/guest_access.h
>>> +++ b/xen/include/asm-arm/guest_access.h
>>> @@ -79,7 +79,7 @@ int access_guest_memory_by_ipa(struct do
>>>        const typeof(*(ptr)) *_s = (ptr);                   \
>>>        char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
>>>        void *__maybe_unused _t = (hnd).p;                  \
>>> -    ((void)((hnd).p == (ptr)));                         \
>>> +    (void)((hnd).p == _s);                              \
>>
>> May I ask why this is a problem with 'ptr' but not 'hnd'?
>> Wouldn't it theorically possible to have an array of handle?
> 
> Theoretically yes, but I view issues with the handle as far less
> likely than issues with any of the other parameters (in particular
> I don't see what an array of handles could be used for). So yes,
> if we want to be eager, we could deal with that one as well.

That's a fair point. I am happy either way.

I have also resent my patch (see [1]). This patch still applies on top 
of it and I have compile tested for arm32, arm64 and x86.

Reviewed-by: Julien Grall <jgrall@amazon.com>

Cheers,


[1] https://lore.kernel.org/xen-devel/20200404130613.26428-1-julien@xen.org/

> 
> Jan
> 

-- 
Julien Grall

