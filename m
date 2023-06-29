Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1957423E5
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 12:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556755.869504 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEomo-0005is-RF; Thu, 29 Jun 2023 10:22:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556755.869504; Thu, 29 Jun 2023 10:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEomo-0005go-OS; Thu, 29 Jun 2023 10:22:02 +0000
Received: by outflank-mailman (input) for mailman id 556755;
 Thu, 29 Jun 2023 10:22:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEomn-0005gN-J4
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 10:22:01 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEomm-00007u-6j; Thu, 29 Jun 2023 10:22:00 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.2.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEomm-0001mS-10; Thu, 29 Jun 2023 10:22:00 +0000
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
	bh=Ps5o7xaXdLDmJCbMJp7heFX6tMp/kDnQqhHNYBSqqd8=; b=qRfHsj3HIWALIISRg0c6ySiAa3
	tx5HXlxLP7CdAJDHrFaDvlKzpmGz3/zZ3gYmt/v1te7Vw88XYzcJVFK1zp1UkQOqmx7sjWTFT+TC0
	zn3vvH/UrVqUaJLzmgtSjoKwPW/ZbEgCkttpmHv8OMWAF91k1MgIl7FuS5RzuHoK0PxI=;
Message-ID: <bde3a806-2a90-5185-8483-0ec7b8972ca6@xen.org>
Date: Thu, 29 Jun 2023 11:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 04/11] tools/xenstore: rename do_tdb_delete() and change
 parameter type
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230530091333.7678-1-jgross@suse.com>
 <20230530091333.7678-5-jgross@suse.com>
 <e83e226b-7f36-3c1c-90e1-f17483b13db5@xen.org>
 <b600c26e-2aeb-c2cb-9bae-d97422e8efa9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b600c26e-2aeb-c2cb-9bae-d97422e8efa9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 29/06/2023 10:29, Juergen Gross wrote:
> On 20.06.23 13:24, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 30/05/2023 10:13, Juergen Gross wrote:
>>> diff --git a/tools/xenstore/xenstored_core.h 
>>> b/tools/xenstore/xenstored_core.h
>>> index f7cb035f26..7fc6d73e5a 100644
>>> --- a/tools/xenstore/xenstored_core.h
>>> +++ b/tools/xenstore/xenstored_core.h
>>> @@ -358,11 +358,12 @@ extern xengnttab_handle **xgt_handle;
>>>   int remember_string(struct hashtable *hash, const char *str);
>>> +/* Data base access functions. */
>>>   void set_tdb_key(const char *name, TDB_DATA *key);
>>>   int do_tdb_write(struct connection *conn, TDB_DATA *key, TDB_DATA 
>>> *data,
>>>            struct node_account_data *acc, int flag, bool 
>>> no_quota_check);
>>> -int do_tdb_delete(struct connection *conn, TDB_DATA *key,
>>> -          struct node_account_data *acc);
>>> +int db_delete(struct connection *conn, const char *name,
>>> +          struct node_account_data *acc);
>>>   void conn_free_buffered_data(struct connection *conn);
>>> diff --git a/tools/xenstore/xenstored_transaction.c 
>>> b/tools/xenstore/xenstored_transaction.c
>>> index 1646c07040..bf173f3d1d 100644
>>> --- a/tools/xenstore/xenstored_transaction.c
>>> +++ b/tools/xenstore/xenstored_transaction.c
>>> @@ -385,8 +385,7 @@ static int finalize_transaction(struct connection 
>>> *conn,
>>>           /* Entries for unmodified nodes can be removed early. */
>>>           if (!i->modified) {
>>>               if (i->ta_node) {
>>> -                set_tdb_key(i->trans_name, &ta_key);
>>> -                if (do_tdb_delete(conn, &ta_key, NULL))
>>> +                if (db_delete(conn, i->trans_name, NULL))
>>>                       return EIO;
>>>               }
>>>               list_del(&i->list);
>>> @@ -395,21 +394,21 @@ static int finalize_transaction(struct 
>>> connection *conn,
>>>       }
>>>       while ((i = list_top(&trans->accessed, struct accessed_node, 
>>> list))) {
>>> -        set_tdb_key(i->node, &key);
>>
>> It is not clear to me why you are moving later the call to 
>> set_tdb_key() in this patch.
> 
> It is needed in the if () case only now, before the patch the else case
> needed it, too.

If that's the case, then can we also move the declaration to within the 
if case? This would make a bit more obvious that the other branch is not 
meant to use the variable anymore

Cheers,

-- 
Julien Grall

