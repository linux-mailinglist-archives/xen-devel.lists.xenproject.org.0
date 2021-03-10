Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EA93345BC
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 18:53:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96253.181948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK30o-0006cr-9y; Wed, 10 Mar 2021 17:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96253.181948; Wed, 10 Mar 2021 17:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK30o-0006cS-6T; Wed, 10 Mar 2021 17:52:46 +0000
Received: by outflank-mailman (input) for mailman id 96253;
 Wed, 10 Mar 2021 17:52:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lK30m-0006cN-QW
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 17:52:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lK30l-0007V9-Ln; Wed, 10 Mar 2021 17:52:43 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lK30l-0002Ey-CY; Wed, 10 Mar 2021 17:52:43 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Y+Jnnzkn2oABqEgNjtJPldwx3KVGV20n3G6bUgGAgJg=; b=pEloDGqOpsKLUeysr04r4Z0L1u
	88eDOgabPg7LxJuwaVwKtiIlU+R7bmd0vXL/2lrKlyWc9cjUcycexjEsInYfLhuFZEbVS5ovguQRV
	6Bt+uXSvJk9M1OOhSkN4tXTNfx23EMyVmM2Nj3hxCCbVYtneBcenBOA4EjKLnzKuAhds=;
Subject: Re: [PATCH][4.15] gnttab: work around "may be used uninitialized"
 warning
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a6b73c54-3010-6716-cac3-8f3b462a4dc7@suse.com>
 <ec2b85b6-072d-481d-3b02-c8dedf043dac@xen.org>
 <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e45ef012-22c6-b480-d987-dd951ae36948@xen.org>
Date: Wed, 10 Mar 2021 17:52:41 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6bd14438-7dec-2176-eab5-5898f190c4d8@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 10/03/2021 16:21, Jan Beulich wrote:
> On 10.03.2021 15:58, Julien Grall wrote:
>> On 10/03/2021 10:13, Jan Beulich wrote:
>>> Sadly I was wrong to suggest dropping vaddrs' initializer during review
>>> of v2 of the patch introducing this code. gcc 4.3 can't cope.
>>
>> What's the error?
> 
> The one quoted in the title.
> 
>> Are you sure this is not going to hiding a potential
>> miscompilation of the function?
> 
> Miscompilation? It may hide us screwing up, but addressing such a
> compiler warning by adding an initializer has been quite common
> in the past.

Well... When a compiler tells me a value may be unitialized, I read it 
as some optimization may decide to use the variable in a way I wasn't 
expected.

>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4026,7 +4026,7 @@ int gnttab_acquire_resource(
>>>        struct grant_table *gt = d->grant_table;
>>>        unsigned int i, final_frame;
>>>        mfn_t tmp;
>>> -    void **vaddrs;
>>> +    void **vaddrs = NULL;
>> I am a bit nervous to inialize vaddrs to NULL for a few reasons:
>>     1) It is not 100% obvious (e.g. it takes more than a second) that
>> vaddrs will always be initialized.
> 
> But convincing ourselves was necessary even more so prior to this
> change. We must not ever rely on the compiler to tell us about
> issues in our code. We can only leverage that in some cases it
> does.

I didn't suggest that we should only rely on the compiler. I pointed out 
that we are telling the compiler to not worry. This may hide a valid 
concern from the compiler.

> From this it (I think obviously) follows that without the
> initializer we're at bigger risk than with it.

I thought deferencing a NULL pointer was still a concern for PV?

For the other setup, I agree that it would only lead to a crash rather 
than dereferencing anything. Yet I am not convinced this is that much 
better...

>>     2) A compiler will not be able to help us if we are adding code
>> without initialized vaddrs.
>>
>> It also feels wrong to me to try to write Xen in a way that will make a
>> 10 years compiler happy...
> 
> As said above - we've worked around limitations quite a few times
> in the past. This is just one more instance.

I find amusing you wrote that when you complained multiple time when 
someone was re-using existing bad pattern. :)

> 
>> If we still want to support them, then maybe a better approach would be
>> to turn off to turn off -Werror for some version of GCC. So we can
>> continue to benefit from the newer compiler diagnostics.
> 
> Avoiding use of -Werror is not an option imo: Once you start seeing
> warnings, you have only two options imo: Either one decides to ignore
> them all (and then one will also ignore new ones introduce by changes
> yet to be submitted), or one would have to memorize, for every build
> one does, which warnings one ought to ignore. The latter doesn't
> scale, while the former is a code quality problem. >
> Suppressing a particular class of warning might be an option, but
> again risks somebody submitting code which elsewhere would trigger
> warnings.

This is pretty much what we are already doing slowly by initializing 
values to shut up older compilers. I agree this is more limited, but we 
also waive off diagnostics from every single compiler in that code 
rather than just one version.

Hence why I suggested dropping -Werror for older compiler. This is not 
ideal but it would give us the ability to keep support for dinausor 
compiler and not hamper our ability to take advantage of newer compiler 
diagnostics.

The ideal solution is to drop support for older compiler (see my other 
thread). But this sounds like a daunting task so far on x86...

Anyway, I will not Nack the patch but will also not Ack it. I will let 
another maintainer ack this patch.

Cheers,

-- 
Julien Grall

