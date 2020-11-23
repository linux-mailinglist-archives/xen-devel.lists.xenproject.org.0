Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 247112C18B5
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 23:49:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35240.66670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKeI-0002bd-Ux; Mon, 23 Nov 2020 22:49:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35240.66670; Mon, 23 Nov 2020 22:49:30 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khKeI-0002bE-Re; Mon, 23 Nov 2020 22:49:30 +0000
Received: by outflank-mailman (input) for mailman id 35240;
 Mon, 23 Nov 2020 22:49:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1khKeH-0002b9-5b
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:49:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khKeG-0004Z9-2A; Mon, 23 Nov 2020 22:49:28 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1khKeF-0005zt-R4; Mon, 23 Nov 2020 22:49:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khKeH-0002b9-5b
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 22:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=5MNW1inTob+ISExQ5qkJRx9m4GK2Yllrafe4Wg6R6aU=; b=K6Xx+Q7ux+tNHwU1Cjnerz6ggG
	s+mJtj/tIDzGZFalWyRYdZ+RtI4nb10dMLxszsDHcT7c1JJ7rrMjfhfLTUVnvEprulmWUuCvKKzcQ
	xPPzv0TgVfwPcZbq4PBUmd/4DBLzwjFdtTyeSMXA6qV5CGA+UwU8ZHenB8MhNtePq80o=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khKeG-0004Z9-2A; Mon, 23 Nov 2020 22:49:28 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1khKeF-0005zt-R4; Mon, 23 Nov 2020 22:49:27 +0000
Subject: Re: [PATCH v2 7/8] lib: move bsearch code
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <George.Dunlap@eu.citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <87a20884-5a76-a664-dcc9-bd4becee40b3@suse.com>
 <44ffc041-cacd-468e-a835-f5b2048bb201@xen.org>
 <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2419eccf-c696-6aa1-ada4-0f7bd6bc5657@xen.org>
Date: Mon, 23 Nov 2020 22:49:25 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2cf3a90d-f463-41f8-f861-6ef00279b204@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/11/2020 10:27, Jan Beulich wrote:
> On 18.11.2020 19:09, Julien Grall wrote:
>> On 23/10/2020 11:19, Jan Beulich wrote:
>>> --- a/xen/include/xen/compiler.h
>>> +++ b/xen/include/xen/compiler.h
>>> @@ -12,6 +12,7 @@
>>>    
>>>    #define inline        __inline__
>>>    #define always_inline __inline__ __attribute__ ((__always_inline__))
>>> +#define gnu_inline    __inline__ __attribute__ ((__gnu_inline__))
>>
>> bsearch() is only used by Arm and I haven't seen anyone so far
>> complaining about the perf of I/O emulation.
>>
>> Therefore, I am not convinced that there is enough justification to
>> introduce a GNU attribute just for this patch.
> 
> Please settle this with Andrew: He had asked for the function to
> become inline. I don't view making it static inline in the header
> as an option here - if the compiler decides to not inline it, we
> should not end up with multiple instances in different CUs.

That's the cons of static inline... but then why is it suddenly a 
problem with this helper?

> And
> without making it static inline the attribute needs adding; at
> least I'm unaware of an alternative which works with the various
> compiler versions.

The question we have to answer is: What is the gain with this approach?

If it is not quantifiable, then introducing compiler specific attribute 
is not an option.

IIRC, there are only two callers (all in Arm code) of this function. 
Even inlined, I don't believe you would drastically reduce the number of 
instructions compare to a full blown version. To be generous, I would 
say you may save ~20 instructions per copy.

Therefore, so far, the compiler specific attribute doesn't look 
justified to me. As usual, I am happy to be proven wrong.

Cheers,

-- 
Julien Grall

