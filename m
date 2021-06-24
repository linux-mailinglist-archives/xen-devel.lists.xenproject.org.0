Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA08A3B2A31
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 10:19:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146495.269550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKZa-0002n0-JQ; Thu, 24 Jun 2021 08:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146495.269550; Thu, 24 Jun 2021 08:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKZa-0002l4-FN; Thu, 24 Jun 2021 08:18:54 +0000
Received: by outflank-mailman (input) for mailman id 146495;
 Thu, 24 Jun 2021 08:18:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwKZZ-0002ku-A0
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 08:18:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwKZX-0003ov-Rh; Thu, 24 Jun 2021 08:18:51 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwKZX-0003nL-Iy; Thu, 24 Jun 2021 08:18:51 +0000
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
	bh=rX/QwlzLiFLie/fR3XNagqSviXSjY5kaEEmjJgdG688=; b=f1z1ZD1pV0hTEfR+vSJ4Yx31AJ
	AuKNnNVhrrXRwJ3iEaGnJvjWDfanYQ9WpkTVrjcsv3mQKWF0BsCvhkf44TPEPx1mFlnIXyC81UlmZ
	qNpD4Ssf21Xfcf/NjiQD6OzPzOW9LxX45F+TRSQNBasZmWq9QzKfQwkQpbHNLvH7tYhw=;
Subject: Re: [PATCH] tools/xenstored: Don't crash xenstored when Live-Update
 is cancelled
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien GralL
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210617173857.6450-1-julien@xen.org>
 <136d6a10-c93d-accd-fc34-62fbaa4742b0@suse.com>
 <325bf694-a30f-558c-ab84-d8a7a1865cc2@xen.org>
 <bcdad74c-393e-0582-6a26-b9a6f45cb30a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7f252b19-b84e-b4d3-0c3c-976404b00701@xen.org>
Date: Thu, 24 Jun 2021 10:18:49 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <bcdad74c-393e-0582-6a26-b9a6f45cb30a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 24/06/2021 10:17, Juergen Gross wrote:
> On 24.06.21 10:12, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 22/06/2021 11:23, Juergen Gross wrote:
>>> On 17.06.21 19:38, Julien Grall wrote:
>>>> From: Julien GralL <jgrall@amazon.com>
>>>>
>>>> As Live-Update is asynchronous, it is possible to receive a request to
>>>> cancel it (either on the same connection or from a different one).
>>>>
>>>> Currently, this will crash xenstored because do_lu_start() assumes
>>>> lu_status will be valid. This is not the case when Live-Update has been
>>>> cancelled. This will result to dereference a NULL pointer and
>>>> crash Xenstored.
>>>>
>>>> Rework do_lu_start() to check if lu_status is NULL and return an
>>>> error in this case.
>>>>
>>>> Fixes: af216a99fb ("tools/xenstore: add the basic framework for doing 
> 
>>>> the live update")
>>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>>
>>>> ----
>>>>
>>>> This is currently based on top of:
>>>>
>>>> https://lore.kernel.org/xen-devel/20210616144324.31652-1-julien@xen.org
>>>>
>>>> This can be re-ordered if necessary.
>>>> ---
>>>>   tools/xenstore/xenstored_control.c | 15 +++++++++++++--
>>>>   1 file changed, 13 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/tools/xenstore/xenstored_control.c 
>>>> b/tools/xenstore/xenstored_control.c
>>>> index a045f102a420..37a3d39f20b5 100644
>>>> --- a/tools/xenstore/xenstored_control.c
>>>> +++ b/tools/xenstore/xenstored_control.c
>>>> @@ -696,7 +696,18 @@ static bool do_lu_start(struct delayed_request 
>>>> *req)
>>>>       time_t now = time(NULL);
>>>>       const char *ret;
>>>>       struct buffered_data *saved_in;
>>>> -    struct connection *conn = lu_status->conn;
>>>> +    struct connection *conn = req->data;
>>>> +
>>>> +    /*
>>>> +     * Cancellation may have been requested asynchronously. In this
>>>> +     * case, lu_status will be NULL.
>>>> +     */
>>>> +    if (!lu_status) {
>>>> +        ret = "Cancellation was 
> requested";
>>>> +        conn = req->data;
>>>
>>> This will set conn to the same value it already has.
>>
>> Ah yes. I will drop this line.
>>
>> Also, I took the opportunity to replace
>>
>> } else
>>   assert(...)
>>
>> with just
>>
>> assert(...)
>>
>> This should improve a bit the readability. Let me know if you want me 
>> to resend the patch for that.
> 
> I guess you are planning to do the commit?

That's my plan.

> 
> If yes, there is no need for resending the patch.

Thanks!

Cheers,

-- 
Julien Grall

