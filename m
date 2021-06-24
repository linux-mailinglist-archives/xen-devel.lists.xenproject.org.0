Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 205833B2A8E
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jun 2021 10:42:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.146512.269582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKwK-00073b-2C; Thu, 24 Jun 2021 08:42:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 146512.269582; Thu, 24 Jun 2021 08:42:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwKwJ-00071k-UX; Thu, 24 Jun 2021 08:42:23 +0000
Received: by outflank-mailman (input) for mailman id 146512;
 Thu, 24 Jun 2021 08:42:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lwKwI-00070p-Dc
 for xen-devel@lists.xenproject.org; Thu, 24 Jun 2021 08:42:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwKwH-0004CN-3y; Thu, 24 Jun 2021 08:42:21 +0000
Received: from [54.239.6.182] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lwKwG-0005cy-NE; Thu, 24 Jun 2021 08:42:21 +0000
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
	bh=xHGRI+FSO9v4DUEOX5z2V2jLM5FK6T/ILz8VhXK5Cvo=; b=18OQGyg+P068HG+t2Qnj6FQ27F
	EfxYXuaaJTAsYdZquf1oLSoNv3m+FXfME2bwNAJEOfMG7awLXDsr9gF+9Dco4/sidv1nX6egdog51
	Nn2ryq6scuERL1jAyOVrsKbffot8G4JV6EGRFc5U72+W8VtihmfSIvUOaKsUXEiKHlqE=;
Subject: Re: [PATCH 08/10] tools/xenstored: Extend restore code to handle
 multiple input buffer
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: raphning@amazon.co.uk, doebel@amazon.de, Julien Grall
 <jgrall@amazon.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210616144324.31652-1-julien@xen.org>
 <20210616144324.31652-9-julien@xen.org>
 <444688a1-180f-7cf3-3461-0001030471d4@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c6ad91cd-f531-5c19-e246-bb8c4ce304f2@xen.org>
Date: Thu, 24 Jun 2021 10:42:17 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <444688a1-180f-7cf3-3461-0001030471d4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 24/06/2021 10:30, Juergen Gross wrote:
> On 16.06.21 16:43, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, the restore code is considering the stream will contain at
>> most one in-flight request per connection. In a follow-up changes, we
>> will want to transfer multiple in-flight requests.
>>
>> The function read_state_buffered() is now extended to restore multiple
>> in-flight request. Complete requests will be queued as delayed
>> requests, if there a partial request (only the last one can) then it
>> will used as the current in-flight request.
>>
>> Note that we want to bypass the quota check for delayed requests as
>> the new Xenstore may have a lower limit.
>>
>> Lastly, there is no need to change the specification as there was
>> no restriction on the number of in-flight requests preserved.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   tools/xenstore/xenstored_core.c | 56 ++++++++++++++++++++++++++++-----
>>   1 file changed, 48 insertions(+), 8 deletions(-)
>>
>> diff --git a/tools/xenstore/xenstored_core.c 
>> b/tools/xenstore/xenstored_core.c
>> index a5084a5b173d..5b7ab7f74013 100644
>> --- a/tools/xenstore/xenstored_core.c
>> +++ b/tools/xenstore/xenstored_core.c
>> @@ -1486,6 +1486,10 @@ static void process_message(struct connection 
>> *conn, struct buffered_data *in)
>>       enum xsd_sockmsg_type type = in->hdr.msg.type;
>>       int ret;
>> +    /* At least send_error() and send_reply() expects conn->in == in */
>> +    assert(conn->in == in);
>> +    trace_io(conn, in, 0);
>> +
>>       if ((unsigned int)type >= XS_TYPE_COUNT || !wire_funcs[type].func) 
> {
>>           eprintf("Client unknown operation %i", type);
>>           send_error(conn, ENOSYS);
>> @@ -1515,6 +1519,23 @@ static void process_message(struct connection 
>> *conn, struct buffered_data *in)
>>       conn->transaction = NULL;
>>   }
>> +static bool process_delayed_message(struct delayed_request *req)
>> +{
>> +    struct connection *conn = req->data;
>> +    struct buffered_data *saved_in = conn->in;
>> +
>> +    /*
>> +     * Part of process_message() expects conn->in to contains the
>> +     * processed response. So save the current conn->in and restore it
>> +     * afterwards.
>> +     */
>> +    conn->in = req->in;
>> +    process_message(req->data, req->in);
>> +    conn->in = saved_in;
> 
> This pattern was added to do_lu_start() already, and it will be needed
> for each other function being called via call_delayed().
> 
> Maybe it would be better to add conn explicitly to struct
> delayed_request (or even better: replace data with conn) and to do the
> conn->in saving/setting/restoring in call_delayed() instead?

This was my original approach, but I abandoned it because in the case of 
do_lu_start() we need to save the original conn->in in the stream (see 
patch #3 for more details).

If we overwrite conn->in in call_delayed(), then we need a different way 
to find the original conn->in. I couldn't find a nice way and decided to 
settle with the duplication.

Cheers,

-- 
Julien Grall

