Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810295BA9E7
	for <lists+xen-devel@lfdr.de>; Fri, 16 Sep 2022 12:04:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.407899.650567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ8CJ-00088b-A5; Fri, 16 Sep 2022 10:03:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 407899.650567; Fri, 16 Sep 2022 10:03:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oZ8CJ-00085R-7I; Fri, 16 Sep 2022 10:03:47 +0000
Received: by outflank-mailman (input) for mailman id 407899;
 Fri, 16 Sep 2022 10:03:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oZ8CH-00085L-La
 for xen-devel@lists.xenproject.org; Fri, 16 Sep 2022 10:03:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oZ8CH-0003JL-AF; Fri, 16 Sep 2022 10:03:45 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[10.95.124.157]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oZ8CH-0000JV-3z; Fri, 16 Sep 2022 10:03:45 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=46U12yxP6rLIf93pLk8uQYCX8NtehS+vHwzRGrChdTI=; b=SDB53tqkGYV/r3klrUCaChqqPW
	A6SGiqm5EvoI0pqF0bk7piRL/KzuNfQHgsrtw1ym5i2kbrViClIe811K2OVQ1WFR4zsf5MrQEHaRe
	VMvhUBlQ2UYoiLdHC3pBEv5FrHEtk5dbSyYPdB8zwBzJQRSPMHuxCHgv5RqQb3uSHkSI=;
Message-ID: <4eb0dbc8-ae37-5299-6aea-74a483668b99@xen.org>
Date: Fri, 16 Sep 2022 11:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [for-4.17] xen/arm: domain_build: Do not use dprintk
 unconditionally
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220916071920.8287-1-michal.orzel@amd.com>
 <4f4e254a-6b54-cdf7-40bc-89c25172bebf@xen.org>
 <f6588270-5cfa-7a46-f857-1fb78dfdffea@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f6588270-5cfa-7a46-f857-1fb78dfdffea@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 16/09/2022 09:32, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> On 16/09/2022 10:08, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 16/09/2022 08:19, Michal Orzel wrote:
>>> Using dprintk results in printing additionally file name and line
>>> number. This is something we do not want when printing regular
>>> information unconditionally as it looks like as if there was some issue.
>> I am OK if you want to switch to a printk() but I disagree with this
>> argument. dprintk() is not about error, it is about anything that
>> doesn't matter in release build.
> 
> In the vast majority of cases, dprintk is used conditionally. That is why
> in the debug build you cannot spot a single line of log starting with
> a file name + line number. 
> That is why I assume this behaviorto be abnormal
> compared to all the other logs.
> 
> If someone adds a printk starting with e.g. "$$$" this is also not a bad
> usage of printk but would result in an inconsistent behavior.
Every lines are different, so it is not clear what you mean by 
inconsistent here. For instance, we have quite a few lines starting with 
the subsystem (your $$$) but not all of them. Would that be inconsistent 
to you?

> 
>>
>> I don't think we should just switch to printk() because dprintk() add
>> the line/file. There are message we don't necessarily want to have in
>> release build. So dprintk(XENLOG_INFO, ...) would be right for them.
> 
> I think this is a matter of being consistent.

You can't really argue about consistency without explaining what is a 
consistent line.

As I wrote above, a message is mostly a free form. Some may use 'rc=%d' 
other 'error %d'...

Yes it would be good if all the errors are printed the same way. 
However, this needs to be a tree-wide decision rather than localized and 
something really not worth the argument.

>> Personally, I find them useful as there no grep required and/or
>> confusion (but that's a matter of taste). If it were me, I would add the
>> line/file everywhere. But I understand this takes space in the binary
>> (hence why this is not present in release build).
>>
>> A better argument to switch to printk() is this information is useful to
>> the user even outside of the debug build.
>>
>>>
>>> Fix this by switching to printk because this information may also be
>>> helpful on the release builds (it would still require setting loglvl to
>>> "info" or lower level).
>>
>> I think we should drop XENLOG_INFO to be consistent with the other
>> printk() in domain_build.c (after all this is a domain information like
>> the other) or use XENLOG_INFO everywhere.
>>
>> My preference will be the former because otherwise most of the
>> information will not printed in release build by default.
>>
>>>
>>> Fixes: 5597f32f409c ("xen/arm: assign static shared memory to the default owner dom_io")
>>
>> Fixes should only be used for bugs. This is not one.
>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> Rationale for taking this patch for 4.17:
>>> Current code results in an abnormal behavior [1] and was introduced by
>>
>> It is not abnormal (see above). This is an expected behavior when you
>> use dprintk().
> 
> I did not mean abnormal behavior of dprintk but abnormal behavior of logging
> even on debug builds. As I said before, I could not spot any message like this
> booting Xen at all. This is why I took this as a reference for "normal" behavior.

To me "abnormal" is quite a strong word and in this situation really a 
matter of taste.

Anyway, there are way to write the commit message in a more objective 
way. Some like:

xen/arm: domain_build: Always print the static memory region

At the moment, the static memory region are only printed during debug 
build. The information could be helpful for the end user (which may not 
be the same as the person building the package). So switch to printk().

Cheers,

-- 
Julien Grall

