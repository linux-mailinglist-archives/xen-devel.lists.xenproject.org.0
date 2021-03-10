Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF3F3342F3
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 17:21:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96221.181881 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1aU-0006RD-BS; Wed, 10 Mar 2021 16:21:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96221.181881; Wed, 10 Mar 2021 16:21:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK1aU-0006Qo-83; Wed, 10 Mar 2021 16:21:30 +0000
Received: by outflank-mailman (input) for mailman id 96221;
 Wed, 10 Mar 2021 16:21:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=W5NQ=II=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lK1aT-0006Qj-Eo
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 16:21:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e4ea6028-5db0-48ac-b5aa-a7d3abd94f40;
 Wed, 10 Mar 2021 16:21:28 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC800ABD7;
 Wed, 10 Mar 2021 16:21:27 +0000 (UTC)
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
X-Inumbo-ID: e4ea6028-5db0-48ac-b5aa-a7d3abd94f40
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615393287; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0rDd9NjiUrVYIj06ZFqWVOsDKfRqoZUFPT0/awPKexs=;
	b=jCikWkjOwTHZQsHh0IgxMry+2R2u0Kqu7GqfUzQ9lRREukxSd2XrvIJXBCr3NhtaKJ4mbg
	Eb9OEYsAJU5OiJLe4QlKVH/M9/m3TNO7OLT0JDyuADvYr9acLB9wf8P6c8CluniKF+vNdR
	ieTDwOw8HwWW9Ky/yKKtbYDRyoh+1UA=
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
Date: Wed, 10 Mar 2021 17:21:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10.03.2021 15:58, Julien Grall wrote:
> On 10/03/2021 10:13, Jan Beulich wrote:
>> Sadly I was wrong to suggest dropping vaddrs' initializer during review
>> of v2 of the patch introducing this code. gcc 4.3 can't cope.
> 
> What's the error?

The one quoted in the title.

> Are you sure this is not going to hiding a potential 
> miscompilation of the function?

Miscompilation? It may hide us screwing up, but addressing such a
compiler warning by adding an initializer has been quite common
in the past.

>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
>>       struct grant_table *gt = d->grant_table;
>>       unsigned int i, final_frame;
>>       mfn_t tmp;
>> -    void **vaddrs;
>> +    void **vaddrs = NULL;
> I am a bit nervous to inialize vaddrs to NULL for a few reasons:
>    1) It is not 100% obvious (e.g. it takes more than a second) that 
> vaddrs will always be initialized.

But convincing ourselves was necessary even more so prior to this
change. We must not ever rely on the compiler to tell us about
issues in our code. We can only leverage that in some cases it
does. From this it (I think obviously) follows that without the
initializer we're at bigger risk than with it.

>    2) A compiler will not be able to help us if we are adding code 
> without initialized vaddrs.
> 
> It also feels wrong to me to try to write Xen in a way that will make a 
> 10 years compiler happy...

As said above - we've worked around limitations quite a few times
in the past. This is just one more instance.

> If we still want to support them, then maybe a better approach would be 
> to turn off to turn off -Werror for some version of GCC. So we can 
> continue to benefit from the newer compiler diagnostics.

Avoiding use of -Werror is not an option imo: Once you start seeing
warnings, you have only two options imo: Either one decides to ignore
them all (and then one will also ignore new ones introduce by changes
yet to be submitted), or one would have to memorize, for every build
one does, which warnings one ought to ignore. The latter doesn't
scale, while the former is a code quality problem.

Suppressing a particular class of warning might be an option, but
again risks somebody submitting code which elsewhere would trigger
warnings.

Jan

