Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A06356F09E7
	for <lists+xen-devel@lfdr.de>; Thu, 27 Apr 2023 18:33:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.527042.819207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps4Xw-0001BU-4Z; Thu, 27 Apr 2023 16:32:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 527042.819207; Thu, 27 Apr 2023 16:32:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ps4Xw-00019I-1f; Thu, 27 Apr 2023 16:32:40 +0000
Received: by outflank-mailman (input) for mailman id 527042;
 Thu, 27 Apr 2023 16:32:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ps4Xu-00019C-LZ
 for xen-devel@lists.xenproject.org; Thu, 27 Apr 2023 16:32:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ps4Xt-0001SH-5u; Thu, 27 Apr 2023 16:32:37 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.9.197]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ps4Xs-0007sf-V4; Thu, 27 Apr 2023 16:32:37 +0000
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
	bh=N9FCVVVUvS/22Enw+WdvB2BsaYVQCQjox23NKf05Z4c=; b=dmhIiqgLcQQEI6eQsDJ6eCw3vX
	/ZfA1WusHjRNApZCdUg6g/2FESpZ1X9V3rNaVqRMlHnlgr1xEDxRkuvBJs5r6c4GScS9L59JJZaal
	nU87PqlT6+PYouXAL0vFj1XWtN/2qFH/KHvXjAI6dP25yYkRu8PLVHoFruXpb5QcT4w4=;
Message-ID: <89cbdd73-29e5-f158-4058-668048a0ca60@xen.org>
Date: Thu, 27 Apr 2023 17:32:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v4 04/13] tools/xenstore: add framework to commit
 accounting data on success only
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230405070349.25293-1-jgross@suse.com>
 <20230405070349.25293-5-jgross@suse.com>
 <e8003d2d-5557-f5d9-38ca-793c30637e61@xen.org>
 <cb57a654-a766-5354-a122-989f43b440d5@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cb57a654-a766-5354-a122-989f43b440d5@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 26/04/2023 08:08, Juergen Gross wrote:
> On 25.04.23 19:52, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 05/04/2023 08:03, Juergen Gross wrote:
>>> Instead of modifying accounting data and undo those modifications in
>>> case of an error during further processing, add a framework for
>>> collecting the needed changes and commit them only when the whole
>>> operation has succeeded.
>>>
>>> This scheme can reuse large parts of the per transaction accounting.
>>> The changed_domain handling can be reused, but the array size of the
>>> accounting data should be possible to be different for both use cases.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>> V3:
>>> - call acc_commit() earlier (Julien Grall)
>>> - add assert() to acc_commit()
>>> - use fixed sized acc array in struct changed_domain (Julien Grall)
>>> ---
>>>   tools/xenstore/xenstored_core.c   |  9 ++++--
>>>   tools/xenstore/xenstored_core.h   |  3 ++
>>>   tools/xenstore/xenstored_domain.c | 53 ++++++++++++++++++++++++++++++-
>>>   tools/xenstore/xenstored_domain.h |  5 ++-
>>>   4 files changed, 66 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tools/xenstore/xenstored_core.c 
>>> b/tools/xenstore/xenstored_core.c
>>> index 3ca68681e3..84335f5f3d 100644
>>> --- a/tools/xenstore/xenstored_core.c
>>> +++ b/tools/xenstore/xenstored_core.c
>>> @@ -1023,6 +1023,9 @@ static void send_error(struct connection *conn, 
>>> int error)
>>>               break;
>>>           }
>>>       }
>>> +
>>> +    acc_drop(conn);
>>> +
>>>       send_reply(conn, XS_ERROR, xsd_errors[i].errstring,
>>>                 strlen(xsd_errors[i].errstring) + 1);
>>>   }
>>> @@ -1034,6 +1037,9 @@ void send_reply(struct connection *conn, enum 
>>> xsd_sockmsg_type type,
>>>       assert(type != XS_WATCH_EVENT);
>>> +    conn->in = NULL;
>>
>> AFAIU, you are setting conn->in to NULL in order to please..
>>
>>> +    acc_commit(conn);
>>
>> ... this call. However in case of an error like...
>>
>>> +
>>>       if ( len > XENSTORE_PAYLOAD_MAX ) { >           
>>> send_error(conn, E2BIG);
>>
>> ... here, send_reply() will be called again. But the error will not be 
>> set because conn->in is NULL.
>>
>> So I think you want to restore conn->in rewrite acc_commit(). The 
>> ordering would also deserve an explanation in a comment.
> 
> Just to make sure I understand you correctly (I have some difficulties
> parsing "So I think you want to restore conn->in rewrite acc_commit()."
> completely):

Hmmm... Not sure why I wrote "rewrite". I was meant to say that you want 
to restore conn->in after acc_commit() is called.

> 
> You are suggesting to move setting conn->in to NULL to acc_commit() and
> to restore it before returning? I'm fine with that.

Either that or what I wrote above. It depends on whether you expect 
other caller to be in the same situation.

> 
>>
>>>           return;
>>> @@ -1059,8 +1065,6 @@ void send_reply(struct connection *conn, enum 
>>> xsd_sockmsg_type type,
>>>           }
>>>       }
>>> -    conn->in = NULL;
>>> -
>>>       /* Update relevant header fields and fill in the message body. */
>>>       bdata->hdr.msg.type = type;
>>>       bdata->hdr.msg.len = len;
>>> @@ -2195,6 +2199,7 @@ struct connection *new_connection(const struct 
>>> interface_funcs *funcs)
>>>       new->is_stalled = false;
>>>       new->transaction_started = 0;
>>>       INIT_LIST_HEAD(&new->out_list);
>>> +    INIT_LIST_HEAD(&new->acc_list);
>>>       INIT_LIST_HEAD(&new->ref_list);
>>>       INIT_LIST_HEAD(&new->watches);
>>>       INIT_LIST_HEAD(&new->transaction_list);
>>> diff --git a/tools/xenstore/xenstored_core.h 
>>> b/tools/xenstore/xenstored_core.h
>>> index c59b06551f..1f811f38cb 100644
>>> --- a/tools/xenstore/xenstored_core.h
>>> +++ b/tools/xenstore/xenstored_core.h
>>> @@ -139,6 +139,9 @@ struct connection
>>>       struct list_head out_list;
>>>       uint64_t timeout_msec;
>>> +    /* Not yet committed accounting data (valid if in != NULL). */
>>> +    struct list_head acc_list;
>>> +
>>>       /* Referenced requests no longer pending. */
>>>       struct list_head ref_list;
>>> diff --git a/tools/xenstore/xenstored_domain.c 
>>> b/tools/xenstore/xenstored_domain.c
>>> index 30fb9acec6..144cbafb73 100644
>>> --- a/tools/xenstore/xenstored_domain.c
>>> +++ b/tools/xenstore/xenstored_domain.c
>>> @@ -91,6 +91,8 @@ struct domain
>>>       bool wrl_delay_logged;
>>>   };
>>> +#define ACC_CHD_N (ACC_TR_N < ACC_REQ_N ? ACC_REQ_N : ACC_TR_N)
>>
>> Both ACC_TR_N and ACC_REQ_N are fixed. Can you explain why we need 
>> this magic?
>>
>> Related, wouldn't it be better to define it in the enum?
> 
> I can do that, of course. I just didn't want to make the enum even more
> complex. :-)

My concern is there is a disconnect between the enum and this macro. 
What would happen if we increase the enum past ACC_REQ_N/ACC_TR_N?
Would it be necessary to update ACC_CHD_N?

Cheers,

-- 
Julien Grall

