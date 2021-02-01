Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B5630AA5B
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:03:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79945.145841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6ajA-0003Qa-2x; Mon, 01 Feb 2021 15:02:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79945.145841; Mon, 01 Feb 2021 15:02:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6aj9-0003Q1-Vc; Mon, 01 Feb 2021 15:02:55 +0000
Received: by outflank-mailman (input) for mailman id 79945;
 Mon, 01 Feb 2021 15:02:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4N3t=HD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l6aj8-0003Pe-EO
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:02:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9ceb8407-dc7d-43cf-beb8-57e6eb1aa0dd;
 Mon, 01 Feb 2021 15:02:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 66258ABD5;
 Mon,  1 Feb 2021 15:02:52 +0000 (UTC)
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
X-Inumbo-ID: 9ceb8407-dc7d-43cf-beb8-57e6eb1aa0dd
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612191772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/cxaZe5HibYKi5X4hVRGu6pgg1gFZKdO6lE5Jqra6LE=;
	b=fGf7NQQ0y6XB2l9IEbF+ZYQhqJ47RKHe1BSKrM80chiTbIB0TN8AhypUgySXIoE7397KU/
	vxy7Y1egI69m/2ATa9waIh71vi890CbK4JcdCESw/uPy4ipI7GrUtUHLP4lSpdnbg4w4lg
	6Epv9WMI5PjzPPybTjrlxGmBmKf21vI=
Subject: Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and
 CONFIG_COVERAGE=y [and 1 more messages]
To: Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20210130152210.17503-1-julien@xen.org>
 <174a18ba-25d5-a94c-a85d-4a81b837a936@suse.com>
 <24600.5695.143342.713995@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <321c06d3-106a-cfab-5ac8-df629e600dfe@suse.com>
Date: Mon, 1 Feb 2021 16:02:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <24600.5695.143342.713995@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.02.2021 15:54, Ian Jackson wrote:
> Julien Grall writes ("[PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y"):
>> Xen is heavily relying on the DCE stage to remove unused code so the
>> linker doesn't throw an error because a function is not implemented
>> yet we defined a prototype for it.
> 
> Thanks for the clear explanation.
> 
>> It is not entirely clear why the compiler DCE is not detecting the
>> unused code. However, moving the permission check from do_memory_op()
>> to xenmem_add_to_physmap_batch() does the trick.
> 
> How unfortunate.
> 
>> Fixes: d4f699a0df6c ("x86/mm: p2m_add_foreign() is HVM-only")
>> Reported-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> I have reviewed the diff, but not the code in context.
> 
>> The gitlab CI is used to provide basic testing on a per-series basis. So
>> I would like to request this patch to be merged in Xen 4.15 in order to
>> reduce the number of failure not related to the series tested.
> 
> Quite so.
> 
> Jan Beulich writes ("Re: [PATCH for-4.15] xen/mm: Fix build when CONFIG_HVM=n and CONFIG_COVERAGE=y"):
>> On 30.01.2021 16:22, Julien Grall wrote:
>>> @@ -1442,13 +1447,6 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>          if ( d == NULL )
>>>              return -ESRCH;
>>>  
>>> -        rc = xatp_permission_check(d, xatpb.space);
>>> -        if ( rc )
>>> -        {
>>> -            rcu_unlock_domain(d);
>>> -            return rc;
>>> -        }
>>> -
>>>          rc = xenmem_add_to_physmap_batch(d, &xatpb, start_extent);
>>>  
>>>          rcu_unlock_domain(d);
>>
>> I'd be okay with the code movement if you did so consistently,
>> i.e. also for the other invocation. I realize this would have
>> an effect on the dm-op call of the function, but I wonder
>> whether this wouldn't even be a good thing. If not, I think
>> duplicating xenmem_add_to_physmap()'s early ASSERT() into
>> xenmem_add_to_physmap_batch() would be the better course of
>> action.
> 
> Jan, can you confirm whether in your opinion this patch as originally
> posted by Julien is *correct* as is ?  In particular, Julien did not
> intend a functional change.  Have you satisfied yourself that there is
> no functional change here ?

Yes and yes.

> I understand your objectiion above to relate to style or neatness,
> rather than function.  Is that correct ?

Yes.

>  And that your proposed
> additional change would have some impact whilch would have to be
> assessed.

The first of the proposed alternatives may need further
investigation, yes. The second of the alternatives would
shrink this patch to a 2-line one, i.e. far less code
churn, and is not in need of any assessment afaia. In
fact I believe this latter alternative was discussed as
the approach to take here, before the patch was submitted.

Jan

> In which case I think it would be better to defer the style
> improvement until after the release.
> 
> IOW, the original patch
> 
> Release-Acked-by: Ian Jackson <iwj@xenproject.org>
> 
> assuming a favourable functional code review from a relevant
> maintainer.
> 
> Thanks,
> Ian.
> 


