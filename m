Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4914E6717DB
	for <lists+xen-devel@lfdr.de>; Wed, 18 Jan 2023 10:36:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480279.744583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4rT-0005Hc-AL; Wed, 18 Jan 2023 09:36:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480279.744583; Wed, 18 Jan 2023 09:36:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pI4rT-0005Ec-79; Wed, 18 Jan 2023 09:36:03 +0000
Received: by outflank-mailman (input) for mailman id 480279;
 Wed, 18 Jan 2023 09:36:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pI4rR-0005EW-1v
 for xen-devel@lists.xenproject.org; Wed, 18 Jan 2023 09:36:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4rP-0004Di-FJ; Wed, 18 Jan 2023 09:35:59 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.8.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pI4rP-0004ad-9L; Wed, 18 Jan 2023 09:35:59 +0000
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
	bh=H1hgDy4AfKuWUzb0zgNMufYxhgUwr8h1m9ssmbzrHJc=; b=b9h9jK91lcUWZv/SPCs+Rq1hK0
	hftG/PgJcNhf+vBgsNVMWo8SBIYf3WQUKY1GWN4t7JLJVkDnAcenmvj1X8JtPqcuvvTXMyV86DTnR
	gPZ1EuWyv0K+2K4r3qAP69c/xPAKJA9PlwpJ7d9ryXD+O5LNBMXyh5ar2cXsR9mB5TYg=;
Message-ID: <449dae4d-c19c-87be-88ef-aa3ff79f1a23@xen.org>
Date: Wed, 18 Jan 2023 09:35:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 16/17] tools/xenstore: let check_store() check the
 accounting data
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230117091124.22170-1-jgross@suse.com>
 <20230117091124.22170-17-jgross@suse.com>
 <17595b1f-1523-9526-85da-99b9300f3218@xen.org>
 <c541fcd7-a829-f757-c949-1b4a089ac6c3@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c541fcd7-a829-f757-c949-1b4a089ac6c3@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 18/01/2023 06:23, Juergen Gross wrote:
> On 17.01.23 23:36, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 17/01/2023 09:11, Juergen Gross wrote:
>>> Today check_store() is only testing the correctness of the node tree.
>>>
>>> Add verification of the accounting data (number of nodes)  and correct
>>
>> NIT: one too many space before 'and'.
>>
>>> the data if it is wrong.
>>>
>>> Do the initial check_store() call only after Xenstore entries of a
>>> live update have been read.
>>
>> Can you clarify whether this is needed for the rest of the patch, or 
>> simply a nice thing to have in general?
> 
> I'll add: "This is wanted to make sure the accounting data is correct after
> a live update."

Fine with me.

> 
>>
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   tools/xenstore/xenstored_core.c   | 62 ++++++++++++++++------
>>>   tools/xenstore/xenstored_domain.c | 86 +++++++++++++++++++++++++++++++
>>>   tools/xenstore/xenstored_domain.h |  4 ++
>>>   3 files changed, 137 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_core.c 
>>> b/tools/xenstore/xenstored_core.c
>>> index 3099077a86..e201f14053 100644
>>> --- a/tools/xenstore/xenstored_core.c
>>> +++ b/tools/xenstore/xenstored_core.c
>>> @@ -2389,8 +2389,6 @@ void setup_structure(bool live_update)
>>>           manual_node("@introduceDomain", NULL);
>>>           domain_nbentry_fix(dom0_domid, 5, true);
>>>       }
>>> -
>>> -    check_store();
>>>   }
>>>   static unsigned int hash_from_key_fn(void *k)
>>> @@ -2433,20 +2431,28 @@ int remember_string(struct hashtable *hash, 
>>> const char *str)
>>>    * As we go, we record each node in the given reachable hashtable.  
>>> These
>>>    * entries will be used later in clean_store.
>>>    */
>>> +
>>> +struct check_store_data {
>>> +    struct hashtable *reachable;
>>> +    struct hashtable *domains;
>>> +};
>>> +
>>>   static int check_store_step(const void *ctx, struct connection *conn,
>>>                   struct node *node, void *arg)
>>>   {
>>> -    struct hashtable *reachable = arg;
>>> +    struct check_store_data *data = arg;
>>> -    if (hashtable_search(reachable, (void *)node->name)) {
>>> +    if (hashtable_search(data->reachable, (void *)node->name)) {
>>
>> IIUC the cast is only necessary because hashtable_search() expects a 
>> non-const value. I can't think for a reason for the key to be 
>> non-const. So I will look to send a follow-up patch.
> 
> It is possible, but nasty, due to talloc_free() not taking a const pointer.

I am not sure I understand your reasoning. Looking at 
hashtable_search(), I don't see a call to talloc_free().

Anyway, this is not directly related to this patch. So I will have a 
look separately.

Cheers,

-- 
Julien Grall

