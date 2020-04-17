Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9721AE386
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 19:16:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPUbG-0007CE-FW; Fri, 17 Apr 2020 17:16:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Ygtx=6B=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jPUbF-0007C9-Hk
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 17:16:21 +0000
X-Inumbo-ID: 27b4eeee-80cf-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 27b4eeee-80cf-11ea-b4f4-bc764e2007e4;
 Fri, 17 Apr 2020 17:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pzs92fzZfLsc6pyDF41fqVp18XT3eOxwzr7jwS16cUY=; b=qY1ZxNcUDCpKeQ6fiNnk5dyaWZ
 1upbu6Wo6pqYwjbdqu65peru9mOG5rslJa1/jcKxOhz/daoEt+/lm4HVEYgm491NVzXkgGaW4+B8t
 4AByquvscEGIvoo4E/BoeQy1P6dV5Xpsc6OE8OzgPVdrTs625kRWFFDxQYYCjbVUpizA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPUbD-0003ZD-Q5; Fri, 17 Apr 2020 17:16:19 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jPUbD-0007Gn-JU; Fri, 17 Apr 2020 17:16:19 +0000
Subject: Re: [[PATCH v3]] xen/guest_access: Harden *copy_to_guest_offset() to
 prevent const dest operand
To: Jan Beulich <jbeulich@suse.com>
References: <20200416112423.25755-1-julien@xen.org>
 <495b74dc-3ee3-ff23-99ce-2fa4a17d57a4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6ce4afd3-7f03-1083-1057-ed90876f90e0@xen.org>
Date: Fri, 17 Apr 2020 18:16:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <495b74dc-3ee3-ff23-99ce-2fa4a17d57a4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Jan,

On 16/04/2020 13:19, Jan Beulich wrote:
> On 16.04.2020 13:24, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, *copy_to_guest_offset() will allow the hypervisor to copy
>> data to guest handle marked const.
>>
>> Thankfully, no users of the helper will do that. Rather than hoping this
>> can be caught during review, harden copy_to_guest_offset() so the build
>> will fail if such users are introduced.
>>
>> There is no easy way to check whether a const is NULL in C99. The
>> approach used is to introduce an unused variable that is non-const and
>> assign the handle. If the handle were const, this would fail at build
>> because without an explicit cast, it is not possible to assign a const
>> variable to a non-const variable.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> with one further remark:
> 
>> --- a/xen/include/asm-x86/guest_access.h
>> +++ b/xen/include/asm-x86/guest_access.h
>> @@ -87,6 +87,8 @@
>>   #define copy_to_guest_offset(hnd, off, ptr, nr) ({      \
>>       const typeof(*(ptr)) *_s = (ptr);                   \
>>       char (*_d)[sizeof(*_s)] = (void *)(hnd).p;          \
>> +    /* Check if the handle is not const */              \
>> +    void *__maybe_unused _t = (hnd).p;                  \
> 
> Not being a native speaker, to me "if" doesn't look appropriate
> here. I'd use "that" instead, but you may want to confirm this.
> Overall then maybe "Check that the handle is not for a const type"?

I am happy with the new suggestion. I will fixup while comitting it.


I would also need a review from Stefano here also.

Cheers,

-- 
Julien Grall

