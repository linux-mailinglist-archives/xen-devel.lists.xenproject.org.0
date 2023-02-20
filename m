Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D58B369CA8C
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 13:13:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498093.768913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU52l-0001wi-UL; Mon, 20 Feb 2023 12:13:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498093.768913; Mon, 20 Feb 2023 12:13:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU52l-0001uV-QJ; Mon, 20 Feb 2023 12:13:19 +0000
Received: by outflank-mailman (input) for mailman id 498093;
 Mon, 20 Feb 2023 12:13:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pU52k-0001uP-Dr
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 12:13:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pU52j-0007FV-9x; Mon, 20 Feb 2023 12:13:17 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.98.51])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pU52j-0003GA-3e; Mon, 20 Feb 2023 12:13:17 +0000
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
	bh=7lEgd9C51hwuThcIkVS9y28InKnSd8GF7fpDqYIlPeY=; b=jwWXAXA5n030PP8arOMSUvnjZL
	3pizgg1NubKSPHnX1Gae/aVJrYBFW4UIz6Yr5KT8zvfYLXHUPgVA0Z7jhG71lSf72Ex/LE1uaxhjX
	NIQ0AKTtiU00j+WZGNJc+foA0Wk5daPZqsvoeA7ZkxGY4J8nMaQBPWXTNMFa1QaN0eqU=;
Message-ID: <bd7faa3c-3df4-8681-2959-758b746231df@xen.org>
Date: Mon, 20 Feb 2023 12:13:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 03/13] tools/xenstore: introduce accounting data array
 for per-domain values
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-4-jgross@suse.com>
 <56e5bed5-baaf-9ff0-fe93-122c77ce3c5a@xen.org>
 <93762544-5866-1a6f-1d64-b5fa4286feb3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <93762544-5866-1a6f-1d64-b5fa4286feb3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 20/02/2023 11:20, Juergen Gross wrote:
