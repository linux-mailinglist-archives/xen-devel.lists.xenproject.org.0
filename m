Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA1869EA5A
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 23:42:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499196.770244 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUbLL-0004Dy-Nr; Tue, 21 Feb 2023 22:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499196.770244; Tue, 21 Feb 2023 22:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUbLL-0004Bn-Kr; Tue, 21 Feb 2023 22:42:39 +0000
Received: by outflank-mailman (input) for mailman id 499196;
 Tue, 21 Feb 2023 22:42:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pUbLK-0004Bh-NR
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 22:42:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUbLJ-0006zv-Sx; Tue, 21 Feb 2023 22:42:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pUbLJ-0001cJ-O3; Tue, 21 Feb 2023 22:42:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=PfEg1fMfXnnEetfIB7XGPVKIr8vDaNbxhGpoEd0ZMZI=; b=COfpxK4CRWsDk8KfGZRpM0C6rD
	tqja7xKnvNcrJm5COl+Cf6KhOOGLBYhsUOZb7hvxOI7srpcQzhn5nZEKJJ/0HjrWT/nWdiJ1fhwqn
	voADAStmLsxIcJVXQz4t5zaFDmGBT/50riGAFmE+EDiYSXOu4EnGajt53V+nuMVVDUZs=;
Message-ID: <6b9b0afc-da89-6f6f-859f-c8f7ae0be972@xen.org>
Date: Tue, 21 Feb 2023 22:42:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-5-jgross@suse.com>
 <e35bb9f8-2bc8-66b3-6fd8-1b2473f9daef@xen.org>
 <66e2bbb2-b244-77c7-d6bf-21d037ddaac9@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v2 04/13] tools/xenstore: add framework to commit
 accounting data on success only
In-Reply-To: <66e2bbb2-b244-77c7-d6bf-21d037ddaac9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 21/02/2023 08:37, Juergen Gross wrote:
> On 20.02.23 23:50, Julien Grall wrote:
>>> +        list_del(&cd->list);
>>> +        talloc_free(cd);
>>> +    }
>>> +}
>>> +
>>> +void acc_commit(struct connection *conn)
>>> +{
>>> +    struct changed_domain *cd;
>>> +    struct buffered_data *in = conn->in;
>>> +    enum accitem what;
>>> +
>>> +    conn->in = NULL; /* Avoid recursion. */
>>
>> I am not sure I understand this comment. Can you provide more details 
>> where the recursion would happen?
> 
> domain_acc_add() might do temporary accounting if conn->in isn't NULL.

I am confused. To me recursion means the function (or the caller) will 
call itself. But here you seem to say you just want to avoid temporary 
accounting.

What did I miss?

> 
>>
>>> +    while ((cd = list_top(&conn->acc_list, struct changed_domain, 
>>> list))) {
>>
>> NIT: You could use list_for_each_safe();
> 
> Like above.
> 
>>
>>> +        list_del(&cd->list);
>>> +        for (what = 0; what < ACC_REQ_N; what++)
>>
>> There is a chance that some compiler will complain about this line 
>> because ACC_REQ_N = 0. So this would always be true. Therefore...
> 
> Huh? It would always be false.

Yes false sorry. This doesn't change about the potential (temporary) 
warning.

> 
>>
>>> +            if (cd->acc[what])
>>> +                domain_acc_add(conn, cd->domid, what,
>>> +                           cd->acc[what], true);
>>> +
>>> +        talloc_free(cd);
>>> +    }
>>> +
>>> +    conn->in = in;
>>> +}
>>> +
>>>   int domain_nbentry_inc(struct connection *conn, unsigned int domid)
>>>   {
>>>       return (domain_acc_add(conn, domid, ACC_NODES, 1, false) < 0)
>>> diff --git a/tools/xenstore/xenstored_domain.h 
>>> b/tools/xenstore/xenstored_domain.h
>>> index 8259c114b0..cd85bd0cad 100644
>>> --- a/tools/xenstore/xenstored_domain.h
>>> +++ b/tools/xenstore/xenstored_domain.h
>>> @@ -20,7 +20,8 @@
>>>   #define _XENSTORED_DOMAIN_H
>>>   enum accitem {
>>> -    ACC_NODES,
>>> +    ACC_REQ_N,       /* Number of elements per request and domain. */
>>> +    ACC_NODES = ACC_REQ_N,
>>
>> I would bring forward the change in patch #5. I mean:
>>
>> ACC_NODES,
>> ACC_REQ_N
> 
> I'm not sure this is a good idea. This would activate the temporary
> accounting for nodes, but keeping the error handling active. I'd rather
> activate temporary accounting for nodes together with removing the
> accounting correction in the error handling.

I am not sure I fully understand what you would rather do. Can you clarify?

> 
>>
>>>       ACC_TR_N,        /* Number of elements per transaction and 
>>> domain. */
>>>       ACC_N = ACC_TR_N /* Number of elements per domain. */
>>>   };
>>
>> This enum is getting extremely confusing. There are many "number of 
>> elements per ... domain". Can you clarify?
> 
> I will add some more comments to the header. Would you like it better to 
> have
> the limits indented more? something like:

I am afraid it doesn't help understanding the comment. For instance,

> 
> enum accitem {
>          ACC_NODES,
>          /* Number of elements per request and domain. */

you wrote "per request and domain" here. But...

>          ACC_REQ_N,
>          /* Number of elements per transaction and domain. */

... here this is "per transaction and domain". Should not nbe "elements 
per transaction"? And if not, then why don't we had "per request, 
transaction and domain" above?

>              ACC_TR_N = ACC_REQ_N,
>          ACC_WATCH = ACC_TR_N,
>          ACC_OUTST,
>          ACC_MEM,
>          ACC_TRANS,
>          ACC_TRANSNODES,
>          ACC_NPERM,
>          ACC_PATHLEN,
>          ACC_NODESZ,
>          /* Number of elements per domain. */
>              ACC_N
> };
> 
> 
> Juergen
> 

Cheers,

-- 
Julien Grall

