Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7773019BBA2
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 08:23:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJtCw-00065Q-CM; Thu, 02 Apr 2020 06:20:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJtCu-0005mb-9Q
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 06:20:04 +0000
X-Inumbo-ID: fc9699b4-74a9-11ea-b4f4-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fc9699b4-74a9-11ea-b4f4-bc764e2007e4;
 Thu, 02 Apr 2020 06:20:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EB418B167;
 Thu,  2 Apr 2020 06:20:01 +0000 (UTC)
Subject: Re: [PATCH] guestcopy: evaluate {,__}copy{,_field}_to_guest*()
 arguments just once
To: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <9918b339-e914-7228-5f8e-86c82090b5bd@suse.com>
 <b07fcc5a-60c1-a831-b4b1-a6de3f82b8b4@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0c78d386-cb20-51cf-ec2f-4d9345ecf013@suse.com>
Date: Thu, 2 Apr 2020 08:20:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <b07fcc5a-60c1-a831-b4b1-a6de3f82b8b4@xen.org>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 01.04.2020 23:28, Julien Grall wrote:
> On 01/04/2020 15:29, Jan Beulich wrote:
>> There's nothing wrong with having e.g.
>>
>>      copy_to_guest(uarg, ptr++, 1);
>>
>> yet until now this would increment "ptr" twice.
> 
> Is there such use in Xen today? I guess not as we would have noticed any issue.

I'm not aware of any.

>> --- a/xen/include/asm-arm/guest_access.h
>> +++ b/xen/include/asm-arm/guest_access.h
>> @@ -79,7 +79,7 @@ int access_guest_memory_by_ipa(struct do
>>       const typeof(*(ptr)) *_s = (ptr);                   \
>>       char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
>>       void *__maybe_unused _t = (hnd).p;                  \
>> -    ((void)((hnd).p == (ptr)));                         \
>> +    (void)((hnd).p == _s);                              \
> 
> May I ask why this is a problem with 'ptr' but not 'hnd'?
> Wouldn't it theorically possible to have an array of handle?

Theoretically yes, but I view issues with the handle as far less
likely than issues with any of the other parameters (in particular
I don't see what an array of handles could be used for). So yes,
if we want to be eager, we could deal with that one as well.

Jan

