Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBC29A6E09
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2024 17:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.823668.1237701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uHF-0003aa-6x; Mon, 21 Oct 2024 15:25:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 823668.1237701; Mon, 21 Oct 2024 15:25:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t2uHF-0003Yn-3j; Mon, 21 Oct 2024 15:25:01 +0000
Received: by outflank-mailman (input) for mailman id 823668;
 Mon, 21 Oct 2024 15:24:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1t2uHD-0003Yh-HV
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2024 15:24:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uHD-00030B-4v; Mon, 21 Oct 2024 15:24:59 +0000
Received: from [2a02:8012:3a1:0:827:16ef:abff:1cc1]
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1t2uHC-0001VM-Us; Mon, 21 Oct 2024 15:24:59 +0000
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
	bh=dQc6hAtu75myaazsr1LbWijLKSj/7+Shsh5iwxymJto=; b=Ps/qqdXjS1cOPWXPNGU+MllcXs
	7oSllRXqP/k7WJdSduL9/1fIeRFJ+TnUdZoxWPBo6MO9kFd0/JyMNPUL+d/uh4De1UzQj5FDHDKuk
	m5vJU2uxtRSJ/TTGdhT3B8VpLIUiwYg/UiUM+7ESHeB4skB9fbqTyeDxi8fdtuLHIX5Q=;
Message-ID: <3ea2fdeb-faac-4766-800f-917ea8af1063@xen.org>
Date: Mon, 21 Oct 2024 16:24:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] xen/arm: Skip initializing the BSS section when it
 is empty
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
 <20241010140351.309922-2-ayan.kumar.halder@amd.com>
 <7ee1579b-f1e8-4dd4-8540-e6c0858c6999@xen.org>
 <f5b875e0-56e6-451d-a736-f2cc33cabae0@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f5b875e0-56e6-451d-a736-f2cc33cabae0@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 21/10/2024 12:12, Ayan Kumar Halder wrote:
> 
> On 18/10/2024 14:41, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 10/10/2024 15:03, Ayan Kumar Halder wrote:
>>> If the BSS section is empty, then the function can just return.
>>
>> This is more than "can", right? If we don't do it, we will end up to 
>> zero outside of BSS. This could be critical data...
> s/can just/should
>>
>> Also, I am tempted to suggest to add a Fixes tag because even if it is 
>> unlikely BSS will be zero in the current Xen, it is also not unlikely.
>>
>> The tag would be:
>>
>> Fixes: dac84b66cc9a ("xen: arm64: initial build + config changes, 
>> start of day code")
> Ack.
>>
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>
>> I saw the discussion. I don't have a strong opinion on the exact 
>> approach choosen for zeroing. With the commit message updated:
>>
>> Acked-by: Julien Grall <jgrall@amazon.com>
> 
> I propose that this patch to be committed. The changes to the commit 
> message can be done on commit.
> 
>>
>>> ---
>>> Changes from :-
>>>
>>> v1..v2 - New patch introduced in v3.
>>>
>>>   xen/arch/arm/arm64/head.S | 2 ++
>>
>> Don't we need a similar change on the arm32 code?
> 
> I haven't looked at the arm32 code. My idea is to get the earlyboot (ie 
> the asm part) of Xen working on R82 and then do the similar changes for 
> R52 (ie arm32).

AFAIU, this change is not related to the MPU. So I would rather prefer 
if we keep this change in sync. I am happy to send a patch for it if you 
don't have time.

Cheers,

-- 
Julien Grall


