Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD70E9DA63E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 11:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844681.1260169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFk7-00044Q-Ad; Wed, 27 Nov 2024 10:57:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844681.1260169; Wed, 27 Nov 2024 10:57:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tGFk7-00041f-7r; Wed, 27 Nov 2024 10:57:59 +0000
Received: by outflank-mailman (input) for mailman id 844681;
 Wed, 27 Nov 2024 10:57:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tGFk5-00041Z-Fs
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2024 10:57:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGFk1-008Fsu-1V;
 Wed, 27 Nov 2024 10:57:53 +0000
Received: from [15.248.3.95] (helo=[10.24.67.15])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tGFk1-007ngB-1l;
 Wed, 27 Nov 2024 10:57:53 +0000
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
	bh=wIVPfv0asLpOkP01L3tYMhc5b/ktGk6Qh7Moq9Beth0=; b=m3RNdL5QpiFhPncXSMr3XunJC6
	7NjkNocaI39NNxvwcrT8M8QrqhXHqFSA4jNzC/HuHTrK9AzFDwTYcsdpuMTYEOVHGPMxAQipvnKjy
	vtYRBU3633iIxpjpt4bRQBuDrxcvOV7dQKVZrE/Q8C1TMSzg4iSbUXUd6OGaejo2/BX4=;
Message-ID: <6233cbef-c5c3-43ac-bc57-e42e79f86f7b@xen.org>
Date: Wed, 27 Nov 2024 10:57:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/11] Arm32: use new-style entry annotations for
 library code
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <98590a41-cee7-4ba3-a723-4e3ee3b55357@suse.com>
 <658f0a05-742e-44ed-bf3f-bd6bb8c694a7@suse.com>
 <7026ab4b-11b9-4ca1-9d33-581fc46b11e9@xen.org>
 <2af39ca6-af4a-4686-bc4c-90dfbe9b6c8e@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2af39ca6-af4a-4686-bc4c-90dfbe9b6c8e@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 26/11/2024 08:41, Jan Beulich wrote:
> On 25.11.2024 21:15, Julien Grall wrote:
>> Hi Jan,
>>
>> Sorry for the late answer.
>>
>> On 01/10/2024 16:16, Jan Beulich wrote:
>>> No functional change, albeit all globals now become hidden, and aliasing
>>> symbols (__aeabi_{u,}idiv) as well as __memzero lose their function-ness
>>> and size.
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> If the function-ness is important, some new construct would need
>>> inventing. Not setting size for the aliases may even be desirable, as
>>> I'm uncertain whether it is really legal in ELF that two entities
>>> overlap in space.
>>
>> I can't think of a reason where we would need the "function-ness".
> 
> Good, thanks for confirming.
> 
>>> I fear I'm breaking __memzero(), as I don't understand the purpose of
>>> the ".word 0" next to where the FUNC_LOCAL() appears.
>>
>> I am not entirely sure either. AFAIK, "0" is not a valid instruction.
>>
>> This code was taken from Linux, the history doesn't give much clue
>> because it seems the ".word 0" was added before Linux used git.
> 
> My vague guess is that this is a crude way of arranging for desired
> alignment of labels later in the function. That wouldn't require use
> of .word (could simply be a nop), yet what specifically is used there
> doesn't matter for the patch here.
> 
>> However, it looks like Linux replace __memzero with memset() 6 years ago
>> on arm32. So maybe we should get rid of it? This would at least avoid
>> worrying on the purpose of ".word 0".
> 
> Certainly an option, yet may I remind you of your replies [1], [2] to
> a much older patch of mine, which I still have pending for the
> suggested removal never having happened? I fear the patch here may get
> stuck over this just like the other one did.

Here we go 
https://lore.kernel.org/xen-devel/20241127105512.88703-1-julien@xen.org/

Cheers,

-- 
Julien Grall


