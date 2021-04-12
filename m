Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B6C35C8A2
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 16:22:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109235.208510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxSZ-0007lK-Id; Mon, 12 Apr 2021 14:22:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109235.208510; Mon, 12 Apr 2021 14:22:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVxSZ-0007ku-Dc; Mon, 12 Apr 2021 14:22:39 +0000
Received: by outflank-mailman (input) for mailman id 109235;
 Mon, 12 Apr 2021 14:22:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVxSX-0007kp-J0
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 14:22:37 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba5b87e3-e254-49a2-8669-c0f616e2480a;
 Mon, 12 Apr 2021 14:22:36 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B712BB02C;
 Mon, 12 Apr 2021 14:22:35 +0000 (UTC)
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
X-Inumbo-ID: ba5b87e3-e254-49a2-8669-c0f616e2480a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618237355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XH/V3lInK/XwDn6SQjsDjTGOJgZr+co93gErvco3TI0=;
	b=iKLsrlz4bj5gnXdW+J/pkQeMkdPpOk7s658mlNKx7Xb+o4Q3eXhZjfin0sOgGn1Mpoe6Cw
	1XCcbN0A+bQk57q4naCNfgGIxyFF0LVRnHIv2TZFV+T/eyyQQp3xC22TVczJjMp9E7t9UC
	LioYvyftsiuLYrxkgbiVoe4JFPpYtjc=
Subject: Re: [PATCH v3 2/4] xen/arm: Handle cases when hardware_domain is NULL
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Rahul Singh <rahul.singh@arm.com>,
 xen-devel@lists.xenproject.org
References: <20210412105243.23354-1-luca.fancellu@arm.com>
 <20210412105243.23354-3-luca.fancellu@arm.com>
 <b1242714-e5f3-1e6b-f1bd-e9e53326fda7@suse.com>
 <9A775115-36A9-418F-B945-A778DE98672F@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <240cccb2-cf37-d01f-8861-1a5e8c21409d@suse.com>
Date: Mon, 12 Apr 2021 16:22:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <9A775115-36A9-418F-B945-A778DE98672F@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.04.2021 15:58, Luca Fancellu wrote:
> 
> 
>> On 12 Apr 2021, at 12:03, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 12.04.2021 12:52, Luca Fancellu wrote:
>>> --- a/xen/include/xen/sched.h
>>> +++ b/xen/include/xen/sched.h
>>> @@ -1022,6 +1022,9 @@ static always_inline bool is_hardware_domain(const struct domain *d)
>>>     if ( IS_ENABLED(CONFIG_PV_SHIM_EXCLUSIVE) )
>>>         return false;
>>>
>>> +    if ( !d )
>>> +        return false;
>>> +
>>>     return evaluate_nospec(d == hardware_domain);
>>> }
>>
>> On v2 I did say on the respective code that was here (and my
>> suggestion of this alternative adjustment): "Can you point out
>> code paths where d may actually be NULL, and where [...] would
>> not behave as intended (i.e. where bad speculation would
>> result)?"
>>
>> Since you've taken the suggestion as-is, and since the commit
>> message says nothing in either direction here, did you actually
>> verify that there's no abuse of speculation possible with this
>> extra return path? And did you find any caller at all which may
>> pass NULL into here?
> 
> Hi Jan,
> 
> I’ve analysed the code and seems that there are no path that calls 
> Is_hardware_domain() with a NULL domain, however I found this
> function in xen/arch/arm/irq.c:
> 
> bool irq_type_set_by_domain(const struct domain *d)
> {
>     return is_hardware_domain(d);
> }
> 
> That is calling directly is_hardware_domain and it is global.
> It can be the case that a future code can call irq_type_set_by_domain
> potentially with a null domain...

I don't think that a function being global (or not) matters here. This
might be different in an environment like Linux, where modules may
also call functions, and where guarding against NULL might be desirable
in certain cases.

> I introduced a check for the domain for that reason, do you think that
> maybe it’s better to put that check on the irq_type_set_by_domain instead?

If there's a specific reason to have a guard here, then it should be
here, yes. As per above I would think though that if there's no
present reason to check for NULL, such a check would best be omitted.
We don't typically check internal function arguments like this, after
all.

Jan

