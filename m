Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4E15578C9
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 13:35:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.354845.582167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4L6p-0002kT-Cb; Thu, 23 Jun 2022 11:34:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 354845.582167; Thu, 23 Jun 2022 11:34:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4L6p-0002hY-96; Thu, 23 Jun 2022 11:34:51 +0000
Received: by outflank-mailman (input) for mailman id 354845;
 Thu, 23 Jun 2022 11:34:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4L6n-0002hS-Id
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 11:34:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4L6m-0003f2-P5; Thu, 23 Jun 2022 11:34:48 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4L6m-0001mj-HG; Thu, 23 Jun 2022 11:34:48 +0000
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
	bh=bK2JAADBh0ne/mDR7Qxe91B6gbBy8QN9GkgXdJZkp40=; b=OW3OLjW1D/8hmyK3Aja3szTgww
	+Hj307KraCgh9djtB/ATBgwbCNx1SWiZvJfTWUlH5Z0XcBRI9GPGTnGkP08Ac5YHf3RzdHD18Povw
	g4gLSrwMB6qUrmKznf1GIZa37soXKwqtT3b4kpcXv0GOlgxi9K/HF+RXvKiHRJkGKkWo=;
Message-ID: <113420b2-816c-1753-6260-04eb0caa4a47@xen.org>
Date: Thu, 23 Jun 2022 12:34:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH] tools/xenstored: Harden corrupt()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <20220623112407.13604-1-julien@xen.org>
 <1168a21d-80be-1a9a-6a7b-7732a7126bf0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1168a21d-80be-1a9a-6a7b-7732a7126bf0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 23/06/2022 12:28, Juergen Gross wrote:
> On 23.06.22 13:24, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> At the moment, corrupt() is neither checking for allocation failure
>> nor freeing the allocated memory.
>>
>> Harden the code by printing ENOMEM if the allocation failed and
>> free 'str' after the last use.
>>
>> This is not considered to be a security issue because corrupt() should
>> only be called when Xenstored thinks the database is corrupted. Note
>> that the trigger (i.e. a guest reliably provoking the call) would be
>> a security issue.
>>
>> Fixes: 06d17943f0cd ("Added a basic integrity checker, and some basic 
>> ability to recover from store")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   tools/xenstore/xenstored_core.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/xenstore/xenstored_core.c 
>> b/tools/xenstore/xenstored_core.c
>> index fa733e714e9a..b6279bdfe229 100644
>> --- a/tools/xenstore/xenstored_core.c
>> +++ b/tools/xenstore/xenstored_core.c
>> @@ -2065,7 +2065,11 @@ void corrupt(struct connection *conn, const 
>> char *fmt, ...)
>>       va_end(arglist);
>>       log("corruption detected by connection %i: err %s: %s",
>> -        conn ? (int)conn->id : -1, strerror(saved_errno), str);
>> +        conn ? (int)conn->id : -1, strerror(saved_errno),
>> +        str ? str : "ENOMEM");
>> +
>> +    if (str)
> 
> No need for the "if". talloc_free() handles NULL quite fine.

In my original approach, I wasn't checking "if (str)" when I looked at 
talloc_free(), I noticed it would return -1 (i.e. the memory wasn't 
freed) when str is NULL.

I also couldn't find any example in Xenstored where talloc_free() would 
be called with NULL. So I felt it was not a good idea to add one because 
talloc_free() technically return a "failure".

That said, I would not strongly argue to keep it. So I am happy to drop 
the check if that's what you want.

> 
>> +        talloc_free(str);
>>       check_store();
>>   }
> 
> With above fixed:
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks!

Cheers,

-- 
Julien Grall

