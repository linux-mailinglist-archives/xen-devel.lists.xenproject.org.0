Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 638886FE656
	for <lists+xen-devel@lfdr.de>; Wed, 10 May 2023 23:31:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533026.829391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwrPO-0002nl-4x; Wed, 10 May 2023 21:31:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533026.829391; Wed, 10 May 2023 21:31:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pwrPO-0002kx-1e; Wed, 10 May 2023 21:31:38 +0000
Received: by outflank-mailman (input) for mailman id 533026;
 Wed, 10 May 2023 21:31:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pwrPL-0002kr-VA
 for xen-devel@lists.xenproject.org; Wed, 10 May 2023 21:31:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwrPK-0005uZ-Sm; Wed, 10 May 2023 21:31:34 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.6.195]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pwrPK-0004PA-N5; Wed, 10 May 2023 21:31:34 +0000
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
	bh=TYIeHSfVMpDx/iX1/UoqWOLbPM3nbyIl/yz0qrcztBw=; b=C/5XResFaUU4yyHrBgXq/Nj5ps
	0V/CDK7EV8bgrnW1O5T1lOjjxNkQSA51GT43eA/sWemmzxYzbpJYnEBmgmhkWzz6O4EZH3daV0OiM
	YexIf9AARWYI3sA5WNhaP3VpQjtqVlVf37i6rgdqBYpopFIL2kOmd96M6U3sYIpYg8Pc=;
Message-ID: <91380959-b63d-7d4f-0920-7d87dc0fc19d@xen.org>
Date: Wed, 10 May 2023 22:31:33 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <9745474f-db84-c8f3-3662-95728d4d5bd3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 10/05/2023 13:54, Juergen Gross wrote:
> On 09.05.23 20:46, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 08/05/2023 12:47, Juergen Gross wrote:
>>> Add the node accounting to the accounting information buffering in
>>> order to avoid having to undo it in case of failure.
>>>
>>> This requires to call domain_nbentry_dec() before any changes to the
>>> data base, as it can return an error now.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V5:
>>> - add error handling after domain_nbentry_dec() calls (Julien Grall)
>>> ---
>>>   tools/xenstore/xenstored_core.c   | 29 +++++++----------------------
>>>   tools/xenstore/xenstored_domain.h |  4 ++--
>>>   2 files changed, 9 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_core.c 
>>> b/tools/xenstore/xenstored_core.c
>>> index 8392bdec9b..22da434e2a 100644
>>> --- a/tools/xenstore/xenstored_core.c
>>> +++ b/tools/xenstore/xenstored_core.c
>>> @@ -1454,7 +1454,6 @@ static void destroy_node_rm(struct connection 
>>> *conn, struct node *node)
>>>   static int destroy_node(struct connection *conn, struct node *node)
>>>   {
>>>       destroy_node_rm(conn, node);
>>> -    domain_nbentry_dec(conn, get_node_owner(node));
>>>       /*
>>>        * It is not possible to easily revert the changes in a 
>>> transaction.
>>> @@ -1645,6 +1644,9 @@ static int delnode_sub(const void *ctx, struct 
>>> connection *conn,
>>>       if (ret > 0)
>>>           return WALK_TREE_SUCCESS_STOP;
>>> +    if (domain_nbentry_dec(conn, get_node_owner(node)))
>>> +        return WALK_TREE_ERROR_STOP;
>>
>> I think there is a potential issue with the buffering here. In case of 
>> failure, the node could have been removed, but the quota would not be 
>> properly accounted.
> 
> You mean the case where another node has been deleted and due to accounting
> buffering the corrected accounting data wouldn't be committed?
> 
> This is no problem, as an error returned by delnode_sub() will result in
> corrupt() being called, which in turn will correct the accounting data.

To me corrupt() is a big hammer and it feels wrong to call it when I 
think we have easier/faster way to deal with the issue. Could we instead 
call acc_commit() before returning?

> 
>> Also, I think a comment would be warrant to explain why we are 
>> returning WALK_TREE_ERROR_STOP here when...
>>
>>> +
>>>       /* In case of error stop the walk. */
>>>       if (!ret && do_tdb_delete(conn, &key, &node->acc))
>>>           return WALK_TREE_SUCCESS_STOP;
>>
>> ... this is not the case when do_tdb_delete() fails for some reasons.
> 
> The main idea was that the remove is working from the leafs towards the 
> root.
> In case one entry can't be removed, we should just stop.
> 
> OTOH returning WALK_TREE_ERROR_STOP might be cleaner, as this would make 
> sure
> that accounting data is repaired afterwards. Even if do_tdb_delete() can't
> really fail in normal configurations, as the only failure reasons are:
> 
> - the node isn't found (quite unlikely, as we just read it before entering
>    delnode_sub()), or
> - writing the updated data base failed (in normal configurations it is in
>    already allocated memory, so no way to fail that)
> 
> I think I'll switch to return WALK_TREE_ERROR_STOP here.

See above for a different proposal.

Cheers,

-- 
Julien Grall

