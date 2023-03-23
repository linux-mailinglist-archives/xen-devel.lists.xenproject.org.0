Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F39416C6AF6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 15:30:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513914.795653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLx6-0000WA-RM; Thu, 23 Mar 2023 14:30:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513914.795653; Thu, 23 Mar 2023 14:30:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLx6-0000Ry-O8; Thu, 23 Mar 2023 14:30:04 +0000
Received: by outflank-mailman (input) for mailman id 513914;
 Thu, 23 Mar 2023 14:30:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pfLx4-00007f-Fj
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 14:30:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfLx2-0001gZ-Pl; Thu, 23 Mar 2023 14:30:00 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.18.79]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pfLx2-0004gK-Jp; Thu, 23 Mar 2023 14:30:00 +0000
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
	bh=Dkt036WW39Yv0aJyWq1waeDGCZb1xwqG+2tsDEcuHZM=; b=Ix8MHSkWuu7m0IcnKKLThDx0PR
	Rj085A3ttLm4tFwOfGUBTpv8C82UsWh+5+hwz4593oWK172QcAuv/0B8waEefN2JpwGmuVvbxcUKH
	lbhpo1NDZCcVoZqkTrwa/tNZttgQnbbiwOkG0qVcxOlpelDFC6bokVI//42BVKEhi/Gc=;
Message-ID: <f2fd8967-7dc5-4aeb-ae72-623bc4ae3e4d@xen.org>
Date: Thu, 23 Mar 2023 14:29:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] tools/xenstore: fix quota check in acc_fix_domains()
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230224155848.31036-1-jgross@suse.com>
 <a8e71268-6111-d4d5-5cba-ed141dba530d@xen.org>
 <363e4526-6bc2-d961-88ac-93ba82e2e30c@suse.com>
 <b95864bf-014f-7b1d-3c07-295705cdba0d@xen.org>
 <92b2f26a-fd2e-2826-d38f-3ca45727bfb3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92b2f26a-fd2e-2826-d38f-3ca45727bfb3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/03/2023 14:21, Juergen Gross wrote:
