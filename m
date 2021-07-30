Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2193B3DBBD7
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jul 2021 17:14:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.162594.298132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9UCG-0007Vd-U4; Fri, 30 Jul 2021 15:13:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 162594.298132; Fri, 30 Jul 2021 15:13:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m9UCG-0007Ti-QZ; Fri, 30 Jul 2021 15:13:12 +0000
Received: by outflank-mailman (input) for mailman id 162594;
 Fri, 30 Jul 2021 15:13:11 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m9UCF-0007Sr-HJ
 for xen-devel@lists.xenproject.org; Fri, 30 Jul 2021 15:13:11 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m9UCD-0005IE-A1; Fri, 30 Jul 2021 15:13:09 +0000
Received: from 54-240-197-230.amazon.com ([54.240.197.230]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m9UCD-0002Yl-1Z; Fri, 30 Jul 2021 15:13:09 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=vhTbPeZFRrDcvsRQddWeO+kARioyLCWBCRabXZxJagc=; b=iuje+5YkzvURmjtFqMyCShT6zk
	KABClT//aU44daxnoHRaP0L+cqQJsf0YLf2zEEmeB95moryUsBJvWOspoMQkCBz9+q9PEipxgEb7A
	PNQYU40ArBccyzSMT2FsMwq5prKnQIW/y33S5LjmR3zI5V7GOKrP71Vrbo0B6/8Dx17A=;
Subject: Re: [PATCH] tools/xenstored: Don't assume errno will not be
 overwritten in lu_arch()
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <20210729110647.25500-1-julien@xen.org>
 <bbdbc7a9-c82e-2656-6a03-553ff55a2101@xen.org>
 <3f3843c0-5766-b483-ce25-33fe2d4359ca@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bd811ae4-a355-f8fd-f61a-88ea895f5385@xen.org>
Date: Fri, 30 Jul 2021 16:13:07 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <3f3843c0-5766-b483-ce25-33fe2d4359ca@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 30/07/2021 09:40, Juergen Gross wrote:
> On 29.07.21 17:23, Julien Grall wrote:
>>
>>
>> On 29/07/2021 12:06, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> At the moment, do_control_lu() will set errno to 0 before calling
>>> lu_arch() and then check errno. The expectation is nothing in lu_arch()
>>> will change the value unless there is an error.
>>>
>>> However, per errno(3), a function that succeeds is allowed to change
>>> errno. In fact, syslog() will overwrite errno if the logs are rotated
>>> at the time it is called.
>>>
>>> To prevent any further issue, errno is now always set before
>>> returning NULL.
>>>
>>> Additionally, errno is only checked when returning NULL so the client
>>> can see the error message if there is any.
>>>
>>> Reported-by: Michael Kurth <mku@amazon.com>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>> ---
>>>   tools/xenstore/xenstored_control.c | 5 +++--
>>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_control.c 
>>> b/tools/xenstore/xenstored_control.c
>>> index 6b68b79faac7..6fcb42095b59 100644
>>> --- a/tools/xenstore/xenstored_control.c
>>> +++ b/tools/xenstore/xenstored_control.c
>>> @@ -324,6 +324,7 @@ static const char *lu_binary_alloc(const void 
>>> *ctx, struct connection *conn,
>>>       lu_status->kernel_size = size;
>>>       lu_status->kernel_off = 0;
>>> +    errno = 0;
>>>       return NULL;
>>>   }
>>> @@ -339,6 +340,7 @@ static const char *lu_binary_save(const void 
>>> *ctx, struct connection *conn,
>>>       memcpy(lu_status->kernel + lu_status->kernel_off, data, size);
>>>       lu_status->kernel_off += size;
>>> +    errno = 0;
>>>       return NULL;
>>>   }
>>
>> I forgot to update lu_binary(). I will respin the patch once I get 
>> some feedback.
> 
> With setting errno to 0 before returning NULL in lu_binary() you can add
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Thanks! I will commit it.

Cheers,

-- 
Julien Grall

