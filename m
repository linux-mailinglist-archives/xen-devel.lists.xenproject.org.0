Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A803374784F
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 20:31:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558624.872897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkng-0000gt-M0; Tue, 04 Jul 2023 18:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558624.872897; Tue, 04 Jul 2023 18:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGkng-0000eG-IT; Tue, 04 Jul 2023 18:30:56 +0000
Received: by outflank-mailman (input) for mailman id 558624;
 Tue, 04 Jul 2023 18:30:55 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGknf-0000e8-Gm
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 18:30:55 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGknf-0007gf-6P; Tue, 04 Jul 2023 18:30:55 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGkne-0007ub-W2; Tue, 04 Jul 2023 18:30:55 +0000
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
	bh=wwS1ZcdKEK7hbyQHGkE8+cpQdWEFB3jUg4THvcJuwEw=; b=3eOgtg/tsGU85UwE8NOcw6o17o
	y28DVYlc3FuiKk9G+HvOEJ0ycC3hzU8svk8zO5nEfUez/X2Ed9tFuN7XZrc3Yz8+1hltV+7QHMCmQ
	K9dM2ckkbBAeWuYI3aCuS3P6vczX/gYmGTw8JPFlzBI2N8+81PGZQ19EwBh74mCWY5Ds=;
Message-ID: <c954ac7f-8eaa-672a-1248-ad2612e27f0f@xen.org>
Date: Tue, 4 Jul 2023 19:30:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [v2 4/4] xen/arm: Allow the user to build Xen with UBSAN
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Luca.Fancellu@arm.com, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>
References: <20230629201129.12934-1-julien@xen.org>
 <20230629201129.12934-5-julien@xen.org>
 <1bbde5ea-9cb2-4aac-fe36-66b7cfddd00a@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1bbde5ea-9cb2-4aac-fe36-66b7cfddd00a@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 30/06/2023 07:58, Michal Orzel wrote:
> 
> 
> On 29/06/2023 22:11, Julien Grall wrote:
>>
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> UBSAN has been enabled a few years ago on x86 but was never
>> enabled on Arm because the final binary is bigger than 2MB (
>> the maximum we can currently handled).
>>
>> With the recent rework, it is now possible to grow Xen over 2MB.
>> So there is no more roadblock to enable Xen other than increasing
>> the reserved area.
>>
>> On my setup, for arm32, the final binaray was very close to 4MB.
>> Furthermore, one may want to enable UBSAN and GCOV which would put
>> the binary well-over 4MB (both features require for some space).
>> Therefore, increase the size to 8MB which should us some margin.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>> The drawback with this approach is that we are adding 6 new
>> page-table (3 for boot and 3 for runtime) that are statically
>> allocated. So the final Xen binary will be 24KB bigger when
>> neither UBSAN nor GCOV.
>>
>> If this is not considered acceptable, then we could make the
>> size of configurable in the Kconfig and decide it based on the
>> features enabled.
>>
>>      Changes in v2:
>>          - Fix typoes
>>          - Add Michal's reviewed-by tag
> I cannot see one, so:

Hmmmm, you gave it on v1 but I can't remember why I didn't carry it. 
Anyway...

> Reviewed-by: Michal Orzel <michal.orzel@amd.com>

Thanks!

Cheers,

-- 
Julien Grall