> On 23.03.23 15:20, Julien Grall wrote:
>> Hi,
>>
>> On 23/03/2023 12:53, Juergen Gross wrote:
>>> On 23.03.23 13:38, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 24/02/2023 15:58, Juergen Gross wrote:
>>>>> Today when finalizing a transaction the number of node quota is 
>>>>> checked
>>>>> to not being exceeded after the transaction. This check is always 
>>>>> done,
>>>>> even if the transaction is being performed by a privileged connection,
>>>>> or if there were no nodes created in the transaction.
>>>>>
>>>>> Correct that by checking quota only if:
>>>>> - the transaction is being performed by an unprivileged guest, and
>>>>> - at least one node was created in the transaction
>>>>>
>>>>> Reported-by: Julien Grall <julien@xen.org>
>>>>> Fixes: f2bebf72c4d5 ("xenstore: rework of transaction handling")
>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>> ---
>>>>>   tools/xenstore/xenstored_core.c        |  3 +++
>>>>>   tools/xenstore/xenstored_domain.c      |  4 ++--
>>>>>   tools/xenstore/xenstored_domain.h      |  2 +-
>>>>>   tools/xenstore/xenstored_transaction.c | 16 ++++++++++++++--
>>>>>   tools/xenstore/xenstored_transaction.h |  3 +++
>>>>>   5 files changed, 23 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/tools/xenstore/xenstored_core.c 
>>>>> b/tools/xenstore/xenstored_core.c
>>>>> index a61db2db2d..3ca68681e3 100644
>>>>> --- a/tools/xenstore/xenstored_core.c
>>>>> +++ b/tools/xenstore/xenstored_core.c
>>>>> @@ -1472,6 +1472,9 @@ static struct node *create_node(struct 
>>>>> connection *conn, const void *ctx,
>>>>>       if (!node)
>>>>>           return NULL;
>>>>> +    if (conn && conn->transaction)
>>>>> +        ta_node_created(conn->transaction);
>>>>> +
>>>>>       node->data = data;
>>>>>       node->datalen = datalen;
>>>>> diff --git a/tools/xenstore/xenstored_domain.c 
>>>>> b/tools/xenstore/xenstored_domain.c
>>>>> index d7fc2fafc7..f62be2245c 100644
>>>>> --- a/tools/xenstore/xenstored_domain.c
>>>>> +++ b/tools/xenstore/xenstored_domain.c
>>>>> @@ -544,7 +544,7 @@ static struct domain 
>>>>> *find_domain_by_domid(unsigned int domid)
>>>>>       return (d && d->introduced) ? d : NULL;
>>>>>   }
>>>>> -int acc_fix_domains(struct list_head *head, bool update)
>>>>> +int acc_fix_domains(struct list_head *head, bool chk_quota, bool 
>>>>> update)
>>>>>   {
>>>>>       struct changed_domain *cd;
>>>>>       int cnt;
>>>>> @@ -552,7 +552,7 @@ int acc_fix_domains(struct list_head *head, 
>>>>> bool update)
>>>>>       list_for_each_entry(cd, head, list) {
>>>>>           cnt = domain_nbentry_fix(cd->domid, cd->nbentry, update);
>>>>>           if (!update) {
>>>>> -            if (cnt >= quota_nb_entry_per_domain)
>>>>> +            if (chk_quota && cnt >= quota_nb_entry_per_domain)
>>>>>                   return ENOSPC;
>>>>>               if (cnt < 0)
>>>>>                   return ENOMEM;
>>>>> diff --git a/tools/xenstore/xenstored_domain.h 
>>>>> b/tools/xenstore/xenstored_domain.h
>>>>> index dc4660861e..ec6aa00cc7 100644
>>>>> --- a/tools/xenstore/xenstored_domain.h
>>>>> +++ b/tools/xenstore/xenstored_domain.h
>>>>> @@ -96,7 +96,7 @@ void domain_outstanding_dec(struct connection 
>>>>> *conn);
>>>>>   void domain_outstanding_domid_dec(unsigned int domid);
>>>>>   int domain_get_quota(const void *ctx, struct connection *conn,
>>>>>                unsigned int domid);
>>>>> -int acc_fix_domains(struct list_head *head, bool update);
>>>>> +int acc_fix_domains(struct list_head *head, bool chk_quota, bool 
>>>>> update);
>>>>
>>>> Depending on the answer below, I would suggest to write that 
>>>> 'chk_quota' is ignored when ``update`` is true.
>>>
>>> With the answer below, do you agree that no additional comment is 
>>> needed?
>>> I'm fine either way.
>>>
>>>>
>>>>>   /* Write rate limiting */
>>>>> diff --git a/tools/xenstore/xenstored_transaction.c 
>>>>> b/tools/xenstore/xenstored_transaction.c
>>>>> index 1aa9d3cb3d..2b15506953 100644
>>>>> --- a/tools/xenstore/xenstored_transaction.c
>>>>> +++ b/tools/xenstore/xenstored_transaction.c
>>>>> @@ -160,12 +160,20 @@ struct transaction
>>>>>       /* List of changed domains - to record the changed domain 
>>>>> entry number */
>>>>>       struct list_head changed_domains;
>>>>> +    /* There was at least one node created in the transaction. */
>>>>> +    bool node_created;
>>>>> +
>>>>>       /* Flag for letting transaction fail. */
>>>>>       bool fail;
>>>>>   };
>>>>>   uint64_t generation;
>>>>> +void ta_node_created(struct transaction *trans)
>>>>> +{
>>>>> +    trans->node_created = true;
>>>>> +}
>>>>> +
>>>>>   static struct accessed_node *find_accessed_node(struct 
>>>>> transaction *trans,
>>>>>                           const char *name)
>>>>>   {
>>>>> @@ -509,6 +517,7 @@ int do_transaction_end(const void *ctx, struct 
>>>>> connection *conn,
>>>>>       const char *arg = onearg(in);
>>>>>       struct transaction *trans;
>>>>>       bool is_corrupt = false;
>>>>> +    bool chk_quota;
>>>>>       int ret;
>>>>>       if (!arg || (!streq(arg, "T") && !streq(arg, "F")))
>>>>> @@ -523,13 +532,16 @@ int do_transaction_end(const void *ctx, 
>>>>> struct connection *conn,
>>>>>       if (!conn->transaction_started)
>>>>>           conn->ta_start_time = 0;
>>>>> +    chk_quota = trans->node_created && domain_is_unprivileged(conn);
>>>>> +
>>>>>       /* Attach transaction to ctx for auto-cleanup */
>>>>>       talloc_steal(ctx, trans);
>>>>>       if (streq(arg, "T")) {
>>>>>           if (trans->fail)
>>>>>               return ENOMEM;
>>>>> -        ret = acc_fix_domains(&trans->changed_domains, false);
>>>>> +        ret = acc_fix_domains(&trans->changed_domains, chk_quota,
>>>>> +                      false);
>>>>>           if (ret)
>>>>>               return ret;
>>>>>           ret = finalize_transaction(conn, trans, &is_corrupt);
>>>>> @@ -539,7 +551,7 @@ int do_transaction_end(const void *ctx, struct 
>>>>> connection *conn,
>>>>>           wrl_apply_debit_trans_commit(conn);
>>>>>           /* fix domain entry for each changed domain */
>>>>> -        acc_fix_domains(&trans->changed_domains, true);
>>>>> +        acc_fix_domains(&trans->changed_domains, false, true);
>>>>
>>>> In theory, shouldn't we pass 'chk_quota' rather than false? In 
>>>> practice, I know it doesn't make any difference between this is an 
>>>> update.
>>>
>>> We explicitly don't want to check quota in the "update" case. So 
>>> specifying
>>> "false" is the correct thing to do IMHO.
>>
>> Let me rephrase my comment differently. What would happen if the user 
>> pass 'true'? Would we check the quota or not?
>>
>> I suspect this is a no, hence why I was suggested the comment to say 
>> the field is ignored. Alternatively, we could add an assert that 
>> ensure that chk_quota is false when update is true.
> 
> Okay, I'll add the comment.

Thanks! No need to send a new version. I tested the code and confirmed 
that it solved the problem I reported. I would be happy to add the 
comment on commit once we agree on it.

Cheers,

-- 
Julien Grall

