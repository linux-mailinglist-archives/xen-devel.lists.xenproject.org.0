Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205E05B344A
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 11:45:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404077.646402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaZZ-0000m3-CI; Fri, 09 Sep 2022 09:45:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404077.646402; Fri, 09 Sep 2022 09:45:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWaZZ-0000ir-9L; Fri, 09 Sep 2022 09:45:17 +0000
Received: by outflank-mailman (input) for mailman id 404077;
 Fri, 09 Sep 2022 09:45:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWaZX-0000il-Sx
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 09:45:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWaZX-0006Ia-72; Fri, 09 Sep 2022 09:45:15 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.11.73]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWaZX-000121-0A; Fri, 09 Sep 2022 09:45:15 +0000
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
	bh=0KLcYl2dN9slHzm/v2B+bq/46KRd9q3KpUbEhOvb8yI=; b=yyfGY8Z3DWRQf5CHRsxN2mv+hB
	bLXfEHMvwmHv7chCjWi84wfAWdP+KFiZ4DzlRcD6OqnYxS6byVBc/IhDmIbBtgoj/6j/vwvauemO6
	aWpNyHaxt97waxJJ4y6RjX9zPT2pxqCALqHS9ThIOduCtjflQJeSTWaumTTqjszio+AY=;
Message-ID: <40b6f53f-332b-1983-a516-4d29203f0ca9@xen.org>
Date: Fri, 9 Sep 2022 10:45:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH] xen/gnttab: fix gnttab_acquire_resource()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220909080944.28559-1-jgross@suse.com>
 <689f7d26-b691-56de-7adb-dfb6480e7469@xen.org>
 <2a32d8ed-14bc-192b-a2ce-6457490b182e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2a32d8ed-14bc-192b-a2ce-6457490b182e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jan,

On 09/09/2022 10:08, Juergen Gross wrote:
> On 09.09.22 10:56, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 09/09/2022 09:09, Juergen Gross wrote:
>>> Commit 9dc46386d89d ("gnttab: work around "may be used uninitialized"
>>> warning") was wrong, as vaddr can legitimately be NULL in case
>>> XENMEM_resource_grant_table_id_status was specified for a grant table
>>> v1. This would result in crashes in debug builds due to
>>> ASSERT_UNREACHABLE() triggering.
>>>
>>> Basically revert said commit, but keep returning -ENODATA in that case.
>>
>> This commit was introduced to silence a compiler warning (treated as 
>> error in Xen build system). As you revert it, did you check the said 
>> compiler (IIRC GCC 4.3) was still happy?
> 
> I didn't remove the vaddr initializer.

Ok so it is not a full revert as you implied above. I think it would be 
good to write "partially".

> 
>>
>>> Fixes: 9dc46386d89d ("gnttab: work around "may be used uninitialized" 
>>> warning")
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> Might be considered for 4.17 and for backporting
>>> ---
>>>   xen/common/grant_table.c | 14 +++-----------
>>>   1 file changed, 3 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
>>> index ad773a6996..68e7f1df38 100644
>>> --- a/xen/common/grant_table.c
>>> +++ b/xen/common/grant_table.c
>>> @@ -4125,7 +4125,10 @@ int gnttab_acquire_resource(
>>>       case XENMEM_resource_grant_table_id_status:
>>>           if ( gt->gt_version != 2 )
>>> +        {
>>> +            rc = -ENODATA;
>>>               break;
>>> +        }
>>>           /* Check that void ** is a suitable representation for 
>>> gt->status. */
>>>           BUILD_BUG_ON(!__builtin_types_compatible_p(
>>> @@ -4135,17 +4138,6 @@ int gnttab_acquire_resource(
>>>           break;
>>>       }
>>> -    /*
>>> -     * Some older toolchains can't spot that vaddrs won't remain 
>>> uninitialized
>>> -     * on non-error paths, and hence it needs setting to NULL at the 
>>> top of the
>>> -     * function.  Leave some runtime safety.
>>> -     */
>>> -    if ( !vaddrs )
>>> -    {
>>> -        ASSERT_UNREACHABLE();
>>> -        rc = -ENODATA;
>>> -    }
>>> -
>>>       /* Any errors?  Bad id, or from growing the table? */
>>>       if ( rc )
>>>           goto out;
>>
>> Looking at the code just below the loop is:
>>
>> for ( i = 0; i < nr_frames; ++i )
>>     mfn_list[i] = virt_to_mfn(vaddrs[frame + 1]);
>>
>> Given that 'nr_frames' is provided by the caller it is a bit unclear 
>> how we guarantee that 'vaddrs' will not be NULL when nr_frames > 0.
>>
>> Can you explain how you came to the conclusion that this is not possible?
> 
> We can reach this point only in case rc is 0.
> 
> rc can be 0 only in case gnttab_get_shared_frame_mfn() or
> gnttab_get_status_frame_mfn() returned 0, which will be the case only, if
> the value vaddrs was set to before calling those functions was valid.

This is somewhat fragile. As we had to silence the compiler, the check 
was added to avoid any addition of code that may not properly set 
'vaddrs' (The compiler can't help us anymore).

So I think I would prefer what Jan suggested. We should check 'rc' *and* 
then 'vaddrs'.

Cheers,

-- 
Julien Grall