> On 17.02.23 20:29, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 20/01/2023 10:00, Juergen Gross wrote:
>>> Introduce the scheme of an accounting data array for per-domain
>>> accounting data and use it initially for the number of nodes owned by
>>> a domain.
>>>
>>> Make the accounting data type to be unsigned int, as no data is allowed
>>> to be negative at any time.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   tools/xenstore/xenstored_domain.c | 71 ++++++++++++++++++-------------
>>>   tools/xenstore/xenstored_domain.h |  5 ++-
>>>   2 files changed, 45 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_domain.c 
>>> b/tools/xenstore/xenstored_domain.c
>>> index 44e72937fa..f459c5aabb 100644
>>> --- a/tools/xenstore/xenstored_domain.c
>>> +++ b/tools/xenstore/xenstored_domain.c
>>> @@ -69,8 +69,8 @@ struct domain
>>>       /* Has domain been officially introduced? */
>>>       bool introduced;
>>> -    /* number of entry from this domain in the store */
>>> -    int nbentry;
>>> +    /* Accounting data for this domain. */
>>> +    unsigned int acc[ACC_N];
>>>       /* Amount of memory allocated for this domain. */
>>>       int memory;
>>> @@ -246,7 +246,7 @@ static int domain_tree_remove_sub(const void 
>>> *ctx, struct connection *conn,
>>>       if (keep_orphans) {
>>>           set_tdb_key(node->name, &key);
>>> -        domain->nbentry--;
>>> +        domain_nbentry_dec(NULL, domain->domid);
>>>           node->perms.p[0].id = priv_domid;
>>>           node->acc.memory = 0;
>>>           domain_nbentry_inc(NULL, priv_domid);
>>> @@ -270,7 +270,7 @@ static int domain_tree_remove_sub(const void 
>>> *ctx, struct connection *conn,
>>>           ret = WALK_TREE_SKIP_CHILDREN;
>>>       }
>>> -    return domain->nbentry > 0 ? ret : WALK_TREE_SUCCESS_STOP;
>>> +    return domain->acc[ACC_NODES] ? ret : WALK_TREE_SUCCESS_STOP;
>>>   }
>>>   static void domain_tree_remove(struct domain *domain)
>>> @@ -278,7 +278,7 @@ static void domain_tree_remove(struct domain 
>>> *domain)
>>>       int ret;
>>>       struct walk_funcs walkfuncs = { .enter = domain_tree_remove_sub };
>>> -    if (domain->nbentry > 0) {
>>> +    if (domain->acc[ACC_NODES]) {
>>>           ret = walk_node_tree(domain, NULL, "/", &walkfuncs, domain);
>>>           if (ret == WALK_TREE_ERROR_STOP)
>>>               syslog(LOG_ERR,
>>> @@ -437,7 +437,7 @@ int domain_get_quota(const void *ctx, struct 
>>> connection *conn,
>>>       resp = talloc_asprintf_append(resp, "%-16s: %8d\n", #t, e); \
>>>       if (!resp) return ENOMEM
>>> -    ent(nodes, d->nbentry);
>>> +    ent(nodes, d->acc[ACC_NODES]);
>>>       ent(watches, d->nbwatch);
>>>       ent(transactions, ta);
>>>       ent(outstanding, d->nboutstanding);
>>> @@ -1047,8 +1047,28 @@ int domain_adjust_node_perms(struct node *node)
>>>       return 0;
>>>   }
>>> -static int domain_nbentry_add(struct connection *conn, unsigned int 
>>> domid,
>>> -                  int add, bool no_dom_alloc)
>>> +static int domain_acc_add_chk(struct domain *d, enum accitem what, 
>>> int add,
>>> +                  unsigned int domid)
>>
>> You are passing the domid but this doesn't seem to be used within the 
>> function.
> 
> That was added in order to avoid more code churn in a later patch, which is
> making use of domid.
> 
>> Also, from just reading at this prototype, it is not clear to me 
>> whether 'domid' is meant to correspond to the one of 'd'.
> 
> It is corresponding to 'd', so I think I can remove the domid parameter 
> without
> problem (I think I had it this way because d could be NULL in my initial
> version, which changed afterwards - I'm not sure about the history, 
> though).

Ok. Please mention it in the commit message if you want to keep it.

> 
>> The name is also a bit confusing because below you have a function 
>> call domain_acc_add() that will update "d->acc[what]" so I would 
>> expect this function to also update it after a sanity get.
>>
>> I would suggest to rename it to domain_acc_get_chk() or similar (see 
>> below for some context).
> 
> I could do that, but check is done based on the current value plus an "add"
> value, hence the current name. Would domain_acc_add_valid() be a better
> name?

Fine with me.

> 
>>
>>> +{
>>> +    assert(what < ARRAY_SIZE(d->acc));
>>> +
>>> +    if ((add < 0 && -add > d->acc[what]) ||
>>> +        (d->acc[what] + add) > INT_MAX) {
>>
>> NIT: Even if I know that 'add' will unlikely be INT_MAX, it would be 
>> better to use '(INT_MAX - d->acc[what]) < add)'. So there is no 
>> overflow possible.
> 
> Okay.
> 
>>
>>> +        /*
>>> +         * In a transaction when a node is being added/removed AND the
>>> +         * same node has been added/removed outside the transaction in
>>> +         * parallel, the resulting value will be wrong. This is no
>>> +         * problem, as the transaction will fail due to the resulting
>>> +         * conflict.
>>> +         */
>>> +        return (add < 0) ? 0 : INT_MAX;
>>> +    }
>>> +
>>> +    return d->acc[what] + add;
>>> +}
>>> +
>>> +static int domain_acc_add(struct connection *conn, unsigned int domid,
>>> +              enum accitem what, int add, bool no_dom_alloc)
>>>   {
>>>       struct domain *d;
>>>       struct list_head *head;
>>> @@ -1071,56 +1091,49 @@ static int domain_nbentry_add(struct 
>>> connection *conn, unsigned int domid,
>>>           }
>>>       }
>>> -    if (conn && conn->transaction) {
>>> +    if (conn && conn->transaction && what < ACC_TR_N) {
>>
>> Do you have a use case where 'what' is >= ACC_TR_N and you want to 
>> modify d->acc?
> 
> Yes, please see patch 7.
> 
>>
>>>           head = transaction_get_changed_domains(conn->transaction);
>>> -        ret = acc_add_changed_dom(conn->transaction, head, ACC_NODES,
>>> +        ret = acc_add_changed_dom(conn->transaction, head, what,
>>>                         add, domid);
>>>           if (errno) {
>>>               fail_transaction(conn->transaction);
>>>               return -1;
>>>           }
>>> -        /*
>>> -         * In a transaction when a node is being added/removed AND the
>>> -         * same node has been added/removed outside the transaction in
>>> -         * parallel, the resulting number of nodes will be wrong. This
>>> -         * is no problem, as the transaction will fail due to the
>>> -         * resulting conflict.
>>> -         * In the node remove case the resulting number can be even
>>> -         * negative, which should be avoided.
>>> -         */
>>> -        return max(d->nbentry + ret, 0);
>>> +        return domain_acc_add_chk(d, what, ret, domid);
>>
>> I was going to ask here why we are updating d->acc[what]. However the 
>> function is not doing what I was expecting from the name. You are only 
>> returning the number of entries adjusted.
> 
> Huh?
> 
> In the transaction case acc_add_changed_dom() is updating the value in the
> changed_domain data of the transaction, while in the non-transaction 
> case ...

I was referring to the name of the function domain_acc_add_chk() which 
lead me to think the helper was doing something different. If you rename 
it, then the confusion is removed.

> 
>>
>>>       }
>>> -    d->nbentry += add;
>>> +    d->acc[what] = domain_acc_add_chk(d, what, add, domid);
>>> -    return d->nbentry;
>>> +    return d->acc[what];
> 
> ... the domain data is updated here.
> 
>>>   }
>>>   int domain_nbentry_inc(struct connection *conn, unsigned int domid)
>>>   {
>>> -    return (domain_nbentry_add(conn, domid, 1, false) < 0) ? errno : 0;
>>> +    return (domain_acc_add(conn, domid, ACC_NODES, 1, false) < 0)
>>> +           ? errno : 0;
>>>   }
>>>   int domain_nbentry_dec(struct connection *conn, unsigned int domid)
>>>   {
>>> -    return (domain_nbentry_add(conn, domid, -1, true) < 0) ? errno : 0;
>>> +    return (domain_acc_add(conn, domid, ACC_NODES, -1, true) < 0)
>>> +           ? errno : 0;
>>>   }
>>>   int domain_nbentry_fix(unsigned int domid, int num, bool update)
>>>   {
>>>       int ret;
>>> -    ret = domain_nbentry_add(NULL, domid, update ? num : 0, update);
>>> +    ret = domain_acc_add(NULL, domid, ACC_NODES, update ? num : 0, 
>>> update);
>>>       if (ret < 0 || update)
>>>           return ret;
>>>       return domid_is_unprivileged(domid) ? ret + num : 0;
>>>   }
>>> -int domain_nbentry(struct connection *conn)
>>> +unsigned int domain_nbentry(struct connection *conn)
>>>   {
>>>       return domain_is_unprivileged(conn)
>>> -           ? domain_nbentry_add(conn, conn->id, 0, true) : 0;
>>> +           ? domain_acc_add(conn, conn->id, ACC_NODES, 0, true) : 0;
>>>   }
>>>   static bool domain_chk_quota(struct domain *domain, int mem)
>>> @@ -1597,7 +1610,7 @@ static int domain_check_acc_init_sub(const void 
>>> *k, void *v, void *arg)
>>>        * If everything is correct incrementing the value for each 
>>> node will
>>>        * result in dom->nodes being 0 at the end.
>>>        */
>>> -    dom->nodes = -d->nbentry;
>>> +    dom->nodes = -d->acc[ACC_NODES];
>>>       if (!hashtable_insert(domains, &dom->domid, dom)) {
>>>           talloc_free(dom);
>>> @@ -1652,7 +1665,7 @@ static int domain_check_acc_cb(const void *k, 
>>> void *v, void *arg)
>>>       if (!d)
>>>           return 0;
>>> -    d->nbentry += dom->nodes;
>>> +    d->acc[ACC_NODES] += dom->nodes;
>>>       return 0;
>>>   }
>>> diff --git a/tools/xenstore/xenstored_domain.h 
>>> b/tools/xenstore/xenstored_domain.h
>>> index 6a2b76a85b..8259c114b0 100644
>>> --- a/tools/xenstore/xenstored_domain.h
>>> +++ b/tools/xenstore/xenstored_domain.h
>>> @@ -21,7 +21,8 @@
>>>   enum accitem {
>>>       ACC_NODES,
>>> -    ACC_TR_N    /* Number of elements per transaction and domain. */
>>> +    ACC_TR_N,        /* Number of elements per transaction and 
>>> domain. */
>>
>> The churn here could have been avoided if you add a "," even for the 
>> edn element and properly indented the comment in the original patch.
> 
> Okay.
> 
>>
>> Also, was the comment indented to be updated to remove "and domain"?
> 
> No, the new indentation was meant to keep the comment start aligned with
> the one of the following line.

Sorry, I meant "intended" rather than "indented".

Cheers,

-- 
Julien Grall

