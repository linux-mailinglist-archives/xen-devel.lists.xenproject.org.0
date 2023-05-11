Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E24806FF111
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 14:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533329.829894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px54j-0001Qr-PU; Thu, 11 May 2023 12:07:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533329.829894; Thu, 11 May 2023 12:07:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1px54j-0001Nq-LT; Thu, 11 May 2023 12:07:13 +0000
Received: by outflank-mailman (input) for mailman id 533329;
 Thu, 11 May 2023 12:07:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1px54i-0001L5-F6
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 12:07:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px54h-0001z7-Qn; Thu, 11 May 2023 12:07:11 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.27.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1px54h-0000jY-KA; Thu, 11 May 2023 12:07:11 +0000
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
	bh=e9Tdnj091amBSRxdNv88yRqWE4IatFcZ8M1XocevZww=; b=NpNAyombeEwG5Tg8LlELK8XFDR
	GI8UFxjgM8YwxGeWruvR3vJ+bZz+8EIcXP9ORQExmG9I7/SJY/ZJ/C5mJrK5pKi9jxbImReRyFOBL
	1FBhVCwXGeKQZ8c4xAHxyKU1o1sOGMGAbZRsWufTvPCXf4VyAnTYRMz82vRplF33YA2w=;
Message-ID: <2aaf1cf4-baca-0974-ac0c-80328037ce52@xen.org>
Date: Thu, 11 May 2023 13:07:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v5 05/14] tools/xenstore: use accounting buffering for
 node accounting
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230508114754.31514-1-jgross@suse.com>
 <20230508114754.31514-6-jgross@suse.com>
 <21847835-4f7e-a09a-458e-e68dc59d4268@xen.org>
 <9745474f-db84-c8f3-3662-95728d4d5bd3@suse.com>
 <91380959-b63d-7d4f-0920-7d87dc0fc19d@xen.org>
 <de77cc78-e07a-934f-e241-15fe851706df@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <de77cc78-e07a-934f-e241-15fe851706df@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 11/05/2023 06:25, Juergen Gross wrote:
> On 10.05.23 23:31, Julien Grall wrote:
>> On 10/05/2023 13:54, Juergen Gross wrote:
>>> On 09.05.23 20:46, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 08/05/2023 12:47, Juergen Gross wrote:
>>>>> Add the node accounting to the accounting information buffering in
>>>>> order to avoid having to undo it in case of failure.
>>>>>
>>>>> This requires to call domain_nbentry_dec() before any changes to the
>>>>> data base, as it can return an error now.
>>>>>
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>> V5:
>>>>> - add error handling after domain_nbentry_dec() calls (Julien Grall)
>>>>> ---
>>>>>   tools/xenstore/xenstored_core.c   | 29 +++++++----------------------
>>>>>   tools/xenstore/xenstored_domain.h |  4 ++--
>>>>>   2 files changed, 9 insertions(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/tools/xenstore/xenstored_core.c 
>>>>> b/tools/xenstore/xenstored_core.c
>>>>> index 8392bdec9b..22da434e2a 100644
>>>>> --- a/tools/xenstore/xenstored_core.c
>>>>> +++ b/tools/xenstore/xenstored_core.c
>>>>> @@ -1454,7 +1454,6 @@ static void destroy_node_rm(struct connection 
>>>>> *conn, struct node *node)
>>>>>   static int destroy_node(struct connection *conn, struct node *node)
>>>>>   {
>>>>>       destroy_node_rm(conn, node);
>>>>> -    domain_nbentry_dec(conn, get_node_owner(node));
>>>>>       /*
>>>>>        * It is not possible to easily revert the changes in a 
>>>>> transaction.
>>>>> @@ -1645,6 +1644,9 @@ static int delnode_sub(const void *ctx, 
>>>>> struct connection *conn,
>>>>>       if (ret > 0)
>>>>>           return WALK_TREE_SUCCESS_STOP;
>>>>> +    if (domain_nbentry_dec(conn, get_node_owner(node)))
>>>>> +        return WALK_TREE_ERROR_STOP;
>>>>
>>>> I think there is a potential issue with the buffering here. In case 
>>>> of failure, the node could have been removed, but the quota would 
>>>> not be properly accounted.
>>>
>>> You mean the case where another node has been deleted and due to 
>>> accounting
>>> buffering the corrected accounting data wouldn't be committed?
>>>
>>> This is no problem, as an error returned by delnode_sub() will result in
>>> corrupt() being called, which in turn will correct the accounting data.
>>
>> To me corrupt() is a big hammer and it feels wrong to call it when I 
>> think we have easier/faster way to deal with the issue. Could we 
>> instead call acc_commit() before returning?
> 
> You are aware that this is a very problematic situation we are in?

It is not very clear from the code. And that's why comments are always 
useful to clarify why corrupt() is the right call.

> 
> We couldn't allocate a small amount of memory (around 64 bytes)! 

So long this is the only reason then...

Xenstored
> will probably die within milliseconds. Using the big hammer in such a
> situation is fine IMO. It will maybe result in solving the problem by
> freeing of memory (quite unlikely, though), but it won't leave xenstored
> in a worse state than with your suggestion.

... this might be OK. But in the past, we had a place where corrupt() 
could be reliably triggered by a guest. If you think that's not 
possible, then it should be properly documented.

> 
> And calling acc_commit() here wouldn't really help, as accounting data
> couldn't be recorded, so there are missing updates anyway due to the failed
> call of domain_nbentry_dec().

We are removing the node after the accounting is updated. So if the 
accounting fail, then it should still be correct for anything that was 
removed before.

> 
>>>> Also, I think a comment would be warrant to explain why we are 
>>>> returning WALK_TREE_ERROR_STOP here when...
>>>>
>>>>> +
>>>>>       /* In case of error stop the walk. */
>>>>>       if (!ret && do_tdb_delete(conn, &key, &node->acc))
>>>>>           return WALK_TREE_SUCCESS_STOP;
>>>>
>>>> ... this is not the case when do_tdb_delete() fails for some reasons.
>>>
>>> The main idea was that the remove is working from the leafs towards 
>>> the root.
>>> In case one entry can't be removed, we should just stop.
>>>
>>> OTOH returning WALK_TREE_ERROR_STOP might be cleaner, as this would 
>>> make sure
>>> that accounting data is repaired afterwards. Even if do_tdb_delete() 
>>> can't
>>> really fail in normal configurations, as the only failure reasons are:
>>>
>>> - the node isn't found (quite unlikely, as we just read it before 
>>> entering
>>>    delnode_sub()), or
>>> - writing the updated data base failed (in normal configurations it 
>>> is in
>>>    already allocated memory, so no way to fail that)
>>>
>>> I think I'll switch to return WALK_TREE_ERROR_STOP here.
>>
>> See above for a different proposal.
> 
> Without deleting the node in the data base this would be another accounting
> data inconsistency, so calling corrupt() is the correct cleanup measure.

Hmmm... I read this as this is already a bug rather than one introduced 
by this patch. IIUC, then this should be done in a new commit.

Cheers,

-- 
Julien Grall

