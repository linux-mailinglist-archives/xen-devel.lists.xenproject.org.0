Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 931C7A32394
	for <lists+xen-devel@lfdr.de>; Wed, 12 Feb 2025 11:38:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886283.1295957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiA7n-0005Cu-LG; Wed, 12 Feb 2025 10:37:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886283.1295957; Wed, 12 Feb 2025 10:37:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiA7n-0005Ao-Ij; Wed, 12 Feb 2025 10:37:47 +0000
Received: by outflank-mailman (input) for mailman id 886283;
 Wed, 12 Feb 2025 10:37:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tiA7m-0005Ai-CS
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 10:37:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiA7k-00Evak-2k;
 Wed, 12 Feb 2025 10:37:44 +0000
Received: from 82-132-235-159.dab.02.net ([82.132.235.159] helo=[172.20.10.14])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tiA7k-007Mjt-10;
 Wed, 12 Feb 2025 10:37:44 +0000
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
	bh=JZTkEJhQZt9mt876T1kCinGqCwkrwK8W61d1c0+WoEk=; b=tbqadJHgre8jR0aEcne5hOHpXm
	pvuu9O2OpV5ujzSCf1lKY31Y0K3IASw4GbokA/h1Tb0rL9+aCSwiQtr7bpxH2V/okO8qV8RRaK05g
	qocKldO7NasMTEC9X1sdvPvaDCQki3TZr+QY9t78srFK0tgQZtiyX4S2A2I0so0JLkRI=;
Message-ID: <c0234ecb-d5f5-41be-bee3-648b423e0092@xen.org>
Date: Wed, 12 Feb 2025 10:37:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] device-tree: optimize dt_device_for_passthrough()
Content-Language: en-GB
To: Grygorii Strashko <grygorii_strashko@epam.com>,
 "Orzel, Michal" <michal.orzel@amd.com>,
 Grygorii Strashko <gragst.linux@gmail.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20250211111853.2199764-1-grygorii_strashko@epam.com>
 <d5f00c3a-81a8-4221-acc2-de90fb92deee@amd.com>
 <e1c5fcb3-4647-483f-b600-deae9f68da78@xen.org>
 <dece6a9e-21c6-4f2e-ba53-337c5855f88d@epam.com>
 <0b4a9980-f49a-4eca-adf3-a896c0c7e1c1@xen.org>
 <d95e353c-7fdb-4331-ba7e-16e23b79182e@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d95e353c-7fdb-4331-ba7e-16e23b79182e@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/02/2025 10:16, Grygorii Strashko wrote:
>>>> Also, I agree with Michal, if this is a concern for 
>>>> dt_device_device_for_passthrough(). Then it would be a concern for a 
>>>> few others calls using dt_find_property(). Are you going to modify 
>>>> all of them?
>>>
>>> I follow the rule one patch one functional change. Regarding further 
>>> optimization - I think only generic properties can be optimized and 
>>> personally I see now only "xen,passthrough" and may be "status".
>>>
>>> Ok. 20 microseconds. it's probably more like a measurement error margin.
>>> Please advice if i should continue or drop?
>>
>> See above. Regardless that, would you be able to provide a bit more 
>> information of your end goal?Are you intending to be able to boot Xen/ 
>> dom0/dom0less guest in less than N milliseconds?
> How far are you from that target? Are those numbers done on the latest Xen?
> 
> It's more like result of code studying from my side as Xen newbie.
> I've considered it as kinda "obvious" change - calc some value once is Thi i
> better then do the same calculations many times.

To clarify, there are a lot of call to the function. But you also have a 
DT with 700 nodes. So effectively, you will call it ~4 times per node.

But really, the issue is not the number of calls. The issue is that the 
property lookup function is expensive because there are many string 
comparisons.

 > Ok, it's not obvious. I'll drop it.

It is a trade-off between speed, memory usage and maintenability. With 
your approach, we would need to look up for all the properties we care 
in advance and cache the result. For bool property, the memory usage 
increase is not "bad". However, it would require more memory if the 
property value is a string, multiple cells...

What I would find more interesting is whether we can optimize the 
function doing the property lookup. This would benefits everyone rather 
than just a select few and depending on the result (speed, memory usage) 
I would definitely consider to include in Xen.

Cheers,

-- 
Julien Grall


