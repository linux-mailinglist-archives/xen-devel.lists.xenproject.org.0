Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF024DE13E
	for <lists+xen-devel@lfdr.de>; Fri, 18 Mar 2022 19:40:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.292197.496290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVHWX-0006jA-E9; Fri, 18 Mar 2022 18:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 292197.496290; Fri, 18 Mar 2022 18:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nVHWX-0006gA-Ai; Fri, 18 Mar 2022 18:40:29 +0000
Received: by outflank-mailman (input) for mailman id 292197;
 Fri, 18 Mar 2022 18:40:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nVHWW-0006g4-64
 for xen-devel@lists.xenproject.org; Fri, 18 Mar 2022 18:40:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVHWV-0008Ji-Q4; Fri, 18 Mar 2022 18:40:27 +0000
Received: from [54.239.6.185] (helo=[192.168.15.239])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nVHWV-0007mu-I7; Fri, 18 Mar 2022 18:40:27 +0000
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
	bh=RNhdKMhsb6YK60CTOWVrvwGk8lHohu7HpXO5h+Dc+To=; b=GLNXIF2gMFC1wdkYis4PVUHCax
	VcdyajX7dMMjwTf4QkR1ZhfdZoNG3vTfms9em2+J1D4aRMNusfN0tgcncx7sqQ5wVnGBu5YV5XO8M
	ZXZnqTfb+7afRBU3I9WE+7i+mioPbTkE1ZjxWusEylqJtizE43jd5HFxMqrLPhx9h6RQ=;
Message-ID: <110ecc17-4d36-c5d1-675b-a4e072ea0ee0@xen.org>
Date: Fri, 18 Mar 2022 18:40:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] tools/xenstore: add documentation for new
 set/get-feature commands
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220316161017.3579-1-jgross@suse.com>
 <20220316161017.3579-2-jgross@suse.com>
 <d44b8e44-4e7e-c395-da9c-916ec641a687@xen.org>
 <96c31b21-3f96-4f17-07d6-64c7186ce2dd@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <96c31b21-3f96-4f17-07d6-64c7186ce2dd@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 17/03/2022 11:19, Juergen Gross wrote:
> On 17.03.22 12:07, Julien Grall wrote:
>> On 16/03/2022 16:10, Juergen Gross wrote:
>>> Add documentation for two new Xenstore wire commands SET_FEATURE and
>>> GET_FEATURE used to set or query the Xenstore features visible in the
>>> ring page of a given domain.
>>>
>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>> ---
>>>   docs/misc/xenstore-ring.txt |  1 +
>>>   docs/misc/xenstore.txt      | 12 ++++++++++++
>>>   2 files changed, 13 insertions(+)
>>>
>>> diff --git a/docs/misc/xenstore-ring.txt b/docs/misc/xenstore-ring.txt
>>> index f91accb5b0..bd000f694e 100644
>>> --- a/docs/misc/xenstore-ring.txt
>>> +++ b/docs/misc/xenstore-ring.txt
>>> @@ -68,6 +68,7 @@ Mask    Description
>>
>> I find a bit odd we describe the feature in term of mask rather bit. 
>> This will get more difficult to read as we add more bits.
> 
> Maybe this is in order to avoid big/little endian issues (which bit is
> bit 0?)

Both end have to talk the same endianess. Otherwise, one may read the 
wrong value.

So long they are using the same endianess, bit 0 is not going to be matter.

>>>   The "Connection state" field is used to request a ring close and 
>>> reconnect.
>>>   The "Connection state" field only contains valid data if the server 
>>> has
>>> diff --git a/docs/misc/xenstore.txt b/docs/misc/xenstore.txt
>>> index ea3d8be177..31e3d53c52 100644
>>> --- a/docs/misc/xenstore.txt
>>> +++ b/docs/misc/xenstore.txt
>>> @@ -332,6 +332,18 @@ SET_TARGET        <domid>|<tdomid>|
>>>       xenstored prevents the use of SET_TARGET other than by dom0.
>>> +GET_FEATURE        <domid>|        <value>|
>>
>> Did you indented to add many spaces before <value>?
>>
>>> +SET_FEATURE        <domid>|<value>|
>>> +    Returns or sets the contents of the "feature" field located at
>>> +    offset 2064 of the Xenstore ring page of the domain specified by
>>> +    <domid>. <value> is a decimal number being a logical or of the
>>> +    feature bits as defined in docs/misc/xenstore-ring.txt. Trying
>>> +    to set a bit for a feature not being supported by the running
>>> +    Xenstore will be denied.
>> How will the caller know which feature is supported? Also, what happen 
>> if a client decided to overwrite 'feature'? Could the result 
>> potentially prevent migration/liveupdate or else?
> 
> The caller could use "GET_FEATURE 0" to see the available features, 
> assuming
> that nobody would have changed dom0's features.
> 
> I'm not sure whether we should prevent dom0's features to be overwritten.

I think it would be better to have a separate "domid" (maybe "server" or 
"global") to retrieve features supported by the server.

This would give us some flexibility to update dom0 features in the 
future if the needs arise (the first implementation may forbid it).

Cheers,

-- 
Julien Grall

