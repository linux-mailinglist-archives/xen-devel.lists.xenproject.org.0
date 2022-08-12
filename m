Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF47590DEB
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 11:13:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385443.621091 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQj4-0006Ak-Bi; Fri, 12 Aug 2022 09:13:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385443.621091; Fri, 12 Aug 2022 09:13:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMQj4-00067f-7n; Fri, 12 Aug 2022 09:13:06 +0000
Received: by outflank-mailman (input) for mailman id 385443;
 Fri, 12 Aug 2022 09:13:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMQj3-00067Z-7J
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 09:13:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMQj2-0006cJ-Oy; Fri, 12 Aug 2022 09:13:04 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[192.168.11.5])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMQj2-0005eC-G4; Fri, 12 Aug 2022 09:13:04 +0000
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
	bh=u60zPL0tuF0JetpCzSuBeVaBfxAa8EO1qK05Um8qTVo=; b=sGmDPUdgrP2g59rIUKpXQ0N6kX
	EwcXLy6xlnai1SIHQRTKG40YYXp+AxREjWuiGw8b/UL4S7vpW90C7KPfm1Kbgn0ycwgBiYJMrW9VR
	efokkdcEa5PoKcJ6WZJGTtQRJcNzh6smIl4UKmwDyqGbU3DURGOMCKSWwZEXTOLFDeOA=;
Message-ID: <65772df3-a462-65fe-864e-d613d32c76e0@xen.org>
Date: Fri, 12 Aug 2022 10:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v3 5/5] tools/xenstore: add migration stream extensions
 for new features
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220803115950.10904-1-jgross@suse.com>
 <20220803115950.10904-6-jgross@suse.com>
 <f38fdd2d-a463-2e84-8f6b-5acc29e4ff1e@xen.org>
 <6e62b262-f4ef-ecd7-291a-ca39f67c3065@suse.com>
 <68ca5d7c-d443-ea48-3984-ff76652392df@xen.org>
 <9e485550-ae67-151c-daf9-964fdb2a027e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9e485550-ae67-151c-daf9-964fdb2a027e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 08/08/2022 12:31, Juergen Gross wrote:
> On 08.08.22 13:00, Julien Grall wrote:
>>> This would break the use of xenstore-stubdom for such a setup.
>>
>> I am not sure why it would break the use of xenstore-stubdom. An 
>> application will already need to cope with the case Xenstored doesn't 
>> support a feature.
> 
> Someone relying to be able to switch off a feature on a socket connection
> might get into trouble trying to do the same when running with 
> xenstore-stubdom.

This is not very different from an application that was built against an 
old Xenstored and would not be capable to talk properly with the new 
Xenstored if the feature is enabled. I understand that...

> Switching a feature off will either not work, or switch the feature off 
> for all
> dom0 connections (which is a single one, of course).

... when using xenstore-stubdom xenstored it means that the feature will 
have to be disable for all dom0 connections.

However, it seems unlikely to me that someone will switch to a 
xenstore-stubdom on a whim because there are also scalability concerns 
(one ring to rule all connections). So I think it would be fair to say 
that your application may need to be tweak if you are not using the same 
feature as the system.

> 
>> At which point, it would be easy to say "I don't want this feature" 
>> when using a socket.
> 
> I don't see the value of that. If you don't want a feature, just don't 
> use it.

This is not that simple. Your assumption is the feature will not change 
the behavior exposed to the application.

I don't think we have such feature today but I don't see what prevents 
us to do that.

>>>> I can't make my mind yet if we can avoid bumping the version for 
>>>> this field. What would happen if we need to rollback?
>>>
>>> I think an active usage of the new features and a rollback are mutually
>>> exclusive. See above.
>>>>> +|                |                                              |
>>>>> +| `quota-names`  | 0 delimited strings of the quota names in    |
>>>>> +|                | the same sequence as the `quota-val` values. |
>>>>> +|                | Only for `conn-type` 0 (shared ring).        |
>>>>> +|                | Only valid for version 2 and later.          |
>>>>
>>>> As for the "global" quotas, I would move the quotas in a separate 
>>>> record. In this case, this would also be useful to avoid having may 
>>>> dynamic length field within the same record.
>>>
>>> I like having the data together more.
>>
>> Which is fine so long the code doesn't become too horrible to 
>> read/maintain. I think having dynamic length array in the middle of 
>> the record makes it trickier.
>>
>> This will only become worse as we introduce new fields in newer 
>> revision. So at which point would you say the record has grown too much?
>>
>> To me, this is already the point and we have plenty of record ID to 
>> handle that.
> 
> Fair enough.
> 
> Other questions arising from that:
> 
> - Should we have different record types for global and per-domain quota?

Given the question below, I guess you mean per-domain quotas that are 
not the default ones. If yes, then they should be split.

> 
> - Should we split global quota into two record types (per-domain settable
>    and global acting ones)?

I don't have a strong opinion on this.

> 
> - Combination of above (one record type for per-domain quota, usable for
>    global default with "invalid domid", and one record type for the global
>    acting ones like max. path-length)?

[...]

>>> I thought about that, but liked it better to be able to keep a common 
>>> struct
>>> layout for the record with the V2 fields being at the end.
>>>
>>> Main reason is the ability to avoid duplication of code for being 
>>> able to
>>> handle both versions.
>>
>> The cons is you can't easily describe the record in "struct ...". As I 
>> wrote above, I think have dynamic length array in the middle of a 
>> record is wrong.
> 
> You've got a point here.
> 
>> I have looked at the code, I don't think there will be enough code 
>> duplication to warrant adding fixed field at the end of the record.
> 
> Okay, lets go with a new record type then.
> 
> Should that always be used, or only if the depth information has been
> specified (IOW: is the old watch record format invalid in V2)?

I don't have a strong opinion.

Cheers,

-- 
Julien Grall

