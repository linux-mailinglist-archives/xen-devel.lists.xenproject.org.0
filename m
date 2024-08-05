Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3DC09484EE
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2024 23:36:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772410.1182860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb5NC-0008Eq-EM; Mon, 05 Aug 2024 21:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772410.1182860; Mon, 05 Aug 2024 21:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sb5NC-0008CE-BN; Mon, 05 Aug 2024 21:36:10 +0000
Received: by outflank-mailman (input) for mailman id 772410;
 Mon, 05 Aug 2024 21:36:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sb5NB-0008C8-QS
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2024 21:36:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sb5N9-0001y4-9h; Mon, 05 Aug 2024 21:36:07 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sb5N9-0003TD-4e; Mon, 05 Aug 2024 21:36:07 +0000
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
	bh=sdebRVXfOW2+STapEuSWYi8EDN5kp5eXUezvhU4uBZo=; b=LHdiRiJx4dO6kxinF8I/cmqR2V
	PPUMKaebhWFJqX8azjQIOT3zOZ157xQY6h0MWzCH1NtMI6cmNHV8uvHV+zwDGeBf+s4o7s0R8n2lG
	ldlWz/YCR71NzS0QvR3mD8iBGwbQHlfWvubvEfnN0WZfwhx3FvzNpMbYW6uNqiT/sw7g=;
Message-ID: <a5e64aa0-80a1-41bc-ab8f-11608d6c4586@xen.org>
Date: Mon, 5 Aug 2024 22:36:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen: arm: make VMAP only support in MMU system
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, sstabellini@kernel.org,
 bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com
Cc: xen-devel@lists.xenproject.org, Penny Zheng <penny.zheng@arm.com>,
 Wei Chen <wei.chen@arm.com>
References: <20240802121443.1531693-1-ayan.kumar.halder@amd.com>
 <20240802121443.1531693-3-ayan.kumar.halder@amd.com>
 <a17d0c07-3f98-4eab-9f84-77d64b562cbf@xen.org>
 <9587f469-b038-45f3-8931-87e06b273763@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9587f469-b038-45f3-8931-87e06b273763@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 05/08/2024 11:44, Ayan Kumar Halder wrote:
> 
> On 02/08/2024 14:27, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 02/08/2024 13:14, Ayan Kumar Halder wrote:
>>> From: Penny Zheng <penny.zheng@arm.com>
>>>
>>> VMAP is widely used in ALTERNATIVE feature, CPUERRATA feature, etc to
>>> remap a range of memory with new memory attributes. Since this is
>>> highly dependent on virtual address translation, we choose to fold VMAP
>>> in MMU system.
>>>
>>> In this patch, we introduce a new Kconfig CONFIG_HAS_VMAP, and make it
>>> only support in MMU system on ARM architecture. And we make features
>>> like ALTERNATIVE, CPUERRATA, etc, now depend on VMAP.
>>
>> While I agree that alternative should depend on VMAP (for now), I feel 
>> this is incorrect for CPUERRATA. Very likely, you will need to deal 
>> with them on the MPU.
>>
>> Before making any suggestion, would you be able to clarify how you 
>> envision to deal with errata? Will they be selected at built time or 
>> boot time?
> 
> TBH, I hadn't thought that through. I am thinking about selecting them 
> at built time (like it is been done for Arm64 cpus).

To clarify, on arm64, the decision to enable the bulk of mitigation is 
done at runtime. The Kconfig is just to remove it from the binary if you 
you are not targeting such HW. With that in mind...

> 
> However given that there are lesser number of MPU cpus (only R52 and 
> R82) compared to  MMU ones, could there be a simpler approach.

... do you mean always an errata enabled in the Kconfig would be always 
mitigate (IOW no runtime selection)?

> 
> I am open to any suggestions you have.
> 
> Also, can we disable the CPUERRATA on MPU until we add support for the 
> first errata ?

So I have looked at the code and it is rather unclear why you actually 
need to disable CPU Errata. Can you clarify what would happen if 
cpuerrata is always built *and* CONFIG_ARM64_HARDEN_BRANCH_PREDICATOR is 
gated by HAS_VMAP? I am assuming we will not need the branch predictor 
hardening on Cortex-R (at least this is the implication from [1]).

Now regarding alternative, at least for arm64 this is used outside of 
the errata. Not critical right now, but at some point you will want to 
re-enable alternatives.

Cheers,

[1] 
https://developer.arm.com/Arm%20Security%20Center/Speculative%20Processor%20Vulnerability


-- 
Julien Grall

